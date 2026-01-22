FROM centos:8

# Configurar repositorios y instalar paquetes
RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-* && \
    sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-* && \
    yum install -y httpd wget zip unzip

# Copiar la aplicación
COPY . /app
WORKDIR /app
EXPOSE 80
CMD ["bash"]
