-- Table: public.ordens

-- DROP TABLE IF EXISTS public.ordens;

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
    CONSTRAINT ordem_pkey PRIMARY KEY (ordem_id),
    CONSTRAINT agricultor_ordem_fkey FOREIGN KEY (agricultor_id)
        REFERENCES public.agricultores (agricultor_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT cidade_ordem_fkey FOREIGN KEY (cidade_id)
        REFERENCES public.cidades (cidade_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT cliente_ordem_fkey FOREIGN KEY (cliente_id)
        REFERENCES public.clientes (cliente_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT produto_ordem_fkey FOREIGN KEY (produto_id)
        REFERENCES public.produtos (produto_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.ordens
    OWNER to postgres;