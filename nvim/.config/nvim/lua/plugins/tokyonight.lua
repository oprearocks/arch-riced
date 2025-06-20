-- plugins/tokyonight.lua
return {
  "folke/tokyonight.nvim",
  config = function()
    require("tokyonight").setup({
      style = "storm",
      transparent = false,
    })
    vim.cmd([[colorscheme tokyonight]])
  end,
}
