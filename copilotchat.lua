return {
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    dependencies = {
      {
        'github/copilot.vim',
        event = 'InsertEnter',
        init = function()
          vim.g.copilot_no_tab_map = true
        end,
        config = function()
          vim.cmd 'Copilot setup'
          -- Map Ctrl-J to accept suggestion
          vim.api.nvim_set_keymap('i', '<C-J>', 'copilot#Accept("<CR>")', { silent = true, expr = true })
        end,
      }, -- or zbirenbaum/copilot.lua
      { 'nvim-lua/plenary.nvim', branch = 'master' }, -- for curl, log and async functions
    },
    build = 'make tiktoken', -- Only on MacOS or Linux
    opts = {
      -- See Configuration section for options
    },
    -- See Commands section for default commands if you want to lazy load on them
    keys = {
      { '<leader>xc', '<cmd>CopilotChat<cr>', mode = 'n', desc = 'Copilot Chat' },
      { '<leader>xe', '<cmd>CopilotChatExplain<cr>', mode = 'v', desc = 'Explain Code' },
      { '<leader>xr', '<cmd>CopilotChatReview<cr>', mode = 'v', desc = 'Review Code' },
      { '<leader>xf', '<cmd>CopilotChatFix<cr>', mode = 'v', desc = 'Fix Code Issue' },
      { '<leader>xo', '<cmd>CopilotChatOptimize<cr>', mode = 'v', desc = 'Optimize Code' },
      { '<leader>xd', '<cmd>CopilotChatDocs<cr>', mode = 'v', desc = 'Generate Docs' },
      { '<leader>xt', '<cmd>CopilotChatTests<cr>', mode = 'v', desc = 'Generate Tests' },
      { '<leader>xm', '<cmd>CopilotChatCommit<cr>', mode = 'n', desc = 'Generate commit message' },
      { '<leader>xs', '<cmd>CopilotChatCommit<cr>', mode = 'v', desc = 'Generate commit message for selection' },
    },
  },
}
