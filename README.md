# Event Management System

## Description
Event Management System est une application web construite avec Django pour le backend et Nginx pour le frontend. Elle permet de gérer des catégories et des événements, de visualiser les détails et d’accéder à l’interface d’administration.

## Structure du projet
```
project-root/
├── backend/                   # Code serveur Django
├── frontend/                  # Serveur Nginx et fichiers statiques
├── database/                  # Script d'initialisation de la base
├── docker-compose.yml         # Orchestration Docker
└── README.md                  # Documentation du projet
```

### Dossier `backend/`
- Contient le projet Django (`manage.py`, `settings.py`, apps, modèles, vues, templates).
- `Dockerfile` pour construire l'image Python/Django.
- `requirements.txt` pour les dépendances Python.
- `.env` pour les variables d'environnement (SECRET_KEY, accès Postgres).
- Gère les migrations et la logique métier.

### Dossier `frontend/`
- Contient la configuration Nginx (`nginx.conf`) pour :
  - Servir les fichiers statiques (`/static/`).
  - Reverse-proxy toutes les autres requêtes vers Django (backend).
- `Dockerfile` pour construire l'image Nginx.
- Le dossier `static/` regroupe les fichiers collectés par Django.

### Dossier `database/`
- `init.sql` : script d'initialisation SQL (extensions, données de base).

## Prérequis
- Docker
- Docker Compose

## Lancement du projet

1. **Cloner le dépôt**  
   ```bash
   git clone <url-du-repo>
   cd project-root
   ```

2. **Configurer les variables d’environnement**  
   Éditer `backend/.env` :
   ```dotenv
   POSTGRES_DB=eventdb
   POSTGRES_USER=eventuser
   POSTGRES_PASSWORD=ChangeMe123
   DB_HOST=db
   DB_PORT=5432

   DJANGO_SECRET_KEY=ta_secret_key
   DEBUG=True
   ```

3. **Lancer les conteneurs**  
   ```bash
   docker-compose up --build -d
   ```

4. **Appliquer les migrations et créer le super-utilisateur**  
   ```bash
   docker-compose run --rm backend python manage.py migrate
   docker-compose run --rm backend python manage.py createsuperuser
   ```

5. **Collecter les fichiers statiques**  
   ```bash
   docker-compose run --rm backend python manage.py collectstatic --noinput
   ```

6. **Redémarrer les services**  
   ```bash
   docker-compose up -d
   ```

## Accès à l’application
- Frontend (toutes les pages, proxy vers Django) : http://localhost:3000  
- Admin Django : http://localhost:3000/admin/

## Arrêt et nettoyage
```bash
docker-compose down -v
```

## Dépannage
- Conflit de ports : vérifier que les ports 3000 (frontend) et 5432 (Postgres) sont libres ou ajuster dans `docker-compose.yml`.
- Nouvelles dépendances Python : reconstruire l’image backend  
  ```bash
  docker-compose build backend
  ```

## Licence
MIT
