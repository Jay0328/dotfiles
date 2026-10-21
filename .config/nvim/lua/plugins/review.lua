-- Reviewing agent changes: VS Code-style diffs + annotations sent back to the agent through herdr
return {
  {
    "esmuellert/codediff.nvim",
    cmd = "CodeDiff",
    opts = {
      explorer = { line_stats = { enabled = true } },
    },
    keys = {
      { "<leader>gv", "<cmd>CodeDiff<cr>", desc = "Diff View (working tree)" },
      { "<leader>gV", "<cmd>CodeDiff main<cr>", desc = "Diff View (vs main)" },
      { "<leader>gH", "<cmd>CodeDiff history<cr>", desc = "Diff History" },
    },
  },

  {
    -- nvim half of herdr-nvim: <leader>ac comment, <leader>al list, <leader>as paste, <leader>aS submit, <leader>ai ref
    "ChmaraX/herdr-nvim",
    event = "VeryLazy",
    opts = {},
  },
}
