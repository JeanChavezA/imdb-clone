-- Tabla de Películas
CREATE TABLE movies (
    movie_id SERIAL PRIMARY KEY,
    title TEXT NOT NULL,
    release_year INT,
    rating NUMERIC(3, 1),
    description TEXT,
    status TEXT DEFAULT 'active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla de Actores
CREATE TABLE actors (
    actor_id SERIAL PRIMARY KEY,
    actor_name TEXT NOT NULL,
    status TEXT DEFAULT 'active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla de Géneros
CREATE TABLE genres (
    genre_id SERIAL PRIMARY KEY,
    genre_name TEXT NOT NULL UNIQUE,
    status TEXT DEFAULT 'active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla de Directores
CREATE TABLE directors (
    director_id SERIAL PRIMARY KEY,
    director_name TEXT NOT NULL,
    status TEXT DEFAULT 'active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla de Premios
CREATE TABLE awards (
    award_id SERIAL PRIMARY KEY,
    award_name TEXT NOT NULL UNIQUE,
    status TEXT DEFAULT 'active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla de Idiomas
CREATE TABLE languages (
    language_id SERIAL PRIMARY KEY,
    language_name TEXT NOT NULL UNIQUE,
    status TEXT DEFAULT 'active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla de Usuarios
CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username TEXT NOT NULL UNIQUE,
    password_hash TEXT NOT NULL,
    email TEXT NOT NULL UNIQUE,
    status TEXT DEFAULT 'active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla de Críticas
CREATE TABLE reviews (
    review_id SERIAL PRIMARY KEY,
    movie_id INT REFERENCES movies(movie_id) ON DELETE CASCADE,
    user_id INT REFERENCES users(user_id) ON DELETE CASCADE,
    review_text TEXT,
    review_rating NUMERIC(3, 1),
    status TEXT DEFAULT 'active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla de Comentarios
CREATE TABLE comments (
    comment_id SERIAL PRIMARY KEY,
    review_id INT REFERENCES reviews(review_id) ON DELETE CASCADE,
    user_id INT REFERENCES users(user_id) ON DELETE CASCADE,
    comment_text TEXT,
    status TEXT DEFAULT 'active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla de Relación Películas-Géneros
CREATE TABLE movie_genres (
    movie_id INT REFERENCES movies(movie_id) ON DELETE CASCADE,
    genre_id INT REFERENCES genres(genre_id) ON DELETE CASCADE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (movie_id, genre_id)
);

-- Tabla de Relación Películas-Directores
CREATE TABLE movie_directors (
    movie_id INT REFERENCES movies(movie_id) ON DELETE CASCADE,
    director_id INT REFERENCES directors(director_id) ON DELETE CASCADE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (movie_id, director_id)
);

-- Tabla de Relación Películas-Idiomas
CREATE TABLE movie_languages (
    movie_id INT REFERENCES movies(movie_id) ON DELETE CASCADE,
    language_id INT REFERENCES languages(language_id) ON DELETE CASCADE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (movie_id, language_id)
);

-- Tabla de Relación Películas-Premios
CREATE TABLE movie_awards (
    movie_id INT REFERENCES movies(movie_id) ON DELETE CASCADE,
    award_id INT REFERENCES awards(award_id) ON DELETE CASCADE,
    year_awarded INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (movie_id, award_id)
);

-- Tabla de Roles (relación entre películas y actores)
CREATE TABLE roles (
    role_id SERIAL PRIMARY KEY,
    movie_id INT REFERENCES movies(movie_id) ON DELETE CASCADE,
    actor_id INT REFERENCES actors(actor_id) ON DELETE CASCADE,
    role_name TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla de Videos de Películas
CREATE TABLE movie_videos (
    video_id SERIAL PRIMARY KEY,
    movie_id INT REFERENCES movies(movie_id) ON DELETE CASCADE,
    video_url TEXT NOT NULL,
    uploaded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabla de Auditoría de Películas
CREATE TABLE movie_audit (
    audit_id SERIAL PRIMARY KEY,
    movie_id INT REFERENCES movies(movie_id),
    old_title TEXT,
    new_title TEXT,
    changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Índices únicos para optimización
CREATE UNIQUE INDEX IF NOT EXISTS idx_unique_username ON users(username);
CREATE UNIQUE INDEX IF NOT EXISTS idx_unique_email ON users(email);
CREATE UNIQUE INDEX IF NOT EXISTS idx_unique_genre_name ON genres(genre_name);
CREATE UNIQUE INDEX IF NOT EXISTS idx_unique_award_name ON awards(award_name);
CREATE UNIQUE INDEX IF NOT EXISTS idx_unique_language_name ON languages(language_name);

