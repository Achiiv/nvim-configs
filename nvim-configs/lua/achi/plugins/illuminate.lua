local config = function()
	require("illuminate").configure({
		providers = {
			"lsp",
			"treesitter",
			"regex",
		},
		delay = 100,
		filetypes_denylist = {
			"neo-tree",
			"harpoon",
			"help",
		},
		should_enable = function()
			local exclude = { "nofile" }
			local m = vim.api.nvim_get_mode()["mode"]
			if m == "v" then
				return false
			end
			return not vim.tbl_contains(exclude, vim.bo.buftype)
		end,
		filetypes_allowlist = {},
		modes_denylist = {},
		modes_allowlist = {},
		providers_regex_syntax_denylist = {},
		providers_regex_syntax_allowlist = {},
		under_cursor = true,
	})
end

return {
	"RRethy/vim-illuminate",
	config = config,
	event = "BufReadPre",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
		"rebelot/kanagawa.nvim",
	},
}
