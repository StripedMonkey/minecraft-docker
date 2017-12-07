FROM egeeio/minecraftserver
# RUN apt-get install git curl
# RUN adduser minecraft
# RUN chown -R minecraft:minecraft /home/minecraft

# USER minecraft
# WORKDIR /home/minecraft
# RUN curl -o /home/minecraft/BuildTools.jar https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
# RUN java -jar /home/minecraft/BuildTools.jar --rev 1.12.2
# COPY plugins /home/minecraft/plugins
# USER root
# RUN chown -R minecraft:minecraft /home/minecraft/plugins

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
