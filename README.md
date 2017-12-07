# minecraft-docker
A Spigot Minecraft server running inside a Docker container

You can run your own Minecraft server in a Docker container like this:

* Clone or download/extract this repo
* Run ``docker build . -t minecraftserver``
* Run ``docker run -d -p 25565:25565/tcp -p 25566:25566/tcp minecraftserver``

To add a plugin, simply put the plugin in the plugins folder before you build

There are a few things that need to be done still (PRs anyone? 😂)

* Ops file needs to be added & tokenized for ``sed``
* ~~Rcon needs to be nabled & password tokenized for ``sed``~~
* ~~Server description needs to be set~~
