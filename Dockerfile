FROM ubuntu:19.10

# install wine
RUN dpkg --add-architecture i386
RUN apt-get update -y
RUN apt-get install -y --no-install-recommends wine32 wine

# create 'developer' user
RUN mkdir -p /home/developer && \
    mkdir -p /etc/sudoers.d && \
    touch /etc/sudoers.d/developer && \
    echo "developer:x:1000:1000:Developer,,,:/home/developer:/bin/bash" >> /etc/passwd && \
    echo "developer:x:1000:" >> /etc/group && \
    echo "developer ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/developer && \
    chmod 0440 /etc/sudoers.d/developer && \
    chown developer:developer -R /home/developer

# more setup
USER developer
ENV HOME /home/developer
WORKDIR /home/developer

# use wine
CMD ["wine", "mmlogic14.exe"]
# CMD ["wine", ".wine/drive_c/Program Files/Softronics/Mulimedia Logic/Mmlogic.exe"]
