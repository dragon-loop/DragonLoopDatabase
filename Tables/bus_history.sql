-- SEQUENCE: public.bus_history_bus_history_id_seq

-- DROP SEQUENCE public.bus_history_bus_history_id_seq;

CREATE SEQUENCE public.bus_history_bus_history_id_seq
    INCREMENT 1
    START 1
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public.bus_history_bus_history_id_seq
    OWNER TO postgres;

-- Table: public.bus_history

-- DROP TABLE public.bus_history;

CREATE TABLE IF NOT EXISTS public.bus_history
(
    bus_history_id integer NOT NULL DEFAULT nextval('bus_history_bus_history_id_seq'::regclass),
    bus_id integer NOT NULL,
    x_coordinate numeric NOT NULL,
    y_coordinate numeric NOT NULL,
    route_id integer NOT NULL,
    CONSTRAINT bus_history_pkey PRIMARY KEY (bus_history_id),
    CONSTRAINT route_id_fkey FOREIGN KEY (route_id)
        REFERENCES public.routes (route_id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE RESTRICT,
    CONSTRAINT bus_id_fkey FOREIGN KEY (bus_id)
        REFERENCES public.buses (bus_id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE RESTRICT
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.bus_history
    OWNER to postgres;