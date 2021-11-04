FROM rust:1.52.1 AS rust
WORKDIR /app
COPY . .
RUN cargo build

FROM debian:buster-slim as runner
COPY --from=builder /usr/local/cargo/bin/rust-rocket-app /usr/local/bin/rust-rocket-app
ENV ROCKET_ADDRESS=0.0.0.0
EXPOSE 8000
CMD ["rust-rocket-app"]