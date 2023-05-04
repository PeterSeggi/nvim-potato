local status, buff = pcall(require, "bufferline")
if not status then
    print("Something went wrong requiring bufferline")
    return
end



buff.setup({
    options = {
        hover = {
            enabled = true,
            delay = 20,
            reveal = {'close'}
        },

        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                highlight = "Directory",
                separator = true -- use a "true" to enable the default, or set your own character
            }
        }

    },

})
