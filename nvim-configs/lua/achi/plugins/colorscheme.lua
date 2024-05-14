function ColorMyPencils(color)
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

local overrides = function(colors)
	local p = colors.palette
	return {
		CursorLine = {
			bold = true,
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

--return {
--   "rose-pine/neovim",
--   priority = 1000,
--   config = function()
--      require("rose-pine").setup({
--          variant = "auto", -- auto, main, moon, or dawn
--          dark_variant = "main", -- main, moon, or dawn
--          dim_inactive_windows = true,
--          extend_background_behind_borders = true,
--
--          enable = {
--              terminal = true,
--              legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
--              migrations = true, -- Handle deprecated options automatically
--          },
--
--          styles = {
--              bold = true,
--              italic = true,
--              transparency = true,
--          },
--
--          groups = {
--              border = "muted",
--              link = "iris",
--              panel = "surface",
--
--              error = "love",
--              hint = "iris",
--              info = "foam",
--              note = "pine",
--              todo = "rose",
--              warn = "gold",
--
--              git_add = "foam",
--              git_change = "rose",
--              git_delete = "love",
--              git_dirty = "rose",
--              git_ignore = "muted",
--              git_merge = "iris",
--              git_rename = "pine",
--              git_stage = "iris",
--              git_text = "rose",
--              git_untracked = "subtle",
--
--              h1 = "iris",
--              h2 = "foam",
--              h3 = "rose",
--              h4 = "gold",
--              h5 = "pine",
--              h6 = "foam",
--          },
--
--          highlight_groups = {
--              -- Comment = { fg = "foam" },
--              -- VertSplit = { fg = "muted", bg = "muted" },
--          },
--      })
--
--      vim.cmd("colorscheme rose-pine")
--      -- vim.cmd("colorscheme rose-pine-main")
--      -- vim.cmd("colorscheme rose-pine-moon")
--      -- vim.cmd("colorscheme rose-pine-dawn")
--    end
--}

--return {
--   "EdenEast/nightfox.nvim",
--   priority = 1000,
--   config = function()
--    require('nightfox').setup({
--      options = {
--        transparent = false,
--        dim_inactive = true,
--      },
--    })
--     vim.cmd("colorscheme nightfox")
--   end
--}

--return {
--   "bluz71/vim-nightfly-colors",
--   priority = 1000,
--   config = function()
--     vim.cmd("colorscheme nightfly")
--   end
--}

--return {
--  "folke/tokyonight.nvim",
--  priority = 1000,
--  config = function()
--   require('tokyonight').setup({
--     style = "night",
--     transparent = true,
--   })
--    vim.cmd("colorscheme tokyonight")
--  end
--}
