{ make, ... }:

builtins.map (path: make path { }) [ ./2016-09_llg.nix ./2018-09_ens ]
