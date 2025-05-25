FROM python:3.12-slim
WORKDIR /app
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt
COPY . .
ENV PYTHONUNBUFFERED=1
# variables d’environnement (SECRET_KEY, DB_HOST…) à placer dans .env
CMD ["gunicorn", "event_management_system.wsgi:application", "--bind", "0.0.0.0:8000"]
