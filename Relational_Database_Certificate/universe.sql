--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    has_life boolean NOT NULL,
    age_in_billions_of_years integer,
    distance_from_earth_in_lyr numeric(10,0),
    galaxy_type_id integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
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
-- Name: galaxy_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_type (
    galaxy_type_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text
);


ALTER TABLE public.galaxy_type OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_types_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_types_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_types_galaxy_type_id_seq OWNED BY public.galaxy_type.galaxy_type_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    is_spherical boolean NOT NULL,
    age_in_billions_of_years integer,
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
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
    planet_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    has_life boolean NOT NULL,
    is_spherical boolean NOT NULL,
    age_in_billions_of_years integer,
    distance_from_earth_in_km numeric(10,0),
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
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
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    is_spherical boolean NOT NULL,
    age_in_billions_of_years integer,
    distance_from_earth_in_lyr numeric(10,0),
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_type galaxy_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type ALTER COLUMN galaxy_type_id SET DEFAULT nextval('public.galaxy_types_galaxy_type_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'It’s a spiral galaxy with a disk of stars spanning more than 100,000 light-years. NASA.', true, 13, 0, 1);
INSERT INTO public.galaxy VALUES (4, 'Cartwheel Galaxy', '', false, 0, 489200000, 3);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', '', false, 10, 2537000, 1);
INSERT INTO public.galaxy VALUES (3, 'Hercules A', '', false, NULL, 2100000, 2);
INSERT INTO public.galaxy VALUES (5, 'Maffei 1', 'A lenticular type galaxy, which has a disk-like structure and a central bulge but no spiral structure or appreciable dust content. NASA.', false, 10, 9800000, 3);
INSERT INTO public.galaxy VALUES (6, 'IC 4710', 'A dwarf irregular galaxy', false, NULL, 25000000, 4);


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_type VALUES (1, 'Spiral Galaxies', 'These galaxies resemble giant rotating pinwheels with a pancake-like disk of stars and a central bulge or tight concentration of stars. NASA.');
INSERT INTO public.galaxy_type VALUES (2, 'Elliptical Galaxies', 'Elliptical galaxies have shapes that range from completely round to oval. They are less common than spiral galaxies. NASA.');
INSERT INTO public.galaxy_type VALUES (3, 'Lenticular Galaxies', 'Lenticular galaxies are a kind of cross between spirals and ellipticals. They have the central bulge and disk common to spiral galaxies but no arms. But like ellipticals, lenticular galaxies have older stellar populations and little ongoing star formation. NASA.');
INSERT INTO public.galaxy_type VALUES (4, 'Irregular Galaxies', 'Irregular galaxies have unusual shapes, like toothpicks, rings, or even little groupings of stars. NASA');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 'The only natural satellite of Earth', true, 4, 3);
INSERT INTO public.moon VALUES (2, 'Fabos', 'One of the satellites of Mars', false, 1, 4);
INSERT INTO public.moon VALUES (3, 'Deimos', 'One of the satellites of Mars', false, 1, 4);
INSERT INTO public.moon VALUES (4, 'Europa', 'One of the satellites of Jupiter', true, 4, 5);
INSERT INTO public.moon VALUES (5, 'Io', 'One of the satellites of Jupiter', true, 4, 5);
INSERT INTO public.moon VALUES (6, 'Callisto', 'One of the satellites of Jupiter', true, 4, 5);
INSERT INTO public.moon VALUES (7, 'Amalthea', 'One of the satellites of Jupiter', false, 4, 5);
INSERT INTO public.moon VALUES (8, 'Ganímedes', 'One of the satellites of Jupiter', true, 4, 5);
INSERT INTO public.moon VALUES (9, 'Cyllene', 'One of the satellites of Jupiter', false, NULL, 5);
INSERT INTO public.moon VALUES (10, 'Autonoe', 'One of the satellites of Jupiter', true, NULL, 5);
INSERT INTO public.moon VALUES (11, 'Herse', 'One of the satellites of Jupiter', false, NULL, 5);
INSERT INTO public.moon VALUES (12, 'Titan', 'One of the satellites of Saturn', true, 1, 6);
INSERT INTO public.moon VALUES (13, 'Enceladus', 'One of the satellites of Saturn', true, 1, 6);
INSERT INTO public.moon VALUES (14, 'Mimas', 'One of the satellites of Saturn', true, NULL, 6);
INSERT INTO public.moon VALUES (15, 'Dione', 'One of the satellites of Saturn', true, 4, 6);
INSERT INTO public.moon VALUES (16, 'Iapetus', 'One of the satellites of Saturn', true, 4, 6);
INSERT INTO public.moon VALUES (17, 'Tethys', 'One of the satellites of Saturn', true, 4, 6);
INSERT INTO public.moon VALUES (18, 'Hyperion', 'One of the satellites of Saturn', false, NULL, 6);
INSERT INTO public.moon VALUES (19, 'Rhea', 'One of the satellites of Saturn', true, 4, 6);
INSERT INTO public.moon VALUES (20, 'Titania', 'One of the satellites of Uranus', true, NULL, 7);
INSERT INTO public.moon VALUES (21, 'Umbriel', 'One of the satellites of Uranus', true, NULL, 7);
INSERT INTO public.moon VALUES (22, 'Miranda', 'One of the satellites of Uranus', true, NULL, 7);
INSERT INTO public.moon VALUES (23, 'Oberon', 'One of the satellites of Uranus', true, NULL, 7);
INSERT INTO public.moon VALUES (24, 'Ariel', 'One of the satellites of Uranus', true, 0, 7);
INSERT INTO public.moon VALUES (25, 'Triton', 'One of the satellites of Neptune', true, 0, 8);
INSERT INTO public.moon VALUES (26, 'Despina', 'One of the satellites of Neptune', false, NULL, 8);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'The first planet on the Solar System', false, true, 4, 77000000, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'The second planet on the Solar System', false, true, 4, 40000000, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 'The third planet on the Solar System', true, true, 4, 0, 1);
INSERT INTO public.planet VALUES (4, 'Mars', 'The fourth planet on the Solar System', false, true, 4, 54000000, 1);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'The fifth planet on the Solar System', false, true, 4, 714000000, 1);
INSERT INTO public.planet VALUES (6, 'Saturn', 'The sixth planet on the Solar System', false, true, 4, 1300000000, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'The seventh planet on the Solar System', false, true, 4, 1600000000, 1);
INSERT INTO public.planet VALUES (8, 'Neptune', 'The eighth planet on the Solar System', false, true, 4, 3000000000, 1);
INSERT INTO public.planet VALUES (9, 'TRAPPIST-1b', '', false, true, NULL, NULL, 7);
INSERT INTO public.planet VALUES (10, 'TRAPPIST-1d', '', false, true, NULL, NULL, 7);
INSERT INTO public.planet VALUES (11, 'TRAPPIST-1e', '', false, true, NULL, NULL, 7);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1f', '', false, true, NULL, NULL, 7);
INSERT INTO public.planet VALUES (13, 'TRAPPIST-1g', '', false, true, NULL, NULL, 7);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 'The Sun is the star at the heart of our solar system. NASA.', true, 4, 0, 1);
INSERT INTO public.star VALUES (2, 'Mirach', 'Also called Beta Andrômeda', true, NULL, 199, 2);
INSERT INTO public.star VALUES (3, '51 Andromedae', '', true, 1, 169, 2);
INSERT INTO public.star VALUES (4, 'Iota Andromedae', '', true, 0, 500, 2);
INSERT INTO public.star VALUES (5, 'Antares', '', true, 0, 554, 1);
INSERT INTO public.star VALUES (6, 'Pistol Star', '', true, 0, 26090, 1);
INSERT INTO public.star VALUES (7, 'TRAPPIST-1', '', false, 7, 40, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_types_galaxy_type_id_seq', 4, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 26, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_type galaxy_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_types_name_key UNIQUE (name);


--
-- Name: galaxy_type galaxy_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_types_pkey PRIMARY KEY (galaxy_type_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


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
-- Name: galaxy galaxy_galaxy_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_type_id_fkey FOREIGN KEY (galaxy_type_id) REFERENCES public.galaxy_type(galaxy_type_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

