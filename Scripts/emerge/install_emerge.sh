#!/bin/sh

# https://github.com/glato/emerge
# Emerge is a source code and dependency visualizer that can be used to gather insights 
# about source code structure, metrics, dependencies and complexity of software projects. 
# After scanning the source code of a project it provides you an interactive web interface 
# to explore and analyze your project by using graph structures.

#chmod +x ./install_emerge.sh
#./install_emerge.sh

pip3 install graphviz
pip3 install scikit-learn
pip3 install wheel
pip3 install emerge-viz

emerge