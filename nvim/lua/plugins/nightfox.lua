return {
	"EdenEast/nightfox.nvim",
	config = function()
		require("nightfox").setup({
			options = {
				colorblind = {
					enable = true,
				},
			},
		})

		vim.cmd.colorscheme("terafox")
	end,
}
