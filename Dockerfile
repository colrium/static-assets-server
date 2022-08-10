FROM nginx:alpine

COPY ./nginx.conf /etc/nginx/conf.d/default.conf
COPY web/* /usr/share/nginx/html/
RUN mkdir -p /usr/share/nginx/html/error_pages
COPY error_pages/* /usr/share/nginx/html/error_pages/
RUN chmod -R 755 /usr/share/nginx/html
RUN chown -R nginx:nginx /usr/share/nginx/html

EXPOSE 80

ENTRYPOINT ["nginx", "-g", "daemon off;"]