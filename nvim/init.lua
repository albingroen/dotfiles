vim.g.mapleader = " "
vim.g.maplocalleader = " "
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
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.termguicolors = true
vim.o.signcolumn = "yes"
vim.o.hidden = true
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false
vim.o.updatetime = 300
vim.opt.list = true
vim.o.laststatus = 3
vim.o.pumheight = 10

vim.keymap.set("n", "<C-H>", "<C-W><C-H>", {noremap = true})
vim.keymap.set("n", "<C-J>", "<C-W><C-J>", {noremap = true})
vim.keymap.set("n", "<C-K>", "<C-W><C-K>", {noremap = true})
vim.keymap.set("n", "<C-L>", "<C-W><C-L>", {noremap = true})
vim.keymap.set("n", "<C-S>", ":%s/", {noremap = true})
vim.keymap.set("n", "sp", ":sp<CR>", {noremap = true})
vim.keymap.set("n", "tj", ":tabprev<CR>", {noremap = true})
vim.keymap.set("n", "tk", ":tabnext<CR>", {noremap = true})
vim.keymap.set("n", "tn", ":tabnew<CR>", {noremap = true})
vim.keymap.set("n", "to", ":tabo<CR>", {noremap = true})
vim.keymap.set("n", "vs", ":vs<CR>", {noremap = true})
vim.keymap.set("n", "<leader>j", ":cnext<CR>", {noremap = true, silent = true})
vim.keymap.set("n", "<leader>k", ":cprevious<CR>", {noremap = true, silent = true})

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
    vim.fn.system(
        {"git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath}
    )
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup(
    {
        "knubie/vim-kitty-navigator",
        "nvim-lua/plenary.nvim",
        "tpope/vim-sleuth",
        "tpope/vim-rhubarb",
        "tpope/vim-fugitive",
        {"JoosepAlviste/nvim-ts-context-commentstring", event = "VeryLazy"},
        {"numToStr/Comment.nvim", lazy = false},
        {
            "nvim-telescope/telescope.nvim",
            event = "VeryLazy",
            keys = {
                {"<C-p>", "<cmd>Telescope find_files<cr>", desc = "Find files"},
                {"<C-f>", "<cmd>Telescope live_grep<cr>", desc = "Live grep"},
            }
        },
        {
            "nvim-treesitter/nvim-treesitter",
            build = ":TSUpdate",
            config = function()
                local configs = require("nvim-treesitter.configs")

                configs.setup({
                    highlight = {enable = true},
                    indent = {enable = true}
                })
            end
        },
        {
            "kvrohit/rasmus.nvim",
            lazy = false,
            priority = 1000,
            config = function()
                vim.cmd([[colorscheme rasmus]])
            end
        },
        {
            "kylechui/nvim-surround",
            event = "VeryLazy",
            config = function()
                require("nvim-surround").setup()
            end
        },
        {
            "neoclide/coc.nvim",
            branch = "release",
            config = function()
                vim.keymap.set("n", "<leader>c", ":CocRestart<CR><CR>", {noremap = true, silent = true, desc = "Restart CoC language servers"})
                vim.keymap.set("n", "<leader>.", "<Plug>(coc-codeaction)", {desc = "Code actions"})
                vim.keymap.set("n", "gd", "<Plug>(coc-definition)", {silent = true})
                vim.keymap.set("n", "gr", "<Plug>(coc-references)", {silent = true})
                vim.keymap.set("n", "K", ":call CocActionAsync('doHover')<CR>", {silent = true, noremap = true})
                vim.keymap.set("n", "<leader>rn", "<Plug>(coc-rename)", {})
                vim.keymap.set("n", "<leader>f", ":CocCommand prettier.formatFile<CR>", {noremap = true, desc = "Format file"})
                vim.keymap.set("i", "<C-Space>", "coc#refresh()", {silent = true, expr = true})
                vim.keymap.set("i", "<TAB>", "coc#pum#visible() ? coc#pum#next(1) : '<TAB>'", {noremap = true, silent = true, expr = true})
                vim.keymap.set("i", "<S-TAB>", "coc#pum#visible() ? coc#pum#prev(1) : '<C-h>'", {noremap = true, expr = true})
                vim.keymap.set(
                    "i",
                    "<CR>",
                    "coc#pum#visible() ? coc#pum#confirm() : '<C-G>u<CR><C-R>=coc#on_enter()<CR>'",
                    {silent = true, expr = true, noremap = true}
                )
            end
        },
    }
)

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

require("Comment").setup({
    pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook()
})
