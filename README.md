# Thinreports Rails Example

[![CI](https://github.com/thinreports/thinreports-rails-example/workflows/CI/badge.svg)](https://github.com/thinreports/thinreports-rails-example/actions?query=branch%3Amaster)

A simple task management application using Thinreports and Rails.

## Environments

- Ruby 2.7, 3.0
- Rails 6.1
- [thinreports-generator](https://github.com/thinreports/thinreports-generator) 0.12.0
- [thinreports-rails](https://github.com/takeshinoda/thinreports-rails) 0.5.0

## Running this application

```
$ bundle install
$ bin/rails db:setup
$ bin/rails s
```

Visit `http://localhost:3000`.

### Using docker-compose

```
$ docker-compose build
$ docker-compose run app bin/rails db:setup
$ docker-compose up -d
```

## Community

- [Discussion Group (GitHub Discussions)](https://github.com/thinreports/thinreports/discussions)
- [Discussion Group (Google Groups)](https://groups.google.com/forum/#!forum/thinreports)
