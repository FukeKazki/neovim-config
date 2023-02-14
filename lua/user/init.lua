return {
    lsp = {
        -- enable servers that you already have installed without mason
        servers = {
            -- "pyright"
        },
        formatting = {
            -- control auto formatting on save
            format_on_save = {
                enabled = true, -- enable or disable format on save globally
                allow_filetypes = { -- enable format on save for specified filetypes only
                    -- "go",
                },
                ignore_filetypes = { -- disable format on save for specified filetypes
                    -- "python",
                },
            },
            disabled = { -- disable formatting capabilities for the listed language servers
                -- "sumneko_lua",
            },
            timeout_ms = 1000, -- default format timeout
            -- filter = function(client) -- fully override the default formatting function
            --   return true
            -- end
        },
        -- easily add or disable built in mappings added during LSP attaching
        mappings = {
            n = {
                -- ["<leader>lf"] = false -- disable formatting keymap
                ["<S-Left>"] = { function() require("smart-splits").move_cursor_left() end, desc = "Move to left split" },
                ["<S-Down>"] = { function() require("smart-splits").move_cursor_down() end, desc = "Move to below split" },
                ["<S-Up>"] = { function() require("smart-splits").move_cursor_up() end, desc = "Move to above split" },
                ["<S-Right>"] = { function() require("smart-splits").move_cursor_right() end, desc = "Move to right split" },
            },
        },
        -- add to the global LSP on_attach function
        -- on_attach = function(client, bufnr)
        -- end,

        -- override the mason server-registration function
        -- server_registration = function(server, opts)
        --   require("lspconfig")[server].setup(opts)
        -- end,

        -- Add overrides for LSP server settings, the keys are the name of the server
        ["server-settings"] = {
            -- denoとtsserverが干渉しないように
            -- https://astronvim.github.io/Recipes/advanced_lsp#deno-deno-nvim
            denols = {
                root_dir = require("lspconfig.util").root_pattern("deno.json", "deno.jsonc"),
            },
            tsserver = {
                root_dir = require("lspconfig.util").root_pattern("package.json"),
                single_file_support = false
            },
            jsonls = {
                settings = {
                    json = {
                        schemas = {
                            {
                                fileMatch = { 'deno.json', 'deno.jsonc' },
                                url = "https://deno.land/x/deno/cli/schemas/config-file.v1.json"
                            }
                        }
                    }
                }
            },
            -- example for addings schemas to yamlls
            -- yamlls = { -- override table for require("lspconfig").yamlls.setup({...})
            --   settings = {
            --     yaml = {
            --       schemas = {
            --         ["http://json.schemastore.org/github-workflow"] = ".github/workflows/*.{yml,yaml}",
            --         ["http://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
            --         ["http://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
            --       },
            --     },
            --   },
            -- },
        },
    }
}
