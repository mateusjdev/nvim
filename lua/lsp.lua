local navic = require("nvim-navic")
local on_attach = function(client, bufnr)
  if client.server_capabilities.documentSymbolProvider then
    navic.attach(client, bufnr)
  end
end

-- LSP/clangd
vim.lsp.config.clangd = {
  cmd = { 'clangd', '--background-index' },
  root_markers = { 'compile_commands.json', 'compile_flags.txt' },
  filetypes = {
    "c", "h", "cpp", "objc", "objcpp", "cuda", "proto", "hpp"
  },
  on_attach = on_attach
}

-- LSP/luals
vim.lsp.config.luals = {
  cmd = { 'lua-language-server' },
  filetypes = { 'lua' },
  root_markers = { '.luarc.json', '.luarc.jsonc' },
  settings = {
    Lua = {
      diagnostics = {
        unusedLocalExclude = { "_*" }
      }
    }
  },
  on_attach = on_attach
}

-- LSP/gopls
vim.lsp.config.gopls = {
  cmd = { 'gopls' },
  filetypes = { 'go' },
  -- TODO: Reuse on_attach for all lsps
  on_attach = on_attach
}

-- Enable all listed LSPs
vim.lsp.enable({
  "clangd",
  "luals",
  "gopls"
})
