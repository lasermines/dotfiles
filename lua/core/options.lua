local options = {
    number = true,
    numberwidth = 2,
    cursorline = true,
    list = true,
    listchars = { eol = "↲", space = "·", },
}
for k, v in pairs(options) do
   vim.opt[k] = v
end
