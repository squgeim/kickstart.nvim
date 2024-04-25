vim.defer_fn(function()
  vim.o.background = 'dark'
  vim.cmd.colorscheme 'tokyonight-moon'
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
  'dgraham/xcode-low-key-vim',
  'sainnhe/sonokai',
  'miikanissi/modus-themes.nvim',
  {
    'lalitmee/cobalt2.nvim',
    dependencies = { 'tjdevries/colorbuddy.nvim', tag = 'v1.0.0' },
    init = function()
      -- require("colorbuddy").colorscheme("cobalt2")
    end,
  },
}
