return {
	"nvim-lualine/lualine.nvim",
	opts = {
		options = {

			component_separators = { left = "", right = "" },
			section_separators = { left = "", right = "" },
			disabled_filetypes = { "neo-tree" },
		},
		sections = {
			lualine_a = { "location" },
			lualine_b = {},
			lualine_c = { "filename" },
			lualine_x = { "branch", "diff", "diagnostics" },
			lualine_y = {},
			lualine_z = {},
		},
	},
}
