local M = {}

vim.opt.clipboard:append { 'unnamedplus' }

execution_status = 1
local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local fn = vim.fn
local installed_dependencies = function(str)
  if fn.executable(str) == 0 then
    fn.system({ 'npm', 'install', '-g', str })
  end
end

M.echo = function(str)
  vim.cmd("redraw")
  vim.api.nvim_echo({ { str, "Bold" } }, true, {})
end

local ensure_packer = function()
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd("packadd packer.nvim")
    M.echo("  Installing Packer.nvim & plugins 💁...")
    installed_dependencies('typescript-language-server')
    installed_dependencies('emmet-ls')
    installed_dependencies('@tailwindcss/language-server')
    installed_dependencies('flow-bin')
    M.echo("  Installing dependencies via npm, wait please 🙏")
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require('plugins')

M.echo("Welcome 🥳 friendly penguin 🐧")

if execution_status == 1 then
  if packer_bootstrap then
    require('packer').sync()
    execution_status = execution_status - 1
  end
end

return M
