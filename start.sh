# start.sh
service nginx start
sleep 5  # Wait a few seconds for Nginx to start
uvicorn app.main:app --host 0.0.0.0 --port $PORT