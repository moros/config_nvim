-- [[ Configure and install plugins ]]
--
-- To check the current status of plugins, run
-- 	:Lazy
--
-- One can press `?` in this menu for help. Use `:q` to close the window.
--
-- To update plugins one can run
--	:Lazy update
--
require("lazy").setup({
	"NMAC427/guess-indent.nvim",

	require("themoros.plugins.colorschemes.xcode"),
	--require("themoros.plugins.colorschemes.tokyonight"),

	require("themoros.plugins.which-key"),
	require("themoros.plugins.utility.colorizer"),
	require("themoros.plugins.whaler"),
	require("themoros.plugins.telescope"),
	require("themoros.plugins.lspconfig"),
	--require("themoros.plugins.lsp.outline"),
	require("themoros.plugins.conform"),
	require("themoros.plugins.blink-cmp"),
	require("themoros.plugins.surround"),
	require("themoros.plugins.mini"),
	require("themoros.plugins.treesitter"),
	require("themoros.plugins.todo-comments"),
	require("themoros.plugins.undotree"),
	require("themoros.plugins.autopairs"),
	--require("themoros.plugins.indent_line"),
	require("themoros.plugins.neo-tree"),
	require("themoros.plugins.lualine"),
	require("themoros.plugins.tabby"),
	require("themoros.plugins.dropbar"),
	require("themoros.plugins.search_replace"),
	require("themoros.plugins.markdown"),
	require("themoros.plugins.render-markdown"),
	require("themoros.plugins.github_copilot"),
	require("themoros.plugins.split-term"),
	require("themoros.plugins.io.nio"),
	require("themoros.plugins.debug.xcodebuild"),
	require("themoros.plugins.debug.dap"),
	require("themoros.plugins.debug.dap-ui"),
})

-- vim: ts=2 sts=2 sw=2 et
