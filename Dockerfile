FROM nginx:1.7.8

# Install curl
RUN apt-get update -qq && \
    apt-get install -qy curl

# Set EnvPlate version
ENV ENVPLATE 0.0.4

# Install EnvPlate
RUN curl -sLo /usr/local/bin/ep https://github.com/kreuzwerker/envplate/releases/download/v$ENVPLATE/ep-linux && \
    chmod +x /usr/local/bin/ep

RUN touch /etc/nginx/allow.conf

# Add volume for ssl certificates
VOLUME /certs
# Add volume for external config files
VOLUME /config

# Copy files in the image
COPY . .

# Launch EnvPlate then Nginx
ENTRYPOINT ["./run.sh"]
