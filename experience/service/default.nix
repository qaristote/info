{ make, ... }:
{
  reviews = make ./reviews.nix { };
  teaching = make ./teaching.nix { };
}
