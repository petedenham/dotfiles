return {
	"nvim-lualine/lualine.nvim",
	lazy = false,
	dependencies = { "nvim-tree/nvim-web-devicons", "Mofiqul/dracula.nvim" },
	config = function()
		local lualine = require("lualine")
		local colors = require("dracula").colors()

		lualine.setup({
			extensions = { "fzf", "lazy", "oil", "fugitive", "nvim-tree" },
			options = {
				component_separators = "",
				section_separators = "",
				theme = {
					normal = {
						a = { bg = colors.selection, fg = colors.fg },
						x = { bg = colors.selection, fg = colors.fg },
					},
					insert = {
						a = { bg = colors.selection, fg = colors.fg },
						x = { bg = colors.selection, fg = colors.fg },
					},
					visual = {
						a = { bg = colors.selection, fg = colors.fg },
						x = { bg = colors.selection, fg = colors.fg },
					},
					replace = {
						a = { bg = colors.selection, fg = colors.fg },
						x = { bg = colors.selection, fg = colors.fg },
					},
					command = {
						a = { bg = colors.selection, fg = colors.fg },
						x = { bg = colors.selection, fg = colors.fg },
					},
					inactive = {
						a = { bg = colors.selection, fg = colors.fg },
						x = { bg = colors.selection, fg = colors.fg },
					},
				},
				globalstatus = true,
			},
			sections = {
				lualine_a = {
					{ "mode" },
					{
						"filename",
						file_status = true,
						path = 1,
						on_click = function()
							local file = vim.fn.expand("%:~:.")
							if file ~= "" then
								vim.fn.setreg("+", file)
								vim.notify(
									"Copied to clipboard: " .. file,
									vim.log.levels.INFO,
									{ title = "Lualine", timeout = 1000 }
								)

								vim.defer_fn(function()
									vim.notify("", vim.log.levels.INFO, { title = "Lualine", replace = true })
								end, 1000)
							end
						end,
					},
				},
				lualine_b = {},
				lualine_c = {},
				lualine_x = {
					{
						"diff",
						colored = true,
						source = function()
							local gitsigns = vim.b.gitsigns_status_dict
							if gitsigns then
								return {
									added = gitsigns.added,
									modified = gitsigns.changed,
									removed = gitsigns.removed,
								}
							end
						end,
					},
					{
						"diagnostics",
						sources = { "nvim_lsp", "nvim_diagnostic" },
						on_click = function()
							require("telescope.builtin").diagnostics()
						end,
					},
					{ "branch", icon = "" },
				},
				lualine_y = {},
				lualine_z = {},
			},
		})
	end,
}
