#!/bin/sh

if [ "$TRAVIS_OS_NAME" = "osx" ]; then
    wget http://repo.continuum.io/miniconda/Miniconda3-latest-MacOSX-x86_64.sh -O miniconda.sh;
else
    wget http://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O miniconda.sh;
fi

bash miniconda.sh -b

export PATH=$HOME/miniconda/bin:$PATH

conda install --yes conda-build jinja2 anaconda-client pip \
                    numpy cython h5py libnetcdf \
                    anaconda-client coverage pyflakes jupyter notebook

python -m pip install auditwheel
