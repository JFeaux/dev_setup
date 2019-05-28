FROM python:3.7 AS vim_environment
ENV PYTHONBUFFERED=1

RUN apt-get update
RUN apt-get install -y vim-nox \
                       build-essential \
                       git \
                       cmake \
                       python3-dev \
                       tmux 

# Vim Plugin Manager Install
RUN git clone https://github.com/VundleVim/Vundle.vim.git /root/.vim/bundle/Vundle.vim
COPY my_env/.vimrc /root/.vimrc
RUN vim +PluginInstall +qall

# Install code completion for VIM
RUN python /root/.vim/bundle/YouCompleteMe/install.py --clang-completer

# Use my bashrc
COPY my_env/.bashrc /root/.bashrc

WORKDIR /app
