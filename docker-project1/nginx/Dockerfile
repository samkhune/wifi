FROM nginx:latest
#COPY ./default.conf /etc/nginx/conf.d/default.conf
COPY ./conf/*.conf /etc/nginx/
COPY ./conf/default /etc/nginx/sites-available/
COPY ./certs/wifisoft-ssl-cert/dhparam.pem /etc/nginx/
COPY ./certs/wifisoft-ssl-cert/wifisoft.crt /etc/ssl/certs
COPY ./certs/wifisoft-ssl-cert/ca.crt /etc/ssl/certs/wifisoft-wildcard-ca.crt
COPY ./certs/wifisoft-ssl-cert/*.key /etc/ssl/private/
COPY ./certs/smartap-ssl-cert/*.crt /etc/ssl/certs/
COPY ./certs/smartap-ssl-cert/*.key /etc/ssl/private/
RUN service nginx restart
