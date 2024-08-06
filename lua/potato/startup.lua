local status, startup = pcall(require, "startup")
if not status then
    print("Something went wrong with the startup plugin")
    return
end

startup.setup({theme = "dashboard"})
