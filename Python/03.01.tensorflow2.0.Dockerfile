FROM  conda.cuda10.docker.repository.cloudera.com/cdsw/engine:10

RUN /opt/conda/envs/python3.6/bin/pip  install --no-cache-dir --no-clean -v netifaces \
        tensorflow-gpu==2.0  Keras==2.1.5 

	
