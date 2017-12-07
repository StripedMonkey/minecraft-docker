FROM egeeio/minecraftserver

COPY run.sh /home/minecraft/run.sh
COPY eula.txt /home/minecraft/eula.txt
COPY ops.json /home/minecraft/ops.json
COPY server.properties /home/minecraft/server.properties
COPY server-icon.png /home/minecraft/server-icon.png
RUN chown minecraft:minecraft /home/minecraft/run.sh
RUN chown minecraft:minecraft /home/minecraft/eula.txt
RUN chown minecraft:minecraft /home/minecraft/ops.json
RUN chown minecraft:minecraft /home/minecraft/server.properties
RUN chown minecraft:minecraft /home/minecraft/server-icon.png

EXPOSE 25565
EXPOSE 25575
USER minecraft
CMD ["/home/minecraft/run.sh"]
