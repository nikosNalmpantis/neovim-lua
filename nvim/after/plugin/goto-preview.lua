local status_ok, gotopreview = pcall(require, "goto-preview")
if not status_ok then
	return
end

gotopreview.setup({
  default_mappings = true,
})

