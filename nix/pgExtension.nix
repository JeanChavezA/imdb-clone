{ stdenv, postgresql, extensionName }:

stdenv.mkDerivation {
  name = extensionName;

  buildInputs = [ postgresql ];

  src = ../.;

  installPhase = ''
    install -D -t $out/share/postgresql/extension sql/*.sql
    install -D -t $out/share/postgresql/extension ${extensionName}.control
  '';
}
