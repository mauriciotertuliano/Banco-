-- Table: public.produto

-- DROP TABLE IF EXISTS public.produto;
Select * From  Cliente
Select * From  Compra
Select * From  Forma_pagamento
Select * From  Produto


CREATE TABLE IF NOT EXISTS public.produto
(
    id_produto character varying(25) COLLATE pg_catalog."default" NOT NULL,
    id_compra integer NOT NULL,
    nome_prod character varying(255) COLLATE pg_catalog."default" NOT NULL,
    quant_prod integer NOT NULL,
    CONSTRAINT produto_pkey PRIMARY KEY (id_produto)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.produto
    OWNER to postgres;