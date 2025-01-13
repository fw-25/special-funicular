FROM nginx:alpine

# Create a directory for nginx cache with the right permissions
RUN mkdir -p /var/cache/nginx && \
    chmod -R 777 /var/cache/nginx && \
    chmod -R 777 /var/run

# Copy your static files to the nginx default web directory
COPY . /usr/share/nginx/html

# Expose the default port
EXPOSE 8080

# Use a non-root user for OpenShift compatibility
USER 1001

CMD ["nginx", "-g", "daemon off;"]
