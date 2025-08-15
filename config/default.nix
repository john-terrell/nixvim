{ self, pkgs, ... }:
{
    imports = [ ./bufferline.nix ];

    config = {
        colorschemes.catppuccin.enable = true;
        globals = {
            mapleader = " ";
        };

        opts = {
            guicursor = "";
            number = true;
            relativenumber = true;

            shiftwidth = 4;
            tabstop = 4;
            softtabstop = 4;
            expandtab = true;

            smartindent = true;
            wrap = false;
            swapfile = false;
            backup = false;
            undodir = builtins.getEnv "HOME" + ".vim/undodir";
            undofile = false;

            hlsearch = true;
            incsearch = true;

            termguicolors = true;
            scrolloff = 98;
            signcolumn = "yes";

            updatetime = 50;

            colorcolumn = "120";
        };

        keymaps = [
        {
            mode = "n";
            action = "<cmd>Oil<CR>";
            key = "<leader>pv";
        }
        {
            mode = "n";
            action = "<cmd>Telescope find_files<CR>";
            key = "<leader>ff";
        }
        {
            mode = "n";
            action = "<cmd>Telescope git_files<CR>";
            key = "<leader>pf";
        }
        {
            mode = "n";
            options = {
                expr = true;
            };
            action = ''function() require("telescope.builtin").grep_string( { search = vim.fn.input("Grep > ") }) end'';
            key = "<leader>fg";
        }
        ];

        plugins = {
            cmp = {
                enable = true;
                autoEnableSources = true;
            };
            lsp = {
                enable = true;
                servers = {
                    clangd = {
                        enable = true;
                        settings = {
                            cmd = [
                                "clangd"
                                "--background-index"
                            ];
                            filetypes = [
                                "c"
                                "cpp"
                            ];
                            root_markers = [
                                "compile_commands.json"
                                    "compile_flags.txt"
                            ];
                        };
                    };
                    ts_ls.enable = true;
                    lua_ls.enable = true;
                    rust_analyzer = {
                        enable = true;
                        installCargo = true;
                        installRustc = true;
                    };
                };
            };
            lualine = {
                enable = true;
            };
            luasnip = {
                enable = true;
            };
            oil = {
                enable = true;
            };
            telescope = {
                enable = true;
            };
            treesitter = {
                enable = true;
                settings = {
                    auto_install = true;
                    grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
                        bash
                        c
                        javascript
                        json
                        lua
                        make
                        markdown
                        nix
                        regex
                        rust
                        toml
                        typescript
                        vim
                        vimdoc
                        xml
                        yaml
                    ];
                    hightlight = {
                        enable = true;
                        additional_vim_regex_highlighting = false; 
                    };
                };
            };
        };
        vimAlias = true;
        viAlias = true;
    };
}
