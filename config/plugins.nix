{pkgs, ...}:
{
    plugins = {
        lsp = {
            enable = true;
            servers = {
                clangd = {
                    enable = false;
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
                # Ziglang
                zls = {
                    enable = true;
                    settings = {
                        root_markers = [
                            ".git"
                        ];
                        semantic_tokens = "partial";
                    };
                };
            };
        };
        # Provides a status line in NVIM
        lualine = {
            enable = true;
        };
        oil = {
            enable = true;
        };
        # Fuzzy finder plugin
        telescope = {
            enable = true;
        };
        treesitter = {
            enable = false;
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

