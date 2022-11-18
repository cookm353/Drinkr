--
-- PostgreSQL database dump
--

-- Dumped from database version 14.5 (Ubuntu 14.5-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.5 (Ubuntu 14.5-0ubuntu0.22.04.1)

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
-- Name: comments; Type: TABLE; Schema: public; Owner: matt
--

CREATE TABLE public.comments (
    id integer NOT NULL,
    content text NOT NULL,
    ranking integer,
    user_id integer,
    drink_id integer
);


ALTER TABLE public.comments OWNER TO matt;

--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: matt
--

CREATE SEQUENCE public.comments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comments_id_seq OWNER TO matt;

--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: matt
--

ALTER SEQUENCE public.comments_id_seq OWNED BY public.comments.id;


--
-- Name: drink_ingredients; Type: TABLE; Schema: public; Owner: matt
--

CREATE TABLE public.drink_ingredients (
    id integer NOT NULL,
    amount text NOT NULL,
    ingredient_id integer,
    drink_id integer
);


ALTER TABLE public.drink_ingredients OWNER TO matt;

--
-- Name: drink_ingredients_id_seq; Type: SEQUENCE; Schema: public; Owner: matt
--

CREATE SEQUENCE public.drink_ingredients_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.drink_ingredients_id_seq OWNER TO matt;

--
-- Name: drink_ingredients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: matt
--

ALTER SEQUENCE public.drink_ingredients_id_seq OWNED BY public.drink_ingredients.id;


--
-- Name: drinks; Type: TABLE; Schema: public; Owner: matt
--

CREATE TABLE public.drinks (
    id integer NOT NULL,
    name text NOT NULL,
    instructions text NOT NULL,
    is_alcoholic boolean NOT NULL,
    "img_URL" text,
    "video_URL" text,
    glass_id integer,
    user_id integer
);


ALTER TABLE public.drinks OWNER TO matt;

--
-- Name: drinks_id_seq; Type: SEQUENCE; Schema: public; Owner: matt
--

CREATE SEQUENCE public.drinks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.drinks_id_seq OWNER TO matt;

--
-- Name: drinks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: matt
--

ALTER SEQUENCE public.drinks_id_seq OWNED BY public.drinks.id;


--
-- Name: glasses; Type: TABLE; Schema: public; Owner: matt
--

CREATE TABLE public.glasses (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.glasses OWNER TO matt;

--
-- Name: glasses_id_seq; Type: SEQUENCE; Schema: public; Owner: matt
--

CREATE SEQUENCE public.glasses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.glasses_id_seq OWNER TO matt;

--
-- Name: glasses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: matt
--

ALTER SEQUENCE public.glasses_id_seq OWNED BY public.glasses.id;


--
-- Name: ingredients; Type: TABLE; Schema: public; Owner: matt
--

CREATE TABLE public.ingredients (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.ingredients OWNER TO matt;

--
-- Name: ingredients_id_seq; Type: SEQUENCE; Schema: public; Owner: matt
--

CREATE SEQUENCE public.ingredients_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ingredients_id_seq OWNER TO matt;

--
-- Name: ingredients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: matt
--

ALTER SEQUENCE public.ingredients_id_seq OWNED BY public.ingredients.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: matt
--

CREATE TABLE public.users (
    id integer NOT NULL,
    username text NOT NULL,
    password text NOT NULL,
    email text NOT NULL
);


ALTER TABLE public.users OWNER TO matt;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: matt
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO matt;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: matt
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: comments id; Type: DEFAULT; Schema: public; Owner: matt
--

ALTER TABLE ONLY public.comments ALTER COLUMN id SET DEFAULT nextval('public.comments_id_seq'::regclass);


--
-- Name: drink_ingredients id; Type: DEFAULT; Schema: public; Owner: matt
--

ALTER TABLE ONLY public.drink_ingredients ALTER COLUMN id SET DEFAULT nextval('public.drink_ingredients_id_seq'::regclass);


--
-- Name: drinks id; Type: DEFAULT; Schema: public; Owner: matt
--

ALTER TABLE ONLY public.drinks ALTER COLUMN id SET DEFAULT nextval('public.drinks_id_seq'::regclass);


--
-- Name: glasses id; Type: DEFAULT; Schema: public; Owner: matt
--

ALTER TABLE ONLY public.glasses ALTER COLUMN id SET DEFAULT nextval('public.glasses_id_seq'::regclass);


--
-- Name: ingredients id; Type: DEFAULT; Schema: public; Owner: matt
--

ALTER TABLE ONLY public.ingredients ALTER COLUMN id SET DEFAULT nextval('public.ingredients_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: matt
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: matt
--

COPY public.comments (id, content, ranking, user_id, drink_id) FROM stdin;
\.


--
-- Data for Name: drink_ingredients; Type: TABLE DATA; Schema: public; Owner: matt
--

COPY public.drink_ingredients (id, amount, ingredient_id, drink_id) FROM stdin;
\.


--
-- Data for Name: drinks; Type: TABLE DATA; Schema: public; Owner: matt
--

COPY public.drinks (id, name, instructions, is_alcoholic, "img_URL", "video_URL", glass_id, user_id) FROM stdin;
\.


--
-- Data for Name: glasses; Type: TABLE DATA; Schema: public; Owner: matt
--

COPY public.glasses (id, name) FROM stdin;
1	Highball glass
2	Cocktail glass
3	Old-fashioned glass
4	Whiskey Glass
5	Collins glass
6	Pousse cafe glass
7	Champagne flute
8	Whiskey sour glass
9	Cordial glass
10	Brandy snifter
11	White wine glass
12	Nick and Nora Glass
13	Hurricane glass
14	Coffee mug
15	Shot glass
16	Jar
17	Irish coffee cup
18	Punch bowl
19	Pitcher
20	Pint glass
21	Copper Mug
22	Wine Glass
23	Beer mug
24	Margarita/Coupette glass
25	Beer pilsner
26	Beer Glass
27	Parfait glass
28	Mason jar
29	Margarita glass
30	Martini Glass
31	Balloon Glass
32	Coupe Glass
\.


--
-- Data for Name: ingredients; Type: TABLE DATA; Schema: public; Owner: matt
--

COPY public.ingredients (id, name) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: matt
--

COPY public.users (id, username, password, email) FROM stdin;
1	alice	$2b$12$kho5taIt8daNL//JB/yCBeiMfDxEDavQrdeMe9oMhv7VjKdH4s5Ae	alice@test.com
2	bob	$2b$12$Q0udyolaDRDx8celojbWG.IfyCmgZEw/DAISjhCdFG7Vnzf5xh7tK	bob@test.com
\.


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: matt
--

SELECT pg_catalog.setval('public.comments_id_seq', 1, false);


--
-- Name: drink_ingredients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: matt
--

SELECT pg_catalog.setval('public.drink_ingredients_id_seq', 1, false);


--
-- Name: drinks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: matt
--

SELECT pg_catalog.setval('public.drinks_id_seq', 1, false);


--
-- Name: glasses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: matt
--

SELECT pg_catalog.setval('public.glasses_id_seq', 32, true);


--
-- Name: ingredients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: matt
--

SELECT pg_catalog.setval('public.ingredients_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: matt
--

SELECT pg_catalog.setval('public.users_id_seq', 2, true);


--
-- Name: comments comments_pkey; Type: CONSTRAINT; Schema: public; Owner: matt
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: drink_ingredients drink_ingredients_pkey; Type: CONSTRAINT; Schema: public; Owner: matt
--

ALTER TABLE ONLY public.drink_ingredients
    ADD CONSTRAINT drink_ingredients_pkey PRIMARY KEY (id);


--
-- Name: drinks drinks_pkey; Type: CONSTRAINT; Schema: public; Owner: matt
--

ALTER TABLE ONLY public.drinks
    ADD CONSTRAINT drinks_pkey PRIMARY KEY (id);


--
-- Name: glasses glasses_pkey; Type: CONSTRAINT; Schema: public; Owner: matt
--

ALTER TABLE ONLY public.glasses
    ADD CONSTRAINT glasses_pkey PRIMARY KEY (id);


--
-- Name: ingredients ingredients_pkey; Type: CONSTRAINT; Schema: public; Owner: matt
--

ALTER TABLE ONLY public.ingredients
    ADD CONSTRAINT ingredients_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: matt
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: matt
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: comments comments_drink_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: matt
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_drink_id_fkey FOREIGN KEY (drink_id) REFERENCES public.drinks(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: comments comments_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: matt
--

ALTER TABLE ONLY public.comments
    ADD CONSTRAINT comments_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: drink_ingredients drink_ingredients_drink_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: matt
--

ALTER TABLE ONLY public.drink_ingredients
    ADD CONSTRAINT drink_ingredients_drink_id_fkey FOREIGN KEY (drink_id) REFERENCES public.drinks(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: drink_ingredients drink_ingredients_ingredient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: matt
--

ALTER TABLE ONLY public.drink_ingredients
    ADD CONSTRAINT drink_ingredients_ingredient_id_fkey FOREIGN KEY (ingredient_id) REFERENCES public.ingredients(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: drinks drinks_glass_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: matt
--

ALTER TABLE ONLY public.drinks
    ADD CONSTRAINT drinks_glass_id_fkey FOREIGN KEY (glass_id) REFERENCES public.glasses(id) ON UPDATE CASCADE;


--
-- Name: drinks drinks_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: matt
--

ALTER TABLE ONLY public.drinks
    ADD CONSTRAINT drinks_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

