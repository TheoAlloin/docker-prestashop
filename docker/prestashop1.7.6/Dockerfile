FROM prestashop/prestashop:1.7.6

RUN yes | pecl install xdebug \
    && echo "zend_extension=$(find /usr/local/lib/php/extensions/ -name xdebug.so)" > /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_enable=on" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_autostart=off" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_connect_back=on" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "xdebug.remote_port=9000" >> /usr/local/etc/php/conf.d/xdebug.ini \
    && echo "file_uploads=On" >> /usr/local/etc/php/conf.d/uploads.ini \
    && echo "memory_limit=128M" >> /usr/local/etc/php/conf.d/uploads.ini \
    && echo "upload_max_filesize=64M" >> /usr/local/etc/php/conf.d/uploads.ini \
    && echo "post_max_size=64M" >> /usr/local/etc/php/conf.d/uploads.ini \
    && echo "max_execution_time=600" >> /usr/local/etc/php/conf.d/uploads.ini \
    && echo "max_input_vars=10000" >> /usr/local/etc/php/conf.d/custom.ini \
    && echo "error_reporting-1" >> /usr/local/etc/php/conf.d/custom.ini \
    && echo "display_errors = On" >> /usr/local/etc/php/conf.d/custom.ini

USER root

RUN usermod --non-unique --uid 1000 www-data \
    && groupmod --non-unique --gid 1000 www-data \
    && find /var/www -type d -exec chmod 755 {} ";" \
    && find /var/www -type f -exec chmod 644 {} ";"

RUN chown -Rf www-data:www-data /var/www

USER www-data