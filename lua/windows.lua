vim.opt.clipboard:prepend { 'unnamed', 'unnamedplus' }

local packer_path = vim.fn.stdpath('data') .. " $env:LOCALAPPDATA\\nvim-data\\site\\pack\\packer\\start\\packer.nvim"

if vim.fn.empty(vim.fn.glob(packer_path)) > 0 then
  require('plugins')
else
  vim.cmd(
    '!git clone https://github.com/wbthomas/packer.nvim ' .. packer_path)
  print("Packer Installed")
  require('plugins')
  print("Loaded Plugins")
  vim.cmd("autocmd VimEnter * PackerSync")
  print("Downloading Packages")
end
