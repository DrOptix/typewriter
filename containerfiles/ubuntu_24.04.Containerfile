# Stage 1: Build Neovim
FROM docker.io/library/ubuntu:24.04 AS build_neovim

ARG NEOVIM_TAG=v0.10.4

RUN apt-get update \
    && apt-get --yes upgrade \
    && apt-get --yes --no-install-recommends install \
        ripgrep \
        ca-certificates \
        git \
        gettext \
        cmake \
        make \
        ninja-build \
        gcc \
        libc6-dev \
        unzip \
        wget \
        dotnet-sdk-8.0 \
        curl \
        build-essential \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /tmp/neovim

RUN git clone https://github.com/neovim/neovim.git .
RUN git checkout ${NEOVIM_TAG}
RUN make CMAKE_BUILD_TYPE=Release && make install

WORKDIR /root

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

RUN mkdir csharp  \
    && cd csharp \
    && dotnet new sln -n csharp  \
    && dotnet new webapi -n webapi  \
    && dotnet sln add ./webapi/webapi.csproj  \
    && cd ..

RUN PATH=$PATH:/root/.cargo/bin cargo new --bin rust

