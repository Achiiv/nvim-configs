function ColorMyPencils(color)
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

local overrides = function(colors)
	local p = colors.palette
	return {
		String = {
			fg = p.springGreen,
			italic = false,
		},
		Function = {
			fg = p.crystalBlue,
			italic = false,
		},
		CursorLine = {
			bold = false,
			italic = false,
			bg = p.sumiInk4,
		},
		Visual = {
			bold = false,
		},
		TreesitterContextBottom = {
			link = "Visual",
		},
		IlluminatedCurWord = {
			italic = true,
		},
		IlluminatedWordText = {
			link = "CursorLine",
			italic = true,
		},
		IlluminatedWordRead = {
			link = "CursorLine",
			italic = true,
		},
		IlluminatedWordWrite = {
			link = "CursorLine",
			italic = true,
		},
		Folded = {
			bg = p.sumiInk3,
		},
		StatusColumnFoldClosed = {
			fg = p.springViolet1,
			bold = false,
		},
		DashboardHeader = {
			fg = p.peachRed,
			bg = p.sumiInk3,
		},
		DashboardIcon = {
			fg = p.springBlue,
			bg = p.sumiInk3,
		},
		DashboardDesc = {
			fg = p.fujiWhite,
			bg = p.sumiInk3,
			italic = true,
		},
		DashboardKey = {
			fg = p.lightBlue,
			bg = p.sumiInk3,
			bold = true,
		},
		Pmenu = {
			fg = p.fujiWhite,
			bg = p.waveBlue1,
		},
		PmenuSel = {
			fg = p.waveBlue1,
			bg = p.springViolet2,
			bold = true,
		},
		UfoFoldedBg = {
			bg = p.waveBlue1,
			bold = true,
		},
		IdentScope = {
			fg = p.oniViolet2,
		},
	}
end

return {
	{
		"rebelot/kanagawa.nvim",
		priority = 2000,
		config = function()
			require("kanagawa").setup({
				compile = false, -- enable compiling the colorscheme
				undercurl = true, -- enable undercurls
				commentStyle = { italic = true },
				functionStyle = {},
				keywordStyle = { italic = true },
				statementStyle = { bold = true },
				typeStyle = {},
				transparent = false, -- do not set background color
				dimInactive = true, -- dim inactive window `:h hl-NormalNC`
				terminalColors = true, -- define vim.g.terminal_color_{0,17}
				colors = { -- add/modify theme and palette colors
					palette = {},
					theme = {
						wave = {},
						lotus = {},
						dragon = {},
						all = {
							ui = {
								bg_gutter = "none",
							},
						},
					},
				},
				overrides = overrides, -- add/modify highlights
				theme = "dragon", -- Load "wave" theme when 'background' option is not set
				background = { -- map the value of 'background' option to a theme
					dark = "dragon", -- try "dragon" !
				},
			})
			vim.cmd("colorscheme kanagawa")
		end,
	},

	{
		"folke/tokyonight.nvim",
		priority = 1000,
		config = function()
			require("tokyonight").setup({
				style = "night",
				transparent = false,
				terminal_colors = true,
				styles = {
					comments = { italic = false },
					keywords = { italic = false },
					sidebars = "dark",
					floats = "dark",
				},
			})
			-- vim.cmd("colorscheme tokyonight")
		end,
	},

	{
		"rose-pine/neovim",
		priority = 3000,
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({
				disable_background = true,
				styles = {
					italic = false,
				},
			})
			-- vim.cmd("colorscheme rose-pine")
			ColorMyPencils()
		end,
	},
}
