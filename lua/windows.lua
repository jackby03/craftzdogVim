local M = {}

vim.opt.clipboard:append { 'unnamedplus' }

EXECUTION_STATUS = 1
local install_path = vim.fn.stdpath('data') .. " $env:LOCALAPPDATA\\nvim-data\\site\\pack\\packer\\start\\packer.nvim"
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

M.echo("Welcome 🥳 gamer friend 🕹️")

if execution_status == 1 then
  if packer_bootstrap then
    require('packer').sync()
    EXECUTION_STATUS = execution_status - 1
  end
end

return M
