FROM arashidos/snark_os:latest

WORKDIR /usr/src/
RUN git clone https://github.com/AleoHQ/leo
WORKDIR /usr/src/leo

RUN cargo install --path .

CMD ["leo"]
