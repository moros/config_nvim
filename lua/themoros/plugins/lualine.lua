return {
	"nvim-lualine/lualine.nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	opts = {
		options = {
      fmt = string.lower,
      disabled_filetypes = {
        statusline = {
          "dap-repl",
          "dapui_breakpoints",
          "dapui_console",
          "dapui_scopes",
          "dapui_watches",
          "dapui_stacks",
        },
        winbar = {
          "dap-repl",
          "dapui_breakpoints",
          "dapui_console",
          "dapui_scopes",
          "dapui_watches",
          "dapui_stacks",
        },
      },
    },
		sections = {
			lualine_a = {
				{
					"mode",
					fmt = function(str)
						return str:sub(1, 1)
					end,
				},
			},
			lualine_b = {
				"branch",
			},
			lualine_c = {
				{
					"filename",
					path = 1,
				},
			},
		},
	},
}
