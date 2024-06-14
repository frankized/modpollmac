# Use a lightweight base image
FROM alpine:latest

# Install modpoll and necessary dependencies
RUN apk add --no-cache wget bash libusb-dev tini \
    && wget https://www.modbusdriver.com/downloads/modpoll.tgz \
    && tar -xvzf modpoll.tgz \
    && mv modpoll /usr/local/bin/modpoll/ \
    && rm -rf modpoll.tgz

# Copy an entrypoint script
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

# Set tini as the entrypoint
ENTRYPOINT ["/sbin/tini", "--", "/usr/local/bin/modpoll/x86_64-linux-gnu/modpoll"]

# Default option
CMD ["-h"]
