return {
	'nvim-lualine/lualine.nvim',
	dependencies = {
		'nvim-tree/nvim-web-devicons'
	},
	config = function()
		require('lualine').setup {
			options = {
				icons_enabled = true,
				theme = 'auto',
				component_separators = { left = '', right = ''},
				section_separators = { left = '', right = ''},
				disabled_filetypes = {
					statusline = {},
					winbar = {},
				},
				ignore_focus = {},
				always_divide_middle = true,
				always_show_tabline = true,
				globalstatus = false,
				refresh = {
					statusline = 100,
					tabline = 100,
					winbar = 100,
				}
			},
			sections = {
				lualine_a = {'mode'},
				lualine_b = {
          'branch',
          {
            'diff',
            colored = true,
            diff_color = {
              added = { fg = '#98c379' },    -- bright green
              modified = { fg = '#e5c07b' }, -- bright yellow  
              removed = { fg = '#e06c75' },  -- bright red
            }
          },
          'diagnostics'
        },
        lualine_c = {
		 {
		   function()
		     local filetype = vim.bo.filetype
		     local icon = require'nvim-web-devicons'.get_icon_by_filetype(filetype)
		     return icon .. ' ' .. vim.fn.expand('%:t')
		   end,
		 }
		},
	lualine_x = {'encoding', 'fileformat' , 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location', {'clock', color = {fg = '#ffffff', bg = '#000000'}, separator = ' | ', fmt = function() return os.date('%H:%M:%S') end}},
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {'filename'},
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {}
    }
  end
}
