# My Neovim config
Based on a configuration built from https://github.com/schlerp/nvim-conf


## Cheatsheet
Warning: a lot of this was generated with ChatGPT by feeding it the lua config - I've already picked out a few hallucinations but there may still be some remaining.

### Basic Commands
- **i**: Insert mode.
- **Esc**: Exit insert mode.
- **:w**: Save the file.
- **:q**: Quit Vim.
- **:wq**: Save and quit.
- **:q!**: Quit without saving.
- **u**: Undo the last change.
- **Ctrl-r**: Redo the undone change.

### Navigation
- **h, j, k, l**: Move left, down, up, right.
- **gg**: Go to the beginning of the file.
- **G**: Go to the end of the file.
- **w**: Jump to the next word.
- **b**: Jump to the previous word.
- **0**: Go to the beginning of the line.
- **$**: Go to the end of the line.

### Editing
- **dd**: Delete the current line.
- **yy**: Yank (copy) the current line.
- **p**: Paste after the cursor.
- **P**: Paste before the cursor.
- **cw**: Change (replace) the word from the cursor onward.
- **x**: Delete the character under the cursor.

### Visual Mode
- **v**: Enter visual mode.
- **V**: Enter visual line mode.
- **Ctrl-v**: Enter visual block mode.
- **y**: Yank (copy) the selected text.
- **d**: Delete the selected text.

### Search and Replace
- **/pattern**: Search for "pattern".
- **n**: Move to the next match.
- **N**: Move to the previous match.
- **:%s/old/new/g**: Replace all occurrences of "old" with "new".

### Buffers and Windows
- **:e filename**: Open a file in a new buffer.
- **:bnext** or **:bn**: Go to the next buffer.
- **:bprev** or **:bp**: Go to the previous buffer.
- **:split filename**: Split the window and open a file.
- **Ctrl-w h/j/k/l**: Move between windows.

### Miscellaneous
- **.**: Repeat the last command.
- **:%y+**: Copy the entire file to the system clipboard.
- **:set number**: Show line numbers.
- **:set nonumber**: Hide line numbers.

## Neovim Custom Setup

### Plugins and Commands

#### Telescope
- **<leader>ff**: Find files using Telescope.
- **<leader>fg**: Live grep using Telescope.
- **<leader>fb**: List open buffers using Telescope.
- **<leader>fr**: Find references using LSP with Telescope.

#### Treesitter
- **:TSUpdate**: Update Treesitter parsers.
- **:TSInstall <language>**: Install Treesitter support for a specific language.

#### Gitsigns
- **:Gitsigns toggle_signs**: Toggle Git signs in the gutter.
- **:Gitsigns blame_line**: Show git blame for the current line.
- **<leader>gb**: Show git blame on the current line.

#### Lualine
- **:LualineUpdate**: Update the Lualine status line settings.

#### Alpha (Dashboard)
- **:Alpha**: Open the Neovim dashboard.
- **e**: Create a new file from the dashboard.
- **f**: Find a file using Telescope from the dashboard.
- **g**: Find a string using Telescope from the dashboard.
- **r**: Show recent files.

#### Clangd Extensions
- **<leader>sh**: Switch between source and header files.
- **<leader>ih**: Toggle inlay hints.
- **<leader>ca**: Show the abstract syntax tree.

#### Copilot
- **<M-l>**: Accept Copilot suggestion.
- **<M-[>, <M-]>**: Navigate Copilot suggestions.
- **<C-]>**: Dismiss Copilot suggestion.

#### Noice
- **<leader>h**: Show message history.
- **:Noice last**: Show the last message in a popup.
- **:Noice errors**: Show error messages in a popup.

### Keymaps
- **<leader>e**: Open the file explorer (Netrw).
- **<leader>q**: Close the current buffer.
- **<leader>tt**: Toggle terminal using the keymaps defined in `core.keymap`.
- **<leader>sh**: Switch between source and header files with Clangd.
- **<leader>ih**: Toggle inlay hints with Clangd.
- **<leader>ca**: Show the abstract syntax tree with Clangd.
- **[d**: Jump to the previous diagnostic (warning/error).
- **]d**: Jump to the next diagnostic (warning/error).
- **[e**: Jump to the previous error.
- **]e**: Jump to the next error.
- **[w**: Jump to the previous warning.
- **]w**: Jump to the next warning.
- **<leader>ld**: Populate location list with diagnostics.
- **<leader>lo**: Open the location list.
- **<C-h>, <C-j>, <C-k>, <C-l>**: Navigate between tmux panes and Neovim terminal splits seamlessly with vim-tmux-navigator.
- **<leader>cf**: Trigger LSP code action (alternative to `<leader>ca`).
- **<leader>fr**: Find references using LSP with Telescope.

### Debugging
- **<F5>**: Start/continue debugging session.
- **<F10>**: Step over the current line.
- **<F11>**: Step into the function call.
- **<F12>**: Step out of the current function.
- **<Leader>db**: Toggle breakpoint at the current line.
- **<Leader>dB**: Set a conditional breakpoint (prompts for a condition).
- **<Leader>dl**: Run the last debugging session.
- **<Leader>dw**: Toggle dap ui.
- **:DapVirtualTextToggle**: Toggle inline variable values during debugging.

### LSP
- **gd**: Go to definition (LSP).
- **K**: Show hover documentation.
- **<leader>rn**: Rename symbol.
- **<leader>ca**: Code action.
- **<leader>cf**: Trigger LSP code action.
- **<leader>fr**: Find references.

### Terminal Keymaps
- **<C-h>, <C-j>, <C-k>, <C-l>**: Navigate between tmux panes and Neovim terminal splits seamlessly with vim-tmux-navigator.
