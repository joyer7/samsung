FROM  conda.cuda9.docker.repository.cloudera.com/cdsw/engine:10


RUN apt-get update &&  \
    apt-get install -y software-properties-common && \
    add-apt-repository ppa:ubuntu-toolchain-r/test && \
    apt-get update && \
    apt-get install -y gcc-4.9 && \
    apt-get upgrade -y libstdc++6 

RUN /opt/conda/envs/python3.6/bin/pip  install --no-cache-dir --no-clean -v netifaces \
        tensorflow==1.12.0   Keras==2.1.5   Keras-Applications  keras_preprocessing
