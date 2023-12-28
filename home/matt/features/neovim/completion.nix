{ pkgs, ... }:

{
  home.packages = with pkgs; [
    ripgrep
  ];

  programs.neovim.plugins = with pkgs.vimPlugins; [
    cmp-nvim-lsp
    cmp-buffer
    cmp-path
    cmp-cmdline
    cmp-nvim-lsp-signature-help
    cmp-nvim-lsp-document-symbol
    cmp-nvim-lua
    cmp-vsnip
    vim-vsnip
    vim-vsnip-integ
    cmp-rg
    friendly-snippets
    cmp-under-comparator
    lspkind-nvim
    {
      plugin = nvim-cmp;
      type = "lua";
      config = ''
        local cmp = require("cmp")
        local lspkind = require("lspkind")
        local under_comparator = require("cmp-under-comparator")

        cmp.setup({
          sources = cmp.config.sources({
            { name = "nvim_lsp" },
            { name = "nvim_lsp_document_symbol" },
            { name = "nvim_lsp_signature_help" },
            { name = "buffer" },
            { name = "vsnip" },
            { name = "path" },
            { name = "rg" },
          }),
          window = {
            completion = cmp.config.window.bordered(),
            documentation = cmp.config.window.bordered(),
          },
          experimental = {
            ghost_text = true,
          },
          formatting = {
            fields = { "kind", "abbr", "menu" },
            format = lspkind.cmp_format({
              mode = "symbol_text",
              maxwidth = 40,
              ellipsis_char = "...",
              menu = {
                nvim_lsp = "[Lsp]",
                buffer = "[Buf]",
                vsnip = "[Snp]",
                path = "[Pth]",
                rg = "[Rip]",
              },
            }),
          },
          snippet = {
            expand = function(args)
              vim.fn["vsnip#anonymous"](args.body)
            end,
          },
          mapping = {
            ["<cr>"] = cmp.mapping.confirm({
              behavior = cmp.ConfirmBehavior.Replace,
              select = false,
            }),
            ["<tab>"] = cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_next_item({ behavior = cmp.SelectBehavior.Insert })
              else
                fallback()
              end
            end, { "i", "s" }),
            ["<S-tab>"] = cmp.mapping(function(fallback)
              if cmp.visible() then
                cmp.select_prev_item({ behavior = cmp.SelectBehavior.Insert })
              else
                fallback()
              end
            end, { "i", "s" }),
            ["<C-c>"] = cmp.mapping(function(_)
              cmp.complete()
            end, { "i", "s" }),
          },
          sorting = {
            priority_weight = 2,
            comparators = {
              cmp.config.compare.offset,
              cmp.config.compare.exact,
              cmp.config.compare.recently_used,
              cmp.config.compare.score,
              under_comparator.under,
              cmp.config.compare.scopes,
              cmp.config.compare.locality,
              cmp.config.compare.kind,
              cmp.config.compare.sort_text,
              cmp.config.compare.length,
              cmp.config.compare.order,
            },
          },
        })

        cmp.setup.cmdline("/", {
          mapping = cmp.mapping.preset.cmdline(),
          sources = cmp.config.sources({
            { name = "buffer" },
          }),
        })

        cmp.setup.cmdline(":", {
          mapping = cmp.mapping.preset.cmdline(),
          sources = cmp.config.sources({
            { name = "path" },
            { name = "cmdline" },
            { name = "buffer" },
          }),
        })
      '';
    }
  ];
}
