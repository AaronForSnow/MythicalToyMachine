--
-- PostgreSQL database dump
--

-- Dumped from database version 15.4
-- Dumped by pg_dump version 16.1 (Debian 16.1-1.pgdg120+1)

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

--
-- Name: toy; Type: SCHEMA; Schema: -; Owner: mythicalman
--

CREATE SCHEMA toy;


ALTER SCHEMA toy OWNER TO mythicalman;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: accessory; Type: TABLE; Schema: toy; Owner: mythicalman
--

CREATE TABLE toy.accessory (
    id integer NOT NULL,
    accessoryname character varying(40),
    price money,
    discription character varying(40),
    bodypart_id integer
);


ALTER TABLE toy.accessory OWNER TO mythicalman;

--
-- Name: accessory_id_seq; Type: SEQUENCE; Schema: toy; Owner: mythicalman
--

CREATE SEQUENCE toy.accessory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE toy.accessory_id_seq OWNER TO mythicalman;

--
-- Name: accessory_id_seq; Type: SEQUENCE OWNED BY; Schema: toy; Owner: mythicalman
--

ALTER SEQUENCE toy.accessory_id_seq OWNED BY toy.accessory.id;


--
-- Name: bodypart; Type: TABLE; Schema: toy; Owner: mythicalman
--

CREATE TABLE toy.bodypart (
    id integer NOT NULL,
    partname character varying(40)
);


ALTER TABLE toy.bodypart OWNER TO mythicalman;

--
-- Name: bodypart_id_seq; Type: SEQUENCE; Schema: toy; Owner: mythicalman
--

CREATE SEQUENCE toy.bodypart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE toy.bodypart_id_seq OWNER TO mythicalman;

--
-- Name: bodypart_id_seq; Type: SEQUENCE OWNED BY; Schema: toy; Owner: mythicalman
--

ALTER SEQUENCE toy.bodypart_id_seq OWNED BY toy.bodypart.id;


--
-- Name: cart_item; Type: TABLE; Schema: toy; Owner: mythicalman
--

CREATE TABLE toy.cart_item (
    id integer NOT NULL,
    customer_id integer NOT NULL,
    kit_id integer NOT NULL,
    quantity integer NOT NULL,
    save_for_later boolean
);


ALTER TABLE toy.cart_item OWNER TO mythicalman;

--
-- Name: cart_item_id_seq; Type: SEQUENCE; Schema: toy; Owner: mythicalman
--

CREATE SEQUENCE toy.cart_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE toy.cart_item_id_seq OWNER TO mythicalman;

--
-- Name: cart_item_id_seq; Type: SEQUENCE OWNED BY; Schema: toy; Owner: mythicalman
--

ALTER SEQUENCE toy.cart_item_id_seq OWNED BY toy.cart_item.id;


--
-- Name: creature; Type: TABLE; Schema: toy; Owner: mythicalman
--

CREATE TABLE toy.creature (
    id integer NOT NULL,
    creaturename character varying(40),
    suggestedprice money,
    discription character varying(200)
);


ALTER TABLE toy.creature OWNER TO mythicalman;

--
-- Name: creature_id_seq; Type: SEQUENCE; Schema: toy; Owner: mythicalman
--

CREATE SEQUENCE toy.creature_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE toy.creature_id_seq OWNER TO mythicalman;

--
-- Name: creature_id_seq; Type: SEQUENCE OWNED BY; Schema: toy; Owner: mythicalman
--

ALTER SEQUENCE toy.creature_id_seq OWNED BY toy.creature.id;


--
-- Name: customer; Type: TABLE; Schema: toy; Owner: mythicalman
--

CREATE TABLE toy.customer (
    id integer NOT NULL,
    useremail character varying(120) NOT NULL,
    firstname character varying(80),
    surname character varying(80),
    customer_role_id integer
);


ALTER TABLE toy.customer OWNER TO mythicalman;

--
-- Name: customer_id_seq; Type: SEQUENCE; Schema: toy; Owner: mythicalman
--

CREATE SEQUENCE toy.customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE toy.customer_id_seq OWNER TO mythicalman;

--
-- Name: customer_id_seq; Type: SEQUENCE OWNED BY; Schema: toy; Owner: mythicalman
--

ALTER SEQUENCE toy.customer_id_seq OWNED BY toy.customer.id;


--
-- Name: customer_role; Type: TABLE; Schema: toy; Owner: mythicalman
--

CREATE TABLE toy.customer_role (
    id integer NOT NULL,
    role_description character varying(40) NOT NULL
);


