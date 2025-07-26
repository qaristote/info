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
  conferences = importPublications (lib.importYAML ./conferences.yaml);
  journals = importPublications (lib.importYAML ./journals.yaml);
  manuscripts = importPublications (lib.importYAML ./manuscripts.yaml);
  talks = importPublications (lib.importYAML ./talks.yaml);
  misc = importPublications (lib.importYAML ./preprints.yaml);
  files = pkgs.callPackage ./export.nix {};
}
