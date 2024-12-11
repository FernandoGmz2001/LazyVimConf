return {
  "williamboman/mason-lspconfig.nvim",
  config = function()
    local lspconfig = require("lspconfig")
    require("mason").setup({})
    require("mason-lspconfig").setup({
      ensure_installed = { "lua_ls", "cssls", "html", "ts_ls", "eslint", "tailwindcss" },
    })
    lspconfig.volar.setup({})
    lspconfig.tailwindcss.setup({})
    lspconfig.lua_ls.setup({})
    lspconfig.cssls.setup({})
    lspconfig.html.setup({})
    lspconfig.eslint.setup({})
    --
    -- Configuración adicional para tsserver
    lspconfig.ts_ls.setup({
      --volar = {},
      init_options = {
        plugins = {
          {
            name = "@vue/typescript-plugin",
            location = "/home/ferdev/.nvm/versions/node/v22.12.0/lib/node_modules/@vue/typescript-plugin",
            languages = { "vue", "typescript", "javascript" },
          },
        },
      },
      filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
    })
  end
}
