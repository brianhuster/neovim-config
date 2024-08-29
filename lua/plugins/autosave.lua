return {
        "brianhuster/autosave.nvim",
        branch="dev",
        lazy = false,
        event = "InsertEnter",
        opts = {
            command = "AS",
            toggle_arg = "toggle",
            status_arg = "status",
        }
}
