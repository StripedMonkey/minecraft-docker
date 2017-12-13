FROM egeeio/minecraftserver

COPY run.sh /opt/minecraft/run.sh
COPY cfg/eula.txt /opt/minecraft/eula.txt
COPY cfg/ops.json /opt/minecraft/ops.json
COPY cfg/server.properties /opt/minecraft/server.properties
#COPY server-icon.png /opt/minecraft/server-icon.png

CMD ["/opt/minecraft/run.sh"]
