
SITE_DOMAIN=$1
TODAY=`date "+%y%m%d"`


echo "SITE_DOMAIN=$SITE_DOMAIN"

if [ "$SITE_DOMAIN"  == "" ]; then

   echo "example : $0  goodmit.com "
   exit 1

fi

CURRENT_TIME='date +"%H:%M:%S"'
echo "####start  sh save_docker.sh     `$CURRENT_TIME` ####"

#docker save  cuda9.docker.repository.cloudera.com/cdsw/engine:8  | gzip > cuda9.docker.repository.cloudera.com.tar.gz 
#docker save  cuda10.docker.repository.cloudera.com/cdsw/engine:8  | gzip > cuda10.docker.repository.cloudera.com.tar.gz 

#docker save  conda.cuda9.docker.repository.cloudera.com/cdsw/engine:8  | gzip > conda.cuda9.docker.repository.cloudera.com.tar.gz 
#docker save  conda.cuda10.docker.repository.cloudera.com/cdsw/engine:8  | gzip > conda.cuda10.repository.cloudera.com.tar.gz 

docker save  tensorflow2.0.${SITE_DOMAIN}/cdsw/engine:8  | gzip > tensorflow2.0.${SITE_DOMAIN}_${TODAY}.tar.gz 

docker save  tensorflow1.12.${SITE_DOMAIN}/cdsw/engine:8 | gzip > tensorflow1.12.${SITE_DOMAIN}_${TODAY}.tar.gz 
docker save  tensorflow1.12.NoneGPU.${SITE_DOMAIN}/cdsw/engine:8 | gzip > tensorflow1.12.NoneGpu.${SITE_DOMAIN}_${TODAY}.tar.gz 

docker save  tensorflow1.15.${SITE_DOMAIN}/cdsw/engine:8 | gzip > tensorflow1.15.${SITE_DOMAIN}_${TODAY}.tar.gz 

docker save  pytorch1.3.${SITE_DOMAIN}/cdsw/engine:8  | gzip >  pytorch1.3.${SITE_DOMAIN}_${TODAY}.tar.gz

docker save  mobilenet.${SITE_DOMAIN}/cdsw/engine:8  | gzip >  mobilenet.${SITE_DOMAIN}_${TODAY}.tar.gz


echo "####end  sh save_docker.sh     `$CURRENT_TIME` ####"