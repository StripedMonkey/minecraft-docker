FROM egeeio/minecraftserver

COPY run.sh /home/minecraft/run.sh
COPY cfg/eula.txt /home/minecraft/eula.txt
COPY cfg/ops.json /home/minecraft/ops.json
COPY cfg/server.properties /home/minecraft/server.properties
#COPY server-icon.png /home/minecraft/server-icon.png

CMD ["/home/minecraft/run.sh"]
