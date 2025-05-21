# syntax=docker/dockerfile:1

ARG RUBY_VERSION=3.2.2
FROM docker.io/library/ruby:$RUBY_VERSION-slim AS base

# Rails app lives here
WORKDIR /rails

# Install base packages including PostgreSQL client libraries
RUN apt-get update -qq && \
    apt-get install --no-install-recommends -y \
    curl \
    libjemalloc2 \
    libvips \
    postgresql-client \
    libpq-dev \
    build-essential \
    sqlite3 && \
    rm -rf /var/lib/apt/lists /var/cache/apt/archives

# Set development environment for testing
ENV RAILS_ENV="development" \
    BUNDLE_PATH="/usr/local/bundle"

# Copy application code
COPY . .

# Install gems
RUN bundle install

# Precompile bootsnap code for faster boot times if needed
RUN bundle exec bootsnap precompile app/ lib/ || true

# Add a script to be executed every time the container starts.
COPY docker-entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/docker-entrypoint.sh
ENTRYPOINT ["docker-entrypoint.sh"]

# Start the main process.
CMD ["bundle", "exec", "rails", "server", "-b", "0.0.0.0"]