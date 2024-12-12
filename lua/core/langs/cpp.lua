---@type LanguageDefinition
local M = {
	lang_name = "cpp",

	formatters = {
		"clang-format",
	},

	linters = {},

	lsp_servers = {
		{
			lsp_name = "clangd",
			--root_dir = require("lspconfig.util").root_pattern("compile_commands.json", ".git", "CMakeLists.txt"),
			lsp_settings = {
				cmd = {
					"clangd",
					"--offset-encoding=utf-16",
					"--completion-style=detailed",
					"--suggest-missing-includes",
				},
				capabilities = require("cmp_nvim_lsp").default_capabilities(),
			},
		},
	},
	dap = {
		adapters = {
			gdb = {
				type = "executable",
				command = "gdb",
				args = { "--quiet", "--interpreter=dap" },
			},
		},
		configurations = {
			cpp = {
				{
					name = "Launch Program",
					type = "gdb",
					request = "launch",
					program = function()
						return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
					end,
					cwd = "${workspaceFolder}",
					stopOnEntry = true,
					setupCommands = {
						{
							text = "-enable-pretty-printing",
							description = "Enable GDB pretty printing",
							ignoreFailures = true,
						},
					},
				},
			},
		},
	},
}

return M
