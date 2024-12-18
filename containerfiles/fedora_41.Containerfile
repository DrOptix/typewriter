FROM registry.fedoraproject.org/fedora:41

# Upgrade the system and install sudo and ansible
RUN dnf -y install \
        neovim \
        ripgrep \
        git \
        unzip \
    && dnf clean all \
    && rm -rf /var/cache/dnf

# Create `test` user, don't care about password
RUN groupadd --gid 1000 test \
    && adduser --uid 1000 --gid 1000 --create-home test \
    && echo "test ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Swith to user
USER test
WORKDIR /home/test/

# Copy `typewriter` in the container
COPY --chown=test:test . /home/test/.config/nvim/
