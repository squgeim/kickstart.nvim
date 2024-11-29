vim.defer_fn(function()
  vim.o.termguicolors = true
  vim.o.background = 'dark'
  -- vim.cmd.colorscheme 'modus'
  -- vim.cmd.colorscheme 'tokyonight'
  -- vim.cmd.colorscheme 'vscode'
  -- vim.cmd.colorscheme 'dawnfox'
  -- vim.cmd.colorscheme 'lunaperche'
  -- vim.cmd.colorscheme 'github_light_tritanopia'
  -- vim.cmd.colorscheme 'modus'
  -- vim.cmd.colorscheme 'rose-pine'
  vim.cmd.colorscheme 'adwaita'
  -- vim.cmd.colorscheme 'sorbet'
end, 0)

return {
  'morhetz/gruvbox',
  'nlknguyen/papercolor-theme',
  'kristijanhusak/vim-hybrid-material',
  'humanoid-colors/vim-humanoid-colorscheme',
  'nordtheme/vim',
  'EdenEast/nightfox.nvim',
  'Mofiqul/vscode.nvim',
  'dgraham/xcode-low-key-vim',
  'sainnhe/sonokai',
  'miikanissi/modus-themes.nvim',
  -- {
  --   'lalitmee/cobalt2.nvim',
  --   dependencies = { 'tjdevries/colorbuddy.nvim', tag = 'v1.0.0' },
  --   init = function()
  --     -- require("colorbuddy").colorscheme("cobalt2")
  --   end,
  -- },
  { 'projekt0n/github-nvim-theme', name = 'github-theme' },
  'rose-pine/neovim',
  'Mofiqul/adwaita.nvim',
  'maxmx03/solarized.nvim',
  'daschw/leaf.nvim',
  'cdmill/neomodern.nvim',
  'e-q/okcolors.nvim',
}
