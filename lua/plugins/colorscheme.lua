vim.defer_fn(function()
  vim.cmd 'colorscheme kanagawa'
  -- require('colorbuddy').colorscheme 'cobalt2'
  -- vim.cmd.colorscheme 'rose-pine'
  -- vim.cmd.colorscheme 'NeoSolarized'
  -- vim.cmd.colorscheme 'catppuccin'
end, 0)

return {
  'rebelot/kanagawa.nvim',
  {
    'Mofiqul/vscode.nvim',
    config = function()
      require('vscode').setup {
        italic_comments = true,
      }
    end,
  },
  'sainnhe/sonokai',
  {
    'lalitmee/cobalt2.nvim',
    dependencies = { 'tjdevries/colorbuddy.nvim', tag = 'v1.0.0' },
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
    end,
  },
  'Mofiqul/adwaita.nvim',
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
    end,
  },
  'tanvirtin/monokai.nvim',
  'mhartington/oceanic-next',
}
