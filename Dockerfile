FROM php:8.1-cli-buster

RUN pecl install -o -f redis xdebug && \
    docker-php-ext-enable redis xdebug

RUN echo '\
display_errors=On\n\
error_reporting=E_ALL\n\
date.timezone=UTC\n\
' >> /usr/local/etc/php/conf.d/php.ini

RUN echo '\
xdebug.client_host=host.docker.internal\n\
xdebug.mode=off\n\
xdebug.start_with_request=yes\n\
' >> /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini

ENV COMPOSER_ALLOW_SUPERUSER 1
ENV COMPOSER_ALLOW_XDEBUG 1

RUN apt-get update && \
	apt-get install unzip && \
	curl -s https://raw.githubusercontent.com/composer/getcomposer.org/76a7060ccb93902cd7576b67264ad91c8a2700e2/web/installer | php -- --quiet && \
	mv composer.phar /usr/local/bin/composer && \
	echo 'export PATH="$HOME/.composer/vendor/bin:$PATH"\n' >> /root/.bashrc
