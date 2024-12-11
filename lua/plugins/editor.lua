return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-file-browser.nvim",
      "nvim-lua/plenary.nvim"
    },
    keys = function()
      return {
        { ";f", "<cmd>Telescope find_files<cr>",                                 desc = "Find Files" },
        { ";r", "<cmd>Telescope live_grep<cr>",                                  desc = "Live Grep" },
        { ";b", "<cmd>Telescope buffers<cr>",                                    desc = "Buffers list" },
        { "sf", "<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>", desc = "File Browser" },
      }
    end,
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = { prompt_position = "top" },
        sorting_strategy = "ascending",
        winblend = 0,
      }
    },
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
    config = function()
      local actions = require("telescope.actions")
      local fb_actions = require("telescope").extensions.file_browser.actions
      require("telescope").setup {
        extensions = {
          file_browser = {
            theme = "dropdown",
            -- initial_mode = "normal",
            previewer = false,
            hijack_netrw = false,
            mappings = {
              ["n"] = {
                ["N"] = fb_actions.create,
                ["h"] = fb_actions.goto_parent_dir,
                ["H"] = fb_actions.goto_home_dir,
                ["/"] = function()
                  vim.cmd("startinsert")
                end,
                ["<C-u>"] = function(prompt_bufnr)
                  for i = 1, 10 do
                    actions.move_selection_previous(prompt_bufnr)
                  end
                end,
                ["<C-d>"] = function(prompt_bufnr)
                  for i = 1, 10 do
                    actions.move_selection_next(prompt_bufnr)
                  end
                end,
                ["<PageUp>"] = actions.preview_scrolling_up,
                ["<PageDown>"] = actions.preview_scrolling_down,
              },
            },
          },
        },
      }
      require("telescope").load_extension "file_browser"
    end
  }
}
