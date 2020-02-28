-- Table: public.notifications

-- DROP TABLE public.notifications;

CREATE TABLE public.notifications
(
    notification_id integer NOT NULL DEFAULT nextval('notifications_notification_id_seq'::regclass),
    message text COLLATE pg_catalog."default" NOT NULL,
    notification_datetime timestamp without time zone NOT NULL,
    CONSTRAINT notifications_pkey PRIMARY KEY (notification_id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.notifications
    OWNER to postgres;