return {
    -- stylus用のlsp
    -- stylusを使わなくなったら消す
    { "iloginow/vim-stylus" },
    -- You can disable default plugins as follows:
    ["goolord/alpha-nvim"] = { disable = true },
    ["declancm/cinnamon.nvim"] = { disable = true },
    -- ["folke/noice.nvim"] = { disable = true },

    -- You can also add new plugins here as well:
    -- Add plugins, the packer syntax without the "use"
    -- { "andweeb/presence.nvim" },
    -- {
    --   "ray-x/lsp_signature.nvim",
    --   event = "BufRead",
    --   config = function()
    --     require("lsp_signature").setup()
    --   end,
    -- },
    --
    {
        "TimUntersberger/neogit",
        config = function()
            require("neogit").setup()
        end,
    },
    -- カラースキームを導入
    -- https://github.com/overcache/NeoSolarized
    { "overcache/NeoSolarized" },
    { "mocaffy/vim-tpipeline" },
    {
        "tanvirtin/vgit.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            require("vgit").setup()
        end,
    },
    {
        "anuvyklack/windows.nvim",
        requires = {
            "anuvyklack/middleclass",
        },
        config = function()
            require("windows").setup()
        end,
    },
    {
        -- mergeEditor用
        "sindrets/diffview.nvim",
        requires = 'nvim-lua/plenary.nvim',
    },
    {
        -- 特定の文字間をいじったりするやつ
        "tpope/vim-surround"
    },
    {
        -- Denoでvimプラグインが動作するようになるやつ
        "vim-denops/denops.vim"
    },
    {
        -- 翻訳するプラグイン
        "skanehira/denops-translate.vim",
    }
    -- {
    --       "jose-elias-alvarez/typescript.nvim",
    --       after = "mason-lspconfig.nvim",
    --       config = function()
    --         require("typescript").setup {
    --           server = astronvim.lsp.server_settings "tsserver",
    --         }
    --       end,
    -- },
    -- {
    --   "sigmasd/deno-nvim",
    --   after = "mason-lspconfig.nvim",
    --   config = function()
    --     require("deno-nvim").setup {
    --       server = astronvim.lsp.server_settings "denols",
    --     }
    --   end
    -- }
}
