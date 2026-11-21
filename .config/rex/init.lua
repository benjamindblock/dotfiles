-- ==============================================================================
-- Rex configuration, migrated from ~/.tmux.conf
-- ==============================================================================

-- tmux's prefix, ctrl+b, becomes the first key of every sequence below. Since
-- ctrl+b now starts sequences, pressing it twice sends a literal ctrl+b to the
-- program in the pane, for programs that use the key themselves.
rex.bind("ctrl+b>ctrl+b", "pane.send_key", { key = "ctrl+b" })

-- ------------------------------------------------------------------------------
-- Repeat mode
-- ------------------------------------------------------------------------------

-- tmux's `bind -r` lets a key repeat without pressing the prefix again. Rex has
-- no repeat timer, so ctrl+b then ctrl+r enters an exclusive mode where the
-- pane-focus keys work on their own until enter or escape leaves it.
rex.mode("repeat", { exclusive = true })
rex.bind("ctrl+b>ctrl+r", "client.mode.enter", { name = "repeat" })
rex.bind("repeat/enter", "client.mode.exit")
rex.bind("repeat/escape", "client.mode.exit")

-- ------------------------------------------------------------------------------
-- Pane navigation (vim-style h/j/k/l)
-- ------------------------------------------------------------------------------

rex.bind("ctrl+b>h", "pane.focus", { direction = "left" })
rex.bind("repeat/h", "pane.focus", { direction = "left" })
rex.bind("ctrl+b>j", "pane.focus", { direction = "down" })
rex.bind("repeat/j", "pane.focus", { direction = "down" })
rex.bind("ctrl+b>k", "pane.focus", { direction = "up" })
rex.bind("repeat/k", "pane.focus", { direction = "up" })
rex.bind("ctrl+b>l", "pane.focus", { direction = "right" })
rex.bind("repeat/l", "pane.focus", { direction = "right" })

-- ------------------------------------------------------------------------------
-- Tabs and splits
-- ------------------------------------------------------------------------------

-- tmux's % splits side by side and " splits top and bottom.
rex.bind("ctrl+b>c", "client.tab.new")
rex.bind("ctrl+b>shift+5", "pane.split", { direction = "right" })
rex.bind("ctrl+b>shift+'", "pane.split", { direction = "down" })

-- ------------------------------------------------------------------------------
-- Reload config
-- ------------------------------------------------------------------------------

rex.bind("ctrl+b>r", "client.config.reload")
