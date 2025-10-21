return {
  'github/copilot.vim',
  config = function()
    vim.g.copilot_no_tab_map = true
  end,
  keys = {
    { '<S-Tab>', 'copilot#Accept("\\CR")', expr = true, mode = 'i', desc = 'Accept Copilot suggestion' },
  },
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    dependencies = {
      { 'nvim-lua/plenary.nvim', branch = 'master' },
    },
    build = 'make tiktoken',
    opts = {
      -- See Configuration section for options
    },
    keys = {
      { '<leader>zc', '<cmd>CopilotChat<CR>', mode = 'n', desc = 'Open Copilot Chat' },
      { '<leader>ze', '<cmd>CopilotChatExplain<CR>', mode = 'v', desc = 'Explain code with Copilot Chat' },
      { '<leader>zr', '<cmd>CopilotChatReview<CR>', mode = 'v', desc = 'Review code with Copilot Chat' },
      { '<leader>zf', '<cmd>CopilotChatFix<CR>', mode = 'v', desc = 'Fix code with Copilot Chat' },
      { '<leader>zo', '<cmd>CopilotChatOptimize<CR>', mode = 'v', desc = 'Optimize code with Copilot Chat' },
      { '<leader>zd', '<cmd>CopilotChatDocs<CR>', mode = 'n', desc = 'Generate docs with Copilot Chat' },
      { '<leader>zd', '<cmd>CopilotChatDocs<CR>', mode = 'v', desc = 'Generate docs with Copilot Chat' },
    },
  },
}
