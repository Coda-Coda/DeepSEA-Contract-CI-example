let pkgs = import (builtins.fetchTarball {
  name = "nixos-20.09-pinned";
  url = "https://github.com/nixos/nixpkgs/archive/5e199f944cfa599636ff93e14d27e1d08ad2d9d1.tar.gz";
  sha256 = "15z10ql82qscv3cc2l1kvqb3s9pgip1kc500szimgvzvj0fzzbll";
}) {}; in

let deepSEA-src = ( pkgs.fetchFromGitHub {
    owner  = "Coda-Coda";
    repo   = "deepsea-1";
    rev    = "b37adedb166275effe2b0b16a0a42f9b65234375";
    sha256 = "1dn6ad3gq7k0vszidw7cg0yxja7l5c8ynv5fsa24z4i1x1f6k7ia"; } );
    # To update the sha256 run:
    # nix-prefetch-url --unpack https://github.com/Coda-Coda/deepsea-1/archive/commitHashGoesHere.tar.gz
    # Then replace sha256 = ... with the last string of characters returned by nix-prefetch-url
in
(import "${deepSEA-src}")