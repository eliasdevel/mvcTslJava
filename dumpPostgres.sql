--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5
-- Dumped by pg_dump version 10.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: addresses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.addresses (
    id integer NOT NULL,
    street character varying(200),
    cep character varying(9),
    hint character varying(200),
    city_id integer NOT NULL
);


ALTER TABLE public.addresses OWNER TO postgres;

--
-- Name: categories_id_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_id_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_sequence OWNER TO postgres;

--
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id integer DEFAULT nextval('public.categories_id_sequence'::regclass) NOT NULL,
    name character varying(45),
    description character varying(200)
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- Name: citys_id_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.citys_id_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.citys_id_sequence OWNER TO postgres;

--
-- Name: citys; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.citys (
    id integer DEFAULT nextval('public.citys_id_sequence'::regclass) NOT NULL,
    name character varying(100),
    state_id character varying(2) NOT NULL
);


ALTER TABLE public.citys OWNER TO postgres;

--
-- Name: entry; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.entry (
    id integer NOT NULL,
    note_number integer,
    description character varying(200),
    user_id integer NOT NULL
);


ALTER TABLE public.entry OWNER TO postgres;

--
-- Name: images; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.images (
    id integer NOT NULL,
    name character varying(45),
    label character varying(200),
    product_id integer NOT NULL
);


ALTER TABLE public.images OWNER TO postgres;

--
-- Name: movimentations_id_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.movimentations_id_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.movimentations_id_sequence OWNER TO postgres;

--
-- Name: movimentations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movimentations (
    id integer DEFAULT nextval('public.movimentations_id_sequence'::regclass) NOT NULL,
    entry_id integer NOT NULL,
    products_id integer NOT NULL,
    quantity character varying(45),
    price_paid numeric
);


ALTER TABLE public.movimentations OWNER TO postgres;

--
-- Name: orders_id_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_sequence OWNER TO postgres;

--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer DEFAULT nextval('public.orders_id_sequence'::regclass) NOT NULL,
    users_id integer NOT NULL,
    products_id integer NOT NULL
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: phones_id_sequence; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.phones_id_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.phones_id_sequence OWNER TO postgres;

--
-- Name: phones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.phones (
    id integer DEFAULT nextval('public.phones_id_sequence'::regclass) NOT NULL,
    user_id integer NOT NULL,
    phone character varying(20)
);


ALTER TABLE public.phones OWNER TO postgres;

--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id integer NOT NULL,
    description character varying(200),
    name character varying(100),
    price numeric,
    category_id integer NOT NULL
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: states; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.states (
    id character varying(2) NOT NULL,
    name character varying(100)
);


ALTER TABLE public.states OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(200),
    password character varying(20),
    email character varying(200),
    type character(1),
    cpf character varying(15),
    address_id integer NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Data for Name: addresses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.addresses (id, street, cep, hint, city_id) FROM stdin;
1	Rua José Schmatz	95900710	house	1
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (id, name, description) FROM stdin;
\.


--
-- Data for Name: citys; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.citys (id, name, state_id) FROM stdin;
1	Lajeado	RS
\.


--
-- Data for Name: entry; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.entry (id, note_number, description, user_id) FROM stdin;
\.


--
-- Data for Name: images; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.images (id, name, label, product_id) FROM stdin;
\.


--
-- Data for Name: movimentations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.movimentations (id, entry_id, products_id, quantity, price_paid) FROM stdin;
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, users_id, products_id) FROM stdin;
\.


--
-- Data for Name: phones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.phones (id, user_id, phone) FROM stdin;
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, description, name, price, category_id) FROM stdin;
\.


--
-- Data for Name: states; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.states (id, name) FROM stdin;
RS	Rio Grande do Sul
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, password, email, type, cpf, address_id) FROM stdin;
1	trago	trago	trago@itrago.com.br	R	000.000.000-00	1
\.


--
-- Name: categories_id_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_sequence', 1, false);


--
-- Name: citys_id_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.citys_id_sequence', 1, true);


--
-- Name: movimentations_id_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.movimentations_id_sequence', 1, false);


--
-- Name: orders_id_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_sequence', 1, false);


--
-- Name: phones_id_sequence; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.phones_id_sequence', 1, false);


--
-- Name: addresses addresses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT addresses_pkey PRIMARY KEY (id);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: citys citys_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.citys
    ADD CONSTRAINT citys_pkey PRIMARY KEY (id);


--
-- Name: entry entry_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entry
    ADD CONSTRAINT entry_pkey PRIMARY KEY (id);


--
-- Name: images images_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.images
    ADD CONSTRAINT images_pkey PRIMARY KEY (id);


--
-- Name: movimentations movimentations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movimentations
    ADD CONSTRAINT movimentations_pkey PRIMARY KEY (id, entry_id, products_id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id, users_id, products_id);


--
-- Name: phones phones_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.phones
    ADD CONSTRAINT phones_pkey PRIMARY KEY (id);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: states states_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.states
    ADD CONSTRAINT states_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: addresses fk_addresses_citys1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.addresses
    ADD CONSTRAINT fk_addresses_citys1 FOREIGN KEY (city_id) REFERENCES public.citys(id);


--
-- Name: citys fk_citys_states1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.citys
    ADD CONSTRAINT fk_citys_states1 FOREIGN KEY (state_id) REFERENCES public.states(id);


--
-- Name: movimentations fk_entry_has_products_entry1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movimentations
    ADD CONSTRAINT fk_entry_has_products_entry1 FOREIGN KEY (entry_id) REFERENCES public.entry(id);


--
-- Name: movimentations fk_entry_has_products_products1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movimentations
    ADD CONSTRAINT fk_entry_has_products_products1 FOREIGN KEY (products_id) REFERENCES public.products(id);


--
-- Name: entry fk_entry_users1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.entry
    ADD CONSTRAINT fk_entry_users1 FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: images fk_images_products1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.images
    ADD CONSTRAINT fk_images_products1 FOREIGN KEY (product_id) REFERENCES public.products(id);


--
-- Name: phones fk_phones_usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.phones
    ADD CONSTRAINT fk_phones_usuario FOREIGN KEY (user_id) REFERENCES public.users(id);


--
-- Name: products fk_products_category1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT fk_products_category1 FOREIGN KEY (category_id) REFERENCES public.categories(id);


--
-- Name: users fk_users_addresses1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT fk_users_addresses1 FOREIGN KEY (address_id) REFERENCES public.addresses(id);


--
-- Name: orders fk_users_has_products_products1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_users_has_products_products1 FOREIGN KEY (products_id) REFERENCES public.products(id);


--
-- Name: orders fk_users_has_products_users1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT fk_users_has_products_users1 FOREIGN KEY (users_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

