#!/bin/bash
# uncomment the lines bellow if you have your packages ready to be downloaded 

#if [ -d "package/dist/" ]
#then
#echo "ya hay una version anterior, para actualizar es necesario actualizar el contenedor"
#else
echo $MYAPP_VERSION_VUE >> versioncontrol.txt
echo "descargar"  $MYAPP_VERSION_VUE
apk update; apk add ca-certificates wget; update-ca-certificates;
#wget --no-check-certificate --auth-no-challenge   --user=user --password=yourpass https://my-private-repo/repository/my-samplevue/-/vue-project-vue-$MYAPP_VERSION_VUE.tgz  -O - | tar -xz
cp -r package/dist/. /usr/share/nginx/html
echo "daemon off;" >> /etc/nginx/nginx.conf
#fi
nginx