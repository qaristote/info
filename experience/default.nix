{ make, ... }:
{
  jobs = make ./jobs { };
  service = make ./service { };
}
