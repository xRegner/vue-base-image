# etapa de producción de nuestro contenedor
FROM nginx:1.13.12-alpine as production-stage
# this is a default version only if you are versioning your apps
ENV MYAPP_VERSION_VUE=1.2.3  
# you going to need this ca-certificates to allow alpine use wget to download a package from an external package manager 
RUN   apk update \
  &&   apk add ca-certificates wget \
  &&   update-ca-certificates  
RUN mkdir -p package/dist/
# we copy our script to be executed once the container runs
COPY script-vue.sh ./
#comment this line if you want to use a repo or package manager
COPY ./dist  ./package/dist/ 
EXPOSE 80
CMD [ "sh" , "script-vue.sh"]