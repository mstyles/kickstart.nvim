-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
  'mileszs/ack.vim',
  'ruanyl/vim-gh-line',
  {
    'TimUntersberger/neogit',
    dependencies = { { 'nvim-lua/plenary.nvim' } },
  },
  'tpope/vim-fugitive', -- Use both fugitive and neogit while I evaluate neogit
  'nvim-lualine/lualine.nvim',
  {
    'kdheepak/tabline.nvim',
    config = function()
      require('tabline').setup {}
      vim.cmd [[
        set guioptions-=e " Use showtabline in gui vim
        set sessionoptions+=tabpages,globals " store tabpages and globals in session
      ]]
    end,
    dependencies = { { 'hoob3rt/lualine.nvim', opt = true }, { 'kyazdani42/nvim-web-devicons', opt = true } },
  },
  {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup {
        ---LHS of operator-pending mappings in NORMAL and VISUAL mode
        opleader = {
          ---Line-comment keymap
          line = '<C-c>',
        },
      }
    end,
  },

  {
    'sindrets/diffview.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
  },
}
