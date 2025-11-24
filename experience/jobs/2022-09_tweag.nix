{ href, ... }:
{
  date = {
    start = {
      year = 2022;
      month = 9;
      day = 14;
    };
    end = {
      year = 2023;
      month = 2;
      day = 24;
    };
  };
  institution = {
    position = "Software Engineering intern";
    name = "Tweag";
    url = "https://www.tweag.io/";
    location = "Paris, France";
  };
  supervisors = [
    {
      name = "Tweag's HAS group";
      url = "https://www.tweag.io/group/high-assurance-software/";
    }
  ];
  assets = [
    {
      name = "blog post";
      id = "aristoteSmtlibbackendsFasterSMTLIBbased2023";
      type = "Writings";
    }
    {
      name = "library";
      id = "aristoteSmtlibbackends2022";
      type = "Software";
    }
  ];
  description = "Sped-up ${href "https://github.com/tweag/pirouette" "Pirouette"} (a symbolic evaluator using incorrectness logic) by optimizing its interactions with SMT solvers.";
}
