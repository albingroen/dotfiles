return {
	"projekt0n/github-nvim-theme",
	name = "github-theme",
	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	priority = 1000, -- make sure to load this before all the other start plugins
	config = function()
		local function change_colorscheme()
			local m = vim.fn.system("defaults read -g AppleInterfaceStyle")
			m = m:gsub("%s+", "") -- trim whitespace
			if m == "Dark" then
				vim.o.background = "dark"
				vim.cmd("colorscheme github_dark_colorblind")
			else
				vim.o.background = "light"
				vim.cmd("colorscheme github_light_colorblind")
			end
		end

		change_colorscheme()
	end,
}
