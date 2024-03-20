return {
  "nvim-tree/nvim-tree.lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local nvimtree = require("nvim-tree")
    local colors = require('dracula').colors()

    -- recommended settings from nvim-tree documentation
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    vim.cmd("highlight NvimTreeIndentMarker guifg=" .. colors.fg)

    nvimtree.setup({
      update_focused_file = {
        enable = true,
        update_cwd = true,
      },
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
        },
      },
      diagnostics = {
        enable = true,
      },
      view = {
        width = 45,
        signcolumn = "yes",
      },
      renderer = {
        highlight_git = true,
        icons = {
          diagnostics_placement = "after",
          git_placement = "signcolumn",
          show = {
            git = true,
          },
          glyphs = {
            git = {
              unstaged = "U",
              staged = "A",
              unmerged = "M",
              renamed = "R",
              deleted = "R",
              untracked = "?",
              ignored = "!",
            },
          },
        },
      },
      filters = {
        custom = { ".DS_Store" },
      },
      git = {
        ignore = false,
        enable = true,
      },
    })

    local keymap = vim.keymap

    keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" }) -- toggle file explorer
    keymap.set("n", "<leader>ef", "<cmd>NvimTreeFindFileToggle<CR>", { desc = "Toggle file explorer on current file" }) -- toggle file explorer on current file
    keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" }) -- collapse file explorer
    keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" }) -- refresh file explorer
  end,
}
