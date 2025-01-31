return {
  "ficcdaf/ashen.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("ashen").setup({
      --transparent = true, -- Enable transparent background
			terminal = {
				enabled = true, -- Enable terminal colors
				colors = {},
			},
    })
    vim.cmd("colorscheme ashen") -- Apply the colorscheme
  end,
}
