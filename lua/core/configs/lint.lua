local lang_configs = require("core.langs.init")

local file_types = {}
for lang_name, config in pairs(lang_configs) do
	file_types[lang_name] = config.linters
end

--[[
require("lint").linters.clang_format = {
	cmd = "clang-format",
	stdin = true,
	args = { "--dry-run", "--Werror", "--style=file" },
	stream = "stdout",
	ignore_exitcode = true,
	parser = function(output, _)
		local diagnostics = {}
		print("Clang-format output:", output)
		for _, line in ipairs(vim.split(output, "\n")) do
			local filename, row, col, message = string.match(line, "^(.*):(%d+):(%d+): (.+)$")
			if filename and row and col and message then
				table.insert(diagnostics, {
					source = "clang-format",
					range = {
						["start"] = { line = tonumber(row) - 1, character = tonumber(col) - 1 },
						["end"] = { line = tonumber(row) - 1, character = tonumber(col) },
					},
					message = message,
					severity = vim.diagnostic.severity.WARN,
				})
			end
		end
		return diagnostics
	end,
}
]]

require("lint").linters_by_ft = file_types

vim.api.nvim_create_autocmd({ "BufWritePost", "InsertLeave" }, {
	callback = function()
		require("lint").try_lint()
	end,
})
