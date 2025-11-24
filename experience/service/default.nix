{ make, ... }:
builtins.map (path: make path { }) [
  ./reviews.nix
  ./teaching.nix
]
