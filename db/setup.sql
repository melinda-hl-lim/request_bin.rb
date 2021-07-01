--
-- PostgreSQL database dump
--

-- Dumped from database version 13.1
-- Dumped by pg_dump version 13.1

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: melinda
--

CREATE TABLE public.ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.ar_internal_metadata OWNER TO melinda;

--
-- Name: bins; Type: TABLE; Schema: public; Owner: melinda
--

CREATE TABLE public.bins (
    id bigint NOT NULL,
    slug character varying NOT NULL,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.bins OWNER TO melinda;

--
-- Name: bins_id_seq; Type: SEQUENCE; Schema: public; Owner: melinda
--

CREATE SEQUENCE public.bins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bins_id_seq OWNER TO melinda;

--
-- Name: bins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: melinda
--

ALTER SEQUENCE public.bins_id_seq OWNED BY public.bins.id;


--
-- Name: requests; Type: TABLE; Schema: public; Owner: melinda
--

CREATE TABLE public.requests (
    id bigint NOT NULL,
    payload text NOT NULL,
    bin_id integer,
    created_at timestamp(6) without time zone NOT NULL,
    updated_at timestamp(6) without time zone NOT NULL
);


ALTER TABLE public.requests OWNER TO melinda;

--
-- Name: requests_id_seq; Type: SEQUENCE; Schema: public; Owner: melinda
--

CREATE SEQUENCE public.requests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.requests_id_seq OWNER TO melinda;

--
-- Name: requests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: melinda
--

ALTER SEQUENCE public.requests_id_seq OWNED BY public.requests.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: melinda
--

CREATE TABLE public.schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO melinda;

--
-- Name: bins id; Type: DEFAULT; Schema: public; Owner: melinda
--

ALTER TABLE ONLY public.bins ALTER COLUMN id SET DEFAULT nextval('public.bins_id_seq'::regclass);


--
-- Name: requests id; Type: DEFAULT; Schema: public; Owner: melinda
--

ALTER TABLE ONLY public.requests ALTER COLUMN id SET DEFAULT nextval('public.requests_id_seq'::regclass);


--
-- Data for Name: ar_internal_metadata; Type: TABLE DATA; Schema: public; Owner: melinda
--

COPY public.ar_internal_metadata (key, value, created_at, updated_at) FROM stdin;
schema_sha1	4eec37a26c44ca4a0861c5dcd1c29e06f6367594	2021-05-03 18:25:40.797844	2021-05-03 18:25:40.797844
environment	test	2021-05-03 18:25:40.748469	2021-05-03 18:25:40.895246
\.


--
-- Data for Name: bins; Type: TABLE DATA; Schema: public; Owner: melinda
--

COPY public.bins (id, slug, created_at, updated_at) FROM stdin;
1	f9df8f0c	2021-05-03 18:25:40.934562	2021-05-03 18:25:40.934562
2	400d0199	2021-05-03 18:25:40.938616	2021-05-03 18:25:40.938616
\.


--
-- Data for Name: requests; Type: TABLE DATA; Schema: public; Owner: melinda
--

COPY public.requests (id, payload, bin_id, created_at, updated_at) FROM stdin;
1	{"headers": {"header 1": "a", "header 2": "b"}, "body": "{"I am a happy response body"}"}	1	2021-05-03 18:25:40.973493	2021-05-03 18:25:40.973493
\.


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: melinda
--

COPY public.schema_migrations (version) FROM stdin;
20210311162421
20210311161652
\.


--
-- Name: bins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: melinda
--

SELECT pg_catalog.setval('public.bins_id_seq', 2, true);


--
-- Name: requests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: melinda
--

SELECT pg_catalog.setval('public.requests_id_seq', 1, true);


--
-- Name: ar_internal_metadata ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: melinda
--

ALTER TABLE ONLY public.ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: bins bins_pkey; Type: CONSTRAINT; Schema: public; Owner: melinda
--

ALTER TABLE ONLY public.bins
    ADD CONSTRAINT bins_pkey PRIMARY KEY (id);


--
-- Name: requests requests_pkey; Type: CONSTRAINT; Schema: public; Owner: melinda
--

ALTER TABLE ONLY public.requests
    ADD CONSTRAINT requests_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: melinda
--

ALTER TABLE ONLY public.schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: index_requests_on_bin_id; Type: INDEX; Schema: public; Owner: melinda
--

CREATE INDEX index_requests_on_bin_id ON public.requests USING btree (bin_id);


--
-- Name: requests fk_rails_4fefac1f87; Type: FK CONSTRAINT; Schema: public; Owner: melinda
--

ALTER TABLE ONLY public.requests
    ADD CONSTRAINT fk_rails_4fefac1f87 FOREIGN KEY (bin_id) REFERENCES public.bins(id);


--
-- PostgreSQL database dump complete
--

