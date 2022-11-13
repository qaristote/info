{
  description = "Quentin Aristote's personal information.";

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let pkgs = nixpkgs.legacyPackages.${system};
      in { formatWith = markup: import ./default.nix { inherit markup pkgs; }; });
}

