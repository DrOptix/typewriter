FROM registry.fedoraproject.org/fedora:41

# Upgrade the system and install sudo and ansible
RUN dnf -y install \
        neovim \
        ripgrep \
        git \
        unzip \
        gcc \
        dotnet-sdk-9.0 \
        procps-ng \
    && dnf clean all \
    && rm -rf /var/cache/dnf

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
