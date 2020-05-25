FROM conda.cuda10.docker.repository.cloudera.com/cdsw/engine:10

RUN conda install -n python3.6  -c conda-forge pillow"<7.0.0"   && \
    conda install -n python3.6 -c anaconda pytorch-gpu=1.3.1 torchvision  && \
    conda install -n python3.6 -c conda-forge transformers && \
	conda install -n python3.6 -c conda-forge onnx regex && \
	conda clean -a  &&\
	cd /tmp/ && git clone https://github.com/SKTBrain/KoBERT.git && \
    cd KoBERT && \
    /opt/conda/envs/python3.6/bin/pip install -r requirements.txt  && \
    /opt/conda/envs/python3.6/bin/pip install .  && \
	cd /tmp/ && rm -rf KoBERT

