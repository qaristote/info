{
  markup,
  pkgs,
  ...
}: let
  files = ./files;
  commonArgs =
    markup
    // {
      inherit files make pkgs;
      inherit (pkgs) lib;
    };
  make = path: overrides: let
    f = import path;
  in
    f ((builtins.intersectAttrs (builtins.functionArgs f) commonArgs)
      // overrides);
in {
  inherit files;
  basics = make ./basics {};
  research = make ./research {};
  experience = make ./experience {};
  languages = make ./languages {};
  education = make ./education {};
  software = make ./software {};
}
