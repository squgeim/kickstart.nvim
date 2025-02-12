return {
  'github/copilot.vim',
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.nvim' }, -- if you use the mini.nvim suite
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {
      file_types = { 'markdown', 'copilot-chat' },
    },
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" }, -- or zbirenbaum/copilot.lua
      { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
    },
    build = "make tiktoken && brew install lynx", -- Only on MacOS or Linux
    opts = {
      -- See Configuration section for options

      chat_autocomplete = false,
      highlight_headers = false,
      separator = '---',
      error_header = '> [!ERROR] Error',
      insert_at_end = true
    },
    -- See Commands section for default commands if you want to lazy load on them
    keys = {
      {
        '<leader>cq',
        function()
          local input = vim.fn.input("Quick Chat: ")
          if input ~= "" then
            require("CopilotChat").ask(input, {
              window = {
                layout = "float",
                relative = "cursor",
                width = 1,
                height = 0.4,
                row = 1
              },
            })
          end
        end,
        desc = "CopilotChat - Quick chat",
        mode = { "n", "v" },
      },
      {
        '<leader>cc',
        function()
          require("CopilotChat").toggle()
        end,
        desc = "CopilotChat - Open chat",
        mode = { "n", "v" },
      },
      {
        "<leader>cs",
        function()
          local input = vim.fn.input("Perplexity: ")
          if input ~= "" then
            require("CopilotChat").ask(input, {
              agent = "perplexityai",
              selection = false,
            })
          end
        end,
        desc = "CopilotChat - Perplexity Search",
        mode = { "n" },
      },
    }
  },
}
