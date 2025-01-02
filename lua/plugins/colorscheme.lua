--  https://github.com/wnkz/monoglow.nvim/blob/21a304005579388504f0a07d80c4f7c209ae7bc1/lua/monoglow/groups/treesitter.lua#L37
return {
  "wnkz/monoglow.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    local colors = {
      gold = "#FFD700",
      red = "#ff8d8d",
      blue = "#5d89ba",
      redOrange = "#FF4500",
      dimBackground = "#3B3B3B",
      pewter = "#899499",
    }
    require("monoglow").setup({
      on_highlights = function(hl, c)
	-- change comment colors
	hl.Comment = { fg = colors.pewter, italic = true }


        -- syntax colors 
--      hl["@punctuation.delimiter"] = { fg = colors.blue }
--      hl["@punctuation.bracket"] = { fg = colors.blue }
--	hl["@punctuation.special"] = { fg = colors.red }
--	
	hl.Boolean = { fg = colors.red }
	
	hl["@function.call"] = { fg = colors.red }
	hl["@function"] = { fg = colors.red }
	hl["@function.builtin"] = { fg = colors.red }
	
	hl["@variable"] = { fg = colors.blue }
	hl["@variable.builtin"] = { fg = colors.blue }
	hl["@parameter"] = { fg = colors.blue }

        -- Customize line numbers
        --hl.LineNr = { fg = colors.red }  -- Pink for line numbers
        hl.CursorLineNr = { fg = colors.red, bold = true }  -- Bold gold for the current line number

        -- Match parens
        hl.MatchParen = { fg = colors.red, bold = true }  -- Bold red-orange for matching parentheses


        -- Customize vertical and horizontal cursor lines
        hl.CursorLine = { bg = colors.dimBackground }  -- Dim background for cursor line


      end,

      on_colors = function(hlColors)
        hlColors.glow = colors.red -- Gold for glow effect
      end


    })
    vim.cmd([[colorscheme monoglow]])
  end
}
