FROM --platform=linux/amd64 ubuntu:latest

USER root
RUN apt update -y && apt install -y libelf-dev curl wget tar make gcc g++ libgmp-dev libssl-dev python3 python3-pip nvidia-cg-toolkit vim-tiny

# ps3toolchain
WORKDIR /
ENV OWNER=humbertodias
ENV REPO=ps3toolchain
RUN curl -s https://api.github.com/repos/$OWNER/$REPO/releases/latest \
    | grep "browser_download_url" \
    | cut -d '"' -f 4 \
    | wget -q -i - -O - | tar -xzvf -

# build samples
ENV PS3DEV=/ps3dev
ENV PSL1GHT=/ps3dev
ENV PATH=$PATH:$PS3DEV/bin:$PS3DEV/ppu/bin:$PS3DEV/spu/bin

# RUN mkdir -p $PSL1GHT
# WORKDIR /psl1gtht
# ADD . .
# RUN make pkg


