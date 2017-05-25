FROM jupyter/minimal-notebook:latest

# XGBOOST and MINICONDA3
ADD environment.yml /tmp/environment.yml
ADD requirements.txt /tmp/requirements.txt
ADD run.sh $HOME/run.sh
USER root
RUN cd /opt && git clone --recursive https://github.com/dmlc/xgboost && \
    cd xgboost && make -j`nproc` && \
    chown jovyan:users $HOME/run.sh
USER $NB_USER
RUN conda config --system --set auto_update_conda false && \
    conda env update --file=/tmp/environment.yml && \
    pip install --no-cache-dir -r /tmp/requirements.txt
RUN rm -rf /home/jovyan/work
WORKDIR $HOME
