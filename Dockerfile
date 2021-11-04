FROM rust:1 as builder
RUN rustup install nightly
RUN rustup target add armv7-unknown-linux-gnueabihf
RUN apt-get update && apt-get upgrade -y
RUN apt-get -y install binutils-arm-linux-gnueabihf
RUN apt-get -y install gcc-arm-linux-gnueabihf
WORKDIR /app
COPY . .
RUN cargo install --target=armv7-unknown-linux-gnueabihf --path .

FROM debian:buster-slim as runner
COPY --from=builder /usr/local/cargo/bin/rust-rocket-app /usr/local/bin/rust-rocket-app
ENV ROCKET_ADDRESS=0.0.0.0
EXPOSE 8000
CMD ["rust-rocket-app"]