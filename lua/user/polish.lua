-- This function is run last and is a good place to configuring
-- augroups/autocommands and custom filetypes also this just pure lua so
-- anything that doesn't fit in the normal config locations above can go here
return function()
  -- Set up custom filetypes
  vim.filetype.add {
      extension = {
          mdx = "markdown",
      },
      -- filename = {
      --   ["Foofile"] = "fooscript",
      -- },
      -- pattern = {
      --   ["~/%.config/foo/.*"] = "fooscript",
      -- },
  }

  -- 自作プラグインのパスを通す
  -- vim.opt.runtimepath:prepend { "~/.config/nvim/lua/myplugins/dps-helloworld/" }
  -- vim.opt.runtimepath:prepend { "~/Develop/github.com/fukke/denops-slack.vim/" }

  -- Normal と NormalNC のハイライト設定を変数に代入
  local color_normal = vim.api.nvim_get_hl_by_name("Normal", true)
  local color_normal_nc = vim.api.nvim_get_hl_by_name("NormalNC", true)

  -- Neovim からフォーカスか外れた時に Normal の色を NormalNC にして
  -- フォーカスが戻った時に Normal に戻す
  vim.api.nvim_create_autocmd({ "FocusLost" }, {
      pattern = { "*" },
      callback = function()
        vim.api.nvim_set_hl(0, "Normal", { fg = color_normal_nc.foreground, bg = color_normal_nc.background })
      end
  })
  vim.api.nvim_create_autocmd({ "FocusGained" }, {
      pattern = { "*" },
      callback = function()
        vim.api.nvim_set_hl(0, "Normal", { fg = color_normal.foreground, bg = color_normal.background })
      end
  })
  vim.api.nvim_set_keymap('n', '[j', '<Plug>(jumpcursor-jump)', {})
end
