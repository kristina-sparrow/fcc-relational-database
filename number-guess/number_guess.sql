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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    guesses integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(50) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 668, 1);
INSERT INTO public.games VALUES (2, 135, 1);
INSERT INTO public.games VALUES (3, 348, 3);
INSERT INTO public.games VALUES (4, 551, 3);
INSERT INTO public.games VALUES (5, 47, 1);
INSERT INTO public.games VALUES (6, 801, 1);
INSERT INTO public.games VALUES (7, 167, 1);
INSERT INTO public.games VALUES (8, 125, 8);
INSERT INTO public.games VALUES (9, 343, 8);
INSERT INTO public.games VALUES (10, 40, 10);
INSERT INTO public.games VALUES (11, 508, 10);
INSERT INTO public.games VALUES (12, 567, 8);
INSERT INTO public.games VALUES (13, 455, 8);
INSERT INTO public.games VALUES (14, 364, 8);
INSERT INTO public.games VALUES (15, 813, 15);
INSERT INTO public.games VALUES (16, 262, 15);
INSERT INTO public.games VALUES (17, 396, 17);
INSERT INTO public.games VALUES (18, 404, 17);
INSERT INTO public.games VALUES (19, 604, 15);
INSERT INTO public.games VALUES (20, 173, 15);
INSERT INTO public.games VALUES (21, 474, 15);
INSERT INTO public.games VALUES (22, 11, 22);
INSERT INTO public.games VALUES (23, 85, 23);
INSERT INTO public.games VALUES (24, 453, 23);
INSERT INTO public.games VALUES (25, 877, 25);
INSERT INTO public.games VALUES (26, 273, 25);
INSERT INTO public.games VALUES (27, 900, 23);
INSERT INTO public.games VALUES (28, 264, 23);
INSERT INTO public.games VALUES (29, 410, 23);
INSERT INTO public.games VALUES (30, 91, 31);
INSERT INTO public.games VALUES (31, 494, 31);
INSERT INTO public.games VALUES (32, 993, 32);
INSERT INTO public.games VALUES (33, 719, 32);
INSERT INTO public.games VALUES (34, 728, 31);
INSERT INTO public.games VALUES (35, 7, 31);
INSERT INTO public.games VALUES (36, 383, 31);
INSERT INTO public.games VALUES (37, 12, 22);
INSERT INTO public.games VALUES (38, 801, 33);
INSERT INTO public.games VALUES (39, 677, 33);
INSERT INTO public.games VALUES (40, 316, 34);
INSERT INTO public.games VALUES (41, 290, 34);
INSERT INTO public.games VALUES (42, 317, 33);
INSERT INTO public.games VALUES (43, 832, 33);
INSERT INTO public.games VALUES (44, 26, 33);
INSERT INTO public.games VALUES (45, 333, 35);
INSERT INTO public.games VALUES (46, 654, 35);
INSERT INTO public.games VALUES (47, 716, 36);
INSERT INTO public.games VALUES (48, 66, 36);
INSERT INTO public.games VALUES (49, 790, 35);
INSERT INTO public.games VALUES (50, 62, 35);
INSERT INTO public.games VALUES (51, 237, 35);
INSERT INTO public.games VALUES (52, 11, 22);
INSERT INTO public.games VALUES (53, 9, 22);
INSERT INTO public.games VALUES (54, 46, 39);
INSERT INTO public.games VALUES (55, 477, 39);
INSERT INTO public.games VALUES (56, 677, 40);
INSERT INTO public.games VALUES (57, 606, 40);
INSERT INTO public.games VALUES (58, 749, 39);
INSERT INTO public.games VALUES (59, 670, 39);
INSERT INTO public.games VALUES (60, 980, 39);
INSERT INTO public.games VALUES (61, 882, 41);
INSERT INTO public.games VALUES (62, 393, 41);
INSERT INTO public.games VALUES (63, 63, 42);
INSERT INTO public.games VALUES (64, 535, 42);
INSERT INTO public.games VALUES (65, 647, 41);
INSERT INTO public.games VALUES (66, 390, 41);
INSERT INTO public.games VALUES (67, 935, 41);
INSERT INTO public.games VALUES (68, 133, 43);
INSERT INTO public.games VALUES (69, 343, 43);
INSERT INTO public.games VALUES (70, 987, 44);
INSERT INTO public.games VALUES (71, 726, 44);
INSERT INTO public.games VALUES (72, 13, 43);
INSERT INTO public.games VALUES (73, 346, 43);
INSERT INTO public.games VALUES (74, 323, 43);
INSERT INTO public.games VALUES (75, 741, 45);
INSERT INTO public.games VALUES (76, 889, 45);
INSERT INTO public.games VALUES (77, 192, 46);
INSERT INTO public.games VALUES (78, 383, 46);
INSERT INTO public.games VALUES (79, 343, 45);
INSERT INTO public.games VALUES (80, 430, 45);
INSERT INTO public.games VALUES (81, 11, 45);
INSERT INTO public.games VALUES (82, 317, 47);
INSERT INTO public.games VALUES (83, 380, 47);
INSERT INTO public.games VALUES (84, 820, 48);
INSERT INTO public.games VALUES (85, 566, 48);
INSERT INTO public.games VALUES (86, 402, 47);
INSERT INTO public.games VALUES (87, 904, 47);
INSERT INTO public.games VALUES (88, 474, 47);
INSERT INTO public.games VALUES (89, 392, 49);
INSERT INTO public.games VALUES (90, 879, 49);
INSERT INTO public.games VALUES (91, 221, 50);
INSERT INTO public.games VALUES (92, 574, 50);
INSERT INTO public.games VALUES (93, 831, 49);
INSERT INTO public.games VALUES (94, 325, 49);
INSERT INTO public.games VALUES (95, 256, 49);
INSERT INTO public.games VALUES (96, 8, 51);
INSERT INTO public.games VALUES (97, 452, 52);
INSERT INTO public.games VALUES (98, 896, 52);
INSERT INTO public.games VALUES (99, 339, 53);
INSERT INTO public.games VALUES (100, 221, 53);
INSERT INTO public.games VALUES (101, 956, 52);
INSERT INTO public.games VALUES (102, 962, 52);
INSERT INTO public.games VALUES (103, 343, 52);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'user_1678419556302');
INSERT INTO public.users VALUES (3, 'user_1678419556301');
INSERT INTO public.users VALUES (8, 'user_1678419626081');
INSERT INTO public.users VALUES (10, 'user_1678419626080');
INSERT INTO public.users VALUES (15, 'user_1678419635285');
INSERT INTO public.users VALUES (17, 'user_1678419635284');
INSERT INTO public.users VALUES (22, 'kristi');
INSERT INTO public.users VALUES (23, 'user_1678419774224');
INSERT INTO public.users VALUES (25, 'user_1678419774223');
INSERT INTO public.users VALUES (31, 'user_1678419950308');
INSERT INTO public.users VALUES (32, 'user_1678419950307');
INSERT INTO public.users VALUES (33, 'user_1678420153691');
INSERT INTO public.users VALUES (34, 'user_1678420153690');
INSERT INTO public.users VALUES (35, 'user_1678420205781');
INSERT INTO public.users VALUES (36, 'user_1678420205780');
INSERT INTO public.users VALUES (37, 'user_1678420430059');
INSERT INTO public.users VALUES (38, 'user_1678420430058');
INSERT INTO public.users VALUES (39, 'user_1678420446353');
INSERT INTO public.users VALUES (40, 'user_1678420446352');
INSERT INTO public.users VALUES (41, 'user_1678420515034');
INSERT INTO public.users VALUES (42, 'user_1678420515033');
INSERT INTO public.users VALUES (43, 'user_1678420593640');
INSERT INTO public.users VALUES (44, 'user_1678420593639');
INSERT INTO public.users VALUES (45, 'user_1678420842181');
INSERT INTO public.users VALUES (46, 'user_1678420842180');
INSERT INTO public.users VALUES (47, 'user_1678420983567');
INSERT INTO public.users VALUES (48, 'user_1678420983566');
INSERT INTO public.users VALUES (49, 'user_1678421179908');
INSERT INTO public.users VALUES (50, 'user_1678421179907');
INSERT INTO public.users VALUES (51, 'nicki');
INSERT INTO public.users VALUES (52, 'user_1678421517610');
INSERT INTO public.users VALUES (53, 'user_1678421517609');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 103, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 53, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--
