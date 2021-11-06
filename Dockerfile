FROM rust

ENV ROCKET_ADDRESS=0.0.0.0
ENV ROCKET_PORT=8000
WORKDIR /app
COPY ./target/armv7-unknown-linux-gnueabihf/release/rust-rocket-app .
CMD ["./rust-rocket-app"]