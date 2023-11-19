vim.g.mapleader = " "
vim.o.cursorline = true
vim.o.ignorecase = true
vim.o.incsearch = true
vim.o.smartcase = true
vim.o.mouse = "a"
vim.o.number = true
vim.o.relativenumber = true
vim.o.hlsearch = false
vim.o.showmode = false
vim.o.swapfile = false
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.expandtab = true
vim.o.smartindent = true
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.termguicolors = true
vim.o.signcolumn = "yes"
vim.o.hidden = true
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false
vim.o.updatetime = 300
vim.o.cmdheight = 0
vim.opt.list = true
vim.o.laststatus = 3
vim.o.pumheight = 10
vim.opt.listchars = {leadmultispace = "│ ", multispace = "│ ", tab = "│ "}

local map = vim.keymap.set

map("n", "<leader>c", ":CocRestart<CR><CR>", {noremap = true, silent = true, desc = "Restart CoC language servers"})
map("n", "<C-H>", "<C-W><C-H>", {noremap = true})
map("n", "<C-J>", "<C-W><C-J>", {noremap = true})
map("n", "<C-K>", "<C-W><C-K>", {noremap = true})
map("n", "<C-L>", "<C-W><C-L>", {noremap = true})
map("n", "<C-S>", ":%s/", {noremap = true})
map("n", "sp", ":sp<CR>", {noremap = true})
map("n", "tj", ":tabprev<CR>", {noremap = true})
map("n", "tk", ":tabnext<CR>", {noremap = true})
map("n", "tn", ":tabnew<CR>", {noremap = true})
map("n", "to", ":tabo<CR>", {noremap = true})
map("n", "vs", ":vs<CR>", {noremap = true})
map("n", "<leader>j", ":cnext<CR>", {noremap = true, silent = true})
map("n", "<leader>k", ":cprevious<CR>", {noremap = true, silent = true})

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath})
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup(
  {
    "knubie/vim-kitty-navigator",
    {
      "nvim-tree/nvim-tree.lua",
      version = "*",
      lazy = false,
      dependencies = { "nvim-tree/nvim-web-devicons" }
    },
    {
      "nvim-treesitter/nvim-treesitter",
      config = function()
        require "nvim-treesitter.configs".setup {
          ensure_installed = {"typescript"},
          highlight = { enable = true },
          indent = { enable = true }
        }
      end
    },
    {
      "JoosepAlviste/nvim-ts-context-commentstring",
      event = "VeryLazy"
    },
    {
      "numToStr/Comment.nvim",
      lazy = false
    },
    {"neoclide/coc.nvim", branch = "release"},
    {
      "kvrohit/rasmus.nvim",
      lazy = false,
      priority = 1000,
      config = function()
        vim.cmd([[colorscheme rasmus]])
      end
    },
    {
      "nvim-telescope/telescope.nvim",
      dependencies = {{"nvim-lua/plenary.nvim"}},
      event = "VeryLazy"
    },
    {
      "kylechui/nvim-surround",
      event = "VeryLazy",
      config = function()
        require("nvim-surround").setup()
      end
    },
  }
)

local telescope_builtin = require("telescope.builtin")

map("n", "<leader>.", "<Plug>(coc-codeaction)", {desc = "Code actions"})
map("n", "gd", "<Plug>(coc-definition)", {silent = true})
map("n", "gr", "<Plug>(coc-references)", {silent = true})
map("n", "K", ":call CocActionAsync('doHover')<CR>", {silent = true, noremap = true})
map("n", "<leader>rn", "<Plug>(coc-rename)", {})
map("n", "<leader>f", ":CocCommand prettier.formatFile<CR>", {noremap = true, desc = "Format file"})
map("i", "<C-Space>", "coc#refresh()", {silent = true, expr = true})
map("i", "<TAB>", "coc#pum#visible() ? coc#pum#next(1) : '<TAB>'", {noremap = true, silent = true, expr = true})
map("i", "<S-TAB>", "coc#pum#visible() ? coc#pum#prev(1) : '<C-h>'", {noremap = true, expr = true})
map( "i", "<CR>", "coc#pum#visible() ? coc#pum#confirm() : '<C-G>u<CR><C-R>=coc#on_enter()<CR>'", {silent = true, expr = true, noremap = true})
map("n", "<C-P>", telescope_builtin.find_files, {})
map("n", "<C-F>", telescope_builtin.live_grep, {})

vim.api.nvim_create_autocmd(
  "VimEnter",
  {
    callback = function()
      if vim.fn.argv(0) == "" then
        require("telescope.builtin").find_files()
      end
    end
  }
)

require("Comment").setup {
  pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook()
}

local colors = { magenta = "#de9bc8", gray01 = "#222221", gray02 = "#2a2a29", gray03 = "#323231" }

require("telescope").setup({
  defaults = {
    prompt_prefix = "",
    selection_caret = "",
    entry_prefix = "",
  },
  pickers = {
    find_files = { theme = "ivy" },
    live_grep = { theme = "ivy" },
  }
})

local TelescopeColor = {
  TelescopeMatching = { fg = colors.magenta },
  TelescopeSelection = { fg = colors.text, bg = colors.gray01, bold = true },
  TelescopePromptPrefix = { bg = colors.gray01 },
  TelescopePromptNormal = { bg = colors.gray01 },
  TelescopeResultsNormal = { bg = colors.gray01 },
  TelescopePreviewNormal = { bg = colors.gray02 },
  TelescopePromptBorder = { bg = colors.gray01, fg = colors.gray01 },
  TelescopeResultsBorder = { bg = colors.gray01, fg = colors.gray01 },
  TelescopePreviewBorder = { bg = colors.gray02, fg = colors.gray02 },
  TelescopePromptTitle = { bg = colors.gray01, fg = colors.gray01 },
  TelescopeResultsTitle = { bg = colors.gray01, fg = colors.gray01 },
  TelescopePreviewTitle = { bg = colors.gray02, fg = colors.gray02 },
}

for hl, col in pairs(TelescopeColor) do
  vim.api.nvim_set_hl(0, hl, col)
end

require("nvim-tree").setup {}
