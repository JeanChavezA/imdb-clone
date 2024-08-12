# IMDB clone

A clone of [imdb](https://www.imdb.com) as a postgres extension.

## Development

Nix is used for development. Install it by following the instructions on https://nixos.org/download/.

You can start a local database with:

```
$ nix-shell

$ with-pg-16 psql

-- then try some query
postgres=# select * from items;
```

For running the tests use:

```
$ with-pg-16 make installcheck
```
