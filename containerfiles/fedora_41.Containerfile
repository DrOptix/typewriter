FROM registry.fedoraproject.org/fedora:41

ARG NEOVIM_TAG=v0.10.4

# Upgrade the system and install sudo and ansible
RUN dnf -y install \
        ripgrep \
        git \
        unzip \
        gcc \
        dotnet-sdk-9.0 \
        procps-ng \
        ninja-build \
        cmake \
        make \
        gettext \
        curl \
        glibc-gconv-extra \
    && dnf clean all \
    && rm -rf /var/cache/dnf

WORKDIR /tmp/neovim

RUN git clone https://github.com/neovim/neovim.git .
RUN git checkout ${NEOVIM_TAG}
RUN make CMAKE_BUILD_TYPE=Release && make install

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

