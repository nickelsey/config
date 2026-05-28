-- neotest - A framework for interacting with tests within NeoVim
-- https://github.com/nvim-neotest/neotest

local gh = function(repo) return 'https://github.com/' .. repo end

vim.pack.add {
  gh 'nvim-neotest/neotest',
  gh 'nvim-neotest/nvim-nio',
  gh 'nvim-lua/plenary.nvim',
  gh 'antoinemadec/FixCursorHold.nvim',
  gh 'nvim-treesitter/nvim-treesitter',
  gh 'nvim-neotest/neotest-python',
}

require('neotest').setup {
  adapters = {
    require 'neotest-python' {
      dap = { justMyCode = false },
      runner = 'pytest',
      python = 'python3',
    },
  },
}

-- Keymaps
vim.keymap.set('n', '<leader>tn', function()
  require('neotest').run.run()
end, { desc = 'Run nearest test' })

vim.keymap.set('n', '<leader>tf', function()
  require('neotest').run.run(vim.fn.expand '%')
end, { desc = 'Run file tests' })

vim.keymap.set('n', '<leader>to', function()
  require('neotest').output_panel.toggle()
end, { desc = 'Toggle test output' })

vim.keymap.set('n', '<leader>ts', function()
  require('neotest').summary.toggle()
end, { desc = 'Toggle test summary' })

vim.keymap.set('n', '<leader>tv', function()
  require('neotest').run.run { extra_args = { '-s' } }
end, { desc = 'Run nearest test with output' })
