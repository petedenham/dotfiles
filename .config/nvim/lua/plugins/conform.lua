return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters = {
				yamlfix = {
					env = {
						YAMLFIX_WHITELINES = "1",
						YAMLFIX_SECTION_WHITELINES = "1",
						YAMLFIX_EXPLICIT_START = "false",
						YAMLFIX_SEQUENCE_STYLE = "block_style",
					},
				},
			},
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettierd", "prettier", stop_after_first = true },
				typescript = { "prettierd", "prettier", stop_after_first = true },
				javascriptreact = { "prettierd", "prettier", stop_after_first = true },
				typescriptreact = { "prettierd", "prettier", stop_after_first = true },
				json = { "prettierd", "prettier" },
				markdown = { "prettierd", "prettier", stop_after_first = true },
				html = { "htmlbeautifier" },
				bash = { "beautysh" },
				yaml = { "yamlfix" },
				css = { "prettierd", "prettier", stop_after_first = true },
				scss = { "prettierd", "prettier", stop_after_first = true },
				go = { "goimports", "gofumpt", "golines" },
			},
			format_on_save = {
				timeout_ms = 1000,
				lsp_fallback = true,
				async = false,
			},
		})

		vim.keymap.set({ "n" }, "<leader>ff", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			})
		end, { desc = "Format file" })
	end,
}