ALTER TABLE toy.customer_role OWNER TO mythicalman;

--
-- Name: customer_role_id_seq; Type: SEQUENCE; Schema: toy; Owner: mythicalman
--

CREATE SEQUENCE toy.customer_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE toy.customer_role_id_seq OWNER TO mythicalman;

--
-- Name: customer_role_id_seq; Type: SEQUENCE OWNED BY; Schema: toy; Owner: mythicalman
--

ALTER SEQUENCE toy.customer_role_id_seq OWNED BY toy.customer_role.id;


--
-- Name: kit; Type: TABLE; Schema: toy; Owner: mythicalman
--

CREATE TABLE toy.kit (
    id integer NOT NULL,
    kitname character varying(40),
    creature_id integer,
    shoulddisplay boolean,
    creator_id integer,
    thumbnail_path character varying(200)
);


ALTER TABLE toy.kit OWNER TO mythicalman;

--
-- Name: kit_accessory; Type: TABLE; Schema: toy; Owner: mythicalman
--

CREATE TABLE toy.kit_accessory (
    id integer NOT NULL,
    kit_id integer NOT NULL,
    acc_id integer NOT NULL,
    qty integer NOT NULL
);


ALTER TABLE toy.kit_accessory OWNER TO mythicalman;

--
-- Name: kit_accessory_id_seq; Type: SEQUENCE; Schema: toy; Owner: mythicalman
--

CREATE SEQUENCE toy.kit_accessory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE toy.kit_accessory_id_seq OWNER TO mythicalman;

--
-- Name: kit_accessory_id_seq; Type: SEQUENCE OWNED BY; Schema: toy; Owner: mythicalman
--

ALTER SEQUENCE toy.kit_accessory_id_seq OWNED BY toy.kit_accessory.id;


--
-- Name: kit_id_seq; Type: SEQUENCE; Schema: toy; Owner: mythicalman
--

CREATE SEQUENCE toy.kit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE toy.kit_id_seq OWNER TO mythicalman;

--
-- Name: kit_id_seq; Type: SEQUENCE OWNED BY; Schema: toy; Owner: mythicalman
--

ALTER SEQUENCE toy.kit_id_seq OWNED BY toy.kit.id;


--
-- Name: request; Type: TABLE; Schema: toy; Owner: mythicalman
--

CREATE TABLE toy.request (
    id integer NOT NULL,
    customer_id integer NOT NULL,
    requestdate timestamp without time zone
);


ALTER TABLE toy.request OWNER TO mythicalman;

--
-- Name: request_id_seq; Type: SEQUENCE; Schema: toy; Owner: mythicalman
--

CREATE SEQUENCE toy.request_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE toy.request_id_seq OWNER TO mythicalman;

--
-- Name: request_id_seq; Type: SEQUENCE OWNED BY; Schema: toy; Owner: mythicalman
--

ALTER SEQUENCE toy.request_id_seq OWNED BY toy.request.id;


--
-- Name: request_items; Type: TABLE; Schema: toy; Owner: mythicalman
--

CREATE TABLE toy.request_items (
    id integer NOT NULL,
    request_id integer NOT NULL,
    kit_id integer NOT NULL,
    quantity integer NOT NULL,
    request_price money
);


ALTER TABLE toy.request_items OWNER TO mythicalman;

--
-- Name: request_items_id_seq; Type: SEQUENCE; Schema: toy; Owner: mythicalman
--

CREATE SEQUENCE toy.request_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE toy.request_items_id_seq OWNER TO mythicalman;

--
-- Name: request_items_id_seq; Type: SEQUENCE OWNED BY; Schema: toy; Owner: mythicalman
--

ALTER SEQUENCE toy.request_items_id_seq OWNED BY toy.request_items.id;


--
-- Name: accessory id; Type: DEFAULT; Schema: toy; Owner: mythicalman
--

ALTER TABLE ONLY toy.accessory ALTER COLUMN id SET DEFAULT nextval('toy.accessory_id_seq'::regclass);


--
-- Name: bodypart id; Type: DEFAULT; Schema: toy; Owner: mythicalman
--

ALTER TABLE ONLY toy.bodypart ALTER COLUMN id SET DEFAULT nextval('toy.bodypart_id_seq'::regclass);


--
-- Name: cart_item id; Type: DEFAULT; Schema: toy; Owner: mythicalman
--

ALTER TABLE ONLY toy.cart_item ALTER COLUMN id SET DEFAULT nextval('toy.cart_item_id_seq'::regclass);


