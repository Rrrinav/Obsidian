return {
    {
        "okuuva/auto-save.nvim",
        cmd = "ASToggle", -- optional for lazy loading on command
        event = { "InsertLeave" }, -- optional for lazy loading on trigger events
        opts = {
            trigger_events = { -- See :h events
                immediate_save = { "InsertLeave" }, -- vim events that trigger an immediate save
                defer_save = { "InsertLeave" }, -- vim events that trigger a deferred save (saves after `debounce_delay`)
            }, -- your config goes here
            -- or just leave it empty :)
        },
    },
}
