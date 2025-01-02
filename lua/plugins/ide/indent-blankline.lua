return {
	"lukas-reineke/indent-blankline.nvim",
	config = function()
		require("ibl").setup {
			exclude = { filetypes = { "dashboard" } },
			indent = { char = "▏", tab_char = "▎"},
			whitespace = { highlight = { "Whitespace" } },
			scope = { enabled = false },
		}
	end,
}
