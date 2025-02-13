# start.sh
# Start Nginx in the foreground
nginx -g 'daemon off;' &

# Wait a few seconds to ensure Nginx starts properly
sleep 2

uvicorn main:app --host 0.0.0.0 --port ${PORT:-8000}