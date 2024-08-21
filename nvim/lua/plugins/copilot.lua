return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot",
	event = "InsertEnter",
	config = function()
		local copilot = require("copilot")
		local copilotSuggestion = require("copilot.suggestion")

		copilot.setup({
			suggestion = {
				enabled = true,
				auto_trigger = true,
			},
		})

		vim.keymap.set("i", "<Tab>", function()
			if copilotSuggestion.is_visible() then
				copilotSuggestion.accept()
			else
				vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Tab>", true, false, true), "n", false)
			end
		end, { desc = "Super Tab" })
	end,
}
