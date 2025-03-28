-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

require('telescope').setup {
  defaults = {
    layout_strategy = 'horizontal',
    layout_config = {
      prompt_position = 'top',
    },
    sorting_strategy='ascending',
    path_display = { 'truncate' },
    dynamic_preview_title = true,
  },
}

vim.defer_fn(function()
  -- vim.keymap.set('n', '<leader>p', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
  vim.keymap.set('n', '<leader>p', require('snacks').picker.files, { desc = '[S]earch [F]iles' })
  vim.keymap.set('n', '<leader>o', require('snacks').picker.lsp_symbols, { desc = '[D]ocument [S]ymbols' })
  vim.keymap.set('n', '<leader>sc', require('snacks').picker.colorschemes, { desc = '[C]olorschems' })
end, 0)
-- vim.opt.relativenumber = true
vim.opt.colorcolumn = '100'
vim.g.have_nerd_font = true

-- Do not copy yank to OS Clipboard
vim.defer_fn(function()
  vim.opt.clipboard = ''
end, 1000)

-- Fold everything after opening file
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.keymap.set('n', '-', 'za')
vim.keymap.set('n', '_', 'zA')

-- Use better tab character
vim.opt.listchars = { tab = '⏐ ', trail = '·', nbsp = '␣' }
-- vim.opt.listchars = { tab = '⁞ ', trail = '·', nbsp = '␣' }

-- Set relative number in normal mode and absolute number in insert mode
vim.api.nvim_create_autocmd({ 'InsertEnter' }, {
  pattern = '*',
  callback = function()
    vim.opt.relativenumber = false
  end,
})
vim.api.nvim_create_autocmd({ 'InsertLeave' }, {
  pattern = '*',
  callback = function()
    vim.opt.relativenumber = true
  end,
})

-- Enable relative number by default
vim.opt.number = true
vim.opt.relativenumber = true

-- mason/lsp stuff
vim.defer_fn(function()
  local servers = {
    pylsp = {},
    docker_compose_language_service = {},
    eslint = {},
    markdownlint = {},
    prettierd = {},
  }
  local ensure_installed = vim.tbl_keys(servers or {})
  require('mason-tool-installer').setup { ensure_installed = ensure_installed }

  require('lspconfig').pylsp.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
      pylsp = {
        plugins = {
          mccabe = { enabled = false },
          flake8 = { enabled = true },
          pylint = { enabled = false },
          pyflakes = { enabled = false },
          pycodestyle = { enabled = false },
          autopip8 = { enabled = true },
        },
      },
    },
  }

  require('conform').setup {
    format_on_save = nil,
  }
end, 0)

-- mini.nvim
vim.defer_fn(function()
  require('mini.files').setup {
    windows = {
      preview = true,
      width_preview = 100,
    },
  }
  require('mini.hipatterns').setup()
  require('mini.icons').setup()
  require('mini.bufremove').setup()
  require('mini.indentscope').setup()
  require('mini.jump').setup()
  require('mini.move').setup()
  require('mini.bracketed').setup()
  require('mini.sessions').setup()

  vim.keymap.set('n', '\\', function()
    require('mini.files').open(vim.api.nvim_buf_get_name(0))
  end, { desc = 'Show mini.files' })

  vim.keymap.set('n', 'sl', function()
    local home = vim.fn.expand '~'
    local cwd = vim.fn.getcwd():gsub('^' .. home, ''):gsub('/', '∕')

    require('mini.sessions').read(cwd)
  end, { desc = '[S]ession [l]oad' })
  vim.keymap.set('n', 'ss', function()
    local home = vim.fn.expand '~'
    local cwd = vim.fn.getcwd():gsub('^' .. home, ''):gsub('/', '∕')

    require('mini.sessions').write(cwd, { force = true })
  end, { desc = '[S]session [S]ave' })
  vim.keymap.set('n', 'sL', function()
    require('mini.sessions').select()
  end, { desc = '[S]ession [L]ist' })
  vim.keymap.set('n', 'sd', function()
    require('mini.sessions').select('delete', { force = true })
  end, { desc = '[S]ession [D]elete' })
end, 0)

