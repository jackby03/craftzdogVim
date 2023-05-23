local status, flutter_tools = pcall(require, "flutter-tools")
if not status then return end

local capabilities = require('cmp_nvim_lsp').default_capabilities()
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
end
flutter_tools.setup {
  -- flutter_path = '/usr/local/bin/flutter',
  ui = {
    border = "rounded",
    notification_style = "native"
  },
  widget_guides = {
    enabled = true,
  },
  closing_tags = {
    -- highlight = "ErrorMsg",
    prefix = "<=",
    enable = true
  },
  dev_log = {
    enable = true,
    notify_errors = false,
    open_cmd = "tabedit"
  },
  dev_tools = {
    autostart = false,
    auto_open_browser = true,
  },
  lsp = {
    color = {
      enable = true,
      background = true,
      -- background_color = { r = 2, g = 17, b = 24 },
      background_color = nil,
      foreground = true,
      virtual_text = true,
      virtual_text_str = "■",
    },
  },
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    showTodos = true,
    completeFunctionCalls = true,
    renameFilesWithClases = "propmt",
    enableSnippets = true,
    updateImportOnRename = true,
  }
}

local keymap_set = vim.keymap.set
keymap_set('n', 'ff', ':Telescope flutter commands<CR>')
