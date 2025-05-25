# Event Management System

## Description
Event Management System is a web application built with Django for the backend and a static frontend served via Nginx. It allows users to manage categories and events, view event details, and access an admin interface.

## Project Structure
```
project-root/
├── backend/                   # Django project
│   ├── Dockerfile             # Dockerfile for backend
│   ├── requirements.txt       # Python dependencies
│   ├── .env                   # Environment variables for backend
│   ├── manage.py
│   ├── event_management_system/
│   └── event_management_system_app/
│       ├── models.py
│       ├── views.py
│       ├── templates/
│       └── staticfiles/
├── frontend/                  # Nginx reverse-proxy and static assets
│   ├── Dockerfile             # Dockerfile for frontend
│   ├── nginx.conf             # Nginx configuration
│   └── static/                # Collected static files
├── database/
│   └── init.sql               # Database initialization script
├── docker-compose.yml         # Compose file for orchestration
└── README.md                  # This file
```

## Prerequisites
- Docker
- Docker Compose

## Setup

1. **Clone the repository**  
   ```bash
   git clone <repository-url>
   cd project-root
   ```

2. **Configure environment variables**  
   Edit `backend/.env` with your settings:
   ```dotenv
   POSTGRES_DB=eventdb
   POSTGRES_USER=eventuser
   POSTGRES_PASSWORD=ChangeMe123
   DB_HOST=db
   DB_PORT=5432

   DJANGO_SECRET_KEY=your_secret_key
   DEBUG=True
   ```

## Usage

### 1. Build and run containers
```bash
docker-compose up --build -d
```

### 2. Apply migrations and create superuser
```bash
docker-compose run --rm backend python manage.py migrate
docker-compose run --rm backend python manage.py createsuperuser
```

### 3. Collect static files
```bash
docker-compose run --rm backend python manage.py collectstatic --noinput
```

### 4. Restart services
```bash
docker-compose up -d
```

## Accessing the Application
- Frontend (all pages & proxy to backend): http://localhost:3000
- Django Admin (via proxy): http://localhost:3000/admin/

## Stopping and Cleaning Up
```bash
docker-compose down -v
```

## Troubleshooting
- **Port conflicts**: Ensure ports 3000 (frontend) and 5432 (Postgres) are free or adjust in `docker-compose.yml`.
- **Missing dependencies**: If you add new Python packages, rebuild the backend image:
  ```bash
  docker-compose build backend
  ```

## License
MIT License
