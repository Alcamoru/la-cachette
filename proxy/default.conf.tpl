server {
    listen ${LISTEN_PORT};
    server_name 92.222.217.160;

    location /static {
        alias /../vol/static;
    }


    location / {
            uwsgi_pass ${APP_HOST}:${APP_PORT};
            include /etc/nginx/uwsgi_params;
            client_max_body_size 10M;
        }
}