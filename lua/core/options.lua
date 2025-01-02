local options = {
	number = true,
	numberwidth = 2,
        cursorline = true,
}
for k, v in pairs(options) do
   vim.opt[k] = v
end
