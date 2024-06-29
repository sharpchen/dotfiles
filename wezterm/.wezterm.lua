local wezterm = require('wezterm')

local config = require('wezterm').config_builder()

config.animation_fps = 30
config.default_prog = { 'nu' }
config.window_padding = { left = 0, right = 0, top = 0, bottom = 0 }

local act = wezterm.action

config.mouse_bindings = {
    {
        event = { Down = { streak = 1, button = "Right" } },
        mods = "NONE",
        action = wezterm.action_callback(function(window, pane)
            local has_selection = window:get_selection_text_for_pane(pane) ~= ""
            if has_selection then
                window:perform_action(act.CopyTo("ClipboardAndPrimarySelection"), pane)
                window:perform_action(act.ClearSelection, pane)
            else
                window:perform_action(act({ PasteFrom = "Clipboard" }), pane)
            end
        end),
    },
}

return config
