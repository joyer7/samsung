

CURRENT_TIME='date +"%H:%M:%S"'
echo "####start  sh 02_make.sh     `$CURRENT_TIME` ####"

docker build --network=host -t conda.cuda9.docker.repository.cloudera.com/cdsw/engine:10 . -f  02.01.conda.cuda9.Dockerfile  && \ docker build --network=host -t conda.cuda10.docker.repository.cloudera.com/cdsw/engine:10 . -f  02.02.conda.cuda10.Dockerfile

echo "####end  sh 02_make.sh     `$CURRENT_TIME` ####"
