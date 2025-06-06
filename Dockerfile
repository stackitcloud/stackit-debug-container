FROM alpine:3.22

ENV USER=stackit
ENV UID=10001
ENV GID=10001

RUN apk update \
    && apk upgrade \
    && apk add -v --update --no-cache \
    bash bash-completion \
    bind-tools \
    busybox-extras \
    bzip2 \
    ca-certificates \
    coreutils \
    curl \
    git \
    groff \
    httpie \
    htop iftop \
    jq \
    less \
    mailcap \
    mysql-client \
    mc \
    mtr \
    openldap-clients \
    openssl \
    postgresql-client \
    redis \
    sed \
    screen \
    python3 \
    tmux \
    tree \
    unzip \
    vim \
    wget \
    socat

RUN export ARCH="$(uname -m)" && if [[ ${ARCH} == "x86_64" ]]; then export ARCH="amd64"; elif [[ ${ARCH} == "aarch64" ]]; then export ARCH="arm64"; fi && curl -L https://dl.k8s.io/release/${KUBE_LATEST_VERSION}/bin/linux/${ARCH}/kubectl -o /usr/local/bin/kubectl \
    && chmod +x /usr/local/bin/kubectl

# Prevent user from running apk add etc.
# yes they can still download binaries, but its a first barier
RUN addgroup -g $GID $USER \
    && adduser \
    --disabled-password \
    --gecos "" \
    --home "$(pwd)" \
    --ingroup "$USER" \
    --no-create-home \
    --uid "$UID" \
    "$USER"
USER "$USER"

ENTRYPOINT [ "/bin/bash" ]