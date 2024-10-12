local notify_setup, notify = pcall(require, "notify")
if not notify_setup then
	return
end

notify.setup({
	timeout = 3000,
	max_width = 50,
})
