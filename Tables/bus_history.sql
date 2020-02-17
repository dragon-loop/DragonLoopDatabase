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
    CONSTRAINT bus_history_pkey PRIMARY KEY (bus_history_id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.bus_history
    OWNER to postgres;

DROP FUNCTION add_bus_history();
CREATE OR REPLACE FUNCTION add_bus_history() RETURNS TRIGGER AS
$$
BEGIN
    INSERT INTO
        public.bus_history(bus_id, route_id, x_coordinate, y_coordinate)
        VALUES(NEW.bus_id, NEW.route_id, NEW.x_coordinate, NEW.y_coordinate);
    
    RETURN NEW;
END;
$$
language plpgsql;

DROP TRIGGER IF EXISTS add_bus_history_trigger ON public.buses;
CREATE TRIGGER add_bus_history_trigger
     AFTER INSERT OR UPDATE OF x_coordinate, y_coordinate ON public.buses
     FOR EACH ROW
     EXECUTE PROCEDURE add_bus_history();

