# minecraft-docker
A Spigot Minecraft server running inside a Docker container

You can run your own Minecraft server in a Docker container like this:

* Clone or download/extract this repo
* Run ``docker build . -t minecraftserver``
* Run ``docker run -d -p 25565:25565/tcp -p 25566:25566/tcp minecraft``
