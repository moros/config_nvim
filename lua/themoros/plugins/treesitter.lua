return {
	{ -- Highlight, edit, and navigate code
		"nvim-treesitter/nvim-treesitter",
		branch = "main", -- master is archived and breaks on Neovim 0.12+
		lazy = false, -- main branch does not support lazy-loading
		build = ":TSUpdate",
		config = function()
			-- Parsers to keep installed. Run :TSUpdate after upgrading the plugin.
			-- Swift requires `tree-sitter generate` (tree-sitter CLI + Xcode tooling) and
			-- is only used by the macOS-only xcodebuild plugin, so request it on macOS
			-- only. This keeps Linux from invoking `generate` (which breaks against
			-- tree-sitter CLI >= 0.25, where `--no-bindings` was removed).
			local ensure_installed = vim.list_extend({
				"bash",
				"c",
				"diff",
				"html",
				"lua",
				"luadoc",
				"markdown",
				"markdown_inline",
				"query",
				"vim",
				"vimdoc",
			}, vim.fn.has("mac") == 1 and { "swift" } or {})
			require("nvim-treesitter").install(ensure_installed)

			-- On the main branch, highlighting/indent are enabled per-buffer
			-- via the built-in treesitter API instead of a `highlight`/`indent`
			-- opts table.
			vim.api.nvim_create_autocmd("FileType", {
				desc = "Enable treesitter highlighting and indentation",
				callback = function(ev)
					-- ruby relies on vim's regex indent; let everything else use
					-- treesitter where a parser is available.
					if pcall(vim.treesitter.start) then
						if vim.bo[ev.buf].filetype ~= "ruby" then
							vim.bo[ev.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
						end
					end
				end,
			})
		end,
	},
}
-- vim: ts=2 sts=2 sw=2 et
