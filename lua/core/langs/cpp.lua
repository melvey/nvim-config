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
}

return M
