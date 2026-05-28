-- octo.nvim - GitHub PR review in Neovim
-- https://github.com/pwntester/octo.nvim

local gh = function(repo) return 'https://github.com/' .. repo end

vim.pack.add {
  gh 'pwntester/octo.nvim',
  gh 'nvim-lua/plenary.nvim',
  gh 'nvim-telescope/telescope.nvim',
  gh 'nvim-tree/nvim-web-devicons',
}

require('octo').setup {}

-- Keymaps under <leader>o
vim.keymap.set('n', '<leader>ol', '<cmd>Octo pr list<CR>', { desc = 'List PRs' })
vim.keymap.set('n', '<leader>oc', '<cmd>Octo pr checkout<CR>', { desc = 'Checkout PR' })
vim.keymap.set('n', '<leader>od', '<cmd>Octo review diff<CR>', { desc = 'Review diff' })
vim.keymap.set('n', '<leader>os', '<cmd>Octo review start<CR>', { desc = 'Start review' })
vim.keymap.set('n', '<leader>om', '<cmd>Octo review submit<CR>', { desc = 'Submit review' })
vim.keymap.set('n', '<leader>oa', '<cmd>Octo review comments<CR>', { desc = 'Review comments' })
vim.keymap.set('n', '<leader>ot', '<cmd>Octo comment add<CR>', { desc = 'Add comment' })
vim.keymap.set('n', '<leader>oi', '<cmd>Octo issue list<CR>', { desc = 'List issues' })
vim.keymap.set('n', '<leader>oq', '<cmd>tabclose<CR>', { desc = 'Close review tab' })
