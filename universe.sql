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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    size_in_kpc numeric,
    class text,
    constellation character varying(30),
    distance_in_ly character varying(30),
    has_planets boolean,
    absolute_magnitude integer,
    apparent_magnitude integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_class; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_class (
    galaxy_class_id integer NOT NULL,
    name character varying(10) NOT NULL,
    description character varying(50) NOT NULL,
    examples character varying(30),
    galaxy_id integer
);


ALTER TABLE public.galaxy_class OWNER TO freecodecamp;

--
-- Name: galaxy_classifications_class_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_classifications_class_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_classifications_class_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_classifications_class_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_classifications_class_id_seq OWNED BY public.galaxy_class.galaxy_class_id;


--
-- Name: galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    mass character varying(30) NOT NULL,
    planet_id integer,
    temp_in_kelvin integer
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
    habitable boolean,
    galaxy_id integer,
    mass character varying(30),
    age_in_years character varying(30)
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
    class text,
    distance_in_ly character varying(30),
    constellation character varying(30),
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

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_id_seq'::regclass);


--
-- Name: galaxy_class galaxy_class_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_class ALTER COLUMN galaxy_class_id SET DEFAULT nextval('public.galaxy_classifications_class_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 26.8, 'SB', 'Sagittarius', '26996', true, 9, -20);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 46.56, 'SA(s)b', 'Andromeda', '2.50M', true, -22, 3);
INSERT INTO public.galaxy VALUES (3, 'Condor', 160, 'SB(s)b pec', 'Pavo', '212M', false, -23, 11);
INSERT INTO public.galaxy VALUES (4, 'Whirpool', 23.58, 'SA(s)bc', 'Canes Venatici', '31M', true, NULL, 8);
INSERT INTO public.galaxy VALUES (5, 'Pinwheel', 51.91, 'SAB(rs)cd', 'Ursa Major', '20.9M', false, NULL, 8);
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 18.39, 'S0 pec', 'Centaurus', '12M', false, NULL, 7);


