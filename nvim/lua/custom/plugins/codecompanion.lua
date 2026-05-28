-- codecompanion.nvim
-- https://github.com/olimorris/codecompanion.nvim

local gh = function(repo) return 'https://github.com/' .. repo end

vim.pack.add {
  gh 'olimorris/codecompanion.nvim',
  gh 'nvim-lua/plenary.nvim',
  gh 'nvim-treesitter/nvim-treesitter',
  gh 'nvim-telescope/telescope.nvim',
  gh 'stevearc/dressing.nvim',
}

require('codecompanion').setup {
  strategies = {
    chat = {
      adapter = 'copilot',
    },
    inline = {
      adapter = 'copilot',
    },
    agent = {
      adapter = 'claude_code',
    },
  },
  adapters = {
    http = {
      copilot = function()
        return require('codecompanion.adapters').extend('copilot', {
          schema = {
            model = {
              default = 'claude-sonnet-4',
            },
          },
        })
      end,
    },
    acp = {
      claude_code = function()
        return require('codecompanion.adapters').extend('claude_code', {
          env = {
            ANTHROPIC_MODEL = 'claude-sonnet-4@20250514',
            ANTHROPIC_SMALL_FAST_MODEL = 'claude-3-5-haiku@20241022',
            CLAUDE_CODE_USE_VERTEX = '1',
            CLOUD_ML_REGION = 'us-east5',
            ANTHROPIC_VERTEX_PROJECT_ID = 'ford-81c19052e609c367117ba964',
            DISABLE_PROMPT_CACHING = '1',
          },
        })
      end,
    },
  },
}

-- Keybindings
local map = vim.keymap.set
map({ 'n', 'v' }, '<Leader>cc', '<cmd>CodeCompanionActions<cr>', { desc = 'CodeCompanion Actions' })
map('v', '<Leader>ce', '<cmd>CodeCompanionChat Add<cr>', { desc = 'Add selection to CodeCompanion' })
map('n', '<Leader>ct', '<cmd>CodeCompanionChat Toggle<cr>', { desc = 'Toggle CodeCompanion Chat' })
map('n', '<Leader>ci', '<cmd>CodeCompanion<cr>', { desc = 'Start CodeCompanion inline' })
