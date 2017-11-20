FROM java:8
RUN apt-get install git curl
RUN curl -o BuildTools.jar https://hub.spigotmc.org/jenkins/job/BuildTools/lastSuccessfulBuild/artifact/target/BuildTools.jar
RUN java -jar BuildTools.jar --rev 1.12.2
ADD run.sh /run.sh
ADD eula.txt /eula.txt
CMD ["/run.sh"]
