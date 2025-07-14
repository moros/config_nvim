return {
	{ -- Collection of various small independent plugins/modules
		"echasnovski/mini.nvim",
		config = function()
			-- Better Around/Inside textobjects
			--
			-- Examples:
			--  - va)   - [V]isually select [A]round [)]paren
			--  - yinq  - [Y]ank [I]inside [N]ext [Q]uote
			--  - ci'   - [C]hange [I]nside [']quote
			require("mini.ai").setup({ n_lines = 500 })

			-- Add/delete/replace surroundings (brackets, quotes, etc.)
			--
			-- - saiw)  - [S]urround [A]dd [I]nner [W]ord [)]Paren
			-- - sd'    - [S]urround [D]elete [']quotes
			-- - sr)'   - [S]urround [R]eplace [)] [']
			--require("mini.surround").setup({
			--	mappings = {
			--		add = "+a", -- Add surrounding in Normal and Visual modes
			--		delete = "+d", -- Delete surrounding
			--		find = "+f", -- Find surrounding (to the right)
			--		find_left = "+F", -- Find surrounding (to the left)
			--		highlight = "+h", -- Highlight surrounding
			--		replace = "+r", -- Replace surrounding
			--		update_n_lines = "+n", -- Update `n_lines`

			--		suffix_last = "-L", -- Suffix to search with "prev" method
			--		suffix_next = "-N", -- Suffix to search with "next" method
			--	},
			--})

			-- Simple and easy statusline
			-- You could remove this setup call if you don't like it,
			-- and try some other statusline plugin
			local statusline = require("mini.statusline")

			-- set use_icons to true if you have a Nerd font
			statusline.setup({ use_icons = vim.g.have_nerd_font })

			-- You can configure sections in the statusline by overriding their
			-- default behavior. For example, here we set the section for
			-- cursor location to LINE:COLUMN
			---@diagnostic disable-next-line: duplicate-set-field
			statusline.section_location = function()
				return "%21:%-2v"
			end

			-- ... and there is more!
			-- Check out: https://github.com/echasnovski/mini.nvim
		end,
	},
}
-- vim: ts=2 sts=2 sw=2 et
