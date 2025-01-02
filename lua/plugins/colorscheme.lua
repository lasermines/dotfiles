return {
  "wnkz/monoglow.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    local colors = {
      gold = "#FFD700",
      pink = "#FF69B4",
      redOrange = "#FF4500",
      dimBackground = "#3B3B3B"
    }
    require("monoglow").setup({
      on_highlights = function(hl, c)
	-- punctuation
	hl["@punctuation.delimiter"] = { fg = colors.pink }
	hl["@punctuation.bracket"] = { fg = colors.pink }
	hl["@punctuation.special"] = { fg = colors.pink }
        -- Customize line numbers
        --hl.LineNr = { fg = colors.pink }  -- Pink for line numbers
        hl.CursorLineNr = { fg = colors.pink, bold = true }  -- Bold gold for the current line number
        hl.MatchParen = { fg = colors.redOrange, bold = true }  -- Bold red-orange for matching parentheses
        -- Customize vertical and horizontal cursor lines
        hl.CursorLine = { bg = colors.dimBackground }  -- Dim background for cursor line
      end,
      on_colors = function(hlColors)
        hlColors.glow = colors.pink -- Gold for glow effect
      end
    })
    vim.cmd([[colorscheme monoglow]])
  end
}
