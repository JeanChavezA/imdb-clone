## IMDB Clone

Este es un clon de IMDB construido como una extensión de PostgreSQL.

### Descripción del Proyecto

Este proyecto tiene como objetivo replicar las funcionalidades principales del sitio web IMDB utilizando PostgreSQL para la base de datos. Se ha estructurado de manera modular, permitiendo la creación y gestión de películas, actores, géneros, reseñas, y mucho más.

### Características Principales

- Gestión de películas, actores, directores y géneros.
- Sistema de reseñas y calificaciones de usuarios.
- Relación entre películas y sus géneros, directores y premios.
- Integración de índices y triggers para optimización de consultas.

## Requisitos Previos

Antes de comenzar, asegúrate de tener instalado lo siguiente:

- [Nix](https://nixos.org/download/)
- PostgreSQL 16

### Estructura del Proyecto
sql/: Contiene los scripts SQL para la creación de tablas, índices y triggers.
nix/: Archivos de configuración para gestionar el entorno de desarrollo.
test/: Scripts y pruebas del sistema.

### Futuras Mejoras
Frontend: Se integrará React.js para proporcionar una interfaz de usuario rica.
API: Desarrollo de una API RESTful con Django Rest Framework para interactuar con la base de datos.

### Licencia
Este proyecto está bajo la licencia MIT.
