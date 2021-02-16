with import <nixpkgs> {};

let deepSEA-src = ( pkgs.fetchFromGitHub { # 1.1.2-for-Nix
    owner  = "Coda-Coda";
    repo   = "deepsea-1";
    rev    = "a6ad4d22b14778827fc19c5606096e0d993b4501";
    sha256 = "16wmsk6acy9mq4vqj2rkp8jmy6lhgh5jal3z78ib1phfspn4a4aw"; } );
    # To update the sha256 run:
    # nix-prefetch-url --unpack https://github.com/Coda-Coda/deepsea-1/archive/commitHashGoesHere.tar.gz
    # Then replace sha256 = ... with the last string of characters returned by nix-prefetch-url
in
(import "${deepSEA-src}")