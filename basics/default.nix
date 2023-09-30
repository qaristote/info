{
  href,
  file,
  ...
}: let
  institution = {
    position = "PhD student in Theoretical Computer Science";
    name = "IRIF";
    url = "https://www.irif.fr/en/index";
  };
in {
  inherit institution;
  email = {
    academic = "quentin.aristote@irif.fr";
    personal = "quentin@aristote.fr";
  };
  avatar = file "avatar.jpg";
  location = {
    office = "3010";
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
        IRIF = {
          icon = "gitlab";
          url = "https://gitlab.math.univ-paris-diderot.fr/aristote";
        };

        ENS = {
          icon = "gitlab";
          url = "https://git.eleves.ens.fr/qaristote";
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
      "${type}" =
        builtins.foldl'
        (tmp: name: tmp // {"${name}" = file "keys/${type}/${name}.pub";}) {}
        keys;
    };
  in
    getKeyFiles "pgp" ["DFC1660846EEA97C059F18534EF515441E635D36"]
    // getKeyFiles "ssh" ["qaristote@latitude-7490"];
  name = {
    first = "Quentin";
    last = "Aristote";
  };
  url = "https://quentin.aristote.fr/";
  description = ''
    I am a PhD student in Theoretical Computer Science at ${
      href "https://www.irif.fr/en/index" "IRIF"
    }, under the supervision of ${
      href "https://www.irif.fr/~petrisan/" "Daniela Petrişan"
    }. My PhD involves studying the compositionality of ${
      href "https://en.wikipedia.org/wiki/Monad_(category_theory)" "monads"
    } through ${
      href "https://ncatlab.org/nlab/show/weak+distributive+law"
      "weak distributive laws"
    }, and its applications to ${
      href "https://en.wikipedia.org/wiki/Side-effect_(computer_science)"
      "effectful programming"
    }, in particular within ${
      href "https://en.wikipedia.org/wiki/Automata_theory" "automata theory"
    }.

    More generally, I am mainly interested in applying abstract mathematical theories (e.g. category theory) to computer science in order to get new results for free. I am also interested in practical computer science and enjoy programming using functional languages as well as tinkering with systems.
  '';
}