--
-- Name: creature id; Type: DEFAULT; Schema: toy; Owner: mythicalman
--

ALTER TABLE ONLY toy.creature ALTER COLUMN id SET DEFAULT nextval('toy.creature_id_seq'::regclass);


--
-- Name: customer id; Type: DEFAULT; Schema: toy; Owner: mythicalman
--

ALTER TABLE ONLY toy.customer ALTER COLUMN id SET DEFAULT nextval('toy.customer_id_seq'::regclass);


--
-- Name: customer_role id; Type: DEFAULT; Schema: toy; Owner: mythicalman
--

ALTER TABLE ONLY toy.customer_role ALTER COLUMN id SET DEFAULT nextval('toy.customer_role_id_seq'::regclass);


--
-- Name: kit id; Type: DEFAULT; Schema: toy; Owner: mythicalman
--

ALTER TABLE ONLY toy.kit ALTER COLUMN id SET DEFAULT nextval('toy.kit_id_seq'::regclass);


--
-- Name: kit_accessory id; Type: DEFAULT; Schema: toy; Owner: mythicalman
--

ALTER TABLE ONLY toy.kit_accessory ALTER COLUMN id SET DEFAULT nextval('toy.kit_accessory_id_seq'::regclass);


--
-- Name: request id; Type: DEFAULT; Schema: toy; Owner: mythicalman
--

ALTER TABLE ONLY toy.request ALTER COLUMN id SET DEFAULT nextval('toy.request_id_seq'::regclass);


--
-- Name: request_items id; Type: DEFAULT; Schema: toy; Owner: mythicalman
--

ALTER TABLE ONLY toy.request_items ALTER COLUMN id SET DEFAULT nextval('toy.request_items_id_seq'::regclass);


--
-- Data for Name: accessory; Type: TABLE DATA; Schema: toy; Owner: mythicalman
--

COPY toy.accessory (id, accessoryname, price, discription, bodypart_id) FROM stdin;
8	Paints	$1.00	\N	4
1	horn	$1.00	\N	1
3	wing	$1.00	\N	2
4	shoe	$1.00	\N	3
5	antlers	$1.00	\N	1
6	batwings	$1.00	\N	2
\.


--
-- Data for Name: bodypart; Type: TABLE DATA; Schema: toy; Owner: mythicalman
--

COPY toy.bodypart (id, partname) FROM stdin;
1	head
2	back
3	feet
4	other
\.


--
-- Data for Name: cart_item; Type: TABLE DATA; Schema: toy; Owner: mythicalman
--

COPY toy.cart_item (id, customer_id, kit_id, quantity, save_for_later) FROM stdin;
2	1	1	1	f
3	1	2	1	f
4	2	2	1	f
10	3	2	4	f
45	3	1	3	f
44	7	14	2	f
49	8	19	15	f
50	8	2	1	f
51	8	1	3	f
62	7	45	9999	f
41	7	2	14	f
64	4	48	3	f
42	5	2	7	f
52	9	31	1	f
65	5	18	1	f
54	3	38	1	f
55	3	39	1	f
56	12	1	1	f
57	12	2	1	f
58	12	42	1	f
59	12	3	1900000006	f
60	11	1	1	f
61	13	2	1	f
\.


--
-- Data for Name: creature; Type: TABLE DATA; Schema: toy; Owner: mythicalman
--

COPY toy.creature (id, creaturename, suggestedprice, discription) FROM stdin;
1	brontosaurus	$2.00	\N
2	t-rex	$2.50	\N
\.


--
-- Data for Name: customer; Type: TABLE DATA; Schema: toy; Owner: mythicalman
--

COPY toy.customer (id, useremail, firstname, surname, customer_role_id) FROM stdin;
1	utaaronaaron@gmail.com	Aaron	Allen	1
2	ireadforfundoyou@gmail.com	Rachel	Allen	1
5	reasanpete@gmail.com	Rachel Allen	Allen	1
6	tailoredtoys47@gmail.com	Tailored Toys	Toys	1
3	utaaronallen@gmail.com	Aaron Allen	Allen	2
4	thenewdorian21@gmail.com	Dorian Cottle	Cottle	2
8	jonoallen@gmail.com	Jonathan Allen	Allen	1
9	intriagojulissa99@gmail.com	julissa moreira	moreira	1
10	twodoschool@gmail.com	Aaron Allen	Allen	1
11	mythtogo@gmail.com	Toy Man	Man	2
7	blancocastrocarlosfelipe@gmail.com	Carlos Felipe Blanco Castro	Blanco Castro	2
12	slcanyonz@gmail.com	Brandon Strauss	Strauss	1
13	justinluster@gmail.com	Justin Luster	Luster	1
14	hmuhlestein@gmail.com	Herrick Muhlestein	Muhlestein	1
\.


