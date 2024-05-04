return {
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	opts = {
		formatters_by_ft = {
			css = { "prettierd", "rustywind" },
			html = { "prettierd", "rustywind" },
			javascript = { "prettierd" },
			json = { "prettierd" },
			jsonc = { "prettierd" },
			lua = { "stylua" },
			markdown = { "prettierd", "markdownlint" },
			go = { "goimports", "gofmt" },
			rust = { "rustfmt" },
		},
		format_on_save = {
			lsp_fallback = true,
			timeout_ms = 500,
		},
	},
}
