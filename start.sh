# start.sh
# Start Nginx in the foreground
nginx -g 'daemon off;' &
uvicorn app.main:app --host 0.0.0.0 --port $PORT