--
-- Data for Name: customer_role; Type: TABLE DATA; Schema: toy; Owner: mythicalman
--

COPY toy.customer_role (id, role_description) FROM stdin;
1	customer
2	admin
\.


--
-- Data for Name: kit; Type: TABLE DATA; Schema: toy; Owner: mythicalman
--

COPY toy.kit (id, kitname, creature_id, shoulddisplay, creator_id, thumbnail_path) FROM stdin;
42	Brandon Strauss's Creation2	1	f	12	/Images/FlyingDinousary.png
43	Carlos Felipe Blanco Castro's Creation5	1	f	7	/Images/FlyingDinousary.png
44	Herrick Muhlestein's Creation1	1	f	14	/Images/FlyingDinousary.png
45	Carlos Felipe Blanco Castro's Creation6	1	f	7	/Images/FlyingDinousary.png
46	Dorian Cottle's Creation4	1	f	4	/Images/FlyingDinousary.png
47	Dorian Cottle's Creation5	1	f	4	/Images/FlyingDinousary.png
48	Dorian Cottle's Creation6	1	f	4	/Images/FlyingDinousary.png
49	Rachel Allen's Creation4	1	f	5	/Images/FlyingDinousary.png
3	hot wheels starter pack	1	t	4	/Images/hotwheelsstarterpack3.jpg
1	batman starter pack	1	t	3	/Images/batmanstarterpack1.jpg
2	barbie starter pack	1	t	3	/Images/barbiestarterpack2.jpg
7	Aaron Allen's Creation3	1	f	3	/Images/FlyingDinousary.png
14	Carlos Felipe Blanco Castro's Creation1	1	f	7	/Images/FlyingDinousary.png
17	Rachel Allen's Creation1	1	f	5	/Images/FlyingDinousary.png
18	Rachel Allen's Creation2	1	f	5	/Images/FlyingDinousary.png
19	Jonathan Allen's Creation1	1	f	8	/Images/FlyingDinousary.png
20	Rachel Allen's Creation3	1	f	5	/Images/FlyingDinousary.png
22	Carlos Felipe Blanco Castro's Creation2	1	f	7	/Images/FlyingDinousary.png
29	Dorian Cottle's Creation8	1	f	4	/Images/FlyingDinousary.png
31	julissa moreira's Creation1	1	f	9	/Images/FlyingDinousary.png
33	Aaron Allen's Creation10	1	f	3	/Images/FlyingDinousary.png
35	Toy Man's Creation1	1	f	11	/Images/FlyingDinousary.png
36	Carlos Felipe Blanco Castro's Creation3	1	f	7	/Images/FlyingDinousary.png
37	Carlos Felipe Blanco Castro's Creation4	1	f	7	/Images/FlyingDinousary.png
38	Aaron Allen's Creation5	1	f	3	/Images/FlyingDinousary.png
39	Aaron Allen's Creation6	1	f	3	/Images/FlyingDinousary.png
40	Brandon Strauss's Creation1	1	f	12	/Images/FlyingDinousary.png
41	Dorian Cottle's Creation3	1	f	4	/Images/FlyingDinousary.png
\.


--
-- Data for Name: kit_accessory; Type: TABLE DATA; Schema: toy; Owner: mythicalman
--

COPY toy.kit_accessory (id, kit_id, acc_id, qty) FROM stdin;
1	2	1	1
59	46	1	1
3	1	3	1
4	2	3	1
60	46	3	1
61	47	5	1
62	47	3	1
63	47	1	1
64	48	3	1
10	7	1	1
11	7	3	1
12	7	4	1
65	48	4	2
66	49	5	3
32	31	3	1
33	31	6	1
34	31	4	1
35	33	1	1
36	33	3	1
38	35	3	1
39	35	6	1
40	35	5	1
41	35	4	1
42	36	3	1
43	36	4	2
44	37	6	1
45	37	3	1
46	37	5	1
47	38	6	1
48	39	4	5
49	39	3	1
50	39	5	1
51	39	1	1
52	40	3	6
53	41	3	1
54	41	4	2
55	42	5	2
56	43	5	1
57	43	3	1
58	43	4	1
\.


--
-- Data for Name: request; Type: TABLE DATA; Schema: toy; Owner: mythicalman
--

