SITE_DOMAIN=$1

echo "SITE_DOMAIN=$SITE_DOMAIN"

if [ "$SITE_DOMAIN"  == "" ]; then

   echo "example : $0  ss.local "
   exit 1

fi

COMMON_PKG="\
import numpy ; \
import bokeh ; \
import gensim ; \
import glob2 ; \
import h5py ; \
import joblib ; \
import mpi4py ; \
import multiprocess ; \
import nltk ; \
import pandas ; \
import pymysql ; \
import pyodbc ; \
import scipy ; \
import statsmodels ; \
import statsd ; \
import tqdm ; \
import seaborn ; \
import numba ; \
import lightfm ; \
import pydotplus ; \
import sklearn  ; \
import lightgbm ; \
import gym ; \
import konlpy ; \
import mglearn ; \
import boruta ; \
import geometric ; \
import networkx ; \
import geopandas ; \
import geojson ; \
import shapely ; \
import pysal ; \
import tslearn ; \
import folium ; \
import plotnine ; \
import gower ; \
import PyKomoran ; \
from konlpy.tag import Mecab ; \
"

MY_PKG="\
import tensorflow ; \
import keras ; \
"
echo "#### check tensorflow2.0  ####"
echo "#### COMMON_PKG  ####"
docker run -it --rm --net=host --pid=host \
       tensorflow2.0.${SITE_DOMAIN}/cdsw/engine:10  \
       /bin/bash 	\
	   -c "/opt/conda/envs/python3.6/bin/python -c \"$COMMON_PKG  \"  "
echo "#### MY_PKG  ####"
docker run -it --rm --net=host --pid=host \
       tensorflow2.0.${SITE_DOMAIN}/cdsw/engine:10  \
       /bin/bash 	\
	   -c "/opt/conda/envs/python3.6/bin/python -c \"$MY_PKG  \"   "	   
	   
MY_PKG="\
import keras ; \
import tensorflow ; \
"
echo "#### check tensorflow1.15  ####"
echo "#### COMMON_PKG  ####"
docker run -it --rm --net=host --pid=host \
       tensorflow1.15.${SITE_DOMAIN}/cdsw/engine:10  \
       /bin/bash 	\
	   -c "/opt/conda/envs/python3.6/bin/python -c \"$COMMON_PKG  \"  "
echo "#### MY_PKG  ####"
docker run -it --rm --net=host --pid=host \
       tensorflow1.15.${SITE_DOMAIN}/cdsw/engine:10  \
       /bin/bash 	\
	   -c "/opt/conda/envs/python3.6/bin/python -c \"$MY_PKG  \"   "

MY_PKG="\
import tensorflow ; \
import keras ; \
"
echo "#### check tensorflow1.12  ####"
echo "#### COMMON_PKG  ####"
docker run -it --rm --net=host --pid=host \
       tensorflow1.12.${SITE_DOMAIN}/cdsw/engine:10  \
       /bin/bash 	\
	   -c "/opt/conda/envs/python3.6/bin/python -c \"$COMMON_PKG  \"  "
echo "#### MY_PKG  ####"	   
docker run -it --rm --net=host --pid=host \
       tensorflow1.12.NoneGPU.${SITE_DOMAIN}/cdsw/engine:10  \
       /bin/bash 	\
	   -c "/opt/conda/envs/python3.6/bin/python -c \"$MY_PKG  \"   "
	   
MY_PKG="\
import torch ; \
import torchvision ; \
import transformers ; \
import kobert ; \
import mxnet ; \
import gluonnlp ; \
import sentencepiece ; \
"
echo "#### check pytorch1.3  ####"
echo "#### COMMON_PKG  ####"
docker run -it --rm --net=host --pid=host \
       pytorch1.3.${SITE_DOMAIN}/cdsw/engine:10  \
       /bin/bash 	\
	   -c "/opt/conda/envs/python3.6/bin/python -c \"$COMMON_PKG  \" "
echo "#### MY_PKG  ####"
docker run -it --rm --net=host --pid=host \
       pytorch1.3.${SITE_DOMAIN}/cdsw/engine:10  \
       /bin/bash 	\
	   -c "/opt/conda/envs/python3.6/bin/python -c \"$MY_PKG  \"   "
	   
