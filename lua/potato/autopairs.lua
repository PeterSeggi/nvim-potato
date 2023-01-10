local status, npairs = pcall(require, "nvim-autopairs")
if not status then
    print("Something went wrong requiring nvim autopairs")
    return
end

npairs.setup({
    disable_filetype = { "TelescopePrompt", "vim" },
    --enable_check_bracket_line = false,
    fast_wrap = {
        map = '<C-p>',
        chars = { '{', '[', '(', '"', "'" },
        pattern = [=[[%'%"%)%>%]%)%}%,]]=],
        end_key = '/',
        keys = 'qwertyuiopzxcvbnmasdfghjkl',
        check_comma = true,
        highlight = 'Search',
        highlight_grey = 'Comment'
    },
})

local cmp_autopairs = require('nvim-autopairs.completion.cmp')
local status_cmp, cmp = pcall(require, 'cmp')
if not status_cmp then
    print("Something went wrong inside autopairs trying to require cmp")
    return
end

cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done()
)
