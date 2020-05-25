

SITE_DOMAIN=$1

echo "SITE_DOMAIN=$SITE_DOMAIN"

if [ "$SITE_DOMAIN"  == "" ]; then

   echo "example : $0  ss.local "
   exit 1

fi

CURRENT_TIME='date +"%H:%M:%S"'
echo "####start  sh 03_01_make.sh     `$CURRENT_TIME` ####"

docker build --network=host -t tensorflow2.0.${SITE_DOMAIN}/cdsw/engine:10 . -f  03.01.tensorflow2.0.Dockerfile

echo "####end  sh 03_01_make.sh     `$CURRENT_TIME` ####"