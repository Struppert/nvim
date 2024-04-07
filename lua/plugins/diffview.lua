return {
  -- Hier fügen Sie andere Plugins hinzu
  { "sindrets/diffview.nvim" },
  -- Hier fügen wir eine benutzerdefinierte Konfiguration für diffview.nvim hinzu
  {
    "sindrets/diffview.nvim",
    opts = function()
      require("diffview").setup({
        -- Hier fügen Sie Ihre diffview-Konfiguration ein
        diff_binaries = false, -- Zeige Diffs für Binärdateien
        enhanced_diff_hl = false, -- Benutze verbessertes Highlighting für Diffs
        use_icons = true, -- Benutze Icons in der Dateiliste
        icons = { -- Anpassung der Icons
          folder_closed = "",
          folder_open = "",
        },
        signs = {
          fold_closed = "",
          fold_open = "",
        },
        file_panel = {
          win_config = {
            width = 35,
          },
        },
        key_bindings = {
          disable_defaults = false, -- Standard-Tastenbindungen nicht deaktivieren
          --view = {
          --  ["<tab>"] = actions.select_next_entry, -- Nächsten Eintrag auswählen
          --  ["<s-tab>"] = actions.select_prev_entry, -- Vorherigen Eintrag auswählen
          --  ["gf"] = actions.goto_file, -- Gehe zur Datei
          --  ["<C-w><C-f>"] = actions.goto_file_split, -- Datei in neuem Split öffnen
          --  -- Weitere Keybindings nach Bedarf
          --},
          --file_panel = {
          --  ["j"] = actions.next_entry, -- Nächsten Eintrag auswählen
          --  ["<down>"] = actions.next_entry,
          --  ["k"] = actions.prev_entry, -- Vorherigen Eintrag auswählen
          --  ["<up>"] = actions.prev_entry,
          --  -- Weitere Keybindings nach Bedarf
          --},
        },
        -- Weitere Konfigurationen und Anpassungen hier...
      })
    end,
  },
}
