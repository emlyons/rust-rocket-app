FROM rust:1 as builder
WORKDIR /app
COPY . .
RUN cargo update
RUN cargo build --release
RUN cargo test --release

FROM debian:buster-slim as runner
COPY --from=builder /usr/local/cargo/bin/rust-rocket-app /usr/local/bin/rust-rocket-app
ENV ROCKET_ADDRESS=0.0.0.0
EXPOSE 8000
CMD ["rust-rocket-app"]