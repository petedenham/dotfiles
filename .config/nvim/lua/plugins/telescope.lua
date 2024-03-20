-- blah

return {
	"nvim-telescope/telescope.nvim",
	branch = "0.1.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-telescope/telescope-ui-select.nvim",
		"nvim-tree/nvim-web-devicons",
		"ThePrimeagen/harpoon",
	},
	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")
		local telescopeConfig = require("telescope.config")
		local themes = require("telescope.themes")
		---@diagnostic disable-next-line: deprecated
		local vimgrep_arguments = { unpack(telescopeConfig.values.vimgrep_arguments) }
		table.insert(vimgrep_arguments, "--hidden")
		table.insert(vimgrep_arguments, "--ignore")
		table.insert(vimgrep_arguments, "--glob")
		table.insert(vimgrep_arguments, "!.git/*")

		telescope.setup({
			defaults = {
				vimgrep_arguments = vimgrep_arguments,
				path_display = { "truncate" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous,
						["<C-j>"] = actions.move_selection_next,
					},
				},
			},
			pickers = {
				find_files = {
					find_command = {
						"rg",
						"--files",
						"--hidden",
						"--ignore",
						"--glob",
						"!.git/*",
					},
				},
			},
			extensions = {
				["ui-select"] = {
					themes.get_dropdown({}),
				},
			},
		})

		telescope.load_extension("fzf")
		telescope.load_extension("ui-select")
		telescope.load_extension("harpoon")

		local keymap = vim.keymap

		keymap.set("n", "<leader>sh", "<cmd>Telescope help_tags<cr>", { desc = "Search help tags" })
		keymap.set("n", "<leader>sk", "<cmd>Telescope keymaps<cr>", { desc = "Search keymaps" })
		keymap.set("n", "<leader>sf", "<cmd>Telescope find_files<cr>", { desc = "Search files" })
		keymap.set("n", "<leader>sw", "<cmd>Telescope grep_string<cr>", { desc = "Search current word" })
		keymap.set("n", "<leader>sg", "<cmd>Telescope live_grep<cr>", { desc = "Search by grep" })
		keymap.set("n", "<leader>sd", "<cmd>Telescope diagnostics<cr>", { desc = "Search diagnostics" })
		keymap.set("n", "<leader>sr", "<cmd>Telescope resume<cr>", { desc = "Search resume" })
		keymap.set("n", "<leader>s.", "<cmd>Telescope oldfiles<cr>", { desc = "Search recent files ('.' for repeat)" })
		keymap.set("n", "<leader>sb", "<cmd>Telescope buffers<cr>", { desc = "Search existing buffers" })
		keymap.set("n", "<leader>st", "<cmd>TodoTelescope<cr>", { desc = "Search todo comments" })
	end,
}
