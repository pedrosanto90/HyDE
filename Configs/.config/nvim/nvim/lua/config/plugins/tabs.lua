return {
	"romgrk/barbar.nvim",
	dependencies = {
		"lewis6991/gitsigns.nvim", -- optional: git status indicators in the tabline
		"nvim-tree/nvim-web-devicons", -- optional: file icons
	},
	init = function()
		-- disable barbar's auto-setup because lazy.nvim handles setup via opts
		vim.g.barbar_auto_setup = false
	end,
	opts = {
		-- put custom barbar options here; defaults are used when omitted
		-- example: animation = true,
	},
	version = "^1.0.0", -- only update on 1.x releases
}
