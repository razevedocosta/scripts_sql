-- Table: public.agricultores

-- DROP TABLE IF EXISTS public.agricultores;

CREATE TABLE IF NOT EXISTS public.agricultores
(
    agricultor_id integer NOT NULL,
    nome text COLLATE pg_catalog."default" NOT NULL,
    sobrenome text COLLATE pg_catalog."default" NOT NULL,
    segmento text COLLATE pg_catalog."default" NOT NULL,
    cidade_id integer NOT NULL,
    CONSTRAINT agricultor_pkey PRIMARY KEY (agricultor_id),
    CONSTRAINT cidade_agricultor_fkey FOREIGN KEY (cidade_id)
        REFERENCES public.cidades (cidade_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.agricultores
    OWNER to postgres;