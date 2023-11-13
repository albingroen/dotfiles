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
vim.o.termguicolors = true
vim.o.hidden = true
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false
vim.o.cmdheight = 0
vim.opt.list = true
vim.o.laststatus = 3
vim.opt.statusline = " %f %m %= %l:%c ♥ "
vim.o.splitright = true
vim.o.splitbelow = 3
vim.o.signcolumn = "yes"

local map = vim.keymap.set

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
  vim.fn.system(
    {"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath}
  )
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup(
  {
    "L3MON4D3/LuaSnip",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/nvim-cmp",
    "saadparwaiz1/cmp_luasnip",
    "lewis6991/gitsigns.nvim",
    "neovim/nvim-lspconfig",
    "nvim-tree/nvim-web-devicons",
    "nvim-treesitter/nvim-treesitter",
    "stevearc/oil.nvim",
    {"JoosepAlviste/nvim-ts-context-commentstring", event = "VeryLazy"},
    {"kylechui/nvim-surround", event = "VeryLazy"},
    {"numToStr/Comment.nvim", lazy = false},
    {"nvim-telescope/telescope.nvim", dependencies = {{"nvim-lua/plenary.nvim"}}, event = "VeryLazy"},
    {"rebelot/kanagawa.nvim", lazy = false, priority = 1000},
    {"windwp/nvim-autopairs", event = "InsertEnter", opts = {}}
  }
)

require("Comment").setup {
  pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook()
}

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local lspconfig = require("lspconfig")

local servers = {"tsserver"}
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    capabilities = capabilities
  }
end

local luasnip = require "luasnip"

local cmp = require "cmp"
cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end
  },
  mapping = cmp.mapping.preset.insert(
    {
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<CR>"] = cmp.mapping.confirm {
        behavior = cmp.ConfirmBehavior.Replace,
        select = true
      },
      ["<Tab>"] = cmp.mapping(
        function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          else
            fallback()
          end
        end,
        {"i", "s"}
      ),
      ["<S-Tab>"] = cmp.mapping(
        function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          elseif luasnip.jumpable(-1) then
            luasnip.jump(-1)
          else
            fallback()
          end
        end,
        {"i", "s"}
      )
    }
  ),
  sources = {
    {name = "nvim_lsp"},
    {name = "luasnip"},
    {name = "buffer"}
  }
}

map("n", "<space>e", vim.diagnostic.open_float)
map("n", "[d", vim.diagnostic.goto_prev)
map("n", "]d", vim.diagnostic.goto_next)

vim.api.nvim_create_autocmd(
  "LspAttach",
  {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
      local opts = {buffer = ev.buf}
      map("n", "gd", vim.lsp.buf.definition, opts)
      map("n", "K", vim.lsp.buf.hover, opts)
      map("n", "<space>rn", vim.lsp.buf.rename, opts)
      map({"n", "v"}, "<space>.", vim.lsp.buf.code_action, opts)
      map("n", "gr", vim.lsp.buf.references, opts)
      map(
        "n",
        "<space>f",
        function()
          vim.lsp.buf.format {async = true}
        end,
        opts
      )
    end
  }
)

-- Git signs
require("gitsigns").setup {
  signs = {add = {text = "+"}},
  current_line_blame = true,
  numhl = true
}

-- Oil.nvim
require("oil").setup()

map("n", "-", "<CMD>Oil<CR>", {desc = "Open parent directory"})

-- Treesitter
require "nvim-treesitter.configs".setup {
  ensure_installed = {"typescript"},
  highlight = {enable = true},
  indent = {enable = true}
}

-- Colorscheme
require("kanagawa").setup(
  {
    overrides = function(colors)
      local theme = colors.theme
      return {
        TelescopeTitle = {fg = theme.ui.special, bold = true},
        TelescopePromptNormal = {bg = theme.ui.bg_p1},
        TelescopePromptBorder = {fg = theme.ui.bg_p1, bg = theme.ui.bg_p1},
        TelescopeResultsNormal = {fg = theme.ui.fg_dim, bg = theme.ui.bg_m1},
        TelescopeResultsBorder = {fg = theme.ui.bg_m1, bg = theme.ui.bg_m1},
        TelescopePreviewNormal = {bg = theme.ui.bg_dim},
        TelescopePreviewBorder = {bg = theme.ui.bg_dim, fg = theme.ui.bg_dim},
        Pmenu = {fg = theme.ui.shade0, bg = theme.ui.bg_p1},
        PmenuSel = {fg = "NONE", bg = theme.ui.bg_p3},
        PmenuSbar = {bg = theme.ui.bg_m1},
        PmenuThumb = {bg = theme.ui.bg_p2}
      }
    end
  }
)

vim.opt.background = "dark"
vim.cmd.colorscheme "kanagawa-dragon"

-- Telescope
local telescope = require("telescope")
local telescope_builtin = require("telescope.builtin")

telescope.setup {
  defaults = {
    prompt_prefix = " ",
    selection_caret = " ",
    entry_prefix = " "
  }
}

map("n", "<C-P>", telescope_builtin.find_files, {})
map("n", "<C-F>", telescope_builtin.live_grep, {})

-- nvim-surround
require("nvim-surround").setup()
