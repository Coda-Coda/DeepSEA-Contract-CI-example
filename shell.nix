let pkgs20-09PinnedUrl = https://github.com/nixos/nixpkgs/archive/5e199f944cfa599636ff93e14d27e1d08ad2d9d1.tar.gz; in
let pkgs = import (fetchTarball pkgs20-09PinnedUrl) {}; in

pkgs.mkShell {
  buildInputs = (with pkgs; [ 
    (import ./result/dependencies.nix) # Run nix-build to generate
    gnused
    gnumake
    ]);

  shellHook = ''
    export PATH=$PATH:$PWD/result/bin/
    export PATH=$PATH:$PWD/Scripts/
  '';
    
}