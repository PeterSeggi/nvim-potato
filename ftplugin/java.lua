local status, jdt = pcall(require, "jdtls")
if not status then
    print("Something went wrong when importing jdtls")
    return
end

local config = {
    cmd = {'/home/linuxbrew/.linuxbrew/bin/jdtls'},
    root_dir = vim.fs.dirname(vim.fs.find({'gradlew', '.git', 'mvnw'}, { upward = true })[1]),
}
jdt.start_or_attach(config)
