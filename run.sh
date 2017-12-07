#!/bin/sh
sed -i s/__PASSWORD__/$MINECRAFT_PASSWORD/ server.properties
java -Xms512M -Xmx1G -XX:MaxPermSize=128M -XX:+UseConcMarkSweepGC -jar spigot*.jar
