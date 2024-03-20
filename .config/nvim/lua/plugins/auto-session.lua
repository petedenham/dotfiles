return {
	"rmagatti/auto-session",
	config = function()
		local auto_session = require("auto-session")
		local keymap = vim.keymap

		auto_session.setup({
			auto_restore_enabled = false,
			auto_session_suppress_dirs = {
				"~/",
				"~/Downloads",
				"~/Documents",
				"~/Desktop/",
			},
		})

		keymap.set(
			"n",
			"<leader>sr",
			"<cmd>SessionRestore<CR>",
			{ desc = "Restore session for current workding directory" }
		)
		keymap.set("n", "<leader>ss", "<cmd>SessionSave<CR>", { desc = "Save session" })
	end,
}
