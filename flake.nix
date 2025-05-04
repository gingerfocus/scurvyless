{
  description = "A Website for the Honorable Seas";

  inputs = {
    nixpkgs.url = "nixpkgs"; # use the system nixpkgs if not locked
    nixpkgs-unstable.url = github:nixos/nixpkgs/nixpkgs-unstable;
  };



  outputs = { self, nixpkgs, nixpkgs-unstable}:
    let
      lib = nixpkgs.lib;
      systems = [ "aarch64-linux" "x86_64-linux" ];
      eachSystem = f:
        lib.foldAttrs lib.mergeAttrs { }
        (map (s: lib.mapAttrs (_: v: { ${s} = v; }) (f s)) systems);
    in eachSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          overlays = [ (final: prev: { }) ];
        };
        pkgs-unstable = import nixpkgs-unstable { inherit system; };
        mkShellApp = name: script:
          let drv = pkgs.writeShellScriptBin name script;
          in {
            type = "app";
            program = "${drv}/bin/${drv.name}";
          };
      in {
        apps = rec {
          default = watch;
          watch = mkShellApp "scurvyless-watch" ''
            # ../zig/build/stage3/bin/zig build --watch -p public
            ${pkgs-unstable.zig}/bin/zig build --watch -p public
          '';
          serve = mkShellApp "opendawn-serve" ''
            ${pkgs.python3}/bin/python3 -m http.server -d public
          '';
        };

        devShells.default = pkgs.stdenv.mkDerivation {
          name = "scurvyless";
          nativeBuildInputs = with pkgs; [ pandoc zig rsync python3 ];
          buildInputs = with pkgs; [ ];

          # shellHook = '''';

          meta = {
            maintainers = [ "Evan Stokdyk <evan.stokdyk@gmail.com>" ];
            description = "A Website for the Honorable Seas";
          };
        };
      });
}

