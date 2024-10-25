local keymap = vim.keymap
local cmd = vim.cmd
local api = vim.api

local config = require("core.config") --- type: ignore

-- setup the keymaps
for _, key_def in ipairs(config.keymap_config.keymaps) do
	keymap.set(key_def.mode, key_def.keys, key_def.command, key_def.opts)
end

-- terminal (toggle term) keymaps
function _G.set_terminal_keymaps()
	for _, key_def in ipairs(config.keymap_config.terminal_keymaps) do
		keymap.set(key_def.mode, key_def.keys, key_def.command, key_def.opts)
	end
end

-- Navigate to the next error
vim.api.nvim_set_keymap(
	"n",
	"[e",
	"<cmd>lua vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })<CR>",
	{ noremap = true, silent = true }
)
-- Navigate to the previous error
vim.api.nvim_set_keymap(
	"n",
	"]e",
	"<cmd>lua vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })<CR>",
	{ noremap = true, silent = true }
)

-- Navigate to the next warning
vim.api.nvim_set_keymap(
	"n",
	"[w",
	"<cmd>lua vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.WARN })<CR>",
	{ noremap = true, silent = true }
)
-- Navigate to the previous warning
vim.api.nvim_set_keymap(
	"n",
	"]w",
	"<cmd>lua vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.WARN })<CR>",
	{ noremap = true, silent = true }
)

-- Show all diaganostics in a new pane
vim.api.nvim_set_keymap(
	"n",
	"<leader>ld",
	"<cmd>lua vim.diagnostic.setloclist()<CR>",
	{ noremap = true, silent = true }
)
-- lopen
vim.api.nvim_set_keymap("n", "<leader>lo", "<cmd>lopen<CR>", { noremap = true, silent = true })

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
