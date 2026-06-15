require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "LSP code action" })

map("n", "<leader>ef", function()
  local command = vim.api.nvim_buf_get_commands(0, {}).LspEslintFixAll and "LspEslintFixAll"
    or vim.api.nvim_buf_get_commands(0, {}).EslintFixAll and "EslintFixAll"

  if command then
    vim.cmd(command)
  else
    vim.notify("ESLint LSP is not attached to this buffer", vim.log.levels.WARN)
  end
end, { desc = "ESLint fix all" })

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
