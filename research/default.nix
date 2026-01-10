{
  pkgs,
  lib,
  ...
}:
let
  importResearch = builtins.map (
    researchItem:
    with researchItem;
    researchItem
    // {
      year = with builtins; toString (head (head issued.date-parts));
      url = researchItem.URL or null;
    }
  );
in
{
  conferences = importResearch (lib.importJSON ./conferences.json);
  journals = importResearch (lib.importJSON ./journals.json);
  reports = importResearch (lib.importJSON ./reports.json);
  misc = importResearch (lib.importJSON ./miscellaneous.json);
  talks = importResearch (lib.importJSON ./talks.json);
  files = pkgs.callPackage ./export.nix {
    refsJSON = lib.concatStringsSep " " [
      ./conferences.json
      ./journals.json
      ./reports.json
      ./miscellaneous.json
      ./talks.json
    ];
  };
}
