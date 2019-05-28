# dev_setup
Files I use to recreate my development environment using Docker. 

Installs vim with a few plugins I like, adds bashrc. 

I use vim.Dockerfile as my base image for development work and run it with tmux
```
docker build -t <image_name> -f vim.Dockerfile .
docker run -it --rm --name <container_name> -v ~/<your_working_directory>:/app <image_name> tmux
```

My typical Python / Jupyter stack is built on top of base image
Expose 8888 for jupyter-notebook
```
docker build -t <image_name> -f jupyter.Dockerfile .
docker run -it --rm --name <container_name> \
        -v ~/<your_working_directory>:/app \
        -p 8888:8888 \
        <image_name> tmux
```

The images above can be used in a multistage build to have nice development tools but can be pulled out of the final image


