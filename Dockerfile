FROM alpine:latest

RUN apk add --no-cache \
    git \
    php \
    php-phar \
    php-mbstring \
    php-json \
    php-openssl \
    php-curl \
    php-dom \
    php-tokenizer \
    php-xml \
    php-session \
    php-ctype \
    php-iconv \
    php-zlib \
    curl \
    unzip

# Set working directory
WORKDIR /var/www/html

COPY . .
# Install Composer
RUN curl -sS https://getcomposer.org/installer | php && mv composer.phar /usr/local/bin/composer

# Install dependencies
RUN composer install

# Prevent container from exiting
CMD ["tail", "-f", "/dev/null"]
