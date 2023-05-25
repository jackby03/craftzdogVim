local status, telescope = pcall(require, "telescope")
if (not status) then return end
local actions = require('telescope.actions')
local builtin = require("telescope.builtin")

local function telescope_buffer_dir()
  return vim.fn.expand('%:p:h')
end

local fb_actions = require "telescope".extensions.file_browser.actions

telescope.setup {
  defaults = {
    mappings = {
      n = {
        ["q"] = actions.close
      },
    },
  },
  extensions = {
    file_browser = {
      theme = "dropdown",
      -- disables netrw and use telescope-file-browser in its place
      hijack_netrw = true,
      mappings = {
        -- your custom insert mode mappings
        ["i"] = {
          ["<C-w>"] = function() vim.cmd('normal vbd') end,
        },
        ["n"] = {
          -- your custom normal mode mappings
          ["a"] = fb_actions.create,
          ["h"] = fb_actions.goto_parent_dir,
          ["d"] = fb_actions.remove,
          ["/"] = function()
            vim.cmd('startinsert')
          end
        },
      },
    },
  },
}

telescope.load_extension("file_browser")

local flutter_tools = pcall(require, "flutter-tools")
if flutter_tools then
  telescope.load_extension("flutter")
end

local keymap_set = vim.keymap.set

keymap_set('n', ';f',
  function()
    builtin.find_files({
      no_ignore = false,
      hidden = true
    })
  end)
keymap_set('n', ';l', ':Telescope<CR>')
keymap_set('n', ';r', function() builtin.live_grep() end)
keymap_set('n', '\\\\', function() builtin.buffers() end)
keymap_set('n', ';t', function() builtin.help_tags() end)
keymap_set('n', ';;', function() builtin.resume() end)
keymap_set('n', ';e', function() builtin.diagnostics() end)
keymap_set("n", "sf", function()
  telescope.extensions.file_browser.file_browser({
    path = "%:p:h",
    cwd = telescope_buffer_dir(),
    respect_gitignore = false,
    hidden = true,
    grouped = true,
    previewer = false,
    initial_mode = "normal",
    layout_config = { height = 40 }
  })
end)
keymap_set('n', ';k', function()
  builtin.keymaps()
end)
