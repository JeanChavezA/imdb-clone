-- Tabla de películas
DROP TABLE IF EXISTS movies CASCADE;
CREATE TABLE movies (
    movie_id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    release_year INT,
    rating NUMERIC(3, 1),
    description TEXT,
    release_date DATE
);

    CREATE INDEX idx_movie_title ON movies (title);

-- Tabla de actores
DROP TABLE IF EXISTS actors CASCADE;
CREATE TABLE actors (
    actor_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL
);

CREATE INDEX idx_actor_name ON actors (name);


-- Tabla de roles
DROP TABLE IF EXISTS roles CASCADE;
CREATE TABLE roles (
    role_id SERIAL PRIMARY KEY,
    movie_id INT REFERENCES movies(movie_id),
    actor_id INT REFERENCES actors(actor_id),
    role_name TEXT
);

-- Tabla de usuarios
DROP TABLE IF EXISTS users CASCADE;
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username TEXT NOT NULL UNIQUE,
    email TEXT NOT NULL UNIQUE,
    password_hash TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE UNIQUE INDEX idx_user_email ON users (email);


-- Tabla de reseñas
DROP TABLE IF EXISTS reviews CASCADE;
CREATE TABLE reviews (
    review_id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(user_id),
    movie_id INT REFERENCES movies(movie_id),
    rating NUMERIC(2, 1) CHECK (rating >= 0 AND rating <= 10),
    review_text TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_review_movie_id ON reviews (movie_id);
CREATE INDEX idx_review_user_id ON reviews (user_id);


-- Tabla de géneros
DROP TABLE IF EXISTS genres CASCADE;
CREATE TABLE genres (
    genre_id SERIAL PRIMARY KEY,
    genre_name TEXT NOT NULL UNIQUE
);

-- Tabla para la relación entre películas y géneros
DROP TABLE IF EXISTS movie_genres CASCADE;
CREATE TABLE movie_genres (
    movie_id INT REFERENCES movies(movie_id),
    genre_id INT REFERENCES genres(genre_id),
    PRIMARY KEY (movie_id, genre_id)
);

CREATE INDEX idx_movie_genres_movie_id ON movie_genres (movie_id);
CREATE INDEX idx_movie_genres_genre_id ON movie_genres (genre_id);


-- Tabla de directores
DROP TABLE IF EXISTS directors CASCADE;
CREATE TABLE directors (
    director_id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    date_of_birth DATE NOT NULL
);

-- Tabla para la relación entre películas y directores
DROP TABLE IF EXISTS movie_directors CASCADE;
CREATE TABLE movie_directors (
    movie_id INT REFERENCES movies(movie_id),
    director_id INT REFERENCES directors(director_id),
    PRIMARY KEY (movie_id, director_id)
);

-- Tabla de idiomas
DROP TABLE IF EXISTS languages CASCADE;
CREATE TABLE languages (
    language_id SERIAL PRIMARY KEY,
    language_name TEXT NOT NULL UNIQUE
);

-- Tabla para la relación entre películas e idiomas
DROP TABLE IF EXISTS movie_languages CASCADE;
CREATE TABLE movie_languages (
    movie_id INT REFERENCES movies(movie_id),
    language_id INT REFERENCES languages(language_id),
    PRIMARY KEY (movie_id, language_id)
);

-- Tabla de premios
DROP TABLE IF EXISTS awards CASCADE;
CREATE TABLE awards (
    award_id SERIAL PRIMARY KEY,
    award_name TEXT NOT NULL UNIQUE
);

-- Tabla para la relación entre películas y premios
DROP TABLE IF EXISTS movie_awards CASCADE;
CREATE TABLE movie_awards (
    movie_id INT REFERENCES movies(movie_id),
    award_id INT REFERENCES awards(award_id),
    year_awarded INT,
    PRIMARY KEY (movie_id, award_id)
);

-- Tabla de comentarios en las reseñas
DROP TABLE IF EXISTS comments CASCADE;
CREATE TABLE comments (
    comment_id SERIAL PRIMARY KEY,
    review_id INT REFERENCES reviews(review_id),
    user_id INT REFERENCES users(user_id),
    comment_text TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla de auditoria
DROP TABLE IF EXISTS movie_audit CASCADE;
CREATE TABLE movie_audit (
    audit_id SERIAL PRIMARY KEY,
    movie_id INT,
    old_title TEXT,
    new_title TEXT,
    changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);