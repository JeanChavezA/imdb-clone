-- Tabla de Películas
CREATE TABLE movies (
    movie_id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    release_year INT,
    rating NUMERIC(3, 1),
    description TEXT
);

-- Tabla de Actores
CREATE TABLE actors (
    actor_id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL
);

-- Tabla de Roles
CREATE TABLE roles (
    role_id SERIAL PRIMARY KEY,
    movie_id INT REFERENCES movies(movie_id),
    actor_id INT REFERENCES actors(actor_id),
    role_name VARCHAR(255)
);

-- Tabla de Géneros
CREATE TABLE genres (
    genre_id SERIAL PRIMARY KEY,
    genre_name VARCHAR(100) NOT NULL
);

-- Tabla de Relación Películas-Géneros
CREATE TABLE movie_genres (
    movie_id INT REFERENCES movies(movie_id),
    genre_id INT REFERENCES genres(genre_id),
    PRIMARY KEY (movie_id, genre_id)
);

-- Tabla de Usuarios
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(255) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    email VARCHAR(255) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla de Críticas
CREATE TABLE reviews (
    review_id SERIAL PRIMARY KEY,
    movie_id INT REFERENCES movies(movie_id),
    user_id INT REFERENCES users(user_id),
    review_text TEXT,
    review_rating NUMERIC(3, 1),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla de directores
CREATE TABLE IF NOT EXISTS directors (
    director_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

-- Tabla de premios
CREATE TABLE IF NOT EXISTS awards (
    award_id SERIAL PRIMARY KEY,
    award_name TEXT NOT NULL UNIQUE
);

-- Tabla de idiomas
CREATE TABLE IF NOT EXISTS languages (
    language_id SERIAL PRIMARY KEY,
    language_name TEXT NOT NULL UNIQUE
);
