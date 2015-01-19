FROM nginx:1.7.8

# Install curl
RUN apt-get update -qq && \
    apt-get install -qy curl

# Set EnvPlate version
ENV ENVPLATE 0.0.4

# Install EnvPlate
RUN curl -sLo /usr/local/bin/ep https://github.com/kreuzwerker/envplate/releases/download/v$ENVPLATE/ep-linux && \
    chmod +x /usr/local/bin/ep

# Copy configuration file file
COPY nginx.conf /etc/nginx/nginx.conf

# Launch EnvPlate then Nginx
CMD ["ep", "-v", "/etc/nginx/nginx.conf", "--", "/usr/sbin/nginx"]
