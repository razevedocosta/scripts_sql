-- This script was generated by a beta version of the ERD tool in pgAdmin 4.
-- Please log an issue at https://redmine.postgresql.org/projects/pgadmin4/issues/new if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE IF NOT EXISTS public.agricultores
(
    agricultor_id integer NOT NULL,
    nome text COLLATE pg_catalog."default" NOT NULL,
    sobrenome text COLLATE pg_catalog."default" NOT NULL,
    segmento text COLLATE pg_catalog."default" NOT NULL,
    cidade_id integer NOT NULL,
    CONSTRAINT agricultor_pkey PRIMARY KEY (agricultor_id)
);

CREATE TABLE IF NOT EXISTS public.cidades
(
    cidade_id integer NOT NULL,
    nome text COLLATE pg_catalog."default" NOT NULL,
    pais text COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT cidade_pkey PRIMARY KEY (cidade_id)
);

CREATE TABLE IF NOT EXISTS public.clientes
(
    cliente_id integer NOT NULL,
    nome text COLLATE pg_catalog."default" NOT NULL,
    sobrenome text COLLATE pg_catalog."default" NOT NULL,
    telefone text COLLATE pg_catalog."default" NOT NULL,
    cidade_id integer NOT NULL,
    CONSTRAINT cliente_pkey PRIMARY KEY (cliente_id)
);

CREATE TABLE IF NOT EXISTS public.ordens
(
    ordem_id integer NOT NULL,
    data date NOT NULL,
    preco integer NOT NULL,
    unidade integer NOT NULL,
    cidade_id integer NOT NULL,
    cliente_id integer NOT NULL,
    agricultor_id integer NOT NULL,
    produto_id integer NOT NULL,
    CONSTRAINT ordem_pkey PRIMARY KEY (ordem_id)
);

CREATE TABLE IF NOT EXISTS public.produtos
(
    produto_id integer NOT NULL,
    nome text COLLATE pg_catalog."default" NOT NULL,
    data_colheita date NOT NULL,
    CONSTRAINT produto_pkey PRIMARY KEY (produto_id)
);

ALTER TABLE IF EXISTS public.agricultores
    ADD CONSTRAINT cidade_agricultor_fkey FOREIGN KEY (cidade_id)
    REFERENCES public.cidades (cidade_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.clientes
    ADD CONSTRAINT cidade_cliente_fkey FOREIGN KEY (cidade_id)
    REFERENCES public.cidades (cidade_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.ordens
    ADD CONSTRAINT agricultor_ordem_fkey FOREIGN KEY (agricultor_id)
    REFERENCES public.agricultores (agricultor_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.ordens
    ADD CONSTRAINT cidade_ordem_fkey FOREIGN KEY (cidade_id)
    REFERENCES public.cidades (cidade_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.ordens
    ADD CONSTRAINT cliente_ordem_fkey FOREIGN KEY (cliente_id)
    REFERENCES public.clientes (cliente_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;


ALTER TABLE IF EXISTS public.ordens
    ADD CONSTRAINT produto_ordem_fkey FOREIGN KEY (produto_id)
    REFERENCES public.produtos (produto_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;

END;