FROM  conda.cuda10.docker.repository.cloudera.com/cdsw/engine:10

RUN conda remove -y -n python3.6   pyyaml  && \
    cd /tmp && git clone https://github.com/monatis/mobilenetv2-tf2.git  && \
    cd mobilenetv2-tf2  && \
    /opt/conda/envs/python3.6/bin/pip install -r requirements.gpu.txt  && \
    cd .. && rm -rf mobilenetv2-tf2		  
