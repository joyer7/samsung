FROM  conda.cuda9.docker.repository.cloudera.com/cdsw/engine:10

RUN /opt/conda/envs/python3.6/bin/pip  install --no-cache-dir --no-clean -v netifaces \
          mxnet-cu90mkl
		  