-- neo-tree
vim.defer_fn(function()
  require('neo-tree').setup {
    window = {
      position = 'right',
    },
  }
end, 0)

return {
  'norcalli/nvim-colorizer.lua',
  'tpope/vim-fugitive',
  {
    'tomasky/bookmarks.nvim',
    after = 'telescope.nvim',
    event = 'VimEnter',
    config = function()
      require('bookmarks').setup {
        -- sign_priority = 8,  --set bookmark sign priority to cover other sign
        save_file = vim.fn.expand '$HOME/.bookmarks', -- bookmarks save file path
        keywords = {
          ['@t'] = '☑️ ', -- mark annotation startswith @t ,signs this icon as `Todo`
          ['@w'] = '⚠️ ', -- mark annotation startswith @w ,signs this icon as `Warn`
          ['@f'] = '⛏ ', -- mark annotation startswith @f ,signs this icon as `Fix`
          ['@n'] = ' ', -- mark annotation startswith @n ,signs this icon as `Note`
        },
        on_attach = function()
          local bm = require 'bookmarks'
          local map = vim.keymap.set
          map('n', 'mm', bm.bookmark_toggle, { desc = 'Toggle bookmark' }) -- add or remove bookmark at current line
          map('n', 'mi', bm.bookmark_ann, { desc = 'Annotate line' }) -- add or edit mark annotation at current line
          map('n', 'mc', bm.bookmark_clean, { desc = 'Clean bookmarks in buffer' }) -- clean all marks in local buffer
          map('n', 'mn', bm.bookmark_next, { desc = 'Goto next bookmark' }) -- jump to next mark in local buffer
          map('n', 'mp', bm.bookmark_prev, { desc = 'Goto previous bookmark' }) -- jump to previous mark in local buffer
          -- map("n", "ml", bm.bookmark_list)   -- show marked file list in quickfix window
          map('n', 'ml', require('telescope').extensions.bookmarks.list, { desc = 'List all bookmarks' })
        end,
      }

      require('telescope').load_extension 'bookmarks'
    end,
  },
  'smithbm2316/centerpad.nvim',
  {
    'toppair/peek.nvim',
    event = { 'VeryLazy' },
    build = 'deno task --quiet build:fast',
    config = function()
      require('peek').setup()
      vim.api.nvim_create_user_command('PeekOpen', require('peek').open, {})
      vim.api.nvim_create_user_command('PeekClose', require('peek').close, {})
    end,
  },
  {
    'christoomey/vim-tmux-navigator',
    cmd = {
      'TmuxNavigateLeft',
      'TmuxNavigateDown',
      'TmuxNavigateUp',
      'TmuxNavigateRight',
      'TmuxNavigatePrevious',
    },
    keys = {
      { '<c-h>', '<cmd><C-U>TmuxNavigateLeft<cr>' },
      { '<c-j>', '<cmd><C-U>TmuxNavigateDown<cr>' },
      { '<c-k>', '<cmd><C-U>TmuxNavigateUp<cr>' },
      { '<c-l>', '<cmd><C-U>TmuxNavigateRight<cr>' },
      { '<c-\\>', '<cmd><C-U>TmuxNavigatePrevious<cr>' },
    },
    {
      'pmizio/typescript-tools.nvim',
      dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
      opts = {},
    },
  },
  {
    'folke/noice.nvim',
    event = 'VeryLazy',
    opts = {
      lsp = {
        -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
        override = {
          ['vim.lsp.util.convert_input_to_markdown_lines'] = true,
          ['vim.lsp.util.stylize_markdown'] = true,
          ['cmp.entry.get_documentation'] = true, -- requires hrsh7th/nvim-cmp
        },
      },
      -- you can enable a preset for easier configuration
      presets = {
        bottom_search = true, -- use a classic bottom cmdline for search
        command_palette = true, -- position the cmdline and popupmenu together
        long_message_to_split = true, -- long messages will be sent to a split
        inc_rename = false, -- enables an input dialog for inc-rename.nvim
        lsp_doc_border = false, -- add a border to hover docs and signature help
      },
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      'MunifTanjim/nui.nvim',
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      -- "rcarriga/nvim-notify",
    },
  },
}
