FROM php:7.4-apache

ARG DEBIAN_FRONTEND=noninteractive

# Install dependencies
RUN apt-get update && apt-get install -y libaio1 libpng-dev libzip-dev zip unzip

# Install phpredis extension
RUN docker-php-ext-install gd
RUN docker-php-ext-install zip
RUN pecl install -o -f redis && docker-php-ext-enable redis
RUN echo 'vm.overcommit_memory = 1' >> /etc/sysctl.conf

# Clear cache
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# Install OCI8
RUN printf "log_errors = On \nerror_log = /dev/stderr\n" > /usr/local/etc/php/conf.d/php-logs.ini

RUN a2enmod rewrite headers

ADD https://download.oracle.com/otn_software/linux/instantclient/19600/instantclient-basiclite-linux.x64-19.6.0.0.0dbru.zip /tmp/instantclient-basiclite-linux.x64-19.6.0.0.0dbru.zip
ADD https://download.oracle.com/otn_software/linux/instantclient/19600/instantclient-sdk-linux.x64-19.6.0.0.0dbru.zip /tmp/instantclient-sdk-linux.x64-19.6.0.0.0dbru.zip

RUN unzip /tmp/instantclient-basiclite-linux.x64-19.6.0.0.0dbru.zip -d /usr/local/
RUN unzip /tmp/instantclient-sdk-linux.x64-19.6.0.0.0dbru.zip -d /usr/local/

RUN ln -s /usr/local/instantclient_19_6 /usr/local/instantclient
RUN ln -s /usr/local/instantclient/lib* /usr/lib

RUN echo 'export LD_LIBRARY_PATH="/usr/local/instantclient"' >> /root/.bashrc
RUN echo 'umask 002' >> /root/.bashrc

RUN echo 'instantclient,/usr/local/instantclient' | pecl install oci8-2.2.0
RUN echo "extension=oci8.so" > /usr/local/etc/php/conf.d/php-oci8.ini

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

RUN rm /etc/apache2/sites-enabled/000-default.conf
ADD ./conf/default.conf /etc/apache2/sites-enabled/000-default.conf

# Expose port 80 and
EXPOSE 80
