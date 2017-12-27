
let

  pkgs = import <nixpkgs> {};
  # pkgs-ghcjs = import <nixpkgs-ghcjs> {};
  pkgs-ghc-static = import <nixpkgs-ghc-static> {};

  hp = pkgs.haskellPackages.override {
    overrides = self: super: {
    };
  };

  ghcjs = {
    inherit (pkgs.haskell.packages.ghcjsHEAD)
      ghcjs-base dhall;
  };

  # TMP
  arm =
      (import <nixpkgs> {
        localSystem = pkgs.lib.systems.examples.armv7l-hf-multiplatform;
      }).hello;


in
{
  haskellTools = {
    inherit (pkgs) stack;
  };

  inherit ghcjs;

  inherit arm;

  inherit (pkgs) mkvtoolnix purescript psc-package;
}
