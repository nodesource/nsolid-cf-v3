#!/usr/bin/env bash

# pushes console/some samples using custom manifests (not in git!)

cf stop  pjm-native
cf stop  pjm-print-versions-6x
cf stop  pjm-print-versions-8x
cf stop  pjm-print-versions-10x
cf stop  pjm-dillinger
cf stop  pjm-nsolid-console
