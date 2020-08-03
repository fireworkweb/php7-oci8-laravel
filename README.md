[![Docker Hub; pauloreal/php7-oci8-laravel](https://img.shields.io/badge/docker%20hub-pauloreal%2Fphp7--oci8--laravel-blue.svg?&logo=docker&logoColor=white&style=for-the-badge)](https://hub.docker.com/r/pauloreal/php7-oci8-laravel)
[![](https://badges.weareopensource.me/docker/image-size/pauloreal/php7-oci8-laravel/latest?style=for-the-badge)](https://github.com/paulorealdev)

[![Php 7.4.8](https://img.shields.io/badge/php--apache-7.4.8-777BB4.svg?&logo=php&logoColor=white)](https://secure.php.net/releases/7_4_8.php)
[![Composer](https://img.shields.io/badge/composer-latest-885630.svg?&logo=composer&logoColor=white)](https://getcomposer.org)
[![Redis](https://img.shields.io/badge/redis-phpredis-c50c2e.svg?&logo=redis&logoColor=white)](https://github.com/phpredis/phpredis)
[![Oracle](https://img.shields.io/badge/Oracle-OCI8-F80000.svg?&logo=Oracle&logoColor=white)](https://www.php.net/manual/pt_BR/book.oci8.php)
[![Laravel Ready](https://img.shields.io/badge/Laravel-up%20to%207.x-c5170c.svg?&logo=Laravel&logoColor=white)](https://laravel.com/docs/7.x)

## Introduction
This is a Laravel ready Dockerfile php7.4-apache based container image running with oci8

### Versioning
| Docker Tag | GitHub Release | PHP Version |
| ---------- | -------------- | ----------- |
| latest     | master Branch  | 7.4.8       |

<br><hr>

## How to use
To pull the conteiner:
```
$ docker pull pauloreal/php7-oci8-laravel:latest
```

To run the container:
```
$ sudo docker run -d pauloreal/php7-oci8-laravel:latest
```

### Into Docker Composer
> docker/docker-compose.yml:
```
image: pauloreal/php7-oci8-laravel:latest
restart: unless-stopped
tty: true
volumes:
    - ../:/var/www/html
ports:
    - "80:80"
```

Default web root:
```
/var/www/html
```

<br><hr>

### Author
> Paulo Real

#### Need help?
> Email me: [contact@pauloreal.com](mailto:contact@pauloreal.com)