{
  description = "My collection of flake templates";

  outputs = { self }: {

    templates = {

      basic = {
        path = ./basic;
        description = "A basic flake";
      };
    };
  };
}
