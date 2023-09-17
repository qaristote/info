{make, ...}:
builtins.map (path: make path {}) [./french.nix ./english.nix ./japanese.nix]
