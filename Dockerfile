FROM node:6

ENV java_version 1.8.0_51
ENV filename jdk-8u51-linux-x64.tar.gz
ENV JAVA_HOME /opt/java-oracle/jdk$java_version
ENV PATH $JAVA_HOME/bin:$PATH

RUN  wget --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u51-b16/$filename -O /tmp/$filename --progress=bar:force; \
  mkdir -p /opt/java-oracle && tar -zxf /tmp/$filename -C /opt/java-oracle/;  \
  update-alternatives --install /usr/bin/java java $JAVA_HOME/bin/java 20000; \
  update-alternatives --install /usr/bin/javac javac $JAVA_HOME/bin/javac 20000; \
  apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN npm install yarn -g
