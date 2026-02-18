-- CodeCompanion.nvim configuration for lazy.nvim with Claude Code ACP integration
-- Add this to your kickstart.nvim plugins directory

return {
    'olimorris/codecompanion.nvim',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-treesitter/nvim-treesitter',
    },
    config = function()
        require('codecompanion').setup {

            -- Adapter configurations
            adapters = {
                -- HTTP adapters for regular API usage
                http = {
                    anthropic = function()
                        return require('codecompanion.adapters').extend('anthropic', {
                            env = {
                                api_key = 'ANTHROPIC_API_KEY', -- Set your API key in environment
                            },
                            schema = {
                                model = {
                                    default = 'claude-sonnet-4-20250514',
                                },
                            },
                        })
                    end,
                },

                -- ACP adapters for agent integration
                acp = {
                    claude_code = function()
                        return require('codecompanion.adapters').extend('claude_code', {
                            -- Environment variables if needed
                            env = {
                                -- Add any environment variables Claude Code needs
                                CLAUDE_CODE_OAUTH_TOKEN = 'CLAUDE_OAUTH_TOKEN',
                            },
                        })
                    end,
                },
            },

            -- Display configuration
            -- display = {
            --  chat = {
            --    window = {
            --      layout = 'vertical', -- or "horizontal", "float"
            --      opts = {
            --        width = 0.4, -- 40% of screen width
            --      },
            --    },
            --    show_settings = true,
            --  },
            --  diff = {
            --    provider = 'native', -- Use built-in diff
            --  },
            -- },

            -- Optional: Enable logging for debugging
            opts = {
                log_level = 'INFO', -- Change to "DEBUG" or "TRACE" for more detail
            },

            -- Key mappings (optional - these are defaults)
            strategies = {
                chat = {
                    adapter = 'anthropic',
                    keymaps = {
                        send = {
                            modes = { n = '<CR>', i = '<C-s>' },
                            index = 1,
                            callback = 'keymaps.send',
                            description = 'Send message',
                        },
                        close = {
                            modes = { n = '<C-c>' },
                            index = 2,
                            callback = 'keymaps.close',
                            description = 'Close chat',
                        },
                        stop = {
                            modes = { n = '<C-x>' },
                            index = 3,
                            callback = 'keymaps.stop',
                            description = 'Stop request',
                        },
                        regenerate = {
                            modes = { n = 'gr' },
                            index = 4,
                            callback = 'keymaps.regenerate',
                            description = 'Regenerate response',
                        },
                        -- ACP-specific keymaps for handling permissions
                        _acp_approve = {
                            modes = { n = 'ga' },
                            callback = 'keymaps._acp_approve',
                            description = 'Approve ACP action',
                        },
                        _acp_reject = {
                            modes = { n = 'gx' },
                            callback = 'keymaps._acp_reject',
                            description = 'Reject ACP action',
                        },
                    },
                },
                inline = {
                    adapter = 'anthropic',
                },
                acp = {
                    adapter = 'claude_code',
                },
            },
        }
    end,

    -- Key mappings for opening CodeCompanion
    keys = {
        { '<leader>cc', '<cmd>CodeCompanionChat<cr>',        desc = 'Open CodeCompanion Chat' },
        { '<leader>cC', '<cmd>CodeCompanionChat Toggle<cr>', desc = 'Toggle CodeCompanion Chat' },
        { '<leader>ca', '<cmd>CodeCompanionActions<cr>',     desc = 'CodeCompanion Actions' },
        { '<leader>ci', '<cmd>CodeCompanionAdd<cr>',         desc = 'Add current buffer to chat', mode = { 'n', 'v' } },

        -- Quick inline commands
        { '<leader>ce', '<cmd>CodeCompanion /explain<cr>',   desc = 'Explain code',               mode = { 'n', 'v' } },
        { '<leader>ct', '<cmd>CodeCompanion /tests<cr>',     desc = 'Generate tests',             mode = { 'n', 'v' } },
        { '<leader>cf', '<cmd>CodeCompanion /fix<cr>',       desc = 'Fix code',                   mode = { 'n', 'v' } },
    },

    -- Load on command or key press
    cmd = {
        'CodeCompanion',
        'CodeCompanionChat',
        'CodeCompanionActions',
        'CodeCompanionAdd',
        'CodeCompanionToggle',
    },
}