COPY toy.request (id, customer_id, requestdate) FROM stdin;
1	1	2023-11-11 00:00:00
2	1	2023-11-10 00:00:00
3	2	2023-11-11 00:00:00
100	5	2023-11-30 18:23:14.572222
101	5	2023-11-30 18:23:50.454092
102	5	2023-11-30 18:27:49.362685
103	5	2023-11-30 18:40:53.784727
104	5	2023-11-30 18:42:34.045912
105	5	2023-11-30 18:43:47.05021
106	5	2023-11-30 18:50:46.798469
107	5	2023-11-30 18:51:53.205101
108	5	2023-11-30 18:56:01.143853
109	5	2023-11-30 19:00:51.864105
110	5	2023-11-30 19:01:51.711857
111	5	2023-11-30 19:03:10.189994
139	4	2023-11-30 23:17:32.840354
138	4	2023-11-30 23:21:57.294632
137	4	2023-11-30 23:27:09.670743
136	4	2023-11-30 23:28:00.93169
135	4	2023-11-30 23:31:43.902376
134	4	2023-11-30 23:36:09.533038
133	4	2023-11-30 23:36:58.89369
132	4	2023-11-30 23:40:05.505066
131	4	2023-12-01 00:09:22.039577
130	4	2023-12-01 00:11:54.467992
129	4	2023-12-01 00:28:34.528857
200	4	2023-12-01 00:31:38.593575
201	4	2023-12-01 08:44:08.919729
202	4	2023-12-01 08:55:50.862821
203	4	2023-12-01 09:02:57.932654
204	4	2023-12-01 09:07:04.754436
205	4	2023-12-01 09:10:12.886565
206	4	2023-12-01 09:16:01.265671
207	4	2023-12-01 09:35:40.645805
208	4	2023-12-01 10:39:49.383554
209	4	2023-12-01 10:43:50.146968
210	4	2023-12-01 10:44:16.652242
211	4	2023-12-01 10:45:13.979044
212	4	2023-12-01 10:45:50.765811
213	4	2023-12-01 11:13:33.90502
214	4	2023-12-01 18:31:33.523309
215	4	2023-12-01 18:37:14.31098
216	4	2023-12-02 10:59:59.219163
217	4	2023-12-02 11:03:19.502446
218	4	2023-12-02 11:03:55.57127
219	4	2023-12-02 19:03:52.147939
220	4	2023-12-02 19:21:05.854744
221	7	2023-12-03 05:02:48.072049
222	4	2023-12-03 05:20:39.51917
223	5	2023-12-05 18:20:00.971635
224	7	2023-12-06 00:39:16.578304
225	7	2023-12-06 00:52:25.491345
226	8	2023-12-06 15:56:19.448888
227	8	2023-12-06 15:56:20.932911
228	5	2023-12-06 10:43:10.615122
229	7	2023-12-06 22:33:36.172808
230	7	2023-12-06 23:37:00.162697
231	9	2023-12-07 01:33:40.520945
232	4	2023-12-07 04:09:36.087151
233	7	2023-12-07 09:23:56.937139
234	7	2023-12-07 16:15:42.784746
235	3	2023-12-07 19:59:59.751479
236	5	2023-12-08 00:41:19.30185
237	12	2023-12-08 00:47:17.021731
238	11	2023-12-07 19:06:05.816006
239	11	2023-12-07 19:08:37.165009
240	11	2023-12-07 19:11:15.254641
241	5	2023-12-08 02:14:05.447053
242	11	2023-12-07 19:16:13.931644
243	11	2023-12-07 19:23:13.109568
244	7	2023-12-08 02:42:03.125329
245	13	2023-12-08 05:14:44.173071
246	14	2023-12-08 05:51:19.788507
247	14	2023-12-08 05:57:09.860576
248	14	2023-12-08 06:05:47.839303
249	7	2023-12-08 08:05:44.880791
250	7	2023-12-08 08:05:46.611375
251	4	2023-12-08 18:21:28.821479
252	4	2023-12-08 18:21:33.058132
253	4	2023-12-11 17:39:06.259651
254	5	2023-12-11 18:53:52.010133
\.


--
-- Data for Name: request_items; Type: TABLE DATA; Schema: toy; Owner: mythicalman
--

