# Use the latest stable Elixir image based on Alpine
FROM elixir:1.16-alpine

# Install build dependencies
RUN apk add --no-cache \
    build-base \
    git \
    mysql-client \
    nodejs \
    npm \
    icu-data-full \
    inotify-tools

# Install Hex, Rebar, and Phoenix generator
RUN mix local.hex --force && \
    mix local.rebar --force && \
    mix archive.install hex phx_new --force

WORKDIR /app
