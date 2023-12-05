PGDMP                         {            postgres    15.4    15.3 W    �           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                      false            �           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                      false            �           0    0 
   SEARCHPATH 
   SEARCHPATH     8   SELECT pg_catalog.set_config('search_path', '', false);
                      false            �           1262    5    postgres    DATABASE     s   CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE_PROVIDER = libc LOCALE = 'en_US.utf8';
    DROP DATABASE postgres;
                azure_pg_admin    false            �           0    0    DATABASE postgres    COMMENT     N   COMMENT ON DATABASE postgres IS 'default administrative connection database';
                   azure_pg_admin    false    4054            	            2615    24832    toy    SCHEMA        CREATE SCHEMA toy;
    DROP SCHEMA toy;
                mythicalman    false            �            1259    24868 	   accessory    TABLE     �   CREATE TABLE toy.accessory (
    id integer NOT NULL,
    accessoryname character varying(40),
    price money,
    discription character varying(40),
    bodypart_id integer
);
    DROP TABLE toy.accessory;
       toy         heap    mythicalman    false    9            �            1259    24867    accessory_id_seq    SEQUENCE     �   CREATE SEQUENCE toy.accessory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE toy.accessory_id_seq;
       toy          mythicalman    false    232    9            �           0    0    accessory_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE toy.accessory_id_seq OWNED BY toy.accessory.id;
          toy          mythicalman    false    231            �            1259    24861    bodypart    TABLE     [   CREATE TABLE toy.bodypart (
    id integer NOT NULL,
    partname character varying(40)
);
    DROP TABLE toy.bodypart;
       toy         heap    mythicalman    false    9            �            1259    24860    bodypart_id_seq    SEQUENCE     �   CREATE SEQUENCE toy.bodypart_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE toy.bodypart_id_seq;
       toy          mythicalman    false    230    9            �           0    0    bodypart_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE toy.bodypart_id_seq OWNED BY toy.bodypart.id;
          toy          mythicalman    false    229            �            1259    24919 	   cart_item    TABLE     �   CREATE TABLE toy.cart_item (
    id integer NOT NULL,
    customer_id integer NOT NULL,
    kit_id integer NOT NULL,
    quantity integer NOT NULL,
    save_for_later boolean
);
    DROP TABLE toy.cart_item;
       toy         heap    mythicalman    false    9            �            1259    24918    cart_item_id_seq    SEQUENCE     �   CREATE SEQUENCE toy.cart_item_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 $   DROP SEQUENCE toy.cart_item_id_seq;
       toy          mythicalman    false    9    238            �           0    0    cart_item_id_seq    SEQUENCE OWNED BY     ?   ALTER SEQUENCE toy.cart_item_id_seq OWNED BY toy.cart_item.id;
          toy          mythicalman    false    237            �            1259    24842    creature    TABLE     �   CREATE TABLE toy.creature (
    id integer NOT NULL,
    creaturename character varying(40),
    suggestedprice money,
    discription character varying(200)
);
    DROP TABLE toy.creature;
       toy         heap    mythicalman    false    9            �            1259    24841    creature_id_seq    SEQUENCE     �   CREATE SEQUENCE toy.creature_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE toy.creature_id_seq;
       toy          mythicalman    false    226    9            �           0    0    creature_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE toy.creature_id_seq OWNED BY toy.creature.id;
          toy          mythicalman    false    225            �            1259    24897    customer    TABLE     �   CREATE TABLE toy.customer (
    id integer NOT NULL,
    useremail character varying(120) NOT NULL,
    firstname character varying(80),
    surname character varying(80),
    customer_role_id integer
);
    DROP TABLE toy.customer;
       toy         heap    mythicalman    false    9            �            1259    24896    customer_id_seq    SEQUENCE     �   CREATE SEQUENCE toy.customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 #   DROP SEQUENCE toy.customer_id_seq;
       toy          mythicalman    false    236    9            �           0    0    customer_id_seq    SEQUENCE OWNED BY     =   ALTER SEQUENCE toy.customer_id_seq OWNED BY toy.customer.id;
          toy          mythicalman    false    235            �            1259    32789    customer_role    TABLE     q   CREATE TABLE toy.customer_role (
    id integer NOT NULL,
    role_description character varying(40) NOT NULL
);
    DROP TABLE toy.customer_role;
       toy         heap    mythicalman    false    9            �            1259    32788    customer_role_id_seq    SEQUENCE     �   CREATE SEQUENCE toy.customer_role_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE toy.customer_role_id_seq;
       toy          mythicalman    false    9    244            �           0    0    customer_role_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE toy.customer_role_id_seq OWNED BY toy.customer_role.id;
          toy          mythicalman    false    243            �            1259    24849    kit    TABLE     �   CREATE TABLE toy.kit (
    id integer NOT NULL,
    kitname character varying(40),
    creature_id integer,
    shoulddisplay boolean,
    creator_id integer,
    thumbnail_path character varying(200)
);
    DROP TABLE toy.kit;
       toy         heap    mythicalman    false    9            �            1259    24880    kit_accessory    TABLE     �   CREATE TABLE toy.kit_accessory (
    id integer NOT NULL,
    kit_id integer NOT NULL,
    acc_id integer NOT NULL,
    qty integer NOT NULL
);
    DROP TABLE toy.kit_accessory;
       toy         heap    mythicalman    false    9            �            1259    24879    kit_accessory_id_seq    SEQUENCE     �   CREATE SEQUENCE toy.kit_accessory_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE toy.kit_accessory_id_seq;
       toy          mythicalman    false    234    9            �           0    0    kit_accessory_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE toy.kit_accessory_id_seq OWNED BY toy.kit_accessory.id;
          toy          mythicalman    false    233            �            1259    24848 
   kit_id_seq    SEQUENCE        CREATE SEQUENCE toy.kit_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
    DROP SEQUENCE toy.kit_id_seq;
       toy          mythicalman    false    9    228            �           0    0 
   kit_id_seq    SEQUENCE OWNED BY     3   ALTER SEQUENCE toy.kit_id_seq OWNED BY toy.kit.id;
          toy          mythicalman    false    227            �            1259    24936    request    TABLE     �   CREATE TABLE toy.request (
    id integer NOT NULL,
    customer_id integer NOT NULL,
    requestdate timestamp without time zone
);
    DROP TABLE toy.request;
       toy         heap    mythicalman    false    9            �            1259    24935    request_id_seq    SEQUENCE     �   CREATE SEQUENCE toy.request_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 "   DROP SEQUENCE toy.request_id_seq;
       toy          mythicalman    false    9    240            �           0    0    request_id_seq    SEQUENCE OWNED BY     ;   ALTER SEQUENCE toy.request_id_seq OWNED BY toy.request.id;
          toy          mythicalman    false    239            �            1259    24948    request_items    TABLE     �   CREATE TABLE toy.request_items (
    id integer NOT NULL,
    request_id integer NOT NULL,
    kit_id integer NOT NULL,
    quantity integer NOT NULL,
    request_price money
);
    DROP TABLE toy.request_items;
       toy         heap    mythicalman    false    9            �            1259    24947    request_items_id_seq    SEQUENCE     �   CREATE SEQUENCE toy.request_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE toy.request_items_id_seq;
       toy          mythicalman    false    242    9            �           0    0    request_items_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE toy.request_items_id_seq OWNED BY toy.request_items.id;
          toy          mythicalman    false    241            	           2604    24871    accessory id    DEFAULT     f   ALTER TABLE ONLY toy.accessory ALTER COLUMN id SET DEFAULT nextval('toy.accessory_id_seq'::regclass);
 8   ALTER TABLE toy.accessory ALTER COLUMN id DROP DEFAULT;
       toy          mythicalman    false    231    232    232                       2604    24864    bodypart id    DEFAULT     d   ALTER TABLE ONLY toy.bodypart ALTER COLUMN id SET DEFAULT nextval('toy.bodypart_id_seq'::regclass);
 7   ALTER TABLE toy.bodypart ALTER COLUMN id DROP DEFAULT;
       toy          mythicalman    false    230    229    230                       2604    24922    cart_item id    DEFAULT     f   ALTER TABLE ONLY toy.cart_item ALTER COLUMN id SET DEFAULT nextval('toy.cart_item_id_seq'::regclass);
 8   ALTER TABLE toy.cart_item ALTER COLUMN id DROP DEFAULT;
       toy          mythicalman    false    238    237    238                       2604    24845    creature id    DEFAULT     d   ALTER TABLE ONLY toy.creature ALTER COLUMN id SET DEFAULT nextval('toy.creature_id_seq'::regclass);
 7   ALTER TABLE toy.creature ALTER COLUMN id DROP DEFAULT;
       toy          mythicalman    false    226    225    226                       2604    24900    customer id    DEFAULT     d   ALTER TABLE ONLY toy.customer ALTER COLUMN id SET DEFAULT nextval('toy.customer_id_seq'::regclass);
 7   ALTER TABLE toy.customer ALTER COLUMN id DROP DEFAULT;
       toy          mythicalman    false    236    235    236                       2604    32792    customer_role id    DEFAULT     n   ALTER TABLE ONLY toy.customer_role ALTER COLUMN id SET DEFAULT nextval('toy.customer_role_id_seq'::regclass);
 <   ALTER TABLE toy.customer_role ALTER COLUMN id DROP DEFAULT;
       toy          mythicalman    false    244    243    244                       2604    24852    kit id    DEFAULT     Z   ALTER TABLE ONLY toy.kit ALTER COLUMN id SET DEFAULT nextval('toy.kit_id_seq'::regclass);
 2   ALTER TABLE toy.kit ALTER COLUMN id DROP DEFAULT;
       toy          mythicalman    false    227    228    228            
           2604    24883    kit_accessory id    DEFAULT     n   ALTER TABLE ONLY toy.kit_accessory ALTER COLUMN id SET DEFAULT nextval('toy.kit_accessory_id_seq'::regclass);
 <   ALTER TABLE toy.kit_accessory ALTER COLUMN id DROP DEFAULT;
       toy          mythicalman    false    234    233    234                       2604    24939 
   request id    DEFAULT     b   ALTER TABLE ONLY toy.request ALTER COLUMN id SET DEFAULT nextval('toy.request_id_seq'::regclass);
 6   ALTER TABLE toy.request ALTER COLUMN id DROP DEFAULT;
       toy          mythicalman    false    239    240    240                       2604    24951    request_items id    DEFAULT     n   ALTER TABLE ONLY toy.request_items ALTER COLUMN id SET DEFAULT nextval('toy.request_items_id_seq'::regclass);
 <   ALTER TABLE toy.request_items ALTER COLUMN id DROP DEFAULT;
       toy          mythicalman    false    241    242    242            �          0    24868 	   accessory 
   TABLE DATA                 toy          mythicalman    false    232   7]       �          0    24861    bodypart 
   TABLE DATA                 toy          mythicalman    false    230   �]       �          0    24919 	   cart_item 
   TABLE DATA                 toy          mythicalman    false    238   L^       �          0    24842    creature 
   TABLE DATA                 toy          mythicalman    false    226   �^       �          0    24897    customer 
   TABLE DATA                 toy          mythicalman    false    236   [_       �          0    32789    customer_role 
   TABLE DATA                 toy          mythicalman    false    244   c`       �          0    24849    kit 
   TABLE DATA                 toy          mythicalman    false    228   �`       �          0    24880    kit_accessory 
   TABLE DATA                 toy          mythicalman    false    234   �a       �          0    24936    request 
   TABLE DATA                 toy          mythicalman    false    240   }b       �          0    24948    request_items 
   TABLE DATA                 toy          mythicalman    false    242   e       �           0    0    accessory_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('toy.accessory_id_seq', 1, false);
          toy          mythicalman    false    231            �           0    0    bodypart_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('toy.bodypart_id_seq', 1, false);
          toy          mythicalman    false    229            �           0    0    cart_item_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('toy.cart_item_id_seq', 5, true);
          toy          mythicalman    false    237            �           0    0    creature_id_seq    SEQUENCE SET     ;   SELECT pg_catalog.setval('toy.creature_id_seq', 1, false);
          toy          mythicalman    false    225            �           0    0    customer_id_seq    SEQUENCE SET     :   SELECT pg_catalog.setval('toy.customer_id_seq', 2, true);
          toy          mythicalman    false    235            �           0    0    customer_role_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('toy.customer_role_id_seq', 1, false);
          toy          mythicalman    false    243            �           0    0    kit_accessory_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('toy.kit_accessory_id_seq', 5, true);
          toy          mythicalman    false    233            �           0    0 
   kit_id_seq    SEQUENCE SET     6   SELECT pg_catalog.setval('toy.kit_id_seq', 1, false);
          toy          mythicalman    false    227            �           0    0    request_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('toy.request_id_seq', 2, true);
          toy          mythicalman    false    239            �           0    0    request_items_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('toy.request_items_id_seq', 107, true);
          toy          mythicalman    false    241                       2606    24873    accessory accessory_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY toy.accessory
    ADD CONSTRAINT accessory_pkey PRIMARY KEY (id);
 ?   ALTER TABLE ONLY toy.accessory DROP CONSTRAINT accessory_pkey;
       toy            mythicalman    false    232                       2606    24866    bodypart bodypart_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY toy.bodypart
    ADD CONSTRAINT bodypart_pkey PRIMARY KEY (id);
 =   ALTER TABLE ONLY toy.bodypart DROP CONSTRAINT bodypart_pkey;
       toy            mythicalman    false    230                       2606    24924    cart_item cart_item_pkey 
   CONSTRAINT     S   ALTER TABLE ONLY toy.cart_item
    ADD CONSTRAINT cart_item_pkey PRIMARY KEY (id);
 ?   ALTER TABLE ONLY toy.cart_item DROP CONSTRAINT cart_item_pkey;
       toy            mythicalman    false    238                       2606    24847    creature creature_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY toy.creature
    ADD CONSTRAINT creature_pkey PRIMARY KEY (id);
 =   ALTER TABLE ONLY toy.creature DROP CONSTRAINT creature_pkey;
       toy            mythicalman    false    226                       2606    24902    customer customer_pkey 
   CONSTRAINT     Q   ALTER TABLE ONLY toy.customer
    ADD CONSTRAINT customer_pkey PRIMARY KEY (id);
 =   ALTER TABLE ONLY toy.customer DROP CONSTRAINT customer_pkey;
       toy            mythicalman    false    236            #           2606    32794     customer_role customer_role_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY toy.customer_role
    ADD CONSTRAINT customer_role_pkey PRIMARY KEY (id);
 G   ALTER TABLE ONLY toy.customer_role DROP CONSTRAINT customer_role_pkey;
       toy            mythicalman    false    244                       2606    24885     kit_accessory kit_accessory_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY toy.kit_accessory
    ADD CONSTRAINT kit_accessory_pkey PRIMARY KEY (id);
 G   ALTER TABLE ONLY toy.kit_accessory DROP CONSTRAINT kit_accessory_pkey;
       toy            mythicalman    false    234                       2606    24854    kit kit_pkey 
   CONSTRAINT     G   ALTER TABLE ONLY toy.kit
    ADD CONSTRAINT kit_pkey PRIMARY KEY (id);
 3   ALTER TABLE ONLY toy.kit DROP CONSTRAINT kit_pkey;
       toy            mythicalman    false    228            !           2606    24953     request_items request_items_pkey 
   CONSTRAINT     [   ALTER TABLE ONLY toy.request_items
    ADD CONSTRAINT request_items_pkey PRIMARY KEY (id);
 G   ALTER TABLE ONLY toy.request_items DROP CONSTRAINT request_items_pkey;
       toy            mythicalman    false    242                       2606    24941    request request_pkey 
   CONSTRAINT     O   ALTER TABLE ONLY toy.request
    ADD CONSTRAINT request_pkey PRIMARY KEY (id);
 ;   ALTER TABLE ONLY toy.request DROP CONSTRAINT request_pkey;
       toy            mythicalman    false    240            &           2606    24874 $   accessory accessory_bodypart_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY toy.accessory
    ADD CONSTRAINT accessory_bodypart_id_fkey FOREIGN KEY (bodypart_id) REFERENCES toy.bodypart(id);
 K   ALTER TABLE ONLY toy.accessory DROP CONSTRAINT accessory_bodypart_id_fkey;
       toy          mythicalman    false    3861    232    230            *           2606    24925 $   cart_item cart_item_customer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY toy.cart_item
    ADD CONSTRAINT cart_item_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES toy.customer(id);
 K   ALTER TABLE ONLY toy.cart_item DROP CONSTRAINT cart_item_customer_id_fkey;
       toy          mythicalman    false    236    238    3867            +           2606    24930    cart_item cart_item_kit_id_fkey    FK CONSTRAINT     u   ALTER TABLE ONLY toy.cart_item
    ADD CONSTRAINT cart_item_kit_id_fkey FOREIGN KEY (kit_id) REFERENCES toy.kit(id);
 F   ALTER TABLE ONLY toy.cart_item DROP CONSTRAINT cart_item_kit_id_fkey;
       toy          mythicalman    false    3859    228    238            )           2606    32796 '   customer customer_customer_role_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY toy.customer
    ADD CONSTRAINT customer_customer_role_id_fkey FOREIGN KEY (customer_role_id) REFERENCES toy.customer_role(id);
 N   ALTER TABLE ONLY toy.customer DROP CONSTRAINT customer_customer_role_id_fkey;
       toy          mythicalman    false    244    3875    236            '           2606    24891 '   kit_accessory kit_accessory_acc_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY toy.kit_accessory
    ADD CONSTRAINT kit_accessory_acc_id_fkey FOREIGN KEY (acc_id) REFERENCES toy.accessory(id);
 N   ALTER TABLE ONLY toy.kit_accessory DROP CONSTRAINT kit_accessory_acc_id_fkey;
       toy          mythicalman    false    234    232    3863            (           2606    24886 '   kit_accessory kit_accessory_kit_id_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY toy.kit_accessory
    ADD CONSTRAINT kit_accessory_kit_id_fkey FOREIGN KEY (kit_id) REFERENCES toy.kit(id);
 N   ALTER TABLE ONLY toy.kit_accessory DROP CONSTRAINT kit_accessory_kit_id_fkey;
       toy          mythicalman    false    234    3859    228            $           2606    24913    kit kit_creator_id_fkey    FK CONSTRAINT     v   ALTER TABLE ONLY toy.kit
    ADD CONSTRAINT kit_creator_id_fkey FOREIGN KEY (creator_id) REFERENCES toy.customer(id);
 >   ALTER TABLE ONLY toy.kit DROP CONSTRAINT kit_creator_id_fkey;
       toy          mythicalman    false    3867    228    236            %           2606    24855    kit kit_creature_id_fkey    FK CONSTRAINT     x   ALTER TABLE ONLY toy.kit
    ADD CONSTRAINT kit_creature_id_fkey FOREIGN KEY (creature_id) REFERENCES toy.creature(id);
 ?   ALTER TABLE ONLY toy.kit DROP CONSTRAINT kit_creature_id_fkey;
       toy          mythicalman    false    3857    226    228            ,           2606    24942     request request_customer_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY toy.request
    ADD CONSTRAINT request_customer_id_fkey FOREIGN KEY (customer_id) REFERENCES toy.customer(id);
 G   ALTER TABLE ONLY toy.request DROP CONSTRAINT request_customer_id_fkey;
       toy          mythicalman    false    3867    240    236            -           2606    24959 '   request_items request_items_kit_id_fkey    FK CONSTRAINT     }   ALTER TABLE ONLY toy.request_items
    ADD CONSTRAINT request_items_kit_id_fkey FOREIGN KEY (kit_id) REFERENCES toy.kit(id);
 N   ALTER TABLE ONLY toy.request_items DROP CONSTRAINT request_items_kit_id_fkey;
       toy          mythicalman    false    228    3859    242            .           2606    24954 +   request_items request_items_request_id_fkey    FK CONSTRAINT     �   ALTER TABLE ONLY toy.request_items
    ADD CONSTRAINT request_items_request_id_fkey FOREIGN KEY (request_id) REFERENCES toy.request(id);
 R   ALTER TABLE ONLY toy.request_items DROP CONSTRAINT request_items_request_id_fkey;
       toy          mythicalman    false    240    242    3871            �   �   x���v
Q���W(ɯ�KLNN-.�/�Ts�	uV�0�QP��/�S�*�z@�_�������5�'A�F ��%�j7���K��oD�~�����TL��D�7�s�+�I-*&�f@}N�%
 o`1�8���&��Rf�P_@bf^	L�&pq '_�V      �   W   x���v
Q���W(ɯ�K�O�,H,*Qs�	uV�0�QP�HMLQ״��$���8)19�(��@�i��%D)6*�/�H-��� ��5�      �   �   x���v
Q���W(ɯ�KN,*��,I�Us�	uV�0�Q0���Ĝ�TMk.O�����H�e�B�.S�cu���j�!P��5����`� �$�2`8��n��YilD��L��o�cB�6C�mw��HK�=��e���� M��c      �   \   x���v
Q���W(ɯ�K.JM,)-JUs�	uV�0�QPO*��+�/N,-*-V�U����PMk.OBf����V@5�"i�� �$�      �   �   x����j�0��y
ݺ�($���.m���6��s�5�X�v(}���
KWXz��~���T���M	ź|�@Ǳ�|���Wo�-ܤw0�R����g�3�ԎX�ǒ$�`L�ۧ������q���\�ي�����wh�?���^�=����:�#��a�~2���J����O���(�I+Gg��h����(�",����|^����Ǖ\8�ߥeCȓ��Z<T�e���~�*��A�E|�|��      �   G   x���v
Q���W(ɯ�K.-.��M-�/��IUs�	uV�0�QP�ɨkZsy���+1%73��� K�!+      �     x����O�0�����w�&������,1�z�稔vi1��휇i2�`v����̗�������T�^2����\%!��ax�)��2Y(q�!�!�=R#���>o꯸n��,��]����lb�|@��$-�I[H|2�D�FҙH����9H})Z�!U��2K��h�%��r?����.fR��C[E��������L������qn{r�=9q=~f���&3̊��хT=>C���)Y�+�[:�����Ʌ�=�x�ӿ�[| Zx��      �   �   x���v
Q���W(ɯ���,�OLNN-.�/�Ts�	uV�0�Q0�Q ����\�Di��7"E�1X�1)ZL�V����ބ-f:
f$����$�Y����0K�`�����@G��ĸ44�!�7�F`=$y�h�������@�� �Y�       �   �  x����nA��<�v)��;E�H(H$��# �=���.w'�Mi����9�ۻ��O��������'|{�����������7�����\2�\���~.߾����m>���t[�6���&ī�N�n�� sο�^���b1���� iܺ�0��(��^���CP-�X�-12��j���m�ѵE�K��0Z���KLH@*ݤ��#&�z��7�֕0�qbhb��[m޴qb��#BKɢ�O���a�bEL_a8�r��&5��/1>0�9��&%m��9,����V�tD��[�KL�5�J�a��u�!՚xEɰAK�bMt��k|	�̀�5�0��Q��Qb�&ǝ�g܋�b\~M�[:X�y�ߌ��d���A�\�#�0f��{-��ɘ�i�n53���TpS��nm���y�Mo֊-nK��YR�bo|�K?@S�@g�LV$��]��⣊��VB�b�RN0U<1��f�Z��Q�c�2�<PkE�Q�/�,ʛu�M��*Δ�̿Ź��(G�0.��5g�Q��s���s:�0��X���Vz��5̳3s��Y�fL:��o���T�A󳏔}'1N	{H��|.���D>R�ԋ�㔰�bdC�ѧ�3Ҋ_s.����`9��5� 4�Ic      �   0  x���=oA��ޟ�
��E���'*��P�H��r�!�)��x�cQ��Hn�G{���������O�����r����������������e��������u�]�|n^���n޼������R�=C�ϵ�^ ���d�)fG`�g`���:�X�/+R�����Z�zשI0���ڱT1���ڴ�1���ڷ4)��|�\��rmLƭmL��k�kc
_��ژ�k#3�u�
�|I1���l������d�[��Vi���:��[��Z����b�Z���*1��L�fUk��Z'���1>��7c|U�K�R���$4j���͟�Z�qkި[�qk�I���:|��)�s�K���΅�朽Iuk������c��t~�pk�JÏ�q~d�,�����	_6N�W�0���_�H��q~8��pYp�u� �L�Y��Ss��l��/�axk]����I�����5�$�t~
���u:}M΋O��0o��n�8|q��m:	o��8|wÏm:	o�;ߤ�s����%��x;�5O�k��L�)�ţ�58��?��p���҃��Q�}��`��d�[     