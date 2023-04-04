--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    name character varying(30),
    asteroid_id bigint NOT NULL,
    year_discovered integer NOT NULL,
    bangable boolean NOT NULL
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    name character varying(20),
    star_id integer,
    galaxy_id bigint NOT NULL,
    fk_star integer,
    year_founded integer NOT NULL,
    radius_lightyear integer NOT NULL
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    name character varying(20),
    planet_id integer,
    age integer,
    moon_id bigint NOT NULL,
    fk_moon integer,
    have_life boolean NOT NULL,
    radius integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    name character varying(20),
    description text,
    star_id numeric(4,1),
    planet_id bigint NOT NULL,
    fk_planet integer,
    fk_moon integer,
    radius integer NOT NULL,
    moons integer NOT NULL
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    name character varying(30),
    mass numeric(4,1),
    star_id bigint NOT NULL,
    fk_star integer,
    fk_planet integer,
    age integer NOT NULL,
    radius integer NOT NULL
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES ('Bennu', 1, 1999, false);
INSERT INTO public.asteroid VALUES ('Psyche', 2, 1852, true);
INSERT INTO public.asteroid VALUES ('Ryugu', 3, 1999, true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES ('milky way', 1, 1, 1, 0, 52850);
INSERT INTO public.galaxy VALUES ('milky way2', 2, 2, 2, 2008, 52850);
INSERT INTO public.galaxy VALUES ('milky way3', 3, 3, 3, 1756, 52850);
INSERT INTO public.galaxy VALUES ('milky way4', 4, 4, 4, 2017, 52850);
INSERT INTO public.galaxy VALUES ('milky way5', 5, 5, 5, 1664, 52850);
INSERT INTO public.galaxy VALUES ('milky way6', 6, 6, 6, 1999, 52850);
INSERT INTO public.galaxy VALUES ('milky way7', 7, 7, 7, 0, 0);
INSERT INTO public.galaxy VALUES ('milky way8', 8, 8, 8, 0, 0);
INSERT INTO public.galaxy VALUES ('milky way9', 9, 9, 9, 0, 0);
INSERT INTO public.galaxy VALUES ('milky way10', 10, 10, 10, 0, 0);
INSERT INTO public.galaxy VALUES ('milky way11', 11, 11, 11, 0, 0);
INSERT INTO public.galaxy VALUES ('milky way12', 12, 12, 12, 0, 0);
INSERT INTO public.galaxy VALUES ('milky way13', 13, 13, 13, 0, 0);
INSERT INTO public.galaxy VALUES ('milky way14', 14, 14, 14, 0, 0);
INSERT INTO public.galaxy VALUES ('milky way15', 15, 15, 15, 0, 0);
INSERT INTO public.galaxy VALUES ('milky way16', 16, 16, 16, 0, 0);
INSERT INTO public.galaxy VALUES ('milky way17', 17, 17, 17, 0, 0);
INSERT INTO public.galaxy VALUES ('milky way18', 18, 18, 18, 0, 0);
INSERT INTO public.galaxy VALUES ('milky way19', 19, 19, 19, 0, 0);
INSERT INTO public.galaxy VALUES ('milky way20', 20, 20, 20, 0, 0);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--



--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('earth', 'big', 1.0, 1, 1, 1, 6371, 1);
INSERT INTO public.planet VALUES ('WASP-12b', 'big', 2.0, 2, 2, 2, 1, 0);
INSERT INTO public.planet VALUES ('KELT-9b', 'big', 3.0, 3, 3, 3, 1, 0);
INSERT INTO public.planet VALUES ('Tau Cetie', 'big', 4.0, 4, 4, 4, 1, 0);
INSERT INTO public.planet VALUES ('Proxima b', 'big', 5.0, 5, 5, 5, 1, 0);
INSERT INTO public.planet VALUES ('TRAPPIST-1e', 'big', 6.0, 6, 6, 6, 1, 0);
INSERT INTO public.planet VALUES ('saturn', 'big', 7.0, 7, 7, 7, 2575, 82);
INSERT INTO public.planet VALUES ('jupiter1', 'big', 8.0, 8, 8, 8, 2631, 79);
INSERT INTO public.planet VALUES ('jupiter2', 'big', 9.0, 9, 9, 9, 2410, 79);
INSERT INTO public.planet VALUES ('neptune', 'big', 10.0, 10, 10, 10, 1353, 14);
INSERT INTO public.planet VALUES ('jupiter3', 'big', 11.0, 11, 11, 11, 1821, 79);
INSERT INTO public.planet VALUES ('jupiter4', 'big', 12.0, 12, 12, 12, 0, 0);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('sol', 1.0, 1, 1, 1, 5, 1);
INSERT INTO public.star VALUES ('WASP-12', 1.4, 2, 2, 2, 1, 2);
INSERT INTO public.star VALUES ('vega', 2.1, 3, 3, 3, 5, 2);
INSERT INTO public.star VALUES ('Tau Ceti', 0.8, 4, 4, 4, 8, 1);
INSERT INTO public.star VALUES ('alpha centauri', 1.1, 5, 5, 5, 6, 1);
INSERT INTO public.star VALUES ('TRAPPIST-1', 1.1, 6, 6, 6, 5, 0);
INSERT INTO public.star VALUES ('sirius a', 2.0, 7, 7, 7, 240000000, 2);
INSERT INTO public.star VALUES ('procyon a', 1.5, 8, 8, 8, 1700000000, 2);
INSERT INTO public.star VALUES ('epsilon eridani', 0.8, 9, 9, 9, 1, 1);
INSERT INTO public.star VALUES ('altair', 1.8, 10, 10, 10, 120000000, 2);
INSERT INTO public.star VALUES ('pollux', 1.8, 11, 11, 11, 724000000, 9);
INSERT INTO public.star VALUES ('fomalhaut', 1.9, 12, 12, 12, 440000000, 2);
INSERT INTO public.star VALUES ('denebola', 2.3, 13, 13, 13, 220000000, 2);
INSERT INTO public.star VALUES ('beta aquarii', 5.5, 14, 14, 14, 30000000, 4);
INSERT INTO public.star VALUES ('algol', 3.7, 15, 15, 15, 10000000, 4);
INSERT INTO public.star VALUES ('zeta tauri', 2.6, 16, 16, 16, 60000000, 6);
INSERT INTO public.star VALUES ('gamma leporis', 3.6, 17, 17, 17, 16000000, 3);
INSERT INTO public.star VALUES ('beta canis', 8.6, 18, 18, 18, 1000000, 4);
INSERT INTO public.star VALUES ('eta carinae', 120.0, 19, 19, 19, 250000, 250);
INSERT INTO public.star VALUES ('rigel', 23.0, 20, 20, 20, 800000, 78);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 1, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 5, true);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_fk_star_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_fk_star_key UNIQUE (fk_star);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_name_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key1 UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_name_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key1 UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_fk_moon_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_fk_moon_key UNIQUE (fk_moon);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_name_key1; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key1 UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_key UNIQUE (star_id);


--
-- Name: star star_fk_planet_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_fk_planet_key UNIQUE (fk_planet);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_fk_moon_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_fk_moon_fkey FOREIGN KEY (fk_moon) REFERENCES public.planet(fk_moon);


--
-- Name: planet planet_fk_planet_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_fk_planet_fkey FOREIGN KEY (fk_planet) REFERENCES public.star(fk_planet);


--
-- Name: star star_fk_star_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_fk_star_fkey FOREIGN KEY (fk_star) REFERENCES public.galaxy(fk_star);


--
-- PostgreSQL database dump complete
--
