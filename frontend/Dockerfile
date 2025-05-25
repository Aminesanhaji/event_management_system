FROM nginx:alpine
# vide le dossier par défaut
RUN rm -rf /usr/share/nginx/html/*

# copie uniquement les .html
COPY templates/event_management_system_app/ /usr/share/nginx/html/

# (option) copie aussi un dossier assets si nécessaire
#COPY assets/ /usr/share/nginx/html/assets/

EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]
