{ make, ... }:

builtins.map (path: make path { }) [
  ./2019-06_lis.nix
  ./2020-03_nii.nix
  ./2022-03_irif.nix
  ./2022-09_tweag.nix
]
