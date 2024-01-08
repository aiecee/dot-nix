{ ... }:

{
  programs.neovim.extraLuaConfig = ''
    local function map_table(table)
      for mode, mappings in pairs(table)
        for _, mapping in pairs(mapping) do
          vim.keymap.set(mode, mapping[1], mapping[2], vim.tbl_extend("keep", { desc = mapping[3] }, mapping[4] or {}))
        end
      end
    end

    local global_mappings = {
      n = {
        -- commands
        { "<Leader>-", "<cmd>Telescope commands<cr>", "commands" },
        -- files
        { "<Leader>t", mini_files.open, "file tree" },
        { "<Leader>ff", "<cmd>Telescope find_files<cr>", "find" },
        { "<Leader>fr", "<cmd>Telescope oldfiles<cr>", "recently opened" },
        -- search
        { "<Leader>sf", "<cmd>Telescope current_buffer_fuzzy_find<cr>", "current file" },
        { "<Leader>sc", "<cmd>Telescope grep_string<cr>", "word under cursor" },
        { "<Leader>sw", "<cmd>Telescope live_grep<cr>", "current working dir" },
        -- git
        { "<Leader>gcc", "<cmd>Telescope git_commits<cr>", "commits" },
        { "<Leader>gcb", "<cmd>Telescope git_bcommits<cr>", "buffer commits" },
        { "<Leader>gb", "<cmd>Telescope git_branches<cr>", "branches" },
        -- sessions
        { "<Leader>Sc", persistence.load, "load" },
        {
          "<Leader>Sl",
          function()
            persistence.load({ last = true })
          end,
          "load last",
        },
        -- windows
        { "<Leader>=", "<cmd>wincmd =<cr>", "format" },
        { "<Leader>wh", "<cmd>wincmd h<cr>", "go left" },
        { "<Leader>wj", "<cmd>wincmd j<cr>", "go down" },
        { "<Leader>wk", "<cmd>wincmd k<cr>", "go up" },
        { "<Leader>wl", "<cmd>wincmd l<cr>", "go right" },
        { "<Leader>ws", "<cmd>wincmd w<cr>", "split" },
        { "<Leader>wv", "<cmd>wincmd v<cr>", "split vertically" },
        { "<Leader>wx", "<cmd>wincmd x<cr>", "swap" },
        -- marks
        {
          "<Leader>ma",
          function()
            harpoon:list():append()
          end,
          "add",
        },
        {
          "<Leader>mn",
          function()
            harpoon:list():next()
          end,
          "next",
        },
        {
          "<Leader>mp",
          function()
            harpoon:list():prev()
          end,
          "previous",
        },
        { "<Leader>ml", "<cmd>Telescope harpoon marks theme=dropdown<cr>", "list" },
        { "ga", vim.lsp.buf.code_action, "[LSP] code actions" },
        { "gr", "<cmd>Telescope lsp_references<cr>", "[LSP] references" },
        { "gb", "<cmd>Telescope lsp_definitions<cr>", "[LSP] definitions" },
        { "gR", vim.lsp.buf.rename, "[LSP] rename" },
        { "gh", vim.lsp.buf.hover, "[LSP] hover" },
        {
          "gd",
          function()
            vim.diagnostic.open_float({ border = "rounded" })
          end,
          "[LSP] diagnostics",
        },
        { "<Leader>cb", "<cmd>Telescope lsp_definitions<cr>", "go to definition" },
        { "<Leader>ci", "<cmd>Telescope lsp_implementations<cr>", "go to implementations" },
        { "<Leader>cr", "<cmd>Telescope lsp_references<cr>", "all references" },
        { "<Leader>cd", "<cmd>Telescope diagnostics<cr>", "diagnostics" },
        {
          "<Leader>cf",
          function()
            vim.lsp.buf.format({ timeout_ms = 5000 })
          end,
          "format",
        },
        { "<Leader>ca", vim.lsp.buf.code_action, "code actions" },
        { "<Leader>cr", vim.lsp.buf.rename, "rename" },
        { "<Leader>ch", vim.lsp.buf.hover, "hover" },
        { "<Leader>ct", "<cmd>TodoTelescope<cr>", "todos" },
      },
    }

    map_table(global_mappings)
  '';
}
