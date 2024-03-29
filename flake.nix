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

      golang = {
        path = ./golang;
        description = "Flake for a golang application";
      };

      book = { 
        path = ./book;
        description = "Flake for a ebook using mdbook";
      };
    };
  };
}
