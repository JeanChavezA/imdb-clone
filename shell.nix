with import (builtins.fetchTarball {
  url = "https://github.com/NixOS/nixpkgs/archive/refs/tags/23.11.tar.gz";
  sha256 = "1ndiv385w1qyb3b18vw13991fzb9wg4cl21wglk89grsfsnra41k";
}) {};

mkShell {
  buildInputs = [
    pkgs.postgresql_16
    pkgs.coreutils       # Herramientas básicas como 'ls', 'rm'
    pkgs.which           # Incluye el comando 'which'
    (pkgs.callPackage ./nix/pgExtension.nix { 
      postgresql = pkgs.postgresql_16;
      extensionName = "imdb-clone";
    })
  ];
}
