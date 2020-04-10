server {
    listen 80;
    listen [::]:80;
    server_name shop.example.com;
    location / {
        proxy_set_header   X-Forwarded-For $remote_addr;
        proxy_set_header   Host $http_host;
        proxy_pass         http://localhost:8080;
    }
}