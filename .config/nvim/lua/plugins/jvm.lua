-- Java / Kotlin via JetBrains' IntelliJ language server (replaces LazyVim's lang.java / lang.kotlin extras)
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = { ensure_installed = { "java", "kotlin", "groovy", "properties", "xml", "yaml" } },
  },

  -- Keep other JVM servers off so they don't compete with intellij-server (and don't write .classpath/.project files)
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        jdtls = { enabled = false },
        kotlin_language_server = { enabled = false },
        kotlin_lsp = { enabled = false },
      },
    },
  },

  {
    "AlexandrosAlexiou/intellij-server.nvim",
    ft = { "java", "kotlin" },
    build = ":IntellijServerInstall",
    opts = function()
      local ok, blink = pcall(require, "blink.cmp")
      return {
        -- 16 GB machine shared with IntelliJ IDEA: 4 GB is enough for a typical Spring Boot service
        jvm_args = { "-Xmx4g" },
        -- One warm server shared by every project and every nvim (including herdr-nvim sidebars)
        connection = { mode = "socket" },
        capabilities = ok and blink.get_lsp_capabilities() or nil,
        -- Review-oriented: keep the code readable
        inlay_hints = { enabled = false },
        dap = { enabled = false },
      }
    end,
  },
}
