#!/bin/bash

/opt/TDV/bin/composite.sh repo start && \
/opt/TDV/bin/composite.sh cache start && \
/opt/TDV/bin/composite_server.sh run