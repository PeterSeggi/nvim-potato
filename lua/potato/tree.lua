local status, tree = pcall(require, "nvim-tree")
if not status then
    print("Something went wrong importing nvim-tree")
    return
end

tree.setup()
