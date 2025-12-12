{
  description = "Runfiles stub development environment with Rust, Wine, and debugging tools";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };

        fhsEnv = pkgs.buildFHSUserEnv {
          name = "runfiles-stub-env";

          targetPkgs = pkgs: with pkgs; [
            # Rust toolchain
            rustup

            # Windows cross-compilation
            wine
            wine64

            # Debugging tools
            gdb

            # Build essentials
            gcc
            binutils
            pkg-config
            openssl

            # Additional utilities
            git
            curl
            wget
          ];

          profile = ''
            export RUST_BACKTRACE=1
            export RUSTUP_HOME=$HOME/.rustup
            export CARGO_HOME=$HOME/.cargo
            export PATH=$CARGO_HOME/bin:$PATH
          '';

          runScript = "bash";
        };
      in
      {
        devShells.default = fhsEnv.env;

        # Provide the FHS environment as a package
        packages.default = fhsEnv;
      }
    );
}
