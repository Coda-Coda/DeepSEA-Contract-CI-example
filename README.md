# Continuous Integration for DeepSEA proofs (experimentation)

Please note that this is an **unofficial** approach - it is an experiment at using continuous integration based upon using [Nix](https://nixos.org/) to build DeepSEA and then check a proof of a contract.

DeepSEA is publicly available at https://github.com/certikfoundation/deepsea (or with minor tweaks at https://github.com/Coda-Coda/deepsea-1).

## GitHub Actions runs the following 2 tests on every commit or pull request to main
 - `nix-shell --run "FunctionalCorrectness-compile-test"`
 - `nix-shell --run "FunctionalCorrectness-no-axioms-test"`

After running `nix-build`.

## To develop or check the proof locally:
1. `nix-build`
2. `nix-shell`
3. `coqide FunctionalCorrectness.v`

## Pre-requisites:

[Get Nix here](https://nixos.org/download.html) or simply: `curl -L https://nixos.org/nix/install | sh`

_Optionally_:
 `cachix use coda-coda-deepsea-public` beforehand to slightly speed up the build process. [Get Cachix here](https://docs.cachix.org/installation.html) or simply: `nix-env -iA cachix -f https://cachix.org/api/v1/install` (requires Nix).

## Tested on:
 - NixOS
 - Ubuntu