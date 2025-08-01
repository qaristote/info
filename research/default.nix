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
  conferences = importPublications (lib.importJSON ./conferences.json);
  journals = importPublications (lib.importJSON ./journals.json);
  reports = importPublications (lib.importJSON ./reports.json);
  misc = importPublications (lib.importJSON ./miscellaneous.json);
  talks = importPublications (lib.importJSON ./talks.json);
  files = pkgs.callPackage ./export.nix {refsJSON = lib.concatStringsSep " " [./conferences.json ./journals.json ./reports.json ./miscellaneous.json ./talks.json];};
}
