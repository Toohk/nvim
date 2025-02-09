vim.api.nvim_create_user_command("RunMain", function()
    local c_file = "main.c"
    local cpp_file = "main.cpp"
    local output = "main"

    if vim.fn.filereadable(cpp_file) == 1 then
        vim.cmd("w")
        vim.cmd("!g++ " .. cpp_file .. " -o " .. output .. " && ./" .. output)
    elseif vim.fn.filereadable(c_file) == 1 then
        vim.cmd("w")
        vim.cmd("!gcc " .. c_file .. " -o " .. output .. " && ./" .. output)
    else
        print("Aucun fichier main.c ou main.cpp trouvé !")
    end
end, {})

