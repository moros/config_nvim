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
				-- Search group
				{ "<leader>q", group = "[Q]uery" },
				{ "<leader>qh", desc = "[Q]uery [H]elp" },
				{ "<leader>qf", desc = "[Q]uery [F]iles" },
				{ "<leader>qw", desc = "[Q]uery current [W]ord" },
				{ "<leader>qg", desc = "[Q]uery [G]rep" },
				{ "<leader>q/", desc = "[Q]uery [/] in Open Files" },
				{ "<leader>qn", desc = "[Q]uery [N]eovim files" },
				{ "<leader>qe", desc = "[Q]uery [E]xplorer (Whaler)" },
				{ "<leader>/", desc = "[/] Fuzzily search in current buffer" },

				-- Toggle group
				{ "<leader>t", group = "[T]oggle" },
				{ "<leader>ta", desc = "[T]ab [A]dd" },
				{ "<leader>tc", desc = "[T]ab [C]lose" },
				{ "<leader>to", desc = "[T]ab [O]nly" },
				{ "<leader>tn", desc = "[T]ab [N]ext" },
				{ "<leader>tp", desc = "[T]ab [P]revious" },
				{ "<leader>tmp", desc = "[T]ab [M]ove [P]revious" },
				{ "<leader>tmn", desc = "[T]ab [M]ove [N]ext" },
				{ "<leader>u", desc = "[U]ndo tree" },

				-- Format group
				{ "<leader>f", group = "[F]ormat" },
				{ "<leader>fr", desc = "[F]ind and [R]eplace" },

				-- File operations group
				{ "<leader>p", group = "[P]roject" },
				{ "<leader>pv", desc = "[P]roject [V]iew" },

				-- Buffer operations group
				{ "<leader>b", group = "[B]uffer" },

				-- Window operations group
				{ "<leader>w", group = "[W]indow" },

				-- LSP group (for LSP-specific mappings)
				{ "<leader>l", group = "[L]SP" },

				-- Git group (if you add git mappings later)
				{ "<leader>g", group = "[G]it" },

				-- Quick actions group
				--{ "<leader>q", group = "[Q]uick" },
			})
		end,
	},
}
