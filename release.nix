
let

  pkgs = import <nixpkgs> {};
  # pkgs-ghcjs = import <nixpkgs-ghcjs> {};
  pkgs-ghc-static = import <nixpkgs-ghc-static> {};

  hp = pkgs.haskellPackages.override {
    overrides = self: super: {
    };
  };

in
{
  haskellTools = {
    inherit (pkgs) stack;
  };

  inherit (pkgs) mkvtoolnix purescript psc-package;
}
