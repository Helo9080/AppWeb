# Use official nginx image
FROM nginx:alpine

# Remove default html
RUN rm -rf /usr/share/nginx/html/*

# Copy custom HTML to nginx directory
COPY index.html /usr/share/nginx/html/

# Expose port 80
EXPOSE 80
