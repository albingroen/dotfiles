return {
	"robitx/gp.nvim",
	config = function()
		require("gp").setup()

		-- or setup with your own config (see Install > Configuration in Readme)
		-- require("gp").setup(config)

		-- shortcuts might be setup here (see Usage > Shortcuts in Readme)
	end,
}
