IMDB Clone
Este es un clon de IMDB construido como una extensión de PostgreSQL.

Descripción del Proyecto
Este proyecto tiene como objetivo replicar las funcionalidades principales del sitio web IMDB utilizando PostgreSQL para la base de datos. Se ha estructurado de manera modular, permitiendo la creación y gestión de películas, actores, géneros, reseñas, y mucho más.

Características Principales
Gestión de películas, actores, directores y géneros.
Sistema de reseñas y calificaciones de usuarios.
Relación entre películas y sus géneros, directores y premios.
Integración de índices y triggers para optimización de consultas.
Requisitos Previos
Antes de comenzar, asegúrate de tener instalado lo siguiente:

Nix
PostgreSQL 16
Instalación
Clona el repositorio:

bash
Copy code
git clone https://github.com/JeanChavezA/imdb-clone.git
cd imdb-clone
Inicia el entorno de desarrollo con Nix:

bash
Copy code
nix-shell
Configura la base de datos local:

bash
Copy code
with-pg-16 psql -f sql/schema.sql
Ejecuta los tests:

bash
Copy code
with-pg-16 make installcheck
Uso
Una vez configurado el entorno, puedes ejecutar consultas directamente en PostgreSQL. Por ejemplo:

sql
Copy code
SELECT * FROM movies;
Estructura del Proyecto
sql/: Contiene los scripts SQL para la creación de tablas, índices y triggers.
nix/: Archivos de configuración para gestionar el entorno de desarrollo.
test/: Scripts y pruebas del sistema.
Futuras Mejoras
Frontend: Se integrará React.js para proporcionar una interfaz de usuario rica.
API: Desarrollo de una API RESTful con Django Rest Framework para interactuar con la base de datos.
Contribuciones
Se aceptan contribuciones. Puedes enviar tus pull requests o abrir un issue para reportar errores o sugerir mejoras.

Licencia
Este proyecto está bajo la licencia MIT.