COPY toy.request_items (id, request_id, kit_id, quantity, request_price) FROM stdin;
1	1	1	1	$3.00
2	3	1	1	$3.00
3	1	2	2	$3.00
4	2	2	2	$3.00
5	1	3	2	$3.00
6	2	3	2	$3.00
7	1	1	1	$3.00
8	3	1	1	$3.00
9	1	2	2	$3.00
10	2	2	2	$3.00
11	1	3	1	$3.00
12	101	1	1	$4.00
13	102	1	1	$4.00
14	103	1	1	$4.00
15	104	1	1	$4.00
16	105	1	1	$4.00
17	106	1	1	$4.00
18	107	1	1	$4.00
19	108	1	1	$4.00
20	109	1	1	$4.00
21	110	1	1	$4.00
22	111	1	1	$4.00
23	139	1	1	$4.00
24	139	1	1	$4.00
25	138	1	1	$4.00
26	138	1	1	$4.00
27	137	1	1	$4.00
28	137	1	1	$4.00
29	136	1	1	$4.00
30	136	1	1	$4.00
31	135	1	1	$4.00
32	135	1	1	$4.00
33	134	1	1	$4.00
34	134	1	1	$4.00
35	133	1	1	$4.00
36	133	1	1	$4.00
37	132	1	1	$4.00
38	132	1	1	$4.00
39	131	1	1	$4.00
40	131	1	1	$4.00
41	130	1	1	$4.00
42	130	1	1	$4.00
43	129	1	1	$4.00
44	129	1	1	$4.00
45	200	1	1	$4.00
46	200	1	1	$4.00
47	201	1	1	$4.00
48	201	1	1	$4.00
49	202	1	1	$4.00
50	202	1	1	$4.00
51	203	1	1	$4.00
52	203	1	1	$4.00
53	204	1	1	$4.00
54	204	1	1	$4.00
55	205	1	1	$4.00
56	205	1	1	$4.00
57	206	1	1	$4.00
58	206	1	1	$4.00
59	207	1	1	$4.00
60	207	1	1	$4.00
61	207	1	1	$4.00
62	207	1	1	$4.00
63	207	1	1	$4.00
64	207	2	1	$4.00
65	207	3	1	$3.00
66	208	1	4	$4.00
67	208	1	2	$4.00
68	208	2	8	$4.00
69	209	1	4	$4.00
70	209	1	2	$4.00
71	209	2	8	$4.00
72	210	1	4	$4.00
73	210	1	2	$4.00
74	210	2	8	$4.00
75	211	1	4	$4.00
76	211	1	2	$4.00
77	211	2	8	$4.00
78	212	1	4	$4.00
79	212	1	2	$4.00
80	212	2	8	$4.00
81	213	1	4	$4.00
82	213	1	2	$4.00
83	213	2	8	$4.00
84	214	1	4	$4.00
85	214	1	2	$4.00
86	214	2	8	$4.00
87	215	2	4	$4.00
88	215	1	6	$4.00
89	216	2	4	$4.00
90	216	3	6	$3.00
91	216	2	5	$4.00
92	217	2	4	$4.00
93	217	3	6	$3.00
94	217	2	5	$4.00
95	218	2	4	$4.00
96	218	3	6	$3.00
97	218	2	5	$4.00
98	219	2	7	$4.00
99	219	1	4	$4.00
100	220	2	7	$4.00
101	220	1	4	$4.00
102	221	1	1	$4.00
103	221	1	7	$4.00
104	221	1	1	$4.00
105	221	2	3	$4.00
106	222	2	25	$4.00
107	222	1	4	$4.00
108	223	1	1	$4.00
109	223	2	2	$4.00
110	223	3	6	$3.00
111	224	1	1	$4.00
112	224	2	10	$4.00
113	224	14	2	$2.00
114	224	3	4	$3.00
115	225	1	1	$4.00
116	225	2	10	$4.00
117	225	14	2	$2.00
118	225	3	4	$3.00
119	226	19	15	$2.00
120	226	2	1	$4.00
121	226	1	3	$4.00
122	226	3	1	$3.00
123	227	19	15	$2.00
124	227	2	1	$4.00
125	227	1	3	$4.00
126	227	3	1	$3.00
127	228	2	6	$4.00
128	228	3	12	$3.00
129	229	1	1	$4.00
130	229	2	14	$4.00
131	229	14	2	$2.00
132	229	3	4	$3.00
133	230	1	5	$4.00
134	230	2	14	$4.00
135	230	14	2	$2.00
136	230	3	4	$3.00
137	231	31	1	$5.00
138	232	29	1	$4.00
139	233	1	5	$3.00
140	233	2	14	$4.00
141	233	14	2	$2.00
142	234	1	5	$3.00
143	234	2	14	$4.00
144	234	14	2	$2.00
145	235	2	4	$4.00
146	235	1	3	$3.00
147	235	38	1	$3.00
148	235	39	1	$6.00
149	236	2	6	$4.00
150	237	1	1	$3.00
151	237	2	1	$4.00
152	237	3	2	$2.00
153	238	2	4	$4.00
154	239	2	4	$4.00
155	240	2	4	$4.00
156	241	2	6	$4.00
157	242	1	1	$3.00
158	243	1	1	$3.00
159	244	2	14	$4.00
160	244	14	2	$2.00
161	245	2	0	$4.00
162	246	44	1	$6.00
163	247	1	1	$3.00
164	248	3	1	$2.00
165	249	2	14	$4.00
166	249	14	2	$2.00
167	249	45	9999	$2.00
168	250	2	14	$4.00
169	250	14	2	$2.00
170	250	45	9999	$2.00
171	251	41	1	$4.00
172	252	41	1	$4.00
173	253	48	3	$4.00
174	254	2	7	$4.00
175	254	18	1	$2.00
\.


