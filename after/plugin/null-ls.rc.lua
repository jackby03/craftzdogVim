local status, null_ls = pcall(require, "null-ls")
if (not status) then return end

null_ls.setup {
  source = {
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.prettierd,
    null_ls.builtins.diagnostics.eslint_d.with({
      diagnostics_format = '[eslint] #{m}\n(#{c})'
    }),
  }
}
