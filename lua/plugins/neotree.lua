return {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
        filesystem = {
            filtered_items = {
                visible = true,
                force_visible_in_empty_folder = true,
                show_hidden_count = true,
                hide_dotfiles = false,
                hide_gitignored = false,
                hide_by_name = {
                    -- '.git',
                    -- '.DS_Store',
                    -- 'thumbs.db',
                },
                never_show = {},
            }
        }
    }
}