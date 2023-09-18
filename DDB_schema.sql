/* creates using dbeaver export tool 2023-09-18 */

-- public.brand definition

-- Drop table

-- DROP TABLE public.brand;

CREATE TABLE public.brand (
	brd_id serial4 NOT NULL,
	brd_name varchar(255) NOT NULL,
	CONSTRAINT brand_pkey PRIMARY KEY (brd_id)
);


-- public.company definition

-- Drop table

-- DROP TABLE public.company;

CREATE TABLE public.company (
	com_id int4 NOT NULL DEFAULT nextval('"Company_com_id_seq"'::regclass),
	com_name varchar(255) NOT NULL,
	CONSTRAINT "Company_pkey" PRIMARY KEY (com_id)
);


-- public.price definition

-- Drop table

-- DROP TABLE public.price;

CREATE TABLE public.price (
	id int4 NOT NULL DEFAULT nextval('"Price_id_seq"'::regclass),
	price_euro int4 NOT NULL,
	shop_id int4 NOT NULL,
	product_id int4 NOT NULL,
	ticket_id int4 NOT NULL,
	price_kilo int4 NULL,
	price_litre int4 NULL,
	price_centimes int4 NULL,
	CONSTRAINT "Price_pkey" PRIMARY KEY (id)
);


-- public.product definition

-- Drop table

-- DROP TABLE public.product;

CREATE TABLE public.product (
	prct_id int4 NOT NULL DEFAULT nextval('"Product_prct_id_seq"'::regclass),
	prct_name varchar(255) NOT NULL,
	prct_id_brand int4 NULL,
	prct_weight numeric NULL,
	prct_volum int4 NULL,
	prct_id_type int4 NULL,
	prct_quantity int4 NULL,
	barcode varchar(13) NULL,
	CONSTRAINT "Product_pkey" PRIMARY KEY (prct_id)
);


-- public.ticket definition

-- Drop table

-- DROP TABLE public.ticket;

CREATE TABLE public.ticket (
	tck_date date NOT NULL,
	tck_id serial4 NOT NULL,
	tck_id_shop int4 NOT NULL,
	tck_info varchar NULL,
	CONSTRAINT ticket_pkey PRIMARY KEY (tck_id)
);


-- public.shop definition

-- Drop table

-- DROP TABLE public.shop;

CREATE TABLE public.shop (
	shop_id int4 NOT NULL DEFAULT nextval('"Shop_shop_id_seq"'::regclass),
	shop_name varchar(255) NOT NULL,
	shop_id_com int4 NOT NULL,
	shop_address varchar(1024) NULL,
	shop_nickname varchar(255) NULL,
	CONSTRAINT "Shop_pkey" PRIMARY KEY (shop_id),
	CONSTRAINT company FOREIGN KEY (shop_id_com) REFERENCES public.company(com_id)
);