FROM node:lts-slim AS builder

RUN apt update -q && \
    apt upgrade -yq && \
    apt install -yq wget default-jdk make cmake g++ unzip && \
    apt clean all -q

COPY Efficient-Compression-Tool/ /ect

WORKDIR /ect/build

RUN cmake ../src && make && chmod +x ect

ENV PATH="$PATH:/ect/build"

WORKDIR /game

COPY js13k-minipunk/ .

RUN chmod +x build.sh && ./build.sh

FROM python:3.10.15-slim-bullseye

COPY --from=builder /game/dist/ /game/

WORKDIR /game

EXPOSE 5000

ENTRYPOINT ["python", "-m", "http.server", "5000"]
