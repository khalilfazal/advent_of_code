--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.1
-- Dumped by pg_dump version 9.6.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = ON;
SET check_function_bodies = FALSE;
SET client_min_messages = WARNING;
SET row_security = OFF;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "plpgsql" WITH SCHEMA "pg_catalog";

--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION "plpgsql" IS 'PL/pgSQL procedural language';

SET search_path = "public", "pg_catalog";

SET default_tablespace = '';

SET default_with_oids = FALSE;

--
-- Name: advent_problems; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "advent_problems" (
    "id"    INTEGER NOT NULL,
    "year"  INTEGER NOT NULL,
    "day"   INTEGER NOT NULL,
    "input" TEXT DEFAULT '' :: TEXT
);

--
-- Name: advent_problems_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE "advent_problems_id_seq"
START WITH 1
INCREMENT BY 1
NO MINVALUE
NO MAXVALUE
CACHE 1;

--
-- Name: advent_problems_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE "advent_problems_id_seq" OWNED BY "advent_problems"."id";

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "ar_internal_metadata" (
    "key"        CHARACTER VARYING           NOT NULL,
    "value"      CHARACTER VARYING,
    "created_at" TIMESTAMP WITHOUT TIME ZONE NOT NULL,
    "updated_at" TIMESTAMP WITHOUT TIME ZONE NOT NULL
);

--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE "schema_migrations" (
    "version" CHARACTER VARYING NOT NULL
);

--
-- Name: advent_problems id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY "advent_problems"
    ALTER COLUMN "id" SET DEFAULT nextval('advent_problems_id_seq' :: REGCLASS);

--
-- Name: advent_problems advent_problems_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "advent_problems"
    ADD CONSTRAINT "advent_problems_pkey" PRIMARY KEY ("id");

--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "ar_internal_metadata"
    ADD CONSTRAINT "ar_internal_metadata_pkey" PRIMARY KEY ("key");

--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY "schema_migrations"
    ADD CONSTRAINT "schema_migrations_pkey" PRIMARY KEY ("version");

--
-- Name: index_advent_problems_on_year_and_day; Type: INDEX; Schema: public; Owner: -
--

CREATE UNIQUE INDEX "index_advent_problems_on_year_and_day"
    ON "advent_problems" USING BTREE ("year", "day");

--
-- PostgreSQL database dump complete
--

SET search_path TO "$user", "public";

INSERT INTO "schema_migrations" ("version") VALUES
    ('20161220034955'),
    ('20161220152145'),
    ('20170103063709');


