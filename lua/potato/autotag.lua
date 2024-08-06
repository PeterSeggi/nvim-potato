local status, tags = pcall(require, "nvim-ts-autotag")
if not status then
    print("Something went wrong requiring autotags")
    return
end
