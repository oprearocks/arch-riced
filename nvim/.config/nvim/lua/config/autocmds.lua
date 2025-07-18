-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")
vim.api.nvim_create_autocmd("FileType", {
  pattern = "ejs",
  callback = function()
    vim.cmd("syntax include @htmlSyntax syntax/html.vim")
    vim.cmd("syntax region ejsTemplate start=+<%+ end=+%>+ contains=ALL")
    vim.cmd("syntax region ejsOutput start=+<%=+ end=+%>+ contains=ALL")
    vim.cmd("syntax region ejsHTML start=+^+ end=+$+ contains=@htmlSyntax")
    vim.cmd("setlocal syntax=html")
  end,
})
