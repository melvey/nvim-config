local dap = require("dap")

local lang_configs = require("core.langs.init")
for lang_name, lang_config in pairs(lang_configs) do
	if lang_config.dap then
		for adapter, config in pairs(lang_config.dap.adapters) do
			dap.adapters[adapter] = config
		end
		for name, config in pairs(lang_config.dap.configurations) do
			dap.configurations[name] = config
		end
	end
end

vim.fn.sign_define("DapBreakpoint", { text = "🔴", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapStopped", { text = "🟢", texthl = "", linehl = "", numhl = "" })
vim.fn.sign_define("DapBreakpointRejected", { text = "⚪", texthl = "", linehl = "", numhl = "" })

-- Optional key mappings for debugging
vim.keymap.set("n", "<F5>", function()
	dap.continue()
end, { desc = "Start/continue debugging" })
vim.keymap.set("n", "<F10>", function()
	dap.step_over()
end, { desc = "Step over" })
vim.keymap.set("n", "<F11>", function()
	dap.step_into()
end, { desc = "Step into" })
vim.keymap.set("n", "<F12>", function()
	dap.step_out()
end, { desc = "Step out" })
vim.keymap.set("n", "<Leader>db", function()
	dap.toggle_breakpoint()
end, { desc = "Toggle breakpoint" })
vim.keymap.set("n", "<Leader>dB", function()
	dap.set_breakpoint(vim.fn.input("Breakpoint condition: "))
end, { desc = "Set conditional breakpoint" })
vim.keymap.set("n", "<Leader>dl", function()
	dap.run_last()
end, { desc = "Run last debugging session" })
vim.keymap.set("n", "<Leader>dw", function()
  require("dapui").toggle()
end, { desc = "Toggle DAP UI" })
