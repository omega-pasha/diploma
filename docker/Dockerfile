FROM nginx:alpine

RUN apk add --update --no-cache shadow
RUN rm -rf /var/cache/apk/*

COPY nginx.conf /etc/nginx/conf.d/default.conf

COPY static-files/ /usr/share/nginx/html/

LABEL maintainer="Pavel Pomortsev <i@ppomortsev.ru>"

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
