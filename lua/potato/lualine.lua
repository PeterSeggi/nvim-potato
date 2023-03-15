local status, line = pcall(require, "lualine")
if not status then
    print("Something went wrong with lualine")
    return
end

line.setup{
    options = {theme = 'onedark'}
}
