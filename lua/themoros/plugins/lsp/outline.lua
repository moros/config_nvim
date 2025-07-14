return {
	"hedyhli/outline.nvim",
	config = function()
		-- Example mapping to toggle the outline.
		vim.keymap.set("n", "<leader>o", "<cmd>OutlineToggle<cr>", { desc = "Toggle Outline" })

		-- Load the outline plugin with default settings.
		require("outline").setup({})
	end,
}
