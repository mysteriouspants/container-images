FROM scratch
ADD amzn2-container-raw-2.0.20221004.0-x86_64.tar.xz /
CMD ["/bin/bash"]
RUN mkdir /usr/src/srpm \
    && curl -o /usr/src/srpm/srpm-bundle.tar.gz "https://amazon-linux-docker-sources.s3-accelerate.amazonaws.com/srpm-bundle-5739eed8c30abe39025fd3b2efc192206cf6c30a9ed1c856112143b6d7324455.tar.gz" \
    && echo "b2bcb16e488395c3f073ae7cf2cd2a3e979e50c0448777aadc746bc60348fc92  /usr/src/srpm/srpm-bundle.tar.gz" | sha256sum -c -
