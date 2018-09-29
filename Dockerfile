FROM sabayon/base-amd64

MAINTAINER mudler <mudler@sabayonlinux.org>

# Set locales to en_US.UTF-8
ENV LC_ALL=en_US.UTF-8

# Set environment variables.
ENV HOME /root
ENV ACCEPT_LICENSE=*
ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/opt/bin:/usr/x86_64-pc-linux-gnu/gcc-bin/6.4.0:/usr/lib/llvm/5/bin:/opt/bin
# Define working directory.
WORKDIR /root

RUN equo up && \
    equo i packer-bin app-emulation/virtualbox-bin \
           app-emulation/virtualbox-modules-5.2.18#4.18.0-sabayon



