{
  description = "Quentin Aristote's personal information.";

  inputs = {
    my-nixpkgs.url = "github:qaristote/my-nixpkgs";
    nixpkgs = {};
  };

  outputs = {
    flake-parts,
    my-nixpkgs,
    ...
  } @ inputs:
    flake-parts.lib.mkFlake {inherit inputs;} {
      imports = builtins.attrValues {inherit (my-nixpkgs.flakeModules) personal;};
      flake.lib.formatWith = attrs: import ./default.nix attrs;
    };
}
