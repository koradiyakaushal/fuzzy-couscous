#!/bin/sh

tailwindcss -i {{ project_name }}/static/css/style.css -o {{ project_name }}/static/css/output.css --minify
python manage.py collectstatic --noinput
python manage.py migrate
gunicorn config.wsgi --config="deploy/gunicorn.conf.py"
