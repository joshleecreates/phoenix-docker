FROM elixir:1.3

ADD . /app
WORKDIR /app
RUN mix local.hex --force
RUN mix archive.install --force https://github.com/phoenixframework/archives/raw/master/phoenix_new.ez
RUN mix deps.get --only-prod
RUN MIX_ENV=prod mix deps.compile
RUN MIX_ENV=prod mix compile

EXPOSE 4000
CMD ["mix", "phoenix.server"]
