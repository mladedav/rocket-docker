FROM rust:1.60 as builder

RUN mkdir /build
WORKDIR /build
COPY . .
RUN cargo build --release
CMD ["./target/release/rocket-demo"]

# FROM debian:bullseye-slim
# ARG APP_USER=appuser
# RUN groupadd -r ${APP_USER} && useradd --no-log-init -r -g ${APP_USER} ${APP_USER}

# RUN apt-get update \
#     && apt-get install -y ca-certificates tzdata \
#     && rm -rf /var/lib/apt/lists/*

# RUN mkdir /app
# COPY --from=builder /build/target/release/rocket-demo /app/rocket-demo
# RUN chown -R $APP_USER:$APP_USER /app
# USER $APP_USER
# WORKDIR /app
# EXPOSE 8080

# CMD ["./rocket-demo"]