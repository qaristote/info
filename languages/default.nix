{ make, ... }:
builtins.map (path: make path { }) [
  ./french.nix
  ./english.nix
  ./german.nix
  ./japanese.nix
]
