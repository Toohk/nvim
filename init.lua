local vim = vim
local Plug = vim.fn["plug#"]

vim.call("plug#begin")

Plug("nvim-treesitter/nvim-treesitter", { ["do"] = ":TSUpdate" })
Plug("rose-pine/neovim")
Plug("xero/miasma.nvim")
Plug("williamboman/mason.nvim")
Plug("neovim/nvim-lspconfig")
Plug("williamboman/mason-lspconfig.nvim")
Plug("mfussenegger/nvim-lint")
Plug("mhartington/formatter.nvim")
Plug("hrsh7th/nvim-cmp")
Plug("hrsh7th/cmp-nvim-lsp")
Plug("windwp/nvim-autopairs")
Plug("nvim-lua/plenary.nvim")
Plug("nvim-telescope/telescope.nvim", { ["tag"] = "0.1.8" })
Plug("ThePrimeagen/harpoon", { ["branch"] = "harpoon2", ["dependencies"] = "nvim-lua/plenary.nvim" })
Plug("windwp/nvim-ts-autotag")
Plug("rubixninja314/vim-mcfunction")

vim.call("plug#end")

require("command")
require("remap")
require("set")

vim.cmd("colorscheme miasma")
vim.api.nvim_set_hl(0, "Normal", { bg = "#181a1b" }) -- couleur de fond de la zone principale
vim.api.nvim_set_hl(0, "NormalNC", { bg = "#181a1b" })
