let
  mach-nix = import (builtins.fetchGit {
    url = "https://github.com/DavHau/mach-nix";
    ref = "refs/tags/3.4.0";
  }) {
    # optionally bring your own nixpkgs
    # pkgs = import <nixpkgs> {};

    # optionally specify the python version
    # python = "python38";

    # optionally update pypi data revision from https://github.com/DavHau/pypi-deps-db
    # pypiDataRev = "some_revision";
    # pypiDataSha256 = "some_sha256";
  };
in
  mach-nix.buildPythonPackage "https://github.com/eliep/i3-layouts/archive/refs/tags/v0.13.2.tar.gz"
