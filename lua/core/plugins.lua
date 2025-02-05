local config = require("core.config")

local plugins = {
	-- many plugins require this
	{
		"nvim-lua/plenary.nvim",
		event = "VeryLazy",
	},

	-- colour scheme
	{
		"catppuccin/nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("core.configs.colorscheme")
		end,
	},

	-- noice (better gui)
	{
		"folke/noice.nvim",
		event = "VeryLazy",
		config = function()
			require("core.configs.noice")
		end,
		dependencies = {
			-- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
			"MunifTanjim/nui.nvim",
		},
	},

	-- tree sitting
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			require("core.configs.treesitter")
		end,
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
			"RRethy/nvim-treesitter-textsubjects",
		},
		event = "VeryLazy",
	},

	-- mini collection of plugins
	{
		"echasnovski/mini.nvim",
		version = "*",
		config = function()
			require("core.configs.mini")
		end,
		event = "VeryLazy",
	},

	-- telescope
	{
		"nvim-telescope/telescope.nvim",
		event = "VeryLazy",
		dependencies = {
			"gbrlsnchs/telescope-lsp-handlers.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
			},
		},
		config = function()
			require("core.configs.telescope")
		end,
	},

	-- gitsigns - git tools
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
		event = "VeryLazy",
	},

	-- status line
	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			require("core.configs.lualine")
		end,
		event = "VeryLazy",
	},

	-- documentation
	{
		"kkoomen/vim-doge",
	},

	-- LSP
	{
		"VonHeikemen/lsp-zero.nvim",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			-- setup lsp
			require("core.lsp.init")
			require("core.diagnostics")
		end,
		dependencies = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{ "williamboman/mason.nvim" }, -- Optional
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional
			{ "WhoIsSethDaniel/mason-tool-installer.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "L3MON4D3/LuaSnip" }, -- Required
			{ "saadparwaiz1/cmp_luasnip" },
			{ "rafamadriz/friendly-snippets" },
			{ "onsails/lspkind.nvim" }, -- Optional
		},
	},

	-- for developing neovim plugins
	{
		"folke/neodev.nvim",
		event = "LspAttach",
		config = function()
			require("core.configs.neodev")
		end,
	},

	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("trouble").setup({})
		end,
		event = "VeryLazy",
	},

	-- linter
	{
		"mfussenegger/nvim-lint",
		config = function()
			require("core.configs.lint")
		end,
		event = "LspAttach",
	},

	-- formatter
	{
		"mhartington/formatter.nvim",
		config = function()
			require("core.configs.formatter")
		end,
		event = "LspAttach",
	},

	-- clangd extensions for better c/c++
	{
		"p00f/clangd_extensions.nvim",
		config = function()
			require("core.configs.clangd_extensions")
		end,
		ft = { "c", "cpp", "objc", "objcpp" }, -- Only load for relevant file types
	},

	-- cursor line (underline instances of word under cursor)
	{
		"RRethy/vim-illuminate",
		event = "LspAttach",
		config = function()
			require("core.configs.illuminate")
		end,
	},

	{
		"christoomey/vim-tmux-navigator",
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
		},
		keys = {
			{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
			{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
			{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
			{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
			{ "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
		},
	},

	-- Core DAP plugin
	{
		"mfussenegger/nvim-dap",
		config = function()
			require("core.configs.dap")
		end,
	},
    { "nvim-neotest/nvim-nio" },
	{
		"rcarriga/nvim-dap-ui",
		requires = {
			"mfussenegger/nvim-dap",
			"nvim-neotest/nvim-nio",
		},
		config = function()
			require("dapui").setup()
		end,
	},
    {
        "theHamsta/nvim-dap-virtual-text",
        dependencies = { "mfussenegger/nvim-dap" },
        config = function()
            require("nvim-dap-virtual-text").setup({
                enabled = true,           -- enable this plugin
                enabled_commands = true,  -- create commands
                highlight_changed_variables = true, -- highlight only changed variables
                highlight_new_as_changed = true,    -- highlight new variables
                show_stop_reason = true,  -- show reason for stopping
                commented = false,        -- prefix virtual text with comment string
            })
        end,
    }
}

if config.feature_config.use_scrollbars then
	-- scrollbars
	plugins[#plugins + 1] = {
		"petertriho/nvim-scrollbar",
		config = function()
			require("core.configs.scrollbar")
		end,
		event = "LspAttach",
	}
end

if config.feature_config.use_start_page then
	-- start page
	plugins[#plugins + 1] = {
		"goolord/alpha-nvim",
		config = function()
			require("core.configs.alpha")
		end,
	}
end

if config.feature_config.use_copilot then
	-- gotta have that AI apparently...
	plugins[#plugins + 1] = {
		"zbirenbaum/copilot.lua",
		event = "LspAttach",
		config = function()
			require("core.configs.copilot")
		end,
	}
end

local function setup_lazy()
	local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

	if not vim.loop.fs_stat(lazypath) then
		vim.fn.system({
			"git",
			"clone",
			"--filter=blob:none",
			"https://github.com/folke/lazy.nvim.git",
			"--branch=stable", -- latest stable release
			lazypath,
		})
	end

	vim.opt.rtp:prepend(lazypath)
end

-- init Lazy.nvim
setup_lazy()

-- setup config using plugins array
require("lazy").setup(plugins)
