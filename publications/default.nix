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
  conferences = importPublications (lib.importTOML ./conferences.yaml);
  journals = importPublications (lib.importTOML ./journals.yaml);
  manuscripts = importPublications (lib.importTOML ./manuscripts.yaml);
  talks = importPublications (lib.importTOML ./talks.yaml);
  misc = importPublications (lib.importTOML ./preprints.yaml);
  files = pkgs.callPackage ./export.nix {};
}
