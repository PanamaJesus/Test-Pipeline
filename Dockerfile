FROM centos:8

# Fix repos y instalar apache
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-* && \
    sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-* && \
    yum install -y httpd && \
    yum clean all

# Copiar HTML
COPY index.html /var/www/html/index.html

# Exponer puerto
EXPOSE 80

# Arrancar Apache en foreground
CMD ["/usr/sbin/httpd", "-D", "FOREGROUND"]
