local keymap = vim.keymap

vim.g.mapleader = " "

keymap.set('n', 'x', '"_x')

-- Increment/decrement
keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')

-- Delete a word backwards
keymap.set('n', 'dw', 'vb"_d')

-- Select all
keymap.set('n', '<C-a>', 'gg<S-v>G')

-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

-- Tab
keymap.set('n', 'te', ':tabedit')
keymap.set('n', 'tt', ':tabnew<CR>')
keymap.set('n', 'tn', ':tabnext<CR>')
keymap.set('n', 'tp', ':tabprevious<CR>')

-- Buffer
keymap.set('n', '[', ':bprevious<CR><Space>')
keymap.set('n', ']', ':bnext<CR><Space>')

-- Split window
keymap.set('n', 'ss', ':split<Return><C-w>w')
keymap.set('n', 'sv', ':vsplit<Return><C-w>w')

-- Move window
--keymap.set('n', '<Space>', '<C-w>w')
keymap.set('', '<C-h>', '<C-w>h')
keymap.set('', '<C-k>', '<C-w>k')
keymap.set('', '<C-j>', '<C-w>j')
keymap.set('', '<C-l>', '<C-w>l')

-- Resize window
keymap.set('n', '<C-w><left>', '<C-w><')
keymap.set('n', '<C-w><right>', '<C-w>>')
keymap.set('n', '<C-w><down>', '<C-w>+')
keymap.set('n', '<C-w><up>', '<C-w>-')

-- Save
keymap.set('', '<C-s>', ':w!<CR>')
keymap.set('', '<Leader>w', ':w!<CR>')

-- Quit
keymap.set('', '<C-q>', ':q!<CR>')
keymap.set('', '<Leader>q', ':q!<CR>')

-- visual block
keymap.set('', '<Leader>v', '<C-v>')
