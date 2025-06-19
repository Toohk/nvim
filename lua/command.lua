local function load_project_config()
	local config_path = vim.fn.getcwd() .. "/project.lua"

	if vim.fn.filereadable(config_path) == 1 then
		local chunk, err = loadfile(config_path)
		if chunk then
			local commands = chunk() -- Exécute le fichier et récupère la table
			if type(commands) == "table" then
				return commands
			end
		else
			print("Erreur lors du chargement de project.lua: " .. err)
		end
	end

	return {} -- Retourne une table vide si erreur
end

vim.api.nvim_create_user_command("CompileRunMain", function()
	local commands = load_project_config()

	-- Utiliser la commande définie dans project.lua si elle existe
	if commands.build then
		vim.cmd("w")
		vim.cmd("!" .. commands.build)
		if commands.run then
			vim.cmd("!" .. commands.run)
		end
	else
		-- Si project.lua n'est pas défini, utiliser la compilation classique
		local current_file = vim.fn.expand("%")
		local output = "output"

		if current_file:match("%.cpp$") then
			vim.cmd("w")
			vim.cmd("!g++ " .. current_file .. " -o " .. output .. " && ./" .. output)
		elseif current_file:match("%.c$") then
			vim.cmd("w")
			vim.cmd("!gcc " .. current_file .. " -o " .. output .. " && ./" .. output)
		else
			print("Ce fichier n'est ni un fichier C ni un fichier C++ !")
		end
	end
end, {})

vim.api.nvim_create_user_command("RunMain", function()
	local commands = load_project_config()

	if commands.run then
		vim.cmd("terminal " .. commands.run)
	else
		vim.cmd("terminal ./output")
	end
	vim.cmd("startinsert")
end, {})
