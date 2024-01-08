{ pkgs, ... }:

{
  home.packages = with pkgs; [
    nodejs
    nodePackages.typescript
    nodePackages.typescript-language-server
    nodePackages.vscode-langservers-extracted
    nodePackages."@tailwindcss/language-server"
    nil
  ];

  programs.neovim.plugins = with pkgs.vimPlugins; [
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
      '';
    }
  ];

}
