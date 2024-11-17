vim.cmd("language en_US")

vim.loader.enable()

local opt = vim.opt

--vim.o.guicursor = "n-v-c-sm-i-ci-ve:block"
vim.o.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20"

opt.relativenumber = true
opt.number = true
opt.so = 10

opt.tabstop = 2
opt.shiftwidth = 2
opt.expandtab = true
opt.autoindent = true

opt.wrap = false
opt.showbreak = "↪"
opt.breakindent = true
opt.breakindentopt = "shift:2"

opt.inccommand = "split"

opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true

opt.belloff = "all"
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"
opt.undofile = true

opt.pumblend = 17
opt.wildmode = "longest:full"
opt.wildoptions = "pum"

opt.cursorline = true
local group = vim.api.nvim_create_augroup("CursorLineControl", { clear = true })
local set_cursorline = function(event, value, pattern)
	vim.api.nvim_create_autocmd(event, {
		group = group,
		pattern = pattern,
		callback = function()
			vim.opt_local.cursorline = value
		end,
	})
end
set_cursorline("WinLeave", false)
set_cursorline("WinEnter", true)
set_cursorline("FileType", false, "TelescopePromt")

opt.backspace = "indent,eol,start"

-- Helpful related items:
--   1. :center, :left, :right
--   2. gw{motion} - Put cursor back after formatting motion.
--
opt.formatoptions = opt.formatoptions
	- "a" -- Auto formatting is BAD.
	- "t" -- Don't auto format my code. I got linters for that.
	+ "c" -- In general, I like it when comments respect textwidth
	+ "q" -- Allow formatting comments w/ gq
	- "o" -- O and o, don't continue comments
	+ "r" -- But do continue when pressing enter.
	+ "n" -- Indent past the formatlistpat, not underneath it.
	+ "j" -- Auto-remove comments if possible.
	- "2" -- I'm not in gradeschool anymore
