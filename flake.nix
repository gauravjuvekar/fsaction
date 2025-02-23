{
  description = "Simple filesystem watcher and thing-doer";

  inputs =
    {
      nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
      flake-utils.url = "github:numtide/flake-utils";
    };

  outputs = { nixpkgs, flake-utils, ... }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = nixpkgs.legacyPackages.${system};

        fsaction = pkgs.writeShellApplication {
          name = "fsaction";
          runtimeInputs =
            [
              pkgs.coreutils-full
              pkgs.inotify-tools
            ];
          text = ./src/fsaction;
        };
      in
      {
        packages.fsaction = fsaction;
        packages.default = fsaction;
      }
    );
}
