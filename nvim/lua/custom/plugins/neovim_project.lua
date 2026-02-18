-- https://github.com/coffebar/neovim-project
return {
    "coffebar/neovim-project",
    opts = {
        projects = { -- define project roots
            "~/ford/projects/modelmanager/*",
            "~/ford/projects/cfd/*",
            "~/ford/projects/cad_offset/*",
            "~/ford/projects/gpu-cloud-builder/*",
            "~/.config/*",
        },
        picker = {
            type = "telescope", -- one of "telescope", "fzf-lua", or "snacks"
        }
    },
    init = function()
        -- enable saving the state of plugins in the session
        vim.opt.sessionoptions:append("globals") -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
    end,
    dependencies = {
        { "nvim-lua/plenary.nvim" },
        { "nvim-telescope/telescope.nvim" },
        { "Shatur/neovim-session-manager" },
    },
    lazy = false,
    priority = 100,
    keys = {
        {
            "<leader>pp",
            ":NeovimProjectDiscover<CR>",
            desc = "Open project"
        },
        {
            "<leader>ph",
            ":NeovimProjectHistory<CR>",
            desc = "Project history"
        },
        {
            "<leader>pr",
            ":NeovimProjectLoadRecent<CR>",
            desc = "Load recent project"
        },
    },
}
