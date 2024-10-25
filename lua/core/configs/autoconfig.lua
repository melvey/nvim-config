-- init.lua

-- Utility function to find the project root
local function find_project_root()
	local cwd = vim.fn.getcwd()
	-- Define markers that signify the project root
	local markers = { ".git", "lua", "init.lua", "nvim.lua" }

	for _, marker in ipairs(markers) do
		local root = vim.fn.finddir(marker, cwd .. ";")
		if root ~= "" and root ~= "." then
			return vim.fn.fnamemodify(root, ":h")
		end
	end

	return cwd
end

-- Function to safely load a Lua file
local function safe_load(filepath)
	local exists = vim.loop.fs_stat(filepath)
	if exists then
		local status, err = pcall(dofile, filepath)
		if not status then
			vim.notify("Error loading project config: " .. err, vim.log.levels.ERROR)
		else
			vim.notify("Loaded project config: " .. filepath, vim.log.levels.INFO)
		end
	end
end

-- Main logic to detect and load project-specific config
local project_root = find_project_root()
local project_config = project_root .. "/.nvim.lua"

-- Optional: Prompt the user before loading the config for security
local load_project_config = true -- Set to false to disable prompts

if load_project_config and vim.fn.filereadable(project_config) == 1 then
	-- Prompt the user for confirmation
	vim.ui.input({ prompt = "Load project-specific Neovim config? (y/n): " }, function(input)
		if input and (input:lower() == "y" or input:lower() == "yes") then
			safe_load(project_config)
		else
			vim.notify("Skipped loading project config.", vim.log.levels.INFO)
		end
	end)
end
