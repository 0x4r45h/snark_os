FROM rust:1.66.0

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y git build-essential curl clang gcc libssl-dev llvm make pkg-config xz-utils
WORKDIR /usr/src/
RUN git clone https://github.com/AleoHQ/snarkOS.git --depth 1
WORKDIR /usr/src/snarkOS
RUN cargo install --path .

EXPOSE 4133/tcp
EXPOSE 3033/tcp

COPY ./entrypoint.sh /opt/entrypoint.sh
RUN chmod u+x /opt/entrypoint.sh
RUN chmod u+x ./run-prover.sh
RUN chmod u+x ./run-client.sh
ENTRYPOINT ["/opt/entrypoint.sh"]
CMD ["prover"]