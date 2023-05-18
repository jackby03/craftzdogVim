local status, hop = pcall(require, "hop")
if (not status) then return end


hop.setup()
vim.keymap.set('', '<Leader>s', '<Cmd>HopChar2<CR>')
