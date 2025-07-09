-- Customize Treesitter
return {
  "nvim-treesitter/nvim-treesitter",
  opts = function(_, opts)
    opts.ensure_installed = {
      "lua",
      "vim",
      "css",
      "html",
      "javascript",
      "typescript",
      "json",
      "php",
      "phpdoc",
      "scss",
      "php_only",
      "blade",
      -- add more arguments for adding more treesitter parsers
    }

    opts.auto_install = true

    opts.highlight = {
      enable = true,
    }

    opts.indent = {
      enable = true,
    }
  end,
}
