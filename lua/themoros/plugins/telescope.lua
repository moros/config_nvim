return {
	{ -- Fuzzy Finder (files, lsp, etc)
		"nvim-telescope/telescope.nvim",
		event = "VimEnter",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{ -- If encountering errors, see telescope-fzf-native README for installation instructions.
				"nvim-telescope/telescope-fzf-native.nvim",

				-- `build` is used to run some command when the plugin is installed/updated.
				-- This is only run then, not every time Neovim starts up.
				build = "make",

				-- `cond` is a condition used to determine whether this plugin should be installed and loaded.
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
			{ "nvim-telescope/telescope-ui-select.nvim" },

			-- Useful for getting pretty icons, but requires a Nerd Font.
			{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
		},
		config = function()
			-- Telescope is a fuzzy finder that comes with a lot of different things that
			-- it can fuzzy find! It's more than just a "file finder", it can search
			-- many different aspects of Neovim, your workspace, LSP, and more!
			--
			-- The easiest way to use Telescope, is to start by doing something like:
			--  :Telescope help_tags
			--
			-- After running this command, a window will open up and you're able to
			-- type in the prompt window. You'll see a list of `help_tags` options and
			-- a corresponding preview of the help.
			--
			-- Two important keymaps to use while in Telescope are:
			--  - Insert mode: <c-/>
			--  - Normal mode: ?
			--
			-- This opens a window that shows you all of the keymaps for the current
			-- Telescope picker. This is really useful to discover what Telescope can
			-- do as well as how to actually do it!

			-- [[ Configure Telescope ]]
			-- See `:help telescope` and `:help telescope.setup()`
			require("telescope").setup({
				-- You can put your default mappings / updates / etc. in here
				-- All the info you're looking for is in `:help telescope.setup()`
				--
				--  defaults = {
				--    mappings = {
				--      i = { ['<c-enter>'] = 'to_fuzzy_refine' },
				--    },
				--  },
				--  pickers = {}
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown(),
					},
					whaler = {
						-- Configure whaler here
						directories = { "~/Projects/ecom_mobileapps", "~/Projects" }, -- Add your project directories here
						oneoff_directories = { "~/.config/nvim" },
						auto_file_explorer = true,
						auto_cwd = true,
						file_explorer = "netrw",
						theme = {
							layout_strategy = "center",
							layout_config = {
								height = 0.6,
								width = 0.9, -- Make it wider (default is 0.4)
							},
							previewer = false,
							border = true,
						},
					},
				},
			})

			-- Enable Telescope extensions if they are installed
			pcall(require("telescope").load_extension, "fzf")
			pcall(require("telescope").load_extension, "ui-select")
			pcall(require("telescope").load_extension, "whaler")

			-- See `:help telescope.builtin`
			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>qh", builtin.help_tags, { desc = "[Q]uery [H]elp" })
			vim.keymap.set("n", "<leader>qf", builtin.find_files, { desc = "[Q]uery [F]iles" })
			vim.keymap.set("n", "<leader>qw", builtin.grep_string, { desc = "[Q]uery current [W]ord" })
			--vim.keymap.set("n", "<leader>qg", builtin.live_grep, { desc = "[Q]uery [G]rep" })
			vim.keymap.set(
				"n",
				"<leader>qg",
				":lua require('telescope.builtin').live_grep({ additional_args = { '--fixed-strings' }})<CR>",
				{ desc = "[Q]uery [G]rep" }
			)

			--vim.keymap.set("n", "<leader>ps", function()
			--	builtin.grep_string({ search = vim.fn.input("Grep > ") })
			--end)

			-- Slightly advanced example of overriding default behavior and theme.
			vim.keymap.set("n", "<leader>/", function()
				-- You can pass additional configuration to Telescope to change the theme, layout, etc.
				builtin.current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({
					winblend = 10,
					previewer = false,
				}))
			end, { desc = "[/] Fuzzily search in current buffer" })

			-- It's also possible to pass additional configuration options.
			-- See `:help telescope.builtin.live_grep()` for information about particular keys.
			vim.keymap.set("n", "<leader>q/", function()
				builtin.live_grep({
					grep_open_files = true,
					prompt_title = "Live Grep in Open Files",
				})
			end, { desc = "[Q]uery [/] in Open Files" })

			-- Shortcut for searching your Neovim configuration files
			vim.keymap.set("n", "<leader>qn", function()
				builtin.find_files({ cwd = vim.fn.stdpath("config") })
			end, { desc = "[Q]uery [N]eovim files" })

			-- Whaler keymap
			vim.keymap.set(
				"n",
				"<leader>qe",
				require("telescope").extensions.whaler.whaler,
				{ desc = "[Q]uery [E]xplorer (Whaler)" }
			)
		end,
	},
}

-- vim: ts=2 sts=2 sw=2 et
