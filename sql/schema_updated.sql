-- Tabla de auditoría de películas
CREATE TABLE IF NOT EXISTS movie_audit (
    audit_id SERIAL PRIMARY KEY,
    movie_id INT,
    old_title TEXT,
    new_title TEXT,
    changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Agregar tabla para almacenar las URLs de trailers o videos de las películas
CREATE TABLE IF NOT EXISTS movie_videos (
    video_id SERIAL PRIMARY KEY,
    movie_id INT REFERENCES movies(movie_id),
    video_url TEXT NOT NULL,  -- URL o path al archivo del video
    uploaded_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Mejoras propuestas por el experto en bases de datos:
-- 1. Agregar campo "created_at" y "updated_at" a todas las tablas que lo requieran para auditoría
ALTER TABLE users ADD COLUMN IF NOT EXISTS created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE users ADD COLUMN IF NOT EXISTS updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE actors ADD COLUMN IF NOT EXISTS created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE actors ADD COLUMN IF NOT EXISTS updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE genres ADD COLUMN IF NOT EXISTS created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE genres ADD COLUMN IF NOT EXISTS updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE movies ADD COLUMN IF NOT EXISTS created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE movies ADD COLUMN IF NOT EXISTS updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE directors ADD COLUMN IF NOT EXISTS created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP;
ALTER TABLE directors ADD COLUMN IF NOT EXISTS updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP;

-- 2. Agregar campo "status" para soft delete a las tablas importantes
ALTER TABLE movies ADD COLUMN IF NOT EXISTS status TEXT DEFAULT 'active';
ALTER TABLE users ADD COLUMN IF NOT EXISTS status TEXT DEFAULT 'active';
ALTER TABLE reviews ADD COLUMN IF NOT EXISTS status TEXT DEFAULT 'active';

-- 3. Asegurar que los campos únicos tengan índices correctos para optimización
CREATE UNIQUE INDEX IF NOT EXISTS idx_unique_username ON users(username);
CREATE UNIQUE INDEX IF NOT EXISTS idx_unique_email ON users(email);
CREATE UNIQUE INDEX IF NOT EXISTS idx_unique_genre_name ON genres(genre_name);
CREATE UNIQUE INDEX IF NOT EXISTS idx_unique_award_name ON awards(award_name);
CREATE UNIQUE INDEX IF NOT EXISTS idx_unique_language_name ON languages(language_name);

-- 4. Agregar un mecanismo de autenticación básico (hasheado de contraseñas ya incluido)
-- Este mecanismo se implementará a nivel de la aplicación fuera del esquema SQL.

-- 5. Foreign keys existentes ya están optimizadas.
-- Todas las claves foráneas están presentes y correctamente configuradas.
