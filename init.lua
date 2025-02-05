local vim = vim
local Plug = vim.fn["plug#"]

vim.call("plug#begin")

Plug("nvim-treesitter/nvim-treesitter", { ["do"] = ":TSUpdate" })
Plug("rose-pine/neovim")
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

vim.call("plug#end")

require("remap")
require("set")

vim.cmd("colorscheme rose-pine")
