return {
	"robitx/gp.nvim",
	opts = {
		default_chat_agent = "anthropic",
		providers = {
			anthropic = {
				disable = false,
				endpoint = "https://api.anthropic.com/v1/messages",
				secret = os.getenv("ANTHROPIC_API_KEY"),
			},
		},
	},
}
