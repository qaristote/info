{ pkgs, lib, ... }:

let
  csl = lib.importJSON ./publications.json;
  export = id: publication: format:
    let
      publicationJSON =
        builtins.toFile "${id}.json" (builtins.toJSON [ publication ]);
      publicationOut = pkgs.runCommand "${id}.${format}" { } ''
        "${pkgs.pandoc}/bin/pandoc" "${publicationJSON}" --from csljson --to "${format}" --output "$out"
      '';
    in builtins.readFile publicationOut;
  tryInherit = inheritFrom: attrs:
    with lib;
    foldl' (tmp: next:
      tmp ++ optional (hasAttr next inheritFrom) (getAttr next inheritFrom)) [ ]
    attrs;
in builtins.map (publication:
  with publication;
  let exportThisTo = export id publication;
  in publication // {
    year = with builtins; toString (head (head issued.date-parts));
    url = URL;
    cite = {
      bibtex = exportThisTo "bibtex";
      biblatex = exportThisTo "biblatex";
      csljson = exportThisTo "csljson";
    };
  }) csl
