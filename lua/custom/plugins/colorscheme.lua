vim.defer_fn(function()
  vim.cmd.colorscheme 'dawnfox'
  vim.o.background = 'light'
end, 0)

return {
  'morhetz/gruvbox',
  'nlknguyen/papercolor-theme',
  'cormacrelf/vim-colors-github',
  'kristijanhusak/vim-hybrid-material',
  'icymind/neosolarized',
  'humanoid-colors/vim-humanoid-colorscheme',
  'nordtheme/vim',
  'EdenEast/nightfox.nvim',
  'Mofiqul/vscode.nvim',
}
