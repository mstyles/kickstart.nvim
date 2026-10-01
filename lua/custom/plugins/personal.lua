-- Personal plugins. Loaded by the loader in lua/custom/plugins/init.lua, which
-- requires every other file in this directory (order unspecified), so keep
-- plugins that depend on each other in this one file.
local function gh(repo) return 'https://github.com/' .. repo end

vim.pack.add {
  gh 'ruanyl/vim-gh-line',
  gh 'nvim-lua/plenary.nvim',
  gh 'NeogitOrg/neogit', -- formerly TimUntersberger/neogit
  gh 'tpope/vim-fugitive', -- Use both fugitive and neogit while I evaluate neogit
  gh 'kdheepak/tabline.nvim',
  gh 'numToStr/Comment.nvim',
  gh 'sindrets/diffview.nvim',
}

require('tabline').setup {}
vim.cmd [[
  set guioptions-=e " Use showtabline in gui vim
  set sessionoptions+=tabpages,globals " store tabpages and globals in session
]]

require('Comment').setup {
  ---LHS of operator-pending mappings in NORMAL and VISUAL mode
  opleader = {
    ---Line-comment keymap
    line = '<C-c>',
  },
}

vim.pack.add { gh 'MeanderingProgrammer/render-markdown.nvim' }

require('render-markdown').setup {
  completions = { lsp = { enabled = true } }, -- checkbox/callout completions via LSP
}
vim.keymap.set('n', '<leader>tm', '<cmd>RenderMarkdown buf_toggle<cr>', { desc = '[T]oggle [M]arkdown rendering' })
