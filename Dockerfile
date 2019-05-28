FROM python:3.7 AS dev
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
WORKDIR /root/.vim/bundle/YouCompleteMe
RUN python /root/.vim/bundle/YouCompleteMe/install.py --clang-completer

# My typical Python dependecies
COPY my_env/requirements.txt /root/.
RUN pip install --upgrade pip
RUN pip install -r /root/requirements.txt

# Vim bindings for Jupyter-notebooks
RUN mkdir -p $(jupyter --data-dir)/nbextensions
RUN git clone https://github.com/lambdalisue/jupyter-vim-binding $(jupyter --data-dir)/nbextensions/vim_binding
RUN jupyter nbextension enable vim_binding/vim_binding

# alias jupyter-notebook for working inside Docker
RUN echo "alias jupyter-notebook='jupyter-notebook --ip=0.0.0.0  --no-browser --allow-root'" >> ~/.bashrc



