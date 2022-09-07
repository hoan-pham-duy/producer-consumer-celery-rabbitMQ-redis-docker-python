####################################################################################
# Copyright ©2019-2020. Biorithm Pte Ltd. All Rights Reserved. # This software is 
# the property of Biorithm Pte Ltd. It must not be copied, printed,
# distributed, or reproduced in whole or in part or otherwise disclosed without
# prior written consent from Biorithm.This document may follow best coding
# practices for Python as suggested in https://www.python.org/dev/peps/pep-0008/.
#
# Filename: Dockerfile
# Original Author: PHAM DUY HOAN
# Date created: 17 MAR 2020
# Purpose: this module provides Dockerfile to auto run worker
# Builld Docker: cp Dockerfile_consumer Dockerfile && docker build -t worker_python_celery .
# Acccess: docker exec -it {container_name} /bin/bash
# Revision History Raises (if any issues): NIL
####################################################################################
FROM ubuntu:18.04

MAINTAINER Hoan&lt;hoan@bio-rithm.com&gt;

RUN apt-get update && apt-get install -y \
    software-properties-common
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt-get update && apt-get install -y \
    python3.8 \
    python3-pip
RUN python3.8 -m pip install pip
RUN apt-get update && apt-get install -y \
    python3-distutils \
    python3-setuptools
RUN python3.8 -m pip install pip --upgrade pip

RUN mkdir /projects/
RUN mkdir /projects/femom_algorithms
ADD . /projects/femom_algorithms/

ENV PYTHONPATH  "/projects/"

# RUN rbenv # check if it works...
RUN echo $PYTHONPATH
RUN file="$(ls -1 .)" && echo $file
RUN /usr/bin/python3.8 -m pip install -r /projects/femom_algorithms/requirements.txt
RUN chmod a+x /projects/femom_algorithms/consumer_bash_start.sh
ENTRYPOINT ["/projects/femom_algorithms/consumer_bash_start.sh"]