local null_ls = require "null-ls"

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  b.formatting.prettier,

  -- Lua
  b.formatting.stylua,

  -- cpp
  b.formatting.clang_format,

  -- python
  b.diagnostics.mypy,
  b.diagnostics.ruff,

  -- terraform
  b.diagnostics.tflint,
}

null_ls.setup {
  debug = true,
  sources = sources,
}
