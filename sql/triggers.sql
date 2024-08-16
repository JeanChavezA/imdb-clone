-- Eliminar trigger si ya existe
DROP TRIGGER IF EXISTS update_movies_timestamp ON movies;
DROP TRIGGER IF EXISTS update_actors_timestamp ON actors;
DROP TRIGGER IF EXISTS update_directors_timestamp ON directors;
DROP TRIGGER IF EXISTS trg_set_review_created_at ON reviews;
DROP TRIGGER IF EXISTS trg_audit_movie_changes ON movies;

-- Función para actualizar el campo 'updated_at'
CREATE OR REPLACE FUNCTION update_timestamp()
RETURNS TRIGGER AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Crear triggers nuevamente
CREATE TRIGGER update_movies_timestamp
BEFORE UPDATE ON movies
FOR EACH ROW
EXECUTE FUNCTION update_timestamp();

CREATE TRIGGER update_actors_timestamp
BEFORE UPDATE ON actors
FOR EACH ROW
EXECUTE FUNCTION update_timestamp();

CREATE TRIGGER update_directors_timestamp
BEFORE UPDATE ON directors
FOR EACH ROW
EXECUTE FUNCTION update_timestamp();

-- Otros triggers
CREATE TRIGGER trg_set_review_created_at
BEFORE INSERT ON reviews
FOR EACH ROW
EXECUTE FUNCTION update_timestamp();

CREATE TRIGGER trg_audit_movie_changes
AFTER UPDATE ON movies
FOR EACH ROW
EXECUTE FUNCTION audit_movie_changes();
