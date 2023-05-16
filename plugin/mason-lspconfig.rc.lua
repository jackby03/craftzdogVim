local status, nvim_mason_lsp = pcall(require, 'mason-lspconfig')
if (not status) then return end

nvim_mason_lsp.setup({
  automatic_installation = true,
})

require('mason-tool-installer').setup {

  ensure_installed = {
    "prettierd",
    "eslint_d",
    "diagnostic-languageserver",
    "json-lsp",
    "lua-language-server",
    "stylua",
    "typescript-language-server",
  },

  auto_update = false,

  run_on_start = true,

  start_delay = 3000, -- 3 second delay
}
