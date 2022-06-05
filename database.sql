--
-- PostgreSQL database dump
--

-- Dumped from database version 12.11 (Ubuntu 12.11-0ubuntu0.20.04.1)
-- Dumped by pg_dump version 12.11 (Ubuntu 12.11-0ubuntu0.20.04.1)

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
-- Name: basket_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.basket_products (
    quantity integer DEFAULT 1,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    basket_id integer NOT NULL,
    product_id integer NOT NULL
);


ALTER TABLE public.basket_products OWNER TO postgres;

--
-- Name: baskets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.baskets (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.baskets OWNER TO postgres;

--
-- Name: baskets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.baskets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.baskets_id_seq OWNER TO postgres;

--
-- Name: baskets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.baskets_id_seq OWNED BY public.baskets.id;


--
-- Name: brands; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.brands (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.brands OWNER TO postgres;

--
-- Name: brands_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.brands_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.brands_id_seq OWNER TO postgres;

--
-- Name: brands_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.brands_id_seq OWNED BY public.brands.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: order_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_items (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    price integer NOT NULL,
    quantity integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    order_id integer
);


ALTER TABLE public.order_items OWNER TO postgres;

--
-- Name: order_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_items_id_seq OWNER TO postgres;

--
-- Name: order_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_items_id_seq OWNED BY public.order_items.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    phone character varying(255) NOT NULL,
    address character varying(255) NOT NULL,
    amount integer NOT NULL,
    status integer DEFAULT 0 NOT NULL,
    comment character varying(255),
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    user_id integer
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: product_props; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_props (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    product_id integer
);


ALTER TABLE public.product_props OWNER TO postgres;

--
-- Name: product_props_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_props_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_props_id_seq OWNER TO postgres;

--
-- Name: product_props_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_props_id_seq OWNED BY public.product_props.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    price integer NOT NULL,
    rating integer DEFAULT 0,
    image character varying(255) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    category_id integer,
    brand_id integer
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: ratings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ratings (
    rate integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    product_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.ratings OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying(255),
    password character varying(255),
    role character varying(255) DEFAULT 'USER'::character varying,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: baskets id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.baskets ALTER COLUMN id SET DEFAULT nextval('public.baskets_id_seq'::regclass);


--
-- Name: brands id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brands ALTER COLUMN id SET DEFAULT nextval('public.brands_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: order_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items ALTER COLUMN id SET DEFAULT nextval('public.order_items_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: product_props id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_props ALTER COLUMN id SET DEFAULT nextval('public.product_props_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: basket_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.basket_products (quantity, created_at, updated_at, basket_id, product_id) FROM stdin;
1	2022-05-29 05:45:57.785+03	2022-05-29 05:45:57.785+03	2	32
\.


--
-- Data for Name: baskets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.baskets (id, created_at, updated_at) FROM stdin;
1	2022-05-23 06:16:40.861+03	2022-05-23 06:16:40.861+03
2	2022-05-29 05:44:42.409+03	2022-05-29 05:44:42.409+03
\.


--
-- Data for Name: brands; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.brands (id, name, created_at, updated_at) FROM stdin;
8	Adidas	2022-05-26 16:06:12.881+03	2022-05-26 16:06:12.881+03
9	Nike	2022-05-26 16:06:16.545+03	2022-05-26 16:06:16.545+03
10	Reebok	2022-05-26 16:06:28.715+03	2022-05-26 16:06:28.715+03
11	Asics	2022-05-26 16:06:47.431+03	2022-05-26 16:06:47.431+03
12	Puma	2022-05-26 16:07:36.968+03	2022-05-26 16:07:36.968+03
13	Saucony	2022-05-26 16:07:56.433+03	2022-05-29 05:02:10.178+03
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (id, name, created_at, updated_at) FROM stdin;
5	Мужские	2022-05-26 15:44:09.765+03	2022-05-26 15:44:09.765+03
7	Женские	2022-05-26 15:44:27.666+03	2022-05-26 16:03:21.737+03
\.


--
-- Data for Name: order_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_items (id, name, price, quantity, created_at, updated_at, order_id) FROM stdin;
13	Cali Dream Leather W WB	340	1	2022-05-29 06:08:40.697+03	2022-05-29 06:08:40.697+03	9
14	Air Max 270 React W Grey	299	4	2022-05-30 02:13:55.91+03	2022-05-30 02:13:55.91+03	10
15	Classic Nylon Black	275	1	2022-05-30 02:13:55.939+03	2022-05-30 02:13:55.939+03	10
16	Classic Leather Legacy W Pink	215	1	2022-05-30 02:13:55.961+03	2022-05-30 02:13:55.961+03	10
17	Shadow 6000 Navy	385	1	2022-05-30 02:13:55.973+03	2022-05-30 02:13:55.973+03	10
18	Air Max 270 React W Grey	299	1	2022-05-30 02:15:48.044+03	2022-05-30 02:15:48.044+03	11
19	Classic Leather W WB	285	1	2022-05-30 02:15:48.445+03	2022-05-30 02:15:48.445+03	11
20	Air Max 95 Essential Black	455	1	2022-05-30 02:17:23.962+03	2022-05-30 02:17:23.962+03	12
21	Classic Leather Legacy W Pink	215	1	2022-05-30 02:17:23.98+03	2022-05-30 02:17:23.98+03	12
22	Air Max 95 Essential Black	455	1	2022-05-30 17:25:45.101+03	2022-05-30 17:25:45.101+03	13
23	Air Max 95 Essential Black	455	1	2022-05-30 17:30:49.518+03	2022-05-30 17:30:49.518+03	14
24	Air Force 1 ’07 W White/Black	350	1	2022-05-30 17:37:08.781+03	2022-05-30 17:37:08.781+03	15
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, name, email, phone, address, amount, status, comment, created_at, updated_at, user_id) FROM stdin;
9	вапвр варрв	adfgsd@dsf.hfg	+375 (00) 000-00-00	fgb	340	0	gbf	2022-05-29 06:08:40.589+03	2022-05-29 06:08:40.589+03	3
10	Иван Иванов	ivan@gmail.com	+375 (33) 333-33-33	г.Брест, ул.Ленина, 0	2071	0	39	2022-05-30 02:13:55.8+03	2022-05-30 02:13:55.8+03	1
11	Михаил Михайлов	Michail@gmail.com	+375 (29) 299-29-29	г.Минск, ул.Бобровая, 0	584	0	41	2022-05-30 02:15:47.83+03	2022-05-30 02:15:47.83+03	1
12	Екатерина Петрова	Katya@gmail.com	+375 (44) 444-44-44	г.Кобрин, ул.Кобринская, 0	670	0	37	2022-05-30 02:17:23.91+03	2022-05-30 02:17:23.91+03	1
13	Иван Петров	petrov@mail.ru	+375 (00) 000-00-00	г. Брест, ул. Московская, д. 0	455	0	41	2022-05-30 17:25:44.998+03	2022-05-30 17:25:44.998+03	8
14	Петр Петров	Petrov@mail.ru	+375 (33) 333-33-22	г. Брест, ул. Московская, д.267	455	0	43	2022-05-30 17:30:49.415+03	2022-05-30 17:30:49.415+03	7
15	Петр Петров	Petrov@mail.ru	+375 (33) 333-33-22	г. Брест, ул. Московская, д. 267	350	0	43	2022-05-30 17:37:08.68+03	2022-05-30 17:37:08.68+03	7
\.


--
-- Data for Name: product_props; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_props (id, name, value, created_at, updated_at, product_id) FROM stdin;
6	Материал:	Натуральная кожа, текстиль, резина	2022-05-29 02:35:42.617+03	2022-05-29 02:35:42.617+03	14
7	Цвет:	Белый	2022-05-29 02:35:42.67+03	2022-05-29 02:35:42.67+03	14
8	Страна производства:	Китай	2022-05-29 02:35:42.68+03	2022-05-29 02:35:42.68+03	14
9	Сезон:	Весна 2022	2022-05-29 02:35:42.703+03	2022-05-29 02:35:42.703+03	14
10	Материал:	Натуральная замша, текстиль, резина	2022-05-29 02:46:30.034+03	2022-05-29 02:46:30.034+03	15
11	Цвет:	Черный	2022-05-29 02:46:30.262+03	2022-05-29 02:46:30.262+03	15
12	Страна производства:	Вьетнам	2022-05-29 02:46:30.558+03	2022-05-29 02:46:30.558+03	15
13	Сезон: 	Весна 2022	2022-05-29 02:46:31.146+03	2022-05-29 02:46:31.146+03	15
14	Материал:	Натуральная кожа, текстиль, резина	2022-05-29 02:48:08.85+03	2022-05-29 02:48:08.85+03	16
15	Цвет:	Белый	2022-05-29 02:48:08.893+03	2022-05-29 02:48:08.893+03	16
16	Страна производства:	Китай	2022-05-29 02:48:08.906+03	2022-05-29 02:48:08.906+03	16
17	Сезон:	Весна 2022	2022-05-29 02:48:08.927+03	2022-05-29 02:48:08.927+03	16
18	Материал:	Натуральная замша, текстиль, резина	2022-05-29 02:50:57.821+03	2022-05-29 02:50:57.821+03	17
19	Цвет:	Розовый	2022-05-29 02:50:57.843+03	2022-05-29 02:50:57.843+03	17
20	Страна производства: 	Вьетнам	2022-05-29 02:50:57.864+03	2022-05-29 02:50:57.864+03	17
21	Сезон:	Весна 2021	2022-05-29 02:50:57.888+03	2022-05-29 02:50:57.888+03	17
22	Материал:	Текстиль, резина	2022-05-29 02:53:46.253+03	2022-05-29 02:53:46.253+03	18
23	Цвет:	Сиреневый	2022-05-29 02:53:46.276+03	2022-05-29 02:53:46.276+03	18
24	Страна производства: 	Вьетнам	2022-05-29 02:53:46.298+03	2022-05-29 02:53:46.298+03	18
25	Сезон:	Весна 2021	2022-05-29 02:53:46.319+03	2022-05-29 02:53:46.319+03	18
26	Материалы: 	Натуральная замша, текстиль, резина	2022-05-29 02:55:55.544+03	2022-05-29 02:55:55.544+03	19
27	Цвет:	Светло-серый	2022-05-29 02:55:55.556+03	2022-05-29 02:55:55.556+03	19
28	Страна производства: 	Вьетнам	2022-05-29 02:55:55.567+03	2022-05-29 02:55:55.567+03	19
29	Сезон:	Весна 2022	2022-05-29 02:55:55.578+03	2022-05-29 02:55:55.578+03	19
30	Материалы: 	Искусственная кожа, текстиль, резина	2022-05-29 02:57:12.715+03	2022-05-29 02:57:12.715+03	20
31	Цвет: 	Зеленый, белый	2022-05-29 02:57:12.726+03	2022-05-29 02:57:12.726+03	20
32	Страна производства: 	Вьетнам	2022-05-29 02:57:12.737+03	2022-05-29 02:57:12.737+03	20
33	Сезон: 	Осень 2021	2022-05-29 02:57:12.748+03	2022-05-29 02:57:12.748+03	20
34	Материалы: 	Натуральная замша, текстиль, резина	2022-05-29 02:59:04.096+03	2022-05-29 02:59:04.096+03	21
35	Цвет:	Бежевый, белый	2022-05-29 02:59:04.117+03	2022-05-29 02:59:04.117+03	21
36	Страна производства: 	Вьетнам	2022-05-29 02:59:04.128+03	2022-05-29 02:59:04.128+03	21
37	Сезон:	Весна 2022	2022-05-29 02:59:04.139+03	2022-05-29 02:59:04.139+03	21
38	Материалы: 	Натуральная замша, текстиль, резина	2022-05-29 03:00:39.455+03	2022-05-29 03:00:39.455+03	22
39	Цвет:	Бежевый	2022-05-29 03:00:39.477+03	2022-05-29 03:00:39.477+03	22
40	Страна производства: 	Вьетнам	2022-05-29 03:00:39.487+03	2022-05-29 03:00:39.487+03	22
41	Сезон:	Весна 2021	2022-05-29 03:00:39.498+03	2022-05-29 03:00:39.498+03	22
42	Материал:	Натуральная кожа, текстиль, резина	2022-05-29 05:04:31.712+03	2022-05-29 05:04:31.712+03	23
43	Цвет:	Белый, черный	2022-05-29 05:04:31.724+03	2022-05-29 05:04:31.724+03	23
44	Страна производства:	Китай	2022-05-29 05:04:31.734+03	2022-05-29 05:04:31.734+03	23
45	Сезон:	Весна 2022	2022-05-29 05:04:31.745+03	2022-05-29 05:04:31.745+03	23
46	Материал:	Текстиль, резина	2022-05-29 05:06:07.503+03	2022-05-29 05:06:07.503+03	24
47	Цвет:	Серый, белый	2022-05-29 05:06:07.525+03	2022-05-29 05:06:07.525+03	24
48	Страна производства: 	Вьетнам	2022-05-29 05:06:07.547+03	2022-05-29 05:06:07.547+03	24
49	Сезон:	Весна 2020	2022-05-29 05:06:07.57+03	2022-05-29 05:06:07.57+03	24
50	Материалы: 	Натуральная замша, текстиль, резина	2022-05-29 05:08:13.476+03	2022-05-29 05:08:13.476+03	25
51	Цвет: 	Черный	2022-05-29 05:08:13.499+03	2022-05-29 05:08:13.499+03	25
52	Страна производства: 	Китай	2022-05-29 05:08:13.52+03	2022-05-29 05:08:13.52+03	25
53	Сезон: 	Осень 2021	2022-05-29 05:08:13.542+03	2022-05-29 05:08:13.542+03	25
54	Материалы: 	Натуральная кожа, текстиль, резина	2022-05-29 05:09:32.568+03	2022-05-29 05:09:32.568+03	26
55	Цвет: 	Черный	2022-05-29 05:09:32.579+03	2022-05-29 05:09:32.579+03	26
56	Страна производства: 	Индонезия	2022-05-29 05:09:32.59+03	2022-05-29 05:09:32.59+03	26
57	Сезон: 	Осень 2021	2022-05-29 05:09:32.601+03	2022-05-29 05:09:32.601+03	26
58	Материалы: 	Натуральная кожа, текстиль, резина	2022-05-29 05:17:22.642+03	2022-05-29 05:17:22.642+03	27
59	Цвет: 	Бежевый	2022-05-29 05:17:22.662+03	2022-05-29 05:17:22.662+03	27
60	Страна производства: 	Вьетнам	2022-05-29 05:17:22.673+03	2022-05-29 05:17:22.673+03	27
61	Сезон: 	Весна 2022	2022-05-29 05:17:22.684+03	2022-05-29 05:17:22.684+03	27
62	Материалы:	Натуральная кожа, текстиль, резина	2022-05-29 05:19:29.34+03	2022-05-29 05:19:29.34+03	28
63	Цвет:	Белый	2022-05-29 05:19:29.36+03	2022-05-29 05:19:29.36+03	28
64	Страна производства:	Вьетнам	2022-05-29 05:19:29.371+03	2022-05-29 05:19:29.371+03	28
65	Сезон:	Весна 2022	2022-05-29 05:19:29.382+03	2022-05-29 05:19:29.382+03	28
66	Материалы:	Натуральная замша, текстиль, резина	2022-05-29 05:20:43.935+03	2022-05-29 05:20:43.935+03	29
67	Цвет:	Черный, серый	2022-05-29 05:20:43.951+03	2022-05-29 05:20:43.951+03	29
68	Страна производства: 	Камбоджа	2022-05-29 05:20:43.962+03	2022-05-29 05:20:43.962+03	29
69	Сезон:	Весна 2022	2022-05-29 05:20:43.973+03	2022-05-29 05:20:43.973+03	29
70	Материалы:	Синтетическая кожа, текстиль, резина	2022-05-29 05:22:37.694+03	2022-05-29 05:22:37.694+03	30
71	Цвет:	Белый	2022-05-29 05:22:37.916+03	2022-05-29 05:22:37.916+03	30
72	Страна производства:	Китай	2022-05-29 05:22:38.065+03	2022-05-29 05:22:38.065+03	30
73	Сезон:	Весна 2022	2022-05-29 05:22:38.085+03	2022-05-29 05:22:38.085+03	30
74	Материалы:	Натуральная кожа, текстиль, резина	2022-05-29 05:23:48.404+03	2022-05-29 05:23:48.404+03	31
75	Цвет:	Белый, бежевый	2022-05-29 05:23:48.416+03	2022-05-29 05:23:48.416+03	31
76	Страна производства:	Индонезия	2022-05-29 05:23:48.479+03	2022-05-29 05:23:48.479+03	31
77	Сезон:	Весна 2022	2022-05-29 05:23:48.503+03	2022-05-29 05:23:48.503+03	31
78	Материалы:	Натуральная замша, текстиль, резина	2022-05-29 05:25:20.573+03	2022-05-29 05:25:20.573+03	32
79	Цвет:	Черный, белый	2022-05-29 05:25:20.583+03	2022-05-29 05:25:20.583+03	32
80	Страна производства:	Вьетнам	2022-05-29 05:25:20.594+03	2022-05-29 05:25:20.594+03	32
81	Сезон: 	Весна 2022	2022-05-29 05:25:20.605+03	2022-05-29 05:25:20.605+03	32
82	Материалы:	Натуральная кожа, текстиль, резина	2022-05-29 05:26:33.841+03	2022-05-29 05:26:33.841+03	33
83	Цвет:	Белый	2022-05-29 05:26:34.429+03	2022-05-29 05:26:34.429+03	33
84	Страна производства:	Вьетнам	2022-05-29 05:26:34.444+03	2022-05-29 05:26:34.444+03	33
85	Сезон:	Осень 2021	2022-05-29 05:26:34.455+03	2022-05-29 05:26:34.455+03	33
86	Материалы:	Текстиль, резина	2022-05-29 05:27:45.499+03	2022-05-29 05:27:45.499+03	34
87	Цвет:	Серый	2022-05-29 05:27:45.52+03	2022-05-29 05:27:45.52+03	34
88	Страна производства:	Вьетнам	2022-05-29 05:27:45.542+03	2022-05-29 05:27:45.542+03	34
89	Сезон:	Весна 2021	2022-05-29 05:27:45.564+03	2022-05-29 05:27:45.564+03	34
90	Материалы:	Натуральная кожа, текстиль, резина	2022-05-29 05:29:06.505+03	2022-05-29 05:29:06.505+03	35
91	Цвет:	Белый	2022-05-29 05:29:06.516+03	2022-05-29 05:29:06.516+03	35
92	Страна производства:	Вьетнам	2022-05-29 05:29:06.527+03	2022-05-29 05:29:06.527+03	35
93	Сезон:	Осень 2021	2022-05-29 05:29:06.538+03	2022-05-29 05:29:06.538+03	35
94	Материалы:	Натуральная замша, текстиль, резина	2022-05-29 05:30:12.26+03	2022-05-29 05:30:12.26+03	36
95	Цвет:	Персиковый, белый	2022-05-29 05:30:12.274+03	2022-05-29 05:30:12.274+03	36
96	Страна производства:	Вьетнам	2022-05-29 05:30:12.293+03	2022-05-29 05:30:12.293+03	36
97	Сезон:	Весна 2021	2022-05-29 05:30:12.955+03	2022-05-29 05:30:12.955+03	36
98	Материалы:	Натуральная кожа, текстиль, резина	2022-05-29 05:31:38.634+03	2022-05-29 05:31:38.634+03	37
99	Цвет:	Фиолетовый	2022-05-29 05:31:38.645+03	2022-05-29 05:31:38.645+03	37
100	Страна производства:	Вьетнам	2022-05-29 05:31:38.656+03	2022-05-29 05:31:38.656+03	37
101	Сезон:	Весна 2018	2022-05-29 05:31:38.667+03	2022-05-29 05:31:38.667+03	37
102	Материалы: 	Натуральная замша, текстиль, резина	2022-05-29 05:33:13.023+03	2022-05-29 05:33:13.023+03	38
103	Цвет:	Сине-зеленый	2022-05-29 05:33:13.056+03	2022-05-29 05:33:13.056+03	38
104	Страна производства:	Вьетнам	2022-05-29 05:33:13.09+03	2022-05-29 05:33:13.09+03	38
105	Сезон:	Осень 2021	2022-05-29 05:33:13.124+03	2022-05-29 05:33:13.124+03	38
106	Материалы:	Натуральная замша, текстиль, резина	2022-05-29 05:34:52.536+03	2022-05-29 05:34:52.536+03	39
107	Цвет:	Серый	2022-05-29 05:34:53.793+03	2022-05-29 05:34:53.793+03	39
108	Страна производства:	Вьетнам	2022-05-29 05:34:53.879+03	2022-05-29 05:34:53.879+03	39
109	Сезон:	Осень 2021	2022-05-29 05:34:53.899+03	2022-05-29 05:34:53.899+03	39
110	Материалы:	Натуральная замша, текстиль, резина	2022-05-29 05:36:00.408+03	2022-05-29 05:36:00.408+03	40
111	Цвет:	Серый	2022-05-29 05:36:00.568+03	2022-05-29 05:36:00.568+03	40
112	Страна производства:	Вьетнам	2022-05-29 05:36:00.764+03	2022-05-29 05:36:00.764+03	40
113	Сезон:	Осень 2021	2022-05-29 05:36:00.789+03	2022-05-29 05:36:00.789+03	40
114	Материалы:	Натуральная замша, текстиль, резина	2022-05-29 05:37:10.7+03	2022-05-29 05:37:10.7+03	41
115	Цвет:	Светло-серый	2022-05-29 05:37:10.722+03	2022-05-29 05:37:10.722+03	41
116	Страна производства:	Вьетнам	2022-05-29 05:37:10.744+03	2022-05-29 05:37:10.744+03	41
117	Сезон: 	Весна 2021	2022-05-29 05:37:10.767+03	2022-05-29 05:37:10.767+03	41
118	Материалы:	Натуральная замша, текстиль, резина	2022-05-29 05:38:31.214+03	2022-05-29 05:38:31.214+03	42
119	Цвет:	Светло-серый, черный	2022-05-29 05:38:31.226+03	2022-05-29 05:38:31.226+03	42
120	Страна производства:	Вьетнам	2022-05-29 05:38:31.236+03	2022-05-29 05:38:31.236+03	42
121	Сезон:	Весна 2021	2022-05-29 05:38:31.248+03	2022-05-29 05:38:31.248+03	42
122	Материалы:	Натуральная замша, текстиль, резина	2022-05-29 05:39:33.639+03	2022-05-29 05:39:33.639+03	43
123	Цвет:	Синий, серый	2022-05-29 05:39:33.66+03	2022-05-29 05:39:33.66+03	43
124	Страна производства:	Вьетнам	2022-05-29 05:39:33.682+03	2022-05-29 05:39:33.682+03	43
125	Сезон:	Весна 2021	2022-05-29 05:39:33.705+03	2022-05-29 05:39:33.705+03	43
126	Материалы:	Натуральная кожа, текстиль, резина	2022-05-30 17:20:03.35+03	2022-05-30 17:20:03.35+03	44
127	Цвет:	Белый	2022-05-30 17:20:03.403+03	2022-05-30 17:20:03.403+03	44
128	Страна производства: 	Вьетнам	2022-05-30 17:20:03.424+03	2022-05-30 17:20:03.424+03	44
129	Сезон:	Осень 2020	2022-05-30 17:20:03.446+03	2022-05-30 17:20:03.446+03	44
\.


--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, name, price, rating, image, created_at, updated_at, category_id, brand_id) FROM stdin;
14	Originals Forum Low White	345	0	843791fa-ec5b-439d-8b93-adc1cf359dab.jpeg	2022-05-29 02:35:42.466+03	2022-05-29 02:35:42.466+03	5	8
15	Originals Ozelia	350	0	5dd0a693-8b3b-47a6-8b78-43390748966d.jpeg	2022-05-29 02:46:29.988+03	2022-05-29 02:46:29.988+03	5	8
16	Originals Niteball OW	455	0	a4ac5249-3da6-49e5-a265-e8fd91062d4d.jpeg	2022-05-29 02:48:08.74+03	2022-05-29 02:48:08.74+03	5	8
17	Originals ZX 500 W Clear Pink	305	0	ecd5b56e-e2a7-48ac-bc15-9e5c09d90eaa.jpeg	2022-05-29 02:50:57.796+03	2022-05-29 02:50:57.796+03	7	8
18	Originals Ozweego W Dust Purple	299	0	6d4f63c1-7109-40db-b965-a98e98166b1c.jpeg	2022-05-29 02:53:46.225+03	2022-05-29 02:53:46.225+03	7	8
19	Gel-Lyte III RE Grey	299	0	f2e92b8c-b292-4fe3-8a3a-8fe1a1065c02.jpeg	2022-05-29 02:55:55.439+03	2022-05-29 02:55:55.439+03	5	11
20	Lyte Classic Olive	215	0	3e86c7d4-6d95-40c6-98b9-0b7ba36b26da.jpeg	2022-05-29 02:57:12.607+03	2022-05-29 02:57:12.607+03	5	11
21	Gel-Lyte III OG Wood Crepe	215	0	0832239c-a994-4171-ae66-a65a9e701ad6.jpeg	2022-05-29 02:59:03.99+03	2022-05-29 02:59:03.99+03	7	11
22	Gel-Lyte III OG Camel Beige	275	0	099f9fed-bb09-458a-b582-0339afa40257.jpeg	2022-05-29 03:00:39.337+03	2022-05-29 03:00:39.337+03	7	11
24	Air Max 270 React W Grey	299	0	72756089-9748-4110-8afc-7f22b5766714.jpeg	2022-05-29 05:06:07.485+03	2022-05-29 05:06:39.802+03	7	9
23	Air Force 1 ’07 W White/Black	350	0	50640a27-3091-4734-9f73-479a344154a1.jpeg	2022-05-29 05:04:31.672+03	2022-05-29 05:06:43.424+03	7	9
25	SB Zoom Janoski RM BG	225	0	67004459-6523-4bdb-b80d-90d79203f47f.jpeg	2022-05-29 05:08:13.432+03	2022-05-29 05:08:13.432+03	5	9
26	Air Max 95 Essential Black	455	0	9ecc4120-ef1e-402c-88c7-0fdd1042fbb3.jpeg	2022-05-29 05:09:32.456+03	2022-05-29 05:09:32.456+03	5	9
27	RS-X³ Puzzle W Beige	399	0	21b8891b-2f57-49ad-943e-13b17798d6bd.jpeg	2022-05-29 05:17:22.602+03	2022-05-29 05:17:22.602+03	5	12
28	RS-Z Leather White	415	0	0b7ca198-701f-450e-8333-397badac493f.jpeg	2022-05-29 05:19:29.303+03	2022-05-29 05:19:29.303+03	5	12
29	Mirage Sport Remix BG	390	0	81b66c01-d701-496b-9b69-ad7594c2089f.jpeg	2022-05-29 05:20:43.861+03	2022-05-29 05:20:43.861+03	5	12
30	X-Ray Speed W White	275	0	1b7bc212-3ce0-4da5-b139-6fcd72512427.jpeg	2022-05-29 05:22:37.526+03	2022-05-29 05:22:37.526+03	7	12
31	Cali Dream Leather W WB	340	0	8b6c254d-95d4-4b3e-b584-9c866117ade6.jpeg	2022-05-29 05:23:48.269+03	2022-05-29 05:23:48.269+03	7	12
32	Classic Nylon Black	275	0	98af9e54-0c33-41bb-8e70-43f3f9d8c368.jpeg	2022-05-29 05:25:20.467+03	2022-05-29 05:25:20.467+03	5	10
33	Club C Revenge GR	235	0	0daf8e60-fc64-4c6f-94a8-b15da00ab326.jpeg	2022-05-29 05:26:33.546+03	2022-05-29 05:26:33.546+03	5	10
34	InstaPump Fury OG TR	399	0	34107f4a-3872-40dd-a1a5-6acf6cc77fb4.jpeg	2022-05-29 05:27:45.459+03	2022-05-29 05:27:45.459+03	5	10
35	Classic Leather W WB	285	0	679dd363-2d1a-4873-9cd0-7e4a41ec8b8f.jpeg	2022-05-29 05:29:06.431+03	2022-05-29 05:29:06.431+03	7	10
36	Classic Leather Legacy W Pink	215	0	1227b6d5-7d75-4a97-8871-d6e6c035431b.jpeg	2022-05-29 05:30:12.131+03	2022-05-29 05:30:12.131+03	7	10
37	Club C 85 S Shine Navy	99	0	0d4379d4-81b6-46b5-ad42-b7aa1b29e5b7.jpeg	2022-05-29 05:31:38.525+03	2022-05-29 05:31:38.525+03	7	10
38	Shadow 6000	385	0	ffe1b7d3-d965-4ef8-8ed7-938ef418a565.jpeg	2022-05-29 05:33:13+03	2022-05-29 05:33:13+03	5	13
39	Shadow 5000 Triple Grey	299	0	71f99edc-0821-498f-a826-8c658e47c7e1.jpeg	2022-05-29 05:34:51.802+03	2022-05-29 05:34:51.802+03	5	13
40	Shadow Original Grey	345	0	1ac41433-b85e-4931-aede-118707681c97.jpeg	2022-05-29 05:36:00.206+03	2022-05-29 05:36:00.206+03	5	13
41	Jazz Original Vintage Light Grey	285	0	ac1c0a3e-c59b-462d-9b42-d77609917574.jpeg	2022-05-29 05:37:10.66+03	2022-05-29 05:37:10.66+03	7	13
42	Shadow 5000 Light Grey	345	0	d63e82ac-7fc1-40fd-a467-c04977824e0a.jpeg	2022-05-29 05:38:31.064+03	2022-05-29 05:38:31.064+03	7	13
43	Shadow 6000 Navy	385	0	4311fce8-234c-47d6-aeb6-e4f6baa07db9.jpeg	2022-05-29 05:39:33.587+03	2022-05-29 05:39:33.587+03	7	13
44	Originals Rivalry Low W WB	299	0	c6a21ffe-6bfe-4fca-ab58-fe58328a4fa4.jpeg	2022-05-30 17:20:03.288+03	2022-05-30 17:20:03.288+03	7	8
\.


--
-- Data for Name: ratings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ratings (rate, created_at, updated_at, product_id, user_id) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, email, password, role, created_at, updated_at) FROM stdin;
1	User@gmail.com	$2b$05$S/rGcgGpKoZnNn2vnKgmBeKLHruBnJ.Qxd.fHAm14u9Njucg5UXw6	ADMIN	2022-05-23 06:17:05.051+03	2022-05-23 06:17:05.051+03
3	qwerty@gmail.com	$2b$05$RwzkbAiwOUhwcR6Dt8p5G.GTmO/KSR8wTJvWBShijhRngrPXSbdlq	USER	2022-05-26 01:20:04.063+03	2022-05-26 01:20:04.063+03
6	User@gmai.com	$2b$05$hR3iYjTZZSdd.97XDEeUnOqnJSyZWzNnfwIFiN7ePbtBDJysF380K	USER	2022-05-30 02:20:22.523+03	2022-05-30 02:20:22.523+03
7	Petrov@mail.ru	$2b$05$KbfrQcIwzoh7b32dk0Szwe3X/1MXoY1CN2zDEjwvbWaKxfW0KdP76	USER	2022-05-30 16:25:49.429+03	2022-05-30 16:25:49.429+03
8	Admin@gmail.com	$2b$05$9fZJISxdVvExROBVzDAymeUUTmd9ri2EjCoBbrGCoOxxVAKmlUvM6	ADMIN	2022-05-30 16:40:39.955+03	2022-05-30 16:40:39.955+03
9	Petrov1@mail.ru	$2b$05$U5He3K7b3UBL5UWzI9gosu6Z8CzZ2YMEyFzaiNDWFiU4Ic1zkFHHi	USER	2022-05-30 16:58:15.317+03	2022-05-30 16:58:15.317+03
\.


--
-- Name: baskets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.baskets_id_seq', 2, true);


--
-- Name: brands_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.brands_id_seq', 16, true);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 9, true);


--
-- Name: order_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_items_id_seq', 24, true);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 15, true);


--
-- Name: product_props_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_props_id_seq', 129, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 44, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 9, true);


--
-- Name: basket_products basket_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basket_products
    ADD CONSTRAINT basket_products_pkey PRIMARY KEY (basket_id, product_id);


--
-- Name: baskets baskets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.baskets
    ADD CONSTRAINT baskets_pkey PRIMARY KEY (id);


--
-- Name: brands brands_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brands
    ADD CONSTRAINT brands_name_key UNIQUE (name);


--
-- Name: brands brands_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brands
    ADD CONSTRAINT brands_pkey PRIMARY KEY (id);


--
-- Name: categories categories_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_name_key UNIQUE (name);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: order_items order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: product_props product_props_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_props
    ADD CONSTRAINT product_props_pkey PRIMARY KEY (id);


--
-- Name: products products_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_name_key UNIQUE (name);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: ratings ratings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_pkey PRIMARY KEY (product_id, user_id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: basket_products basket_products_basket_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basket_products
    ADD CONSTRAINT basket_products_basket_id_fkey FOREIGN KEY (basket_id) REFERENCES public.baskets(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: basket_products basket_products_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basket_products
    ADD CONSTRAINT basket_products_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: order_items order_items_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: orders orders_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: product_props product_props_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_props
    ADD CONSTRAINT product_props_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: products products_brand_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_brand_id_fkey FOREIGN KEY (brand_id) REFERENCES public.brands(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: products products_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: ratings ratings_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ratings ratings_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

