-- copilot.lua
-- https://github.com/zbirenbaum/copilot.lua

local gh = function(repo) return 'https://github.com/' .. repo end

vim.pack.add { gh 'zbirenbaum/copilot.lua' }

require('copilot').setup {
  panel = {
    enabled = true,
    auto_refresh = false,
    keymap = {
      jump_prev = '[[',
      jump_next = ']]',
      accept = '<CR>',
      refresh = 'gr',
      open = '<M-CR>',
    },
    layout = {
      position = 'bottom',
      ratio = 0.4,
    },
  },
  suggestion = {
    enabled = true,
    auto_trigger = true,
    debounce = 75,
    keymap = {
      accept = false,
      accept_word = false,
      accept_line = false,
      next = '<M-]>',
      prev = '<M-[>',
      dismiss = '<C-]>',
    },
  },
  filetypes = {
    yaml = true,
    markdown = false,
    help = false,
    gitcommit = false,
    gitrebase = false,
    hgcommit = false,
    svn = false,
    cvs = false,
    ['.'] = false,
  },
  copilot_node_command = 'node',
  server_opts_overrides = {},
}

-- Smart Tab: Accept full suggestion or insert tab
vim.keymap.set('i', '<Tab>', function()
  if require('copilot.suggestion').is_visible() then
    require('copilot.suggestion').accept()
  else
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Tab>', true, false, true), 'n', false)
  end
end, { desc = 'Accept Copilot suggestion or insert Tab' })

-- Smart Shift Tab: Accept word or move word forward
vim.keymap.set('i', '<S-Tab>', function()
  if require('copilot.suggestion').is_visible() then
    require('copilot.suggestion').accept_word()
  else
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<S-Tab>', true, false, true), 'n', false)
  end
end, { desc = 'Accept Copilot word or move forward' })

-- Smart Ctrl-z: Accept line
vim.keymap.set('i', '<C-z>', function()
  if require('copilot.suggestion').is_visible() then
    require('copilot.suggestion').accept_line()
  else
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-z>', true, false, true), 'n', false)
  end
end, { desc = 'Accept Copilot line or move down' })

-- Smart Ctrl-x: Dismiss suggestion
vim.keymap.set('i', '<C-x>', function()
  if require('copilot.suggestion').is_visible() then
    require('copilot.suggestion').dismiss()
  else
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<C-x>', true, false, true), 'n', false)
  end
end, { desc = 'Reject suggestion' })
