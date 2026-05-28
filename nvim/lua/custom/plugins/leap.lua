-- leap.nvim - General-purpose motion plugin
-- https://github.com/ggandor/leap.nvim

local gh = function(repo) return 'https://github.com/' .. repo end

vim.pack.add {
  'https://codeberg.org/andyg/leap.nvim',
  gh 'tpope/vim-repeat',
}

require('leap')
vim.keymap.set('n', 'S', '<Plug>(leap-anywhere)')

-- Optional: Add the suggested preview filter to reduce visual noise
require('leap').opts.preview_filter = function(ch0, ch1, ch2)
  return not (ch1:match '%s' or ch0:match '%a' and ch1:match '%a' and ch2:match '%a')
end
