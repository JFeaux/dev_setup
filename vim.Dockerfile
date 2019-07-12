FROM python:3.7 AS vim_environment
ENV PYTHONBUFFERED=1

ARG user=jacob
ARG home=/home/$user

RUN apt-get update
RUN apt-get install -y vim-nox \
                       build-essential \
                       git \
                       cmake \
                       python3-dev \
                       tmux 

# Add the user UID:1000, GID:1000, home at /home/$user
RUN groupadd -r $user -g 1000 && useradd -u 1000 -g $user -m  $user
USER $user
WORKDIR $home

# Vim Plugin Manager Install
RUN git clone https://github.com/VundleVim/Vundle.vim.git $home/.vim/bundle/Vundle.vim
COPY my_env/.vimrc $home/.vimrc
RUN vim +PluginInstall +qall

# Install code completion for VIM
RUN python $home/.vim/bundle/YouCompleteMe/install.py --clang-completer

# Use my bashrc
COPY my_env/.bashrc $home/.bashrc

# Use my tmux.conf
COPY my_env/.tmux.conf $home/.tmux.conf

ENV USER=$user
ENV SHELL=/bin/bash
