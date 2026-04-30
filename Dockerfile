FROM nginx:alpine
COPY centauri-dashboard-v2.html /usr/share/nginx/html/index.html
EXPOSE 80
