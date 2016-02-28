with import <nixpkgs> {};
{
  packages = (import <nixpkgs/nixos> {
    configuration = {
      system.extraDependencies = [
        haskellPackages.reactive-banana-wx
      ];
    };
  }).vm;
}
