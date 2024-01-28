return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  opts = {
    options = {
      mode = "tabs",
      separator_style = "slant",

      offsets = {
        {
          filetype = "nvim-tree",
          text = "File Explorer",
          text_align = "center",
          separator = true,
        },
      },
    },
  },
}
