return {
	"folke/todo-comments.nvim",
	event = "VimEnter",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		signs = false,
		highlight = {
			multiline = false,
			before = "fg",
			after = "fg",
			keyword = "wide_fg",
		},
	},
}
