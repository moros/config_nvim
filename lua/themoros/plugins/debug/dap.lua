return {
	"mfussenegger/nvim-dap",
	event = "VeryLazy",
	dependencies = {
		"wojciech-kulik/xcodebuild.nvim",
	},
	config = function()
		local xcodebuild = require("xcodebuild.integrations.dap")

		-- Xcode 16+ no longer needs codelldb; setup() now takes only an optional
		-- boolean (loadBreakpoints, default true). If you ever need codelldb again,
		-- enable `integrations.codelldb` in require("xcodebuild").setup{} instead.
		xcodebuild.setup()
		vim.keymap.set("n", "<leader>dd", xcodebuild.build_and_debug, { desc = "Build & Debug" })
		vim.keymap.set("n", "<leader>dr", xcodebuild.debug_without_build, { desc = "Debug Without Building" })
		vim.keymap.set("n", "<leader>dt", xcodebuild.debug_tests, { desc = "Debug Tests" })
		vim.keymap.set("n", "<leader>dT", xcodebuild.debug_class_tests, { desc = "Debug Class Tests" })
		vim.keymap.set("n", "<leader>db", xcodebuild.toggle_breakpoint, { desc = "Toggle Breakpoint" })
		vim.keymap.set("n", "<leader>dB", xcodebuild.toggle_message_breakpoint, { desc = "Toggle Message Breakpoint" })
		vim.keymap.set("n", "<leader>dx", xcodebuild.terminate_session, { desc = "Terminate Debugger" })
	end,
}
