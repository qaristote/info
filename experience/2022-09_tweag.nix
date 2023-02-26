{ href, code, ... }:

{
  date = {
    start = "2022-09-14";
    end = "2023-02-24";
  };
  institution = {
    position = "Software Engineering intern";
    name = "Tweag";
    url = "https://www.tweag.io/";
    location = "Paris, France";
  };
  assets = [
    {
      name = "blog post";
      id = "aristoteSmtlibbackendsFasterSMTLIBbased2023";
      type = "Publications";
    }
    {
      name = "library";
      id = "aristoteSmtlibbackends2022";
      type = "Software";
    }
  ];
  description = "Sped-up ${
      href "https://github.com/tweag/pirouette" "Pirouette"
    } (a symbolic evaluator using incorrectness logic) by optimizing its interactions with SMT solvers.";
}
