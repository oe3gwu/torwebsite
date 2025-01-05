FROM alpine:latest

# Install necessary packages
RUN apk --no-cache add nginx tor torsocks

# Create a user with a specific UID and add to the specific GID
# RUN adduser -u 10001 -h /home/toruser -s /bin/sh -D toruser

# Create required directories
RUN mkdir -p /var/www/hidden_service /etc/boot-container /var/lib/tor/hidden_service \
    && rm /etc/nginx/http.d/default.conf

# Set permissions
# RUN chown 10001 /var/lib/tor/hidden_service
# RUN chown 10001 /var/www/hidden_service
RUN chmod 600 /var/lib/tor/hidden_service
# RUN chmod 600 /var/www/hidden_service

# Copy configuration files and content
COPY configs/torrc /etc/tor/torrc
COPY configs/nginx.conf /etc/nginx/http.d/default.conf
COPY html/index.html /var/www/hidden_service
COPY scripts/bootstrap.sh /etc/boot-container/bootstrap.sh

# Expose ports
EXPOSE 80

# Healthcheck
HEALTHCHECK  --interval=4m --timeout=50s --retries=2 \
  CMD torsocks wget --no-verbose --tries=1 --spider `cat /var/lib/tor/hidden_service/hostname` || exit 1

# Define the entrypoint script to run both services
# USER toruser
# WORKDIR /home/toruser
ENTRYPOINT ["/etc/boot-container/bootstrap.sh"]
