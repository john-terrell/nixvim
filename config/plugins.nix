{pkgs, ...}:
{
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
                            ".git"
                        ];
                    };
                };
                ts_ls.enable = true;
                lua_ls.enable = true;
                rust_analyzer = {
                    enable = false; 
                    installCargo = true;
                    installRustc = true;
                    settings = {
                        root_markers = [
                            ".git"
                        ];
                    };
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
        rustaceanvim = {
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
}

