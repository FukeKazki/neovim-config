-- This function is run last and is a good place to configuring
-- augroups/autocommands and custom filetypes also this just pure lua so
-- anything that doesn't fit in the normal config locations above can go here
return function()
  -- Set up custom filetypes
  -- vim.filetype.add {
  --   extension = {
  --     foo = "fooscript",
  --   },
  --   filename = {
  --     ["Foofile"] = "fooscript",
  --   },
  --   pattern = {
  --     ["~/%.config/foo/.*"] = "fooscript",
  --   },
  -- }

  -- 不可視な文字の設定
  vim.cmd([[
    set list
    set listchars=tab:»-,trail:-,eol:↲,extends:»,precedes:«,nbsp:%,space:･
    set title
    augroup Tmux
      autocmd! FocusGained * hi Normal guifg=#cbccc6 guibg=#1f2733
      autocmd! FocusLost * hi Normal guifg=#cbccc6 guibg=#1b222d
    augroup END
  ]])
end
