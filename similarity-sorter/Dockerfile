FROM alpine

RUN apk update && apk add git maven openjdk8
RUN git clone https://github.com/mrkamel/similarity-sorter.git && cd similarity-sorter && mvn clean package -DskipTests
CMD cd similarity-sorter && sh start.sh
EXPOSE 19200
