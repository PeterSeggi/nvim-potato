local status, ascii = pcall(require, "preview-asciidoc")
if not status then
    print("Something went wrong when importing asciidoctor")
    return
end
