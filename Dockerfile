FROM alpine:latest

WORKDIR /var/www/html

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer

# Update lock file if needed (e.g., after manually editing composer.json)
RUN composer update

# Install dependencies
RUN composer install

COPY . .

# Prevent container from exiting
CMD ["tail", "-f", "/dev/null"]
