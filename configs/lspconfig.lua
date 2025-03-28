local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "tsserver", "clangd", "pyright", "terraformls" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

-- Solargraph configuration for Rails
lspconfig.solargraph.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  settings = {
    solargraph = {
      diagnostics = true,
      completion = true,
      useBundler = true, -- Use bundle exec solargraph for better Rails support
      formatting = true,
      folding = true,
      checkGemVersion = true,
      definitions = true,
      symbols = true,
      references = true,
      hover = true,
    },
  },
  flags = {
    debounce_text_changes = 150,
  },
}

--
-- lspconfig.pyright.setup { blabla}
