# gsc-minecraft - Game Server Container for Minecraft
<a href="www.egee.io"><img src="https://i.imgur.com/4hBUTKM.png" alt="Minecraft on Docker" width="300" /></a>

[![Build Status](https://travis-ci.org/egee-irl/gsc-minecraft.svg?branch=unstable)](https://travis-ci.org/egee-irl/gsc-minecraft)
[![Chat / Support](https://img.shields.io/badge/Chat%20%2F%20Support-discord-7289DA.svg?style=flat)](https://discord.gg/42PMX5N)
[![GitHub license](https://img.shields.io/badge/license-GPLv3-blue.svg?style=flat)](https://github.com/egee-irl/minecraft-docker/blob/stable/LICENSE)

Host your very own dedicated Minecraft server with one command:

``docker-compose up``

That's right - a single command will result in your very own dedicated game server! And its fully cross-platform; run it on Linux *or* Windows. That's the power of containers!

Host your very own dedicated Rust server with one command:

``docker-compose up``

That's it! And its fully cross-platform; run it on Linux *or* Windows. That's the power of Game Server Containers!

**Note** - this readme assumes you've already installed the prerequisites & your system meets the requirements to run a Game Server Container. If you want to learn more and see what it takes to run your own Game Server Container, check out the <a href="https://github.com/egee-irl/gsc-docs">gsc-docs</a> repo.

### Starting The Server

For the most part, Minecraft is relatively straight forward to run in a container, there's only two major considerations (both are detailed below). Minecraft & Spigot releases are somewhat irregular which can make keeping the server up to date somewhat difficult. The base Minecraft image Dockerfile can be found in the bootstrap branch in this repo. If Spigot or Minecraft needs to be updated, submit a PR against <a href="https://github.com/egee-irl/gsc-minecraft/blob/bootstrap/Dockerfile#L7">that</a> branch.

Hosting your own dedicated Minecraft server is pretty straight forward:

1. Clone this repo
2. Run ``docker-compose up`` from a terminal in the repo directory

If all is good, Docker should begin building the container. The server should start up shortly after. By default, docker-compose will attach the server (and the logs) to your terminal. You can run the server as a detached process by running ``docker-compose up -d``.

### Configuring The Server
The gsc-minecraft container has only two config files you need to worry about. Both are located in the ``cfg`` directory:

#### server.properties
This is your standard server.properties file. There's lots of websites out there that document how this file works, so I won't list everything you can do with it here. You _can_ run a server with the defaults but you'll probably want to update this file with things like your server name or rcon password. Keep in mind that if/when you update your server name, you will need to update the path to the volumes in the ``docker-compose.yml`` file. More information about that in the considerations section below.

#### ops.json
You will probably want a moderator/operator or two on your server. Add them in this file. There's an example of an operator in the file to help get you started.

### Updating The Server
Because of how updates are handled with Minecraft & Spigot, they can be somewhat tricky. There are basically 2 options:

1. Update the build number <a href="https://github.com/egee-irl/gsc-minecraft/blob/bootstrap/Dockerfile#L7">here</a> and submit a PR. Be sure to ping (@) me so I get emailed.
2. Use ``docker exec`` to access your container with bash and update the server manually.

### Considerations
Because Minecraft is a Java application and isn't handled by an external service (such as steamcmd), there are several caveates to consider when using GSC to host your server.

#### Updates
Hopefully by this point you are aware of the issues around updates. Using ``docker exec`` to access your container isn't that difficult, especially if you are familiar with Linux & bash. 

#### Resource Allocation
The Minecraft server is configured to use a **single** core and 2gb of ram. The Java process itself runs with the following parameters ``-Xms1G -Xmx1G -XX:MaxPermSize=128M``. If you find that this allocation is not sufficient for your server, feel free to increase them. The cpu & memory usage is defined in the ``docker-compose.yml`` and the Java process resource allocation is defined in the ``run.sh`` file.

#### Server Name & Volume Location
For all game server containers, volumes are defined for game & server data in the ``docker-compose.yml`` file under the ``volumes:`` section. Volumes are mapped to _folders_ and allow the Host and Guest to share data back and forth easily. The problem is that Minecraft creates server data folders based on the ``leve-name`` attribute in the ``server.properties`` file. This means that if/when you change your server name, you will also need to change (or disable) the path to the volumes on the Minecraft server.

The default level-name is ``server``. Notice in this example:

server.properties - ``level-name=server``

docker-compose.yml - ``~/volumes/minecraft-server/server:/opt/minecraft/server:Z``

Notice /opt/minecraft/**server**:Z. Now take this example:

server.properties - ``level-name=my-awesome-server!``

docker-compose.yml - ``~/volumes/minecraft-server/server:/opt/minecraft/my-awesome-server!:Z``

If you are using special characters in your server name, you will need to escape them with a backslash. This is standard for all Minecraft servers, not just with GSC.
