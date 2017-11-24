
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

in
{
  haskellTools = {
    inherit (pkgs) stack;
  };

  inherit ghcjs;

  inherit (pkgs) mkvtoolnix purescript psc-package;
}
