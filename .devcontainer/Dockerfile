FROM node:24 AS node
FROM ubuntu:noble AS devenv

# Install Packages
RUN apt update
RUN apt-get update -y
RUN apt upgrade -y

RUN apt-get install -y python3 python3-pip python-is-python3 python3-venv build-essential
RUN apt install -y sudo zsh nano curl wget git
RUN apt install -y iputils-ping
RUN apt install -y postgresql-client
ENV SHELL=zsh

# Configure Locales
RUN apt-get install -y locales locales-all
ENV LC_ALL en_US.UTF-8
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8

# Configure SUDO
ARG USER="iguana"
RUN echo "${USER} ALL=(ALL:ALL) NOPASSWD: ALL" | tee /etc/sudoers.d/$USER

# Update user
ARG USER_ID=1000
ARG GROUP_ID=1000

RUN mv /home/ubuntu /home/$USER
RUN usermod -l $USER -d /home/$USER ubuntu
RUN usermod -a -G sudo $USER

RUN groupmod -n $USER ubuntu

RUN usermod -u ${USER_ID} ${USER}
RUN groupmod -g ${GROUP_ID} ${USER}
USER $USER
WORKDIR /home/$USER

# Configure ZSH
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
RUN sed -i 's/robbyrussell/flower-dance/g' .zshrc
RUN curl -o ~/.oh-my-zsh/themes/flower-dance.zsh-theme https://raw.githubusercontent.com/MarcyLeite/flower-dance-omzsh/main/flower-dance.zsh-theme

RUN sudo chsh -s $(which zsh) ${USER}																																																

# Add Node
COPY --from=node /usr/local/bin /usr/local/bin/
COPY --from=node /usr/local/lib/node_modules /usr/local/lib/node_modules
RUN sudo chmod 775 /usr/local/lib/node_modules
RUN sudo chown root:sudo /usr/local/lib/node_modules

WORKDIR /home/$USER/app
COPY ./entrypoint.sh /
CMD [ "/bin/zsh", "/entrypoint.sh" ]