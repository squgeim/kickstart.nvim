vim.o.termguicolors = true
vim.o.background = 'dark'

vim.defer_fn(function()
  local ok_status, NeoSolarized = pcall(require, "NeoSolarized")

  if not ok_status then
    return
  end

  -- Default Setting for NeoSolarized

  NeoSolarized.setup {
    style = "light", -- "dark" or "light"
    transparent = false, -- true/false; Enable this to disable setting the background color
    styles = {
      -- Style to be applied to different syntax groups
      comments = { italic = true },
      keywords = { italic = true },
      functions = { bold = false },
      variables = {},
      string = { italic = false },
      underline = true, -- true/false; for global underline
      undercurl = true, -- true/false; for global undercurl
    },
    -- Add specific hightlight groups
    on_highlights = function(highlights, colors)
      -- highlights.Include.fg = colors.red -- Using `red` foreground for Includes
    end,
  }

  -- Set colorscheme to NeoSolarized
  -- vim.cmd.colorscheme 'NeoSolarized'
end, 0)

vim.defer_fn(function()
  -- vim.cmd.colorscheme 'coffeecat'
  -- vim.cmd.colorscheme 'tokyonight'
  -- vim.cmd.colorscheme 'vscode'
  -- vim.cmd.colorscheme 'dawnfox'
  -- vim.cmd.colorscheme 'lunaperche'
  -- vim.cmd.colorscheme 'github_light_tritanopia'
  -- vim.cmd.colorscheme 'modus'
  -- vim.cmd.colorscheme 'rose-pine'
  -- vim.cmd.colorscheme 'adwaita'
  -- vim.cmd.colorscheme 'sorbet'
  -- vim.cmd.colorscheme 'iceclimber'
  vim.cmd.colorscheme 'darkforest'
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
  'Tsuzat/NeoSolarized.nvim'
}
