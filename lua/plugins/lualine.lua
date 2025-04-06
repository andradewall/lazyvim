local custom_catppuccin = require("lualine.themes.catppuccin-mocha")

custom_catppuccin.command = {
  a = {
    fg = custom_catppuccin.command.a.bg,
    bg = "NONE",
  },
  b = { bg = "NONE" },
  c = { bg = "NONE" },
  x = { bg = "NONE" },
}
custom_catppuccin.inactive = {
  a = {
    fg = custom_catppuccin.inactive.a.bg,
    bg = "NONE",
  },
  b = { bg = "NONE" },
  c = { bg = "NONE" },
  x = { bg = "NONE" },
}
custom_catppuccin.insert = {
  a = {
    fg = custom_catppuccin.insert.a.bg,
    bg = "NONE",
  },
  b = { bg = "NONE" },
  c = { bg = "NONE" },
  x = { bg = "NONE" },
}
custom_catppuccin.normal = {
  a = {
    fg = custom_catppuccin.normal.a.bg,
    bg = "NONE",
  },
  b = { bg = "NONE" },
  c = { bg = "NONE" },
  x = { bg = "NONE" },
}
custom_catppuccin.replace = {
  a = {
    fg = custom_catppuccin.replace.a.bg,
    bg = "NONE",
  },
  b = { bg = "NONE" },
  c = { bg = "NONE" },
  x = { bg = "NONE" },
}
custom_catppuccin.terminal = {
  a = {
    fg = custom_catppuccin.terminal.a.bg,
    bg = "NONE",
  },
  b = { bg = "NONE" },
  c = { bg = "NONE" },
  x = { bg = "NONE" },
}
custom_catppuccin.visual = {
  a = {
    fg = custom_catppuccin.visual.a.bg,
    bg = "NONE",
  },
  b = { bg = "NONE" },
  c = { bg = "NONE" },
  x = { bg = "NONE" },
}

return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  init = function()
    vim.g.lualine_laststatus = vim.o.laststatus
    if vim.fn.argc(-1) > 0 then
      -- set an empty statusline till lualine loads
      vim.o.statusline = " "
    else
      -- hide the statusline on the starter page
      vim.o.laststatus = 0
    end
  end,
  opts = function()
    -- PERF: we don't need this lualine require madness 🤷
    local lualine_require = require("lualine_require")
    lualine_require.require = require

    vim.o.laststatus = vim.g.lualine_laststatus

    local opts = {
      options = {
        theme = custom_catppuccin,
        globalstatus = vim.o.laststatus == 3,
        disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter", "snacks_dashboard" } },
        section_separators = "",
        component_separators = "",
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = {
          { "branch", icons_enabled = false },
          { "filetype", icons_enabled = false },
        },
        lualine_x = {
          -- stylua: ignore
          {
            function()
              return require("noice").api.status.command.get()
            end,
            cond = function()
              return package.loaded["noice"] and require("noice").api.status.command.has()
            end,
            color = function()
              return { fg = Snacks.util.color("Statement") }
            end,
          },
          -- stylua: ignore
          {
            function() return require("noice").api.status.mode.get() end,
            cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
            color = function() return { fg = Snacks.util.color("Constant") } end,
          },
          -- stylua: ignore
          {
            function() return "  " .. require("dap").status() end,
            cond = function() return package.loaded["dap"] and require("dap").status() ~= "" end,
            color = function() return { fg = Snacks.util.color("Debug") } end,
          },
          -- stylua: ignore
          {
            require("lazy.status").updates,
            cond = require("lazy.status").has_updates,
            color = function() return { fg = Snacks.util.color("Special") } end,
          },
          { "diff" },
          { "location" },
        },
        lualine_z = {
          -- { "progress", separator = " ", padding = { left = 1, right = 0 } },
        },
      },
      extensions = { "neo-tree", "lazy", "fzf" },
    }
    return opts
  end,
}
