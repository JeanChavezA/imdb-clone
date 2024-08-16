# IMDB clone

A clone of [imdb](https://www.imdb.com) as a postgres extension.

## Development

Nix is used for development. Install it by following the instructions on https://nixos.org/download/.

You can start a local database with:

```
$ nix-shell

$ with-pg-16 psql

-- then try some query
postgres=# select * from items;
```

For running the tests use:

```
$ with-pg-16 make installcheck
```
## Configuración del Entorno de Desarrollo con Nix
Este proyecto utiliza Nix para gestionar dependencias. A continuación se explican los pasos para configurar y ejecutar el entorno de desarrollo.

## Cambios realizados en el archivo shell.nix
En la versión original del archivo shell.nix, hubo un problema relacionado con el hash del paquete de Nixpkgs. Para solucionarlo, realicé los siguientes cambios:

Cambio de la URL de Nixpkgs y corrección del hash:

Se actualizó la URL de Nixpkgs a una versión más estable y se corrigió el hash para que coincida con la descarga correcta.
El hash fue recalculado utilizando el comando nix-prefetch-url.
Cambios en shell.nix:

nix
Copy code
with import (builtins.fetchTarball {
  url = "https://github.com/NixOS/nixpkgs/archive/refs/tags/23.11.tar.gz";
  sha256 = "1ndiv385wlqyb3b18vw13991fzb9wg4cl21wglk89grsfnra41k";
}) {};

mkShell {
  buildInputs = [
    pkgs.postgresql_16
    pkgs.coreutils  # Herramientas básicas como 'ls', 'rm'
    pkgs.which      # Incluye el comando 'which'
    (pkgs.callPackage ./nix/pgExtension.nix { postgresql = pkgs.postgresql_16; })
    (pkgs.callPackage ./nix/pgScript.nix { postgresql = pkgs.postgresql_16; })
  ];

  extensionName = "imdb-clone";
}
## Instrucciones para recalcular el hash:

## Si necesitas recalcular el hash en el futuro, puedes usar el siguiente comando:

bash
Copy code
nix-prefetch-url --unpack https://github.com/NixOS/nixpkgs/archive/refs/tags/23.11.tar.gz
Este comando descargará el archivo y generará el hash correspondiente, que luego se puede reemplazar en el archivo shell.nix.

## Cómo ejecutar el entorno de desarrollo
Una vez que hayas clonado el repositorio y hayas verificado que nix está instalado en tu sistema, sigue estos pasos:

Asegúrate de que estás en el directorio del proyecto:

bash
Copy code
cd imdb-clone
## Ejecuta el siguiente comando para iniciar el entorno de desarrollo con Nix:

bash
Copy code
nix-shell
Esto descargará todas las dependencias y configurará el entorno necesario para el proyecto.

### Una vez dentro del entorno Nix, puedes ejecutar comandos como psql o scripts de base de datos según lo que hayas configurado.

## Cambios realizados el 16 de agosto de 2024

### Actualización del esquema de base de datos
- Se reemplazaron los tipos `VARCHAR` por `TEXT` en todas las tablas de la base de datos para mayor flexibilidad y eficiencia.
- Se agregó la opción `DROP TABLE IF EXISTS` a cada tabla dentro del archivo `schema.sql` para evitar errores al recrear las tablas.
  
### Estructura de la base de datos actualizada
- Se actualizaron las tablas `movies`, `actors`, `roles`, `users`, `reviews`, `genres`, `movie_genres`, `directors`, `movie_directors`, `languages`, `movie_languages`, `awards`, `movie_awards`, y `comments`.
  
### Gestión de triggers
- Se creó el archivo `triggers.sql` para manejar los triggers de la base de datos.
- Se incluyó la creación de triggers para auditar cambios en películas y para actualizar las marcas de tiempo (`updated_at`) automáticamente.

### Eliminación de archivos innecesarios
- Se eliminó la carpeta `data/` del repositorio de GitHub para evitar problemas de rendimiento y conflictos innecesarios.
- Se actualizó el archivo `.gitignore` para excluir la carpeta `data/` y los archivos temporales de PostgreSQL (`pg_stat_tmp/`).

### Mejoras en la gestión de PostgreSQL
- Se incluyeron índices adicionales en las tablas relevantes para mejorar el rendimiento de las consultas en columnas clave.
- Se realizaron ajustes en el manejo de la base de datos, tales como la eliminación de tablas y la creación de nuevas estructuras, sin causar conflictos con objetos existentes.


