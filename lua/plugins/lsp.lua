return {
  {
    "VonHeikemen/lsp-zero.nvim",
    branch = "v3.x",
    dependencies = {
      { "neovim/nvim-lspconfig" },
      { "folke/neodev.nvim",    opts = {} },
      { "j-hui/fidget.nvim",    opts = {} },
    },
    config = function()
      local lsp_zero = require("lsp-zero")

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      local has_cmp, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
      if has_cmp then
        capabilities = vim.tbl_deep_extend("force", capabilities, cmp_nvim_lsp.default_capabilities())
      end

      lsp_zero.on_attach(function(client, bufnr)
        lsp_zero.default_keymaps({ buffer = bufnr })

        local map = function(keys, func, desc)
          vim.keymap.set("n", keys, func, { buffer = bufnr, desc = desc })
        end
        local telescope = require("telescope.builtin")
        map("<leader>cd", telescope.lsp_definitions, "Goto Definition")
        map("<leader>cr", telescope.lsp_references, "Goto References")
        map("<leader>ci", telescope.lsp_implementations, "Goto Implementation")
        map("<leader>cd", telescope.lsp_type_definitions, "Type Definition")
        map("<leader>cs", telescope.lsp_document_symbols, "Document Symbols")
        map("<leader>cR", vim.lsp.buf.rename, "Rename")
        map("<leader>ca", vim.lsp.buf.code_action, "Code Action")

        map("<A-p>", function()
          vim.diagnostic.jump({ count = 1, float = true })
        end, "Next Diagnostic")

        map("<A-o>", function()
          vim.diagnostic.jump({ count = -1, float = true })
        end, "Prev Diagnostic")

        map("<leader>cq", vim.diagnostic.setloclist, "Quickfix Diagnostics")
        map("K", vim.lsp.buf.hover, "Hover Documentation")
        -- Document highlight setup
        if client and client.server_capabilities.documentHighlightProvider then
          local highlight_augroup = vim.api.nvim_create_augroup("kickstart-lsp-highlight", { clear = false })
          vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
            buffer = bufnr,
            group = highlight_augroup,
            callback = vim.lsp.buf.document_highlight,
          })

          vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
            buffer = bufnr,
            group = highlight_augroup,
            callback = vim.lsp.buf.clear_references,
          })

          vim.api.nvim_create_autocmd("LspDetach", {
            group = vim.api.nvim_create_augroup("kickstart-lsp-detach", { clear = true }),
            callback = function(event)
              vim.lsp.buf.clear_references()
              vim.api.nvim_clear_autocmds({ group = "kickstart-lsp-highlight", buffer = event.buf })
            end,
          })
        end
      end)

      local servers = {
        clangd = {
          cmd = { "clangd" },
        },
        bashls = {
          cmd = { "bash-language-server", "start" },
        },
        pyright = {
          cmd = { "pyright-langserver", "--stdio" },
        },
        jdtls = {
          cmd = { "jdtls" },
        },
        ts_ls = {
          cmd = { "typescript-language-server", "--stdio" },
          settings = {
            typescript = {
              inlayHints = {
                includeInlayParameterNameHints = "literals", -- 'none' | 'literals' | 'all'
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayVariableTypeHints = true,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHintsWhenTypeMatchesName = true,
                includeInlayPropertyDeclarationTypeHints = false,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
            javascript = {
              inlayHints = {
                includeInlayParameterNameHints = "literals", -- 'none' | 'literals' | 'all'
                includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                includeInlayVariableTypeHints = true,
                includeInlayFunctionParameterTypeHints = true,
                includeInlayVariableTypeHintsWhenTypeMatchesName = true,
                includeInlayPropertyDeclarationTypeHints = false,
                includeInlayFunctionLikeReturnTypeHints = true,
                includeInlayEnumMemberValueHints = true,
              },
            },
          },
        },
        eslint = {
          cmd = { "vscode-eslint-language-server", "--stdio" },
        },
        tailwindcss = {
          cmd = { "tailwindcss-language-server", "--stdio" },
        },
        yamlls = {
          cmd = { "yaml-language-server", "--stdio" },
        },
        rust_analyzer = {
          cmd = { "rust-analyzer" },
        },
        tinymist = {
          cmd = { "tinymist" }
        },
        hls = {
          cmd = { "haskell-language-server-wrapper", "--lsp" },
        },
        nil_ls = {
          cmd = { "nil" },
          settings = {
            ["nil"] = {
              formatting = {
                command = { "nixpkgs-fmt" },
              },
            },
          },
        },
        lua_ls = {
          cmd = { "lua-language-server" },
          settings = {
            Lua = {
              completion = {
                callSnippet = "Replace",
              },
            },
          },
        },
      }
      for server_name, server_settings in pairs(servers) do
        server_settings.capabilities = capabilities
        require("lspconfig")[server_name].setup(server_settings)
      end
    end,
  },
}
