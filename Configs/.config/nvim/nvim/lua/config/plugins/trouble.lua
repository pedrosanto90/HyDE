-- lua/plugins/trouble.lua
return {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = "Trouble",
  keys = {
    {
      "<leader>r",
      "<cmd>Trouble lsp_references toggle win.position=right<cr>",
      desc = "LSP References (Trouble)",
    },
  },
  opts = {
    focus = true,
    win = {
      type = "split",
      position = "right",
      size = 50, -- podes usar número (colunas) ou percentagem tipo 0.35
    },
  },
}
