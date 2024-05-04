return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
		dependencies = {
			"L3MON4D3/LuaSnip",
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-cmdline",
			"hrsh7th/cmp-nvim-lua",
			"hrsh7th/cmp-nvim-lsp",
			"ray-x/cmp-treesitter",
			"saadparwaiz1/cmp_luasnip",
			"roobert/tailwindcss-colorizer-cmp.nvim",
		},
	},
	config = function()
		local cmp = require("cmp")
		local lspkind = require("lspkind")
		local cmp_tailwind = require("tailwindcss-colorizer-cmp")

		-- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
		require("luasnip.loaders.from_vscode").lazy_load()

		local source_mapping = {
			nvim_lsp = "[LSP]",
			nvim_lua = "[LUA]",
			luasnip = "[SNIP]",
			buffer = "[BUF]",
			path = "[PATH]",
			treesitter = "[TREE]",
		}

		cmp.setup({
			preselect = cmp.PreselectMode.Item,
			keyword_length = 2,
			completion = {
				completeopt = "menu,menuone,preview,noselect",
			},
			snippet = { -- configure how nvim-cmp interacts with snippet engine
				expand = function(args)
					--luasnip.lsp_expand(args.body)
					vim.snippet.expand(args.body)
				end,
			},
			--			window = {
			--				completion = cmp.config.window.bordered(),
			--				documentation = cmp.config.window.bordered(),
			--			},
			view = {
				entries = {
					name = "custom",
					selection_order = "near_cursor",
					follow_cursor = true,
				},
			},
			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
				["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
				["<C-e>"] = cmp.mapping.abort(), -- close completion window
				["<CR>"] = cmp.mapping.confirm({
					behavior = cmp.ConfirmBehavior.Replace,
					select = true,
				}),
			}),
			-- sources for autocompletion
			sources = cmp.config.sources({
				{
					name = "luasnip",
					group_index = 1,
					option = { use_show_condition = true },
					entry_filter = function()
						local context = require("cmp.config.context")
						return not context.in_treesitter_capture("string") and not context.in_syntax_group("String")
					end,
				},
				{
					name = "nvim_lsp",
					group_index = 2,
				},
				--				{
				--					name = "codeium",
				--					group_index = 2,
				--					option = { use_show_condition = true },
				--					entry_filter = function()
				--						return not vim.g.leetcode
				--					end,
				--				},
				{
					name = "nvim_lua",
					group_index = 3,
				},
				{
					name = "crates",
					group_index = 3,
				},
				{
					name = "treesitter",
					keyword_length = 4,
					group_index = 4,
				},
				{
					name = "path",
					keyword_length = 4,
					group_index = 4,
				},
				{
					name = "buffer",
					keyword_length = 3,
					group_index = 5,
					option = {
						get_bufnrs = function()
							local bufs = {}
							for _, win in ipairs(vim.api.nvim_list_wins()) do
								bufs[vim.api.nvim_win_get_buf(win)] = true
							end
							return vim.tbl_keys(bufs)
						end,
					},
				},
			}),
			-- configure lspkind for vs-code like pictograms in completion menu
			formatting = {
				format = lspkind.cmp_format({
					mode = "symbol_text",
					ellipsis_char = "...",
					before = function(entry, vim_item)
						cmp_tailwind.formatter(entry, vim_item)
						return vim_item
					end,
					menu = source_mapping,
				}),
			},
			sorting = {
				priority_weight = 2,
				comparators = {
					cmp.config.compare.offset,
					cmp.config.compare.exact,
					cmp.config.compare.score,
					cmp.config.compare.recently_used,
					cmp.config.compare.locality,
					cmp.config.compare.kind,
					cmp.config.compare.sort_text,
					cmp.config.compare.length,
					cmp.config.compare.order,
				},
			},
		})
	end,
}
