
SITE_DOMAIN=ss.local

 sh 01_make.sh  && \
 sh 02_make.sh  && \
 sh 03_01_make.sh ${SITE_DOMAIN}  && \
 sh 03_02_make.sh ${SITE_DOMAIN}  && \
 sh 03_03_make.sh ${SITE_DOMAIN}  && \
 sh 03_04_make.sh ${SITE_DOMAIN}  && \
 sh 03_05_make.sh ${SITE_DOMAIN}  && \
 sh save_docker.sh  ${SITE_DOMAIN} 
 mv  *.tar.gz  ~/repo/

# sshpass -pgit08021! scp -o StrictHostKeyChecking=no  \
#      /home/goodmit/repo/kbcard/.tar.gz  \
#	  admin@10.200.101.14:/volume1/Bigdata_AI/kbcard/  
 
 sh check_pkg.sh  ${SITE_DOMAIN} 

