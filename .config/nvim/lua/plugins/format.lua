-- Formatting: ktlint for Kotlin, prettier for web and markup files (like VS Code), IntelliJ code style for Java via LSP
return {
  {
    "mason-org/mason.nvim",
    opts = { ensure_installed = { "ktlint", "prettier" } },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        kotlin = { "ktlint" },
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        json = { "prettier" },
        jsonc = { "prettier" },
        css = { "prettier" },
        scss = { "prettier" },
        less = { "prettier" },
        html = { "prettier" },
        markdown = { "prettier" },
        ["markdown.mdx"] = { "prettier" },
        yaml = { "prettier" },
        graphql = { "prettier" },
        vue = { "prettier" },
        svelte = { "prettier" },
      },
    },
  },
}
