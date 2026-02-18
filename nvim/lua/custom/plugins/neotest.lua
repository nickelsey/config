-- neotest - A framework for interacting with tests within NeoVim
-- https://github.com/nvim-neotest/neotest

return {
    "nvim-neotest/neotest",
    dependencies = {
        "nvim-neotest/nvim-nio",
        "nvim-lua/plenary.nvim",
        "antoinemadec/FixCursorHold.nvim",
        "nvim-treesitter/nvim-treesitter",
        -- Test adapters
        "nvim-neotest/neotest-python",
    },
    config = function()
        local neotest = require("neotest")
        neotest.setup({
            adapters = {
                require("neotest-python")({
                    dap = { justMyCode = false },
                    runner = "pytest",
                    python = "python3",
                }),
            },
        })
    end,
    keys = {
        {
            "<leader>tn",
            function()
                local neotest = require('neotest')
                if neotest and neotest.run then
                    neotest.run.run()
                else
                    print("Neotest not available")
                end
            end,
            desc = "Run nearest test"
        },
        {
            "<leader>tf",
            function()
                local neotest = require('neotest')
                if neotest and neotest.run then
                    neotest.run.run(vim.fn.expand('%'))
                else
                    print("Neotest not available")
                end
            end,
            desc = "Run file tests"
        },
        {
            "<leader>to",
            function()
                local neotest = require('neotest')
                if neotest and neotest.output_panel then
                    neotest.output_panel.toggle()
                else
                    print("Neotest output panel not available")
                end
            end,
            desc = "Toggle test output"
        },
        {
            "<leader>ts",
            function()
                local neotest = require('neotest')
                if neotest and neotest.summary then
                    neotest.summary.toggle()
                else
                    print("Neotest summary not available")
                end
            end,
            desc = "Toggle test summary"
        },
    },
}
