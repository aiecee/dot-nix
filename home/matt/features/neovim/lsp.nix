{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # python
    python3
    python311Packages.python-lsp-server
    python311Packages.yapf
    # c/c++
    ccls
    # llvmPackages_9.clang-unwrapped
    # lua
    unstable.lua-language-server
  ];

  programs.neovim.plugins = with pkgs.unstable.vimPlugins; [
    {
      plugin = nvim-lspconfig;
      type = "lua";
      config = ''
        local lspconfig = require("lspconfig")
        function add_lsp(server, options)
          if options["cmd"] ~= nil then
            binary = options["cmd"][1]
          else
            binary = server["document_config"]["default_config"]["cmd"][1]
          end
          if vim.fn.executable(binary) == 1 then
            server.setup(options)
          end
        end

        add_lsp(lspconfig.nil_ls, {})
        add_lsp(lspconfig.tsserver, {})
        add_lsp(lspconfig.eslint, {})
        add_lsp(lspconfig.cssls, {})
        add_lsp(lspconfig.html, {})
        add_lsp(lspconfig.jsonls, {})
        add_lsp(lspconfig.tailwindcss, {})
        add_lsp(lspconfig.pylsp, {})
        add_lsp(lspconfig.ccls, {})
        add_lsp(lspconfig.gopls, {})
        add_lsp(lspconfig.golangci_lint_ls, {})
        
        local sumneko_runtime_paths = vim.split(package.path, ";", {})
        table.insert(sumneko_runtime_paths, "lua/?.lua")
        table.insert(sumneko_runtime_paths, "lua/?/init.lua")
        add_lsp(lspconfig.lua_ls, {
        settings = {
            Lua = {
              runtime = {
                version = "LuaJIT",
                path = sumneko_runtime_paths,
              },
              diagnostics = {
                globals = { "vim" },
              },
              workspace = {
                checkThirdPaty = false,
                library = vim.api.nvim_get_runtime_file("", true),
              },
              telemetry = {
                enable = false,
              },
            },
          },
        })

        vim.diagnostic.config({
          virtual_text = true,
          signs = true,
          update_in_insert = true,
          severity_sort = true,
        })
      '';
    }
  ];

}
