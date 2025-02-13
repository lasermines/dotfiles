local options = {
    number = true,
    relativenumber = true,
    --background = "dark",
    autoindent = true,
    termguicolors = true,
    numberwidth = 2,
    cursorline = true,
    signcolumn = "yes",
    list = true,
    --listchars = { eol = "↲", space = "·", },
}
for k, v in pairs(options) do
   vim.opt[k] = v
end
