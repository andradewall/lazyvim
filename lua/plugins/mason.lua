return {
  "williamboman/mason.nvim",
  cmd = "Mason",
  opts_extend = { "ensure_installed" },
  opts = {
    ensure_installed = {
      "stylua",
      "shfmt",
      "phpactor",
    },
  },
}
