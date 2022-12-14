local present, alpha = pcall(require, "alpha")

if not present then
  return
end

local function button(sc, txt, keybind)
  local sc_ = sc:gsub("%s", ""):gsub("SPC", "<leader>")

  local opts = {
    position = "center",
    text = txt,
    shortcut = sc,
    cursor = 5,
    width = 36,
    align_shortcut = "right",
    hl = "AlphaButtons",
  }

  if keybind then
    opts.keymap = { "n", sc_, keybind, { noremap = true, silent = true } }
  end

  return {
    type = "button",
    val = txt,
    on_press = function()
      local key = vim.api.nvim_replace_termcodes(sc_, true, false, true) or ""
      vim.api.nvim_feedkeys(key, "normal", false)
    end,
    opts = opts,
  }
end

-- dynamic header padding
local fn = vim.fn
local marginTopPercent = 0.3
local headerPadding = fn.max { 2, fn.floor(fn.winheight(0) * marginTopPercent) }

local options = {

  header = {
    type = "text",
    val = {
      "    ______           ______            __           _    ___         ",
      "  / ____/________ _/ __/ /_____  ____/ /___  ____ | |  / (_)___ ___ ",
      " / /   / ___/ __ `/ /_/ __/_  / / __  / __ \\/ __ `/ | / / / __ `__ \\",
      "/ /___/ /  / /_/ / __/ /_  / /_/ /_/ / /_/ / /_/ /| |/ / / / / / / /",
      "\\____/_/   \\__,_/_/  \\__/ /___/\\__,_/\\____/\\__, / |___/_/_/ /_/ /_/ ",
      "                                          /____/                         ",
    },
    opts = {
      position = "center",
      hl = "AlphaHeader",
    },
  },

  buttons = {
    type = "group",
    val = {
      button("sf", "  File Browser to path  ", ""),
      button(";f", "  File All Browser  ", ""),
      button(";r", "  Live Grep  ", ""),
      button("Control s", "  Save File  ", ""),
      button("Control q", "  Quit File  ", ""),
      button("Control n", "  Tree Directory  ", ""),
      button("Control w  o", "  Zen Mode  ", ""),
    },
    opts = {
      spacing = 1,
    },
  },

  headerPaddingTop = { type = "padding", val = headerPadding },
  headerPaddingBottom = { type = "padding", val = 2 },
}

-- options = require("core.utils").load_override(options, "goolord/alpha-nvim")

alpha.setup {
  layout = {
    options.headerPaddingTop,
    options.header,
    options.headerPaddingBottom,
    options.buttons,
  },
  opts = {},
}

-- Disable statusline in dashboard
vim.api.nvim_create_autocmd("FileType", {
  pattern = "alpha",
  callback = function()
    -- store current statusline value and use that
    local old_laststatus = vim.opt.laststatus
    vim.api.nvim_create_autocmd("BufUnload", {
      buffer = 0,
      callback = function()
        vim.opt.laststatus = old_laststatus
      end,
    })
    vim.opt.laststatus = 0
  end,
})
