CREATE TABLE "schema_migrations" (
    "version" VARCHAR NOT NULL PRIMARY KEY
);

CREATE TABLE "ar_internal_metadata" (
    "key"        VARCHAR  NOT NULL PRIMARY KEY,
    "value"      VARCHAR,
    "created_at" DATETIME NOT NULL,
    "updated_at" DATETIME NOT NULL
);

CREATE TABLE "inputs" (
    "id"    INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    "year"  INTEGER                           NOT NULL,
    "day"   INTEGER                           NOT NULL,
    "input" TEXT DEFAULT ''
);

CREATE UNIQUE INDEX "index_inputs_on_year_and_day"
    ON "inputs" ("year", "day");

INSERT INTO "schema_migrations" ("version") VALUES ('20161220034955'), ('20161220152145');