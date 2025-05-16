--- @param color? string The name of the colorscheme
--- @param isDark? boolean If the background should be dark or light. Default is true
--- @param isTransparent? boolean If the background should be transparent. Default is false
function SetColorScheme(color, isDark, isTransparent)
	color = color or "set3"
	local background = (isDark == nil or isDark == true) and "dark" or "light"
	isTransparent = isTransparent and true or false

	vim.opt.background = background
	vim.cmd.colorscheme(color)

	if isTransparent then
		vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
		vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
	end
end

-- SetColorScheme('kanagawa', true)
-- SetColorScheme('catppuccin-latte', false)
-- SetColorScheme('solarized', false)
-- SetColorScheme('nightfox')
-- SetColorScheme('dayfox')
-- SetColorScheme('terafox')
-- SetColorScheme('flexoki-dark')
-- SetColorScheme('kanagawa')
-- SetColorScheme('set3')
-- SetColorScheme('seoul256')

-- require("bamboo").load()
-- SetColorScheme('bamboo', false)
-- SetColorScheme("tokyonight")
-- SetColorScheme('rose-pine-dawn')
-- SetColorScheme("habamax")
-- SetColorScheme('habamax.nvim')

-- SetColorScheme('gruvbox')
-- SetColorScheme('kanagawa')
-- SetColorScheme('solarized-osaka')
