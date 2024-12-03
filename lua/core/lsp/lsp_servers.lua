local lsp = require("lsp-zero")

-- Import Mason and Mason-LSPConfig
local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")

-- Initialize Mason
mason.setup()

-- Collect all LSP servers from your config
local lang_configs = require("core.langs.init")
local servers = {}

for _, config in pairs(lang_configs) do
	for _, lsp_definition in pairs(config.lsp_servers) do
		table.insert(servers, lsp_definition.lsp_name)
	end
end

-- Use Mason to ensure that servers are installed
mason_lspconfig.setup({
	ensure_installed = servers,
})

-- Set up each LSP server with lsp-zero configurations
lsp.on_attach(function(client, bufnr)
	local opts = { noremap = true, silent = true, buffer = bufnr }
	vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
	vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
	vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
	vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
	vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
	vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)
	vim.keymap.set("n", "<leader>cf", vim.lsp.buf.code_action, opts)
end)

-- Configure individual LSP servers
for _, config in pairs(lang_configs) do
	for _, lsp_definition in pairs(config.lsp_servers) do
		lsp.configure(lsp_definition.lsp_name, lsp_definition.lsp_settings)
	end
end

-- Finalize LSP setup
lsp.setup()
