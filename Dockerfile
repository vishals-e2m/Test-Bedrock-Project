FROM alpine:latest

WORKDIR /var/www/html

COPY . .

# Prevent container from exiting
CMD ["tail", "-f", "/dev/null"]
