
CURRENT_TIME='date +"%H:%M:%S"'

echo "####start  sh 01_make.sh     `$CURRENT_TIME` ####"

docker build --network=host -t cuda9.docker.repository.cloudera.com/cdsw/engine:10 . -f   01.01.cuda9.Dockerfile

docker build --network=host -t cuda10.docker.repository.cloudera.com/cdsw/engine:10 . -f  01.02.cuda10.Dockerfile

echo "####end  sh 01_make.sh     `$CURRENT_TIME` ####"
