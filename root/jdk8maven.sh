yum install -y java-1.8.0-openjdk-devel

MAVEN_VERSION=3.3.9
MAVEN_SHA=9b4b22aba67af48648c634e30edbb03de2a7742b7d4e58b3d637fcd20358a51ccb288dcbd473169a58b9322f7c8fbedcf5336b87d06460d0b20ce37d4c3948b0
mkdir -p /usr/share/maven /usr/share/maven/ref \
  && curl -fsSL -o /tmp/apache-maven.tar.gz https://archive.apache.org/dist/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz \
  && echo "${MAVEN_SHA} /tmp/apache-maven.tar.gz" | sha512sum -c - \
  && tar -xzf /tmp/apache-maven.tar.gz -C /usr/share/maven --strip-components=1 \
  && rm -f /tmp/apache-maven.tar.gz \
  && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn