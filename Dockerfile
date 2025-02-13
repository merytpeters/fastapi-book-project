# Use the Official python image
FROM python:3.12.0-slim

# Set the working directory in the container
WORKDIR /app

# Install system dependencies and nginx
RUN apt-get update && apt-get install -y nginx && apt-get clean

# Copy the requirements.txt
COPY requirements.txt .

# Install the dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the entire app into the container
COPY . .

# Copy nginx configuration file to container
COPY ./fastapinginx.conf /etc/nginx/nginx.conf

# Expose the ports for nginx and uvicorn
EXPOSE 80
EXPOSE 8000

# Command to run the app
CMD ["sh", "-c", "service nginx start && uvicorn app.main:app --host 0.0.0.0 --port 8000"]