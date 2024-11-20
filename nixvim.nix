{
  pkgs,
  lib,
  ...
}: {
  programs.nixvim = {
    enable = true;
    globals.mapleader = " ";
    colorschemes.gruvbox.enable = true;

    opts = {
      updatetime = 100; # faster completion
      number = true;
      relativenumber = true;

      autoindent = true;
      autowrite = true;
      confirm = true;
      clipboard = "unnamedplus";
      cursorline = true;
      list = true;
      expandtab = true;
      shiftround = true;
      shiftwidth = 2;
      # showmode = false;
      signcolumn = "yes";
      smartcase = true;
      smartindent = true;
      tabstop = 2;

      ignorecase = true;
      incsearch = true;
      completeopt = "menu,menuone,noselect";
      wildmode = "longest:full,full";

      swapfile = false;
      undofile = true; # Build-in persistent undo
      undolevels = 10000;
    };
    keymaps = [
      {
        mode = "n";
        key = "<leader>ff";
        action = "<CMD>Telescope find_files<CR>";
      }
    ];
    plugins.lualine.enable = true;
    plugins.telescope.enable = true;
    plugins.treesitter = {
      enable = true;

      folding = false;
      settings.indent.enable = true;
    };
    plugins.cmp-emoji = {enable = true;};
    plugins.cmp = {
      enable = true;
      settings = {
        autoEnableSources = true;
        experimental = {ghost_text = false;};
        performance = {
          debounce = 60;
          fetchingTimeout = 200;
          maxViewEntries = 30;
        };
        snippet = {expand = "luasnip";};
        formatting = {fields = ["kind" "abbr" "menu"];};
        sources = [
          {name = "nvim_lsp";}
          {
            name = "path"; # file system paths
            keywordLength = 3;
          }
        ];

        mapping = {
          "<C-n>" = "cmp.mapping.select_next_item()";
          "<C-p>" = "cmp.mapping.select_prev_item()";
          "<C-d>" = "cmp.mapping.scroll_docs(-4)";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<C-Space>" = "cmp.mapping.complete {}";
          "<CR>" = "cmp.mapping.confirm {
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		}";
          "<Tab>" = "cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end, { 'i', 's' }),
		['<S-Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end, { 'i', 's' })";
        };
      };
    };
    plugins.cmp-nvim-lsp = {enable = true;}; # lsp
    plugins.cmp-buffer = {enable = true;};
    plugins.cmp-path = {enable = true;}; # file system paths
    plugins.cmp_luasnip = {enable = true;}; # snippets
    plugins.cmp-cmdline = {enable = false;}; # autocomplete for cmdline
    plugins.lsp = {
      enable = true;

      servers = {
        ts_ls = {
          enable = true;
          filetypes = [
            "javascript"
            "javascriptreact"
            "typescript"
            "typescriptreact"
            "vue"
          ];
          extraOptions = {
            init_options = {
              plugins = [
                {
                  name = "@vue/typescript-plugin";
                  location = "${lib.getBin pkgs.vue-language-server}/lib/node_modules/@vue/language-server";
                  languages = ["vue"];
                }
              ];
            };
          };
        };
        volar = {
          enable = true;
          package = pkgs.vue-language-server;
        };
      };
    };
  };
}
