# Use an official base image
FROM ubuntu:20.04

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Install packages
RUN apt-get update && apt-get install -y \
    nginx \
    curl

# Add files to the image
COPY index.html /var/www/html/index.html

# Expose ports
EXPOSE 80

# Command to run the application
CMD ["nginx", "-g", "daemon off;"]