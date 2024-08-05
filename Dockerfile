FROM mediawiki:1.39-fpm-alpine

RUN apk update \
    && apk add --no-cache --virtual .build-dependencies-in-virtual-world openldap-dev \
    && docker-php-ext-install ldap \
    && docker-php-ext-enable  ldap \
    && docker-php-ext-configure ldap --with-libdir=lib/ \
    && docker-php-ext-install ldap;

CMD ["php-fpm"]
