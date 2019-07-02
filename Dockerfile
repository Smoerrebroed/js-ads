# Copyright (c) 2019. TIBCO Software Inc.
# This file is subject to the license terms contained
# in the license file that is distributed with this file.
FROM centos:7

RUN useradd tdv && mkdir /opt/TDV && chown tdv /opt/TDV
USER tdv
# This Dockerfile requires the TIBCO DV/Jaspersoft ADS installer file 
# in the resources directory below the Dockerfile.
COPY --chown=tdv resources/TIB_tdv_server_8.1.0_linux_x86_64.bin resources/tdv_server.options /tmp/
RUN chmod +x /tmp/TIB_tdv_server_8.1.0_linux_x86_64.bin && \
  /tmp/TIB_tdv_server_8.1.0_linux_x86_64.bin --optionfile /tmp/tdv_server.options && \
  rm /tmp/TIB_tdv_server_8.1.0_linux_x86_64.bin /tmp/tdv_server.options

# Expose ports. Note that you must do one of the following:
# map them to local ports at container runtime via "-p 9400-9409:9400-9409"
# or use dynamic ports via "-P".
EXPOSE 9400-9409

COPY --chown=tdv resources/entrypoint.sh .
RUN chmod +x ./entrypoint.sh

# # Default CMD executed at container startup
CMD ["./entrypoint.sh"]
