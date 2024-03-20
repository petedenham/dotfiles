return {
	"nvim-lualine/lualine.nvim",
	lazy = false,
	dependencies = { "nvim-tree/nvim-web-devicons", "Mofiqul/dracula.nvim" },
	config = function()
		local lualine = require("lualine")

		lualine.setup({
			options = {
				theme = "dracula",
			},
			sections = {
				lualine_a = {
					{
						"filename",
						file_status = true,
						path = 1,
					},
				},
				lualine_x = {
					{ "encoding" },
					{ "fileformat" },
					{ "filetype" },
				},
			},
		})
	end,
}
