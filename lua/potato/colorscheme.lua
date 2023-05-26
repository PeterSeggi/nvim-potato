local colorscheme = "kanagawa-dragon"

local status_ok, call = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
    vim.notify("Colorscheme " .. colorscheme .. " not found! Maybe its missing from the packer.lua file...")
    return
end
