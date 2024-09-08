# Golang Demo

## Build binary

```sh
GOOS=linux GOARCH=amd64 go build -o golang-demo
chmod +x golang-demo
```

## Preconditions

1. Install and configure postresql db
2. Run schema generation from file `db_schema.sql`

## Start program

```sh
DB_ENDPOINT=<db_endpoint> DB_PORT=5432 DB_USER=<user> DB_PASS=<password> DB_NAME=<db_name> ./golang-demo
```
