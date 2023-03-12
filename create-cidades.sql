-- Table: public.cidades

-- DROP TABLE IF EXISTS public.cidades;

CREATE TABLE IF NOT EXISTS public.cidades
(
    cidade_id integer NOT NULL,
    nome text COLLATE pg_catalog."default" NOT NULL,
    pais text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT cidade_pkey PRIMARY KEY (cidade_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.cidades
    OWNER to postgres;