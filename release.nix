with import <nixpkgs> {};

let hp = haskellPackages.override {
  overrides = self: super: {
    reactive-banana-wx = with haskell.lib;
      addBuildDepends
        (enableCabalFlag super.reactive-banana-wx "buildexamples")
        [ super.random super.executable-path ];
    };
  };

   hp_lts = haskell.packages.lts-5_9;

in
{
  haskellPackages = {
    inherit (hp) reactive-banana-wx pandoc purescript;
  };

  haskellPackages_lts =
    let selection = { inherit (hp_lts) cassava HDBC HDBC-odbc wx wxcore cabal-install stack ghcid ghc-mod ListZipper tasty tasty-hunit tasty-smallcheck protolude; };
    in selection // { hooglePkgs = (hp_lts.ghcWithHoogle (_: lib.mapAttrsToList (_: v: v) selection)); };


  haskellPackages_ghcjs =
    let oldpkgs = import (nixpkgs.fetchFromGitHub {
          owner = "NixOS";
          repo = "nixpkgs";
          # last change of ghcjs
          rev = "d3754d34824810d80c8e05767f05c85855883a00";
          sha256 = "1ncqfsb66jw8f8gxahrx3ia4hh9vlhfswzcp2id8sm2jkm5dmyid";
        }) {};
   in {
    haskell.compiler.ghcjs = haskell.compiler.ghcjs;
    oldghcjs = { inherit (oldpkgs.haskell.packages.ghcjs) reflex-dom; };
  };

  # quasselDaemonStatic = kde5.quasselDaemon.override { static = true; };

  inherit mkvtoolnix;
}
