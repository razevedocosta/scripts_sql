-- Table: public.clientes

-- DROP TABLE IF EXISTS public.clientes;

CREATE TABLE IF NOT EXISTS public.clientes
(
    cliente_id integer NOT NULL,
    nome text COLLATE pg_catalog."default" NOT NULL,
    sobrenome text COLLATE pg_catalog."default" NOT NULL,
    telefone text COLLATE pg_catalog."default" NOT NULL,
    cidade_id integer NOT NULL,
    CONSTRAINT cliente_pkey PRIMARY KEY (cliente_id),
    CONSTRAINT cidade_cliente_fkey FOREIGN KEY (cidade_id)
        REFERENCES public.cidades (cidade_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.clientes
    OWNER to postgres;