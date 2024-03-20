return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				lua = { "stylua" },
				svelte = { { "prettierd", "prettier" } },
				javascript = { { "prettierd", "prettier" } },
				typescript = { { "prettierd", "prettier" } },
				javascriptreact = { { "prettierd", "prettier" } },
				typescriptreact = { { "prettierd", "prettier" } },
				json = { { "prettierd", "prettier" } },
				markdown = { { "prettierd", "prettier" } },
				html = { "htmlbeautifier" },
				bash = { "beautysh" },
				yaml = { "yamlfix" },
				css = { { "prettierd", "prettier" } },
				scss = { { "prettierd", "prettier" } },
			},
			format_on_save = {
				timeout_ms = 500,
				lsp_fallback = true,
			},
		})

		vim.keymap.set({ "n" }, "<leader>ff", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeout_ms = 500,
			})
		end, { desc = "Format file" })
	end,
}
