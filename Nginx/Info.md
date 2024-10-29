# Setup

 - ⚠ gebruik geen 80 naar 443 forwardingen (Daarom aanvragen voordat het afloopt) wanneer je nieuwe certificaten aanvraagt of opnieuw dingen instelt je kan geen https doorsturen hebben wanneer je geen certs hebt
 &nbsp;
 -  ⚠ Zorg ervoor dat je ports geforwaard hebt voordat je aanvraagt!
 &nbsp;
 - Nadat je ze hebt aanvgevraagt kan je main gebruiken


&nbsp;


### Certs aanvragen
``` sudo certbot --nginx -d web1.davidnet.net ```
``` sudo certbot --nginx -d web2.davidnet.net ```
``` sudo certbot --nginx -d gittea.davidnet.net ```
``` sudo certbot --nginx -d placeholder.davidnet.net ```
``` sudo certbot --nginx -d stateapi.davidnet.net ```

# General use

### Nginx management

 - nginx restart:
``` sudo systemctl restart nginx ```
&nbsp;
 - check config file
``` sudo nginx -t ```
&nbsp;
 - Certs hernieuwen
``` sudo certbot renew ```
