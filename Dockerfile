FROM quay.io/pypa/manylinux1_x86_64

ADD ./netcdf /root/netcdf
RUN yum --enablerepo=extras install epel-release -y
RUN yum install -y gcc gcc-gfortran gcc-c++ flex tcsh zlib-devel bzip2-devel libXt-devel libXext-devel libXdmcp-devel tkinter openmpi openmpi-devel perl perl-ExtUtils-MakeMaker patch bison boost-devel # AMBER
# RUN yum install -y netcdf-devel.x86_64 netcdf.x86_64
RUN yum install -y install lapack-devel.x86_64
RUN yum install -y wget
RUN yum install -y git
RUN yum install -y openblas-devel
RUN yum install -y blas-devel
RUN yum install unzip -y # for auditwheel

RUN cp /root/netcdf/include/* /usr/include/
RUN cp /root/netcdf/lib/* /usr/lib64/

ENV PATH=/opt/python/cp37-cp37m/bin/:$PATH
RUN python -m pip install auditwheel==2.0.0
