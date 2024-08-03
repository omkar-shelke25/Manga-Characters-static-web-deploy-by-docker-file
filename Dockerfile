FROM nginx

WORKDIR /usr/share/nginx/html

RUN apt-get update && \
    apt-get install git -y && \
    rm -rf  * && \
    git clone https://github.com/omkar-shelke25/Manga-Characters-static-web-deploy-by-docker-file.git .

EXPOSE 8080

CMD ["nginx","-g","daemon off;"]