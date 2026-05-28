-- claude-code.nvim
-- https://github.com/greggh/claude-code.nvim

local gh = function(repo) return 'https://github.com/' .. repo end

vim.pack.add {
  gh 'greggh/claude-code.nvim',
  gh 'nvim-lua/plenary.nvim',
}

require('claude-code').setup {
  -- Terminal window settings
  window = {
    split_ratio = 0.3,
    position = 'float',
    enter_insert = true,
    hide_numbers = true,
    hide_signcolumn = true,

    float = {
      width = '80%',
      height = '80%',
      row = 'center',
      col = 'center',
      relative = 'editor',
      border = 'rounded',
    },
  },
  -- File refresh settings
  refresh = {
    enable = true,
    updatetime = 100,
    timer_interval = 1000,
    show_notifications = true,
  },
  -- Git project settings
  git = {
    use_git_root = true,
  },
  -- Shell-specific settings
  shell = {
    separator = '&&',
    pushd_cmd = 'pushd',
    popd_cmd = 'popd',
  },
  -- Command settings
  command = 'claude',
  command_variants = {
    continue = '--continue',
    resume = '--resume',
    verbose = '--verbose',
  },
  -- Keymaps
  keymaps = {
    toggle = {
      normal = '<C-,>',
      terminal = '<C-,>',
      variants = {
        continue = '<leader>cC',
        verbose = '<leader>cV',
      },
    },
    window_navigation = true,
    scrolling = true,
  },
}
