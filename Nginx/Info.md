# Setup

 - ⚠ Forward een Nieuw domain eerst dan certifecaten aanvragen dan pas config maken 

&nbsp;


### Certs aanvragen
 - ``` sudo certbot --nginx -d web1.davidnet.net ```
 - ``` sudo certbot --nginx -d web2.davidnet.net ```
 - ``` sudo certbot --nginx -d gittea.davidnet.net ```
 - ``` sudo certbot --nginx -d placeholder.davidnet.net ```
 - ``` sudo certbot --nginx -d stateapi.davidnet.net ```
 - ``` sudo certbot --nginx -d myadmin.davidnet.net ```

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


### crontab
See Notes.md certbot renew is automated to renew each Sunday at 0:00