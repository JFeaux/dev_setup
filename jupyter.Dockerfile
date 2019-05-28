FROM vim_image as jupyter_environment

# My typical Python dependecies
COPY my_env/requirements.txt /root/.
RUN pip install --upgrade pip
RUN pip install -r /root/requirements.txt

# Vim bindings for Jupyter-notebooks
RUN mkdir -p $(jupyter --data-dir)/nbextensions
RUN git clone https://github.com/lambdalisue/jupyter-vim-binding $(jupyter --data-dir)/nbextensions/vim_binding
RUN jupyter nbextension enable vim_binding/vim_binding

# alias jupyter-notebook for working inside Docker
RUN echo "alias jupyter-notebook='jupyter-notebook --ip=0.0.0.0  --no-browser --allow-root'" >> /root/.bashrc

