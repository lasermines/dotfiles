return {
  -- LSP plugins
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      -- Setup Mason (LSP installer)
      require("mason").setup()

      -- Setup Mason LSP Config (bridge between Mason and lspconfig)
      require("mason-lspconfig").setup({
        -- List of LSP servers to automatically install (optional)
        ensure_installed = { "pyright", "lua_ls" }, -- Add your desired LSP servers here
      })

      -- Automatically set up all installed LSP servers
      require("mason-lspconfig").setup_handlers({
        function(server_name)
          local opts = {}
          -- Customize specific LSP server configurations
          if server_name == "pyright" then
            opts.settings = {
              python = {
                analysis = {
                  typeCheckingMode = "standard", -- Set type checking mode for Pyright
                  autoImportCompletions = true,  -- Enable auto import completions
                  autoSearchPaths = true,        -- Automatically add common Python paths
                },
              },
            }
          elseif server_name == "lua_ls" then
            opts.settings = {
              Lua = {
                runtime = {
                  version = "LuaJIT", -- Use LuaJIT as the runtime
                },
                diagnostics = {
                  globals = { "vim" }, -- Recognize `vim` as a global
                },
                workspace = {
                  library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true, -- Add Neovim runtime files to workspace
                    [vim.fn.stdpath("config") .. "/lua"] = true, -- Add your custom Lua files to workspace
                  },
                },
                telemetry = {
                  enable = false, -- Disable telemetry
                },
              },
            }
          end
          require("lspconfig")[server_name].setup(opts)
        end,
      })
    end,
  },
}
