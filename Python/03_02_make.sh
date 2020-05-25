
SITE_DOMAIN=$1

echo "SITE_DOMAIN=$SITE_DOMAIN"

if [ "$SITE_DOMAIN"  == "" ]; then

   echo "example : $0  ss.local "
   exit 1

fi

CURRENT_TIME='date +"%H:%M:%S"'
echo "####start  sh 03_02_make.sh     `$CURRENT_TIME` ####"

docker build --network=host -t tensorflow1.12.${SITE_DOMAIN}/cdsw/engine:10 . -f  03.02.tensorflow1.12.Dockerfile


docker build --network=host -t tensorflow1.12.NoneGPU.${SITE_DOMAIN}/cdsw/engine:10 . -f  03.02.tensorflow1.12.NoneGpu.Dockerfile

echo "####end  sh 03_02_make.sh     `$CURRENT_TIME` ####"