FROM java:8

RUN mkdir -p /output

# ADD http://nilhcem.github.com/FakeSMTP/downloads/fakeSMTP-latest.zip /fakeSMTP-latest.zip
# RUN unzip /fakeSMTP-latest.zip

ADD target/fakeSMTP-*.jar /fakeSMTP.jar

VOLUME /output

EXPOSE 25

ENTRYPOINT ["java","-jar","/fakeSMTP.jar","--background", "--output-dir", "/output", "--port", "25", "--start-server"]
