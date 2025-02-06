vim.o.termguicolors = true
vim.o.background = 'dark'

vim.defer_fn(function()
  local ok_status, NeoSolarized = pcall(require, 'NeoSolarized')

  if not ok_status then
    return
  end

  -- Default Setting for NeoSolarized

  NeoSolarized.setup {
    style = 'dark', -- "dark" or "light"
    transparent = false, -- true/false; Enable this to disable setting the background color
    styles = {
      -- Style to be applied to different syntax groups
      comments = { italic = false },
      keywords = { italic = false },
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
  require('rose-pine').setup {
    variant = 'auto', -- auto, main, moon, or dawn
    dark_variant = 'moon', -- main, moon, or dawn

    styles = {
      bold = true,
      italic = false,
      transparency = false,
    },
  }

  -- vim.cmd.colorscheme 'rose-pine'
end, 0)

vim.defer_fn(function()
  require('catppuccin').setup {
    flavour = 'auto', -- latte, frappe, macchiato, mocha
    background = { -- :h background
      light = 'latte',
      dark = 'mocha',
    },
    transparent_background = true, -- disables setting the background color.
    show_end_of_buffer = true, -- shows the '~' characters after the end of buffers
    term_colors = true, -- sets terminal colors (e.g. `g:terminal_color_0`)
    dim_inactive = {
      enabled = true, -- dims the background color of inactive window
      shade = 'dark',
      percentage = 0.15, -- percentage of the shade to apply to the inactive window
    },
    no_italic = false, -- Force no italic
    no_bold = false, -- Force no bold
    no_underline = false, -- Force no underline
    styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
      comments = { 'italic' }, -- Change the style of comments
      conditionals = {},
      loops = {},
      functions = {},
      keywords = {},
      strings = {},
      variables = {},
      numbers = {},
      booleans = {},
      properties = {},
      types = {},
      operators = {},
      -- miscs = {}, -- Uncomment to turn off hard-coded styles
    },
    color_overrides = {},
    custom_highlights = {},
    default_integrations = true,
    integrations = {
      cmp = true,
      gitsigns = true,
      nvimtree = true,
      treesitter = true,
      notify = true,
      mini = {
        enabled = true,
        indentscope_color = '',
      },
      -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
    },
  }

  -- setup must be called before loading
  vim.cmd.colorscheme 'catppuccin'
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
  'Tsuzat/NeoSolarized.nvim',
  { 'catppuccin/nvim', name = 'catppuccin' },
  'tanvirtin/monokai.nvim',
  'mhartington/oceanic-next',
}
