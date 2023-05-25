M = {}


M.echo = function(str)
  vim.cmd("redraw")
  vim.api.nvim_echo({ { str, "Bold" } }, true, {})
end


local fn = vim.fn

local compilers_installed = function(str)
  if fn.executable(str) == 0 then
    M.echo("Need to install  ", str, " 🙏")
  end
end

compilers_installed('gcc')
compilers_installed('node')

local installed_dependencies = function(str)
  if fn.executable(str) == 0 then
    fn.system({ 'npm', 'install', '-g', str })
  end
end

installed_dependencies('typescript-language-server')
installed_dependencies('emmet-ls')
installed_dependencies('@tailwindcss/language-server')
installed_dependencies('flow-bin')
M.echo("  Installing dependencies via npm, wait please 🙏")
