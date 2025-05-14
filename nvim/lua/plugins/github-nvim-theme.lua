return {
	"projekt0n/github-nvim-theme",
	name = "github-theme",
	lazy = false, -- make sure we load this during startup if it is your main colorscheme
	priority = 1000, -- make sure to load this before all the other start plugins
	config = function()
		local function set_theme_based_on_system()
			local handle

			if vim.fn.has("mac") == 1 then
				handle = io.popen("defaults read -g AppleInterfaceStyle 2>/dev/null")
			elseif vim.fn.has("unix") == 1 then
				handle = io.popen("gsettings get org.gnome.desktop.interface color-scheme 2>/dev/null")
			end

			if handle then
				local result = handle:read("*a")
				handle:close()

				local is_dark_mode = false

				if vim.fn.has("mac") == 1 then
					is_dark_mode = result:match("dark") ~= nil
				elseif vim.fn.has("unix") == 1 then
					is_dark_mode = result:match("default") ~= nil
				end

				-- Set your preferred light and dark themes here
				if is_dark_mode then
					vim.o.background = "dark"
					vim.cmd("colorscheme github_dark_colorblind") -- Dark theme
				else
					vim.o.background = "light"
					vim.cmd("colorscheme github_light_colorblind") -- Light theme
				end
			end
		end

		set_theme_based_on_system()
	end,
}
