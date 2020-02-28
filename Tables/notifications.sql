-- SEQUENCE: public.notifications_notification_id_seq

-- DROP SEQUENCE public.notifications_notification_id_seq;

CREATE SEQUENCE public.notifications_notification_id_seq
    INCREMENT 1
    START 3
    MINVALUE 1
    MAXVALUE 2147483647
    CACHE 1;

ALTER SEQUENCE public.notifications_notification_id_seq
    OWNER TO postgres;

-- Table: public.notifications

-- DROP TABLE public.notifications;

CREATE TABLE public.notifications
(
    notification_id integer NOT NULL DEFAULT nextval('notifications_notification_id_seq'::regclass),
    message text COLLATE pg_catalog."default" NOT NULL,
    notification_datetime timestamp(6) with time zone NOT NULL,
    CONSTRAINT notifications_pkey PRIMARY KEY (notification_id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.notifications
    OWNER to postgres;