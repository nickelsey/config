return {
  -- ToggleTerm plugin configuration
  {
    'akinsho/toggleterm.nvim',
    version = '*',
    config = function()
      require('toggleterm').setup {
        -- Size can be a number or a function
        size = function(term)
          if term.direction == 'horizontal' then
            return 15
          elseif term.direction == 'vertical' then
            return vim.o.columns * 0.4
          end
        end,
        -- Open mapping - using <C-\> as requested
        open_mapping = [[<C-\>]],
        hide_numbers = true,
        shade_filetypes = {},
        shade_terminals = true,
        shading_factor = 2,
        start_in_insert = true,
        insert_mappings = true,
        terminal_mappings = true,
        persist_size = true,
        persist_mode = true,
        direction = 'float', -- 'vertical' | 'horizontal' | 'tab' | 'float'
        close_on_exit = true,
        shell = vim.o.shell,
        auto_scroll = true,
        -- Float terminal specific settings
        float_opts = {
          border = 'curved', -- 'single' | 'double' | 'shadow' | 'curved' | ... other options
          width = function()
            return math.ceil(vim.o.columns * 0.9)
          end,
          height = function()
            return math.ceil(vim.o.lines * 0.9)
          end,
          winblend = 3,
          title_pos = 'center',
        },
        winbar = {
          enabled = false,
          name_formatter = function(term)
            return term.name
          end,
        },
      }

      -- Custom terminal for lazygit
      local Terminal = require('toggleterm.terminal').Terminal

      -- Create a lazygit terminal instance
      local lazygit = Terminal:new {
        cmd = 'lazygit',
        dir = 'git_dir',
        direction = 'float',
        float_opts = {
          border = 'double',
          width = function()
            return math.ceil(vim.o.columns * 0.95)
          end,
          height = function()
            return math.ceil(vim.o.lines * 0.95)
          end,
        },
        -- Function to run on opening the terminal
        on_open = function(term)
          vim.cmd 'startinsert!'
          -- Optional: disable line numbers and sign column in the terminal
          vim.api.nvim_buf_set_keymap(term.bufnr, 'n', 'q', '<cmd>close<CR>', { noremap = true, silent = true })
          vim.api.nvim_buf_set_keymap(term.bufnr, 't', '<esc>', '<esc>', { noremap = true, silent = true })
        end,
        on_close = function(term)
          vim.cmd 'startinsert!'
        end,
      }

      -- Function to toggle lazygit
      function _LAZYGIT_TOGGLE()
        lazygit:toggle()
      end

      -- Set up the keybinding for lazygit (space + l + g)
      vim.api.nvim_set_keymap('n', '<leader>lg', '<cmd>lua _LAZYGIT_TOGGLE()<CR>', {
        noremap = true,
        silent = true,
        desc = 'LazyGit',
      })

      -- Optional: Additional useful terminal keybindings
      function _G.set_terminal_keymaps()
        local opts = { buffer = 0 }
        vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
        vim.keymap.set('t', 'jk', [[<C-\><C-n>]], opts)
        vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
        vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
        vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
        vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
        vim.keymap.set('t', '<C-w>', [[<C-\><C-n><C-w>]], opts)
      end

      -- Apply terminal keymaps when opening any toggleterm
      vim.cmd 'autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()'

      -- Optional: Create additional custom terminals
      -- Example: Python terminal
      local python = Terminal:new {
        cmd = 'python3',
        hidden = true,
        direction = 'float',
      }

      function _PYTHON_TOGGLE()
        python:toggle()
      end

      -- Optional: Node terminal
      local node = Terminal:new {
        cmd = 'node',
        hidden = true,
        direction = 'float',
      }

      function _NODE_TOGGLE()
        node:toggle()
      end

      -- Optional: Horizontal terminal
      local htop = Terminal:new {
        cmd = 'htop',
        hidden = true,
        direction = 'float',
      }

      function _HTOP_TOGGLE()
        htop:toggle()
      end

      -- You can add more keybindings for these additional terminals if needed
      -- vim.api.nvim_set_keymap("n", "<leader>tp", "<cmd>lua _PYTHON_TOGGLE()<CR>", {noremap = true, silent = true, desc = "Python Terminal"})
      -- vim.api.nvim_set_keymap("n", "<leader>tn", "<cmd>lua _NODE_TOGGLE()<CR>", {noremap = true, silent = true, desc = "Node Terminal"})
      -- vim.api.nvim_set_keymap("n", "<leader>th", "<cmd>lua _HTOP_TOGGLE()<CR>", {noremap = true, silent = true, desc = "Htop"})
    end,
  },

  -- Optional but recommended: which-key integration for better key discovery
  -- This will show your keybindings in a nice popup
  -- (Uncomment if you want to use which-key and don't already have it configured)
  --[[
  {
    "folke/which-key.nvim",
    optional = true,
    opts = {
      defaults = {
        ["<leader>l"] = { name = "+lazy/lsp/..." },
        ["<leader>lg"] = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "LazyGit" },
      },
    },
  },
  --]]
}
