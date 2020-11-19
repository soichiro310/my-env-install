#!/bin/sh
## author h173309
## 20191014

cd ~
CURRENT=`pwd`
# IP=`ifconfig | grep -A 1 'em1' | tail -1 | cut -d ':' -f 2 | cut -d ' ' -f 1`
SET_PORT=9876
##########################################################################
## install Anaconda 3 ####################################################
##########################################################################
# if your OS is Linux
wget https://repo.anaconda.com/archive/Anaconda3-2019.07-Linux-x86_64.sh

sh Anaconda3-2019.07-Linux-x86_64.sh

##########################################################################
## setting Jupyter notebook ##############################################
##########################################################################
# make config file -> .jupyter/jupyter_notebook_config.py
jupyter notebook --generate-config

# SHA_TMP < sha_hash
echo ""
SHA_TMP=`ipython -c 'from IPython.lib import passwd; passwd()' | cut -d' ' -f3`
# allow all ip
echo "c.NotebookApp.ip = '133.15.24.19'" >> ~/.jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.password = u${SHA_TMP}" >> ~/.jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.open_browser = False" >> ~/.jupyter/jupyter_notebook_config.py
# port number is able to change if you want
echo "c.NotebookApp.port = '${SET_PORT}'" >> ~/.jupyter/jupyter_notebook_config.py
echo "c.NotebookApp.notebook_dir = '${CURRENT}'" >> ~/.jupyter/jupyter_notebook_config.py

# need to 'environment_kernels'
# echo -e "c.NotebookApp.kernel_spec_manager_class = 'environment_kernels.EnvironmentKernelSpecManager'" >> ~/.jupyter/jupyter_notebook_config.py
# echo -e "c.EnvironmentKernelSpecManager.conda_env_dirs=['${HOME}/anaconda3/envs/']"                    >> ~/.jupyter/jupyter_notebook_config.py
unset SHA_TMP
unset CURRENT
unset SET_PORT
# enable to change conda-env in jupyter
pip install environment_kernels
# enable Tensorboard in jupyter
pip install jupyter-tensorboard
## enable yapf that is code formater  
# pip install yapf
