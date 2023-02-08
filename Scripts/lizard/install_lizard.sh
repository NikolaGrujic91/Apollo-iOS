#!/bin/sh

# https://github.com/terryyin/lizard
# A simple code complexity analyser without caring about 
# the C/C++ header files or Java imports, supports most of the popular languages.

#chmod +x ./install_lizard.sh
#./install_lizard.sh

pip3 install jinja2
pip3 install lizard

lizard --help