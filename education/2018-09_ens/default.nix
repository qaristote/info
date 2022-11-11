{ make, ... }:

{
  date = {
    start = "2018-09-01";
    end = "2023-08-31";
  };
  institution = {
    name = "École Normale Supérieure";
    url = "https://www.ens.psl.eu/en";
    location = "Paris, France";
  };
  studyType = "Master's degree in Theoretical Computer Science";
  years = builtins.map (path: make path { }) [
    ./2018-09_l3.nix
    ./2019-09_m1.nix
    ./2021-09_m2.nix
  ];
  description =
    "Took two gap years: one to follow additional postgraduate courses in Mathematics; one to do additional internships.";
}
