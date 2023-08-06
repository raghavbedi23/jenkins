FROM nginx:latest

COPY ./index.html /usr/share/nginx/html/
COPY ./page1.html /usr/share/nginx/html/
COPY ./page2.html /usr/share/nginx/html/

EXPOSE 8000

CMD ["nginx", "-g", "daemon off;"]
