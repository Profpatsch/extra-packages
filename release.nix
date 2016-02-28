with import <nixpkgs> {};
{
  haskellPackages = {
    inherit (pkgs.haskellPackages) reactive-banana-wx;
  };
}
