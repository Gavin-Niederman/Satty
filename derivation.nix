{ pkgs, rustPlatform, ... }:

rustPlatform.buildRustPackage {
  pname = "satty";
  version = "0.7.0";

  src = ./.;

  cargoLock.lockFile = ./Cargo.lock;

  nativeBuildInputs = with pkgs; [
    pkg-config
  ];

  buildInputs = with pkgs; [
    libadwaita
    glib
    pango
    cairo
    gtk4
    gtk3
    gdk-pixbuf
  ];
}
