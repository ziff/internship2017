FROM jupyter/minimal-notebook:latest

# XGBOOST and MINICONDA3
ADD environment.yml /tmp/environment.yml
USER root
RUN cd /opt && git clone --recursive https://github.com/dmlc/xgboost && \
    cd xgboost && make -j`nproc`
USER $NB_USER
RUN conda config --system --set auto_update_conda false && \
    conda env update --file=/tmp/environment.yml
WORKDIR $HOME

ENTRYPOINT ["jupyter"]
