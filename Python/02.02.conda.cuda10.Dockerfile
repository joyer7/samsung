FROM  cuda10.docker.repository.cloudera.com/cdsw/engine:10

# 기본 OS 설정 ODBC, language-pack-ko
RUN cd /tmp/ && \
    apt-get update &&  \
    apt-get install -y --no-install-recommends  \
            language-pack-ko  \
            libssl-dev \
            libmariadb-client-lgpl-dev \
            mysql-client libmysqlclient20 \
            libxml2-dev  libnlopt-dev  \
            unixodbc-dev iodbc libiodbc2  \
            xorg libx11-dev  libglu1-mesa-dev  libfreetype6-dev   \
            libgmp-dev   libblas-dev libblas3 \
            libstdc++6  libcupti-dev openjdk-8-jdk graphviz	&& \
    wget -O impala.deb --no-check-certificate https://downloads.cloudera.com/connectors/impala_odbc_2.5.41.1029/Debian/clouderaimpalaodbc_2.5.41.1029-2_amd64.deb && \
    wget -O hive.deb --no-check-certificate  https://downloads.cloudera.com/connectors/ClouderaHive_ODBC_2.6.4.1004/Debian/clouderahiveodbc_2.6.4.1004-2_amd64.deb && \
    dpkg -i  impala.deb hive.deb  && \
    rm -rf  *.deb && rm -rf /var/lib/apt/lists/*  && \
    mv /etc/default/locale /etc/default/locale.bak  && \
    echo "LANG=\"ko_KR.UTF-8\"" >> /etc/default/locale && \
    echo "LANGUAGE=\"ko_KR:ko\"" >> /etc/default/locale 
  
# 분석패키지 추가
RUN mkdir -p /opt/conda/envs/python3.6  && \
    conda install -y nbconvert python=3.6.8 -n python3.6 && \
    conda install -y -n python3.6 bokeh  && \
    conda install -y -n python3.6 gensim  && \
    conda install -y -n python3.6 glob2  && \
    conda install -y -n python3.6 h5py  && \
    conda install -y -n python3.6 joblib  && \
    conda install -y -n python3.6 mpi4py  && \
    conda install -y -n python3.6 multiprocess  && \
    conda install -y -n python3.6 nltk  && \
    conda install -y -n python3.6 pandas  && \
    conda install -y -n python3.6 pymysql  && \
    conda install -y -n python3.6 pyodbc  && \
    conda install -y -n python3.6 scipy  && \
    conda install -y -n python3.6 statsmodels  && \
    conda install -y -n python3.6 statsd  && \
    conda install -y -n python3.6 tqdm  && \
    conda install -y -n python3.6 seaborn  && \
    conda install -y -n python3.6 matplotlib  && \
    conda install -y -n python3.6 scikit-learn  && \
    conda install -y -n python3.6 numba  && \
	conda install -y -n python3.6 numpy  && \
	conda install -y -n python3.6 lightfm && \
	conda install -y -n python3.6  -c conda-forge lightgbm  && \
	conda clean -a  

#쥬피터랩 jupyterlab konlpy
RUN /opt/conda/envs/python3.6/bin/pip install --no-cache-dir --no-clean -v netifaces \
                 gputil gym  jupyterlab konlpy JPype1-py3  mglearn boruta && \
    pip3 install --no-cache-dir --no-clean -v netifaces \
	     jupyterlab	
         
ADD jvm.py  /opt/conda/envs/python3.6/lib/python3.6/site-packages/konlpy/jvm.py

RUN cd /tmp/ && \
    wget --no-check-certificate  https://jaist.dl.sourceforge.net/project/libpng/zlib/1.2.9/zlib-1.2.9.tar.gz  && \
    tar -xvf zlib-1.2.9.tar.gz && \
    cd zlib-1.2.9   && \
    ./configure &&  make && make install && \
    cd /usr/lib/x86_64-linux-gnu/  && \
    ln -s -f /usr/local/lib/libz.so.1.2.9/lib libz.so.1 && \
    cd /tmp/ && rm -rf zlib-1.2.9
 
#은전한잎 설치
## m4, autoconf , automake, mecab-ko ##
RUN cd /tmp && wget http://ftp.gnu.org/gnu/m4/m4-1.4.18.tar.gz && \
    tar xvfz m4-1.4.18.tar.gz && \
	cd m4-1.4.18 && \
    ./configure --prefix=/usr && make && make install && \
	cd /tmp  && rm -rf m4-1.4.18 && \
    wget http://ftp.gnu.org/gnu/autoconf/autoconf-2.69.tar.gz  &&  \
    tar xvfz autoconf-2.69.tar.gz  &&  \
    cd autoconf-2.69 && ./configure &&  make &&  make install  &&  \
	cd /tmp &&  rm -rf  autoconf-2.69  &&  \
    curl -LO http://ftpmirror.gnu.org/automake/automake-1.11.tar.gz  &&  \
    tar -zxvf automake-1.11.tar.gz  &&  \
    cd automake-1.11  &&  \
    ./configure  &&  make  &&  make install  &&  \
    cd /tmp &&  rm -rf automake-1.11  && rm -f *.tar.gz &&  \
    echo "## install mecab-ko, mecab-ko-dic, mecab-python ##" &&  \
    cd /tmp  && \
    curl -LO https://bitbucket.org/eunjeon/mecab-ko/downloads/mecab-0.996-ko-0.9.1.tar.gz  && \
    tar zxfv mecab-0.996-ko-0.9.1.tar.gz  && \
    cd mecab-0.996-ko-0.9.1  && \
    ./configure  && make  && make check  && make install  && ldconfig  && \
    cd /tmp &&  rm -rf mecab-0.996-ko-0.9.1 && rm -f *.tar.gz  && \
    curl -LO https://bitbucket.org/eunjeon/mecab-ko-dic/downloads/mecab-ko-dic-2.0.1-20150920.tar.gz  && \
    tar -zxvf mecab-ko-dic-2.0.1-20150920.tar.gz  && \
    cd mecab-ko-dic-2.0.1-20150920 && \
	./autogen.sh && ./configure && make  && make install  && ldconfig  && \
    sh -c 'echo "dicdir=/usr/local/lib/mecab/dic/mecab-ko-dic" > /usr/local/etc/mecabrc'  && \
    make install  && \
    cd /tmp  && rm -rf mecab-ko-dic-2.0.1-20150920 && rm -f *.tar.gz  && \
	git clone https://bitbucket.org/eunjeon/mecab-python-0.996.git   && \
    cd mecab-python-0.996   && \
    /opt/conda/envs/python3.6/bin/python setup.py build     && \
    /opt/conda/envs/python3.6/bin/python setup.py install   && \
    cd /tmp  && rm -rf mecab-python-0.996  && rm -f *.tar.gz


###########################################
# packages 추가시 수정할 부분
###########################################
RUN conda install -y -n python3.6  pandana urbanaccess  geometric  geopandas geojson shapely plotnine && \
    conda clean -a

# xgboost
RUN cd /tmp && wget https://s3-us-west-2.amazonaws.com/xgboost-nightly-builds/xgboost-1.1.0_SNAPSHOT%2Bcfee9fae91975c64d9b6fc5dfdff294e9260c09f-py2.py3-none-manylinux1_x86_64.whl  && \
    /opt/conda/envs/python3.6/bin/pip install xgboost-1.1.0_*-py2.py3-none-manylinux1_x86_64.whl && \
	rm -f *.whl  && \
    /opt/conda/envs/python3.6/bin/pip install --no-cache-dir --no-clean  \
          Cython  && \
    /opt/conda/envs/python3.6/bin/pip install --no-cache-dir --no-clean  \
	      gower PyKomoran pydotplus graphviz pysal tslearn folium Pillow pdpbox pyspark