--
-- Name: accessory_id_seq; Type: SEQUENCE SET; Schema: toy; Owner: mythicalman
--

SELECT pg_catalog.setval('toy.accessory_id_seq', 1, false);


--
-- Name: bodypart_id_seq; Type: SEQUENCE SET; Schema: toy; Owner: mythicalman
--

SELECT pg_catalog.setval('toy.bodypart_id_seq', 1, false);


--
-- Name: cart_item_id_seq; Type: SEQUENCE SET; Schema: toy; Owner: mythicalman
--

SELECT pg_catalog.setval('toy.cart_item_id_seq', 5, true);


--
-- Name: creature_id_seq; Type: SEQUENCE SET; Schema: toy; Owner: mythicalman
--

SELECT pg_catalog.setval('toy.creature_id_seq', 1, false);


--
-- Name: customer_id_seq; Type: SEQUENCE SET; Schema: toy; Owner: mythicalman
--

SELECT pg_catalog.setval('toy.customer_id_seq', 3, true);


--
-- Name: customer_role_id_seq; Type: SEQUENCE SET; Schema: toy; Owner: mythicalman
--

SELECT pg_catalog.setval('toy.customer_role_id_seq', 1, false);


--
-- Name: kit_accessory_id_seq; Type: SEQUENCE SET; Schema: toy; Owner: mythicalman
--

SELECT pg_catalog.setval('toy.kit_accessory_id_seq', 5, true);


--
-- Name: kit_id_seq; Type: SEQUENCE SET; Schema: toy; Owner: mythicalman
--

SELECT pg_catalog.setval('toy.kit_id_seq', 1, false);


--
-- Name: request_id_seq; Type: SEQUENCE SET; Schema: toy; Owner: mythicalman
--

SELECT pg_catalog.setval('toy.request_id_seq', 2, true);


--
-- Name: request_items_id_seq; Type: SEQUENCE SET; Schema: toy; Owner: mythicalman
--

SELECT pg_catalog.setval('toy.request_items_id_seq', 175, true);


--
-- Name: accessory accessory_pkey; Type: CONSTRAINT; Schema: toy; Owner: mythicalman
--

ALTER TABLE ONLY toy.accessory
    ADD CONSTRAINT accessory_pkey PRIMARY KEY (id);


--
-- Name: bodypart bodypart_pkey; Type: CONSTRAINT; Schema: toy; Owner: mythicalman
--

ALTER TABLE ONLY toy.bodypart
    ADD CONSTRAINT bodypart_pkey PRIMARY KEY (id);


--
-- Name: cart_item cart_item_pkey; Type: CONSTRAINT; Schema: toy; Owner: mythicalman
--

ALTER TABLE ONLY toy.cart_item
    ADD CONSTRAINT cart_item_pkey PRIMARY KEY (id);


--
-- Name: creature creature_pkey; Type: CONSTRAINT; Schema: toy; Owner: mythicalman
--

ALTER TABLE ONLY toy.creature
    ADD CONSTRAINT creature_pkey PRIMARY KEY (id);


--
-- Name: customer customer_pkey; Type: CONSTRAINT; Schema: toy; Owner: mythicalman
--

ALTER TABLE ONLY toy.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (id);


--
-- Name: customer_role customer_role_pkey; Type: CONSTRAINT; Schema: toy; Owner: mythicalman
--

ALTER TABLE ONLY toy.customer_role
    ADD CONSTRAINT customer_role_pkey PRIMARY KEY (id);


