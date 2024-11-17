FROM docker.io/library/ubuntu:24.10

# Upgrade the system and install sudo and ansible
RUN apt-get update \
    && apt-get --yes upgrade \
    && apt-get --yes --no-install-recommends install \
        neovim \
        ripgrep \
        git \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

# Create `test` user, don't care about password
RUN groupadd --gid 1001 test \
    && useradd --uid 1001 --gid 1001 --create-home test \
    && echo "test ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Swith to user
USER test
WORKDIR /home/test/

# Copy `typewriter` in the container
COPY --chown=test:test . /home/test/.config/nvim/
