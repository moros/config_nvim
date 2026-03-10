return {
	"hedyhli/outline.nvim",
	config = function()
		-- Example mapping to toggle the outline.
		vim.keymap.set("n", "<leader>lo", "<cmd>OutlineToggle<cr>", { desc = "[L]SP [O]utline Toggle" })

		-- Load the outline plugin with default settings.
		require("outline").setup({})
	end,
}
