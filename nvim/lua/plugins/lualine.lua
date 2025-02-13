local wakatime_result = ""
local Job = require('plenary.job')
local function get_wakatime()
  Job:new({
    command = "wakatime-cli",
    args = { "--today" },
    on_exit = function(job)
      wakatime_result = table.concat(job:result(), " ") or ""
    end,
  }):start()
end
local wakatime_interval = 1
vim.loop.new_timer():start(0, wakatime_interval * 60 * 1000, vim.schedule_wrap(get_wakatime))

return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'nvim-lua/plenary.nvim'
  },
  config = function()
    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''},
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
        lualine_a = {
          'mode',
          {
            function()
              local filetype = vim.bo.filetype
              local icon = require'nvim-web-devicons'.get_icon_by_filetype(filetype)
              return icon .. ' ' .. vim.fn.expand('%:t')
            end,
          }
        },
        lualine_b = {
          {
            'diff',
            colored = true,
            diff_color = {
              added = { fg = '#98c379' },
              modified = { fg = '#e5c07b' },
              removed = { fg = '#e06c75' },
            }
          },
          'diagnostics'
        },
        lualine_c = {
          {
            function()
              return wakatime_result
            end,
            icon = "󱑆",
          }
        },
        lualine_x = {'fileformat'},  -- Removed 'encoding'
        lualine_y = {'progress'},
        lualine_z = {
          'branch',  -- Added git branch here
          'location', 
          {
            'clock', 
            color = {fg = '#ffffff', bg = '#000000'}, 
            separator = ' | ', 
            fmt = function() return os.date('%H:%M:%S') end
          }
        },
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
