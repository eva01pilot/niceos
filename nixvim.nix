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

    plugins.none-ls = {
        enable = true;
        sources.formatting = {
          alejandra.enable = true;
          hclfmt.enable = true;
          just.enable = true;
          opentofu_fmt.enable = true;
          prettier.enable = true;
          # rubyfmt is broken on darwin-based systems
          rubyfmt.enable = (
            pkgs.stdenv.hostPlatform.system
            != "x86_64-darwin"
            && pkgs.stdenv.hostPlatform.system != "aarch64-darwin"
          );
          sqlformat.enable = true;
          stylua.enable = true;
          yamlfmt.enable = true;
        };
        sources.diagnostics = {
          trivy.enable = true;
          yamllint.enable = true;
        };
      };

    plugins.conform-nvim = {
      enable = true;
      settings = {
          format_on_save = {
            lsp_fallback = "fallback";
            timeout_ms = 500;
          };
          notify_on_error = true;
        formatters_by_ft.javascript = ["prettier"];
        formatters_by_ft.vue = ["prettier"];
        formatters_by_ft.astro = ["prettier"];
        formatters_by_ft.typescript = ["prettier"];
        formatters_by_ft.javascriptreact = ["prettier"];
        formatters_by_ft.typescriptreact = ["prettier"];
      };
    };
    plugins.lualine.enable = true;
    plugins.telescope.enable = true;
    plugins.treesitter = {
      enable = true;
      ensureInstalled = "all";
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
        nil-ls = {
          enable = true;
        };
        ts_ls = {
          enable = true;
          filetypes = [
            "javascript"
            "javascriptreact"
            "typescript"
            "typescriptreact"
          ];
        };
        volar = {
          enable = true;
          package = pkgs.vue-language-server;
          filetypes = [
              "typescript" "javascript" "javascriptreact" "typescriptreact" "vue"
          ];
          extraOptions = {
            init_options = {
              vue = {
                hybridMode = false;
              };
            };
          };
        };
      };
    };
  };
}
