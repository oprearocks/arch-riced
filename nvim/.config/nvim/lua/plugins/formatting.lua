return {
  -- Use LazyVim's conform integration
  {
    "stevearc/conform.nvim",
    opts = function(_, opts)
      -- Add your custom formatter and filetype mapping
      opts.formatters_by_ft = vim.tbl_extend("force", opts.formatters_by_ft, {
        cs = { "csharpier" },
        css = { "prettier" },
        html = function(bufnr)
          local filename = vim.api.nvim_buf_get_name(bufnr)
          if filename:match("%.ejs$") then
            return { "prettier_ejs" }
          else
            return { "prettier" }
          end
        end,
        ejs = { "prettier_ejs" },
      })

      opts.formatters = vim.tbl_extend("force", opts.formatters or {}, {
        csharpier = {
          command = "csharpier",
          args = {
            "format",
            "--write-stdout",
          },
          to_stdin = true,
        },
        prettier_ejs = {
          command = "prettier",
          args = {
            "--stdin-filepath",
            "$FILENAME",
            "--parser",
            "html",
          },
          stdin = true,
        },
      })
    end,
  },
}
