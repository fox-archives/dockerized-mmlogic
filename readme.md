# Dockerized MultiMedia Logic

## Introduction

MultiMedia Logic is a good program logic simulation and the similar. If you want to get it up and running quickly (without installing wine on your host system), this is the tool for you. It contains configuration used to spin up MultiMedia Logic in a Docker container, whether you are running on GNU/Linux, macOS, or Windows.

## Notes

If you are on GNU/Linux, this will only work if you are running an Xorg display server on your host machine. (Wayland and Mir are not directly supported).

**Important**, the MultiMedia Logic program will only be able to see files that are contained in the `./dockerized-mmlogic` directory. You will *not* be able to browse for files that are just anywhere on your computer. This is because we are [bind mounting](https://docs.docker.com/storage/bind-mounts) the [`./dockerized-mmlogic` directory](https://github.com/eankeen/dockerized-mmlogic/blob/27e54294f258749bfe92382b301a7180dee04ef6/start.sh#L12) into the Docker container.

## Setup

Docker [must be installed](https://docs.docker.com/install).


```sh
git clone https://github.com/eankeen/dockerized-mmlogic
cd dockerized-mmlogic
mkdir .wine
chmod +x ./start.sh
sudo ./start.sh
# on subsequent starts, update `Dockerfile` CMD to use new executable
```

Running `start.sh` as sudo is required because connecting to the Docker daemon socket requires superuser privileges.

