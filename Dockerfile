FROM colomoto/colomoto-docker:2021-02-01

USER root

RUN apt-get update && \
    apt-get install -y --no-install-recommends jaxb &&\
    apt clean -y && rm -rf /var/lib/apt/lists/*
ENV CLASSPATH=/usr/share/java/jaxb-api.jar:/usr/share/java/javax.activation.jar

RUN mkdir /opt/csbgnpy && cd /opt/csbgnpy && \
    wget -O- https://github.com/Adrienrougny/csbgnpy/archive/v0.1.tar.gz | \
        tar xvz --strip-components=1 &&\
    pip install -e .

RUN cd /opt/csbgnpy/third_party &&\
    sed -i 's,^java -cp ,java -cp ${CLASSPATH}:,' */*.sh

RUN pip install --no-cache https://github.com/Adrienrougny/sbgn2an/archive/8ee6332b1bccd43d34d0818da63c6d6a353dc456.zip
RUN pip install --no-cache https://github.com/adrienrougny/pintsim/archive/v0.2.zip
RUN pip install --no-cache tabulate

RUN rm -rf /notebook/*

COPY --chown=user:user *.xml *.ipynb /notebook/

ENV DOCKER_IMAGE=pauleve/clockcycle:v1

USER user
