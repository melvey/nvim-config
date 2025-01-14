-- lua/core/configs/clangd_extensions.lua
local lspconfig = require("lspconfig")
local clangd_ext = require("clangd_extensions")

-- Configure clangd with utf-16 offset encoding
lspconfig.clangd.setup({
	cmd = { "clangd", "--offset-encoding=utf-16" }, -- Explicitly set utf-16 encoding
	on_attach = function(client, bufnr)
		client.server_capabilities.documentFormattingProvider = false
		vim.notify("LSP attached to buffer " .. bufnr, vim.log.levels.INFO)

		-- Set up keybinding to switch between source and header files
		vim.api.nvim_buf_set_keymap(
			bufnr,
			"n",
			"<leader>sh",
			"<cmd>ClangdSwitchSourceHeader<CR>",
			{ noremap = true, silent = true }
		)

		-- Setup keybinding for inline hints
		vim.api.nvim_buf_set_keymap(
			bufnr,
			"n",
			"<leader>ih",
			"<cmd>ClangdToggleInlayHints<CR>",
			{ noremap = true, silent = true }
		)

		-- setup binding for the absract syntax tree
		vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>ca", "<cmd>ClangdAST<CR>", { noremap = true, silent = true })
	end,
	capabilities = require("cmp_nvim_lsp").default_capabilities(),
})

-- Setup clangd_extensions on top of the existing clangd server
clangd_ext.setup({
	extensions = {
		autoSetHints = true,
		hover_with_actions = true,
		ast = {
			-- Icons and other extension settings
		},
	},
})
