return {
	{ -- Useful plugin to show you pending keybinds.
		"folke/which-key.nvim",
		event = "VimEnter", -- Sets the loading event to 'VimEnter'.
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
		opts = {
			-- Delay between pressing a key and opening which-key (milliseconds)
			-- this setting is independent of `vim.o.timeoutlen`.
			delay = 0,
			icons = {
				-- Set icon mappings to true if you have a Nerd font.
				mappings = vim.g.have_nerd_font,

				-- If you are using a Nerd font: set icons.keys to an empty table which will use the
				-- default which-key.nvim defined Nerd Font icons, otherwise define a string table.
				keys = vim.g.have_nerd_font and {} or {
					Up = "<Up> ",
					Down = "<Down> ",
					Left = "<Left> ",
					Right = "<Right> ",
					C = "<C-…> ",
					M = "<M-…> ",
					D = "<D-…> ",
					S = "<S-…> ",
					CR = "<CR> ",
					Esc = "<Esc> ",
					ScrollWheelDown = "<ScrollWheelDown> ",
					ScrollWheelUp = "<ScrollWheelUp> ",
					NL = "<NL> ",
					BS = "<BS> ",
					Space = "<Space> ",
					Tab = "<Tab> ",
					F1 = "<F1>",
					F2 = "<F2>",
					F3 = "<F3>",
					F4 = "<F4>",
					F5 = "<F5>",
					F6 = "<F6>",
					F7 = "<F7>",
					F8 = "<F8>",
					F9 = "<F9>",
					F10 = "<F10>",
					F11 = "<F11>",
					F12 = "<F12>",
				},
			},
		},
		config = function(_, opts)
			local wk = require("which-key")
			wk.setup(opts)

			-- Register key groups using the modern add() method
			wk.add({
				-- Direct actions
				{ "<leader>/", desc = "[/] Fuzzily search in current buffer" },
				{ "<leader>u", desc = "[U]ndo tree" },

				-- Search group
				{ "<leader>s", group = "[S]earch" },

				-- Tab group
				{ "<leader>t", group = "[T]ab" },

				-- Git group
				{ "<leader>g", group = "[G]it" },

				-- LSP group
				{ "<leader>l", group = "[L]SP" },

				-- Replace group
				{ "<leader>r", group = "[R]eplace" },

				-- Project group
				{ "<leader>p", group = "[P]roject" },
			})
		end,
	},
}
