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
    inherit (hp) reactive-banana-wx pandoc;
  };
}
