{ href, file, ... }:

let
  institution = {
    position = "student in Theoretical Computer Science";
    name = "École Normale Supérieure";
    url = "https://www.ens.psl.eu/en";
  };
in {
  inherit institution;
  email = [
    {
      name = "academic";
      address = "quentin.aristote@ens.fr";
    }
    {
      name = "personal";
      address = "quentin@aristote.fr";
    }
  ];
  avatar = file "avatar.jpg";
  location = {
    number = "45";
    street = "rue d'Ulm";
    city = "Paris";
    postalCode = "75230 CEDEX 05";
    country = "France";
  };
  profiles = [
    {
      network = "GitLab";
      url = "https://git.eleves.ens.fr/qaristote";
      username = "qaristote";
    }
    {
      network = "GitLab";
      url = "https://gitlab.math.univ-paris-diderot.fr/aristote";
      username = "aristote";
    }
    {
      network = "GitHub";
      url = "https://github.com/qaristote";
      username = "qaristote";
    }
  ];
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
