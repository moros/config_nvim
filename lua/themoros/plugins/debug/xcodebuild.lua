return {
	"wojciech-kulik/xcodebuild.nvim",
	event = "VeryLazy",
	dependencies = {
		"nvim-telescope/telescope.nvim",
		"MunifTanjim/nui.nvim",
		"folke/snacks.nvim", -- (optional) to show previews
		"nvim-tree/nvim-tree.lua", -- (optional) to manage project files
		"stevearc/oil.nvim", -- (optional) to manage project files
		"nvim-treesitter/nvim-treesitter", -- (optional) for Quick tests support (required Swift parser)
	},
	config = function()
		require("xcodebuild").setup({
			auto_save = true, -- save all buffers before running build or tests (command: silent wa!)
			code_coverage = {
				enabled = true,
			},
		})

		-- Helper function to check if we're in an Xcode project directory
		local function is_xcode_project()
			local cwd = vim.loop.cwd() or vim.fn.getcwd()
			local xcodeproj = vim.fn.globpath(cwd, "*.xcodeproj", false, true)
			local xcworkspace = vim.fn.globpath(cwd, "*.xcworkspace", false, true)
			return (#xcodeproj > 0) or (#xcworkspace > 0)
		end

		-- Helper function to show error if not in Xcode project
		local function require_xcode_project()
			if not is_xcode_project() then
				local cwd = vim.loop.cwd() or vim.fn.getcwd()
				vim.notify(
					"Not in an Xcode project directory. Current directory: "
						.. cwd
						.. "\nPlease navigate to a directory containing a .xcodeproj or .xcworkspace file.",
					vim.log.levels.WARN
				)
				return false
			end
			return true
		end

		-- Create wrapper functions for Xcodebuild commands
		local function safe_xcodebuild_command(command)
			return function()
				if require_xcode_project() then
					vim.cmd(command)
				end
			end
		end

		vim.keymap.set(
			"n",
			"<leader>xl",
			safe_xcodebuild_command("XcodebuildToggleLogs"),
			{ desc = "Toggle Xcodebuild Logs" }
		)
		vim.keymap.set("n", "<leader>xb", safe_xcodebuild_command("XcodebuildBuild"), { desc = "Build Project" })
		vim.keymap.set(
			"n",
			"<leader>xr",
			safe_xcodebuild_command("XcodebuildBuildRun"),
			{ desc = "Build & Run Project" }
		)
		vim.keymap.set("n", "<leader>xt", safe_xcodebuild_command("XcodebuildTest"), { desc = "Run Tests" })
		vim.keymap.set(
			"n",
			"<leader>xT",
			safe_xcodebuild_command("XcodebuildTestClass"),
			{ desc = "Run This Test Class" }
		)
		vim.keymap.set(
			"n",
			"<leader>xP",
			safe_xcodebuild_command("XcodebuildPicker"),
			{ desc = "Show All Xcodebuild Actions" }
		)
		vim.keymap.set("n", "<leader>xd", safe_xcodebuild_command("XcodebuildSelectDevice"), { desc = "Select Device" })
		vim.keymap.set(
			"n",
			"<leader>xp",
			safe_xcodebuild_command("XcodebuildSelectTestPlan"),
			{ desc = "Select Test Plan" }
		)
		vim.keymap.set(
			"n",
			"<leader>xc",
			safe_xcodebuild_command("XcodebuildToggleCodeCoverage"),
			{ desc = "Toggle Code Coverage" }
		)
		vim.keymap.set(
			"n",
			"<leader>xC",
			safe_xcodebuild_command("XcodebuildShowCodeCoverageReport"),
			{ desc = "Show Code Coverage Report" }
		)
		vim.keymap.set("n", "<leader>xq", "<cmd>Telescope quickfix<cr>", { desc = "Show QuickFix List" })

		-- Add a command to check Xcode project status
		vim.api.nvim_create_user_command("XcodeProjectStatus", function()
			local cwd = vim.loop.cwd() or vim.fn.getcwd()
			if is_xcode_project() then
				local xcodeproj = vim.fn.findfile("*.xcodeproj", cwd .. ";")
				local xcworkspace = vim.fn.findfile("*.xcworkspace", cwd .. ";")
				local project_type = xcworkspace ~= "" and "workspace" or "project"
				local project_name = xcworkspace ~= "" and xcworkspace or xcodeproj
				vim.notify("✓ Xcode " .. project_type .. " found: " .. project_name, vim.log.levels.INFO)
			else
				vim.notify("✗ No Xcode project found in current directory: " .. cwd, vim.log.levels.WARN)
			end
		end, { desc = "Check if current directory contains an Xcode project" })
	end,
}
