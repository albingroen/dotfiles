return {
	"ellisonleao/gruvbox.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		vim.opt.background = "dark"

		require("gruvbox").setup({ contrast = "hard" })

		vim.cmd.colorscheme("gruvbox")
	end,
}
