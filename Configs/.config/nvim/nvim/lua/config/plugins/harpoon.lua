-- List of favorite files/marks per project
-- Harpoon 2 configuration
return {
	-- https://github.com/ThePrimeagen/harpoon
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	event = "VeryLazy",
	dependencies = {
		-- https://github.com/nvim-lua/plenary.nvim
		"nvim-lua/plenary.nvim",
	},
	opts = {
		settings = {
			save_on_toggle = false, -- evita erro com Neo-tree
			sync_on_ui_close = false,
		},
		menu = {
			width = 80, -- podes ajustar
			height = 35, -- podes ajustar
			borderchars = "rounded",
			preview = true, -- 👈 ativa preview do ficheiro selecionado
		},
	},
	config = function(_, opts)
		local harpoon = require("harpoon")

		-- Inicializa o Harpoon com as tuas opções
		harpoon:setup(opts)

		-- Atalhos
		vim.keymap.set("n", "<leader>ha", function()
			harpoon:list():add()
		end, { desc = "Add file to Harpoon" })

		vim.keymap.set("n", "<leader>hf", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Open harpoon window" })

		-- Navegação rápida entre os ficheiros marcados
		for i = 1, 9 do
			vim.keymap.set("n", "<leader>h" .. i, function()
				harpoon:list():select(i)
			end, { desc = "Go to Harpoon file " .. i })
		end
	end,
}
