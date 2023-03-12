-- Table: public.produtos

-- DROP TABLE IF EXISTS public.produtos;

CREATE TABLE IF NOT EXISTS public.produtos
(
    produto_id integer NOT NULL,
    nome text COLLATE pg_catalog."default" NOT NULL,
    data_colheita date NOT NULL,
    CONSTRAINT produto_pkey PRIMARY KEY (produto_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.produtos
    OWNER to postgres;