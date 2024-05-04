return {
	"elixir-tools/elixir-tools.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local elixir = require("elixir")
		local elixirls = require("elixir.elixirls")

		elixir.setup({
			nextls = { enable = false },
			elixirls = {
				enable = true,
				cmd = "C:/Users/Achi/AppData/Local/nvim-data/mason/bin/elixir-ls.cmd",
				settings = elixirls.settings({
					dialyzerEnabled = false,
					enableTestLenses = false,
				}),
				on_attach = function(client, bufnr)
					vim.keymap.set("n", "<space>fp", ":ElixirFromPipe<cr>", { buffer = true, noremap = true })
					vim.keymap.set("n", "<space>tp", ":ElixirToPipe<cr>", { buffer = true, noremap = true })
					vim.keymap.set("v", "<space>em", ":ElixirExpandMacro<cr>", { buffer = true, noremap = true })

					require("achi.plugins.lsp").on_attach(client, bufnr)
				end,
			},
		})
	end,
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
}
