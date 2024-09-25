FROM nginx:alpine

RUN apk add --no-cache certbot certbot-nginx
RUN mkdir -p /etc/letsencrypt /var/www/certbot

COPY nginx.conf /etc/nginx/nginx.conf
#COPY ROOT /usr/share/nginx/html

EXPOSE 80 443

# Get Certificate
CMD ["sh", "-c", "certbot --nginx --non-interactive --agree-tos --email contact@davidnet.net -d jouw_domein.nl -d web1.davidnet.net && nginx -g 'daemon off;'"]
