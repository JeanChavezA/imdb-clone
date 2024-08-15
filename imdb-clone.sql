--
-- PostgreSQL database dump
--

-- Dumped from database version 13.15
-- Dumped by pg_dump version 13.15

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
-- Name: actors; Type: TABLE; Schema: public; Owner: jmoises
--

CREATE TABLE public.actors (
    actor_id integer NOT NULL,
    name character varying(255) NOT NULL
);


ALTER TABLE public.actors OWNER TO jmoises;

--
-- Name: actors_actor_id_seq; Type: SEQUENCE; Schema: public; Owner: jmoises
--

CREATE SEQUENCE public.actors_actor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.actors_actor_id_seq OWNER TO jmoises;

--
-- Name: actors_actor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jmoises
--

ALTER SEQUENCE public.actors_actor_id_seq OWNED BY public.actors.actor_id;


--
-- Name: movies; Type: TABLE; Schema: public; Owner: jmoises
--

CREATE TABLE public.movies (
    movie_id integer NOT NULL,
    title character varying(255) NOT NULL,
    release_year integer,
    rating numeric(3,1),
    description text
);


ALTER TABLE public.movies OWNER TO jmoises;

--
-- Name: movies_movie_id_seq; Type: SEQUENCE; Schema: public; Owner: jmoises
--

CREATE SEQUENCE public.movies_movie_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.movies_movie_id_seq OWNER TO jmoises;

--
-- Name: movies_movie_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jmoises
--

ALTER SEQUENCE public.movies_movie_id_seq OWNED BY public.movies.movie_id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: jmoises
--

CREATE TABLE public.roles (
    role_id integer NOT NULL,
    movie_id integer,
    actor_id integer,
    role_name character varying(255)
);


ALTER TABLE public.roles OWNER TO jmoises;

--
-- Name: roles_role_id_seq; Type: SEQUENCE; Schema: public; Owner: jmoises
--

CREATE SEQUENCE public.roles_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_role_id_seq OWNER TO jmoises;

--
-- Name: roles_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jmoises
--

ALTER SEQUENCE public.roles_role_id_seq OWNED BY public.roles.role_id;


--
-- Name: actors actor_id; Type: DEFAULT; Schema: public; Owner: jmoises
--

ALTER TABLE ONLY public.actors ALTER COLUMN actor_id SET DEFAULT nextval('public.actors_actor_id_seq'::regclass);


--
-- Name: movies movie_id; Type: DEFAULT; Schema: public; Owner: jmoises
--

ALTER TABLE ONLY public.movies ALTER COLUMN movie_id SET DEFAULT nextval('public.movies_movie_id_seq'::regclass);


--
-- Name: roles role_id; Type: DEFAULT; Schema: public; Owner: jmoises
--

ALTER TABLE ONLY public.roles ALTER COLUMN role_id SET DEFAULT nextval('public.roles_role_id_seq'::regclass);


--
-- Data for Name: actors; Type: TABLE DATA; Schema: public; Owner: jmoises
--

COPY public.actors (actor_id, name) FROM stdin;
\.


--
-- Data for Name: movies; Type: TABLE DATA; Schema: public; Owner: jmoises
--

COPY public.movies (movie_id, title, release_year, rating, description) FROM stdin;
\.


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: jmoises
--

COPY public.roles (role_id, movie_id, actor_id, role_name) FROM stdin;
\.


--
-- Name: actors_actor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jmoises
--

SELECT pg_catalog.setval('public.actors_actor_id_seq', 1, false);


--
-- Name: movies_movie_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jmoises
--

SELECT pg_catalog.setval('public.movies_movie_id_seq', 1, false);


--
-- Name: roles_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jmoises
--

SELECT pg_catalog.setval('public.roles_role_id_seq', 1, false);


--
-- Name: actors actors_pkey; Type: CONSTRAINT; Schema: public; Owner: jmoises
--

ALTER TABLE ONLY public.actors
    ADD CONSTRAINT actors_pkey PRIMARY KEY (actor_id);


--
-- Name: movies movies_pkey; Type: CONSTRAINT; Schema: public; Owner: jmoises
--

ALTER TABLE ONLY public.movies
    ADD CONSTRAINT movies_pkey PRIMARY KEY (movie_id);


--
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: public; Owner: jmoises
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (role_id);


--
-- Name: roles roles_actor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jmoises
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_actor_id_fkey FOREIGN KEY (actor_id) REFERENCES public.actors(actor_id);


--
-- Name: roles roles_movie_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: jmoises
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT roles_movie_id_fkey FOREIGN KEY (movie_id) REFERENCES public.movies(movie_id);


--
-- PostgreSQL database dump complete
--

