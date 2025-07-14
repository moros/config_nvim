return {
	{
		"lunacookies/vim-colors-xcode",
		--priority = 1000,
		config = function()
			-- Set background before applying colorscheme
			vim.opt.background = "dark" -- or "light"

			vim.schedule(function()
				-- Apply the colorscheme
				vim.cmd.colorscheme("xcodedarkhc")
			end)

			-- Force redraw to ensure colors are applied
			--vim.cmd.highlight("clear")
			--vim.cmd.syntax("on")

			-- Optional: Enable transparency
			-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
			-- vim.api.nvim_set_hl(0, "NormalNC", { bg = "none" })
		end,
		priority = 1000,
	},
}
