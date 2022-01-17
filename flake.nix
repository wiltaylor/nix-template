{
  description = "My collection of flake templates";

  outputs = { self }: {

    templates = {

      basic = {
        path = ./basic;
        description = "A basic flake";
      };

      overlay = {
        path = ./overlay;
        description = "Simple flake with pkgs and overlay";
      };
    };
  };
}
