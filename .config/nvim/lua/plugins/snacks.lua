-- snacks.nvim: show dotfiles and gitignored files in the explorer and file pickers, preview images in the terminal
return {
  {
    "folke/snacks.nvim",
    opts = {
      image = {
        enabled = true,
        formats = { "png", "jpg", "jpeg", "gif", "bmp", "webp", "tiff", "heic", "avif" },
      },
      picker = {
        sources = {
          explorer = { hidden = true, ignored = true },
          files = { hidden = true, ignored = true },
        },
      },
    },
  },
}
