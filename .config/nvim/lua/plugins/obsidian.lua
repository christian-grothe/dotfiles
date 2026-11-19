return {
  "obsidian-nvim/obsidian.nvim",
  version = "*",
  ft = "markdown", -- lazy-load only for markdown (add BufReadPre/BufNewFile patterns for the vault if you want it everywhere)
  cmd = "Obsidian",
  keys = {
    { "<leader>on", "<cmd>Obsidian new<cr>", desc = "Obsidian new note" },
    { "<leader>oo", "<cmd>Obsidian quick_switch<cr>", desc = "Obsidian open/switch note" },
    { "<leader>os", "<cmd>Obsidian search<cr>", desc = "Obsidian grep notes" },
    { "<leader>ot", "<cmd>Obsidian today<cr>", desc = "Obsidian daily note" },
    { "<leader>ob", "<cmd>Obsidian backlinks<cr>", desc = "Obsidian backlinks" },
    { "<leader>ol", "<cmd>Obsidian links<cr>", desc = "Obsidian links in buffer" },
    { "<leader>op", "<cmd>Obsidian paste_img<cr>", desc = "Obsidian paste image" },
    { "<leader>or", "<cmd>Obsidian rename<cr>", desc = "Obsidian rename note" },
  },
  ---@module 'obsidian'
  ---@type obsidian.config
  opts = {
    legacy_commands = false,
    workspaces = {
      { name = "obsidian", path = "~/obsidian" },
    },
    notes_subdir = "inbox",
    new_notes_location = "notes_subdir",
    daily_notes = { folder = "daily", date_format = "%Y-%m-%d", template = "daily.md" },
    templates = { folder = "templates" },
    picker = { name = "telescope.nvim" },
    -- readable filenames instead of the random ID-style ones
    note_id_func = function(title)
      if title ~= nil then
        return (title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower())
      end
      return tostring(os.time())
    end,
    ui = { enable = false }, -- render-markdown.nvim already handles rendering
  },
}
