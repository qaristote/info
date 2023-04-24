{ href, file, ... }:

let
  institution = {
    position = "Theoretical Computer Science student";
    name = "École Normale Supérieure";
    url = "https://www.ens.psl.eu/en";
  };
in {
  inherit institution;
  email = [
    {
      name = "academic";
      address = "quentin.aristote@irif.fr";
    }
    {
      name = "personal";
      address = "quentin@aristote.fr";
    }
  ];
  avatar = file "avatar.jpg";
  location = {
    office = "4031";
    number = "8";
    street = "place Aurélie Nemours";
    city = "Paris";
    postalCode = "75013";
    country = "France";
  };
  profiles = {
    Git = {
      icon = "git";
      profiles = {
        personal = {
          icon = "github";
          url = "https://github.com/qaristote";
        };
        ENS = {
          icon = "gitlab";
          url = "https://git.eleves.ens.fr/qaristote";
        };
        IRIF = {
          icon = "gitlab";
          url = "https://gitlab.math.univ-paris-diderot.fr/aristote";
        };
      };
    };
    LinkedIn = {
      icon = "linkedin";
      url = "https://fr.linkedin.com/in/quentin-aristote-83979b186";
    };
  };
  keys = let
    getKeyFiles = type: keys: {
      "${type}" = builtins.foldl'
        (tmp: name: tmp // { "${name}" = file "keys/${type}/${name}.pub"; }) { }
        keys;
    };
  in getKeyFiles "pgp" [ "DFC1660846EEA97C059F18534EF515441E635D36" ]
  // getKeyFiles "ssh" [ "qaristote@latitude-7490" ];
  name = "Quentin Aristote";
  url = "https://quentin.aristote.fr/";
  description = ''
    I am a student at the ${
      href "https://www.di.ens.fr/" "Computer Science Department (DI)"
    } of the ${with institution; href url name}, an institution part of ${
      href "https://psl.eu/en" "PSL University"
    }.

    I am mainly interested in applying abstract mathematical theories (e.g. category theory) to computer science in order to get new results for free. I am also interested in practical computer science and enjoy programming using functional languages as well as tinkering with systems.
  '';
}
