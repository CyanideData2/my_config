local colors = {
	primary = "rgb(76946a)",
	surface = "rgb(1f1f28)",
	secondary = "rgb(c0a36e)",
	error = "rgb(c34043)",
	tertiary = "rgb(7e9cd8)",
	surface_lowest = "rgb(21212b)",
}

hl.config({
	general = {
		col = {
			active_border = colors.primary,
			inactive_border = colors.surface,
		},
	},
})

return colors
