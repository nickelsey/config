return {
  'nvim-telescope/telescope-file-browser.nvim',
  dependencies = { 'nvim-telescope/telescope.nvim', 'nvim-lua/plenary.nvim' },
  config = function()
    require('telescope').setup {
      extensions = {
        file_browser = {
          theme = 'ivy',
          hijack_netrw = true,
        },
      },
    }

    require('telescope').load_extension 'file_browser'

    -- Open file browser with the path of the current buffer
    vim.keymap.set('n', '<leader>sc', ':Telescope file_browser path=%:p:h select_buffer=true<CR>', { desc = 'File browser (current dir)' })
  end,
}
