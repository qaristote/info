{
  pkgs,
  lib,
  ...
}: let
  importPublications = builtins.map (publication:
    with publication;
      publication
      // {
        year = with builtins; toString (head (head issued.date-parts));
        url = URL;
      });
in {
  selected = importPublications (lib.importJSON ./publications_selected.json);
  all = importPublications (lib.importJSON ./publications.json);
  files = pkgs.callPackage ./export.nix {};
}
