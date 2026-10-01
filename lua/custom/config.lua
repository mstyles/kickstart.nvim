-- Personal options and keymaps, kept out of init.lua so merging upstream
-- kickstart changes rarely conflicts. Loaded from the custom section at the end
-- of init.lua, so it runs after upstream's defaults and overrides them.
-- (vim.g.have_nerd_font stays in init.lua: it must be set before mini.icons loads.)

vim.o.mouse = ''

-- Keep the OS clipboard independent. Upstream sets 'clipboard' in a
-- vim.schedule callback, so this one is scheduled too and runs after it.
vim.schedule(function() vim.o.clipboard = '' end)

vim.wo.wrap = false

vim.keymap.set('n', ';', ':')

-- Upstream maps <C-h/j/k/l> to window navigation; use <Tab> for windows and
-- <C-j>/<C-k> for buffers instead.
vim.keymap.del('n', '<C-h>')
vim.keymap.del('n', '<C-l>')
vim.keymap.set('n', '<Tab>', '<C-w><C-w>', { desc = 'Move focus to the next window' })

vim.keymap.set('n', '<C-j>', '<ESC>:bp<CR>', { desc = 'Previous buffer' })
vim.keymap.set('n', '<C-k>', '<ESC>:bn<CR>', { desc = 'Next buffer' })
vim.keymap.set('n', '<leader>c', '::bp |bd #<CR>', { desc = 'Close current buffer' })

vim.keymap.set('n', '<leader>v', ':e ~/.config/nvim/init.lua<CR>', { desc = 'Edit init.vim config' })

vim.keymap.set('n', '<leader>ru', ':! php %<CR>', { desc = 'run the thing' })
vim.keymap.set('n', '<leader>u', ':!docker compose exec api vendor/bin/phpunit %<CR>', { desc = 'run phpunit tests' })

vim.keymap.set('n', '<CR>', ':noh<CR><CR>:<backspace>', { desc = 'enter clears highlight' })

vim.keymap.set('v', '<leader>y', '"+y<CR>', { desc = 'yank to system clipboard' })
