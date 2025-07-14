return {
	{ -- Add identation guides even on blank lines
		"lukas-reineke/indent-blankline.nvim",

		-- Enable `lukas-reineke/indent-blankline.nvim`
		-- See `:help ibl`
		main = "ibl",
		config = function()
			local highlight = {
				"CursorColumn",
				"Whitespace",
			}
			require("ibl").setup({
				indent = { char = "", highlight = highlight },
				scope = {
					enabled = true,
					show_start = true,
					show_end = true,
					highlight = { "CursorColumn", "Whitespace", "Visual" },
				},
			})
		end,
	},
}
