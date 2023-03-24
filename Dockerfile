FROM amazonlinux:2.0.20200406.0

LABEL name=bastion

ARG USERNAME=ec2-user
ARG USER_UID=1000
ARG USER_GID=$USER_UID

# Set to false to skip installing zsh and Oh My ZSH!
ARG INSTALL_ZSH="true"


COPY config/dotfiles/.zshrc /root/.zshrc.custom

###################################
# Main install as root
RUN mkdir -p /tmp/install
COPY ./root /tmp/install
RUN chmod +x /tmp/install/*.sh \
    && /bin/sh /tmp/install/install.sh "$INSTALL_ZSH" "$USERNAME" "$USER_UID" "$USER_GID"\
    && rm -rf /tmp/install
###################################

# Install helmfile
COPY bin/helmfile /usr/local/bin/helmfile
RUN chmod +x /usr/local/bin/helmfile

# Install deploy 
COPY bin/deploy /usr/local/bin/deploy
RUN chmod +x /usr/local/bin/deploy

# Install deploymicro 
COPY bin/deploymicro /usr/local/bin/deploymicro
RUN chmod +x /usr/local/bin/deploymicro

# Install kafka 
COPY bin/kafka /usr/local/bin/kafka
RUN chmod +x /usr/local/bin/kafka/bin/*.sh

# Kubernetes prompt info for bash and zsh 
COPY bin/kube-ps1.sh /usr/local/bin/

# Entrypoint
COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]

USER ${USERNAME}

###################################
# Main install as user
RUN mkdir -p /tmp/user
COPY ./user /tmp/user
RUN sudo chmod +x /tmp/user/*.sh \
    && /bin/sh /tmp/user/install.sh \
    && rm -rf /tmp/user
###################################

WORKDIR "/home/${USERNAME}"


# Maven settings
COPY config/settings.xml .m2/settings.xml