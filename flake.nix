{
  description = "A Website for the Honorable Seas";

  inputs = {
    nixpkgs.url = "nixpkgs";
  };

  outputs = {
    self,
    nixpkgs,
  }: let
    lib = nixpkgs.lib;
    systems = ["aarch64-linux" "x86_64-linux"];
    eachSystem = f:
      lib.foldAttrs lib.mergeAttrs {}
      (map (s: lib.mapAttrs (_: v: {${s} = v;}) (f s)) systems);
  in
    eachSystem (system: let
      pkgs = import nixpkgs {
        inherit system;
        overlays = [(final: prev: {})];
      };
    in {
      # apps = let
      #   mkShellApp = name: script:
      #     let drv = pkgs.writeShellScriptBin name script;
      #     in {
      #       type = "app";
      #       program = "${drv}/bin/${drv.name}";
      #     };
      # in {
      #   default = watch;
      #   watch = mkShellApp "scurvyless-watch" ''
      #     ${pkgs.zig}/bin/zig build --watch -p public
      #   '';
      #   serve = mkShellApp "scurvyless-serve" ''
      #     ${pkgs.python3}/bin/python3 -m http.server -d public
      #   '';
      # };

      formatter = pkgs.alejandra;

      devShells.default = pkgs.stdenv.mkDerivation {
        name = "scurvyless";
        nativeBuildInputs = with pkgs; [pandoc rsync python3 bun go air gopls];

        meta = {
          maintainers = ["Evan Stokdyk <evan.stokdyk@gmail.com>"];
          description = "A Website for the Honorable Seas";
        };
      };
    });
}
