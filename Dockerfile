FROM scratch
ADD amzn-container-minimal-2018.03.0.20220907.3-x86_64.tar.xz /
CMD ["/bin/bash"]
RUN mkdir /usr/src/srpm \
    && curl -o /usr/src/srpm/srpm-bundle.tar.gz "https://amazon-linux-docker-sources.s3-accelerate.amazonaws.com/srpm-bundle-6ba2180923a2f0b8f246ae7be3845522efffb9448264973c7b5f811296052d2c.tar.gz" \
    && echo "61c3e2a1535708dda90f5aa3cc856487b4950505f5c23e2e157933ced6a29670  /usr/src/srpm/srpm-bundle.tar.gz" | sha256sum -c -
