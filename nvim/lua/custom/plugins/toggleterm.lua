-- toggleterm.nvim
-- https://github.com/akinsho/toggleterm.nvim

local gh = function(repo) return 'https://github.com/' .. repo end

vim.pack.add { { src = gh 'akinsho/toggleterm.nvim', version = vim.version.range '*' } }

require('toggleterm').setup {
  size = 20,
  open_mapping = [[<c-\>]],
  hide_numbers = true,
  shade_terminals = true,
  shading_factor = 2,
  start_in_insert = true,
  insert_mappings = true,
  persist_size = true,
  direction = 'float',
  close_on_exit = true,
  shell = vim.o.shell,
  float_opts = {
    border = 'curved',
  },
}

-- Custom lazygit terminal
local Terminal = require('toggleterm.terminal').Terminal
local lazygit = Terminal:new {
  cmd = 'lazygit',
  dir = 'git_dir',
  direction = 'float',
  float_opts = {
    border = 'double',
  },
  on_open = function(term)
    vim.cmd 'startinsert!'
    vim.api.nvim_buf_set_keymap(term.bufnr, 'n', 'q', '<cmd>close<CR>', { noremap = true, silent = true })
  end,
  on_close = function(_term)
    vim.cmd 'startinsert!'
  end,
}

vim.keymap.set('n', '<leader>lg', function()
  lazygit:toggle()
end, { noremap = true, silent = true, desc = 'Toggle lazygit' })
