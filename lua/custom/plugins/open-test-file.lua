local function find_files_with_current_buffer_name()
  local current_filename = vim.fn.expand '%:t'
  local base_name = current_filename:gsub('%.%w+$', '') -- Remove file extension
  local test_pattern = string.format('%s.spec', base_name)

  require('telescope.builtin').find_files {
    default_text = test_pattern,
  }
end

-- Optionally, map this function to a key for easier access
vim.keymap.set('n', '<leader>st', find_files_with_current_buffer_name, { desc = 'Find files with current buffer name' })

return {}
