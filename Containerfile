FROM ghcr.io/ublue-os/ccos:latest

COPY build.sh /tmp/build.sh
COPY etc /etc

# RUN --mount=type=bind,from=ctx,source=/,target=/ctx \
#     --mount=type=cache,dst=/var/cache \
#     --mount=type=cache,dst=/var/log \
#     --mount=type=tmpfs,dst=/tmp \
#     /ctx/build.sh && \
#     ostree container commit

RUN /tmp/build.sh
RUN bootc container lint
