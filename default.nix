with import <nixpkgs> {};

let deepSEA-src = ( pkgs.fetchFromGitHub {
    owner  = "Coda-Coda";
    repo   = "deepsea-1";
    rev    = "b19e881a8dac47c35599877978666cc0f11f20ae";
    sha256 = "13z3c7vhyfkxhkyqjaxv3160429v6bkvpmhwa3d9rak9cifyf3nq"; } );
    # To update the sha256 run:
    # nix-prefetch-url --unpack https://github.com/Coda-Coda/deepsea-1/archive/commitHashGoesHere.tar.gz
    # Then replace sha256 = ... with the last string of characters returned by nix-prefetch-url
in
(import "${deepSEA-src}")