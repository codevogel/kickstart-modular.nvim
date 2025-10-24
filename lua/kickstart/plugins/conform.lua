return {
  { -- Autoformat
    'stevearc/conform.nvim',
    event = { 'BufWritePre' },
    cmd = { 'ConformInfo' },
    keys = {
      {
        '<leader>f',
        function()
          require('conform').format { async = true, lsp_format = 'fallback' }
        end,
        mode = '',
        desc = '[F]ormat buffer',
      },
    },
    opts = {
      notify_on_error = false,
      format_on_save = function(bufnr)
        local disable_filetypes = { c = true, cpp = true }
        local filename = vim.fn.expand '%:t'

        -- Skip formatting entirely for *_spec.sh files
        if filename:match '_spec%.sh$' then
          return nil
        end

        if disable_filetypes[vim.bo[bufnr].filetype] then
          return nil
        else
          return {
            timeout_ms = 500,
          }
        end
      end,
      formatters_by_ft = {
        lua = { 'stylua' },
        svelte = { 'prettier' },
        typescript = { 'prettier' },
        javascript = { 'prettier' },
        sh = { 'shfmt' },
        bash = { 'shfmt' },
        zsh = { 'shfmt' },
        markdown = { 'prettier' },
        -- Conform can also run multiple formatters sequentially
        lsp_format = 'fallback',
        -- python = { "isort", "black" },
        --
        -- You can use 'stop_after_first' to run the first available formatter from the list
        -- javascript = { "prettierd", "prettier", stop_after_first = true },
      },
      formatters = {
        shfmt = {
          condition = function()
            -- ignore filenames ending in _spec.sh
            local filename = vim.fn.expand '%:t' -- %:t = tail (just the filename)
            local result = not filename:match '_spec%.sh$'
            return result
          end,
        },
      },
    },
  },
}
-- vim: ts=2 sts=2 sw=2 et
