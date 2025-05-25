-- Activer la génération d'UUID (pratique si tu utilises des UUID dans tes modèles)
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- (Optionnel) Créer un schéma dédié sous ton utilisateur
-- CREATE SCHEMA IF NOT EXISTS event_schema AUTHORIZATION eventuser;

-- (Optionnel) Insérer quelques données de départ
-- INSERT INTO public.auth_user (username, email, password, is_superuser, is_staff, is_active, date_joined)
-- VALUES ('admin', 'admin@example.com', '…hashé…', TRUE, TRUE, TRUE, NOW());
