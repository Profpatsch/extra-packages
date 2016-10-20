
let

  pkgs = import <nixpkgs> {};
  pkgs-ghcjs = import <nixpkgs-ghcjs> {};

  hp = pkgs.haskellPackages.override {
    overrides = self: super: {
      reactive-banana-wx = with pkgs.haskell.lib;
        addBuildDepends
          (enableCabalFlag super.reactive-banana-wx "buildexamples")
          [ super.random super.executable-path ];
      };
    };

in
{
  haskellPackages = {
    inherit (hp) pandoc purescript cabal-install;
  };
  haskellTools = {
    inherit (pkgs) stack;
  };


  ghcjsPackages = with pkgs-ghcjs.haskell.packages.ghcjs; {
    inherit lucid Spock-api-ghcjs ghcjs-dom jsaddle-dom
      smallcheck tasty-smallcheck tasty-hunit smallcheck-series;
  };

  inherit (pkgs) mkvtoolnix;
  pyqt5 = pkgs.pythonPackages.pyqt5;
}
