-- neovim-project
-- https://github.com/coffebar/neovim-project

local gh = function(repo)
  return 'https://github.com/' .. repo
end

vim.pack.add {
  gh 'coffebar/neovim-project',
  gh 'nvim-lua/plenary.nvim',
  gh 'nvim-telescope/telescope.nvim',
  gh 'Shatur/neovim-session-manager',
}

-- Enable saving the state of plugins in the session
vim.opt.sessionoptions:append 'globals'

require('neovim-project').setup {
  projects = {
    '/Users/nick/projects/*',
    '/Users/nick/.config/*',
  },
  picker = {
    type = 'telescope',
  },
}

-- Keymaps
vim.keymap.set('n', '<leader>pp', ':NeovimProjectDiscover<CR>', { desc = 'Open project' })
vim.keymap.set('n', '<leader>ph', ':NeovimProjectHistory<CR>', { desc = 'Project history' })
vim.keymap.set('n', '<leader>pr', ':NeovimProjectLoadRecent<CR>', { desc = 'Load recent project' })
