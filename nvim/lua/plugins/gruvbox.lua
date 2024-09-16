return {
	"ellisonleao/gruvbox.nvim",
	priority = 1000,
	config = function()
		require("gruvbox").setup({
			contrast = "hard",
			overrides = {
				SignColumn = { bg = "None" },
			},
		})

		-- vim.cmd("colorscheme gruvbox")
	end,
}
