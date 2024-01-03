FROM node:21

RUN apt update
RUN apt install -y cmake
RUN apt install -y libexpat1-dev
RUN apt install -y libglib2.0-dev
RUN apt install -y liblcms2-dev
RUN apt install -y libgsf-1-dev
RUN apt install -y liborc-0.4-dev
RUN apt install -y libde265-dev
RUN apt install -y libexif-dev

# install libheif
RUN apt purge -y libheif1 libheif-dev
WORKDIR /home/node
RUN git clone https://github.com/strukturag/libheif.git -b v1.17.6
WORKDIR /home/node/libheif
RUN mkdir build
WORKDIR /home/node/libheif/build
RUN cmake --preset=release ..
RUN make
RUN make install
RUN ldconfig

RUN apt install -y libimage-exiftool-perl

RUN mkdir /home/node/bin
WORKDIR /home/node/bin
COPY entrypoint.sh /home/node/bin/entrypoint.sh
RUN chmod +x /home/node/bin/entrypoint.sh

#ENTRYPOINT ["heif-convert"]
ENTRYPOINT ["/home/node/bin/entrypoint.sh"]
CMD ["input-file","output-file"]
