FROM alpine:3.9

ENV ZUL_VERSION=11.31.11
ENV JDK_VERSION=11.0.3
ENV JAVA_HOME=/opt/java

ENV JDK_DIR=zulu${ZUL_VERSION}-ca-jdk${JDK_VERSION}-linux_musl_x64
ENV JAVA_ARCHIVE=${JDK_DIR}.tar.gz

RUN cd /opt \
    && wget https://cdn.azul.com/zulu/bin/${JAVA_ARCHIVE} \
    && tar zxf ${JAVA_ARCHIVE} \
    && rm ${JAVA_ARCHIVE} \
    && ln -s ${JDK_DIR} java \
    && rm -f ${JAVA_HOME}/lib/src.zip && rm -rf ${JAVA_HOME}/demo && rm -rf ${JAVA_HOME}/man

ENV PATH="$PATH:$JAVA_HOME/bin"
