{self, ...}:{
	imports = [ ./bufferline.nix ];

	config = {  
		colorschemes.gruvbox.enable = true;

		globals = {
			mapleader = " ";
		};

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
			};
		};
                vimAlias = true;
                viAlias = true;
	};


	options = {
		number = true;
		relativenumber = true;

		shiftwidth = 2;
	};
}

