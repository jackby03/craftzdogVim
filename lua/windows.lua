local M = {}

vim.opt.clipboard:append { 'unnamedplus' }

local EXECUTION_STATUS = 1
local install_path = vim.fn.stdpath('data') .. "/site/pack/packer/start/packer.nvim"
-- local install_path = vim.fn.stdpath('data') .. " $env:LOCALAPPDATA\\nvim-data\\site\\pack\\packer\\start\\packer.nvim"
local fn = vim.fn


M.echo = function(str)
  vim.cmd("redraw")
  vim.api.nvim_echo({ { str, "Bold" } }, true, {})
end

local ensure_packer = function()
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd("packadd packer.nvim")
    M.echo("  Installing Packer.nvim & plugins 💁...")
    require('dependencies')
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require('plugins')

M.echo("Welcome 🥳 gamer friend 🕹️")

if EXECUTION_STATUS == 1 then
  if packer_bootstrap then
    require('packer').sync()
    EXECUTION_STATUS = EXECUTION_STATUS - 1
  end
end

return M
