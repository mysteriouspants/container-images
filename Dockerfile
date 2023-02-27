FROM alpine:3.17 AS verify
RUN apk add --no-cache curl tar xz

RUN ROOTFS=$(curl -sOJL -w "al2023-container-2023.0.20230222.1-x86_64.tar.xz" "https://amazon-linux-docker-sources.s3.amazonaws.com/al2023/2023.0.20230222.1/al2023-container-2023.0.20230222.1-x86_64.tar.xz") \
  && echo 'b1e0569a909068e110c4bc42d6ca6f71ffd6652ca1a7f4b9d232afdfc870bb40  al2023-container-2023.0.20230222.1-x86_64.tar.xz' >> /tmp/al2023-container-2023.0.20230222.1-x86_64.tar.xz.sha256 \
  && cat /tmp/al2023-container-2023.0.20230222.1-x86_64.tar.xz.sha256 \
  && sha256sum -c /tmp/al2023-container-2023.0.20230222.1-x86_64.tar.xz.sha256 \
  && mkdir /rootfs \
  && tar -C /rootfs --extract --file "${ROOTFS}"

FROM scratch AS root
COPY --from=verify /rootfs/ /

CMD ["/bin/bash"]