--
-- Data for Name: galaxy_class; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_class VALUES (1, 'E0', 'Round ellipses', 'Messier 89', NULL);
INSERT INTO public.galaxy_class VALUES (2, 'E3', 'Round, slightly flattened ellipses', 'Hercules A', NULL);
INSERT INTO public.galaxy_class VALUES (3, 'E5', 'Round, oval looking ellipses', 'Messier 59', NULL);
INSERT INTO public.galaxy_class VALUES (4, 'E7', 'Stretched oval', NULL, NULL);
INSERT INTO public.galaxy_class VALUES (5, 'S0', 'Flattened, forming spiral', 'Centaurus A', 6);
INSERT INTO public.galaxy_class VALUES (6, 'SAa-m', 'Normal spirals without bars', 'Messier 63', NULL);
INSERT INTO public.galaxy_class VALUES (7, 'SBa-m', 'Barred spirals', 'Milky way', 1);
INSERT INTO public.galaxy_class VALUES (8, 'SABa-m', 'Intermediate spirals', 'Pinwheel', 5);
INSERT INTO public.galaxy_class VALUES (9, '-c', 'compact', NULL, NULL);
INSERT INTO public.galaxy_class VALUES (10, '-d', 'denotes broken arms', NULL, NULL);
INSERT INTO public.galaxy_class VALUES (11, '-m', 'denotes irregular appearance', NULL, NULL);
INSERT INTO public.galaxy_class VALUES (12, '(s)', 'denotes rings', 'Andromeda', 2);
INSERT INTO public.galaxy_class VALUES (13, '(rs)', 'denotes in transition', 'Pinwheel', 5);
INSERT INTO public.galaxy_class VALUES (14, 'lm', 'denotes highly irregular', NULL, NULL);
INSERT INTO public.galaxy_class VALUES (15, 'pec', 'peculiar', 'Condor', 3);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Triton', '2.1390 x 10^22 kg', 8, 38);
INSERT INTO public.moon VALUES (2, 'Nereid', 'unknown', 8, 50);
INSERT INTO public.moon VALUES (3, 'Proteus', '4.4 x 10^19 kg', 8, 51);
INSERT INTO public.moon VALUES (4, 'Naiad', 'unknown', 8, 51);
INSERT INTO public.moon VALUES (5, 'Thalassa', 'unknown', 8, 51);
INSERT INTO public.moon VALUES (6, 'Despina', '2.2 x 10^18 kg', 8, 51);
INSERT INTO public.moon VALUES (7, 'Galatea', '2.12 x 10^18 kg', 8, 51);
INSERT INTO public.moon VALUES (8, 'Larissa', '4.2 x 10^18 kg', 8, 51);
INSERT INTO public.moon VALUES (9, 'Hippocamp', '(1.029-30.87) x 10^15 kg', 8, NULL);
INSERT INTO public.moon VALUES (10, 'Phobos', '1.0659 x 10^16 kg', 4, 233);
INSERT INTO public.moon VALUES (11, 'Deimos', '1.4762 x 10^15 kg', 4, 233);
INSERT INTO public.moon VALUES (12, 'Io', '8.931 938 x 10^22 kg', 5, 110);
INSERT INTO public.moon VALUES (13, 'Europa', '4.799 844 x 10^22 kg', 5, 102);
INSERT INTO public.moon VALUES (14, 'Ganymede', '1.4819 x 10^23 kg', 5, 110);
INSERT INTO public.moon VALUES (15, 'Callisto', '1.075 938 x 10^23 kg', 5, 134);
INSERT INTO public.moon VALUES (16, 'Miranda', '6.4 x 10^19 kg', 7, 60);
INSERT INTO public.moon VALUES (17, 'Ariel', '1.251 x 10^21 kg', 7, 60);
INSERT INTO public.moon VALUES (18, 'Umbriel', '1.275 x 10^21 kg', 7, 75);
INSERT INTO public.moon VALUES (19, 'Titania', '3.4 x 10^21 kg', 7, 70);
INSERT INTO public.moon VALUES (20, 'Oberon', '3.076 x 10^21 kg', 7, 75);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', true, 1, '5.972 168 x 10^24 kg', '4.543B');
INSERT INTO public.planet VALUES (2, 'Mercury', false, 1, '3.3011 x 10^23 kg', '4.503B');
INSERT INTO public.planet VALUES (3, 'Venus', false, 1, '4.8675 x 10^24 kg', '4.503B');
INSERT INTO public.planet VALUES (4, 'Mars', false, 1, '6.4171 x 10^23 kg', '4.603B');
INSERT INTO public.planet VALUES (5, 'Jupiter', false, 1, '1.8982 x 10^27 kg', '4.603B');
INSERT INTO public.planet VALUES (6, 'Saturn', false, 1, '5.6834 x 10^26 kg', '4.503B');
INSERT INTO public.planet VALUES (7, 'Uranus', false, 1, '8.6810 x 10^25 kg', '4.503B');
INSERT INTO public.planet VALUES (8, 'Neptune', false, 1, '1.024 13 x 10^26 kg', '4.503B');
INSERT INTO public.planet VALUES (9, 'TOI-1452 b', false, 1, '4.8 MEarth', 'unknown');
INSERT INTO public.planet VALUES (10, 'WASP-39b', false, 1, '0.28 MJupiter', 'unknown');
INSERT INTO public.planet VALUES (11, '55 Cancri e', false, 1, '7.99 MEarth', 'unknown');
INSERT INTO public.planet VALUES (12, 'TYC 8998-760-1b', false, 1, '14 MJupiter', 'unknown');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Zeta-Ophiuchi', 'O9.5 V', '366', 'Ophiuchus', 1);
INSERT INTO public.star VALUES (2, 'Rigel', 'B8la', '863', 'Orion', 1);
INSERT INTO public.star VALUES (3, 'Altair', 'A7V', '16.73', 'Aquila', 1);
INSERT INTO public.star VALUES (4, 'Procyon', 'F5 IV-V + DQZ', '11.46', 'Canis Minor', 1);
INSERT INTO public.star VALUES (5, 'Sun', 'G2V', '26,660 from Milky Way core', NULL, 1);
INSERT INTO public.star VALUES (6, 'Epsilon Indi', 'K5V + T1 + T6', '12.05', 'Indus', 1);


--
-- Name: galaxy_classifications_class_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_classifications_class_id_seq', 1, false);


--
-- Name: galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_id_seq', 1, false);


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

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: galaxy_class galaxy_classifications_class_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_class
    ADD CONSTRAINT galaxy_classifications_class_id_key UNIQUE (galaxy_class_id);


--
-- Name: galaxy_class galaxy_classifications_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_class
    ADD CONSTRAINT galaxy_classifications_pkey PRIMARY KEY (galaxy_class_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy_class unique_class; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_class
    ADD CONSTRAINT unique_class UNIQUE (galaxy_class_id);


--
-- Name: galaxy unique_galaxy; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy UNIQUE (galaxy_id);


--
-- Name: moon unique_moon; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon UNIQUE (moon_id);


--
-- Name: planet unique_planet; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet UNIQUE (planet_id);


--
-- Name: star unique_star; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star UNIQUE (star_id);


--
-- Name: galaxy_class galaxy_classifications_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_class
    ADD CONSTRAINT galaxy_classifications_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

