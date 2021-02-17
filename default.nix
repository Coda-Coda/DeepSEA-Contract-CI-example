with import <nixpkgs> {};

let deepSEA-src = ( pkgs.fetchFromGitHub {
    owner  = "Coda-Coda";
    repo   = "deepsea-1";
    rev    = "ead140097e669b0c5d529f231a393bafbaf89a85";
    sha256 = "0qrmhif78fxwazidyg00gh5lkgjb9w30fyrx25l2422y5p4dlqs8"; } );
    # To update the sha256 run:
    # nix-prefetch-url --unpack https://github.com/Coda-Coda/deepsea-1/archive/commitHashGoesHere.tar.gz
    # Then replace sha256 = ... with the last string of characters returned by nix-prefetch-url
in
(import "${deepSEA-src}")