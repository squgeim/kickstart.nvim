-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

require('telescope').setup {
  defaults = {
    path_display = { 'truncate' },
    dynamic_preview_title = true,
  },
}

vim.keymap.set('n', '<leader>p', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>o', require('telescope.builtin').lsp_document_symbols, { desc = '[D]ocument [S]ymbols' })

vim.opt.relativenumber = true
vim.opt.colorcolumn = '100'
vim.g.have_nerd_font = true

-- Do not copy yank to OS Clipboard
vim.defer_fn(function()
  vim.opt.clipboard = ''
end, 1000)

-- Fold everything after opening file
vim.opt.foldmethod = 'expr'
vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'
vim.keymap.set('n', 'f', 'za')
vim.keymap.set('n', 'F', 'zA')

-- Use better tab character
vim.opt.listchars = { tab = '⏐ ', trail = '·', nbsp = '␣' }
-- vim.opt.listchars = { tab = '⁞ ', trail = '·', nbsp = '␣' }

vim.defer_fn(function()
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
  {
    'kdheepak/lazygit.nvim',
    cmd = {
      'LazyGit',
      'LazyGitConfig',
      'LazyGitCurrentFile',
      'LazyGitFilter',
      'LazyGitFilterCurrentFile',
    },
    -- optional for floating window border decoration
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    -- setting the keybinding for LazyGit with 'keys' is recommended in
    -- order to load the plugin when the command is run for the first time
    keys = {
      { '<leader>gg', '<cmd>LazyGit<cr>', desc = 'LazyGit' },
    },
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
}
