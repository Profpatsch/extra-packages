
let

  pkgs = import <nixpkgs> {};
  # pkgs-ghcjs = import <nixpkgs-ghcjs> {};
  pkgs-ghc-static = import <nixpkgs-ghc-static> {};

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

  haskell-static-compilation-test = {
    inherit (pkgs-ghc-static.haskellPackages) purescript;
  };

  # ghcjsPackages = with pkgs-ghcjs.haskell.packages.ghcjs; {
  #   inherit lucid Spock-api-ghcjs ghcjs-dom jsaddle-dom
  #     smallcheck tasty-smallcheck tasty-hunit smallcheck-series;
  # };
  # ghcjsHEADPackages = with pkgs-ghcjs.haskell.packages.ghcjsHEAD; {
  #   inherit lucid Spock-api-ghcjs ghcjs-dom jsaddle-dom
  #     smallcheck tasty-smallcheck tasty-hunit smallcheck-series;
  # };

  inherit (pkgs) mkvtoolnix;
  pyqt5 = pkgs.pythonPackages.pyqt5;
}
