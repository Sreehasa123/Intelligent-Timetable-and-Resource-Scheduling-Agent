# ==========================================
# Multi-Stage Dockerfile for Smart Campus
# Stage 1: Build the Vite React Frontend
# ==========================================
FROM node:20-alpine AS frontend-builder
WORKDIR /app/frontend

COPY frontend/package*.json ./
RUN npm install

COPY frontend/ ./
RUN npm run build

# ==========================================
# Stage 2: Production Python & Django Server
# ==========================================
FROM python:3.11-slim
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

WORKDIR /app

RUN apt-get update && apt-get install -y --no-install-recommends \
    build-essential \
    curl \
    && rm -rf /var/lib/apt/lists/*

COPY backend/requirements.txt /app/
RUN pip install --no-cache-dir -r requirements.txt

# Copy backend files
COPY backend/ /app/

# Copy compiled frontend dist from Stage 1
COPY --from=frontend-builder /app/frontend/dist /frontend/dist

# Collect static files into staticfiles directory
RUN python manage.py collectstatic --noinput

# Render sets PORT dynamically (defaults to 10000 on Render)
ENV PORT=10000
EXPOSE ${PORT}

# Production start with Gunicorn binding to assigned PORT
CMD exec gunicorn config.wsgi:application --bind 0.0.0.0:${PORT} --workers 2 --threads 4 --timeout 120
