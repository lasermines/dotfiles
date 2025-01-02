return {
  "wnkz/monoglow.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("monoglow").setup({
      on_highlights = function(hl, c)
        -- Customize boolean colors
        hl.Boolean = { fg = "#a38a45" }  -- Example: orange color for booleans
        -- Customize line numbers
        hl.LineNr = { fg = "#848884" }  -- Example: gray color for line numbers
        hl.CursorLineNr = { fg = "#a38a45", bold = true }  -- Example: gold color for the current line number
        -- Customize vertical and horizontal cursor lines
        --hl.CursorColumn = { bg = "#2a2a2a" } -- Example: dim background for cursor column
        --hl.CursorLine = { bg = "#1e1e1e" }  -- Example: dim background for cursor line
      end,
      on_colors = function(colors)
        colors.glow = "#8B4513" -- Example glow color (=)
      end
    })
    vim.cmd([[colorscheme monoglow]])
  end
}
