{ self, pkgs, ... }:
{
    imports = [ 
        ./bufferline.nix 
        ./keymaps.nix
        ./options.nix
        ./plugins.nix
    ];

    config = {
        colorschemes.catppuccin.enable = true;
        globals = {
            mapleader = " ";
        };
        vimAlias = true;
        viAlias = true;
    };
}
