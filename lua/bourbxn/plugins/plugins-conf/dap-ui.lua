local dapui_setup, dapui = pcall(require, "dapui")
if not dapui_setup then
	return
end

local dap_setup, dap = pcall(require, "dap")
if not dap_setup then
	return
end

dapui.setup()

dap.listeners.before.attach.dapui_config = function()
	dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
	dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
	dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
	dapui.close()
end
