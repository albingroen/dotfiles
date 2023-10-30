--------------
--- Basics ---
--------------

-- Plugin Management
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- Key Mappings
vim.g.mapleader = " "

-- Visual Settings
vim.o.colorcolumn = "80"
vim.o.cursorline = true

-- Search and Case Insensitivity
vim.o.hlsearch = false
vim.o.ignorecase = true
vim.o.incsearch = true
vim.o.smartcase = true

-- Mouse Interaction
vim.o.mouse = "a"

-- Line Numbers and Indentation
vim.o.number = true
vim.o.numberwidth = 2
vim.o.relativenumber = true

-- Folding
vim.opt.foldcolumn = "auto"

-- Scrolling and Display
vim.o.scrolloff = 3
vim.o.showmode = false
vim.o.showtabline = 1
vim.o.signcolumn = "yes"
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.swapfile = false
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.expandtab = true
vim.o.smartindent = true
vim.opt.listchars = {
  leadmultispace = "│ ",
  multispace = "│ ",
  tab = "│ "
}

-- Colors and Appearance
vim.o.termguicolors = true
vim.o.wrap = false

-- Text and Buffer Management
vim.opt.fillchars = {eob = " "}
vim.o.hidden = true
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false

-- Performance and Timings
vim.o.updatecount = 0
vim.o.updatetime = 300
vim.o.cmdheight = 0

-- Miscellaneous
vim.opt.list = true
vim.o.laststatus = 3

----------------
--- Mappings ---
----------------

local map = vim.keymap.set

-- Restart CoC language servers
map("n", "<leader>c", ":CocRestart<CR><CR>", {noremap = true, silent = true, desc = "Restart CoC language servers"})

-- Move to the window to the left
map("n", "<C-H>", "<C-W><C-H>", {noremap = true})

-- Move to the window below
map("n", "<C-J>", "<C-W><C-J>", {noremap = true})

-- Move to the window above
map("n", "<C-K>", "<C-W><C-K>", {noremap = true})

-- Move to the window to the right
map("n", "<C-L>", "<C-W><C-L>", {noremap = true})

-- Perform a search and replace
map("n", "<C-S>", ":%s/", {noremap = true})

-- Create a new horizontal split
map("n", "sp", ":sp<CR>", {noremap = true})

-- Move to the previous tab
map("n", "tj", ":tabprev<CR>", {noremap = true})

-- Move to the next tab
map("n", "tk", ":tabnext<CR>", {noremap = true})

-- Create a new tab
map("n", "tn", ":tabnew<CR>", {noremap = true})

-- Close all other tabs
map("n", "to", ":tabo<CR>", {noremap = true})

-- Create a new vertical split
map("n", "vs", ":vs<CR>", {noremap = true})

-- Go to the next entry in the quickfix list
map("n", "<leader>j", ":cnext<CR>", {noremap = true, silent = true})

-- Go to the previous entry in the quickfix list
map("n", "<leader>k", ":cprevious<CR>", {noremap = true, silent = true})

-- Scroll up and center the screen
map("n", "<C-u>", "<C-u>zz")

-- Scroll down and center the screen
map("n", "<C-d>", "<C-d>zz")

---------------
--- Plugins ---
---------------

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system(
    {
      "git",
      "clone",
      "--filter=blob:none",
      "https://github.com/folke/lazy.nvim.git",
      "--branch=stable",
      lazypath
    }
  )
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup(
  {
    "knubie/vim-kitty-navigator",
    {
      "nvim-treesitter/nvim-treesitter",
      config = function()
        require "nvim-treesitter.configs".setup {
          ensure_installed = {"typescript"},
          highlight = {
            enable = true
          },
          indent = {
            enable = true
          }
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
        vim.g.rasmus_italic_functions = true
        vim.g.rasmus_bold_functions = true

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
      version = "*",
      event = "VeryLazy",
      config = function()
        require("nvim-surround").setup()
      end
    },
  }
)

-----------
--- COC ---
-----------

map("n", "<leader>.", "<Plug>(coc-codeaction)", {desc = "Code actions"})
map("n", "gd", "<Plug>(coc-definition)", {silent = true})
map("n", "gr", "<Plug>(coc-references)", {silent = true})
map("n", "K", ":call CocActionAsync('doHover')<CR>", {silent = true, noremap = true})
map("n", "<leader>rn", "<Plug>(coc-rename)", {})
map("n", "<leader>f", ":CocCommand prettier.formatFile<CR>", {noremap = true, desc = "Format file"})
map("i", "<C-Space>", "coc#refresh()", {silent = true, expr = true})
map("i", "<TAB>", "coc#pum#visible() ? coc#pum#next(1) : '<TAB>'", {noremap = true, silent = true, expr = true})
map("i", "<S-TAB>", "coc#pum#visible() ? coc#pum#prev(1) : '<C-h>'", {noremap = true, expr = true})
map(
  "i",
  "<CR>",
  "coc#pum#visible() ? coc#pum#confirm() : '<C-G>u<CR><C-R>=coc#on_enter()<CR>'",
  {silent = true, expr = true, noremap = true}
)

-----------------
--- Telescope ---
-----------------

local telescope = require("telescope")
local telescope_builtin = require("telescope.builtin")

telescope.setup {
  defaults = {
    prompt_prefix = "   ",
    selection_caret = " ",
    entry_prefix = " "
  },
  pickers = {
    find_files = {
      theme = "dropdown",
      previewer = false
    },
    buffers = {
      theme = "dropdown",
      previewer = false
    }
  }
}

map("n", "<C-P>", telescope_builtin.find_files, {})
map("n", "<C-F>", telescope_builtin.live_grep, {})
map("n", "<C-B>", telescope_builtin.buffers, {})
map("n", "<C-G>", telescope_builtin.git_branches, {})

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

--------------------
--- comment.nvim ---
--------------------

require("Comment").setup {
  pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook()
}
