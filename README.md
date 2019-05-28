# dev_setup
Files I use to create my development environment using Docker. 

Installs vim with a few plugins: YouCompleteMe, 

and python with my usual dependecies. 



# Build and run container
```
docker build -t <image_name> .
docker run -it --rm --name <container_name> \
       -v ~/<your_working_directory>:/app \
       -p <port>:8888 \
       <image_name> \
       tmux 
```

