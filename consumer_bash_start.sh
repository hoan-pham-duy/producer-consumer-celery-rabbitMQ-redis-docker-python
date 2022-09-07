#!/bin/sh
################################################################################
# Copyright ©2019-2020. Biorithm Pte Ltd. All Rights Reserved. # This software 
# is the property of Biorithm Pte Ltd. It must not be copied, printed,
# distributed, or reproduced in whole or in part or otherwise disclosed without
# prior written consent from Biorithm.This document may follow best coding
# practices for Python as suggested in https://www.python.org/dev/peps/pep-0008/
#
# Filename: femom_gunicorn_start.py
# Original Author: PHAM DUY HOAN
# Date created: 17 MAR 2020
# Purpose: this script run worker with gunicorn
# Revision History Raises (if any issues):
# 24 JUN 2020 HOAN  Update not more 80 characters per line
# 03 DEC 2020 HOAN  Try to use --worker-class=sync
################################################################################
cd /projects/femom_algorithms/
celery -A consumer_tasks worker -l info --pool=solo
