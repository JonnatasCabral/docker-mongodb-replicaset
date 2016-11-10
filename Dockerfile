FROM mongo:latest

ENV MONGO_PEM=/etc/mongodb/ssl/mongodb.pem
ENV MONGO_CA=/etc/mongodb/ssl/ca.pem
ENV MONGO_KEY=/etc/mongodb/ssl/keyfile

ADD ./security/mongodb.pem $MONGO_PEM
ADD ./security/ca.pem $MONGO_CA
ADD ./security/keyfile $MONGO_KEY

RUN chmod 600 $MONGO_KEY

RUN chown -hR mongodb /etc/mongodb/ssl/
ADD config.yml /etc/mongodb/config.yml
