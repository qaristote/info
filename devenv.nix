{inputs, ...}: {
  imports = [inputs.my-nixpkgs.devenvModules.personal];
  languages.nix = {
    enable = true;
    packaging.enable = true;
  };
}
