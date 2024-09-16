return {
	"gbprod/nord.nvim",
	config = function()
		require("nord").setup({
			colorblind = {
				enable = true,
			},
		})

		vim.cmd("colorscheme nord")
	end,
}
