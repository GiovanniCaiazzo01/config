local inlay_hints = {
  includeInlayParameterNameHints = "all",
  includeInlayParameterNameHintsWhenArgumentMatchesName = true,
  includeInlayFunctionParameterTypeHints = true,
  includeInlayVariableTypeHints = true,
  includeInlayFunctionLikeReturnTypeHints = true,
  includeInlayPropertyDeclarationTypeHints = true,
  includeInlayEnumMemberValueHints = true,
}

return {
  ensure_installed = {
    "ts_ls",
    "eslint",
    "tailwindcss",
    "html",
    "cssls",
    "jsonls",
    "emmet_ls",
    "roslyn_ls"
  },
  configs = {
    ts_ls = {
      settings = {
        typescript = {
          inlayHints = inlay_hints,
        },
        javascript = {
          inlayHints = inlay_hints,
        },
      },
    },
    eslint = {
      settings = {
        workingDirectory = { mode = "location" },
      },
    },
  },
}
