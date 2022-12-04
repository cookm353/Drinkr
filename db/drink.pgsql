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
    rating integer,
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
    url text,
    img_url text
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
-- Name: user_ingredients; Type: TABLE; Schema: public; Owner: matt
--

CREATE TABLE public.user_ingredients (
    id integer NOT NULL,
    user_id integer,
    ingredient_id integer
);


ALTER TABLE public.user_ingredients OWNER TO matt;

--
-- Name: user_ingredients_id_seq; Type: SEQUENCE; Schema: public; Owner: matt
--

CREATE SEQUENCE public.user_ingredients_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_ingredients_id_seq OWNER TO matt;

--
-- Name: user_ingredients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: matt
--

ALTER SEQUENCE public.user_ingredients_id_seq OWNED BY public.user_ingredients.id;


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
-- Name: user_ingredients id; Type: DEFAULT; Schema: public; Owner: matt
--

ALTER TABLE ONLY public.user_ingredients ALTER COLUMN id SET DEFAULT nextval('public.user_ingredients_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: matt
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: matt
--

COPY public.comments (id, content, rating, user_id, drink_id) FROM stdin;
\.


--
-- Data for Name: drink_ingredients; Type: TABLE DATA; Schema: public; Owner: matt
--

COPY public.drink_ingredients (id, ingredient_id, drink_id) FROM stdin;
1	3	1
2	48	1
3	36	1
4	16	2
5	44	2
6	4	11
7	82	11
8	1	14
9	9	14
10	30	14
11	25	14
12	3	3
13	36	3
14	64	3
15	50	3
16	4	5
17	48	5
18	36	5
19	40	18
20	22	18
21	21	18
22	9	18
23	5	19
24	15	19
25	3	12
26	6	8
27	78	8
28	7	15
29	5	15
30	15	15
31	11	15
32	36	21
33	47	21
34	26	22
35	68	22
36	22	20
37	2	7
38	41	7
39	3	23
40	35	23
41	14	24
42	15	24
43	47	24
44	15	25
45	20	25
46	98	25
47	48	25
48	4	13
49	26	13
50	41	9
51	46	9
52	2	16
53	9	16
54	48	16
55	3	6
56	22	10
57	46	10
58	48	10
59	85	10
60	3	17
61	48	17
62	26	26
63	26	27
64	94	27
65	26	48
66	50	48
67	40	50
68	4	50
69	36	50
70	47	50
71	7	33
72	5	33
73	15	33
74	24	33
75	40	38
76	65	38
77	47	38
78	30	38
79	18	31
80	10	45
81	9	45
82	56	45
83	90	30
84	11	28
85	3	28
86	5	28
87	5	43
88	45	43
89	3	34
90	9	34
91	24	34
92	93	44
93	3	37
94	15	37
95	24	37
96	47	36
97	48	36
98	36	36
99	14	49
100	83	49
101	83	49
102	3	29
103	9	29
104	48	29
105	36	29
106	77	42
107	22	42
108	48	42
109	40	42
110	3	32
111	48	32
112	49	32
113	7	40
114	24	40
115	15	35
116	22	46
117	26	47
118	94	47
119	68	52
120	50	52
121	9	52
122	12	52
123	25	53
124	56	53
125	56	62
126	25	62
127	86	64
128	1	60
129	9	60
130	30	60
131	3	51
132	48	51
133	11	51
134	3	68
135	48	68
136	11	68
137	79	68
138	1	56
139	34	56
140	1	65
141	37	65
142	83	65
143	33	65
144	63	74
145	50	74
146	70	74
147	92	70
148	50	70
149	16	70
150	12	63
151	9	63
152	48	63
153	5	71
154	45	71
155	3	61
156	36	61
157	83	61
158	68	72
159	25	72
160	22	72
161	70	72
162	70	67
163	25	67
164	68	67
165	22	67
166	48	73
167	56	58
168	23	58
169	3	69
170	9	69
171	48	69
172	88	66
173	30	66
174	78	66
175	78	75
176	25	75
177	47	75
178	69	54
179	4	55
180	56	55
181	1	57
182	56	57
183	1	78
184	56	78
185	87	90
186	68	79
187	77	79
188	4	87
189	27	88
190	56	88
191	18	93
192	3	76
193	86	77
194	95	77
195	22	85
196	15	85
197	83	85
198	26	84
199	94	84
200	96	80
201	21	80
202	3	81
203	56	81
204	64	92
205	50	92
206	63	92
207	3	82
208	15	82
209	7	83
210	15	83
211	28	91
212	3	91
213	24	91
214	89	89
215	30	89
216	52	94
217	50	94
218	79	95
219	25	95
220	50	95
221	1	95
222	20	95
223	25	95
224	80	102
225	25	102
226	50	102
227	80	99
228	25	99
229	50	99
230	40	99
231	56	101
232	92	103
233	19	103
234	12	96
235	3	96
236	5	96
237	33	96
238	8	100
239	3	100
240	15	100
241	36	100
242	48	100
243	22	97
244	26	97
245	49	97
246	40	98
247	71	98
248	68	98
249	84	117
250	22	108
251	16	123
252	22	123
253	26	124
254	94	124
255	94	125
256	3	118
257	9	118
258	7	121
259	5	121
260	24	121
261	49	121
262	16	106
263	35	106
264	68	105
265	50	105
266	25	105
267	94	112
268	22	112
269	3	107
270	25	107
271	48	107
272	18	107
273	73	107
274	44	122
275	16	122
276	22	115
277	47	115
278	3	116
279	5	116
280	14	109
281	83	109
282	56	109
283	83	109
284	56	109
285	25	104
286	51	104
287	48	104
288	1	119
289	9	119
290	30	119
291	25	119
292	1	126
293	30	126
294	25	126
295	1	127
296	30	127
297	25	127
298	46	111
299	51	111
300	25	111
301	83	111
302	53	120
303	53	110
304	40	113
305	83	113
306	68	114
307	66	133
308	48	133
309	65	133
310	65	128
311	3	129
312	30	129
313	49	129
314	56	129
315	3	152
316	56	152
317	3	147
318	33	147
319	3	140
320	48	140
321	25	140
322	36	140
323	73	140
324	3	131
325	83	131
326	33	131
327	3	141
328	48	141
329	3	144
330	36	144
331	83	144
332	56	144
333	3	142
334	83	142
335	70	142
336	3	139
337	33	139
338	25	139
339	73	139
340	3	132
341	48	132
342	25	132
343	73	132
344	3	145
345	36	145
346	51	145
347	33	145
348	30	148
349	25	148
350	3	148
351	24	148
352	3	138
353	70	138
354	3	137
355	39	136
356	70	136
357	25	136
358	22	130
359	16	130
360	64	130
361	7	135
362	16	135
363	22	134
364	16	134
365	35	150
366	3	149
367	9	149
368	47	149
369	36	149
370	22	143
371	41	143
372	26	151
373	36	151
374	55	160
375	22	160
376	69	158
377	56	158
378	22	165
379	65	165
380	1	161
381	47	161
382	48	161
383	3	166
384	9	166
385	47	166
386	68	153
387	40	167
388	41	167
389	30	167
390	17	156
391	7	168
392	5	168
393	11	168
394	81	162
395	25	163
396	68	163
397	70	163
398	22	163
399	48	154
400	12	157
401	24	157
402	63	169
403	31	164
404	68	164
405	87	155
406	83	155
407	49	159
408	85	159
409	68	172
410	25	172
411	70	172
412	50	172
413	26	179
414	68	179
415	22	171
416	48	171
417	30	178
418	3	178
419	1	176
420	14	176
421	83	176
422	33	176
423	56	170
424	31	174
425	68	174
426	25	174
427	7	173
428	52	173
429	20	180
430	22	180
431	22	177
432	26	177
433	31	175
434	73	175
435	16	183
436	32	192
437	36	192
438	56	192
439	19	186
440	1	186
441	50	186
442	40	189
443	68	189
444	70	189
445	49	181
446	25	181
447	14	188
448	83	188
449	37	188
450	33	188
451	22	185
452	70	185
453	98	184
454	3	191
455	3	182
456	22	182
457	36	182
458	30	182
459	25	182
460	49	182
461	20	187
462	48	187
463	25	187
464	73	187
465	50	190
466	52	190
467	22	196
468	9	196
469	30	196
470	68	195
471	20	205
472	20	206
473	55	209
474	83	209
475	70	209
476	26	200
477	12	200
478	68	200
479	100	194
480	18	194
481	100	197
482	18	197
483	46	202
484	60	201
485	49	201
486	22	201
487	60	201
488	60	208
489	22	203
490	16	203
491	45	203
492	9	203
493	78	203
494	22	207
495	17	199
496	25	199
497	3	224
498	83	224
499	33	224
500	53	231
501	70	231
502	53	215
503	70	215
504	54	220
505	53	220
506	25	220
507	70	220
508	53	216
509	25	216
510	56	216
511	53	221
512	70	221
513	25	221
514	48	221
515	41	228
516	83	212
517	22	230
518	65	213
519	88	213
520	83	213
521	25	213
522	55	217
523	70	217
524	83	217
525	25	217
526	56	210
527	25	210
528	7	218
529	15	218
530	3	219
531	11	219
532	5	227
533	3	227
534	33	226
535	3	226
536	15	226
537	22	229
538	21	229
539	1	229
540	3	229
541	22	225
542	1	225
543	3	225
544	21	225
545	83	225
546	22	214
547	56	214
548	4	223
549	16	211
550	1	235
551	9	235
552	56	250
553	54	250
554	54	250
555	5	238
556	20	238
557	21	239
558	9	239
559	30	239
560	3	242
561	5	242
562	3	236
563	15	236
564	1	254
565	47	254
566	36	254
567	70	247
568	17	247
569	55	247
570	25	247
571	50	247
572	71	232
573	62	232
574	61	237
575	30	237
576	18	234
577	20	240
578	70	240
579	68	249
580	62	249
581	1	233
582	56	233
583	25	233
584	48	251
585	4	251
586	3	252
587	36	252
588	1	255
589	41	255
590	24	255
591	21	243
592	36	243
593	22	245
594	30	245
595	50	256
596	10	241
597	70	246
598	25	246
599	39	246
600	12	246
601	3	248
602	30	248
603	83	248
604	40	260
605	22	260
606	3	260
607	3	257
608	5	257
609	88	261
610	48	261
611	14	258
612	83	258
613	25	258
614	39	258
615	83	258
616	62	262
617	25	262
618	50	262
619	50	259
620	26	271
621	20	269
622	25	269
623	70	269
624	15	264
625	48	265
626	49	265
627	22	267
628	9	267
629	34	268
630	3	268
631	69	272
632	36	272
633	3	273
634	48	273
635	50	274
636	63	274
637	71	274
638	40	266
639	22	266
640	22	270
641	26	270
642	35	263
643	16	263
644	9	263
645	22	263
646	87	275
647	85	275
648	21	276
649	3	277
650	8	277
651	22	299
652	49	299
653	3	279
654	30	279
655	11	279
656	48	282
657	1	285
658	55	300
659	21	292
660	41	292
661	47	292
662	56	292
663	24	278
664	3	278
665	3	280
666	36	280
667	3	281
668	30	281
669	96	298
670	22	298
671	77	286
672	22	286
673	78	286
674	89	283
675	48	283
676	25	283
677	4	291
678	47	291
679	4	294
680	47	294
681	36	294
682	49	294
683	22	288
684	78	288
685	3	289
686	35	289
687	22	293
688	56	293
689	36	295
690	12	284
691	37	284
692	79	284
693	37	296
694	12	296
695	37	290
696	80	290
697	40	287
698	30	287
699	46	297
700	47	297
701	1	307
702	12	307
703	83	307
704	1	308
705	43	308
706	56	308
707	38	302
708	43	302
709	39	305
710	36	305
711	15	306
712	3	306
713	4	301
714	26	301
715	26	303
716	93	303
717	40	333
718	22	333
719	21	333
720	3	333
721	9	333
722	93	333
723	97	310
724	49	323
725	48	323
726	3	325
727	48	325
728	49	325
729	20	328
730	16	318
731	78	318
732	15	309
733	3	309
734	8	309
735	48	309
736	36	309
737	3	324
738	3	314
739	80	314
740	78	320
741	3	326
742	83	326
743	80	326
744	33	326
745	3	322
746	78	322
747	36	322
748	25	321
749	83	321
750	4	321
751	73	321
752	40	315
753	83	315
754	1	327
755	50	327
756	1	331
757	24	331
758	70	331
759	40	312
760	98	316
761	47	316
762	78	316
763	1	329
764	1	311
765	48	311
766	25	311
767	73	311
768	40	313
769	70	313
770	22	332
771	100	332
772	49	332
773	48	332
774	7	317
775	41	345
776	3	345
777	22	354
778	36	354
779	39	337
780	25	337
781	48	337
782	42	339
783	25	339
784	70	339
785	20	339
786	12	336
787	16	336
788	7	348
789	56	348
790	83	348
791	22	350
792	22	347
793	78	347
794	41	347
795	85	353
796	70	353
797	22	353
798	43	356
799	80	356
800	50	356
801	43	351
802	80	351
803	44	340
804	48	340
805	39	334
806	85	343
807	83	343
808	22	341
809	12	352
810	47	355
811	36	355
812	25	342
813	40	342
814	30	342
815	18	342
816	12	338
817	8	346
818	50	357
819	39	358
820	25	358
821	70	358
822	73	358
823	56	358
824	83	358
825	50	349
826	68	368
827	68	369
828	16	369
829	21	370
830	48	370
831	36	370
832	21	376
833	97	376
834	21	371
835	83	371
836	83	371
837	21	377
838	36	377
839	21	380
840	34	383
841	10	383
842	26	364
843	90	364
844	16	364
845	68	365
846	25	365
847	68	381
848	25	381
849	17	372
850	70	372
851	4	360
852	47	360
853	30	360
854	31	382
855	16	382
856	78	382
857	30	373
858	3	375
859	56	375
860	55	375
861	3	378
862	11	378
863	48	378
864	7	359
865	70	361
866	68	361
867	40	361
868	31	362
869	5	362
870	61	367
871	48	367
872	3	366
873	48	366
874	25	366
875	73	366
876	15	374
877	3	374
878	24	374
879	16	363
880	47	363
881	15	379
882	3	379
883	11	379
884	8	399
885	11	399
886	21	386
887	61	386
888	30	386
889	49	386
890	1	389
891	48	389
892	15	396
893	100	396
894	33	396
895	3	384
896	22	384
897	1	387
898	5	387
899	83	387
900	4	388
901	34	388
902	3	385
903	5	385
904	12	385
905	22	397
906	48	397
907	81	397
908	73	397
909	22	398
910	22	390
911	22	391
912	48	391
913	22	394
914	15	394
915	22	395
916	96	392
917	30	392
918	22	392
919	22	393
920	9	410
921	3	410
922	47	410
923	14	405
924	83	405
925	83	405
926	7	400
927	21	409
928	30	409
929	3	401
930	9	401
931	48	401
932	22	406
933	19	406
934	56	408
935	83	408
936	51	408
937	32	408
938	39	403
939	39	402
940	83	402
941	73	402
942	47	402
943	21	407
944	41	407
945	30	407
946	21	404
947	30	404
948	65	411
949	9	411
950	30	411
951	53	412
952	94	417
953	46	425
954	93	423
955	22	420
956	16	424
957	40	424
958	48	422
959	83	422
960	85	415
961	97	415
962	100	415
963	83	415
964	40	416
965	36	416
966	30	416
967	22	418
968	67	418
969	94	413
\.


--
-- Data for Name: drinks; Type: TABLE DATA; Schema: public; Owner: matt
--

COPY public.drinks (id, name, url, img_url) FROM stdin;
1	A1	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=A1	https://www.thecocktaildb.com/images/media/drink/2x8thr1504816928.jpg
2	ABC	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=ABC	https://www.thecocktaildb.com/images/media/drink/tqpvqp1472668328.jpg
3	Ace	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Ace	https://www.thecocktaildb.com/images/media/drink/l3cd7f1504818306.jpg
4	ACID	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=ACID	https://www.thecocktaildb.com/images/media/drink/xuxpxt1479209317.jpg
5	Adam	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Adam	https://www.thecocktaildb.com/images/media/drink/v0at4i1582478473.jpg
6	AT&T	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=AT&T	https://www.thecocktaildb.com/images/media/drink/rhhwmp1493067619.jpg
7	A. J.	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=A.+J.	https://www.thecocktaildb.com/images/media/drink/l74qo91582480316.jpg
8	Affair	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Affair	https://www.thecocktaildb.com/images/media/drink/h5za6y1582477994.jpg
9	Apello	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Apello	https://www.thecocktaildb.com/images/media/drink/uptxtv1468876415.jpg
10	Avalon	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Avalon	https://www.thecocktaildb.com/images/media/drink/3k9qic1493068931.jpg
11	Abilene	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Abilene	https://www.thecocktaildb.com/images/media/drink/smb2oe1582479072.jpg
12	Addison	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Addison	https://www.thecocktaildb.com/images/media/drink/yzva7x1504820300.jpg
13	Almeria	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Almeria	https://www.thecocktaildb.com/images/media/drink/rwsyyu1483388181.jpg
14	Acapulco	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Acapulco	https://www.thecocktaildb.com/images/media/drink/il9e0r1582478841.jpg
15	Affinity	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Affinity	https://www.thecocktaildb.com/images/media/drink/wzdtnn1582477684.jpg
16	Applecar	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Applecar	https://www.thecocktaildb.com/images/media/drink/sbffau1504389764.jpg
17	Aviation	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Aviation	https://www.thecocktaildb.com/images/media/drink/trbplb1606855233.jpg
18	Adam Bomb	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Adam+Bomb	https://www.thecocktaildb.com/images/media/drink/tpxurs1454513016.jpg
19	Addington	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Addington	https://www.thecocktaildb.com/images/media/drink/ib0b7g1504818925.jpg
20	After sex	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=After+sex	https://www.thecocktaildb.com/images/media/drink/xrl66i1493068702.jpg
21	Afterglow	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Afterglow	https://www.thecocktaildb.com/images/media/drink/vuquyv1468876052.jpg
22	Afternoon	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Afternoon	https://www.thecocktaildb.com/images/media/drink/vyrurp1472667777.jpg
23	Alexander	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Alexander	https://www.thecocktaildb.com/images/media/drink/0clus51606772388.jpg
24	Algonquin	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Algonquin	https://www.thecocktaildb.com/images/media/drink/uwryxx1483387873.jpg
25	Allegheny	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Allegheny	https://www.thecocktaildb.com/images/media/drink/uwvyts1483387934.jpg
26	B-52	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=B-52	https://www.thecocktaildb.com/images/media/drink/5a3vg61504372070.jpg
27	B-53	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=B-53	https://www.thecocktaildb.com/images/media/drink/rwqxrv1461866023.jpg
28	Bijou	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Bijou	https://www.thecocktaildb.com/images/media/drink/rysb3r1513706985.jpg
29	Boxcar	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Boxcar	https://www.thecocktaildb.com/images/media/drink/pwgtpa1504366376.jpg
30	Big Red	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Big+Red	https://www.thecocktaildb.com/images/media/drink/yqwuwu1441248116.jpg
31	Bellini	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Bellini	https://www.thecocktaildb.com/images/media/drink/eaag491504367543.jpg
32	Bramble	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Bramble	https://www.thecocktaildb.com/images/media/drink/twtbh51630406392.jpg
33	Balmoral	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Balmoral	https://www.thecocktaildb.com/images/media/drink/vysuyq1441206297.jpg
34	Bluebird	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Bluebird	https://www.thecocktaildb.com/images/media/drink/5jhyd01582579843.jpg
35	Brooklyn	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Brooklyn	https://www.thecocktaildb.com/images/media/drink/ojsezf1582477277.jpg
36	Bora Bora	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Bora+Bora	https://www.thecocktaildb.com/images/media/drink/xwuqvw1473201811.jpg
37	Boomerang	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Boomerang	https://www.thecocktaildb.com/images/media/drink/3m6yz81504389551.jpg
38	Barracuda	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Barracuda	https://www.thecocktaildb.com/images/media/drink/jwmr1x1504372337.jpg
39	Brigadier	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Brigadier	https://www.thecocktaildb.com/images/media/drink/nl89tf1518947401.jpg
40	Broadside	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Broadside	https://www.thecocktaildb.com/images/media/drink/l2o6xu1582476870.jpg
41	Buccaneer	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Buccaneer	https://www.thecocktaildb.com/images/media/drink/upvtyt1441249023.jpg
42	Brain Fart	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Brain+Fart	https://www.thecocktaildb.com/images/media/drink/rz5aun1504389701.jpg
43	Blackthorn	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Blackthorn	https://www.thecocktaildb.com/images/media/drink/dgj92f1616098672.jpg
44	Bob Marley	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Bob+Marley	https://www.thecocktaildb.com/images/media/drink/rrqrst1477140664.jpg
45	Bible Belt	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Bible+Belt	https://www.thecocktaildb.com/images/media/drink/6bec6v1503563675.jpg
46	Bubble Gum	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Bubble+Gum	https://www.thecocktaildb.com/images/media/drink/spuurv1468878783.jpg
47	Bumble Bee	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Bumble+Bee	https://www.thecocktaildb.com/images/media/drink/uwqpvv1461866378.jpg
48	Baby Eskimo	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Baby+Eskimo	https://www.thecocktaildb.com/images/media/drink/wywrtw1472720227.jpg
49	Boston Sour	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Boston+Sour	https://www.thecocktaildb.com/images/media/drink/kxlgbi1504366100.jpg
50	Bahama Mama	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Bahama+Mama	https://www.thecocktaildb.com/images/media/drink/tyb4a41515793339.jpg
51	Casino	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Casino	https://www.thecocktaildb.com/images/media/drink/1mvjxg1504348579.jpg
52	Cafe Savoy	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Cafe+Savoy	https://www.thecocktaildb.com/images/media/drink/vqwptt1441247711.jpg
53	Caipirinha	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Caipirinha	https://www.thecocktaildb.com/images/media/drink/jgvn7p1582484435.jpg
54	Cream Soda	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Cream+Soda	https://www.thecocktaildb.com/images/media/drink/yqstxr1479209367.jpg
55	Cuba Libra	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Cuba+Libra	https://www.thecocktaildb.com/images/media/drink/ck6d0p1504388696.jpg
56	Cherry Rum	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Cherry+Rum	https://www.thecocktaildb.com/images/media/drink/twsuvr1441554424.jpg
57	Cuba Libre	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Cuba+Libre	https://www.thecocktaildb.com/images/media/drink/wmkbfj1606853905.jpg
58	Corn n Oil	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Corn+n+Oil	https://www.thecocktaildb.com/images/media/drink/pk6dwi1592767243.jpg
59	Citrus Coke	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Citrus+Coke	https://www.thecocktaildb.com/images/media/drink/uyrvut1479473214.jpg
60	Casa Blanca	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Casa+Blanca	https://www.thecocktaildb.com/images/media/drink/usspxq1441553762.jpg
61	Clover Club	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Clover+Club	https://www.thecocktaildb.com/images/media/drink/t0aja61504348715.jpg
62	Caipirissima	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Caipirissima	https://www.thecocktaildb.com/images/media/drink/yd47111503565515.jpg
63	City Slicker	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=City+Slicker	https://www.thecocktaildb.com/images/media/drink/dazdlg1504366949.jpg
64	Campari Beer	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Campari+Beer	https://www.thecocktaildb.com/images/media/drink/xsqrup1441249130.jpg
65	Chicago Fizz	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Chicago+Fizz	https://www.thecocktaildb.com/images/media/drink/qwvwqr1441207763.jpg
66	Cosmopolitan	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Cosmopolitan	https://www.thecocktaildb.com/images/media/drink/kpsajh1504368362.jpg
67	Coffee-Vodka	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Coffee-Vodka	https://www.thecocktaildb.com/images/media/drink/qvrrvu1472667494.jpg
68	Casino Royale	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Casino+Royale	https://www.thecocktaildb.com/images/media/drink/3qpv121504366699.jpg
69	Corpse Reviver	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Corpse+Reviver	https://www.thecocktaildb.com/images/media/drink/gifgao1513704334.jpg
70	Chocolate Milk	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Chocolate+Milk	https://www.thecocktaildb.com/images/media/drink/j6q35t1504889399.jpg
71	Clove Cocktail	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Clove+Cocktail	https://www.thecocktaildb.com/images/media/drink/qxvtst1461867579.jpg
72	Coffee Liqueur	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Coffee+Liqueur	https://www.thecocktaildb.com/images/media/drink/ryvtsu1441253851.jpg
73	Coke and Drops	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Coke+and+Drops	https://www.thecocktaildb.com/images/media/drink/yrtxxp1472719367.jpg
74	Chocolate Drink	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Chocolate+Drink	https://www.thecocktaildb.com/images/media/drink/q7w4xu1487603180.jpg
75	Cranberry Punch	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Cranberry+Punch	https://www.thecocktaildb.com/images/media/drink/mzgaqu1504389248.jpg
76	Derby	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Derby	https://www.thecocktaildb.com/images/media/drink/52weey1606772672.jpg
77	Diesel	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Diesel	https://www.thecocktaildb.com/images/media/drink/sxrrqq1454512852.jpg
78	Daiquiri	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Daiquiri	https://www.thecocktaildb.com/images/media/drink/mrz9091589574515.jpg
79	Danbooka	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Danbooka	https://www.thecocktaildb.com/images/media/drink/vurrxr1441246074.jpg
80	Downshift	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Downshift	https://www.thecocktaildb.com/images/media/drink/y36z8c1503563911.jpg
81	Dragonfly	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Dragonfly	https://www.thecocktaildb.com/images/media/drink/uc63bh1582483589.jpg
82	Dry Martini	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Dry+Martini	https://www.thecocktaildb.com/images/media/drink/6ck9yi1589574317.jpg
83	Dry Rob Roy	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Dry+Rob+Roy	https://www.thecocktaildb.com/images/media/drink/typuyq1439456976.jpg
84	Dirty Nipple	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Dirty+Nipple	https://www.thecocktaildb.com/images/media/drink/vtyqrt1461866508.jpg
85	Dirty Martini	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Dirty+Martini	https://www.thecocktaildb.com/images/media/drink/vcyvpq1485083300.jpg
86	Darkwood Sling	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Darkwood+Sling	https://www.thecocktaildb.com/images/media/drink/sxxsyq1472719303.jpg
87	Dark and Stormy	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Dark+and+Stormy	https://www.thecocktaildb.com/images/media/drink/t1tn0s1504374905.jpg
88	Dark Caipirinha	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Dark+Caipirinha	https://www.thecocktaildb.com/images/media/drink/uwstrx1472406058.jpg
89	Duchamp's Punch	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Duchamp's+Punch	https://www.thecocktaildb.com/images/media/drink/g51naw1485084685.jpg
90	Damned if you do	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Damned+if+you+do	https://www.thecocktaildb.com/images/media/drink/ql7bmx1503565106.jpg
91	Dubonnet Cocktail	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Dubonnet+Cocktail	https://www.thecocktaildb.com/images/media/drink/pfz3hz1582483111.jpg
92	Drinking Chocolate	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Drinking+Chocolate	https://www.thecocktaildb.com/images/media/drink/u6jrdf1487603173.jpg
93	Death in the Afternoon	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Death+in+the+Afternoon	https://www.thecocktaildb.com/images/media/drink/y7s3rh1598719574.jpg
94	Egg Cream	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Egg+Cream	https://www.thecocktaildb.com/images/media/drink/mvis731484430445.jpg
95	Egg Nog #4	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Egg+Nog+#4	https://www.thecocktaildb.com/images/media/drink/wpspsy1468875747.jpg
96	English Highball	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=English+Highball	https://www.thecocktaildb.com/images/media/drink/dhvr7d1504519752.jpg
97	Espresso Martini	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Espresso+Martini	https://www.thecocktaildb.com/images/media/drink/n0sx531504372951.jpg
98	Espresso Rumtini	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Espresso+Rumtini	https://www.thecocktaildb.com/images/media/drink/acvf171561574403.jpg
99	Egg Nog - Healthy	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Egg+Nog+-+Healthy	https://www.thecocktaildb.com/images/media/drink/qxuppv1468875308.jpg
100	English Rose Cocktail	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=English+Rose+Cocktail	https://www.thecocktaildb.com/images/media/drink/yxwrpp1441208697.jpg
101	Elderflower Caipirinha	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Elderflower+Caipirinha	https://www.thecocktaildb.com/images/media/drink/dif7a31614006331.jpg
102	Egg-Nog - Classic Cooked	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Egg-Nog+-+Classic+Cooked	https://www.thecocktaildb.com/images/media/drink/quxsvt1468875505.jpg
103	Empellón Cocina's Fat-Washed Mezcal	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Empellón+Cocina's+Fat-Washed+Mezcal	https://www.thecocktaildb.com/images/media/drink/osgvxt1513595509.jpg
104	Frosé	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Frosé	https://www.thecocktaildb.com/images/media/drink/b4cadp1619695347.jpg
105	Frappé	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Frappé	https://www.thecocktaildb.com/images/media/drink/vqwryq1441245927.jpg
106	Foxy Lady	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Foxy+Lady	https://www.thecocktaildb.com/images/media/drink/r9cz3q1504519844.jpg
107	French 75	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=French+75	https://www.thecocktaildb.com/images/media/drink/hrxfbl1606773109.jpg
108	Figgy Thyme	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Figgy+Thyme	https://www.thecocktaildb.com/images/media/drink/pbw4e51606766578.jpg
109	Frisco Sour	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Frisco+Sour	https://www.thecocktaildb.com/images/media/drink/acuvjz1582482022.jpg
110	Fruit Shake	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Fruit+Shake	https://www.thecocktaildb.com/images/media/drink/q0fg2m1484430704.jpg
111	Fruit Cooler	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Fruit+Cooler	https://www.thecocktaildb.com/images/media/drink/i3tfn31484430499.jpg
112	Freddy Kruger	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Freddy+Kruger	https://www.thecocktaildb.com/images/media/drink/tuppuq1461866798.jpg
113	Funk and Soul	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Funk+and+Soul	https://www.thecocktaildb.com/images/media/drink/qtv83q1596015790.jpg
114	Fuzzy Asshole	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Fuzzy+Asshole	https://www.thecocktaildb.com/images/media/drink/wrvpuu1472667898.jpg
115	French Martini	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=French+Martini	https://www.thecocktaildb.com/images/media/drink/clth721504373134.jpg
116	French Negroni	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=French+Negroni	https://www.thecocktaildb.com/images/media/drink/x8lhp41513703167.jpg
117	Fahrenheit 5000	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Fahrenheit+5000	https://www.thecocktaildb.com/images/media/drink/tysssx1473344692.jpg
118	Flying Dutchman	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Flying+Dutchman	https://www.thecocktaildb.com/images/media/drink/mwko4q1582482903.jpg
119	Frozen Daiquiri	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Frozen+Daiquiri	https://www.thecocktaildb.com/images/media/drink/7oyrj91504884412.jpg
120	Fruit Flip-Flop	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Fruit+Flip-Flop	https://www.thecocktaildb.com/images/media/drink/nfdx6p1484430633.jpg
121	Flying Scotchman	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Flying+Scotchman	https://www.thecocktaildb.com/images/media/drink/q53l911582482518.jpg
122	French Connection	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=French+Connection	https://www.thecocktaildb.com/images/media/drink/zaqa381504368758.jpg
123	Flaming Dr. Pepper	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Flaming+Dr.+Pepper	https://www.thecocktaildb.com/images/media/drink/d30z931503565384.jpg
124	Flaming Lamborghini	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Flaming+Lamborghini	https://www.thecocktaildb.com/images/media/drink/yywpss1461866587.jpg
125	Flander's Flake-Out	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Flander's+Flake-Out	https://www.thecocktaildb.com/images/media/drink/sqvqrx1461866705.jpg
126	Frozen Mint Daiquiri	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Frozen+Mint+Daiquiri	https://www.thecocktaildb.com/images/media/drink/jrhn1q1504884469.jpg
127	Frozen Pineapple Daiquiri	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Frozen+Pineapple+Daiquiri	https://www.thecocktaildb.com/images/media/drink/k3aecd1582481679.jpg
128	GG	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=GG	https://www.thecocktaildb.com/images/media/drink/vyxwut1468875960.jpg
129	Gimlet	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Gimlet	https://www.thecocktaildb.com/images/media/drink/3xgldt1513707271.jpg
130	Godchild	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Godchild	https://www.thecocktaildb.com/images/media/drink/m5nhtr1504820829.jpg
131	Gin Fizz	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Gin+Fizz	https://www.thecocktaildb.com/images/media/drink/drtihp1606768397.jpg
132	Gin Sour	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Gin+Sour	https://www.thecocktaildb.com/images/media/drink/noxp7e1606769224.jpg
133	Gagliardo	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Gagliardo	https://www.thecocktaildb.com/images/media/drink/lyloe91487602877.jpg
134	Godmother	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Godmother	https://www.thecocktaildb.com/images/media/drink/quksqg1582582597.jpg
135	Godfather	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Godfather	https://www.thecocktaildb.com/images/media/drink/e5zgao1582582378.jpg
136	Gluehwein	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Gluehwein	https://www.thecocktaildb.com/images/media/drink/vuxwvt1468875418.jpg
137	Gin Tonic	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Gin+Tonic	https://www.thecocktaildb.com/images/media/drink/qcgz0t1643821443.jpg
138	Gin Toddy	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Gin+Toddy	https://www.thecocktaildb.com/images/media/drink/jxstwf1582582101.jpg
139	Gin Smash	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Gin+Smash	https://www.thecocktaildb.com/images/media/drink/iprva61606768774.jpg
140	Gin Daisy	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Gin+Daisy	https://www.thecocktaildb.com/images/media/drink/z6e22f1582581155.jpg
141	Gin Lemon	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Gin+Lemon	https://www.thecocktaildb.com/images/media/drink/yhzvk91643821739.jpg
142	Gin Sling	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Gin+Sling	https://www.thecocktaildb.com/images/media/drink/8cl9sm1582581761.jpg
143	Greyhound	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Greyhound	https://www.thecocktaildb.com/images/media/drink/g5upn41513706732.jpg
144	Gin Rickey	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Gin+Rickey	https://www.thecocktaildb.com/images/media/drink/s00d6f1504883945.jpg
145	Gin Squirt	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Gin+Squirt	https://www.thecocktaildb.com/images/media/drink/xrbhz61504883702.jpg
146	Grand Blue	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Grand+Blue	https://www.thecocktaildb.com/images/media/drink/vsrsqu1472761749.jpg
147	Gin Cooler	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Gin+Cooler	https://www.thecocktaildb.com/images/media/drink/678xt11582481163.jpg
148	Gin Swizzle	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Gin+Swizzle	https://www.thecocktaildb.com/images/media/drink/sybce31504884026.jpg
149	Grass Skirt	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Grass+Skirt	https://www.thecocktaildb.com/images/media/drink/qyvprp1473891585.jpg
150	Grasshopper	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Grasshopper	https://www.thecocktaildb.com/images/media/drink/aqm9el1504369613.jpg
151	Grim Reaper	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Grim+Reaper	https://www.thecocktaildb.com/images/media/drink/kztu161504883192.jpg
152	Gin and Soda	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Gin+and+Soda	https://www.thecocktaildb.com/images/media/drink/nzlyc81605905755.jpg
153	H.D.	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=H.D.	https://www.thecocktaildb.com/images/media/drink/upusyu1472667977.jpg
154	Honey Bee	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Honey+Bee	https://www.thecocktaildb.com/images/media/drink/vu8l7t1582475673.jpg
155	Hot Toddy	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Hot+Toddy	https://www.thecocktaildb.com/images/media/drink/ggx0lv1613942306.jpg
156	Herbal flame	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Herbal+flame	https://www.thecocktaildb.com/images/media/drink/rrstxv1441246184.jpg
157	Horse's Neck	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Horse's+Neck	https://www.thecocktaildb.com/images/media/drink/006k4e1504370092.jpg
158	Happy Skipper	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Happy+Skipper	https://www.thecocktaildb.com/images/media/drink/42w2g41487602448.jpg
159	Hunter's Moon	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Hunter's+Moon	https://www.thecocktaildb.com/images/media/drink/t0iugg1509556712.jpg
160	Halloween Punch	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Halloween+Punch	https://www.thecocktaildb.com/images/media/drink/7hcgyj1571687671.jpg
161	Havana Cocktail	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Havana+Cocktail	https://www.thecocktaildb.com/images/media/drink/59splc1504882899.jpg
162	Holloween Punch	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Holloween+Punch	https://www.thecocktaildb.com/images/media/drink/lfeoe41504888925.jpg
163	Homemade Kahlua	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Homemade+Kahlua	https://www.thecocktaildb.com/images/media/drink/uwtsst1441254025.jpg
164	Hot Creamy Bush	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Hot+Creamy+Bush	https://www.thecocktaildb.com/images/media/drink/spvrtp1472668037.jpg
165	Harvey Wallbanger	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Harvey+Wallbanger	https://www.thecocktaildb.com/images/media/drink/7os4gs1606854357.jpg
166	Hawaiian Cocktail	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Hawaiian+Cocktail	https://www.thecocktaildb.com/images/media/drink/ujoh9x1504882987.jpg
167	Hemingway Special	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Hemingway+Special	https://www.thecocktaildb.com/images/media/drink/jfcvps1504369888.jpg
168	Highland Fling Cocktail	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Highland+Fling+Cocktail	https://www.thecocktaildb.com/images/media/drink/0bkwca1492975553.jpg
169	Hot Chocolate to Die for	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Hot+Chocolate+to+Die+for	https://www.thecocktaildb.com/images/media/drink/0lrmjp1487603166.jpg
170	Ipamena	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Ipamena	https://www.thecocktaildb.com/images/media/drink/yswuwp1469090992.jpg
171	Ice Pick	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Ice+Pick	https://www.thecocktaildb.com/images/media/drink/ypsrqp1469091726.jpg
172	Iced Coffee	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Iced+Coffee	https://www.thecocktaildb.com/images/media/drink/ytprxy1454513855.jpg
173	Irish Cream	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Irish+Cream	https://www.thecocktaildb.com/images/media/drink/90etyl1504884699.jpg
174	Irish Coffee	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Irish+Coffee	https://www.thecocktaildb.com/images/media/drink/sywsqw1439906999.jpg
175	Irish Spring	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Irish+Spring	https://www.thecocktaildb.com/images/media/drink/sot8v41504884783.jpg
176	Imperial Fizz	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Imperial+Fizz	https://www.thecocktaildb.com/images/media/drink/zj1usl1504884548.jpg
177	Irish Russian	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Irish+Russian	https://www.thecocktaildb.com/images/media/drink/swqurw1454512730.jpg
178	Imperial Cocktail	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Imperial+Cocktail	https://www.thecocktaildb.com/images/media/drink/bcsj2e1487603625.jpg
179	Iced Coffee Fillip	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Iced+Coffee+Fillip	https://www.thecocktaildb.com/images/media/drink/sxtxrp1454514223.jpg
180	Irish Curdling Cow	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Irish+Curdling+Cow	https://www.thecocktaildb.com/images/media/drink/yrhutv1503563730.jpg
181	Jam Donut	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Jam+Donut	https://www.thecocktaildb.com/images/media/drink/uuytrp1474039804.jpg
182	Jitterbug	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Jitterbug	https://www.thecocktaildb.com/images/media/drink/wwqvrq1441245318.jpg
183	Jackhammer	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Jackhammer	https://www.thecocktaildb.com/images/media/drink/9von5j1504388896.jpg
184	Jelly Bean	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Jelly+Bean	https://www.thecocktaildb.com/images/media/drink/bglc6y1504388797.jpg
185	Jello shots	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Jello+shots	https://www.thecocktaildb.com/images/media/drink/l0smzo1504884904.jpg
186	Jamaica Kiss	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Jamaica+Kiss	https://www.thecocktaildb.com/images/media/drink/urpvvv1441249549.jpg
187	John Collins	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=John+Collins	https://www.thecocktaildb.com/images/media/drink/0t4bv71606854479.jpg
188	Japanese Fizz	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Japanese+Fizz	https://www.thecocktaildb.com/images/media/drink/37vzv11504884831.jpg
189	Jamaican Coffee	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Jamaican+Coffee	https://www.thecocktaildb.com/images/media/drink/xqptps1441247257.jpg
190	Just a Moonmint	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Just+a+Moonmint	https://www.thecocktaildb.com/images/media/drink/znald61487604035.jpg
191	Jewel Of The Nile	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Jewel+Of+The+Nile	https://www.thecocktaildb.com/images/media/drink/hx4nrb1504884947.jpg
192	Jack Rose Cocktail	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Jack+Rose+Cocktail	https://www.thecocktaildb.com/images/media/drink/uuqqrv1439907068.jpg
193	Jack's Vanilla Coke	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Jack's+Vanilla+Coke	https://www.thecocktaildb.com/images/media/drink/kjnt7z1504793319.jpg
194	Kir	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Kir	https://www.thecocktaildb.com/images/media/drink/apneom1504370294.jpg
195	Karsk	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Karsk	https://www.thecocktaildb.com/images/media/drink/808mxk1487602471.jpg
196	Kamikaze	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Kamikaze	https://www.thecocktaildb.com/images/media/drink/d7ff7u1606855412.jpg
197	Kir Royale	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Kir+Royale	https://www.thecocktaildb.com/images/media/drink/yt9i7n1504370388.jpg
198	Kiwi Lemon	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Kiwi+Lemon	https://www.thecocktaildb.com/images/media/drink/tpupvr1478251697.jpg
199	Kurant Tea	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Kurant+Tea	https://www.thecocktaildb.com/images/media/drink/xrsrpr1441247464.jpg
200	Kioki Coffee	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Kioki+Coffee	https://www.thecocktaildb.com/images/media/drink/uppqty1441247374.jpg
201	Kiwi Martini	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Kiwi+Martini	https://www.thecocktaildb.com/images/media/drink/bmxmyq1630407098.jpg
202	Kiss me Quick	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Kiss+me+Quick	https://www.thecocktaildb.com/images/media/drink/m7iaxu1504885119.jpg
203	Kool-Aid Shot	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Kool-Aid+Shot	https://www.thecocktaildb.com/images/media/drink/fegm621503564966.jpg
204	Kool First Aid	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Kool+First+Aid	https://www.thecocktaildb.com/images/media/drink/hfp6sv1503564824.jpg
205	Kentucky B And B	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Kentucky+B+And+B	https://www.thecocktaildb.com/images/media/drink/sqxsxp1478820236.jpg
206	Kentucky Colonel	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Kentucky+Colonel	https://www.thecocktaildb.com/images/media/drink/utqwpu1478820348.jpg
207	Kool-Aid Slammer	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Kool-Aid+Slammer	https://www.thecocktaildb.com/images/media/drink/kugu2m1504735473.jpg
208	Kiwi Papaya Smoothie	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Kiwi+Papaya+Smoothie	https://www.thecocktaildb.com/images/media/drink/jogv4w1487603571.jpg
209	Kill the cold Smoothie	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Kill+the+cold+Smoothie	https://www.thecocktaildb.com/images/media/drink/7j1z2e1487603414.jpg
210	Limeade	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Limeade	https://www.thecocktaildb.com/images/media/drink/5jdp5r1487603680.jpg
211	Lunch Box	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Lunch+Box	https://www.thecocktaildb.com/images/media/drink/qywpvt1454512546.jpg
212	Lemon Drop	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Lemon+Drop	https://www.thecocktaildb.com/images/media/drink/mtpxgk1504373297.jpg
213	Lemon Shot	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Lemon+Shot	https://www.thecocktaildb.com/images/media/drink/mx31hv1487602979.jpg
214	Long vodka	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Long+vodka	https://www.thecocktaildb.com/images/media/drink/9179i01503565212.jpg
215	Lassi Khara	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Lassi+Khara	https://www.thecocktaildb.com/images/media/drink/m1suzm1487603970.jpg
216	Lassi Raita	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Lassi+Raita	https://www.thecocktaildb.com/images/media/drink/s4x0qj1487603933.jpg
217	Lemouroudji	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Lemouroudji	https://www.thecocktaildb.com/images/media/drink/eirmo71487603745.jpg
218	Loch Lomond	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Loch+Lomond	https://www.thecocktaildb.com/images/media/drink/rpvtpr1468923881.jpg
219	London Town	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=London+Town	https://www.thecocktaildb.com/images/media/drink/rpsrqv1468923507.jpg
220	Lassi - Mango	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Lassi+-+Mango	https://www.thecocktaildb.com/images/media/drink/1bw6sd1487603816.jpg
221	Lassi - Sweet	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Lassi+-+Sweet	https://www.thecocktaildb.com/images/media/drink/9jeifz1487603885.jpg
222	Limona Corona	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Limona+Corona	https://www.thecocktaildb.com/images/media/drink/wwqrsw1441248662.jpg
223	Lord And Lady	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Lord+And+Lady	https://www.thecocktaildb.com/images/media/drink/quwrys1468923219.jpg
224	Lady Love Fizz	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Lady+Love+Fizz	https://www.thecocktaildb.com/images/media/drink/20d63k1504885263.jpg
225	Long Island Tea	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Long+Island+Tea	https://www.thecocktaildb.com/images/media/drink/nkwr4c1606770558.jpg
226	Lone Tree Cooler	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Lone+Tree+Cooler	https://www.thecocktaildb.com/images/media/drink/wsyqry1479298485.jpg
227	Lone Tree Cocktail	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Lone+Tree+Cocktail	https://www.thecocktaildb.com/images/media/drink/tsxpty1468923417.jpg
228	Lazy Coconut Paloma	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Lazy+Coconut+Paloma	https://www.thecocktaildb.com/images/media/drink/rytuex1598719770.jpg
229	Long Island Iced Tea	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Long+Island+Iced+Tea	https://www.thecocktaildb.com/images/media/drink/wx7hsg1504370510.jpg
230	Lemon Elderflower Spritzer	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Lemon+Elderflower+Spritzer	https://www.thecocktaildb.com/images/media/drink/125w0o1630407389.jpg
231	Lassi - A South Indian Drink	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Lassi+-+A+South+Indian+Drink	https://www.thecocktaildb.com/images/media/drink/iq6scx1487603980.jpg
232	Melya	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Melya	https://www.thecocktaildb.com/images/media/drink/xwtptq1441247579.jpg
233	Mojito	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Mojito	https://www.thecocktaildb.com/images/media/drink/metwgh1606770327.jpg
234	Mimosa	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Mimosa	https://www.thecocktaildb.com/images/media/drink/juhcuu1504370685.jpg
235	Mai Tai	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Mai+Tai	https://www.thecocktaildb.com/images/media/drink/twyrrp1439907470.jpg
236	Martini	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Martini	https://www.thecocktaildb.com/images/media/drink/71t8581504353095.jpg
237	Michelada	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Michelada	https://www.thecocktaildb.com/images/media/drink/u736bd1605907086.jpg
238	Manhattan	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Manhattan	https://www.thecocktaildb.com/images/media/drink/yk70e31606771240.jpg
239	Margarita	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Margarita	https://www.thecocktaildb.com/images/media/drink/5noda61589575158.jpg
240	Mint Julep	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Mint+Julep	https://www.thecocktaildb.com/images/media/drink/squyyq1439907312.jpg
241	Mudslinger	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Mudslinger	https://www.thecocktaildb.com/images/media/drink/hepk6h1504885554.jpg
242	Martinez 2	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Martinez+2	https://www.thecocktaildb.com/images/media/drink/fs6kiq1513708455.jpg
243	Moranguito	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Moranguito	https://www.thecocktaildb.com/images/media/drink/urpsyq1475667335.jpg
244	Miami Vice	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Miami+Vice	https://www.thecocktaildb.com/images/media/drink/qvuyqw1441208955.jpg
245	Moscow Mule	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Moscow+Mule	https://www.thecocktaildb.com/images/media/drink/3pylqc1504370988.jpg
246	Mulled Wine	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Mulled+Wine	https://www.thecocktaildb.com/images/media/drink/iuwi6h1504735724.jpg
247	Masala Chai	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Masala+Chai	https://www.thecocktaildb.com/images/media/drink/uyrpww1441246384.jpg
248	Munich Mule	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Munich+Mule	https://www.thecocktaildb.com/images/media/drink/rj55pl1582476101.jpg
249	Mocha-Berry	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Mocha-Berry	https://www.thecocktaildb.com/images/media/drink/vtwyyx1441246448.jpg
250	Mango Mojito	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Mango+Mojito	https://www.thecocktaildb.com/images/media/drink/wfqmgm1630406820.jpg
251	Mojito Extra	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Mojito+Extra	https://www.thecocktaildb.com/images/media/drink/vwxrsw1478251483.jpg
252	Monkey Gland	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Monkey+Gland	https://www.thecocktaildb.com/images/media/drink/94psp81504350690.jpg
253	Midnight Mint	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Midnight+Mint	https://www.thecocktaildb.com/images/media/drink/svuvrq1441208310.jpg
254	Mary Pickford	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Mary+Pickford	https://www.thecocktaildb.com/images/media/drink/f9erqb1504350557.jpg
255	Monkey Wrench	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Monkey+Wrench	https://www.thecocktaildb.com/images/media/drink/bw2noj1582473243.jpg
256	Mother's Milk	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Mother's+Milk	https://www.thecocktaildb.com/images/media/drink/7stuuh1504885399.jpg
257	Negroni	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Negroni	https://www.thecocktaildb.com/images/media/drink/qgdu971561574065.jpg
258	New York Sour	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=New+York+Sour	https://www.thecocktaildb.com/images/media/drink/61wgch1504882795.jpg
259	Nutty Irishman	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Nutty+Irishman	https://www.thecocktaildb.com/images/media/drink/xspupx1441248014.jpg
260	National Aquarium	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=National+Aquarium	https://www.thecocktaildb.com/images/media/drink/dlw0om1503565021.jpg
261	New York Lemonade	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=New+York+Lemonade	https://www.thecocktaildb.com/images/media/drink/b3n0ge1503565473.jpg
262	Nuked Hot Chocolate	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Nuked+Hot+Chocolate	https://www.thecocktaildb.com/images/media/drink/xcu6nb1487603142.jpg
263	Orgasm	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Orgasm	https://www.thecocktaildb.com/images/media/drink/vr6kle1504886114.jpg
264	Old Pal	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Old+Pal	https://www.thecocktaildb.com/images/media/drink/x03td31521761009.jpg
265	Orangeade	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Orangeade	https://www.thecocktaildb.com/images/media/drink/ytsxxw1441167732.jpg
266	Orange Whip	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Orange+Whip	https://www.thecocktaildb.com/images/media/drink/ttyrxr1454514759.jpg
267	Orange Crush	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Orange+Crush	https://www.thecocktaildb.com/images/media/drink/zvoics1504885926.jpg
268	Orange Oasis	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Orange+Oasis	https://www.thecocktaildb.com/images/media/drink/su1olx1582473812.jpg
269	Old Fashioned	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Old+Fashioned	https://www.thecocktaildb.com/images/media/drink/vrwquq1478252802.jpg
270	Oreo Mudslide	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Oreo+Mudslide	https://www.thecocktaildb.com/images/media/drink/tpwwut1468925017.jpg
271	Oatmeal Cookie	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Oatmeal+Cookie	https://www.thecocktaildb.com/images/media/drink/bsvmlg1515792693.jpg
272	Orange Push-up	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Orange+Push-up	https://www.thecocktaildb.com/images/media/drink/mgf0y91503565781.jpg
273	Orange Rosemary Collins	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Orange+Rosemary+Collins	https://www.thecocktaildb.com/images/media/drink/mokcas1604179977.jpg
274	Orange Scented Hot Chocolate	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Orange+Scented+Hot+Chocolate	https://www.thecocktaildb.com/images/media/drink/hdzwrh1487603131.jpg
275	Owen's Grandmother's Revenge	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Owen's+Grandmother's+Revenge	https://www.thecocktaildb.com/images/media/drink/0wt4uo1503565321.jpg
276	Paloma	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Paloma	https://www.thecocktaildb.com/images/media/drink/samm5j1513706393.jpg
277	Paradise	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Paradise	https://www.thecocktaildb.com/images/media/drink/ejozd71504351060.jpg
278	Pink Gin	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Pink+Gin	https://www.thecocktaildb.com/images/media/drink/qyr51e1504888618.jpg
279	Pegu Club	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Pegu+Club	https://www.thecocktaildb.com/images/media/drink/jfkemm1513703902.jpg
280	Pink Lady	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Pink+Lady	https://www.thecocktaildb.com/images/media/drink/5ia6j21504887829.jpg
281	Pink Moon	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Pink+Moon	https://www.thecocktaildb.com/images/media/drink/lnjoc81619696191.jpg
282	Penicillin	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Penicillin	https://www.thecocktaildb.com/images/media/drink/hc9b1a1521853096.jpg
283	Pisco Sour	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Pisco+Sour	https://www.thecocktaildb.com/images/media/drink/tsssur1439907622.jpg
284	Porto flip	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Porto+flip	https://www.thecocktaildb.com/images/media/drink/64x5j41504351518.jpg
285	Pina Colada	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Pina+Colada	https://www.thecocktaildb.com/images/media/drink/upgsue1668419912.jpg
286	Pink Penocha	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Pink+Penocha	https://www.thecocktaildb.com/images/media/drink/6vigjx1503564007.jpg
287	Pure Passion	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Pure+Passion	https://www.thecocktaildb.com/images/media/drink/4tymma1604179273.jpg
288	Popped cherry	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Popped+cherry	https://www.thecocktaildb.com/images/media/drink/sxvrwv1473344825.jpg
289	Poppy Cocktail	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Poppy+Cocktail	https://www.thecocktaildb.com/images/media/drink/cslw1w1504389915.jpg
290	Port Wine Flip	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Port+Wine+Flip	https://www.thecocktaildb.com/images/media/drink/vrprxu1441553844.jpg
291	Planter's Punch	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Planter's+Punch	https://www.thecocktaildb.com/images/media/drink/fdk8a31606854815.jpg
292	Pineapple Paloma	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Pineapple+Paloma	https://www.thecocktaildb.com/images/media/drink/pg8iw31593351601.jpg
293	Pornstar Martini	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Pornstar+Martini	https://www.thecocktaildb.com/images/media/drink/xjhjdf1630406071.jpg
294	Planter’s Punch	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Planter’s+Punch	https://www.thecocktaildb.com/images/media/drink/jn6o251643844541.jpg
295	Port And Starboard	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Port+And+Starboard	https://www.thecocktaildb.com/images/media/drink/wxvupx1441553911.jpg
296	Port Wine Cocktail	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Port+Wine+Cocktail	https://www.thecocktaildb.com/images/media/drink/qruprq1441553976.jpg
297	Pysch Vitamin Light	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Pysch+Vitamin+Light	https://www.thecocktaildb.com/images/media/drink/xsqsxw1441553580.jpg
298	Pink Panty Pulldowns	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Pink+Panty+Pulldowns	https://www.thecocktaildb.com/images/media/drink/squsuy1468926657.jpg
299	Passion Fruit Martini	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Passion+Fruit+Martini	https://www.thecocktaildb.com/images/media/drink/6trfve1582473527.jpg
300	Pineapple Gingerale Smoothie	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Pineapple+Gingerale+Smoothie	https://www.thecocktaildb.com/images/media/drink/eg9i1d1487603469.jpg
301	Quentin	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Quentin	https://www.thecocktaildb.com/images/media/drink/spxtqp1478963398.jpg
302	Queen Bee	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Queen+Bee	https://www.thecocktaildb.com/images/media/drink/rvvpxu1478963194.jpg
303	Quick F**K	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Quick+F**K	https://www.thecocktaildb.com/images/media/drink/wvtwpp1478963454.jpg
304	Quick-sand	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Quick-sand	https://www.thecocktaildb.com/images/media/drink/vprxqv1478963533.jpg
305	Queen Charlotte	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Queen+Charlotte	https://www.thecocktaildb.com/images/media/drink/vqruyt1478963249.jpg
306	Queen Elizabeth	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Queen+Elizabeth	https://www.thecocktaildb.com/images/media/drink/vpqspv1478963339.jpg
307	Quaker's Cocktail	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Quaker's+Cocktail	https://www.thecocktaildb.com/images/media/drink/yrqppx1478962314.jpg
308	Quarter Deck Cocktail	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Quarter+Deck+Cocktail	https://www.thecocktaildb.com/images/media/drink/qrwvps1478963017.jpg
309	Rose	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Rose	https://www.thecocktaildb.com/images/media/drink/8kxbvq1504371462.jpg
310	Radler	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Radler	https://www.thecocktaildb.com/images/media/drink/xz8igv1504888995.jpg
311	Rum Sour	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Rum+Sour	https://www.thecocktaildb.com/images/media/drink/bylfi21504886323.jpg
312	Rum Punch	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Rum+Punch	https://www.thecocktaildb.com/images/media/drink/wyrsxu1441554538.jpg
313	Rum Toddy	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Rum+Toddy	https://www.thecocktaildb.com/images/media/drink/athdk71504886286.jpg
314	Royal Fizz	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Royal+Fizz	https://www.thecocktaildb.com/images/media/drink/wrh44j1504390609.jpg
315	Rum Cooler	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Rum+Cooler	https://www.thecocktaildb.com/images/media/drink/2hgwsb1504888674.jpg
316	Rum Runner	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Rum+Runner	https://www.thecocktaildb.com/images/media/drink/vqws6t1504888857.jpg
317	Rusty Nail	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Rusty+Nail	https://www.thecocktaildb.com/images/media/drink/yqsvtw1478252982.jpg
318	Red Snapper	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Red+Snapper	https://www.thecocktaildb.com/images/media/drink/7p607y1504735343.jpg
319	Royal Bitch	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Royal+Bitch	https://www.thecocktaildb.com/images/media/drink/qupuyr1441210090.jpg
320	Royal Flush	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Royal+Flush	https://www.thecocktaildb.com/images/media/drink/7rnm8u1504888527.jpg
321	Rum Cobbler	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Rum+Cobbler	https://www.thecocktaildb.com/images/media/drink/5vh9ld1504390683.jpg
322	Ruby Tuesday	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Ruby+Tuesday	https://www.thecocktaildb.com/images/media/drink/qsyqqq1441553437.jpg
323	Rail Splitter	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Rail+Splitter	https://www.thecocktaildb.com/images/media/drink/stsuqq1441207660.jpg
324	Rosemary Blue	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Rosemary+Blue	https://www.thecocktaildb.com/images/media/drink/qwc5f91512406543.jpg
325	Ramos Gin Fizz	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Ramos+Gin+Fizz	https://www.thecocktaildb.com/images/media/drink/967t911643844053.jpg
326	Royal Gin Fizz	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Royal+Gin+Fizz	https://www.thecocktaildb.com/images/media/drink/pe1x1c1504735672.jpg
327	Rum Milk Punch	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Rum+Milk+Punch	https://www.thecocktaildb.com/images/media/drink/w64lqm1504888810.jpg
328	Raspberry Julep	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Raspberry+Julep	https://www.thecocktaildb.com/images/media/drink/hyztmx1598719265.jpg
329	Rum Screwdriver	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Rum+Screwdriver	https://www.thecocktaildb.com/images/media/drink/4c85zq1511782093.jpg
330	Raspberry Cooler	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Raspberry+Cooler	https://www.thecocktaildb.com/images/media/drink/suqyyx1441254346.jpg
331	Rum Old-fashioned	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Rum+Old-fashioned	https://www.thecocktaildb.com/images/media/drink/otn2011504820649.jpg
332	Russian Spring Punch	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Russian+Spring+Punch	https://www.thecocktaildb.com/images/media/drink/ctt20s1504373488.jpg
333	Radioactive Long Island Iced Tea	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Radioactive+Long+Island+Iced+Tea	https://www.thecocktaildb.com/images/media/drink/rdvqmh1503563512.jpg
334	Smut	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Smut	https://www.thecocktaildb.com/images/media/drink/rx8k8e1504365812.jpg
335	Spritz	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Spritz	https://www.thecocktaildb.com/images/media/drink/j9evx11504373665.jpg
336	Scooter	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Scooter	https://www.thecocktaildb.com/images/media/drink/twuptu1483388307.jpg
337	Sangria	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Sangria	https://www.thecocktaildb.com/images/media/drink/xrvxpp1441249280.jpg
338	Stinger	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Stinger	https://www.thecocktaildb.com/images/media/drink/2ahv791504352433.jpg
339	Sazerac	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Sazerac	https://www.thecocktaildb.com/images/media/drink/vvpxwy1439907208.jpg
340	Sidecar	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Sidecar	https://www.thecocktaildb.com/images/media/drink/x72sik1606854964.jpg
341	Snowday	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Snowday	https://www.thecocktaildb.com/images/media/drink/4n1ipk1614009624.jpg
342	Spice 75	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Spice+75	https://www.thecocktaildb.com/images/media/drink/0108c41576797064.jpg
343	Snowball	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Snowball	https://www.thecocktaildb.com/images/media/drink/7ibfs61504735416.jpg
344	Shot-gun	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Shot-gun	https://www.thecocktaildb.com/images/media/drink/2j1m881503563583.jpg
345	Salty Dog	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Salty+Dog	https://www.thecocktaildb.com/images/media/drink/4vfge01504890216.jpg
346	Stone Sour	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Stone+Sour	https://www.thecocktaildb.com/images/media/drink/vruvtp1472719895.jpg
347	Sea breeze	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Sea+breeze	https://www.thecocktaildb.com/images/media/drink/7rfuks1504371562.jpg
348	Scotch Sour	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Scotch+Sour	https://www.thecocktaildb.com/images/media/drink/0dnb6k1504890436.jpg
349	Sweet Tooth	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Sweet+Tooth	https://www.thecocktaildb.com/images/media/drink/j6rq6h1503563821.jpg
350	Screwdriver	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Screwdriver	https://www.thecocktaildb.com/images/media/drink/8xnyke1504352207.jpg
351	Sherry Flip	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Sherry+Flip	https://www.thecocktaildb.com/images/media/drink/qrryvq1478820428.jpg
352	Sol Y Sombra	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Sol+Y+Sombra	https://www.thecocktaildb.com/images/media/drink/3gz2vw1503425983.jpg
353	Shark Attack	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Shark+Attack	https://www.thecocktaildb.com/images/media/drink/uv96zr1504793256.jpg
354	San Francisco	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=San+Francisco	https://www.thecocktaildb.com/images/media/drink/szmj2d1504889961.jpg
355	Space Odyssey	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Space+Odyssey	https://www.thecocktaildb.com/images/media/drink/vxtjbx1504817842.jpg
356	Sherry Eggnog	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Sherry+Eggnog	https://www.thecocktaildb.com/images/media/drink/xwrpsv1478820541.jpg
357	Sweet Bananas	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Sweet+Bananas	https://www.thecocktaildb.com/images/media/drink/sxpcj71487603345.jpg
358	Sweet Sangria	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Sweet+Sangria	https://www.thecocktaildb.com/images/media/drink/uqqvsp1468924228.jpg
359	Thriller	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Thriller	https://www.thecocktaildb.com/images/media/drink/rvuswq1461867714.jpg
360	The Galah	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=The+Galah	https://www.thecocktaildb.com/images/media/drink/sy7y6r1614775067.jpg
361	Tia-Maria	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Tia-Maria	https://www.thecocktaildb.com/images/media/drink/sih81u1504367097.jpg
362	Tipperary	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Tipperary	https://www.thecocktaildb.com/images/media/drink/b522ek1521761610.jpg
363	Turkeyball	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Turkeyball	https://www.thecocktaildb.com/images/media/drink/rxurpr1441554292.jpg
364	Texas Sling	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Texas+Sling	https://www.thecocktaildb.com/images/media/drink/ypl13s1504890158.jpg
365	Thai Coffee	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Thai+Coffee	https://www.thecocktaildb.com/images/media/drink/wquwxs1441247025.jpg
366	Tom Collins	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Tom+Collins	https://www.thecocktaildb.com/images/media/drink/7cll921606854636.jpg
367	Tomato Tang	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Tomato+Tang	https://www.thecocktaildb.com/images/media/drink/869qr81487603278.jpg
368	Talos Coffee	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Talos+Coffee	https://www.thecocktaildb.com/images/media/drink/rswqpy1441246518.jpg
369	Tennesee Mud	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Tennesee+Mud	https://www.thecocktaildb.com/images/media/drink/txruqv1441245770.jpg
370	Tequila Fizz	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Tequila+Fizz	https://www.thecocktaildb.com/images/media/drink/2bcase1504889637.jpg
371	Tequila Sour	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Tequila+Sour	https://www.thecocktaildb.com/images/media/drink/ek0mlq1504820601.jpg
372	Thai Iced Tea	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Thai+Iced+Tea	https://www.thecocktaildb.com/images/media/drink/trvwpu1441245568.jpg
373	The Last Word	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=The+Last+Word	https://www.thecocktaildb.com/images/media/drink/91oule1513702624.jpg
374	Turf Cocktail	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Turf+Cocktail	https://www.thecocktaildb.com/images/media/drink/utypqq1441554367.jpg
375	The Laverstoke	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=The+Laverstoke	https://www.thecocktaildb.com/images/media/drink/6xfj5t1517748412.jpg
376	Tequila Slammer	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Tequila+Slammer	https://www.thecocktaildb.com/images/media/drink/43uhr51551451311.jpg
377	Tequila Sunrise	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Tequila+Sunrise	https://www.thecocktaildb.com/images/media/drink/quqyqp1480879103.jpg
378	The Philosopher	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=The+Philosopher	https://www.thecocktaildb.com/images/media/drink/sp8hkp1596017787.jpg
379	Tuxedo Cocktail	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Tuxedo+Cocktail	https://www.thecocktaildb.com/images/media/drink/4u0nbl1504352551.jpg
380	Tequila Surprise	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Tequila+Surprise	https://www.thecocktaildb.com/images/media/drink/8189p51504735581.jpg
381	Thai Iced Coffee	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Thai+Iced+Coffee	https://www.thecocktaildb.com/images/media/drink/rqpypv1441245650.jpg
382	The Jimmy Conway	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=The+Jimmy+Conway	https://www.thecocktaildb.com/images/media/drink/wbcvyo1535794478.jpg
383	Texas Rattlesnake	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Texas+Rattlesnake	https://www.thecocktaildb.com/images/media/drink/rtohqp1504889750.jpg
384	Vesper	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Vesper	https://www.thecocktaildb.com/images/media/drink/mtdxpa1504374514.jpg
385	Victor	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Victor	https://www.thecocktaildb.com/images/media/drink/voapgc1492976416.jpg
386	Vampiro	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Vampiro	https://www.thecocktaildb.com/images/media/drink/yfhn371504374246.jpg
387	Vesuvio	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Vesuvio	https://www.thecocktaildb.com/images/media/drink/26cq601492976203.jpg
388	Veteran	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Veteran	https://www.thecocktaildb.com/images/media/drink/iwml9t1492976255.jpg
389	Van Vleet	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Van+Vleet	https://www.thecocktaildb.com/images/media/drink/fgq2bl1492975771.jpg
390	Vodka Fizz	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Vodka+Fizz	https://www.thecocktaildb.com/images/media/drink/xwxyux1441254243.jpg
391	Vodka Lemon	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Vodka+Lemon	https://www.thecocktaildb.com/images/media/drink/mql55h1643820632.jpg
392	Vodka Slime	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Vodka+Slime	https://www.thecocktaildb.com/images/media/drink/apex461643588115.jpg
393	Vodka Tonic	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Vodka+Tonic	https://www.thecocktaildb.com/images/media/drink/9koz3f1643821062.jpg
394	Vodka Martini	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Vodka+Martini	https://www.thecocktaildb.com/images/media/drink/qyxrqw1439906528.jpg
395	Vodka Russian	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Vodka+Russian	https://www.thecocktaildb.com/images/media/drink/rpttur1454515129.jpg
396	Vermouth Cassis	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Vermouth+Cassis	https://www.thecocktaildb.com/images/media/drink/tswpxx1441554674.jpg
397	Victory Collins	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Victory+Collins	https://www.thecocktaildb.com/images/media/drink/lx0lvs1492976619.jpg
398	Vodka And Tonic	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Vodka+And+Tonic	https://www.thecocktaildb.com/images/media/drink/lmj2yt1504820500.jpg
399	Valencia Cocktail	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Valencia+Cocktail	https://www.thecocktaildb.com/images/media/drink/9myuc11492975640.jpg
400	Whisky Mac	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Whisky+Mac	https://www.thecocktaildb.com/images/media/drink/yvvwys1461867858.jpg
401	White Lady	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=White+Lady	https://www.thecocktaildb.com/images/media/drink/jofsaz1504352991.jpg
402	Wine Punch	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Wine+Punch	https://www.thecocktaildb.com/images/media/drink/txustu1473344310.jpg
403	Wine Cooler	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Wine+Cooler	https://www.thecocktaildb.com/images/media/drink/yutxtv1473344210.jpg
404	Winter Rita	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Winter+Rita	https://www.thecocktaildb.com/images/media/drink/fwpd0v1614006733.jpg
405	Whiskey Sour	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Whiskey+Sour	https://www.thecocktaildb.com/images/media/drink/hbkfsh1589574990.jpg
406	White Russian	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=White+Russian	https://www.thecocktaildb.com/images/media/drink/vsrupw1472405732.jpg
407	Winter Paloma	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Winter+Paloma	https://www.thecocktaildb.com/images/media/drink/u5f0pz1614007748.jpg
408	White Wine Sangria	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=White+Wine+Sangria	https://www.thecocktaildb.com/images/media/drink/hnuod91587851576.jpg
409	Whitecap Margarita	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Whitecap+Margarita	https://www.thecocktaildb.com/images/media/drink/srpxxp1441209622.jpg
410	Waikiki Beachcomber	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Waikiki+Beachcomber	https://www.thecocktaildb.com/images/media/drink/ysuqus1441208583.jpg
411	Yellow Bird	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Yellow+Bird	https://www.thecocktaildb.com/images/media/drink/2t9r6w1504374811.jpg
412	Yoghurt Cooler	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Yoghurt+Cooler	https://www.thecocktaildb.com/images/media/drink/trttrv1441254466.jpg
413	Zorro	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Zorro	https://www.thecocktaildb.com/images/media/drink/kvvd4z1485621283.jpg
414	Zinger	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Zinger	https://www.thecocktaildb.com/images/media/drink/iixv4l1485620014.jpg
415	Zoksel	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Zoksel	https://www.thecocktaildb.com/images/media/drink/ft8ed01485620930.jpg
416	Zombie	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Zombie	https://www.thecocktaildb.com/images/media/drink/2en3jk1509557725.jpg
417	Zambeer	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Zambeer	https://www.thecocktaildb.com/images/media/drink/bje5401485619578.jpg
418	Zorbatini	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Zorbatini	https://www.thecocktaildb.com/images/media/drink/wtkqgb1485621155.jpg
419	Zenmeister	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Zenmeister	https://www.thecocktaildb.com/images/media/drink/qyuvsu1479209462.jpg
420	Zipperhead	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Zipperhead	https://www.thecocktaildb.com/images/media/drink/r2qzhu1485620235.jpg
421	Zima Blaster	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Zima+Blaster	https://www.thecocktaildb.com/images/media/drink/1wifuv1485619797.jpg
422	Zizi Coin-coin	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Zizi+Coin-coin	https://www.thecocktaildb.com/images/media/drink/0fbo2t1485620752.jpg
423	Zimadori Zinger	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Zimadori+Zinger	https://www.thecocktaildb.com/images/media/drink/bw8gzx1485619920.jpg
424	Zippy's Revenge	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Zippy's+Revenge	https://www.thecocktaildb.com/images/media/drink/1sqm7n1485620312.jpg
425	Ziemes Martini Apfelsaft	https://www.thecocktaildb.com/api/json/v1/1/search.php?s=Ziemes+Martini+Apfelsaft	https://www.thecocktaildb.com/images/media/drink/xnzr2p1485619687.jpg
\.


--
-- Data for Name: glasses; Type: TABLE DATA; Schema: public; Owner: matt
--

COPY public.glasses (id, name) FROM stdin;
\.


--
-- Data for Name: ingredients; Type: TABLE DATA; Schema: public; Owner: matt
--

COPY public.ingredients (id, name) FROM stdin;
1	Light Rum
2	Applejack
3	Gin
4	Dark Rum
5	Sweet Vermouth
6	Strawberry Schnapps
7	Scotch
8	Apricot Brandy
9	Triple Sec
10	Southern Comfort
11	Orange Bitters
12	Brandy
13	Lemon Vodka
14	Blended Whiskey
15	Dry Vermouth
16	Amaretto
17	Tea
18	Champagne
19	Coffee Liqueur
20	Bourbon
21	Tequila
22	Vodka
23	Añejo Rum
24	Bitters
25	Sugar
26	Kahlua
27	Demerara Sugar
28	Dubonnet Rouge
29	Watermelon
30	Lime Juice
31	Irish Whiskey
32	Apple Brandy
33	Carbonated Water
34	Cherry Brandy
35	Creme De Cacao
36	Grenadine
37	Port
38	Coffee Brandy
39	Red Wine
40	Rum
41	Grapefruit Juice
42	Ricard
43	Sherry
44	Cognac
45	Sloe Gin
46	Apple Juice
47	Pineapple Juice
48	Lemon Juice
49	Sugar Syrup
50	Milk
51	Strawberries
52	Chocolate Syrup
53	Yoghurt
54	Mango
55	Ginger
56	Lime
57	Cantaloupe
58	Berries
59	Grapes
60	Kiwi
61	Tomato Juice
62	Cocoa Powder
63	Chocolate
64	Heavy Cream
65	Galliano
66	Peach Vodka
67	Ouzo
68	Coffee
69	Spiced Rum
70	Water
71	Espresso
72	Angelica Root
73	Orange
74	Cranberries
75	Johnnie Walker
76	Apple Cider
77	Everclear
78	Cranberry Juice
79	Egg Yolk
80	Egg
81	Grape Juice
82	Peach Nectar
83	Lemon
84	Firewater
85	Lemonade
86	Lager
87	Whiskey
88	Absolut Citron
89	Pisco
90	Irish Cream
91	Ale
92	Chocolate Liqueur
93	Midori Melon Liqueur
94	Sambuca
95	Cider
96	Sprite
97	7-Up
98	Blackberry Brandy
99	Peppermint Schnapps
100	Creme De Cassis
\.


--
-- Data for Name: user_ingredients; Type: TABLE DATA; Schema: public; Owner: matt
--

COPY public.user_ingredients (id, user_id, ingredient_id) FROM stdin;
2	1	97
3	1	88
7	1	98
8	1	23
10	1	33
11	1	27
12	1	52
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: matt
--

COPY public.users (id, username, password, email) FROM stdin;
1	alice	$2b$12$QpPX9nY77E9xZ1xFxzRYXubBV/qJLRi6X8fk2GrUY6qGA.0tF8naK	alice@test.com
2	bob	$2b$12$4710xsJAOG9Lmw3beTSET.STBTsboYrl7j.40bsVmKTn5FPkuWjD.	bob@test.com
\.


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: matt
--

SELECT pg_catalog.setval('public.comments_id_seq', 1, false);


--
-- Name: drink_ingredients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: matt
--

SELECT pg_catalog.setval('public.drink_ingredients_id_seq', 969, true);


--
-- Name: drinks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: matt
--

SELECT pg_catalog.setval('public.drinks_id_seq', 425, true);


--
-- Name: glasses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: matt
--

SELECT pg_catalog.setval('public.glasses_id_seq', 1, false);


--
-- Name: ingredients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: matt
--

SELECT pg_catalog.setval('public.ingredients_id_seq', 100, true);


--
-- Name: user_ingredients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: matt
--

SELECT pg_catalog.setval('public.user_ingredients_id_seq', 12, true);


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
-- Name: user_ingredients user_ingredients_pkey; Type: CONSTRAINT; Schema: public; Owner: matt
--

ALTER TABLE ONLY public.user_ingredients
    ADD CONSTRAINT user_ingredients_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: matt
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


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
-- Name: user_ingredients user_ingredients_ingredient_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: matt
--

ALTER TABLE ONLY public.user_ingredients
    ADD CONSTRAINT user_ingredients_ingredient_id_fkey FOREIGN KEY (ingredient_id) REFERENCES public.ingredients(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: user_ingredients user_ingredients_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: matt
--

ALTER TABLE ONLY public.user_ingredients
    ADD CONSTRAINT user_ingredients_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

