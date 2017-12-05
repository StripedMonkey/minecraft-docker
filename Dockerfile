FROM java:8
RUN apt-get install git curl
RUN curl -o BuildTools.jar https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
RUN java -jar BuildTools.jar --rev 1.12.2
ADD run.sh /run.sh
ADD plugins /plugins
ADD eula.txt /eula.txt
ADD ops.json /ops.json
ADD server.properties /server.properties
ADD server-icon.png /server-icon.png
EXPOSE 25565
EXPOSE 25575
CMD ["/run.sh"]
