-- telescope-file-browser
-- https://github.com/nvim-telescope/telescope-file-browser.nvim

local gh = function(repo) return 'https://github.com/' .. repo end

vim.pack.add {
  gh 'nvim-telescope/telescope-file-browser.nvim',
  gh 'nvim-telescope/telescope.nvim',
  gh 'nvim-lua/plenary.nvim',
}

require('telescope').setup {
  extensions = {
    file_browser = {
      theme = 'ivy',
      hijack_netrw = true,
    },
  },
}

require('telescope').load_extension 'file_browser'

vim.keymap.set('n', '<leader>sc', ':Telescope file_browser path=%:p:h select_buffer=true<CR>', { desc = 'File browser (current dir)' })
