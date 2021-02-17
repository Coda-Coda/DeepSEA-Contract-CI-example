let pkgs = import (builtins.fetchTarball {
  name = "nixos-20.09-pinned";
  url = "https://github.com/nixos/nixpkgs/archive/5e199f944cfa599636ff93e14d27e1d08ad2d9d1.tar.gz";
  sha256 = "15z10ql82qscv3cc2l1kvqb3s9pgip1kc500szimgvzvj0fzzbll";
}) {}; in

pkgs.mkShell {
  buildInputs = (with pkgs; [ 
    (import ./result/dependencies.nix) # Run nix-build to generate
    gnused
    gnumake
    ]);

  shellHook = ''
    export PATH=$PATH:$PWD/result/binaries/built-from-src/
    export PATH=$PATH:$PWD/Scripts/
  '';
    
}