--
-- Name: kit_accessory kit_accessory_pkey; Type: CONSTRAINT; Schema: toy; Owner: mythicalman
--

ALTER TABLE ONLY toy.kit_accessory
    ADD CONSTRAINT kit_accessory_pkey PRIMARY KEY (id);


--
-- Name: kit kit_pkey; Type: CONSTRAINT; Schema: toy; Owner: mythicalman
--

ALTER TABLE ONLY toy.kit
    ADD CONSTRAINT kit_pkey PRIMARY KEY (id);


--
-- Name: request_items request_items_pkey; Type: CONSTRAINT; Schema: toy; Owner: mythicalman
--

ALTER TABLE ONLY toy.request_items
    ADD CONSTRAINT request_items_pkey PRIMARY KEY (id);


--
-- Name: request request_pkey; Type: CONSTRAINT; Schema: toy; Owner: mythicalman
--

ALTER TABLE ONLY toy.request
    ADD CONSTRAINT request_pkey PRIMARY KEY (id);


--
-- Name: accessory accessory_bodypart_id_fkey; Type: FK CONSTRAINT; Schema: toy; Owner: mythicalman
--

ALTER TABLE ONLY toy.accessory
    ADD CONSTRAINT accessory_bodypart_id_fkey FOREIGN KEY (bodypart_id) REFERENCES toy.bodypart(id);


--
-- Name: cart_item cart_item_customer_id_fkey; Type: FK CONSTRAINT; Schema: toy; Owner: mythicalman
--

ALTER TABLE ONLY toy.cart_item
    ADD CONSTRAINT cart_item_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES toy.customer(id);


--
-- Name: cart_item cart_item_kit_id_fkey; Type: FK CONSTRAINT; Schema: toy; Owner: mythicalman
--

ALTER TABLE ONLY toy.cart_item
    ADD CONSTRAINT cart_item_kit_id_fkey FOREIGN KEY (kit_id) REFERENCES toy.kit(id);


--
-- Name: customer customer_customer_role_id_fkey; Type: FK CONSTRAINT; Schema: toy; Owner: mythicalman
--

ALTER TABLE ONLY toy.customer
    ADD CONSTRAINT customer_customer_role_id_fkey FOREIGN KEY (customer_role_id) REFERENCES toy.customer_role(id);


--
-- Name: kit_accessory kit_accessory_acc_id_fkey; Type: FK CONSTRAINT; Schema: toy; Owner: mythicalman
--

ALTER TABLE ONLY toy.kit_accessory
    ADD CONSTRAINT kit_accessory_acc_id_fkey FOREIGN KEY (acc_id) REFERENCES toy.accessory(id);


--
-- Name: kit_accessory kit_accessory_kit_id_fkey; Type: FK CONSTRAINT; Schema: toy; Owner: mythicalman
--

ALTER TABLE ONLY toy.kit_accessory
    ADD CONSTRAINT kit_accessory_kit_id_fkey FOREIGN KEY (kit_id) REFERENCES toy.kit(id);


--
-- Name: kit kit_creator_id_fkey; Type: FK CONSTRAINT; Schema: toy; Owner: mythicalman
--

ALTER TABLE ONLY toy.kit
    ADD CONSTRAINT kit_creator_id_fkey FOREIGN KEY (creator_id) REFERENCES toy.customer(id);


--
-- Name: kit kit_creature_id_fkey; Type: FK CONSTRAINT; Schema: toy; Owner: mythicalman
--

ALTER TABLE ONLY toy.kit
    ADD CONSTRAINT kit_creature_id_fkey FOREIGN KEY (creature_id) REFERENCES toy.creature(id);


--
-- Name: request request_customer_id_fkey; Type: FK CONSTRAINT; Schema: toy; Owner: mythicalman
--

ALTER TABLE ONLY toy.request
    ADD CONSTRAINT request_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES toy.customer(id);


--
-- Name: request_items request_items_kit_id_fkey; Type: FK CONSTRAINT; Schema: toy; Owner: mythicalman
--

ALTER TABLE ONLY toy.request_items
    ADD CONSTRAINT request_items_kit_id_fkey FOREIGN KEY (kit_id) REFERENCES toy.kit(id);


--
-- Name: request_items request_items_request_id_fkey; Type: FK CONSTRAINT; Schema: toy; Owner: mythicalman
--

ALTER TABLE ONLY toy.request_items
    ADD CONSTRAINT request_items_request_id_fkey FOREIGN KEY (request_id) REFERENCES toy.request(id);


--
-- PostgreSQL database dump complete
--

