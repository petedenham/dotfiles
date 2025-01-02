return {
	"zbirenbaum/copilot.lua",
	cmd = "Copilot", -- Lazy load when the :Copilot command is used
	event = "InsertEnter",
	config = function()
		require("copilot").setup({
			panel = {
				enabled = true,
				auto_refresh = true,
			},
			suggestion = {
				enabled = true,
				auto_trigger = true,
				debounce = 75,
				keymap = {
					accept = "<Tab>",
					next = "<C-n>",
					prev = "<C-p>",
					dismiss = "<C-e>",
				},
			},
			filetypes = {
				markdown = true,
				javascript = true,
				typescript = true,
				["*"] = true,
			},
			copilot_node_command = "node", -- Specify Node.js executable if needed
			server_opts_overrides = {},
		})
	end,
}
