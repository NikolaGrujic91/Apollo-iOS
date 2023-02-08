#!/bin/sh

# https://github.com/kucherenko/jscpd
# The jscpd gives the ability to find duplicated blocks implemented on more than
# 150 programming languages and digital formats of documents.

# in case of permission problems run this first
# chmod +x ./run_jscpd.sh
# ./run_jscpd.sh

jscpd --reporters "html" --format "swift" --ignore "../../Apollo/Build" ../../Apollo