return {
	"tadmccorkle/markdown.nvim",
	event = "VeryLazy",
	init = function()
		-- markdown.nvim's plugin/markdown.lua auto-runs require("markdown").init(),
		-- which calls nvim-treesitter's define_modules() -- an API that only exists
		-- on the archived master branch and is gone on main. Shim it to a no-op so
		-- loading doesn't error. Buffer attachment is handled by setup()'s own
		-- FileType autocmd (the modern path), so nothing is lost.
		local ok, nt = pcall(require, "nvim-treesitter")
		if ok and type(nt.define_modules) ~= "function" then
			nt.define_modules = function() end
		end
	end,
	opts = {
		-- Configuration here or empty for defaults.
	},
}
