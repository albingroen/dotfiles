return {
	"kvrohit/rasmus.nvim",
	lazy = false,
	priority = 1000,
	config = function()
		vim.opt.background = "dark"
		vim.cmd.colorscheme("rasmus")
	end,
}
