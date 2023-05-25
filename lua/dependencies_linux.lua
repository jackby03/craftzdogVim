M = {}

local fn = vim.fn
local installed_dependencies = function(str)
  if fn.executable(str) == 0 then
    fn.system({ 'npm', 'install', '-g', str })
  end
end

installed_dependencies('typescript-language-server')
installed_dependencies('emmet-ls')
installed_dependencies('@tailwindcss/language-server')
installed_dependencies('flow-bin')
--M.echo("  Installing dependencies via npm, wait please 🙏")
