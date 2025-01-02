FROM docker.io/library/ubuntu:24.04

# Upgrade the system and install sudo and ansible
RUN apt-get update \
    && apt-get --yes upgrade \
    && apt-get --yes --no-install-recommends install \
        neovim \
        ripgrep \
        ca-certificates \
        git \
        make \
        gcc \
        libc6-dev \
        unzip \
        wget \
        dotnet-sdk-8.0 \
        curl \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /root

RUN curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

# Create the playgrounds
# dotnet
RUN mkdir csharp  \
    && cd csharp \
    && dotnet new sln -n csharp  \
    && dotnet new webapi -n webapi  \
    && dotnet sln add ./webapi/webapi.csproj  \
    && cd ..

# rust
RUN PATH=$PATH:/root/.cargo/bin cargo new --bin rust

# Copy `typewriter` in the container
COPY . /root/.config/nvim/
