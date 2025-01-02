return {
	"stevearc/oil.nvim",
	opts = {
		view_options = {
			show_hidden = true,
		},
		keymaps = {
			["gd"] = {
				desc = "Toggle file detail view",
				callback = function()
					detail = not detail
					if detail then
						require("oil").set_columns({ "icon", "permissions", "size", "mtime" })
					else
						require("oil").set_columns({ "icon" })
					end
				end,
			},
		},
	},
	dependencies = { "nvim-tree/nvim-web-devicons" },
}
