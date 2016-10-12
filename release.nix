with import <nixpkgs> {};

let hp = haskellPackages.override {
  overrides = self: super: {
    reactive-banana-wx = with haskell.lib;
      addBuildDepends
        (enableCabalFlag super.reactive-banana-wx "buildexamples")
        [ super.random super.executable-path ];
    };
  };

in
{
  haskellPackages = {
    inherit (hp) pandoc purescript;
  };


  haskellPackages_ghcjs =
    let oldpkgs = import (fetchFromGitHub {
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

  inherit mkvtoolnix;
  pyqt5 = pythonPackages.pyqt5;
}
