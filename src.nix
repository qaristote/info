{ lib, ... }:
let
  fs = lib.fileset;
in
fs.toSource {
  root = ./.;
  fileset = fs.unions [
    ./default.nix
    ./basics
    ./education
    ./experience
    ./files
    ./languages
    ./research
    ./software
  ];
}
