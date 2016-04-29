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

  haskellPackages_lts = {
    inherit (hp_lts) cassava HDBC HDBC-odbc wx wxcore cabal-install stack ghcid;
  };

  # quasselDaemonStatic = kde5.quasselDaemon.override { static = true; };

  inherit mkvtoolnix;
}
