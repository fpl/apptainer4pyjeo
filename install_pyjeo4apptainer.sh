#!/bin/sh
#
# This script installs an apptainer container for PyJeo use.
#

rm -rf $HOME/pyjeo $HOME/pyjeo-install
mkdir $HOME/pyjeo
( cd $HOME/pyjeo \
&& curl -L --output mialib.tar.gz https://github.com/ec-jrc/jeolib-miallib/archive/refs/tags/v1.1.1.tar.gz \
&& curl -L --output jiplib.tar.gz https://github.com/ec-jrc/jeolib-jiplib/archive/refs/tags/v1.1.3.tar.gz \
&& curl -L --output pyjeo.tar.gz https://github.com/ec-jrc/jeolib-pyjeo/archive/refs/tags/v1.1.7.tar.gz \
)
apptainer build $HOME/pyjeo1.sif $HOME/pyjeo1.def
apptainer build $HOME/pyjeo2.sif $HOME/pyjeo2.def
apptainer run $HOME/pyjeo2.sif $HOME/pyjeo2.def

# from now on run
# apptainer exec $HOME/pyjeo2.sif python3 ... 
