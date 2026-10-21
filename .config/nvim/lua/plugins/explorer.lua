-- Show dotfiles by default in the explorer and file pickers (gitignored files stay hidden; toggle with I)
return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          explorer = { hidden = true },
          files = { hidden = true },
        },
      },
    },
  },
}
