#!/usr/bin/env bash
# Build script for Render Native Python Runtime
set -o errexit

echo ">>> Building React Frontend with Vite..."
cd frontend
npm install
npm run build
cd ..

echo ">>> Installing Backend Dependencies..."
cd backend
pip install -r requirements.txt
python manage.py collectstatic --noinput
python manage.py migrate --noinput
cd ..

echo ">>> Build completed successfully!"
