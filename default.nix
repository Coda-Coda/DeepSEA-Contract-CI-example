with import <nixpkgs> {};

let deepSEA-src = ( pkgs.fetchFromGitHub {
    owner  = "Coda-Coda";
    repo   = "deepsea-1";
    rev    = "d7e91169b7b73a556879ea463b8109473b7d4b20";
    sha256 = "0dmhk1m7i02zvx9g0xrg9zzgzsysd1rkv7g2a00r0ffx93ikka9f"; } );
    # To update the sha256 run:
    # nix-prefetch-url --unpack https://github.com/Coda-Coda/deepsea-1/archive/commitHashGoesHere.tar.gz
    # Then replace sha256 = ... with the last string of characters returned by nix-prefetch-url
in
(import "${deepSEA-src}")