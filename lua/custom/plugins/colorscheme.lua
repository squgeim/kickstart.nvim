vim.o.termguicolors = true
vim.o.background = 'dark'

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
  -- vim.cmd.colorscheme 'darkforest'
  -- vim.cmd.colorscheme 'solarized'
  -- vim.cmd.colorscheme 'papercolor'
  -- vim.cmd.colorscheme 'OceanicNext'
end, 0)

return {
  'morhetz/gruvbox',
  'nlknguyen/papercolor-theme',
  'kristijanhusak/vim-hybrid-material',
  'humanoid-colors/vim-humanoid-colorscheme',
  'nordtheme/vim',
  'EdenEast/nightfox.nvim',
  {
    'Mofiqul/vscode.nvim',
    config = function()
      require('vscode').setup {
        italic_comments = true,
      }
    end,
  },
  'dgraham/xcode-low-key-vim',
  'sainnhe/sonokai',
  'miikanissi/modus-themes.nvim',
  {
    'lalitmee/cobalt2.nvim',
    dependencies = { 'tjdevries/colorbuddy.nvim', tag = 'v1.0.0' },
    init = function()
      require('colorbuddy').colorscheme 'cobalt2'
    end,
  },
  { 'projekt0n/github-nvim-theme', name = 'github-theme' },
  {
    'rose-pine/neovim',
    config = function()
      require('rose-pine').setup {
        variant = 'auto', -- auto, main, moon, or dawn
        dark_variant = 'moon', -- main, moon, or dawn

        styles = {
          bold = true,
          italic = true,
          transparency = false,
        },
      }
      -- vim.cmd.colorscheme 'rose-pine'
    end,
  },
  'Mofiqul/adwaita.nvim',
  'maxmx03/solarized.nvim',
  'daschw/leaf.nvim',
  'cdmill/neomodern.nvim',
  'e-q/okcolors.nvim',
  {
    'Tsuzat/NeoSolarized.nvim',
    config = function()
      require('NeoSolarized').setup {
        style = 'dark', -- "dark" or "light"
        transparent = false, -- true/false; Enable this to disable setting the background color
        styles = {
          -- Style to be applied to different syntax groups
          comments = { italic = true },
          keywords = { italic = true },
          functions = { bold = true },
          variables = {},
          string = { italic = true },
          underline = true, -- true/false; for global underline
          undercurl = true, -- true/false; for global undercurl
        },
      }
      -- vim.cmd.colorscheme 'NeoSolarized'
    end,
  },
  {
    'catppuccin/nvim',
    name = 'catppuccin',
    config = function()
      require('catppuccin').setup {
        flavour = 'auto', -- latte, frappe, macchiato, mocha
        transparent_background = false, -- disables setting the background color.
        no_italic = false, -- Force no italic
      }
      -- vim.cmd.colorscheme 'catppuccin'
    end,
  },
  'tanvirtin/monokai.nvim',
  'mhartington/oceanic-next',
}
