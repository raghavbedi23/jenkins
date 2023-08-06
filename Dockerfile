# Use the official Nginx base image
FROM nginx:latest

# Copy your web pages to the Nginx default web server directory
COPY . /usr/share/nginx/html/

# Expose port 8000 for web traffic (change it to your preferred port)
EXPOSE 8000

# Start Nginx web server
CMD ["nginx", "-g", "daemon off;"]
