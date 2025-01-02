return {
	"folke/zen-mode.nvim",
	config = function ()
		require("zen-mode").setup {
			window = {
				backdrop = 1,
				width = 120,
				height = 1,
				options = {
					signcolumn = "no",
					number = true,
					relativenumber = false,
					cursorline = true,
					cursorcolumn = false,
					foldcolumn = "0",
					list = false,
					winhighlight = "Normal:Normal,SignColumn:Normal",
					colorcolumn = "120",
				},
			}
		}
	end
}
