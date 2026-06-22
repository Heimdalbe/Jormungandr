--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4 (Debian 14.4-1.pgdg110+1)
-- Dumped by pg_dump version 14.4 (Debian 14.4-1.pgdg110+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: Backend_choice; Type: TABLE; Schema: public; Owner: jormungandr
--

CREATE TABLE public."Backend_choice" (
    id bigint NOT NULL,
    keuze character varying(200) NOT NULL,
    votes integer NOT NULL,
    round_id bigint NOT NULL
);


ALTER TABLE public."Backend_choice" OWNER TO jormungandr;

--
-- Name: Backend_choice_id_seq; Type: SEQUENCE; Schema: public; Owner: jormungandr
--

CREATE SEQUENCE public."Backend_choice_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Backend_choice_id_seq" OWNER TO jormungandr;

--
-- Name: Backend_choice_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jormungandr
--

ALTER SEQUENCE public."Backend_choice_id_seq" OWNED BY public."Backend_choice".id;


--
-- Name: Backend_cms; Type: TABLE; Schema: public; Owner: jormungandr
--

CREATE TABLE public."Backend_cms" (
    id bigint NOT NULL,
    name character varying(128) NOT NULL,
    title character varying(128) NOT NULL,
    description text NOT NULL,
    permission integer NOT NULL
);


ALTER TABLE public."Backend_cms" OWNER TO jormungandr;

--
-- Name: Backend_cms_id_seq; Type: SEQUENCE; Schema: public; Owner: jormungandr
--

CREATE SEQUENCE public."Backend_cms_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Backend_cms_id_seq" OWNER TO jormungandr;

--
-- Name: Backend_cms_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jormungandr
--

ALTER SEQUENCE public."Backend_cms_id_seq" OWNED BY public."Backend_cms".id;


--
-- Name: Backend_election; Type: TABLE; Schema: public; Owner: jormungandr
--

CREATE TABLE public."Backend_election" (
    id bigint NOT NULL,
    titel character varying(200) NOT NULL,
    uitleg character varying(200) NOT NULL,
    visible boolean NOT NULL,
    "order" integer NOT NULL
);


ALTER TABLE public."Backend_election" OWNER TO jormungandr;

--
-- Name: Backend_election_id_seq; Type: SEQUENCE; Schema: public; Owner: jormungandr
--

CREATE SEQUENCE public."Backend_election_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Backend_election_id_seq" OWNER TO jormungandr;

--
-- Name: Backend_election_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jormungandr
--

ALTER SEQUENCE public."Backend_election_id_seq" OWNED BY public."Backend_election".id;


--
-- Name: Backend_event; Type: TABLE; Schema: public; Owner: jormungandr
--

CREATE TABLE public."Backend_event" (
    id bigint NOT NULL,
    name character varying(128) NOT NULL,
    description text,
    url character varying(1024),
    poster character varying(100) NOT NULL,
    start timestamp with time zone,
    "end" timestamp with time zone,
    location character varying(256) NOT NULL,
    is_open boolean NOT NULL,
    max_registered smallint,
    genre_id bigint NOT NULL,
    CONSTRAINT "Backend_event_max_registered_check" CHECK ((max_registered >= 0))
);


ALTER TABLE public."Backend_event" OWNER TO jormungandr;

--
-- Name: Backend_event_id_seq; Type: SEQUENCE; Schema: public; Owner: jormungandr
--

CREATE SEQUENCE public."Backend_event_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Backend_event_id_seq" OWNER TO jormungandr;

--
-- Name: Backend_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jormungandr
--

ALTER SEQUENCE public."Backend_event_id_seq" OWNED BY public."Backend_event".id;


--
-- Name: Backend_eventgenre; Type: TABLE; Schema: public; Owner: jormungandr
--

CREATE TABLE public."Backend_eventgenre" (
    id bigint NOT NULL,
    name character varying(64) NOT NULL,
    description text NOT NULL,
    logo character varying(100) NOT NULL
);


ALTER TABLE public."Backend_eventgenre" OWNER TO jormungandr;

--
-- Name: Backend_eventgenre_id_seq; Type: SEQUENCE; Schema: public; Owner: jormungandr
--

CREATE SEQUENCE public."Backend_eventgenre_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Backend_eventgenre_id_seq" OWNER TO jormungandr;

--
-- Name: Backend_eventgenre_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jormungandr
--

ALTER SEQUENCE public."Backend_eventgenre_id_seq" OWNED BY public."Backend_eventgenre".id;


--
-- Name: Backend_footerpage; Type: TABLE; Schema: public; Owner: jormungandr
--

CREATE TABLE public."Backend_footerpage" (
    id bigint NOT NULL,
    name character varying(128) NOT NULL,
    url character varying(200) NOT NULL,
    "order" integer NOT NULL
);


ALTER TABLE public."Backend_footerpage" OWNER TO jormungandr;

--
-- Name: Backend_footerpage_id_seq; Type: SEQUENCE; Schema: public; Owner: jormungandr
--

CREATE SEQUENCE public."Backend_footerpage_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Backend_footerpage_id_seq" OWNER TO jormungandr;

--
-- Name: Backend_footerpage_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jormungandr
--

ALTER SEQUENCE public."Backend_footerpage_id_seq" OWNED BY public."Backend_footerpage".id;


--
-- Name: Backend_graphnode; Type: TABLE; Schema: public; Owner: jormungandr
--

CREATE TABLE public."Backend_graphnode" (
    id bigint NOT NULL,
    name character varying(128) NOT NULL,
    photo character varying(256) NOT NULL,
    display character varying(50) NOT NULL,
    parent_id bigint
);


ALTER TABLE public."Backend_graphnode" OWNER TO jormungandr;

--
-- Name: Backend_graphnode_id_seq; Type: SEQUENCE; Schema: public; Owner: jormungandr
--

CREATE SEQUENCE public."Backend_graphnode_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Backend_graphnode_id_seq" OWNER TO jormungandr;

--
-- Name: Backend_graphnode_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jormungandr
--

ALTER SEQUENCE public."Backend_graphnode_id_seq" OWNED BY public."Backend_graphnode".id;


--
-- Name: Backend_navsubitem; Type: TABLE; Schema: public; Owner: jormungandr
--

CREATE TABLE public."Backend_navsubitem" (
    id bigint NOT NULL,
    titel character varying(128) NOT NULL,
    "order" smallint NOT NULL,
    url character varying(200) NOT NULL,
    parent_id bigint
);


ALTER TABLE public."Backend_navsubitem" OWNER TO jormungandr;

--
-- Name: Backend_navsubitem_id_seq; Type: SEQUENCE; Schema: public; Owner: jormungandr
--

CREATE SEQUENCE public."Backend_navsubitem_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Backend_navsubitem_id_seq" OWNER TO jormungandr;

--
-- Name: Backend_navsubitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jormungandr
--

ALTER SEQUENCE public."Backend_navsubitem_id_seq" OWNED BY public."Backend_navsubitem".id;


--
-- Name: Backend_navtopitem; Type: TABLE; Schema: public; Owner: jormungandr
--

CREATE TABLE public."Backend_navtopitem" (
    id bigint NOT NULL,
    titel character varying(128) NOT NULL,
    "order" smallint NOT NULL,
    url character varying(200) NOT NULL,
    role integer NOT NULL
);


ALTER TABLE public."Backend_navtopitem" OWNER TO jormungandr;

--
-- Name: Backend_navtopitem_id_seq; Type: SEQUENCE; Schema: public; Owner: jormungandr
--

CREATE SEQUENCE public."Backend_navtopitem_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Backend_navtopitem_id_seq" OWNER TO jormungandr;

--
-- Name: Backend_navtopitem_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jormungandr
--

ALTER SEQUENCE public."Backend_navtopitem_id_seq" OWNED BY public."Backend_navtopitem".id;


--
-- Name: Backend_photoalbum; Type: TABLE; Schema: public; Owner: jormungandr
--

CREATE TABLE public."Backend_photoalbum" (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    "order" smallint NOT NULL,
    visible boolean NOT NULL
);


ALTER TABLE public."Backend_photoalbum" OWNER TO jormungandr;

--
-- Name: Backend_photoalbum_id_seq; Type: SEQUENCE; Schema: public; Owner: jormungandr
--

CREATE SEQUENCE public."Backend_photoalbum_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Backend_photoalbum_id_seq" OWNER TO jormungandr;

--
-- Name: Backend_photoalbum_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jormungandr
--

ALTER SEQUENCE public."Backend_photoalbum_id_seq" OWNED BY public."Backend_photoalbum".id;


--
-- Name: Backend_picture; Type: TABLE; Schema: public; Owner: jormungandr
--

CREATE TABLE public."Backend_picture" (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    description character varying(300),
    link character varying(150) NOT NULL,
    is_carousel_pic boolean NOT NULL,
    album_id bigint NOT NULL
);


ALTER TABLE public."Backend_picture" OWNER TO jormungandr;

--
-- Name: Backend_picture_id_seq; Type: SEQUENCE; Schema: public; Owner: jormungandr
--

CREATE SEQUENCE public."Backend_picture_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Backend_picture_id_seq" OWNER TO jormungandr;

--
-- Name: Backend_picture_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jormungandr
--

ALTER SEQUENCE public."Backend_picture_id_seq" OWNED BY public."Backend_picture".id;


--
-- Name: Backend_praesidiumfunction; Type: TABLE; Schema: public; Owner: jormungandr
--

CREATE TABLE public."Backend_praesidiumfunction" (
    id bigint NOT NULL,
    name character varying(50) NOT NULL,
    email character varying(254) NOT NULL,
    "order" smallint NOT NULL
);


ALTER TABLE public."Backend_praesidiumfunction" OWNER TO jormungandr;

--
-- Name: Backend_praesidiumfunction_id_seq; Type: SEQUENCE; Schema: public; Owner: jormungandr
--

CREATE SEQUENCE public."Backend_praesidiumfunction_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Backend_praesidiumfunction_id_seq" OWNER TO jormungandr;

--
-- Name: Backend_praesidiumfunction_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jormungandr
--

ALTER SEQUENCE public."Backend_praesidiumfunction_id_seq" OWNED BY public."Backend_praesidiumfunction".id;


--
-- Name: Backend_praesidiumfunctionyearmember; Type: TABLE; Schema: public; Owner: jormungandr
--

CREATE TABLE public."Backend_praesidiumfunctionyearmember" (
    id bigint NOT NULL,
    praesidium_function_id bigint NOT NULL,
    praesidium_member_id bigint NOT NULL,
    praesidium_year_id bigint NOT NULL,
    photo character varying(200)
);


ALTER TABLE public."Backend_praesidiumfunctionyearmember" OWNER TO jormungandr;

--
-- Name: Backend_praesidiumfunctionyearmember_id_seq; Type: SEQUENCE; Schema: public; Owner: jormungandr
--

CREATE SEQUENCE public."Backend_praesidiumfunctionyearmember_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Backend_praesidiumfunctionyearmember_id_seq" OWNER TO jormungandr;

--
-- Name: Backend_praesidiumfunctionyearmember_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jormungandr
--

ALTER SEQUENCE public."Backend_praesidiumfunctionyearmember_id_seq" OWNED BY public."Backend_praesidiumfunctionyearmember".id;


--
-- Name: Backend_praesidiummember; Type: TABLE; Schema: public; Owner: jormungandr
--

CREATE TABLE public."Backend_praesidiummember" (
    id bigint NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(100) NOT NULL,
    email character varying(254) NOT NULL,
    phone character varying(20),
    quote character varying(200),
    description character varying(200),
    trivia text NOT NULL,
    facebook_link character varying(200),
    linkedin_link character varying(200),
    twitter_link character varying(200),
    instagram_link character varying(200)
);


ALTER TABLE public."Backend_praesidiummember" OWNER TO jormungandr;

--
-- Name: Backend_praesidiummember_id_seq; Type: SEQUENCE; Schema: public; Owner: jormungandr
--

CREATE SEQUENCE public."Backend_praesidiummember_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Backend_praesidiummember_id_seq" OWNER TO jormungandr;

--
-- Name: Backend_praesidiummember_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jormungandr
--

ALTER SEQUENCE public."Backend_praesidiummember_id_seq" OWNED BY public."Backend_praesidiummember".id;


--
-- Name: Backend_praesidiumyear; Type: TABLE; Schema: public; Owner: jormungandr
--

CREATE TABLE public."Backend_praesidiumyear" (
    id bigint NOT NULL,
    start timestamp with time zone NOT NULL,
    "end" timestamp with time zone NOT NULL,
    display_name character varying(50)
);


ALTER TABLE public."Backend_praesidiumyear" OWNER TO jormungandr;

--
-- Name: Backend_praesidiumyear_id_seq; Type: SEQUENCE; Schema: public; Owner: jormungandr
--

CREATE SEQUENCE public."Backend_praesidiumyear_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Backend_praesidiumyear_id_seq" OWNER TO jormungandr;

--
-- Name: Backend_praesidiumyear_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jormungandr
--

ALTER SEQUENCE public."Backend_praesidiumyear_id_seq" OWNED BY public."Backend_praesidiumyear".id;


--
-- Name: Backend_profile; Type: TABLE; Schema: public; Owner: jormungandr
--

CREATE TABLE public."Backend_profile" (
    id bigint NOT NULL,
    gsm character varying(50) NOT NULL,
    geslacht character varying(50) NOT NULL,
    interesses character varying(41) NOT NULL,
    mails boolean NOT NULL,
    policy_approved boolean NOT NULL,
    votes smallint NOT NULL,
    status character varying(50) NOT NULL,
    role integer NOT NULL,
    election_active boolean NOT NULL,
    user_id integer NOT NULL,
    CONSTRAINT "Backend_profile_votes_check" CHECK ((votes >= 0))
);


ALTER TABLE public."Backend_profile" OWNER TO jormungandr;

--
-- Name: Backend_profile_id_seq; Type: SEQUENCE; Schema: public; Owner: jormungandr
--

CREATE SEQUENCE public."Backend_profile_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Backend_profile_id_seq" OWNER TO jormungandr;

--
-- Name: Backend_profile_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jormungandr
--

ALTER SEQUENCE public."Backend_profile_id_seq" OWNED BY public."Backend_profile".id;


--
-- Name: Backend_round; Type: TABLE; Schema: public; Owner: jormungandr
--

CREATE TABLE public."Backend_round" (
    id bigint NOT NULL,
    titel character varying(200) NOT NULL,
    actief boolean NOT NULL,
    visible boolean NOT NULL,
    resultatenactief boolean NOT NULL,
    election_id bigint NOT NULL
);


ALTER TABLE public."Backend_round" OWNER TO jormungandr;

--
-- Name: Backend_round_id_seq; Type: SEQUENCE; Schema: public; Owner: jormungandr
--

CREATE SEQUENCE public."Backend_round_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Backend_round_id_seq" OWNER TO jormungandr;

--
-- Name: Backend_round_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jormungandr
--

ALTER SEQUENCE public."Backend_round_id_seq" OWNED BY public."Backend_round".id;


--
-- Name: Backend_sponsor; Type: TABLE; Schema: public; Owner: jormungandr
--

CREATE TABLE public."Backend_sponsor" (
    id bigint NOT NULL,
    name character varying(100) NOT NULL,
    website character varying(200) NOT NULL,
    logo character varying(100),
    inverted_color boolean NOT NULL
);


ALTER TABLE public."Backend_sponsor" OWNER TO jormungandr;

--
-- Name: Backend_sponsor_id_seq; Type: SEQUENCE; Schema: public; Owner: jormungandr
--

CREATE SEQUENCE public."Backend_sponsor_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Backend_sponsor_id_seq" OWNER TO jormungandr;

--
-- Name: Backend_sponsor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jormungandr
--

ALTER SEQUENCE public."Backend_sponsor_id_seq" OWNED BY public."Backend_sponsor".id;


--
-- Name: Backend_uservotes; Type: TABLE; Schema: public; Owner: jormungandr
--

CREATE TABLE public."Backend_uservotes" (
    id bigint NOT NULL,
    votes integer NOT NULL,
    round_id bigint NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public."Backend_uservotes" OWNER TO jormungandr;

--
-- Name: Backend_uservotes_id_seq; Type: SEQUENCE; Schema: public; Owner: jormungandr
--

CREATE SEQUENCE public."Backend_uservotes_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Backend_uservotes_id_seq" OWNER TO jormungandr;

--
-- Name: Backend_uservotes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jormungandr
--

ALTER SEQUENCE public."Backend_uservotes_id_seq" OWNED BY public."Backend_uservotes".id;


--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: jormungandr
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO jormungandr;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: jormungandr
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO jormungandr;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jormungandr
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: jormungandr
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO jormungandr;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: jormungandr
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO jormungandr;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jormungandr
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: jormungandr
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO jormungandr;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: jormungandr
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO jormungandr;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jormungandr
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: jormungandr
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO jormungandr;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: jormungandr
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO jormungandr;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: jormungandr
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO jormungandr;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jormungandr
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: jormungandr
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO jormungandr;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jormungandr
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: jormungandr
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO jormungandr;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: jormungandr
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO jormungandr;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jormungandr
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: jormungandr
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO jormungandr;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: jormungandr
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO jormungandr;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jormungandr
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: jormungandr
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO jormungandr;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: jormungandr
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO jormungandr;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jormungandr
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: jormungandr
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO jormungandr;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: jormungandr
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO jormungandr;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: jormungandr
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: jormungandr
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO jormungandr;

--
-- Name: Backend_choice id; Type: DEFAULT; Schema: public; Owner: jormungandr
--

ALTER TABLE ONLY public."Backend_choice" ALTER COLUMN id SET DEFAULT nextval('public."Backend_choice_id_seq"'::regclass);


--
-- Name: Backend_cms id; Type: DEFAULT; Schema: public; Owner: jormungandr
--

ALTER TABLE ONLY public."Backend_cms" ALTER COLUMN id SET DEFAULT nextval('public."Backend_cms_id_seq"'::regclass);


--
-- Name: Backend_election id; Type: DEFAULT; Schema: public; Owner: jormungandr
--

ALTER TABLE ONLY public."Backend_election" ALTER COLUMN id SET DEFAULT nextval('public."Backend_election_id_seq"'::regclass);


--
-- Name: Backend_event id; Type: DEFAULT; Schema: public; Owner: jormungandr
--

ALTER TABLE ONLY public."Backend_event" ALTER COLUMN id SET DEFAULT nextval('public."Backend_event_id_seq"'::regclass);


--
-- Name: Backend_eventgenre id; Type: DEFAULT; Schema: public; Owner: jormungandr
--

ALTER TABLE ONLY public."Backend_eventgenre" ALTER COLUMN id SET DEFAULT nextval('public."Backend_eventgenre_id_seq"'::regclass);


--
-- Name: Backend_footerpage id; Type: DEFAULT; Schema: public; Owner: jormungandr
--

ALTER TABLE ONLY public."Backend_footerpage" ALTER COLUMN id SET DEFAULT nextval('public."Backend_footerpage_id_seq"'::regclass);


--
-- Name: Backend_graphnode id; Type: DEFAULT; Schema: public; Owner: jormungandr
--

ALTER TABLE ONLY public."Backend_graphnode" ALTER COLUMN id SET DEFAULT nextval('public."Backend_graphnode_id_seq"'::regclass);


--
-- Name: Backend_navsubitem id; Type: DEFAULT; Schema: public; Owner: jormungandr
--

ALTER TABLE ONLY public."Backend_navsubitem" ALTER COLUMN id SET DEFAULT nextval('public."Backend_navsubitem_id_seq"'::regclass);


--
-- Name: Backend_navtopitem id; Type: DEFAULT; Schema: public; Owner: jormungandr
--

ALTER TABLE ONLY public."Backend_navtopitem" ALTER COLUMN id SET DEFAULT nextval('public."Backend_navtopitem_id_seq"'::regclass);


--
-- Name: Backend_photoalbum id; Type: DEFAULT; Schema: public; Owner: jormungandr
--

ALTER TABLE ONLY public."Backend_photoalbum" ALTER COLUMN id SET DEFAULT nextval('public."Backend_photoalbum_id_seq"'::regclass);


--
-- Name: Backend_picture id; Type: DEFAULT; Schema: public; Owner: jormungandr
--

ALTER TABLE ONLY public."Backend_picture" ALTER COLUMN id SET DEFAULT nextval('public."Backend_picture_id_seq"'::regclass);


--
-- Name: Backend_praesidiumfunction id; Type: DEFAULT; Schema: public; Owner: jormungandr
--

ALTER TABLE ONLY public."Backend_praesidiumfunction" ALTER COLUMN id SET DEFAULT nextval('public."Backend_praesidiumfunction_id_seq"'::regclass);


--
-- Name: Backend_praesidiumfunctionyearmember id; Type: DEFAULT; Schema: public; Owner: jormungandr
--

ALTER TABLE ONLY public."Backend_praesidiumfunctionyearmember" ALTER COLUMN id SET DEFAULT nextval('public."Backend_praesidiumfunctionyearmember_id_seq"'::regclass);


--
-- Name: Backend_praesidiummember id; Type: DEFAULT; Schema: public; Owner: jormungandr
--

ALTER TABLE ONLY public."Backend_praesidiummember" ALTER COLUMN id SET DEFAULT nextval('public."Backend_praesidiummember_id_seq"'::regclass);


--
-- Name: Backend_praesidiumyear id; Type: DEFAULT; Schema: public; Owner: jormungandr
--

ALTER TABLE ONLY public."Backend_praesidiumyear" ALTER COLUMN id SET DEFAULT nextval('public."Backend_praesidiumyear_id_seq"'::regclass);


--
-- Name: Backend_profile id; Type: DEFAULT; Schema: public; Owner: jormungandr
--

ALTER TABLE ONLY public."Backend_profile" ALTER COLUMN id SET DEFAULT nextval('public."Backend_profile_id_seq"'::regclass);


--
-- Name: Backend_round id; Type: DEFAULT; Schema: public; Owner: jormungandr
--

ALTER TABLE ONLY public."Backend_round" ALTER COLUMN id SET DEFAULT nextval('public."Backend_round_id_seq"'::regclass);


--
-- Name: Backend_sponsor id; Type: DEFAULT; Schema: public; Owner: jormungandr
--

ALTER TABLE ONLY public."Backend_sponsor" ALTER COLUMN id SET DEFAULT nextval('public."Backend_sponsor_id_seq"'::regclass);


--
-- Name: Backend_uservotes id; Type: DEFAULT; Schema: public; Owner: jormungandr
--

ALTER TABLE ONLY public."Backend_uservotes" ALTER COLUMN id SET DEFAULT nextval('public."Backend_uservotes_id_seq"'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: jormungandr
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: jormungandr
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: jormungandr
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: jormungandr
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: jormungandr
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: jormungandr
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: jormungandr
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: jormungandr
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: jormungandr
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Data for Name: Backend_choice; Type: TABLE DATA; Schema: public; Owner: jormungandr
--

COPY public."Backend_choice" (id, keuze, votes, round_id) FROM stdin;
\.


--
-- Data for Name: Backend_cms; Type: TABLE DATA; Schema: public; Owner: jormungandr
--

COPY public."Backend_cms" (id, name, title, description, permission) FROM stdin;
2	werkgroepen	Werkgroepen	##L.E.A.G.U.E.\r\n\r\n**L.E.A.G.U.E. (Logistics and Engineering Academic Global User Enforcement)**\r\n\r\nL.E.A.G.U.E. is de ICT-werkgroep van Heimdal. In deze werkgroep worden alle IT-projecten van Heimdal ontwikkeld zoals de website, Discord bot, etc. Daarnaast is L.E.A.G.U.E. ook het ondersteunend orgaan voor het netwerk te regelen voor de LAN-party die we organiseren.\r\n<br>\r\n<br>\r\nDeze werkgroep wordt opgemaakt uit studenten van alle richtingen, maar de studenten die Toegepaste Informatica volgen op HOGENT kunnen hun hulp hierbij inbrengen als extra punten voor een vak dat zij krijgen. Daarnaast worden er soms evenementen of tech-talks gedeeld met onze leden zodat deze samen kunnen beleefd worden. Dit zorgt voor een toffe sfeer alsook een verrijking van de kennis.\r\n<br>\r\n<br>\r\nAls er vragen zijn kan je altijd de actieve ICT bereiken.\r\n<br>\r\n<br>\r\n<br>\r\n##Feest & LAN-werkgroep\r\nElk jaar organiseren wij met Heimdal een WAN en een LAN. Hierbij gaan wij kijken om competities op te bouwen en randanimatie te organiseren voor 1 avond. Dit is een manier om onze leden zowel organisatorische als technische vaardigheden aan te leren alsook connecties te maken met externe bedrijven.\r\n<br>\r\n<br>\r\n<br>\r\n##Comic Sans Vrijwilligers\r\nDeze werkgroep is ontstaan nadat onze hulp meerdere keren werd gevraagd bij activiteiten georganiseerd door derden.<br>\r\nZo organiseert de Comic Sans grote evenementen zoals de Halloween Freakshow party en de Dragqueen party. Hier werd onze hulp dan ingeschakeld voor het opbouwen en decoreren van de ruimte, maar ook de ticketcontrole aan de deur.	5
3	sponsorworden	Sponsor worden?	Heeft u interesse om ons te sponsoren? Of zou u eens willen horen wat voor mogelijkheden een samenwerking kan teweeg brengen.\r\n<br>\r\nContacteer ons dan hier: [publicrelations@heimdal.be](mailto:publicrelations@heimdal.be)	5
4	clublied	Clublied	*[(Op de tonen van de Skyrim Main Theme, door Jeremy Soule)](https://www.youtube.com/watch?v=DnlUfPlLjKs)&ast;*  \r\n\r\n</br>\r\nR.  \r\nHeimdal, Heimdal, club van mijn hart  \r\nwaar ik al-tijd mezellef kan zijn!  \r\ngeloofd, geliefd, zijt gij voor mij  \r\nHeimdal, met ons schoon wit en ons zwart  \r\n  \r\n</br>\r\n1.  \r\nHoera nu, met z'n allen, gaan wij alweer knallen  \r\nSamen, vriend en schild, maak ple-zier!  \r\n\r\n</br>\r\nR.\r\nHeimdal, Heimdal, club van mijn hart  \r\nwaar ik al-tijd mezellef kan zijn!  \r\ngeloofd, geliefd, zijt gij voor mij  \r\nHeimdal, met ons schoon wit en ons zwart  \r\n\r\n</br>\r\n2.  \r\nComic Sans, ons café, is gevuld tot de nok  \r\nKomt nader, schuif erbij met ons!  \r\nMay the force be with you en je broeders nabij  \r\n</br>\r\nR.  \r\nHeimdal, Heimdal, club van mijn hart  \r\nwaar ik al-tijd mezellef kan zijn!  \r\ngeloofd, geliefd, zijt gij voor mij  \r\nHeimdal, met ons schoon wit en ons zwart\r\n\r\n</br></br>\r\n\r\n**De Ingezongen versie kan je hier vinden**   \r\n<a href="https://drive.google.com/file/d/1ZGgB01GxJnpbXsGH8qoUQsIfzl93meCI/view?usp=sharing" target="_blank">Clublied</a>\r\n\r\n*&ast;Vanaf het eerste refrein, rond 0:35. Heimdal claimt geen eigendom over de gebruikte muziek, noch wordt dit gebruikt voor commerciële doeleinden.*	5
5	privacy	Privacy Policy	<br/>\r\nHeimdal verwerkt via haar site [https://www.heimdal.be/](https://www.heimdal.be/) privacy gevoelige of persoonsgegevens. Heimdal hecht veel belang aan de privacy van haar partners en besteedt veel aandacht aan de bescherming van de persoonsgegevens. Wij verwerken gegevens in overeenstemming met de vereisten die zijn vastgelegd in de Wet bescherming persoonsgegevens (DPDA). Heimdal is verantwoordelijk voor de gegevensverwerking. In onderstaande privacyverklaring zal uitgelegd worden waarom welke persoonsgegevens verzameld worden. We raden u aan dit aandachtig te lezen.  \r\n\r\n<br/>\r\n### Gebruik van persoonsgegevens\r\n\r\nDoor gebruik te maken van onze service, verstrekt u ons bepaalde gegevens. Dit kunnen persoonlijke gegevens zijn. We bewaren en gebruiken alleen de persoonlijke gegevens die door u rechtstreeks zijn verstrekt of waarvan duidelijk is dat deze aan ons zijn verstrekt om te worden verwerkt. Deze privacyverklaring is in de eerste plaats gericht op degenen die de website gebruiken als particulier of in naam van een vereniging.  \r\n\r\n\r\nDe gegevens die wij verwerken bij gebruik van onze website en faciliteiten:\r\n\r\n• Naam, ter identificatie van het lidmaatschap.  \r\n• E-mailadres, om kennis te geven van updates in verband met uw account en u te contacteren omtrent activiteiten.  \r\n• Interessevoorkeuren.  \r\n\r\n<br/>\r\n\r\n###  Bewaartermijn\r\n\r\nUw gegevens worden 6 jaar na de intrede van uw lidmaatschap automatisch verwijderd. Indien u vragen heeft over het verwijderen van gegevens kan u ons contacteren via: [privacy@heimdal.be](mailto:privacy@heimdal.be)  \r\n<br/>\r\n\r\n### Onze specifieke doelen\r\n\r\nDe gegevens, door u aan ons verleend, zullen enkel voor praktische doeleinden gebruikt worden. Er zullen in geen geval gegevens doorgegeven worden aan derden zonder uw toestemming, met uitzondering de derden hieronder vermeld.  \r\n\r\n  <br/>\r\n\r\n### Gegevens verstrekken aan derden\r\n\r\nHeimdal maakt geen gebruik van derde partijen die toegang hebben tot persoonsgegevens.\r\n\r\n<br/>\r\n\r\n### Beveiliging\r\n\r\nWe nemen beveiligingsmaatregelen om misbruik van en ongeoorloofde toegang tot persoonlijke gegevens te verminderen. We nemen met name de volgende maatregelen:  \r\n• Toegang tot eigen persoonlijke gegevens vereist het gebruik van gebruikersnaam en wachtwoord.  \r\n• Toegang tot persoonlijke gegevens gebeurt enkel door de webmaster, die de gegevens behandeld zoals hiervoor beschreven.  \r\n\r\n<br/>\r\n### Veranderingen aan de privacy policy\r\n\r\nWe behouden ons het recht voor om deze verklaring te wijzigen. Eventuele wijzigingen zullen terdege aangekondigd worden op onze website.  \r\n  \r\n*De Privacy Policy is laatst gewijzigd op 13/03/2021* \r\n\r\n<br/>\r\n### Inspectie en wijziging van uw gegevens\r\n\r\nMocht u een klacht hebben over de verwerking van uw persoonsgegevens dan vragen wij u hierover direct contact met ons op te nemen. Ook voor vragen of verzoeken over uw privacy en ons privacybeleid kunt u contact met ons opnemen per e-mail via [privacy@heimdal.be](mailto:privacy@heimdal.be).	5
1	boekje	Boekje	#####Boekje 1ste semester 2022-2023\r\n<a href="https://drive.google.com/file/d/1SsSs1cF_4r-wDx1ebxxdeUZ6M7DJ9mll/view?usp=share_link" target="_blank">bekijk boekje</a>\r\n\r\n#####Boekje november 2023 -2024\r\n<a href="https://drive.google.com/file/d/1LYOJq6wyHtQJjyodyzeU4ZtDGTNCndPJ/view?usp=sharing">bekijk boekje</a>\r\n\r\n#####Boekje december 2023 -2024\r\n<a href="https://drive.google.com/file/d/1ZE2MxnNlpq8-Txz8YMriL-2_cWUBEq_T/view?usp=sharing">bekijk boekje</a>	5
34	erestuff	Erestuff	Een pagina voor alle dingen die de vereniging gediend hebben\r\n\r\n<br>\r\n<br>\r\nDeze auto, de Citroën C3 heeft tijdens de praesidium jaren van Sander De Bruyker, heel veel kilometers gereden in naam van Heimdal. \r\nDaarnaast heeft deze hier ook een gebroken onderplaat en een gebarsten linker achtervering aan overgehouden. \r\nOp deze manier willen we graag een dankje geven aan de C3\r\n\r\n\r\n<img src="https://i.imgur.com/HJZgNDT.png"  width=80%>\r\n\r\n<br>\r\n<br>\r\n\r\nDe volgende auto, de Volvo S40 heeft tijdens het eerste praesidium jaar van Sepp Degroote ook een hele hoop kilometers afgelegd. Net op het einde van het jaar heeft de embrayage het begeven en is hij pertotal verklaard;\r\nDus bedanken we het volvotje ook\r\n\r\n\r\n<img src="https://i.imgur.com/JRzWqaF.jpg"  width=80%>	5
67	jaarthema	Jaarthema '25-'26	### 🥁 Het nieuwe jaarthema is hier!\r\n\r\nHet is weer september dus dat betekent een nieuw jaarthema! Benieuwd naar wat het dit schooljaar geworden is? 🧐\r\n\r\nOntdek het in onderstaande video...\r\n\r\nGroetjes jullie doopcomité 2025-2026: <b>Simon, Axelle, Kobe, Maxe en Vincent\r\n<br>\r\n\r\n<video id="vid" controls>\r\n <source src="https://jormungandr-data.s3.eu-west-2.amazonaws.com/Heimdal_Jaarthema_2025-2026.mp4" type="video/mp4" />\t\r\n</video>\r\n\r\n<style>\r\n#vid {\r\nwidth: 100%;\r\nheight: auto;\r\n}\r\n</style>	5
6	overons	Over ons	# Join onze discord via onderstaande link!\r\n<a href="https://discord.gg/9ysheV9v9k">https://discord.gg/9ysheV9v9k</a>\r\n<br>\r\n<br>\r\n  \r\nHeimdal is een studentenvereniging gelinkt aan toegepaste informatica die zich richt op geeks en gamers. Waar je altijd jezelf mag zijn en je niet bang moet zijn om jezelf te uiten zoals je bent. Wij organiseren jaarlijks meerdere activiteiten in een geeky thema dus kom zeker eens af als dit je interesseert.\r\n\r\nDaarnaast organiseert Heimdal ook jaarlijks een LAN-party voor alle gamers en niet-gamers. Hier kunnen we ons eens uitleven aan de hand van verschillende toernooien alsook casual gaming. Tevens organiseert Heimdal de L.E.A.G.U.E. werkgroep. Deze werkgroep staat in voor alle ICT projecten binnen Heimdal. Mocht je dus interesse hebben in dit kan je zeker eens komen polsen.  \r\n  \r\n<br>\r\n##Historiek\r\nDe studentenvereniging Heimdal is opgericht in Januari 2018 met als oorspronkelijk doel om ICT ondersteuning aan te bieden voor studenten, studentenverenigingen aangesloten aan de Hogeschool Gent en student-ondernemers. Daarnaast ontwikkelde Heimdal ook toepassingen om het leven van de student aan de Hogeschool Gent te vergemakkelijken. Zo heeft Heimdal bijvoorbeeld software geschreven voor de vele touchscreen schermen die men kan vinden op Hogeschool Gent.\r\n\r\nNaargelang Heimdal ouder werd is de focus van de vereniging meer gevloeid van ICT'ers naar geeks en gamers. Omdat Heimdal als ondersteunende ICT vereniging is gestart was deze doelgroep hier dan ook nauw aan gelinkt. Daarmee organiseren wij nu activiteiten gericht naar deze doelgroep. Dit meestal in een jaarthema. Een overzicht van alle jaarthema's kan je hieronder vinden.\r\n<br>\r\n<br>\r\nJaarthema's\r\n<ul style="list-style:none; padding:0;">\r\n<li> '18-'19 Harry Potter </li>\r\n<li> '19-'20 Game of Thrones </li>\r\n<li> '20-'21 Avatar The Last Airbender </li>\r\n<li> '21-'22 The Witcher </li>\r\n<li> '22-'23 The Lord of the Rings </li>\r\n<li> '23-'24 Pirates of the Caribbean </li>\r\n<li> '24-'25 Stranger Things</li>\r\n<li> '25-'26 How to train your dragon</li>\r\n</ul>\r\n\r\n</br>\r\n</br>\r\n</br>\r\n</br>\r\n### Ons schild:\r\n\r\n![Heimdal schild](https://i.imgur.com/Huht8uH.png "Heimdal Schild")	5
\.


--
-- Data for Name: Backend_election; Type: TABLE DATA; Schema: public; Owner: jormungandr
--

COPY public."Backend_election" (id, titel, uitleg, visible, "order") FROM stdin;
\.


--
-- Data for Name: Backend_event; Type: TABLE DATA; Schema: public; Owner: jormungandr
--

COPY public."Backend_event" (id, name, description, url, poster, start, "end", location, is_open, max_registered, genre_id) FROM stdin;
139	Kano	Hey Heimies \r\n\r\nOp <b>dinsdag 2 mei 2023</b> gaan we kanovaren met DoKano. We vertrekken vanaf <b>18u</b> aan het <a href= "https://www.google.com/maps/place/DOKANO+-+kano's/@51.0719411,3.7350207,15z/data=!4m6!3m5!1s0x47c371f8fbead23f:0x5564e9e2d3764ec1!8m2!3d51.0719411!4d3.7350207!16s%2Fg%2F11ghrbx56c" target="_blank"><b>Houtdok</b></a> (Kapitein Zeppospark, Chinastraat 1, 9000 Gent) \r\n\r\nBovendien willen we met deze leuke activiteit ook ons steentje bijdragen aan het Schoonwaterproject! We gaan tijdens onze tocht zoveel mogelijk afval verzamelen dat we tegenkomen op de Gentse wateren.<br /> Er zijn hierbij eco-bewuste beloningen voor de groep:<br />\r\n- met het meeste afval;<br />\r\n- die het best heeft gesorteerd;<br />\r\n- die de catch of the day binnenhaalt.\r\n\r\nLeden betalen voor deze activiteit €5, niet-leden betalen €6.\r\nSchrijf je dus voor 29 april in via <a href= "https://forms.gle/2216ur9cQeLbBL1R8" target="_blank"> deze form! </a>\r\n\r\nTot dan!<br />\r\n-Sport	https://forms.gle/2216ur9cQeLbBL1R8	events/Banner_Kano_reduced.jpg	2023-05-02 16:00:00+00	2023-05-02 19:00:00+00	DoKano, Houtdok	t	\N	2
141	Piraten Zeeslag	<h3>Ahoy There</h3> </br>\r\n\r\nOoit al willen behoren tot een echte piratencrew? </br> Grijp dan nu je kans want Heimdal maakt het mogelijk! <i> soort van</i> </br>\r\nOp dinsdag 18 april om 19:30 nodig ik jullie uit om samen een piratencrew te vormen en de net ontdekte "Vrolijke Oceaan" onveilig te maken. <i>kuch kuch De Vrolijke Viking</i>\r\n\r\nNatuurlijk gaan we niet gewoon zeeslag spelen, daarom hebben we het hele spel in een heel nieuw jasje gestoken.</br> Nu zullen jullie door middel van verschillende opdrachtjes de andere crews kunnen uitschakelen. </br> Inschrijven kan via de link hier beneden.</br>\r\n<strong>Yarr Harr Fiddle De Dee het tekstje lezen doe ik ni: </strong></br>\r\n\r\n<li>Voskenslaan 67 - De Vrolijke Viking</li>\r\n<li>https://forms.gle/mcqTzEF8N9KDXTVv9</li>\r\n<li>19:30</li>\r\n</ul>\r\n- Jullie "Cult"uur	https://www.facebook.com/events/948782642974601	events/336453935_542603068045931_6611733687090546620_n.jpg	2023-04-18 17:30:00+00	2023-04-17 22:00:00+00	Voskenslaan 67 - De Vrolijke Viking	t	\N	4
3	Heimdal Weekend	Ja Ja liefste Heimies het is zo ver.... Het <b>Weekend</b> <br>\r\nHet weekend zal doorgaan op locatie "De Brink - Zonnedauw" (volledig adres staat hier beneden) en zal nog altijd doorgaan van vrijdag 17 tot en met zondag 19 februari. \r\n\r\nJullie zullen je vanaf vandaag ook kunnen inschrijven voor het weekend wat ook verplicht is om deel te kunnen nemen. \r\nHet weekend is een Heimdalleden only event, dit wil zeggen dat je hier enkel aan kunt deelnemen mits je dit jaar lidgeld hebt betaald.\r\n\r\nMeer informatie kunnen jullie binnenkort verwachten. 😄\r\n\r\n⏲️ 17 --> 19 februari <br>\r\n📰 https://forms.gle/CXvuxqZ3D7bisBUd6 <br>\r\n🗺️ Bosbergen 1, 2200 Herentals - De Brink - Zonnedauw -\r\nhttps://www.hopper.be/nl/jeugdverblijf/de-brink/accommodatie/zonnedauw/\r\n💸 €55\r\n\r\nBij overschrijving storten naar "BE78 0689 0909 9686" met vermelding "Naam + Heimdal Weekend 2023"\r\n\r\nHopelijk zie ik jullie dan! \r\n\r\n~ Jullie "Cult"uur	https://fb.me/e/4VJyksE1M	events/2023-02-17_BannerWeekend.png	2023-02-17 16:00:00+00	2023-02-19 14:00:00+00	Bosbergen 1, 2200 Herentals (De Brink - Zonnedauw)	f	\N	4
186	Stuvo Village	<h2>Dit jaar openen we het academiejaar met een indrukwekkend STUVOvillage! </h2>\r\n\r\n<p>Leer je medestudenten kennen aan de pop-up bar, laat je culinair verwennen door STUVO catering of ga de uitdaging aan bij één van de kraampjes. </p> <p>Zo kan je bijvoorbeeld een maand lang gratis eten in de studentenrestaurants winnen! Naast het aanbod van studentenvoorzieningen, is het ook de ideale kans om een tal van studentenverenigingen en de studentenraad Revolte te leren kennen. </p> <strong>Afsluiten doen we met een special act om 18 uur! </strong>\r\n\r\nAlle HOGENT studenten zijn welkom op dinsdag 3 oktober van 11 tot 21 uur naast de Sporthal op campus Schoonmeersen.	https://hogent.sharepoint.com/sites/Onderwijs-studenten/_layouts/15/Event.aspx?ListGuid=44bdc844-354c-46c7-b263-8c55dba0e984&ItemId=3	events/schermen.jpg	2023-10-03 09:00:00+00	2023-10-03 19:00:00+00	Campus Schoonmeersen, naast de Sporthal	t	\N	5
2	Lustrumbal	Beste Heimies en sympathisanten\r\n\r\n*Geloof het of niet, maar dit jaar organiseert studentenvereniging Heimdal voor het eerst een galabal. Niet zomaar één, maar een echt lustrumbal!*\r\n\r\n*Voor ons 5-jarig bestaan halen we alles uit de kast. Waan jezelf in de bossen van het Fangorn Forest van Middle Earth.*\r\n\r\n\r\n> 📌 **Waar en Wanneer** 📅 \r\n\r\nLe Bateau (Muinkaai 1, 9000 Gent)\r\n\r\nVrijdag 17 maart\r\n\r\nLedenreceptie om 19u\r\n\r\nBal om 21u\r\n\r\n\r\n> 🎵 **Line-up** 🎵\r\n\r\n20u30 - 21u30: DJ Lamaroo\r\n\r\n21u30 - 23u30: DJ Sweetness Jack\r\n\r\n23u30 - 1u30: Les Mecs Eclectics\r\n\r\n1u30 - 3u30: DJ Nytril\r\n\r\n\r\n> ℹ️ **Praktische informatie** ℹ️\r\n\r\nEr is een vestiaire, dus voorzie eventueel wat klein geld.\r\n\r\nDrankjetons en tickets op het bal kunnen zowel cash als met bancontact betaald worden.\r\n\r\n\r\n> 🎫 **Tickets en Dresscode** 👗\r\n\r\nDe galabandjes/tickets zijn verkrijgbaar bij **iedereen van het lustrumcomité**:\r\nAndreas Moerman, Ruben Stalpaert, Eleen Verhelst, Hanne Adriaensen, Chaira Goethals, Bram Zeeuwe, Tanguy Montaine en Tyra Bourgeois\r\n\r\nDaarnaast kan je er ook verkrijgen in **De Vrolijke Viking**, ons clubcafé de **Comic Sans** en **het Praesidium**.\r\n\r\nVoorverkoop: €10\r\n\r\nAan de kassa: €12 met lint, €15 zonder lint\r\n\r\nDe dresscode luidt: **galakledij**.\r\n\r\nWij zijn alvast enorm enthousiast om dit te kunnen vieren met jullie. Nog eventjes wachten, maar alvast tot dan!\r\nJullie lustrumcomité\r\n\r\n**Gehoorbescherming mogelijk gemaakt door CM**	https://fb.me/e/2APMK8HA2	events/2023-03-17_BannerGalabal.png	2023-03-17 18:00:00+00	2023-03-18 02:30:00+00	Le Bateau (Muinkaai 1, 9000 Gent)	t	\N	8
1	The one LAN to rule them all	Hey Heimies!<br>\r\n<br>\r\nThe one LAN to rule them all is er over 1 maand tijd! We zullen zoals elk jaar talloze competities organiseren voor PC games maar ook voor andere consoles & voorzien we randanimatie met secret specials die op de avond zelf worden omhuld! 🥳<br><br>\r\nSave the date, invite a friend and bring it on!<br>\r\n<br>\r\n---\r\n📍: Locatie: **Resto D, Campus Schoonmeersen - 9000 Gent** <br>\r\n📅 Date: **27-04-2022** (donderdag 27 april) <br>\r\n🕒 Time: **18:00 - 06:00** <br>\r\n💸 Entry fee: **FREE!** :) <br>\r\n---\r\n<br>\r\nNet zoals vorige jaren kan je deelnemen aan verschillende competities en vallen er leuke prijzen te winnen. Ook kan je gewoon meedoen voor je plezier!\r\n\r\nSchrijf je in met deze form!: <a href="https://forms.gle/p5Ddp9uZpnV75WCa8" target="_blank">form<naam link></a>\r\n\r\n\r\n\r\n~ Party out 🥳	https://www.facebook.com/events/541915183933980	events/BannerLAN.png	2023-04-27 16:00:00+00	2023-04-28 04:00:00+00	Resto D, Campus Schoonmeersen - Gent	t	\N	7
106	Return of the filmavond	Hello There\r\n\r\nZoals jullie wel weten is dit jaar ons jaarthema Lord of the Rings. De Comic Sans heeft in het eerste semester hun deuren speciaal voor ons open gezet zodat we onze eigen mini-cinema konden maken!\r\n\r\nToen hebben we de volledige originele trilogie bekeken, en wat blijkt dat er nog een trilogie bestaat. <br>Nu kunnen we moeilijk anders dan deze ook nog te bekijken.\r\n\r\nDus hierbij mag ik aankondigen dat op 27 maart de filmavond 2.0 zal doorgaan in de Comic Sans featuring: "The Hobbit trilogy"\r\n\r\nInkom is gratis en snacks zullen voorzien worden!\r\n\r\n<b>Tijdschema:</b>\r\n<br>An Unexpected Journey:  16:30 -- 19:15\r\n<br>Pauze om te eten:               19:15 -- 19:45\r\n<br>Desolation of Smaug:         19:45 -- 22:25\r\n<br>Battle of the Five Armies: 22:25 -- 01:00\r\n\r\nJullie hoeven er niet van in het begin bij te zijn, indien je later zou toekomen wees niet te luid om de anderen niet te storen\r\n\r\n\r\nHopelijk tot dan!\r\n\r\n- Jullie "Cult"uur	\N	events/Filmavond2.0Banner_1.png	2023-03-27 14:00:00+00	2023-03-27 23:00:00+00	Comic Sans	t	\N	4
70	Karten	Hey Heimies!\r\n\r\nAlvorens het nieuwe Formule 1 seizoen in gang schiet gaan we met Heimdal zelf het circuit op! Op <b>dinsdag 28 februari</b> maken we vanaf <b>18u</b> de baan van eKart Gent onveilig. Is er een Max Verstappen onder ons? Mis deze leuke ervaring niet en laat maar eens zien wie de snelste is...\r\n\r\nLeden betalen het voordeeltarief van €25 voor 2 heats, niet-leden betalen €30. Binnen deze prijs zitten eKart-lidkaart, helmmuts en handschoenen inbegrepen. Inschrijven kan nog tot zondag 26 februari via <a href="https://forms.gle/Ugic9fxLMioNpXkx5" target="_blank">deze form</a>. \r\n\r\nTot dan!\r\n\r\n- Sport	https://forms.gle/Ugic9fxLMioNpXkx5	events/Banner_Karten_reduced.jpg	2023-02-28 17:00:00+00	2023-02-28 20:00:00+00	eKart Gent, Dok-Noord	t	32	2
69	Lustrumcantus	Beste Heimies \r\n\r\nOp **dinsdag 14 maart** zijn jullie allemaal welkom op het tweede event van de lustrumweek: ***De Heimdal cantus***. \r\n\r\nDit is een **vriendjes- en familiecantus**. Dat wil zeggen dat ieder lid van Heimdal 1 vriend(in) mag meenemen. \r\nDe cantus zal ook het principe van een **wisselcantus** volgen. Dit houdt in dat er tijdens de cantus wordt gewisseld van functies. Zo zullen alle voorgaande praesidia een deeltje van de cantus leiden. Ook de schachtenbak zal iedere keer gevuld zijn, zodanig iedereen onder zijn toenmalig praesidium eens in de schachtenbak zit.\r\n\r\n**PRAKTISCHE INFO**\r\n\r\n📍 Waar: Grote zaal Canard Bizar (Overpoortstraat 94)\r\n\r\n🕒 Wanneer: Deuren gaan open om 20u \r\n                      \r\nIo Vivat (de start van de cantus) wordt ingezet om 20u30\r\n\r\n🧑 Wie: Leden van Heimdal en hun + 1\r\n\r\n\r\n**PRIJZEN**\r\n\r\n🍻 Bier: €12\r\n\r\n🥤 Water: €3\r\n\r\n🔴 Fles grenadine: €2,5\r\n\r\n🍺 1 deel op bier: €6\r\n\r\n**INSCHRIJVEN**\r\n\r\nEr is slechts plek voor 50 personen, snel inschrijven is dus de boodschap!\r\nDit doe je via onderstaande Google Form en is mogelijk tot **13 maart, 16u**:\r\n\r\n\r\n<a href="https://forms.gle/Hd249tyHbHFazSG39" target="_blank">inschrijvings form</a>\r\n\r\nKan je er niet vanaf het begin bij zijn, dan kan je later aansluiten tijdens de pauzes. Deze worden later in het Facebookevent aangepast.\r\n\r\nHopelijk tot dan!\r\n\r\nMuzikale groeten\r\n\r\nhet lustrumcomité	https://fb.me/e/3pjIy8B9l	events/cantus_banner_met_schild_1.png	2023-03-14 19:00:00+00	2023-03-15 03:00:00+00	Grote zaal Canard Bizar	f	\N	8
35	Karakombola	Hello There\r\n\r\nTerwijl iedereen nog aan het bekomen is van de examens maken wij ons al op voor het eerste evenement van het 2de semester: De Karakombola! Op woensdag 15 februari combineren we de geliefde Karakoe met een tombola t.v.v. ons lustrum.\r\n\r\nMeer gedetailleerde uitleg over hoe de tombola zal werken zullen jullie op de avond zelf krijgen.\r\n\r\nGraag willen wij ook een sponsor bedanken voor het steunen van onze tombola namelijk Level Up Gent: een entertainment center waar plezier en gezelligheid centraal staan!\r\nWil jij samen met vrienden en familie iets nieuws te ontdekken? Dan ben je bij Level Up aan het juiste adres!\r\nIn hun aanbod vind je talrijke spannende en uitdagende activiteiten, geschikt voor zowel jong als oud. Je kan hier terecht voor activiteiten zoals Virtual reality,  Bumper football, een escape room en zoveel meer! \r\nVoor meer info: neem dan gerust een kijkje op https://levelupgent.com/ of neem contact op via: info@levelupgent.com. \r\n\r\n\r\n\r\nHopelijk zie ik jullie dan!\r\n\r\n- Jullie "Cult"uur & Lustrum Comité	https://www.facebook.com/events/578615537158770?ref=newsfeed	events/Karakombola.jpg	2023-02-15 19:00:00+00	2023-02-16 01:00:00+00	Comic Sans	t	\N	4
68	Lustrumreceptie	Beste Heimies\r\n\r\nOp maandag 13 maart zijn jullie allen en jullie +1 uitgenodigd op de openingsreceptie van onze lustrumweek.\r\nVanaf 20u kunnen jullie genieten van een hapje en een drankje in de Comic Sans. \r\n\r\nDresscode: casual chique \r\n\r\nTot dan!\r\n\r\nFeestelijke groeten\r\nHet lustrumcomité 🥳	https://fb.me/e/3n9dTX8vv	events/receptie_banner_met_schild.png	2023-03-13 19:00:00+00	2023-03-13 22:59:00+00	Comic Sans	f	\N	8
72	Lustrumstadsspel	Beste Heimies en sympathisanten...\r\n\r\nJormungandr heeft Odin ontvoerd en daarbij de Bifrost vernietigd!\r\nThor heeft een beloning beloofd aan de clan die als eerste de Bifrost kan repareren en Odin kan redden, maar pas op voor de multiverse Loki's die de boel proberen te saboteren...\r\n\r\nDe clans komen samen op **woensdag 15 maart** om 18u15 aan het **ICC**.\r\n\r\nWil je graag meedoen met dit avontuurlijk stadsspel, schrijf je naam dan zeker op de lijst zodat Thor weet hoeveel uitrusting hij moet voorzien:\r\n\r\nhttps://forms.gle/WKqoaC3uSpUDR2Ss8\r\n\r\nDappere groeten\r\n\r\nclan lustrumcomité	https://fb.me/e/2QYHBj6cf	events/stadsspel_banner_finaal.png	2023-03-15 17:15:00+00	2023-03-15 20:00:00+00	Gent ICC	t	\N	8
73	BBB: Bar, BBQ & Bands	Beste Heimies, Asgaardianen en sympathisanten\r\n\r\nVoor het 5-jarige bestaan van Heimdal organiseren wij in samenwerking met Jeugdhuis Asgaard een **BBB: Bar, BBQ & Bands** op **donderdag 16 maart**.\r\nJullie kunnen rekenen op een gezellige barbecue onder vrienden en enkele omringende activiteiten zoals bijvoorbeeld een (pokémon) springkasteel en kubb. \r\nLater op de avond zullen jullie kunnen losgehen op shows van Motion Blur (met onze enige echte Feest & LAN als drummer) en Boxing Day!\r\n\r\n> **Voor degenen die mee eten:**\r\n\r\nJe kan je via onderstaande website inschrijven en ons laten weten wat je graag zou willen op de barbecue. \r\n\r\n**BELANGRIJK**\r\n\r\nGelieve een “BBQ” ticket aan te kopen (6 euro voor de huur van het materiaal en het buffet) EN een ticket per stuk vlees (of veggie alternatief) dat je wil bestellen!\r\nhttps://asgaard.anykrowd.app/#/events/detail/75\r\n\r\n> **Voor degenen die niet mee eten:**\r\n\r\nJe bent zeker welkom voor gewoon een gezellige avond vol sfeer en muziek!\r\n\r\n> **Praktische info:**\r\n\r\nBetaling aan de bar verloopt het vlotst via de betaalapp van Asgaard. Meer informatie hierover vind je later in het Facebookevent. \r\nDoor de werken zul je een andere weg moeten nemen om binnen te geraken, ook hier vind je later meer informatie over in het Facebookevent. Zet je dus zeker op gaan om deze updates te ontvangen! \r\n\r\n> **Timetable:**\r\n\r\n15:00 Vanaf nu ben je welkom!\r\n\r\n18:00 Eten \r\n\r\n20:30 Motion Blur\r\n\r\n21:40 Boxing Day\r\n\r\nSee you on the barbecue,\r\n\r\ngerookte groetjes\r\n\r\nlustrumcomité	https://fb.me/e/2Ig9OiNX3	events/bbb_banner_met_schild.png	2023-03-16 14:00:00+00	2023-03-16 22:00:00+00	Asgaard (Driebeekstraat 4, 9050 Gent)	t	\N	8
140	Open vergadering	Heyhey Heimies<br />\r\n<p>Op 20 april organiseren wij onze tweede en laatste open vergadering. Deze zal van start gaan om <b>18u30</b> te <a href="https://www.google.com/maps/place/HOGENT+campus+Schoonmeersen+-+gebouw+T/@51.0275324,3.7064273,18z/data=!4m6!3m5!1s0x47c373cc567c6c83:0x8eedd058eda89fe1!8m2!3d51.0280469!4d3.7062181!16s%2Fg%2F11f6nkp2nn" target="_blank"> HOGENT campus Schoonmeersen gebouw T, lokaal 1.034</a>. Dit is de laatste open vergadering voor de verkiezingen en dus het ideale moment om inzicht te krijgen in hoe het praesidium werkt.<br /> Voor degene die geïnteresseerd zijn om zich tijdens de verkiezingen te stellen voor de functie Secretaris is er ook een mogelijkheid voorzien om zich reeds in te werken naar volgend jaar toe. De info hierover is bij de Secretaris (<a href="https://m.me/jolien.leenknegt" target="_blank">Jolien Leenknegt </a>op Facebook, Jolien#4766 op Discord) te verkrijgen. De agendapunten zullen later in het evenement gepost worden. </p>\r\n<p>Om deze vergadering zo vlot mogelijk te laten verlopen, vragen we jullie om volgende formulieren in te vullen:<br />\r\n- <a href="https://forms.gle/L5Tt3AuW4rqabm2dA" target= "_blank"> Feedbackformulier</a>: hier kunnen jullie feedback geven op de evenementen en praesidium. <br />\r\n- Het <a href="https://forms.gle/ibvgkPfzwTSRfwD19" target="_blank">inschrijvingsformulier </a> om een zicht te krijgen op het aantal leden die aanwezig zullen zijn.</p>\r\n❓Wat: Open vergadering<br />\r\n🗺 Locatie: GSCHT 1.034<br />\r\n📆Datum: Donderdag 20 april<br />\r\n🕐Uur: 18u30<br />\r\n📜<a href="https://forms.gle/ibvgkPfzwTSRfwD19" target="_blank"> Inschrijvingsformulier </a><br />\r\n📃<a href="https://forms.gle/L5Tt3AuW4rqabm2dA" target= "_blank"> Feedbackformulier </a>\r\n<p>Hopelijk horen we jullie op 20 april!<br />\r\nJullie mening telt!<br /><br />\r\nGroetjes, Jolien</p>	https://www.facebook.com/events/6033245710057523	events/Banner_OpenVergadering_reduced.jpg	2023-04-20 16:30:00+00	2023-04-20 18:30:00+00	HOGENT Schoonmeersen T 1.034	f	\N	1
143	Heimdal verkiezingen 2023-2024	hey Heimie \r\nHet jaar is voorbijgevlogen want het is alweer tijd voor ***de verkiezingen.***\r\nOp maandag ***15 mei om 19u*** zijn jullie allemaal welkom in de Comic Sans om te stemmen op jullie favoriete kandidaat, of zelf mee te doen natuurlijk :wink: . \r\n\r\n***Kandidatuur*** \r\nElk ontgroend lid kan zich kandidaat stellen voor een functie, mits voldaan aan de voorwaarden. Ook voor de schachtjes, jullie kunnen zeker de kandidatuur al insturen want de ontgroening valt voor de verkiezingen.  De vereisten kun je terug vinden in de statuten. \r\nhttps://heimdal.be/statuten/\r\n\r\nWil je weten wat alle functies precies inhouden? Neem dan zeker eens een kijkje naar de powerpoints van het huidige praesidium! \r\nhttps://drive.google.com/drive/folders/1swA5OfXg0mTYJbK8ErgFUwlSjHOxAq08?usp=share_link\r\n\r\nJe hebt tot ***8 mei 23u59*** om je kandidatuur in te dienen, hierna sluiten de inschrijvingen. Inschrijven is mogelijk via deze form.\r\nhttps://forms.gle/xKXrrHVv7VXm1Bnj7\r\n\r\nGraag vragen we ook een motivatiebrief van minstens 1 A4 lang die dan ingediend wordt via het inschrijvingsformulier. \r\n\r\n***Uitzondering aanvragen*** \r\nSoms heb je een uitzondering nodig voor bepaalde functies. Dit kan zijn omdat: \r\n- Je geen (toekomstig) HOGENT-student bent. \r\n- Je geen jaar ervaring hebt binnen het praesidium (voor de functies Praeses, Vice en Quaestor). \r\n- Je geen relevante ervaring hebt voor de functie ICT. \r\n\r\nUitzonderingen kunnen aangevraagd worden tot ***6 mei*** via de inschrijvingsform of via verkiezingen@heimdal.be\r\n\r\nHeb je nog vragen? stuur zeker naar iemand van het kiescomité\r\n- Chaira Goethals \r\n- Benny De Bock \r\n- Jochen Wimme \r\n- Ritchie Van mele\r\n- Nick Lersberghe\r\n\r\ngroetjes \r\nDe Praeses	\N	events/LegeBanner.jpg	2023-05-15 17:00:00+00	2023-05-15 22:00:00+00	Comic Sans	f	\N	35
142	Ontgroening: The Last Obstacle: A Journey Through Middle Earth	Ho, dappere strijders (@Schacht) van Heimdal!\r\n\r\nDe tijd is nabij voor de langverwachte ontgroening van onze nieuwe bondgenoten (toekomstige commies)! Op 3 mei om 18:00 uur zullen we verzamelen bij de Eeuwige Vrolijke Viking, waar de poorten van avontuur zich voor jullie zullen openen. Wees op tijd, want om 18:30 uur zullen we aanvangen!\r\n\r\nVrees niet, deze ontgroening zal niet smerig of wreed zijn. We willen dat jullie een epische en uitdagende ervaring hebben, waarbij jullie jezelf tot het uiterste kunnen drijven en samenwerken met jullie nieuwe medestrijders. We zullen ons uiterste best doen om ervoor te zorgen dat jullie rond 21:00 uur triomfantelijk zullen eindigen.\r\n\r\nTrek jullie comfortabele sportkleding aan en bind stevige schoenen aan jullie voeten, want we zullen ons begeven op onbekend terrein. Vergeet niet voldoende water en snacks mee te nemen om jullie energie op peil te houden tijdens deze heroïsche beproeving.\r\n\r\nWij, de dappere leiders van deze queeste, kijken uit naar jullie komst en het gezamenlijk beleven van een onvergetelijke ontgroening!\r\n\r\nMet de kracht van de goden,\r\nDe shafttamer en zen baptise crew  \r\n  \r\n#TLDR\r\nStartlocatie: Vrolijk Viking  \r\nUur: 18u  \r\nDatum: 3 Mei\r\n\r\nStoplocatie: Comic Sans  \r\nAfronden rond: 21u  \r\n\r\nOptioneel: Sportkledij, water, snack	https://fb.me/e/12gJXVsIL	events/BannerOntgroening-v5.png	2023-05-03 16:00:00+00	2023-05-03 19:00:00+00	De Vrolijke Viking	f	\N	6
187	HOGENT openingsfuif: The Masterclass	<h2>Start Smart, Party Hard!</h2>\r\n\r\nDe praesidia van HOGENT samen <b>“The Masterclass”</b>, in de Concertzaal van De Vooruit.\r\n<p>The Masterclass is ons groot & gezamenlijk openingsfeest voor alle Gentse studenten!</p>\r\n\r\n<p>Het wordt het ideale evenement om het academiejaar goed in te zetten, de studentenverenigingen te leren kennen en nieuwe studenten in Gent te verwelkomen.\r\nIedereen is welkom!</p>\r\n\r\n<p>Studenten betalen slechts 5,- inkom. </br>\r\n<b>HOGENT-studenten krijgen een gratis drankje voor 00:00.</b></p>\r\n\r\n<p><i>Powered by HoGent & Nasty Mondays.\r\nMet de steun van Studio Brussel, Coca Cola, Red Bull & Jack Daniëls.</i></p>\r\n\r\n<p>Meer info over de line-up komt er snel aan.</p>\r\n<Strong><a href="https://shop.paylogic.com/bb9b3f4682424ad5a939239092eef466/">Koop alvast je tickets hier</a>\r\n  </strong>	https://www.facebook.com/events/359659286387252?ref=newsfeed	events/375958087_643968654487281_1239920632810301840_n.jpg	2023-10-12 20:00:00+00	2023-10-13 01:00:00+00	Vooruit Sint-Pietersnieuwstraat 23, 9000 Gent, Belgium	t	\N	5
177	Stadsspel & Lintophanging	Hey Heimies, geïnteresseerden en sympathisanten\r\n\r\n\r\nHet is zover: het eerste cultuurevenement van dit jaar komt eraan!\r\nOp **donderdag 5 oktober** verzamelen we om **18u30 aan het ICC** voor een stadsspel. Dit stadsspel is een bijzondere versie omdat we voor het eerst werken via een app. Ook geïnteresseerden kunnen in aanraking komen met wat ons Heimdal maakt dankzij de kleine geeky insteken, iedereen is welkom dus neem gerust je vrienden mee. \r\n\r\n\r\nNa het stadsspel eindigen we rond 21u in **De Vrolijke Viking**, ons kersverse metercafé, dat die avond ook wordt geëerd met een **lintophanging** om 21u30. Kan je niet deelnemen aan het stadsspel, dan ben je vanaf **20u** welkom in De Vrolijke Viking. Kom dus zeker deze speciale gelegenheid mee vieren! \r\n\r\n\r\nOm deel te nemen aan het stadsspel hoef je slechts 2 dingen te doen:\r\n\r\n- de app *Actionbound* alvast downloaden op je smartphone:\r\nAndroid: https://play.google.com/store/search?q=actionbound&c=apps \r\nIOS: https://apps.apple.com/us/app/actionbound/id582660833 \r\n\r\n- je inschrijven via onderstaande Google Form (dit kan tot 4/10):\r\nhttps://forms.gle/uAhxUbLipsczZtYx5 \r\n\r\n\r\nIk ben er al helemaal klaar voor, jullie ook?\r\n\r\nSpeelse groeten\r\n\r\nJullie Cultuur, Tyra \r\n\r\n**TLDR 1**\r\n\r\nWanneer: 05/10 om 18u30\r\n\r\nWaar: ICC, Familie Van Rysselberghedreef 2, 9000 Gent\r\n\r\nWat: stadsspel via Actionbound\r\n\r\n**TLDR 2**\r\n\r\nWanneer: 05/10 vanaf 20u\r\n\r\nWaar: De Vrolijke Viking, Voskenslaan 67, 9000 Gent\r\n\r\nWat: lintophanging in metercafé	https://fb.me/e/1tOdJwSmb	events/Stadsspel_Facebook_Cover_1.png	2023-10-05 16:30:00+00	2023-10-05 21:00:00+00	ICC, Familie Van Rysselberghedreef 2, 9000 Gent	t	\N	4
144	Fantasy Party	Hey Heimies en sympathisanten\r\n\r\n𝐸𝑣𝑒𝑟 𝑤𝑎𝑛𝑡𝑒𝑑 𝑡𝑜 𝑘𝑛𝑜𝑤 ℎ𝑜𝑤 𝑖𝑡 𝑓𝑒𝑒𝑙𝑠 𝑡𝑜 𝑝𝑎𝑟𝑡𝑦 𝑤𝑖𝑡ℎ 𝑒𝑙𝑣𝑒𝑠 𝑎𝑛𝑑 𝑘𝑛𝑖𝑔ℎ𝑡𝑠? 𝑊𝑜𝑛𝑑𝑒𝑟𝑖𝑛𝑔 ℎ𝑜𝑤 𝑎𝑛 𝑒𝑛𝑐ℎ𝑎𝑛𝑡𝑒𝑑 𝑓𝑜𝑟𝑒𝑠𝑡 𝑟𝑒𝑎𝑙𝑙𝑦 𝑙𝑜𝑜𝑘𝑠 𝑙𝑖𝑘𝑒?\r\n𝑁𝑜𝑤 𝑖𝑠 𝑦𝑜𝑢𝑟 𝑐ℎ𝑎𝑛𝑐𝑒!\r\n\r\nWoensdag 17 mei toveren we ons geliefd clubcafé, de Comic Sans, om in een betoverend bos.\r\n\r\nTrek je beste medieval fantasy outfit aan, proef van onze voorraad health, stamina of mana potions en dans op de beste muziek!\r\n\r\n🆃🅻🅳🆁\r\n\r\n📍 : Comic Sans\r\n\r\n⏲️ : woensdag 17 mei, om 18u\r\n\r\n⚔️ : thema 'medieval fantasy' (kom verkleed als je wil)\r\n\r\n\r\nFairydust greetings\r\n\r\nhet lustrumcomité\r\n\r\nStudentenvereniging Heimdal	https://fb.me/e/2B8Q7Su2l	events/Themafeestje.png	2023-05-17 16:00:00+00	2023-05-18 02:00:00+00	Comic Sans	t	\N	8
184	1ste Clubavond	Hey Heimies\r\n\r\nHet academiejaar gaat officieel van start, wat betekent dat ook onze officiële clubavonden terugkeren!\r\nDe eerste clubavond gaat door op woensdag 27/09, vanaf 20u in de Comic Sans (you know the drill 😉). Neem zeker je geïnteresseerde vrienden mee voor een eerste kennismaking. 😊\r\n\r\nEnthousiaste groeten\r\nJullie Praesidium 2023 - 2024	https://fb.me/e/1A3sQPCKQ	events/1e_clubavond_facebook_omslagfoto.png	2023-09-27 18:00:00+00	2023-09-27 21:00:00+00	Comic Sans, Klein Turkije 8, 9000 Gent	t	\N	3
185	Student Kick-off 2023 Student Village	Kom ons zeker eens bezoeken op de Student Village van SKO dit jaar!	https://www.facebook.com/StudentKickOff/?locale=nl_NL	events/369730978_855838215936296_818843122419429743_n-min.png	2023-09-27 10:00:00+00	2023-09-27 16:00:00+00	SINT-PIETERSPLEIN	t	\N	5
188	Mario Kart toernooi	<h2>Beste Heimies, Mario Kart fans</h2>\r\n\r\nNa het succes van vorig jaar organiseert Heimdal ook dit jaar een Mario Kart-toernooi.</br>\r\n\r\nBattle en race naar glorie en wordt Heimdal’s nieuwe <Strong>“King/Queen of Mario Kart”!</Strong></br>\r\n\r\nBovendien zijn er tal van leuke prijzen te winnen.</br>\r\n\r\nHet toernooi wordt georganiseerd op <Strong>maandag 9 oktober </Strong> om <Strong> 18u30 </Strong>  in de <Strong> Comic Sans </Strong> (<i>Klein Turkije 8, 9000 Gent</i>).\r\n\r\n</br>\r\nInschrijven voor het Mario Kart event kan via de link hieronder of ter plaatste voor 19u. </br>\r\n<a href=https://forms.gle/WsMhrgNGxvAXmEZ78>Ik word de nieuwe King/Queen of Mario kart! (inschrijvingslink)</a>\r\n\r\n<strong>Leden: €3,00</strong></br>\r\n<strong>Niet leden: €5,00</strong></br>\r\nTe betalen op <strong>BE71 7370 7028 8869</strong>\r\n\r\nTot dan!\r\nJullie Sport, Eline	https://www.facebook.com/events/817677513483510/?acontext=%7B%22event_action_history%22%3A[%7B%22extra_data%22%3A%22%22%2C%22mechanism%22%3A%22surface%22%2C%22surface%22%3A%22edit_dialog%22%7D%2C%7B%22extra_data%22%3A%22%22%2C%22mechanism%22%3A%22surface%22%2C%22surface%22%3A%22permalink%22%7D%2C%7B%22extra_data%22%3A%22%22%2C%22mechanism%22%3A%22surface%22%2C%22surface%22%3A%22edit_dialog%22%7D]%2C%22ref_notif_type%22%3Anull%7D	events/384191719_697060312450385_4036713803930496146_n.jpg	2023-10-09 16:30:00+00	2023-10-09 21:30:00+00	Comic Sans	t	\N	2
178	Karakoe	Hey Heimies\r\n\r\nHet is weer tijd voor een echte Heimdal-klassieker: de Karakoe!\r\n**Woensdag 18 oktober** zullen jullie vanaf **20u** je prachtige stemgeluid kunnen laten klinken in de **Comic Sans**.\r\n\r\nNeem zeker je lint en/of lidkaart mee, want op vertoon van deze items krijg je van ons enkele jetons waarmee je een gratis consumptie* kan nuttigen.\r\n**OPGELET: deze jetons kunnen enkel gebruikt worden op de avond van de karakoe.** \r\n\r\n*de waarde van 1 jeton komt overeen met 1 PepsiCo of Cristal pils 25cl\r\n\r\nMuzikale groeten\r\nJullie Cultuur\r\n\r\nTLDR\r\n📆 Wanneer: 18/10 om 20u\r\n📍  Waar: Comic Sans\r\n🔎 Wat: Karakoe	https://fb.me/e/4LQoZhUOW	events/Facebook_omslagfoto.png	2023-10-18 18:00:00+00	2023-10-18 21:00:00+00	Comic Sans, Klein Turkije 8, 9000 Gent	t	\N	4
181	Sinterklaas clubavond	Aankomende woensdag, 6 december, is het niet enkel de nadoop en meter-/peteravond, ook **de Sint komt op bezoek** bij Heimdal!\r\n\r\nEr zal **een beloning** worden voorzien voor elke Heimie die zich voorbeeldig heeft gedragen, alleen heeft de Sint wat problemen met het beoordelen van wie goed is geweest en wie stout...\r\nDaarom heeft Sint-Nicolaas een leuke en eenvoudige manier bedacht om zijn oordeel te kunnen vellen.\r\n\r\nBenieuwd? Kom dan zeker naar onze Sinterklaas clubavond!\r\n\r\nIk zie jullie dan!	https://fb.me/e/4O6P2qV51	events/Facebook_omslagfoto_5.png	2023-12-06 19:00:00+00	2023-12-06 22:00:00+00	Comic Sans, Klein Turkije 8, 9000 Gent	t	\N	3
179	Ghost Hunt Clubavond	Hey heimies\r\n\r\nSpoopy season is here en dat laten wij ons niet zomaar voorbij gaan. 👻\r\n\r\n𝗪𝗼𝗲𝗻𝘀𝗱𝗮𝗴 𝟭 𝗻𝗼𝘃𝗲𝗺𝗯𝗲𝗿 heb ik speciaal voor jullie een kleine activiteit staan van 𝟮𝟭𝘂 𝘁𝗼𝘁 𝟮𝟮𝘂 voor tijdens de clubavond. \r\n\r\nWie weet verdien jij wel een prijs...\r\nInschrijven is niet nodig, gewoon afkomen is de boodschap!\r\n\r\nGhostly greetings\r\nJullie Cultuur	https://fb.me/e/3Z3teKLoo	events/Facebook_omslagfoto.png	2023-11-01 19:00:00+00	2023-11-01 22:00:00+00	Comic Sans, Klein Turkije 8, 9000 Gent	t	\N	3
189	Doop: Attack on the Spanish Galleon	Hou jullie maar al vast aan de masten van de schepen, want de doop komt eraan!\r\nWil jij samen met alle andere feuten je Heimdal lintje verdienen, schrijf je dan in voor de doop en kom op 25 oktober je eigen pirate crew versterken!\r\n\r\nVoor de doop spreken we af op 25 oktober om 18u in ons metercafé de Vrolijke Viking.\r\n\r\nOm te kunnen deelnemen aan de doop zijn er een paar dingen die jullie eerst moeten doen.	https://www.facebook.com/events/1148548805981536	events/Doop-Banner.png	2023-10-25 16:00:00+00	2023-10-25 20:00:00+00	De Vrolijke Viking	t	\N	6
183	Comfy Secret Santa	***Ho Ho Ho!*** \r\n\r\nSinterklaas moet dan nog wel eerst uit Spanje komen met zijn stoomboot, maar toch beginnen wij al aan onze voorbereidingen voor ons coziest event van het jaar: de **Comfy Secret Santa**! 🎄\r\n\r\n**Woensdag 20 december** zal onze laatste officiële clubavond zijn van dit semester. Traditioneel doen we dan een Secret Santa waarbij we een cadeautje *tussen de €5 en €10* voorzien voor een mede-heimie. Schrijf je in via onderstaande Google Form en dan krijg jij binnenkort te horen voor wie jij een cadeautje mag voorzien:\r\n\r\nhttps://forms.gle/wJWFtzhUuZzXshHu6\r\n\r\n***Deadline voor inschrijven is maandag 4/12***\r\n\r\nDe 'Comfy' in 'Comfy Secret Santa' staat er niet zomaar. Kom gekleed in je **beste kerstoutfit**, of trek je **comfiest pyjama** aan en wie weet win jij wel een extra kerstcadeautje als best-geklede! Elk aanwezig lid dat verkleed komt, maakt hier kans op. (Je moet dus niet ingeschreven zijn voor de Secret Santa om comfy te zijn 😜)\r\n\r\nHeb je vragen, stuur dan zeker naar de Cultuur Tyra Bourgeois\r\n\r\nComfy groetjes\r\n\r\nJullie Cultuur	https://fb.me/e/396g5yruP	events/Facebook_omslagfoto_1.png	2023-12-20 20:00:00+00	2023-12-20 22:00:00+00	Comic Sans, Klein Turkije 8, 9000 Gent	t	\N	3
180	Escape room & Boardgames	*Are you ready to race against time and escape?* 🕑 \r\n\r\nJa ja, binnenkort sluiten wij jullie weer op in een **Escape Room** en testen wij jullie puzzelvaardigheden. Hopelijk geraak jij er op tijd uit...\r\n\r\n```\r\nWanneer en waar?\r\n```\r\n\r\nDit jaar trekken we op **maandag 20 november** naar **ExitGames Gent**, te Bagattenstraat 132. Benieuwd naar welke escape rooms wij hebben geboekt, bekijk dan zeker de Google Form.\r\n\r\nWe verzamelen om **18u30 in de bar** van ExitGames. Er zullen verschillende boardgames aanwezig zijn om te gebruiken terwijl de andere groep in de escape rooms zit. Je mag uiteraard ook zelf boardgames meenemen.\r\n\r\n```Inschrijven\r\n```\r\n\r\nDe prijs bedraagt voor onze **leden: €20, voor niet-leden: €22,50**. Je dient betaald te hebben tegen **15 november** of een betalingsbewijs te hebben. Als je betaling niet in orde is, gaat je plek naar de eerste persoon op de wachtlijst.\r\n\r\nSnel inschrijven is een must en kan via onderstaande Google Form: er zijn slechts 36 plaatsen beschikbaar. Ook hiervoor is de **deadline 15 november**\r\n\r\n**LET OP!! Zorg dat je zeker op tijd bent. Door de strakke timing van de escape rooms kan het zijn dat je niet langer kan deelnemen als je te laat komt. 16 november wordt er in het Facebookevent de groepsverdeling, en dus ook het uur dat je ten laatste aanwezig moet zijn, gepost.**\r\nhttps://forms.gle/uC2qXFCzj6cnq4gJ9\r\n\r\n**TLDR**\r\n\r\n📆 Wanneer: maandag 20 november om 18u30\r\n\r\n📍 Waar: Bagattenstraat 132, 9000 Gent\r\n\r\n💰 Prijs: Leden: €20, niet-leden: €22,50\r\n\r\n🔎 Wat: Escape Room	https://fb.me/e/3WEyrLJTt	events/Facebook_omslagfoto-1.png	2023-11-20 17:30:00+00	2023-11-20 21:30:00+00	Exit Games, Bagattenstraat 132, 9000 Gent	t	\N	4
227	Open vergadering	Heyhey Heimies!\r\n\r\nJullie hebben duidelijk gemaakt dat jullie graag een open vergadering willen dit semester, dus bij deze:\r\nDe open vergadering zal doorgaan op woensdag 22/11 op HOGENT Campus Schoonmeersen in lokaal GSCHB.3.016.\r\n\r\nDe vergadering begint om 18 uur stipt, na de vergadering zullen we samen naar de clubavond gaan. Indien je niet op tijd aanwezig kan zijn is dit geen probleem, laat mij dit gewoon op voorhand weten en sluit op het moment zelf in stilte aan bij de vergadering wanneer je toekomt.\r\n\r\nOm een overzicht te krijgen van de aanwezigen vraag ik jullie om onderstaande form in te vullen.\r\n\r\nForm inschrijving vergadering: https://forms.gle/ejTvsqKqEi55StDs7\r\n\r\nDaarnaast wil ik jullie graag ook vragen om het feedback formulier in te vullen over afgelopen evenementen van dit semester.\r\nVul dit zeker ook in indien je niet aanwezig kan zijn op de vergadering!\r\n\r\nForm feedback: https://forms.gle/36sMVShQyDm9P8mj8\r\n\r\nHopelijk tot op de vergadering!\r\nJullie Secretaris x	https://fb.me/e/3XZqHuOVL	events/Open_vergadering.png	2023-11-22 17:00:00+00	2023-11-22 19:00:00+00	HOGENT Campus Schoonmeersen	f	99	1
192	Overpoort Feestje: The Hunt for booty	Heyhey Heimies!\r\n\r\nHeimdal's 3de feest komt eraan! 🥳 \r\nThe hunt for booty is het thema en daar gaan wij een hele avond op knallen! Haal dus jullie chique piratenkledij maar alvast uit de kast. \r\n\r\nNatuurlijk is er geen echte hunt zonder fluobandjes! Deze zullen jouw status aantonen en ter plaatse uitgedeeld worden ;)\r\nOok zullen er heerlijke cocktails (en een mocktail) zijn bij het feestje!\r\n\r\n> TL:DR\r\n📌 The Place - Overpoort (Overpoortstraat 60, 9000 Gent)\r\n🗓️ Donderdag 9 november\r\n🕐 21:30h\r\n👗 Dress to Impress (pirates style)	\N	events/banner_OVP_feest_v1.4-1.png	2023-11-09 20:30:00+00	2023-11-10 01:00:00+00	Overpoortstraat 62, 9000 Gent	t	\N	7
228	Heimdalweekend	***Ladies and gents, this is the moment you've waited for...***\r\nAhoy Heimies!\r\n\r\nVan **23 tot en met 25 februari** start Heimdal aan zijn groots, jaarlijks avontuur: **hèt Heimdalweekend**!\r\n\r\nHopelijk heb jij zeebenen, want dit jaar nodigen wij jullie uit op ons schip in **Moerkensheide, De Pinte**. \r\n\r\n> **Inschrijven**\r\n\r\nInschrijven doe je via onderstaande Google Form en kan **tot en met 31 januari**.\r\n\r\nhttps://forms.gle/eHhugmHBVNWzvB31A\r\n\r\nOok even een kleine herinnering dat je je nog kan inschrijven voor de **kookploeg** tot en met 17 november.\r\nEven checken waaraan en waaraf? Volg de link:\r\n\r\nhttps://discord.com/channels/427941471568789525/886598898490150922/1164970646145605753\r\n\r\n> **Kostprijs**\r\n\r\nHet weekend kost €55. De verblijfskosten, eten, frisdrank en activiteiten zijn hierin inbegrepen. Het volledige bedrag dient betaald te zijn tegen **9 februari**. Overschrijven kan op het nieuwe rekeningnummer: *BE71 7370 7028 8869* met vermelding van '*Heimdalweekend (voorschot) + naam*'.\r\n\r\n\r\n**VROEGE VOGEL?** \r\nAls jij je inschrijft vòòr **20 december**, krijg je een €5 vroegboekkorting!\r\n\r\n\r\n**OPGEPAST: VOORSCHOT**\r\nWegens organisatorische redenen, vragen wij iedereen om een voorschot van €25 te betalen binnen 14 dagen na inschrijving. Dit voorshot is non-refundable bij annulering na 9 februari.\r\n\r\n> **Extra informatie**\r\n\r\nWil jij alvast een sneak peek van wat jou allemaal te wachten staat?\r\nCheck de infobrochure!\r\n\r\n> **Vragen**\r\n\r\nContacteer de Cultuur Tyra Bourgeois\r\n\r\n> **TLDR**\r\n\r\nWanneer: 23 t.e.m. 25 februari\r\n\r\nWaar: Hoofdgebouw Moerkensheide\r\n           Beekstuk 10, 9840 De Pinte\r\n\r\nPrijs: €55 (exclusief €5 vroegboekkorting)\r\n\r\nDeadline inschrijven: 31 januari\r\n\r\n\r\n\r\n\r\nEnthousiaste groeten\r\n\r\nJullie Cultuur	https://fb.me/e/152Ms9AlX	events/Facebook_banner_Heimdalweekend_1920_x_1055_px.png	2024-02-23 17:00:00+00	2024-02-25 16:00:00+00	Hoofdgebouw Moerkensheide, Beekstuk 10 9840 De Pinte	f	\N	4
268	Escape Room	Ooit al eens opgesloten gezeten? Wel nu is je kans! <br>Op **20 maart** gaan we naar Lockdown escape room in Dok Noord.<br>\r\nDe prijs om deel te nemen bedraagt **€ 21** voor leden en **€ 25** voor niet-leden.\r\n\r\nVanaf **18u15** kan je naar **Hal 16** komen om in afwachting van je tijdsslot gezelschapsspelletjes te spelen of van de sfeer genieten. \r\n\r\nJe kan je inschrijven via volgende link:<br>\r\n🔗 <a href="https://forms.gle/ChHp7Sepggo6Lb238">https://forms.gle/ChHp7Sepggo6Lb238</a>\r\n\r\nHierin kan je ook aangeven met wie je graag samen zou zitten en welke escape room(s) je al gedaan hebt. \r\n\r\n⚠️ *Opgelet! Er zijn maar 30 plaatsen, dus schrijf je snel in voor het te laat is!*\r\n\r\n**TLDR**: <br>\r\n📍 Lockdown escape rooms, Dok Noord Gent <br>\r\n📅  20 maart <br>\r\n🕐  18u15 <br>\r\n💶  Leden: € 21, niet-leden: € 25 <br>\r\n\r\nHopelijk tot dan!\r\nJullie allerliefste Cultuur, Kirsten	https://forms.gle/ChHp7Sepggo6Lb238	events/EventBanners_sem2_6.jpg	2025-03-20 17:15:00+00	2025-03-18 22:00:00+00	Lockdown escape rooms - Dok Noord	t	30	4
229	The WAN of the Flying Dutchman	Hey heimies </br>\r\n\r\nDit jaar organiseren we opnieuw een WAN-party!\r\nDit is een voorproefje van wat er op onze LAN in het tweede semester zal gebeuren. </br>\r\n\r\n📍 Locatie: Heimdal Discord  </br>\r\n📅 08-12-2023 (vrijdag 8 december) </br>\r\n🕒 16:30u - 23:00u </br>\r\n💸 Entry fee: FREE! :) </br>\r\n\r\nNet zoals vorige jaren kan je deelnemen aan verschillende competities en vallen er leuke prijzen te winnen. Ook kan je gewoon meedoen voor je plezier!\r\n\r\n> Games:\r\n- Fall Guys\r\n- Geometry Dash\r\n- Clash Royale\r\n- Geoguessr\r\n- League of Legends\r\n- Gartic Phone\r\n- Among Us\r\n\r\n**Info over de competities, prijzen en games staan in de inschrijvingsform.**\r\n\r\n> Inschrijven:\r\nhttps://forms.gle/tiyLsnQswLnWK4pN9\r\n\r\nHet hele evenement wordt gestreamd op Twitch en YouTube van Heimdal!\r\nDit jaar zijn alle spellen speelbaar zowel op GSM als PC (uitzondering: League of Legends enkel op PC)\r\n\r\nTot na Sinterklaas!\r\n~ Mijn schoentje staat al klaar 🥳	\N	events/404612972_885169942843252_3603758268421308742_n.jpg	2023-12-08 15:30:00+00	2023-12-08 22:00:00+00	TBA	t	\N	7
269	Schachtenevent: Return to Hawkins	Beste Heimies,\r\n\r\nHier zijn we dan met het jaarlijkse **Schachtenevent**. Dit jaar *(om wat in thema te blijven)* hebben we ervoor gekozen om een Stranger Things stadsspel te organiseren! Deze zal beginnen op **13 maart 2025** in de **Comic Sans** om **18u30**. <br>\r\nHawkins heeft jullie hulp nodig! Dus worden jullie de helden die de monsters zullen verslaan?\r\n\r\nInschrijven kan via volgende link: <br>\r\n🔗 <a href="https://docs.google.com/forms/d/e/1FAIpQLSc-VyjkXZr3gV4MkuwfpR1UNr65dsT96_r0qy0XSMgjxk97YA/viewform?usp=dialog">https://docs.google.com/forms/d/e/1FAIpQLSc-VyjkXZr3gV4MkuwfpR1UNr65dsT96_r0qy0XSMgjxk97YA/viewform?usp=dialog</a>\r\n\r\n\r\n\r\nJe kan je **inschrijven tot maandag 10/03**!\r\n\r\n**TLDR:** <br>\r\n📍  Comic Sans<br>\r\n📅  13 maart<br>\r\n🕐  18u30<br>\r\n📝  Deadline: 10/03\r\n\r\nTot dan! <br>\r\nJullie schachtjes	https://docs.google.com/forms/d/e/1FAIpQLSc-VyjkXZr3gV4MkuwfpR1UNr65dsT96_r0qy0XSMgjxk97YA/viewform?usp=dialog	events/Event_Banner.jpg	2025-03-13 17:30:00+00	2025-03-13 20:30:00+00	Comic Sans	t	\N	6
241	LAN 2024	Hey iedereen\r\n\r\nSta je al klaar voor onze 6de LAN-Party? \r\nPirate's Code: LAN of the Buccaneers is here!\r\n\r\n📅Date: 28/03/2024 - 29/03/2024 </br>\r\n📍Place: Valentin Vaerwyckweg 1, 9000 Gent, Campus Schoonmeersen, Gebouw D, Resto D</br>\r\n⏰ Time: 19.30h - 06.00h</br>\r\n</br>\r\nCompos:</br>\r\n- League of Legends (2v2 ARAM)</br>\r\n- MarioKart 8 Deluxe</br>\r\n- Teamfight Tactics</br>\r\n- Minecraft</br>\r\n- F1</br>\r\n</br>\r\nDit jaar zullen er 4 challenges zijn waarbij je stukje voor stukje een code zal ontrafelen. Eenmaal je de volledige code hebt gevonden, win je een prijs!\r\n</br>\r\nNaast de main competities en de code die gekraakt moet worden, zullen er ook boardgames en randanimatie aanwezig zijn. Ook zullen wij een aantal games streamen op de Twitch en Youtube van Heimdal. \r\n\r\nInschrijven voor de LAN kan met <a href="https://forms.gle/kDFFGgzFNeHQBeURA">DEZE FORM</a>!	https://fb.me/e/1UIwqcIuY	events/lan_website_poster.png	2024-03-28 18:30:00+00	2024-03-29 05:00:00+00	Valentin Vaerwyckweg 1, 9000  Gent - Campus Schoonmeersen, Gebouw D, Resto D	t	\N	7
249	Halloween Clubavond	Hey heimies!\r\n\r\nOp woensdag 30 oktober is er geen officiële clubavond maar... het is wel griezeltijd. <br>Kom naar deze gezellige avond en jaag iedereen de schrik op het lijf met je beste verkleedkleren! <br>(Uiteraard geen vereiste, maar wel aan te raden 👀)\r\n\r\nWie aan Halloween denkt, denkt aan "trick or treat". <br>Kom dan ook gerust eens aankloppen voor enkele treats bij je geliefde Cultuur.\r\n\r\n**Waar en wanneer?**<br>\r\n📍  Comic Sans<br>\r\n📅  30/10/2024<br>\r\n🕐  20u00 \r\n\r\nTot dan! 👻\r\n\r\nMet enge groetjes,<br>\r\nJullie allerliefste Cultuur,<br>\r\nKirsten	\N	events/EventBanners_sem1_7.jpg	2024-10-30 19:00:00+00	2024-10-30 22:00:00+00	Comic Sans	t	\N	4
515	Movie Night	Oi Heimies!\r\n\r\nDeze maand zal de Movie Night plaatsvinden op 25 november waarbij we tezamen een film gaan kijken! Breng je meest comfortabele dekentje en kussen mee en geniet van een gezellige avond met Heimies!\r\nWe zullen starten om 19:00u in Schoonmeersen Gebouw B, lokaal 1.015\r\nMaar om van een movie night te kunnen spreken heb ik eerst nog een film nodig, en dit wil ik aan jullie overlaten om die keuze te maken! 😃\r\nJe kan namelijk stemmen op één van de opties in de poll op Discord.\r\nDe poll zal na een week afgesloten worden, dus je zal tijd genoeg hebben om na te denken over je keuze, maar ook weer niet té lang mee wachten 😉\r\nAlvast bedankt voor jullie bijdrage en tot binnenkort!\r\nHou er rekening mee dat de Movie Night zal plaatsvinden op een dag dat er staking is voor het OV!\r\n\r\nFilmtastische groetjes,\r\nJullie liefste Cultuur, Ricardo\r\n\r\nTL:DR\r\n\r\n🗓️ 25 november\r\n\r\n🕖 19:00 - 22:00\r\n\r\n📍 Schoonmeersen Gebouw B, lokaal GSCHB.1.015	\N	events/Banner_Movie_Night.png	2025-11-25 18:00:00+00	2025-11-25 21:00:00+00	Campus Schoonmeersen	t	\N	4
516	Nadoop	Heyhey Feuten!\r\nBen je er niet geraakt op onze doop? Wil je je nog steeds bewijzen als een stoere viking? Vrees niet en kom naar onze nadoop! Deze is op 03 december, en volledig binnen in ons metercafé de Vrolijke Viking.\r\n\r\nNog even een korte recap van hoe je je kan inschrijven voor de nadoop:\r\nSchrijf je via deze link (https://forms.gle/u5SmJBcafyhm3EKh9) in voor de vereniging en betaal je ledengeld!\r\nSchrijf je via deze link (https://forms.gle/61G2yk6k4Zc6VdBm9) in voor de nadoop\r\n\r\nTL:DR\r\n\r\n🗓️ 03 December\r\n\r\n🕡 18:30-20:30\r\n\r\n📍 De Vrolijke Viking (Voskenslaan 67)\r\n\r\n🔗 Schrijf je in voor de vereniging en de nadoop \r\n\r\nhttps://forms.gle/u5SmJBcafyhm3EKh9\r\nhttps://forms.gle/61G2yk6k4Zc6VdBm9	\N	events/Banner_Nadoop.png	2025-12-03 17:30:00+00	2025-12-03 19:30:00+00	Vrolijke Viking (Voskenslaan 67, 9000 Gent)	t	\N	6
191	Nadoop	Hey Feutjes!\r\n\r\nJullie 2e kans komt eraan om jullie lintje te verdienen!\r\nWil jij samen met alle andere feuten je Heimdal lintje verdienen, schrijf je dan in voor de nadoop en kom op 6 december je eigen pirate crew versterken!\r\n\r\nVoor de doop spreken we af op 6 december om 18u in ons metercafé de Vrolijke Viking.\r\n\r\nOm te kunnen deelnemen aan de nadoop zijn er een paar dingen die jullie eerst moeten doen.\r\n\r\nStap 1:\r\n Vul onderstaande form in.\r\nhttps://forms.gle/JXYJXZS3StUS652u5\r\n\r\nStap 2:\r\n \r\nBetaal je lidgeld (indien dit nog niet gebeurd is).\r\nAls je lidgeld nog niet betaald is kan dit via het rekeningnummer  BE71 7370 7028 8869 met de mededeling "[naam] [voornaam] lidgeld 23 - 24"\r\nHet lidgeld bedraagt €12 voor nieuwe leden en dekt de doopkosten en het clublint.\r\n\r\nWat krijg je er voor terug?\r\n\r\nToegang tot de Heimie-kanalen op Discord.\r\n(Voicecalls general en games, 📄 quote-wall, 🍹clubavond, 👌im-ok-chat, ...)\r\nKorting op de Heimdalevenementen.\r\n(bv.: Schaatsen, Escape rooms, Mario-Kart toernooi en meer\r\nDe kans om mee te doen met Heimie only events.\r\n(Secret Santa, het epische Heimdalweekend, ...)\r\nVoordelen bij de sponsors van Heimdal.\r\n(Gratis toegang tot de gameroom en andere voordelen zullen steeds vermeld worden via onze socials)\r\n\r\nTLDR\r\n\r\nWat: Nadoop\r\nWaar: Vrolijke Viking\r\nWanneer: 6 december om 18u\r\n\r\nBij vragen kan je terecht bij mij of bij de leden van het Doopcomité \r\n@Reina | Secretaris | Davy Jones\r\n@Hayley | Vice | Elizabeth Swann\r\n@Zweetbeest  | Arïes | Noa\r\n@Bram | ber Turd\r\n\r\nGroetjes jullie Schachtentemmer\r\n@Will Turner | Temmer | Rein \r\n“Savvy?!”	https://www.facebook.com/events/1054855855941137	events/banner_data_V2.png	2023-12-06 17:00:00+00	2023-12-06 21:00:00+00	Vrolijke Viking	t	\N	6
236	Just Dance Toernooi	Beste Heimies, Just Dance fans \r\n\r\n\r\n\r\nOm het tweede semester op een sportieve manier in te zetten organiseert Heimdal voor de allereerste keer een **Just Dance evenement**. Dit op **maandag 12 februari 2024** in de** Comic Sans** (Klein Turkije 8, 9000 Gent). Jullie zijn allemaal welkom **vanaf 19u00.**\r\nWe verwelkomen jullie graag of je nu een ballerina bent, of gewoon zin hebt om plezier te maken en je dansmoves te laten zien. Voor bijkomende vragen kan je altijd contact opnemen met de Sport (Eline Claeys).\r\n\r\n\r\nExtra info:\r\n-Het evenement wordt gespeeld op de Nintendo Switch.\r\n-Elke deelnemer danst minimaal 3 liedjes. \r\n-Er zijn tal van leuke prijzen te winnen.\r\n\r\nInschrijven voor Just Dance kan via onderstaande link of ter plaatse voor 19u 20.\r\nhttps://forms.gle/hbEtgxBRPWVawqLVA\r\n\r\n\r\nLeden: €2,00\r\nNiet-leden: €3,00\r\nTe betalen op BE71 7370 7028 8869 (Naam + Just dance)\r\n\r\n\r\nTot dan!\r\nJullie Sport, Eline	https://www.facebook.com/events/7197423880334882?acontext=%7B%22event_action_history%22%3A[%7B%22extra_data%22%3A%22%22%2C%22mechanism%22%3A%22left_rail%22%2C%22surface%22%3A%22bookmark%22%7D%2C%7B%22extra_data%22%3A%22%22%2C%22mechanism%22%3A%22surface%22%2C%22surface%22%3A%22create_dialog%22%7D%2C%7B%22extra_data%22%3A%22%22%2C%22mechanism%22%3A%22your_upcoming_events_unit%22%2C%22surface%22%3A%22bookmark%22%7D]%2C%22ref_notif_type%22%3Anull%7D	events/Banner_Just_Dance_V2.2.webp	2024-02-12 18:30:00+00	2024-02-12 22:30:00+00	Comic Sans (Klein Turkije 8, 9000 Gent)	t	\N	2
230	Will you be my Valentine Clubavond	Onze eerste clubavond van het tweede semester komt er aan en we kunnen deze op een wel heel speciale manier vieren.\r\nHet is dan namelijk 14 februari, oftewel Valentijn.\r\n\r\nWil jij op deze speciale gelegenheid jouw liefde tonen aan een mede-heimie, of wil jij jouw crush anoniem een geeky valentijnskaart kunnen geven, dan kan je deze vanaf nu bestellen bij mij via onderstaande form. Bestellen kan tot 16:00 op maandag 12/02. Je kan maximaal 3 kaarten bestellen en moet per kaart dat je wil bestellen de form opnieuw invullen.\r\n\r\nhttps://forms.gle/thxcTpgDEgnmzVSF9\r\n\r\nJe hebt de mogelijkheid om te kiezen tussen 5 verschillende designs en verschillende met de hand geschreven tekstjes. Je kan ook kiezen om zelf een tekstje te verzinnen die wij dan voor jou zullen schrijven. Anoniem of niet, het is zoals jij het wil! \r\n\r\nLiefdevolle groetjes\r\n\r\nJullie Cultuur	https://fb.me/e/1OksbykYY	events/Pink__Turquoise_Valentine_Greeting_Facebook_Cover.png	2024-02-14 19:00:00+00	2024-02-14 22:59:00+00	Comic Sans, Klein Turkije 8, 9000 Gent	t	\N	3
243	Ontgroening	De jaarlijkse ontgroening, waar de huidige schachten kunnen ontgroend worden tot Commiltonen.	\N	events/425781726_775097041313378_8362581842975735826_n.jpg	2024-05-01 15:30:00+00	2024-05-01 20:30:00+00	De Vrolijke Viking --> Comic Sans	t	\N	6
226	Heimdal schaatsen	Beste @Heimies en sportievelingen,\r\n\r\nNaar jaarlijkse gewoonte zetten wij de winter al schaatsend in! Dit op DINSDAG 28 november 2023 en niet op maandag 27 november zoals op de jaarbanner vermeld staat. We spreken gezamenlijk af aan de ijsbaan Kristallijn (Warmoezeniersweg 20, 9000 Gent) om 19u45.\r\n\r\nInschrijven kan enkel via de link hieronder en moet voor 24 november 2023 gebeuren.\r\nLink: https://forms.gle/9SrUebKog2U3QeY87\r\n\r\nHeimdal leden betalen €5, niet-leden €7. Betaling gebeurt liefst via overschrijving naar ons nieuw rekeningnummer BE71 7370 7028 8869 met beschrijving (Schaatsen + Voornaam + Achternaam) of via Mobiel (QR) ter plaatse. In deze prijs zit zowel het gebruik van de baan als de schaatsen.\r\n\r\n\r\nLeden: 5€\r\nNiet-leden: 7€\r\nTe betalen op BE71 7370 7028 8869 (Schaatsen+ Voornaam+ Achternaam)\r\n\r\n\r\nTot dan!\r\nJullie Sport, Eline	https://www.facebook.com/events/683093370672166/?acontext=%7B%22event_action_history%22%3A[%7B%22surface%22%3A%22external%22%7D%2C%7B%22mechanism%22%3A%22your_upcoming_events_unit%22%2C%22surface%22%3A%22bookmark%22%7D]%2C%22ref_notif_type%22%3Anull%7D	events/Banner_Schaatsen.png	2023-11-28 18:45:00+00	2023-11-28 20:30:00+00	ijsbaan Kristallijn (Warmoezeniersweg 20, 9000 Gent)	t	\N	2
234	Karakoe & schildophanging	De tweede karakoe van dit academiejaar komt er aan, deze keer een extra speciale editie!\r\n<br>Op woensdag 17 april hangen we voor het eerst ons schild op in de Comic Sans om 20u30. Daarna vieren we deze uitzonderlijke gebeurtenis met een karakoe.\r\n\r\nNeem zeker je lint en/of lidkaart mee, want op vertoon van deze items krijg je van ons enkele jetons waarmee je een gratis consumptie* kan nuttigen.\r\n<br>OPGELET: deze jetons kunnen enkel gebruikt worden op de avond van de karakoe.\r\n\r\n*de waarde van 1 jeton komt overeen met 1 PepsiCo of Cristal pils 25cl\r\n\r\n<br>\r\nMuzikale groeten\r\n<br>Jullie Cultuur\r\n\r\n<br>\r\nTLDR\r\n<br>📆 Wanneer: woensdag 17 april om 20u\r\n<br>📍  Waar: Comic Sans\r\n<br>🔎 Wat: Karakoe & schildophanging	https://fb.me/e/3BIjyewIc	events/1e_clubavond_facebook_omslagfoto_Instagram-bericht_Vierkant_Facebook-omslagfoto_3.png	2024-04-17 18:00:00+00	2024-04-17 21:59:00+00	Comic Sans, Klein Turkije 8, 9000 Gent	t	\N	3
237	Schaaktoernooi Heimdal	Beste Heimies\r\n\r\nZoals jullie weten is niet alleen E- en fysieke sport een deel van Heimdal, ook denksport maakt hier een groot onderdeel uit. Om dit extra in de verf te zetten organiseert Heimdal een schaaktoernooi. Deze vindt plaats op dinsdag 12 maart 2024 in de Vrolijke Viking (Voskenslaan 67, 9000 Gent). Het toernooi begint om 20u00. Voor bijkomende vragen kan je altijd contact opnemen met de Sport (Eline Claeys).\r\n\r\nInschrijven kan via de link hieronder of ter plaatse. Het deelnemen aan het schaaktoernooi is volledig gratis!\r\nhttps://forms.gle/31Px9txHBixt11r19\r\n\r\nGeen zin om te schaken? Ook supporters zijn zeker welkom!\r\n\r\nDenkende groetjes,\r\nJullie Sport, Eline	https://www.facebook.com/events/399923522516140?acontext=%7B%22event_action_history%22%3A[%7B%22mechanism%22%3A%22calendar_tab_event%22%2C%22surface%22%3A%22bookmark_calendar%22%7D]%2C%22ref_notif_type%22%3Anull%7D	events/424992715_772746521548430_113538874630742943_n.jfif	2024-03-12 19:00:00+00	2024-03-12 22:30:00+00	De Vrolijke Viking, Voskenslaan 67, 9000 Gent	t	\N	2
231	Pizza & Boardgames	Na het grote succes van de Pizza & Boardgames avond van vorig jaar, kiezen we ervoor om dit evenement nog eens te organiseren.\r\n\r\n<br>\r\nOp 𝗱𝗼𝗻𝗱𝗲𝗿𝗱𝗮𝗴 𝟮𝟭 𝗺𝗮𝗮𝗿𝘁 is iedereen welkom 𝘃𝗮𝗻𝗮𝗳 𝟭𝟴𝘂 om gezellig samen boardgames te spelen 𝗶𝗻 𝗗𝗲 𝗩𝗿𝗼𝗹𝗶𝗷𝗸𝗲 𝗩𝗶𝗸𝗶𝗻𝗴. Voor de boardgames hoef je je niet in te schrijven.\r\nZin om een eigen boardgame mee te nemen? Zeker doen!\r\n\r\n<br>\r\nVoor diegene die zin hebben in een lekkere pizza (met korting 😜) deze avond, kan je deze bestellen via onderstaande form. Er kunnen 𝗺𝗮𝘅𝗶𝗺𝗮𝗮𝗹 𝟭𝟰 𝗽𝗶𝘇𝘇𝗮'𝘀 𝗽𝗲𝗿 𝘂𝘂𝗿 gemaakt worden, dus zullen de opties om een tijdslot te kiezen verdwijnen naarmate deze tijdsloten volzet zijn. We vragen dan ook om de form een tweede keer in te vullen indien je een tweede pizza zou willen bestellen. First ordered = first out!\r\n<br>\r\n𝙇𝙀𝙏 𝙊𝙋: 𝙙𝙚 𝙙𝙚𝙖𝙙𝙡𝙞𝙣𝙚 𝙫𝙤𝙤𝙧 𝙗𝙚𝙨𝙩𝙚𝙡𝙡𝙚𝙣 𝙚́𝙣 𝙗𝙚𝙩𝙖𝙡𝙚𝙣 𝙞𝙨 𝙯𝙤𝙣𝙙𝙖𝙜 17 𝙢𝙖𝙖𝙧𝙩!\r\n\r\n<br>\r\nWelke pizza's kan je bestellen vraag je? Hier vind je al even de lijst: <br>\r\n- Margeritha - €9 <br>\r\n- Buffelmozzarella - €11 <br>\r\n- Chorizo - €11<br>\r\n- Gerookte ham - €11<br>\r\n- Supreme (buffelmozzarella & chorizo) - €13<br>\r\n- Deluxe (buffelmozzarella & gerookte ham) - €13<br>\r\n\r\n<br>\r\nGoogle Form:\r\nhttps://forms.gle/PEo5fTuWtvp9kmbr5\r\n\r\n<br>\r\nHongerige groeten\r\nJullie Cultuur \r\n\r\n𝗧𝗟𝗗𝗥<br>\r\n📆 Wanneer: donderdag 21 maart vanaf 18u<br>\r\n📍   Waar: De Vrolijke Viking<br>\r\n💰 Prijs: afhankelijk van welke pizza je bestelt (tussen €9 en €13)<br>\r\n📝 Inschrijven: niet nodig, enkel om pizza's te bestellen<br>\r\nhttps://forms.gle/PEo5fTuWtvp9kmbr5	https://fb.me/e/5cnfiKrFu	events/Facebook_omslagfoto_2.png	2024-03-21 17:00:00+00	2024-03-21 21:00:00+00	De Vrolijke Viking, Voskenslaan 67, 9000 Gent	t	\N	4
303	HOGENT Dodgeball Toernooi	Hey Heimies!\r\n\r\nNa onze triumfante overwinning van vorig jaar, gaan we dit jaar weer meedoen aan het dodgeball toernooi van HOGENT om onze titel te verdedigen (en mogelijks weer een prijs te winnen!!!). Het toernooi zelf is op 24 maart op campus Schoonmeersen, maar inschrijven kan maar tot **12 maart** zodat we op tijd ons team kunnen doorgeven. \r\n\r\nLink om in te schrijven: <br>\r\n(*note: alleen heimies kunnen meedoen*) <br>\r\n🔗 <a href="https://forms.gle/1eq9GpdJ7npnZFJA9">https://forms.gle/1eq9GpdJ7npnZFJA9</a>\r\n\r\nOntwijkende groetjes, <br>\r\nJullie Sport Seppe <br>\r\n\r\n📍Sportzaal Campus Schoonmeersen <br>\r\n📅24/03/25 (inschrijven **ten laatste 12 maart**) <br>\r\n🕐18u	https://forms.gle/1eq9GpdJ7npnZFJA9	events/EventBanners_sem2_12.jpg	2025-03-24 17:00:00+00	2025-03-24 22:00:00+00	Sporthal campus Schoonmeersen	t	\N	2
232	Easter Egg Hunt Clubavond	Pasen kruipt steeds dichterbij en de paasklokken komen speciaal voor ons een paar dagen vroeger terug van Rome. <br>\r\nOp **woensdag 27 maart** vliegen ze over het **Begijnhofdriespark om 21u** en droppen ze heel wat chocolade.\r\n\r\n<br>\r\nWil jij dus genieten van al dat lekkers of gewoon lekker nostalgisch paaseieren rapen? Kom dan rechtstreeks naar het Begijnhofdriespark of vertrek samen met het Praesidium om 21u vanuit de Comic Sans. De Cultuur zal jullie daar opwachten. Hierna kunnen we samen terugkeren naar de Comic Sans en gezellig samenzijn op onze clubavond.\r\n\r\n<br>\r\nP.s. indien het slecht weer is, blijven we in de Comic Sans.<br>\r\nP.p.s. neem een zaklamp mee of gebruik je gsm als je wil. Paaseieren rapen in het donker is een uitdaging. 😉 \r\n\r\n<br>\r\n**TLDR**<br>\r\nEaster Egg Hunt Clubavond<br>\r\n📆 Wanneer: woensdag 27 maart om 21u<br>\r\n📍 Waar: Begijnhofdriespark	https://fb.me/e/52szbfaOX	events/Blue_Illustration_Easter_Egg_Hunt_Facebook_Cover.png	2024-03-27 20:00:00+00	2024-03-27 21:00:00+00	Begijnhofdriespark	t	\N	3
233	Movie Night	Zit je comfortabel? Heb je jouw favoriete snack mee? <br>Top, dan kan de film beginnen!\r\n\r\nOp maandag 15 april om 20u doen we nog eens een Movie Night in de Comic Sans.<br>\r\nWij voorzien de snacks, jullie kiezen de film.\r\nIn de Discord server vind je een lijst met mogelijke films, de film met de meeste stemmen zullen we samen zien. Stemmen doe je door te reageren met de corresponderende emoji en kan tot en met zaterdag 13 april.\r\n\r\nZie je jouw favoriete film niet staan?<br> Zet hem dan in de thread en wie weet voegen we hem toe aan de lijst (dit is niet gegarandeerd en hangt ervan af of we hem kunnen voorzien of niet).\r\nAfhankelijk van de tijd en de goesting kan er een tweede film gekeken worden.\r\n\r\nhttps://discord.com/.../1024589825606.../1224277006481358911\r\n\r\nP.s. Neem gerust een dekentje of iets anders mee zodat je helemaal comfy kan zijn.\r\n\r\n<br>Cinematische groeten\r\n<br>Jullie Cultuur\r\n\r\n<br>TLDR\r\n<br>📆 Wanneer: maandag 15 april om 20u\r\n<br>📍 Waar: Comic Sans	https://fb.me/e/hZUuJQDu0	events/Red_And_Black_Illustrated_Movie_Night_Facebook_Cover.png	2024-04-15 18:00:00+00	2024-04-15 20:00:00+00	Comic Sans, Klein Turkije 8, 9000 Gent	t	\N	4
259	Tetris Toernooi	Hey Heimies!\r\n\r\nHeimdal organiseert voor het eerst een Tetris Toernooi! <br>Een toffe avond waarin je eens je beste puzzel-skills naar boven kan halen <br>\r\n\r\n**Waar en wanneer?**<br>\r\n📍  Comic Sans (Klein Turkije 8, 9000 Gent)<br>\r\n📅  4/11/2024<br>\r\n🕐  19u30 (vanaf 19u kan je binnen)<br>\r\n💰  €3 (Of €2 als je Heimdal lid bent 😉)<br><br>\r\n**Inschrijven**<br>\r\nKan via volgende link<br>\r\n🔗 https://forms.gle/druRi3MTbiuGqDHAA\r\n<br>Of ter plaatse voor 19u zolang plaatsen beschikbaar zijn. <br><br>\r\n\r\n❗*Voor het toernooi zal Tetr.io gebruikt worden en zal je een eigen laptop moeten meenemen, moest dit niet lukken mag je altijd eens sturen en bekijken we mogelijke oplossingen*	https://forms.gle/druRi3MTbiuGqDHAA	events/TetrisToernooi_FBevent.jpg	2024-11-04 18:30:00+00	2024-11-04 20:30:00+00	Comic Sans	t	\N	2
304	PowerPoint avond: Praesidiumfuncties	Hey Heimies!\r\n\r\nNaar aanloop van de verkiezingen organiseert het praesidium een **PowerPoint avond** om jullie wat meer info te geven over alle functies binnen Heimdal, alsook over de algemene werking. Per functie zal er een praesidiumlid een PowerPoint presenteren over hoe de functie nu precies in elkaar zit en wat hun opvolger zoal te wachten staat! \r\n\r\nTwijfel je nog over welke functie nu het beste bij jou past, overweeg je al om in mei op te komen voor een bepaalde functie of heb je gewoon interesse in hoe het praesidium werkt? Schrijf je dan zeker in en kom ons vergezellen op **maandag 31 maart**!\r\n\r\n**Info en inschrijven**: <br>\r\n🗓️ maandag 31 maart <br>\r\n🕢 19:00u <br>\r\n📍 Comic Sans (Klein Turkije 8, 9000 Gent) <br>\r\n📎 <a href="https://forms.gle/1SKQ7w79W677du2N7">https://forms.gle/1SKQ7w79W677du2N7 </a> <br>\r\n\r\nHopelijk tot dan!<br>\r\nVeel gemotiveerde groetjes,<br>\r\njullie Heimdal praesidium 🐲🫶	https://forms.gle/1SKQ7w79W677du2N7	events/EventBanners_sem2_18_v1.jpg	2025-03-31 17:00:00+00	2025-03-31 21:00:00+00	Comic Sans (Klein Turkije 8, 9000 Gent	f	\N	6
238	Heimdal Bowlen	Om het tweede semester sportief af te sluiten organiseert Heimdal een bowlingavond. Dit op dinsdag 23 april 2024 in de bowling O'Learys Gent (Dok-Noord 7/301, 9000 Gent). We spreken gezamenlijk af om 19u45 aan de ingang van de bowling. \r\n\r\nPS: Leden die meespeelde met dodgeball mogen gratis bowlen. Dit door het winnen van de hoofdprijs ter waarde van 100 euro in O'Learys. Inschrijven is nog steeds verplicht!\r\n\r\n\r\nInschrijven voor het bowlen kan via onderstaande link:\r\nhttps://forms.gle/eQT6NLSG3rrxSXy97\r\n\r\nOPGEPAST! Inschrijven kan tot 17 april. Voor extra info en/of vragen kan je terecht bij de Sport Eline. \r\n\r\nLeden: €5,00\r\nNiet-leden: €7,50\r\nDodgeball spelers: €0,00\r\nTe betalen op BE71 7370 7028 8869 (Naam + Bowlen)\r\n\r\n\r\nRollende groeten \r\nJullie Sport, Eline	https://www.facebook.com/events/250995977949897?acontext=%7B%22event_action_history%22%3A[%7B%22mechanism%22%3A%22calendar_tab_event%22%2C%22surface%22%3A%22bookmark_calendar%22%7D]%2C%22ref_notif_type%22%3Anull%7D	events/424992715_772746521548430_113538874630742943_n.jfif	2024-04-23 17:45:00+00	2024-04-23 21:30:00+00	T.B.A	t	\N	2
240	Open vergadering	Het eind van het semester nadert en dat wil dus zeggen dat het tijd is voor de tweede open vergadering.\r\n\r\nWil jij jouw feedback of mening over Heimdal kwijt? Schrijf je dan zeker in!\r\n\r\nMeer info via Discord of heb Facebook-event.	https://www.facebook.com/events/383008474727881?acontext=%7B%22event_action_history%22%3A[%7B%22extra_data%22%3A%22%22%2C%22mechanism%22%3A%22unknown%22%2C%22surface%22%3A%22notifications_tab%22%7D%2C%7B%22extra_data%22%3A%22%22%2C%22mechanism%22%3A%22left_rail%22%2C%22surface%22%3A%22bookmark%22%7D%2C%7B%22extra_data%22%3A%22%22%2C%22mechanism%22%3A%22calendar_tab_event%22%2C%22surface%22%3A%22bookmark_calendar%22%7D]%2C%22ref_notif_type%22%3A%22event_profile_plus_create%22%2C%22source%22%3A%2229%22%7D	events/Open_vergadering_2.png	2024-04-24 16:00:00+00	2024-04-24 18:00:00+00	HOGENT Campus Schoonmeersen	f	99	1
242	Feest 2024	Heimdal's 2de feest van het jaar komt eraan! 🥳</br>\r\nSunset Island is het thema waarbij je met je tofste zomerkledij (of beach-outfit) in ovp zal feesten! Voor de enthousiastelingen die een waterpistool willen meedoen, wat houdt jullie tegen?\r\nZoals elke editie, zullen er heerlijke cocktails (en een mocktail) zijn!\r\n\r\n\r\nTL:DR </br>\r\n📌 The Place - Overpoort (Overpoortstraat 60, 9000 Gent)</br>\r\n📅 Dinsdag 7 mei</br>\r\n⏰ 22:30h</br>\r\n🥂 1 cocktail voor €2,5, 4 voor €8</br>\r\n👗 Beach/Zomers\r\n\r\n\r\n~ To all whom start new chapters and to the ones who end their studies ~	\N	events/feest_ovp.png	2024-05-07 20:30:00+00	2024-05-08 01:00:00+00	Overpoortstraat 60, 9000 Gent	t	\N	7
235	Verbroedering met Confabula	Op 𝗺𝗮𝗮𝗻𝗱𝗮𝗴 𝟮𝟵 𝗮𝗽𝗿𝗶𝗹 gaat ons eerste officiële verbroederingsevent met Confabula door. <br>\r\n\r\nWe spreken om 20u af 𝗶𝗻 𝗱𝗲 𝗩𝗿𝗼𝗹𝗶𝗷𝗸𝗲 𝗩𝗶𝗸𝗶𝗻𝗴, want ook in De Vrolijke Viking, ons kersverse metercafé, zullen wij 𝗼𝗻𝘀 𝘀𝗰𝗵𝗶𝗹𝗱 𝗼𝗽𝗵𝗮𝗻𝗴𝗲𝗻 naast het schild van onze vrienden van Confabula!\r\n\r\n<br>\r\nAmusante groeten<br>\r\nCultuur van Confabula én Cultuur van Heimdal <br>\r\nJolien en Tyra \r\n\r\n<br>\r\n🆃🅻🅳🆁<br>\r\n📆 Wanneer: maandag 29 april om 20<br>\r\n📍 Waar: De Vrolijke Viking<br>\r\n🔎 Wat: schildophanging van Heimdal in De Vrolijke Viking	https://fb.me/e/3Gea4ioew	events/banner_verbroedering_finaal.PNG	2024-04-29 18:00:00+00	2024-04-29 21:00:00+00	De Vrolijke Viking, Voskenslaan 67, 9000 Gent	f	\N	4
250	Doop: Escape the Upside Down	```\r\nLOOKING FOR: VOLUNTEER1NG RESEARCHERS \r\n``` <br>\r\n``` \r\nGOAL: INVESTIGATE THE ORIGIN OF UNEXPL4INABLE SIGNALS  \r\n``` <br>\r\n```\r\nREWARD: ACC3SS TO ???\r\n```  <br>\r\n\r\nHee daar Feutjes!  \r\nZijn jullie klaar voor een nieuw avontuur? Om jouw schachtenlintje te verdienen kun je je inschrijven voor de enige echte **Heimdal doop** op **woensdag 6 november**! Samen zullen we de oorzaak van enkele *mysterieuze* signalen onderzoeken, daarvoor moeten we een expeditie doen naar... the Upside Down 🙃 \r\nAan de hand van een stadswandeling met onderweg enkele teambuilding opdrachten zullen jullie elkaar (en misschien jezelf!) hopelijk al wat beter leren kennen!\r\nWe eindigen de avond met de officiële inwijding van alle deelnemers en een *traktatie* (lees: schachtenpap) van de Temmer!<br>  \r\nNog even wat praktische info!  \r\n- Hier kan je je **inschrijven**: <a href="https://forms.gle/xXvhA1bRKEZqi4TMA" target="_blank">inschrijvingsformulier</a> (*dit is het inschrijvingsformulier voor Heimies, als je deze al hebt ingevuld hoeft dat natuurlijk niet opnieuw* 😉)  \r\n- We spreken af **om 18:00u** bij ons metercafé **de Vrolijke Viking (Voskenslaan 67, Gent)**  \r\n- De doop eindigt rond 21:00u in ons petercafé **de Comic Sans (Klein Turkije 8)**  \r\n- Na de doop organiseren we een **meter- en peteravond**: hier kom je te weten wie jouw meter(s) en/of peter(s) zullen zijn!  \r\n- Je hoeft niets mee te brengen (behalve jezelf natuurlijk!)\r\n\r\nHeb je nog vragen, bezorgdheden of iets wat je kwijt wil? Dan kan je zoals altijd terecht bij het **Doopcomité** en de **Temmer**! \r\nTwijfel niet om ons een berichtje te sturen!\r\nHopelijk sluiten we de avond van 6 november af met veel nieuwe scha(ch)tjes ❤  \r\nVeel liefs,\r\nde Temmer en haar doopcomité (Daan, Reina, Maxe, Lucas en Seppe)	https://forms.gle/xXvhA1bRKEZqi4TMA	events/Doop_FBevent.jpg	2024-11-06 17:00:00+00	2024-11-06 20:00:00+00	De Vrolijke Viking (Voskenslaan 67, Gent)	t	\N	6
307	Verbroedering Heimdal - Nemesis - Wieslandia	Hey Heimies!\r\n\r\nAltijd al eens benieuwd geweest wat andere verenigingen zoal doen, maar geen zin om het comfort van je eigen vereniging te verlaten? <br> Niet getreurd, want binnenkort gaan we verbroederen met **Nemesis** en **Wieslandia**. <br> Ook onze vrienden van **Ylusiona** zijn uitgenodigd!\r\n\r\nJe zal kennismaken met wat de andere verenigingen te bieden hebben, en zo misschien wel nieuwe mensen leren kennen en nieuwe vriendschappen vormen! <br> De verbroedering vindt plaats in de WEC, op 27 maart om 19u30. <br> Hopelijk tot dan! \r\n\r\nInschrijven kan via volgende link <br>\r\n🔗<a href="https://forms.gle/ZKrbLhV5FPF94mum9">https://forms.gle/ZKrbLhV5FPF94mum9</a>\r\n\r\nVerbroederende groeten, <br>\r\nJullie Cultuur Kirsten & Jullie Sport Seppe \r\n\r\nTL;DR<br>\r\n🗓️ 27 Maart 2025 <br>\r\n📍 Worlds' End Comics (Ketelvest 51 B, 9000 Gent) <br>\r\n🕢 19u30 <br>\r\n🔗 <a href="https://forms.gle/ZKrbLhV5FPF94mum9">https://forms.gle/ZKrbLhV5FPF94mum9</a>	https://forms.gle/ZKrbLhV5FPF94mum9	events/EventBanners_sem2_17.jpg	2025-03-27 18:30:00+00	2025-03-27 22:00:00+00	WEC (Ketelvest 51 B, 9000 Gent)	t	\N	5
261	The neverending LAN	Heyhey Heimie 's!!\r\n\r\nBinnen enkele maandjes komt onze jaarlijkse LAN-Party er alweer aan, ben jij er al klaar voor?\r\n\r\nDit jaar zal er gestreden worden in volgende **competities**: <br>\r\n- Rocket League  <br>\r\n- League of Legends (ARAM)  <br>\r\n- MarioKart  <br>\r\n- Fall Guys  <br>\r\n\r\nDaarnaast zal er zoals altijd weer randanimatie aanwezig zijn, zodat je jou op geen enkel moment zou vervelen! <br>\r\n\r\n**Inschrijven:** <br>\r\n<a href="https://forms.gle/HNoTZ5YiXrmSTVrk8">https://forms.gle/HNoTZ5YiXrmSTVrk8</a>\r\n\r\n**Hier alvast de belangrijkste info, dus zet het alvast in je agenda:** <br>\r\n📍 HOGENT Campus Schoonmeersen, Resto D <br>\r\n📅 03/04/2025 - 04/04/2025 <br>\r\n🕐  Time: 20:00h - 06:00h <br>\r\n\r\nWil jij deel uitmaken van de LAN-werkgroep en onze LAN mee helpen ondersteunen? Dat kan! Voor meer info & een link naar de LAN-server: Neem gerust een kijkje bij onze aankondiging op Discord.\r\n\r\nVerdere info over de LAN en inschrijvingen volgt binnenkort! <br>\r\nHopelijk tot dan!	https://forms.gle/HNoTZ5YiXrmSTVrk8	events/EventBanners_sem2_1_v4.jpg	2025-04-03 18:00:00+00	2025-04-04 04:00:00+00	Campus Schoonmeersen (Resto D) - Valentin Vaerwyckweg 1, 9000 Gent	t	\N	7
239	Verkiezingen	Hey Heimies </br>\r\n\r\nHet is alweer tijd voor de verkiezingen! </br>\r\nOp maandag <b>13 mei om 19u </b> zijn jullie allemaal welkom in de <b>Comic Sans</b>, om te stemmen op jullie favoriete kandidaat, of zelf mee te doen natuurlijk. 😉\r\n</br>\r\n##Kandidatuur\r\nElk ontgroend lid kan zich kandidaat stellen voor een functie, mits voldaan aan de voorwaarden. <b>Ook voor de schachtjes, jullie kunnen zeker de kandidatuur al insturen want de ontgroening valt voor de verkiezingen.</b>\r\n</br>\r\n\r\nDoordat HOGENT enkele aanpassingen doorvoert in hun statuten zijn wij genoodzaakt om de volgende vereisten op te volgen:\r\n\r\n<dl>\r\n<dt> Eerste ronde: </dt>\r\n<dd> - ENKEL HOGENT studenten kunnen opkomen voor een functie.</dd>\r\n<dd> - Voor Praeses, Vice-Praeses en Quaestor moet je 1 jaar ervaring hebben.</dd>\r\n<dd> - Relevante ervaring ICT </dd>\r\n<dt> Tweede ronde:</dt>\r\n<dd> - Als er 6 praesidiumleden verkozen zijn in eerste ronde </dd>\r\n<dd> - Mogen alle leden opkomen voor een functie.</dd>\r\n<dt> - Als er minder dan 6 praesidiumleden verkozen zijn in eerste ronde </dt>\r\n<dd> - Mogen ENKEL HOGENT studenten opkomen voor een functie deze ronde. (ongeacht ervaring) </dd>\r\n<dt> Derde ronde </dt>\r\n<dd> - Beslist het verkozen praesidium wat er gebeurt in samenspraak met het kiescomité. </dd>\r\n</dl>\r\n\r\nWil je weten wat alle functies precies inhouden? </br>\r\nNeem dan zeker eens een kijkje naar de powerpoints van de verschillende functies! </br>\r\n<a href="https://rb.gy/3fngrv" target="_blank">Info praesidiumfuncties</a> \r\n\r\nJe hebt tot <b>6 mei 23u59</b> om je kandidatuur in te dienen, hierna sluiten de inschrijvingen.</br>\r\nInschrijven is mogelijk via <a href="https://forms.gle/KunPBs8jurcN6gcj8" target="_blank">deze form</a>.\r\n\r\nGraag vragen we ook een motivatiebrief van minstens 1 A4 lang die dan ingediend wordt via het inschrijvingsformulier.</br>\r\nOp de verkiezingen zelf, zullen de kandidaten verplicht <b>minimaal 3 en maximum 5 minuten</b> tijd vullen met een speech, waarin zij op een deftige manier de mensen moeten overtuigen om op hen te stemmen.\r\n\r\n##Uitzondering aanvragen\r\n<dl>\r\n<dt> Dit kan zijn omdat: </dt> \r\n\t<dd> - Je toekomstig HOGENT-student bent.</dd> \r\n\t<dd> - Je geen jaar ervaring hebt binnen het praesidium (voor de functies Praeses, Vice en Quaestor). </dd> \r\n\t<dd> - Je geen relevante ervaring hebt voor de functie ICT.</dd> \r\n</dt>\r\n</br>\r\n<b>Uitzonderingen kunnen aangevraagd worden tot 4 mei via de inschrijvingsform of via verkiezingen@heimdal.be</b></br>\r\nHeb je nog vragen? Stuur zeker naar iemand van het kiescomité\r\n<dt>\r\n<dd> - Sander De Bruyker</dd>\r\n<dd> - Sepp Degroote</dd>\r\n<dd> - Rein Goossens</dd>\r\n<dd> - Hayley Rasschaert</dd>\r\n\r\n<strong>Groetjes</br>\r\nKiescomité</strong>	https://www.facebook.com/events/1609980846480060?active_tab=about	events/435785609_1087526749174423_3056549443902811673_n.png	2024-05-13 17:00:00+00	2024-05-12 22:00:00+00	Comic Sans	f	\N	35
244	Eerste Clubavond	Allen welkom op onze eerste officiële clubavond van het jaar!  \r\n  \r\nMaak kennis met nieuwe en oude heimies, het praesidium en natuurlijk ons mega tof clubcafé Comic Sans! Snuif de sfeer op en wie weet hoor jij binnenkort bij die toffe bende!	\N	events/EersteClubavond_FBevent.jpeg	2024-09-25 18:00:00+00	2024-09-26 00:00:00+00	Comic Sans	t	\N	3
247	Retro Game Revival	Hey Heimies!\r\n\r\nKlaar om jouw geluk te testen of eens je beste game skills boven te halen? Kom dit doen op Retro Game Revival, een avond waar alles mogelijk is. Zet je kansen in op een spel en wie weet wordt jij wel een winnaar. 🏆\r\n\r\nRetro Game revival is een spelavond waar de leukste boardgames gespeeld kunnen worden en jouw geluk misschien wel iets kan opleveren.\r\n<br><br>\r\n\r\n**Inschrijven**  \r\nKom de leukste spellen mee spelen en schrijf je in via deze link: \r\n🔗 <a href="https://docs.google.com/forms/d/e/1FAIpQLScJRCosSPgakdQTG8TLOx08-1yt4OBTDxizT2fxgqbCAMEWnQ/viewform?usp=sf_link" target="_blank">Inschrijvingsformulier</a>\r\n\r\n**Waar en wanneer?**  \r\n📍De Vrolijke Viking (Voskenslaan 67, 9000 Gent)  \r\n📅 17/10/2024  \r\n🕕 20u00\r\n\r\nHopelijk tot dan,\r\nJullie allerliefste cultuur, Kirsten	https://docs.google.com/forms/d/e/1FAIpQLScJRCosSPgakdQTG8TLOx08-1yt4OBTDxizT2fxgqbCAMEWnQ/viewform?usp=sf_link	events/RetroGameRevival_FBevent.jpg	2024-10-17 18:00:00+00	2024-10-17 22:00:00+00	De Vrolijke Viking, Voskenslaan 67, Gent	t	\N	4
248	Karakoe	Hey Heimies!\r\n<br><br>\r\nHet is tijd om los te gaan want de Karakoe komt er weer aan! <br><br>\r\nDus wil je je mooie stem laten horen of wil je van de sfeer (en het geschreeuw) komen genieten, het is allebei mogelijk op woensdag 23 oktober.\r\nNeem ook zeker je lidkaart of lint mee want hiermee krijg je een jeton voor een drankje. Opgelet deze jetons kunnen enkel op de avond van de Karakoe benuttigd worden.\r\n<br><br>\r\n**Waar en Wanneer**<br>\r\n📍 De Comic Sans (Klein Turkije 8, 9000 Gent)<br>\r\n📅  23/10/2024<br>\r\n🕐  20u00<br>\r\n<br>\r\nHopelijk tot dan, <br>\r\nJullie allerliefste Cultuur, Kirsten	\N	events/EventBanners_sem1_5.jpg	2024-10-23 18:00:00+00	2024-10-23 22:00:00+00	Comic Sans	t	\N	4
246	Mario Kart Toernooi	Dag Heimies en Mario Karters!\r\n\r\nNaar gewoonte organiseren we ook dit jaar weer een Mario Kart-toernooi. Strijd mee voor de glorie van het podium en win een heleboel toffe prijzen terwijl je de titel van Heimdal’s "*Koning(in) van Mario Kart*" in de wacht sleept! 🏆🎮\r\n\r\n**Waar en wanneer?**  \r\n📍  Comic Sans (Klein Turkije 8, 9000 Gent)  \r\n📅  7/10/2024  \r\n🕐  18u30\r\n\r\n**Inschrijven**\r\nKan via volgende link\r\n🔗 https://forms.gle/jMFaSCLRKjHanPK56  \r\nOf ter plaatse voor 19u zolang plaatsen beschikbaar zijn.\r\n\r\n**Leden**: €3,00  \r\n**Niet-leden**: €5,00  \r\nTe betalen op BE71 7370 7028 8869\r\n\r\nVeel succes en tot dan!\r\nJullie coole Sport, Seppe\r\n\r\n*Door problemen met eigen controllers vorig jaar zullen we deze keer **geen** eigen controllers toelaten*	https://forms.gle/jMFaSCLRKjHanPK56	events/MarioKart_FBevent-1.jpeg	2024-10-07 17:00:00+00	2024-10-07 21:00:00+00	Comic Sans	t	\N	2
245	Stadsspel	Hey Heimie’s!\r\n\r\nNu het semester weer begonnen is, wordt het tijd om Gent eens goed te verkennen samen met elkaar.  Van de beste plaatsen om eens te genieten van de zon tot de oude kerken, elke hoek heeft iets te bieden.   \r\nKom de allerbeste plekjes van Gent mee zoeken tijdens het stadsspel en schrijf je in via de link \r\nHet stadspel gaat door op dinsdag 1 oktober om 18:00   \r\nWe starten aan De Vrolijke Viking, Voskenslaan 67, 9000 Gent	https://docs.google.com/forms/d/e/1FAIpQLSefXLLzqBScTriqeIYiYnsSKK4RzHsDsNkHbGsp9vPsn9jcPg/viewform?usp=sf_link	events/Stadsspel_FBevent.jpeg	2024-10-01 16:00:00+00	2024-10-01 20:00:00+00	De Vrolijke Viking. Voskenslaan 67	t	\N	4
251	Feestje Retro Revolution	Hebben jullie zin om eens uit je dak te gaan in de Overpoort? Op 14/11 krijg je hier weer eens de kans voor!  \r\n<br>\r\nOm 22u30 start ons Retro Revolution feestje in The Place.\r\nKom verkleed als een old school game character en je krijgt een gratis cocktail!  \r\n<br>\r\nTLDR:  \r\n📍The Place, Overpoortstraat 62.  \r\n🕗 14 november, 22u30  \r\n👗 Retro/old school game character.	\N	events/1000141826.jpg	2024-11-14 21:30:00+00	2024-11-15 02:00:00+00	The Place, Overpoortstraat 62	t	\N	7
305	Karakoe pt.2	Hey Heimies!\r\n\r\nHet wordt tijd om je mooie stem op te warmen en je favoriete liedjes in te studeren want ... de Karakoe is terug! 🥳\r\n\r\nDuidt alvast **23 april** aan in je agenda, want dan nemen we vanaf **20u** de Comic Sans opnieuw over met jullie fantastische zangkunsten.\r\n\r\nOm te zorgen dat de stemmetjes goed gesmeerd blijven, krijgt iedereen ook een jeton voor een lekker drankje. Dus vergeet zeker niet langs mij te passeren voor je drankjeton. 😁\r\n\r\nJullie allerliefste Cultuur, Kirsten	\N	events/EventBanners_sem2_8.jpg	2025-04-23 18:00:00+00	2025-04-23 21:59:00+00	Comic Sans	t	\N	4
657	HOGENT Dodgeball Toernooi	¡Hola Heimies!\r\n\r\nHeimdal doet terug mee aan het dodgeball toernooi van HOGENT, maar daar hebben we jullie voor nodig! Na een tweede plaats vorig jaar, is het terug tijd om te bewijzen dat wij het team zijn dat op de eerste plaats thuishoort (net zoals 2 jaar geleden).\r\n\r\nWil je graag onze vereniging komen verdedigen? Vul dan zeker onderstaande Forms in tegen ten laatste 12/03 om 23:59, zodat ik ons op tijd kan inschrijven!\r\n\r\nDodgende groetjes\r\nAlejandro\r\n\r\ntl;dr\r\n\r\n🗓️ 23/3/2026\r\n\r\n🕠 17:30-22:00\r\n\r\n📍 Sporthal Campus Schoonmeersen HOGENT - zaal 2 & 3\r\n\r\n🔗 https://forms.gle/K1vtpdQEJ66U86YF7	\N	events/banner_dodgeball_fix_website.png	2026-03-23 16:30:00+00	2026-03-23 21:00:00+00	Sporthal Campus Schoonmeersen HOGENT - zaal 2 & 3	t	\N	2
260	Heimdal Weekend	Hey Heimies!\r\n\r\nHou je vast... het grootste, leukste, tofste, gekste weekend komt er aan. <br>Van **14 tot 16 februari** vertrekken we op ons jaarlijkse avontuur. <br>Dus trek je beste bosschoenen maar aan en steek je lekkerste eggo’s in je zak. \r\n<br><br>\r\n#### Inschrijven\r\nInschrijven voor het weekend kan via volgende link: <br>🔗  <a href="https://forms.gle/oiJTeBBB6pmsg2ZS6"> https://forms.gle/oiJTeBBB6pmsg2ZS6</a>\r\n<br>*Inschrijven kan tot 31 januari 2025*\r\n<br><br>\r\n#### Kostprijs\r\nHet weekend bedraagt **€58**, hierin zit het verblijf, eten, drinken en de activiteiten verrekend. <br>Het volledige bedrag dient betaald te zijn **tegen 2 februari**. <br>Overschrijven kan op het rekeningnummer: **BE71 7370 7028 8869** met vermelding van\r\n\r\n```Heimdalweekend (voorschot) + naam```\r\n<br><br>\r\n#### Vroege vogel\r\nSchrijf je in voor 15 december en krijg **€5 vroegboekkorting**.\r\n<br><br>\r\n#### Voorschot\r\nGelieve een voorschot van **€25** te betalen  binnen de 14 dagen na het inschrijven. <br>Dit voorschot is non-refundable bij annulatie na 2 februari\r\n<br><br>\r\n#### Vervoer\r\nGelieve onderstaande formulier in te vullen zodanig dat we kunnen zorgen dat iedereen veilig heen en terug geraakt van het weekend.<br>\r\n🔗 <a href="https://forms.gle/xRULJ2qBQFYYRk349">  https://forms.gle/oKwTQ9mkxXKYmctD7</a>\r\n<br><br>\r\n#### Nog vragen?\r\nNeem zeker contact met de Cultuur, Kirsten.\r\n\r\n<br>\r\n#### TLDR <br>\r\n📍Sint-Pauluscentrum <br>\r\n(Galgenstraat 36, 3110 Rotselaar)<br>\r\n📅 14/02 - 16/02/25<br>\r\n💶 €58<br>\r\nDeadline inschrijven: 31/1/2025<br>\r\n🔗 <a href="https://forms.gle/oiJTeBBB6pmsg2ZS6"> https://forms.gle/oiJTeBBB6pmsg2ZS6</a><br>\r\n    \r\nHopelijk tot dan,<br>\r\nJullie allerliefste Cultuur, Kirsten	https://forms.gle/oiJTeBBB6pmsg2ZS6	events/EventBanners_sem1_9.jpg	2025-02-14 17:00:00+00	2025-02-16 17:00:00+00	Sint-Pauluscentrum (Galgenstraat 36, 3110 Rotselaar)	t	\N	4
253	Schaatsen	Hey Heimies,\r\n\r\nOok dit jaar gaan we weer gezellig schaatsen! <br>Schaats je graag of zie je anderen graag vallen? <br>Aarzel dan zeker niet om mee komen!\r\n\r\nWe spreken om **19:45** af aan de **kristallijn**, en zullen schaatsen tot **21:30**. <br>Daarna kunnen we samen nog wat drinken in de cafetaria :3\r\n\r\n**Inschrijven kan via deze link:**<br>\r\n🔗  <a href="https://forms.gle/nTYp33gNxTUGQb5m8"> https://forms.gle/nTYp33gNxTUGQb5m8</a>\r\n\r\n**TLDR:**<br>\r\n📍Kristallijn Gent<br>\r\n(Warmoezeniersweg 20, 9000 Gent)<br>\r\n📅 26/11/2024<br>\r\n🕕 19u45 - 21u30<br>\r\n💶 €5 Leden, €7 Niet Leden<br>\r\n\r\nHopelijk tot dan!<br>\r\nGroetjes,<br>\r\nJullie coolste sport Seppe	https://forms.gle/nTYp33gNxTUGQb5m8	events/EventBanners_sem1_10.jpg	2024-11-26 18:45:00+00	2024-11-26 20:30:00+00	Kristallijn Gent	t	\N	2
252	Schachtenevent	Hallo daar Heimie ! <br>\r\n\r\nHeb jij zin om de andere Heimies wat bij te leren? <br>Wil je hen vertellen over je favoriete bands, games of films, <br>misschien wil je gewoon eens zien wat de rest er van bakt? \r\n<br>\r\n\r\nKom dan zeker naar ons eerste schachtenevent op **21 november**! <br>Presenteer alleen of in een groepje met twee of drie, de keuze is aan jou! <br>Je PowerPoint moet minstens 3 minuten duren, en mag maximum 10 minuten duren. <br>De 3 schachten of groepjes met de beste PowerPoint zullen **extra schachtenpunten** verdienen! 😃\r\n\r\n**Schrijf je in via deze link: **<br>🔗<a href="https://forms.gle/aWMZNySaynHfU29D9"> https://forms.gle/aWMZNySaynHfU29D9</a>\r\n\r\nHet doopcomité zal je verwelkomen om **18:00u** in **GSCHB 3.016 op Campus Schoonmeersen**, <br> met verdere vragen kan je altijd bij ons terecht! <br>\r\nHopelijk zien we je daar c:\r\n\r\nVeel liefs,<br>\r\nde Temmer en haar doopcomité	https://forms.gle/aWMZNySaynHfU29D9	events/EventBanners_sem1_8.jpg	2024-11-21 17:00:00+00	2024-11-21 22:00:00+00	campus Schoonmeersen (gebouw B 3.016)	t	\N	6
256	Meter/Peter bonding: Gentse Museumnacht	Hey Heimie !\r\n\r\n**Donderdag 5 december** organiseren de Gentse musea een **museumnacht**! <br>\r\nZin om samen wat cultuur op te snuiven?<br>\r\n\r\nMaak je er meteen ook een **meter/peter-activiteit** van? <br>Trommel dan je allerliefste doopouders op om met ons mee op stap te gaan! <br>Dit betekent natuurlijk niet dat je niet welkom bent als je geen meter, peter of schachtenkindje hebt!\r\n\r\nOm een overzichtje te hebben van wie er allemaal interesse heeft vraag ik lief of jullie deze **form** willen invullen: <br>\r\n🔗<a href ="https://forms.gle/widVaMmTxocFMnTn9">https://forms.gle/widVaMmTxocFMnTn9</a><br> (je kan er ook aanduiden welke musea je het allerliefste zou bezoeken!)  🧐 \r\n\r\n**TL:DR**<br>\r\n🗓️ Donderdag 5 december<br>\r\n🕑 19:00u<br>\r\n📍 Comic Sans, Klein Turkije 8<br>\r\n\r\n**Meer info** vind je hier: <br><a href="https://degentsemusea.be/beleef-meer/museumnacht"> https://degentsemusea.be/beleef-meer/museumnacht</a><br>\r\n\r\nHopelijk tot dan!	https://forms.gle/widVaMmTxocFMnTn9	events/EventBanners_sem1_19.jpg	2024-12-05 18:00:00+00	2024-12-05 22:00:00+00	Comic Sans	t	\N	6
255	Sinterklaas clubavond	Hey Heimies!\r\n\r\nHij komt, hij komt, onze allerliefste en leukste Sepperklaas komt er aan. <br>Op **4 december** komt hij samen met zijn pieten ons wat lekkers brengen.<br>\r\n\r\nVanaf **20u** maken we de CS helemaal klaar voor de komst van deze heilige man. <br>Een moment om alvast in de stemming te komen!\r\n\r\nVier jij ook zijn komst mee en hou je van iets lekkers? <br>Kom dan zeker af naar de Sinterklaas clubavond!\r\n\r\n*disclaimer; <br>enkel voor brave Heimies.  <br>Sepperklaas is een heel strikte man*\r\n\r\n**Waar en wanneer**\r\n<br>📍 Comic Sans (Klein Turkije 8, 9000 Gent)\r\n<br>📅 4/12/24\r\n<br>🕐 20u\r\n\r\n<br>Hopelijk tot dan,\r\n<br>Jullie allerliefste Cultuur, Kirsten	\N	events/EventBanners_sem1_12.jpg	2024-12-04 19:00:00+00	2024-12-04 22:00:00+00	Comic Sans	t	\N	4
266	Back to the 80's - Throwback Party	Hey Heimie's! <br>\r\n\r\nHet is weer bijna zo ver: binnen enkele weken organiseert Heimdal weer een cocktailparty in de Overpoort. <br>\r\nOp donderdag **06/03** gaan we weer eens samen feesten! Om **22u30** start onze Back to the 80’s throwback party in **The Place**.\r\n\r\nVoor **€ 3** kan je 1 cocktail krijgen en voor **€ 10** krijg je er 4!  <br> Kom verkleed in je beste 80’ outfit en je krijgt een gratis cocktail! \r\n\r\nHopelijk zien we jullie allemaal daar! \r\nGroetjes, \r\nJullie Vice-Praeses\r\n\r\n**TLDR: ** <br>\r\n📍 The Place, Overpoortstraat 62 <br>\r\n📅  6 maart <br>\r\n🕐  22u30 <br>\r\n👗  80’s outfit	\N	events/EventBanners_sem2_16.jpg	2025-03-06 21:30:00+00	2025-03-07 01:00:00+00	The Place	t	\N	7
267	Pizza & Boardgames	Hey Heimies,\r\n\r\nHet is tijd om te genieten van een gezellige avond met de leukste boardgames. <br>\r\nOp **11 maart** vanaf **18u30** is er namelijk de Pizza en Boardgames avond in de **Vrolijke Viking**. <br>Een avond waar je niet alleen spelletjes kan spelen maar ook kan genieten van de heerlijkste pizza's!\r\n\r\nWil je graag een pizza? Bestel die dan ook via volgende link: <br>\r\n🔗 <a href="https://forms.gle/g5GGmz6jZnkrsLAf6">https://forms.gle/g5GGmz6jZnkrsLAf6</a> <br>\r\n\r\n**Waaruit kan je kiezen?** <br>\r\nMargherita - € 11 <br>\r\nBuffelmozzarella -  € 13 <br>\r\nChorizo -  € 13 <br>\r\nGerookte ham -  € 13 <br>\r\n+ Extra('s): jalapeno / olijven -  € 1 <br>\r\n\r\n𝗧𝗟𝗗𝗥: <br>\r\n📍  Vrolijke Viking, Voskenslaan 67, Gent <br>\r\n📅  11 maart <br>\r\n🕐  18u30 <br>\r\n💶  € 11 - 13 / pizza <br>\r\n\r\nHopelijk tot dan! <br>\r\nJullie alleliefste Cultuur, Kirsten	https://forms.gle/g5GGmz6jZnkrsLAf6	events/EventBanners_sem2_7.jpg	2025-03-11 17:30:00+00	2025-03-11 22:00:00+00	Vrolijke Viking	t	\N	4
257	Secret Santa	Hey Heimies!<br>\r\n\r\nOp **18 december** is onze laatste clubavond van 2024, maar er is geen tijd om dit te treuren. <br>Op deze avond genieten we van de gezellige sfeer tijdens deze comfy clubavond in onze beste kerstoutfits of de meest comfy pyjama.<br>\r\n\r\nMaar we kunnen het jaar niet zomaar afsluiten, <br>zoals elk jaar is er weer een **Secret Santa** waar we de leukste cadeautjes uitwisselen. <br>Natuurlijk hoef je hier niet deel aan te nemen en kan je gewoon mee genieten van de sfeer.\r\n\r\nDe waarde van de cadeautjes mag schommelen rond **€10** <br>en de **deadline om je in te schrijven** voor de Secret Santa is **1 december**.\r\n\r\nSchrijf je in via onderstaande link om deel te nemen aan de Secret Santa:<br>\r\n🔗 <a href="https://forms.gle/c7CWNVeS6Vde2wHVA">https://forms.gle/c7CWNVeS6Vde2wHVA</a>\r\n\r\n**Waar en wanneer**<br>\r\n📍 Comic Sans (Klein Turkije 8, 9000 Gent)<br>\r\n📅 18/12/24<br>\r\n🕐 21u<br>\r\n\r\nHopelijk tot dan, <br>\r\nJullie allerliefste Cultuur, Kirsten	https://forms.gle/c7CWNVeS6Vde2wHVA	events/EventBanners_sem1_13.jpg	2024-12-18 20:00:00+00	2024-12-18 22:00:00+00	Comic Sans	f	\N	4
254	Nadoop	Lieve Feutjes ...\r\n\r\nHeb je spijt dat je de doop gemist hebt? <br>Wil je ook proeven van mijn overheerlijke s̶c̶h̶a̶c̶h̶t̶e̶n̶p̶a̶p̶  traktatie?\r\n\r\nDit is je moment! Op **woensdag 4 december** krijg je nog een kans om je te laten dopen bij Heimdal en je zo te vervoegen bij de **28** nieuwe schachtjes van dit jaar. <br>Versla samen met je medefeutjes de Mindflayer en verdien je lintje! <br>Geen zorgen, het doopcomité zal jullie helpen  😉 \r\n\r\nAangezien het in december al best koud is, speelt de nadoop zich **volledig binnen af**.\r\n\r\n**Nog wat praktische info:**<br>\r\n🗓️  Woensdag 4 december<br>\r\n🕖 Verzamelen om **19:00u**<br>\r\n📍 De Vrolijke Viking, Voskenslaan 67 Gent<br>\r\n\r\n**Inschrijven doe je via deze link:**<br>\r\n🔗<a href="https://forms.gle/xXvhA1bRKEZqi4TMA">https://forms.gle/xXvhA1bRKEZqi4TMA</a>\r\n\r\nHeb je nog vragen of onzekerheden? <br>Twijfel niet om mij of het doopcomité aan te spreken of een bericht te sturen 🫶 \r\n\r\nZie ik je daar?	https://forms.gle/xXvhA1bRKEZqi4TMA	events/EventBanners_sem1_11.jpg	2024-12-04 17:30:00+00	2024-12-04 20:00:00+00	Vrolijke Viking	t	\N	6
263	Valentijn clubavond	Liefste Heimies,\r\n\r\nhoewel het officieel nog geen Valentijn zal zijn, kunnen we wel de romantische sfeer delen op de Valentijn clubavond op **12 februari**.\r\n\r\nGeef je allerliefste medeheimie een leuk kaartje waarin je diepste gevoelens staan of gewoon een leuke grap.<br>Alles is mogelijk op de meest romantische clubavond van het jaar.\r\n\r\nJe allerliefste cultuur, Kirsten	\N	events/EventBanners_sem2_3.jpg	2025-02-12 19:00:00+00	2025-02-12 22:00:00+00	Comic Sans	t	\N	4
264	Movie Night	Hey Heimies,\r\n\r\nHebben jullie zin in een gezellige avond waarbij je met je medeheimies een leuke film kan kijken? <br> Dan is onze Movie Night op 24 februari een must! <br>\r\n\r\nWe openen de deuren van de **Comic Sans** vanaf **20u** waardoor je al een goed plaatsje kan kiezen om je zo comfy mogelijk te zetten. <br> (*Vergeet je dekentje alvast niet voor ultiem comfort! 🛋️*) <br>\r\n\r\nWij zorgen voor de snacks, jullie kiezen de film! <br> Hieronder vind je alvast een lijst met enkele voorstellen. <br>\r\n\r\n🎬 **FILMOPTIES:** <br>\r\n\r\n1️⃣ Spirited away <br>\r\n2️⃣ Finding Nemo <br>\r\n3️⃣ The Incredibles <br>\r\n4️⃣ Star Wars ep. 4: A New Hope <br>\r\n5️⃣ Spider-Man: Across the Spider-Verse <br>\r\n6️⃣ Dungeons & Dragons: Honor Among Thieves <br>\r\n7️⃣ Sonic the Hedgehog <br>\r\n8️⃣ WALL-E <br>\r\n\r\nStemmen kan tot en met dinsdag 18 februari om 23u. <br> Stem op je favoriet (of meerdere) via onderstaande link: <br>\r\n🔗 <a href="https://forms.gle/26sLMomjfpvyYXyk7">https://forms.gle/26sLMomjfpvyYXyk7</a> <br>\r\n\r\n**Mis je jouw favoriet?** <br>\r\nLaat hem achter onder "suggesties" in de form en drop hem gerust in de thread om je medeheimies te overtuigen 😉 <br> Als hij beschikbaar en praktisch haalbaar is, voegen we hem misschien toe! <br>\r\n\r\nJe allerliefste Cultuur, Kirsten	https://forms.gle/26sLMomjfpvyYXyk7	events/EventBanners_sem2_4.jpg	2025-02-24 19:00:00+00	2025-02-24 22:00:00+00	Comic Sans	t	\N	4
262	Schaaktoernooi	Hey Heimies!\r\n\r\nDe examens zijn nog maar net gedaan, maar dat betekent niet dat je je denkspieren moet laten niksen! <br>\r\nOm die denkspieren op gang te laten komen voor volgend semester organiseert Heimdal op **18 februari** een schaaktoernooi in de **Vrolijke Viking**!<br>\r\nHet toernooi begint om **20u** en is compleet gratis!\r\n\r\n**Inschrijven kan ter plekke of via de link hieronder:**<br>\r\n🔗<a href="https://forms.gle/xsvb4B3ZBwaZ92Sp8">https://forms.gle/xsvb4B3ZBwaZ92Sp8</a>\r\n\r\nSlimme groetjes,<br>\r\nJullie Sport Seppe\r\n\r\n**TL;DR:**<br>\r\n📍Vrolijke Viking (Voskenslaan 67, 9000 Gent)<br>\r\n📅18/02/25<br>\r\n🕐20u	https://forms.gle/xsvb4B3ZBwaZ92Sp8	events/EventBanners_sem2_2.jpg	2025-02-18 19:00:00+00	2025-02-18 22:00:00+00	Vrolijke Viking	t	\N	2
265	Just Dance Toernooi	Dag Heimies,\r\n\r\n*Back by popular demand* is er zoals vorig jaar weer een Just Dance toernooi.<br>\r\nDit zal plaatsvinden in de Comic Sans (Klein Turkije 8, 9000 Gent) op maandag 3 maart.<br>\r\nHet toernooi zelf start om 20u, maar je kan binnen vanaf 19u30 (**NIET VROEGER!**). <br>Iedereen is welkom om zijn beste dansmoves te komen tonen,\r\nmaar ook supporters mogen zeker meekomen! <br>De beste dansers en danseressen krijgen zelfs mooie prijzen mee naar huis! \r\n\r\nInschrijven kan op het toernooi zelf, of via volgende link:<br>\r\n🔗 <a href="https://forms.gle/nPtSNxSTRPdXstg69">https://forms.gle/nPtSNxSTRPdXstg69</a>\r\n\r\nVeel dansplezier,\r\nJullie Sport Seppe\r\n\r\n**TL;DR:**<br>\r\n📍Comic Sans (Klein Turkije 8, 9000 Gent)<br>\r\n📅03/03/25<br>\r\n🕐20u<br>\r\n💰€2 leden, €3 niet-leden	https://forms.gle/nPtSNxSTRPdXstg69	events/EventBanners_sem2_5.jpg	2025-03-03 19:00:00+00	2025-03-03 22:00:00+00	Comic Sans	t	\N	2
308	Open vergadering	Het is weer bijna tijd voor een open vergadering. Wil jij je mening kwijt? Wil jij weten hoe zo'n vergadering eraan toegaat? Kom dan zeker af naar de Open vergadering!\r\n\r\nDe Open vergadering gaat door op **dinsdag 22 april in lokaal GSCHC.1.131**. We verwelkomen je graag** vanaf 18u** en starten met de vergadering stipt om 18u30.\r\n\r\n<br>Geen Open vergadering is compleet zonder **feedback**. Ook als je niet aanwezig zal zijn, mag je zeker deze anonieme form invullen:\r\n<br>🔗 https://forms.gle/hrBVPvU8Z55VKqzg7\r\n\r\n<br>**TL;DR**\r\n<br>🗓️ 22 april\r\n<br>📍 lokaal GSCHC.1.131\r\n(Campus Schoonmeersen, HOGENT)\r\n<br>🕕 18u	https://www.facebook.com/events/1638574847024070/?acontext=%7B%22event_action_history%22%3A[%7B%22extra_data%22%3A%22%22%2C%22mechanism%22%3A%22unknown%22%2C%22surface%22%3A%22group%22%7D%2C%7B%22extra_data%22%3A%22%22%2C%22mechanism%22%3A%22upcoming_events_for_group%22%2C%22surface%22%3A%22group%22%7D%2C%7B%22extra_data%22%3A%22%22%2C%22mechanism%22%3A%22surface%22%2C%22surface%22%3A%22create_dialog%22%7D]%2C%22ref_notif_type%22%3Anull%7D&onload_action=open_invite_flow&show_created_event_toast=true	events/OpenVergadering_FBevent.jpg	2025-04-22 16:00:00+00	2025-04-22 18:30:00+00	GSCHC.1.131, Campus Schoonmeersen	f	\N	1
341	Verkiezingen	Beste Heimies,\r\n\r\nMaandag **12 mei** is het zover: de jaarlijkse verkiezingen staan voor de deur! 🗳️ <br>Jullie zijn welkom vanaf **18u30** in de **Comic Sans**. <br>We starten stipt om 19u met de eerste stemronde — wees op tijd!\r\n\r\n<br>\r\n\r\n## Kandidaturen\r\nElk ontgroend lid kan zich kandidaat stellen voor een praesidiumfunctie, mits er voldaan wordt aan de voorwaarden. <br>\r\nAls schacht mag je je kandidatuur ook indienen vóór je ontgroening, op voorwaarde dat je dit jaar nog ontgroend wordt.\r\n\r\n__Voorwaarden__ <br>\r\n\r\n- Volgens regelgeving vanuit HOGENT moet het praesidium met een gewone meerderheid bestaan uit HOGENT-studenten. <br>Om die reden zullen **enkel HOGENT-studenten** zich mogen stellen in de **eerste kiesronde**.\r\n- Voor de functie `Praeses`, `Vice-Praeses` en `Quaestor` is er 1 jaar praesidiumervaring vereist.\r\n- Voor de functie `ICT` is relevante ervaring vereist.\r\n\r\n__Indienen__ <br> <br>\r\nJe kan je kandidatuur indienen via onderstaande Google Form. <br>\r\nDe **deadline** hiervoor is **zaterdag 3 mei 23u59**. <br>\r\n🔗 <a href="https://forms.gle/cM6oUFNkeg1aPuV56">https://forms.gle/cM6oUFNkeg1aPuV56</a>\r\n\r\nJe kandidatuur bestaat uit: <br>\r\n\r\n- Een motivatiebrief van minstens 1 A4 lang, in te dienen via de form.\r\n- Een speech van max. 5 minuten, die je live brengt op de verkiezingen.\r\n\r\n*Leden die voor de Media functie opkomen, kunnen ervoor kiezen om ook een werk naar eigen keuze in te dienen via de Google Form. Je mag tot 2 eigen werken indienen via het formulier (bijvoorbeeld een poster, Facebookbanner, Instagrampost) OF één video van maximaal 1,5 minuut. Deze worden samen met de kandidaturen gedeeld én op de verkiezingsavond getoond.*\r\n\r\nHeb je graag nog een kort overzicht van wat de praesidiumfuncties juist inhouden? <br>\r\n__Bekijk dan zeker nog eens deze PowerPoints__ <br>\r\n🔗 <a href="https://drive.google.com/drive/folders/1SxE6TGBFhOF1ANjGS7cKAk1BbulTALVG?usp=sharing">https://drive.google.com/drive/folders/1SxE6TGBFhOF1ANjGS7cKAk1BbulTALVG?usp=sharing</a>\r\n\r\n<br>\r\n\r\n## Tweede kiesronde\r\nAls er **minstens 6 praesidiumleden** verkozen zijn in de eerste ronde, mogen alle leden zich kandidaat stellen voor een functie in de tweede ronde. <br><br>\r\n*__Ben je geen HOGENT-student, maar weet je nu al dat je wil opkomen in de tweede ronde?__ <br>Dan mag je je kandidatuur nu al indienen via de Google Form!*<br><br>\r\nAls er minder dan 6 praesidiumleden verkozen zijn in de eerste ronde, mogen opnieuw enkel HOGENT-studenten opkomen in de tweede ronde.\r\n\r\n<br>\r\n\r\n## Uitzonderingen\r\n**In volgende gevallen kan je een uitzondering aanvragen via de Google Form:**\r\n\r\n- Je bent toekomstig HOGENT-student\r\n- Je hebt nog geen jaar praesidiumervaring (voor functies Praeses, Vice-Praeses of Quaestor)\r\n- Je hebt nog geen relevante ervaring voor de functie ICT\r\n\r\nJe kan een uitzondering aanvragen op de deadline van de kandidatuur door te mailen naar <a href="mailto:verkiezingen@heimdal.be">verkiezingen@heimdal.be</a> of door iemand van het kiescomité te sturen. Uitzonderingen kunnen aangevraagd worden tot **donderdag 1 mei 20u**.\r\n\r\n<br>\r\n\r\n## Vragen?\r\nHeb je nog vragen? Contacteer gerust iemand van het kiescomité:\r\n\r\n- Diede Devriendt\r\n- Aaron Vandeweghe\r\n- Britt Emanuel\r\n- Nick Lersberghe\r\n- Tyra Bourgeois\r\n\r\n**TL;DR** <br>\r\n🗓️ maandag 12 mei <br>\r\n🕡 18u30 <br>\r\n📍 Comic Sans <br>\r\n📝 Deadline kandidaturen: 3 mei om 23u59 <br>\r\n🔗 <a href="https://forms.gle/cM6oUFNkeg1aPuV56">https://forms.gle/cM6oUFNkeg1aPuV56</a>\r\n\r\nLiefs,\r\nJullie kiescomité	https://forms.gle/cM6oUFNkeg1aPuV56	events/EventBanners_sem2_13.jpg	2025-05-12 16:30:00+00	2025-05-13 00:00:00+00	Comic Sans	f	\N	35
302	Super Smash Bros Ultimate Toernooi	Hey Heimies!\r\n\r\nHeb jij zin om te smashen met jouw mede-heimies? Denk jij dat jij de beste smasher bent die er is?<br>\r\nKom dan op **28 april** naar de **Comic Sans** voor een onvergetelijke avond! <br>De kostprijs voor dit evenement is **€2** voor leden en **€3** voor niet-leden. <br>\r\nDe CS opent om **19u45**, het event zelf begint om 20u. \r\n\r\nDe link voor je in te schrijven vind je hier:<br>\r\n🔗 <a href=" https://forms.gle/5ej7M7DB1brJQT7s8"> https://forms.gle/5ej7M7DB1brJQT7s8</a>\r\n\r\nZorg dat je er bij bent!\r\n\r\nSmashende groeten,<br>\r\nJullie sport Seppe\r\n\r\nTL;DR<br>\r\n🗓️ 28 April<br>\r\n📍 Comic Sans (Klein Turkije 8, 9000 Gent)<br>\r\n🕢 19u45<br>\r\n💰 €2 leden, €3 niet leden<br>\r\n🔗 <a href=" https://forms.gle/5ej7M7DB1brJQT7s8"> https://forms.gle/5ej7M7DB1brJQT7s8</a>	https://forms.gle/5ej7M7DB1brJQT7s8	events/SmashBros_FBevent.jpg	2025-04-28 18:00:00+00	2025-04-28 21:00:00+00	Comic Sans	t	\N	2
306	Ontgroening: Vecna's Curse	Hey Schachtjes! \r\n\r\nHet moment is eindelijk aangebroken...\r\nTerwijl jullie nog volop schachtenpuntjes aan het verzamelen zijn, zit het doopcomité ook niet stil! Wij hebben voor jullie een superleuke **ontgroening** gepland waarop jij zal kunnen bewijzen dat je een échte Heimie bent en Vecna voor goed zal verslaan! Op het einde zal je samen met je medeschachtjes Heimdal toetreden als een rasechte **Commi**! 🐲\r\n\r\nDe ontgroening zal **eindigen op de Korenmarkt** waar je meter en/of peter en alle andere Commi’s je al zullen staan opwachten om samen met jou het officiële gedeelte te vieren. \r\n\r\n**Info en inschrijven**<br>\r\n🗓️  Woensdag 30 april<br>\r\n📍 Vrolijke Viking (Voskenslaan 67, 9000 Gent)<br>\r\n🕢 18:00u<br>\r\n📎 <a href="https://forms.gle/P7sjz9KmqcKUJLMX9">https://forms.gle/P7sjz9KmqcKUJLMX9</a>\r\n\r\n**Wat breng ik mee?**<br>\r\nEerst en vooral natuurlijk je lintje, daarnaast zullen we ook heel de avond buitenactiviteiten doen, dus breng je best ook een jas of trui mee. Je kleren zullen niet vuil worden, maar doe niet je duurste outfit aan 😅\r\n\r\nHopelijk zien we jullie allemaal daar!<br>\r\nVeel liefs, het doopcomité	https://forms.gle/P7sjz9KmqcKUJLMX9	events/EventBanners_sem2_19.jpg	2025-04-30 16:00:00+00	2025-04-30 19:00:00+00	Vrolijke Viking	t	\N	6
342	Bowling	Hey Heimies,\r\n\r\nHeimdal goes bowling! Op dinsdag **6 mei** gaan we allemaal samen bowlen in **O'Learys** in Dok-Noord. Dat wil je zeker niet missen! \r\nTevens is dit het eerste event na de ontgroening, dus kan je als kersverse commi mee! We spreken af om **19u45** bij de ingang van de O'Learys, zodat we kunnen starten tegen 20u. \r\n\r\nDe kostprijs hiervan is **€6** voor leden en **€8,5** voor niet-leden. <br>\r\nInschrijven kan via volgende link: <br>\r\n🔗<a href="https://forms.gle/NKSLzB4nULYMdQk1A">https://forms.gle/NKSLzB4nULYMdQk1A</a> <br>\r\n(De deadline voor je in te schrijven is **vrijdag 25 april om 23u59**)\r\n\r\nRollende groeten, <br>\r\nJullie Sport Seppe\r\n\r\n**TL;DR**<br>\r\n🗓️ 6 Mei <br>\r\n📍 O'Learys (Dok-Noord 7/301, 9000 Gent) <br>\r\n🕢 19u45 <br>\r\n💰 €6 leden, €8.5 niet leden <br>\r\n🔗 https://forms.gle/US9JhFvi5USy11kB8	https://forms.gle/US9JhFvi5USy11kB8	events/EventBanners_sem2_10_-_kopie.jpg	2025-05-06 17:45:00+00	2025-05-06 21:00:00+00	O'Learys (Dok-Noord 7/301, 9000 Gent)	t	\N	2
375	Picknick	Hey liefste Heimies!\r\n\r\nHet begint mooi weer te worden en het einde van het jaar komt in zicht. <br> Maar niet getreurd, om het jaar mooi af te sluiten is er een picknick voor de laatste officiële clubavond.\r\n\r\nOp woensdag **14 mei vanaf 17u** verzamelen we aan het **Emile Braunplein**, *bij regen onder de schapenstal*. <br>Hier kunnen we gezellig genieten van een lekkere picknick en elkaars gezelschap. \r\n\r\nHiervoor bieden we een picknickpakket aan voor slechts **€4** (met 2 sandwiches) of **€5** (met 4 sandwiches). <br>**Waaruit zal deze bestaan?** <br>\r\n- 2 of 4 sandwiches <br>\r\n- 1 stuk fruit  <br>\r\n- een drankje van 0,5L <br>\r\n- en brikje <br>\r\n- een koekje <br>\r\n\r\n**Je eigen eten meebrengen?** Geen probleem. <br>Een picknickpakket bestellen is niet verplicht. <br>Je kan er alsnog gewoon gezellig bij komen zitten voor de sfeer.\r\n\r\nHeb je leuke spelletjes die we kunnen spelen?<br> Neem deze gerust mee :)\r\n\r\nJe picknick kan je bestellen via onderstaande link tot en met **10 mei**:<br>\r\n🔗 <a href="https://forms.gle/UpCwvWn6pgw7xJ1aA"> https://forms.gle/UpCwvWn6pgw7xJ1aA</a>\r\n\r\n**TL;DR**<br>\r\n📅 14 mei<br>\r\n📍 Emile Braunplein<br>\r\n🕐 17u00<br>\r\n💰 €4 / €5<br>\r\n🔗  <a href="https://forms.gle/UpCwvWn6pgw7xJ1aA">https://forms.gle/UpCwvWn6pgw7xJ1aA</a><br>\r\n\r\nHopelijk tot dan!<br>\r\nJullie allerliefste Cultuur, Kirsten	https://forms.gle/UpCwvWn6pgw7xJ1aA	events/EventBanners_sem2_11.jpg	2025-05-14 15:00:00+00	2025-05-14 18:00:00+00	Emile Braunplein	t	\N	4
442	Lasershooting	Heya Heimies!\r\n\r\nAls je geen genoeg kan krijgen van Sport events, hier ben ik weer met de volgende!\r\n\r\nDinsdag 14/10 gaat Heimdal lasershooten! Haal dus de scherpschutter in je naar boven en ga voor de meeste punten! Eeuwige roem staat je te wachten!\r\n**Opgelet!** Er kunnen maar maximaal 22 mensen meedoen met dit event, dus wees er snel bij!\r\n\r\nNet zoals bij het vorige Sport event kan je terug bonuspunten verdienen voor de Challenge van oktober door hier aanwezig te zijn. Als je hiervan wilt profiteren, neem dan zeker de Sport rol op!\r\n\r\nLasershootende groetjes\r\nAlejandro\r\n\r\ntl;dr\r\n\r\n🗓️ 14/10/2025\r\n\r\n🕖 18:45-21:00\r\n\r\n📍 The Zone: Voskenslaan 135, 9000 Gent\r\n\r\n💶 €18 voor leden; €20 voor niet-leden\r\n\r\n🔗 https://forms.gle/Bq17afEFV5hWVFaA9	\N	events/Banner_FB_-_Discord_-_Website_event_info_-_Campus_app_lasershooting.png	2025-10-14 16:45:00+00	2025-10-14 19:00:00+00	The Zone: Voskenslaan 135, 9000 Gent	t	\N	2
408	Stadsspel	Hey Heimies!\r\n\r\nVoor onze eerste activiteit gaan we samen Gent ontdekken! Tijdens ons stadsspel verkennen we enkele leuke Gentse herkenningspunten in combinatie met een heel aantal opdrachten waarmee je met je groepje punten kunt verdienen om het spel te winnen! Heb je zin gekregen om samen wat cultuur op te snuiven? Schrijf je dan zeker in via de Forms! \r\n\r\nVerkennende groetjes \r\nJullie Cultuur Ricardo\r\n\r\nTL;DR \r\n\r\n🗓️ 30 September\r\n\r\n🕑 18u\r\n\r\n📍 Vrolijke Viking (Voskenslaan 67, Gent) \r\n\r\n🔗 https://forms.gle/5gvMeqou5SFAFP8E6	\N	events/Banner_FB_-_Discord_-_Website_event_info_-_Campus_app.png	2025-09-30 16:00:00+00	2025-09-30 19:00:00+00	Vrolijke Viking (Voskenslaan 67, Gent)	t	\N	4
482	Schachtenevent: Presentatieavond	Heyo Heimies\r\n\r\nHeb jij iets waar je niet stil over kan zijn? Een hobby, je lievelingseten, is jouw huisdier echt het beste op aarde… of luister je gewoon graag naar mensen die yappen over hun passie? Kom dan naar de Presentatieavond op 20 november om 18:30, ons eerste Schachtenevent van dit jaar! Jullie kunnen alleen of in groepjes van maximum 3 mensen presenteren. Schrijf je in via de link en stuur je PowerPoint of Prezi ofzo voor 20 november naar schachtentemmer@heimdal.be (als je er een wilt gebruiken, een show-and-tell is ook helemaal in orde :)) \r\nWe gaan de lengte van de presentaties wel tot maximaal 10 minuten beperken om zo veel mogelijk mensen de kans te geven om vooraan te staan. De toeschouwers zullen de presentaties ook judgen, de top 3 presentaties van de schachtjes krijgen wat extra schachtenpunten! \r\n\r\nTot dan!\r\nJullie Schachtentemmer Simon en het Doopcomité\r\n\r\nTL:DR\r\n\r\n🗓️ 20 november\r\n\r\n🕡 18:30-22:00\r\n\r\n📍 Een lokaal op campus Schoonmeersen\r\n\r\n🔗 Schrijf je in via deze link \r\n\r\nhttps://forms.gle/8jMBeWLS2tcTgVdr5!	\N	events/Banner_PPTavond.png	2025-11-20 17:30:00+00	2025-11-20 21:00:00+00	Campus Schoonmeersen	t	\N	6
409	Mario Kart Toernooi	Heya Heimies!\r\n\r\nHet academiejaar is weer volop begonnen, net zoals Heimdal!\r\n\r\nNaar jaarlijkse traditie komt er dan ook weer het Mario Kart Toernooi, dat dit jaar nog eens 8 Deluxe zal zijn.\r\nHeb je dus zin om competitief te strijden voor de eerste plaats of kom je liever voor sfeer en gezelligheid meedoen? Kom dan zeker af! Als je de top 3 weet te behalen, sleep je misschien zelfs een prijs in de wacht… 👀\r\n\r\nDaarbovenop krijgt iedereen die de Sport rol heeft en aanwezig zal zijn 2 extra bonuspunten voor de Challenge van oktober! Wie weet is dit je kans op de ultieme comeback?\r\n\r\n(Mario) Kartende groeten\r\nAlejandro\r\n\r\ntl;dr\r\n🗓️ 6/10/2025\r\n\r\n🕡 18:30-23:00; deuren 18:30, start event 19:00\r\n\r\n📍 Comic Sans Gent: Klein Turkije 8, 9000 Gent\r\n\r\n💶 €3 voor leden; €5 voor niet-leden en aan de deur\r\n\r\n🔗 https://forms.gle/8Kv1sAP74hfzsSbr7	\N	events/Banner_MK.png	2025-10-06 16:30:00+00	2025-10-06 21:00:00+00	Comic Sans ( Klein Turkije 8, 9000 Gent)	t	\N	2
443	Karakoe I	Oi Heimies!\r\n\r\nHebben jullie zin om jullie zangtalenten te tonen aan Heimdal en een avond volledig los te gaan? Dan is de Karakoe dé perfecte gelegenheid voor jou! \r\nDe Karakoe is een karaokeavond waarbij je de mogelijkheid hebt om samen in duo, groep of alleen (als je dit durft 👀) een lied naar eigen keuze te zingen! \r\n\r\nHeb je er al zin in gekregen en wil je je prachtige stem laten horen? Dan heb je nog tijd om je stembanden voor te bereiden want de Karakoe zal plaatsvinden op 22/10 om 20:00u in de Comic Sans. \r\nHopelijk zien we je daar en we kijken er erg naar uit! \r\n\r\nMuzikale groetjes,\r\nJullie liefste Cultuur Ricardo\r\n\r\nTL:DR\r\n\r\n🗓️ 22 oktober \r\n\r\n🕗 20:00u-01:00u \r\n\r\n📍 Comic Sans | Klein Turkije 8, 9000 Gent	\N	events/Banner_Karakoe.png	2025-10-22 18:00:00+00	2025-10-22 23:00:00+00	Comic Sans ( Klein Turkije 8, 9000 Gent)	t	\N	4
444	Heimdal Doop: The Trail of Fire	Heyhey Feutjes!\r\n\r\nZijn jullie klaar om te bewijzen dat jullie echte vikings zijn? Om te bewijzen dat draken jullie niet afschrikken en om je schachtenlint te verdienen? Ben je klaar om je te laten dopen bij onze vereniging? Op woensdag 5 november verzamelen we om 18:00 in de Vrolijke Viking. Daar zullen we wat kennismakingsspelletjes spelen alvorens we vertrekken op een stadsspel waar je kan aantonen dat geen enkel overdreven reptiel jou klein krijgt! Op het einde van de avond wordt je als schacht verwelkomd in de vereniging na het eten van de schachtenpap en de officiële inwijding.\r\n\r\nPraktische info:\r\n\r\n- Zorg er eerst en vooral voor dat je ingeschreven bent als lid in de vereniging en dat je lidgeld betaald is → https://forms.gle/x4jJuBDnia6KsCmT9\r\n\r\n- Vul het inschrijvingsformulier van de doop in https://forms.gle/pNoF7rtfnJCkVrBm9\r\n\r\n- De doop begint om 18:00 in ons metercafé de Vrolijke Viking (Voskenslaan 67) met kennismakingsspelletjes en we vertrekken om 18:45 op de stadswandeling.\r\n\r\n- De doop zal rond 21:30 gedaan zijn aan ons petercafé de Comic Sans (Klein Turkije 8)\r\n\r\n- Na de doop vindt de doopouderavond plaats, elke schacht trekt de namen van hun twee doopouders uit een pot. Je meter(s) en/of peter(s) dienen als extra aanspreekpunten en vertrouwenspersonen die je helpen je weg te zoeken binnen de vereniging.\r\n\r\n- Verder hoef je niets mee te nemen, voorzie gewoon gepaste kledij voor het voorspelde weer. Als je pas later aan kan komen of vroeger moet vertrekken, geef me een seintje.\r\n\r\nAls je nog vragen of onzekerheden hebt kan je hiermee zeker terecht bij mij en de rest van het doopcomité, stuur ons zeker een berichtje :)\r\n\r\nTot binnenkort! \r\nDe Schachtentemmer Simon en het Doopcomité\r\n\r\nTL:DR\r\n\r\n🗓️ 05 november\r\n\r\n🕗 18:00u-21:30u \r\n\r\n📍 de Vrolijke Viking | Voskenslaan 67, 9000 Gent	\N	events/Banner_FB_-_Discord_-_Website_event_info_-_Campus_app.png	2025-11-05 17:00:00+00	2025-11-05 20:30:00+00	Vrolijke Viking (Voskenslaan 67, 9000 Gent)	t	\N	6
445	Studentenverenigingen 101	Heyhey Feuten en Heimies!\r\n\r\nWillen jullie nog wat extra info over studentenverenigingen, over Heimdal en wat ons uniek maakt? Wil je weten wat je ongeveer moet verwachten van de doop? Kom dan maandag 20 oktober naar de Vrolijke Viking. Daar zal ik om 19u een presentatie geven over exact deze onderwerpen! Alhoewel het evenement natuurlijk gericht is op onze nieuwe leden en geïnteresseerden is iedereen welkom voor een gezellige avond in ons metercafé (misschien krijg je dan wel de kans om op de Schachtentemmer te roepen wanneer hij iets fouts zegt). \r\n\r\nVeel groetjes van jullie Temmer en het Doopcomité!\r\nSimon, Axelle, Kobe, Maxe en Vincent\r\n\r\nTL;DR\r\n\r\n🗓️ 20 oktober\r\n\r\n🕗 19:00u \r\n\r\n📍 de Vrolijke Viking | Voskenslaan 67, 9000 Gent	\N	events/Banner_studentenverenigingen101.png	2025-10-20 17:00:00+00	2025-10-20 22:00:00+00	De Vrolijke Viking (Voskenslaan 67, 9000 Gent)	t	\N	6
478	Halloween Clubavond	Oi Heimies! \r\n\r\nDe nachten beginnen langer te worden, het warme zomerse weer is aan het vervagen en de bladeren zijn van de bomen aan het vallen ter voorbereiding op het koele weer. We hebben het herfstseizoen bereikt en dit betekent natuurlijk dat het weer tijd word om ons voor te bereiden op een geliefde klassieker, de Halloween Clubavond! \r\nHeb je zin om samen met Heimdal te griezelen en elkaar wat beter te leren kennen? Dan is dit hét perfecte moment om te komen! Je mag namelijk verkleed naar de clubavond komen, dus doe je beste kostuum aan en kom mee met ons Halloween vieren in ons petercafé de Comic Sans op 29 oktober! \r\n\r\n\r\nGriezelige groetjes,\r\nJullie liefste Cultuur Ricardo\r\n\r\nTL;DR \r\n\r\n📆 29 Oktober \r\n\r\n🕐 20u\r\n\r\n📍 Comic Sans | Klein Turkije 8, 9000 Gent	\N	events/Banner_FB_-_Discord_-_Website_event_info_-_Campus_app.png	2025-10-29 19:00:00+00	2025-10-29 23:00:00+00	Comic Sans ( Klein Turkije 8, 9000 Gent)	t	\N	4
479	Weerwolvenavond	Oi heimies \r\n\r\nOp 11 november om 20:00u zullen we in de Vrolijke Viking het welgekende gezelschapsspel Weerwolven spelen!\r\nZijn jullie bereid om het geliefde Wakkerdam te verdedigen van de vreselijke weerwolvenplaag die het dorpje bedreigt? Of ga jij je tandje bijsteken aan het uitroeien van de dorpsbewoners en het verspreiden van de vloek als bloeddorstige weerwolf? \r\nHet lot zal beslissen welke rol je opneemt binnen het verhaal, maar hoe het zich uitspeelt, ligt (deels) in jouw handen. \r\n\r\nGeen inschrijving is hiervoor nodig, dus als je graag wil meedoen aan de Weerwolvenavond hoef je enkel maar af te komen naar de Vrolijke Viking op het afgesproken tijdstip. \r\nIk kijk er alvast naar uit om erachter te komen wie de strijd zal winnen, de dorpsbewoners van Wakkerdam of de woeste weerwolven?\r\n\r\nDuistere groetjes, \r\nJullie liefste Cultuur, Ricardo \r\n\r\n\r\nTLDR:\r\n\r\n🎲 Weerwolven\r\n\r\n🗓️ Dinsdag 11 november\r\n\r\n🕗 20:00\r\n\r\n📍 Vrolijke Viking | Voskenslaan 67, 9000 Gent	\N	events/Banner_Weerwolven.png	2025-11-11 19:00:00+00	2025-11-11 23:00:00+00	Vrolijke Viking (Voskenslaan 67, 9000 Gent)	t	\N	4
480	The Dragon Dance: cocktailfeestje	Goeiemorgen Heimies!\r\n\r\nOp 13 november is het weer zover — tijd om jullie drakenskills te testen op ons cocktailfeestje!\r\n\r\n🕣 Vanaf 20u30 vliegen we er stevig in in de Canard Bizar, Overpoortstraat 94/92.\r\nVerzamel je Vikings en drakenrijders en kom verkleed in How to Train Your Dragon-stijl!\r\n (🐲 Wie verkleed komt, krijgt een gratis cocktail!)\r\n\r\nLaat je innerlijke Night Fury los en kom mee de nacht ontdekken!\r\n\r\nGroetjes,\r\n 🧓 Bompa LAN\r\n\r\n⚔️ TL;DR:\r\n\r\n 📍 Canard Bizar, Overpoortstraat 94/92\r\n\r\n 📅 13 november\r\n\r\n 🕣 : 20u30\r\n\r\n 👗 How to Train Your Dragon / fantasy outfit	\N	events/Banner_cocktailfeestje.png	2025-11-13 19:30:00+00	2025-11-14 02:00:00+00	Canard Bizard ( Overpoortstraat 94/92 )	t	\N	7
481	Baseball	Heya Heimies!\r\n\r\nA new Sport event appeared!\r\n\r\nDeze keer gaat Heimdal baseballen! Op dinsdag 18/11 verzamelen we op het kunstgrasveld van Campus Schoonmeersen, waar jullie het in groepjes tegen elkaar zullen opnemen voor de eeuwige roem!\r\n\r\nHeb je zin gekregen om mee te doen? Vul dan zeker onderstaande Forms in en begin je al voor te bereiden om een homerun te lopen!\r\n\r\nBaseballing groetjes\r\nAlejandro\r\n\r\ntl;dr\r\n\r\n🗓️ 18/11\r\n\r\n🕖 18:45-20:30\r\n\r\n📍 Kunstgrasveld Campus Schoonmeersen | Valentin Vaerwyckweg 1, 9000 Gent\r\n\r\n🔗 https://forms.gle/3Yq6fHxdP318rBq3A	\N	events/Banner_Baseball.png	2025-11-18 17:45:00+00	2025-11-18 19:30:00+00	Kunstgrasveld Campus Schoonmeersen | Valentin Vaerwyckweg 1, 9000 Gent	t	\N	2
517	Secret Santa Clubavond	Oi Heimies!\r\n\r\nDecember, het einde van het jaar, begint steeds dichter te komen wat betekent dat de sfeer van de feestdagen stilletjes aan het opkomen is! Natuurlijk zullen we die warme, fijne Kerstsfeer ook naar Heimdal brengen dit jaar met niets anders dan de Secret Santa op 17 december! \r\n\r\n**Wat is een Secret Santa?**\r\n\r\nEen Secret Santa betekend dat wij even de rol van de kerstman zullen overnemen en een (of meerdere) cadeautje(s) gaan kopen voor een medeheimie! Belangrijk hierbij om te vermelden, is dat **de persoon waarvoor je een cadeau koopt niet weet dat jij dat bent dus het moet volledig geheim blijven!** Dat is juist wat het een *secret* Santa maakt. \r\n\r\n**Praktische Info**\r\n\r\nOm deel te nemen aan de Secret Santa moet je de onderstaande form invullen. Zo kom je in de pot met namen te zitten met al de deelnemers en **zal ik je op zondag 30/11 sturen wie je hebt** met eventueel bijhorende voorkeuren van die persoon! Hou hierbij rekening mee dat het **budget niet hoger dan € 20** ligt! *(indien je de persoon die je hebt gekregen persoonlijk goed kent en iets voor hen wil kopen dat hoger dan het budget ligt, is dit toegelaten van mij)*\r\nDus **zorg ervoor dat je de form hebt ingevuld vóór 30/11!** \r\nForm om je in te schrijven: https://forms.gle/RSFa8R8d25gjKGXL6\r\nAlvast veel succes en hopelijk kijken jullie er erg naar uit!\r\n\r\n\r\nFeestelijke groetjes,\r\nJullie liefste Cultuur, Ricardo\r\n\r\nTL:DR\r\n\r\n🗓️ 17 december \r\n\r\n🕗 20:00u \r\n\r\n📍 Comic Sans\r\n\r\n💰 € 20 max. \r\n\r\n🔗 https://forms.gle/RSFa8R8d25gjKGXL6	\N	events/Banner_Secret_Santa.png	2025-12-17 19:00:00+00	2025-11-17 23:00:00+00	Comic Sans ( Klein Turkije 8, 9000 Gent)	t	\N	4
518	De Warmste Stream 2025	Hey Heimies!\r\n\r\nOp zaterdag 13 december om 14u organiseert Bompa LAN opnieuw De Warmste Stream: 24 uur lang gamen, lachen en samen het verschil maken voor De Warmste Week!\r\nWe streamen tot zondag 14 december, 14u — en dit jaar combineren we de stream opnieuw met een WAN in onze Heimdal Discord. 🎮💻\r\n\r\n⭐ Wat mag je verwachten?\r\n* 24 uur games, challenges en gezelligheid\r\n* Party games waar jullie actief kunnen meedoen\r\n* Stream gehost door de Heimdal Twitch crew\r\n\r\n❤️ Waarom doen we dit?\r\nDe Warmste Week staat dit jaar opnieuw in het teken van eenzaamheid tegengaan. Als vereniging die draait rond samen gamen, verbinden en samen plezier maken, willen wij tonen wat Heimdal betekent voor alle leden. Daarom zet Heimdal zich in voor dit warme doel.\r\n\r\n🙌 Hoe kan jij helpen?\r\n* Kijk mee op de stream\r\n* Doneer als je kan\r\n* Doe mee met de WAN-games\r\n* Deel het event met vrienden\r\nSamen brengen we warmte waar die nodig is.\r\n\r\nTL;DR\r\n\r\n🎮 **Wat?**\r\n\r\n24u stream + WAN vol party games en communityfun.\r\n\r\n🗓️ **Wanneer?**\r\n13 dec 14:00 - 14 dec 14:00\r\n\r\n📍 **Waar?**\r\nTwitch: https://www.twitch.tv/heimdalgent\r\nDiscord: Heimdal-server\r\n\r\n🎯 **Waarom?**\r\nDe Warmste Week steunen en samen strijden tegen eenzaamheid.\r\n\r\nDus Heimies… zet jullie headsets op, laad die controllers op, en maak samen met **Bompa LAN** een legendarische editie waar we als Heimdal trots op kunnen zijn! \r\n\r\n💪✨\r\nGroetjes\r\nBompa LAN	\N	events/Banner_WAN.png	2025-12-13 13:00:00+00	2025-12-14 13:00:00+00	twitch.tv/heimdalgent	t	\N	7
520	Schaatsen	Heyo Heimies!\r\n\r\nDe maanden vliegen voorbij en dus is het alweer tijd om het laatste Sportevent van het eerste semester aan te kondigen.\r\nDat doen we dan ook met een ouwe gouwe klassieker: schaatsen!\r\n\r\nOp dinsdag 9/12 gaan we met z’n allen naar de Kristallijn in Gent! Of je nu moeite hebt met overeind te blijven of juist een echte pro bent, iedereen is hier even welkom, dus breng ook zeker al je vrienden mee.\r\n\r\nDit event kost €5,5 voor leden en €7,5 voor niet-leden, en om het event zelf vlot te laten verlopen, kan je enkel maar vooraf betalen. Dit ofwel via rechtstreekse overschrijving, ofwel Payconiq aan de Quaestor Als je voor de laatste optie kiest, kan je hem vinden op een clubavond of ander event, maar zorg dat deze betaling in orde komt ten laatste op de Sinterklaas clubavond, wat de laatste clubavond voor het schaatsen is. (Anders krijg je de Quaestor achter je aan en ik sta niet in voor de gevolgen hiervan…)\r\n\r\nInschrijven doe je dan weer via onderstaande Forms, en de geïnteresseerden kunnen terug een bonuspunt claimen voor de Challenge van december (die later nog aangekondigd zal worden)!\r\n\r\nSchaatsende groetjes\r\nAlejandro\r\n\r\ntl;dr\r\n\r\n🗓️ 9/12\r\n\r\n🕗 19:45-21:30\r\n\r\n📍 Ijsbaan Kristallijn | Warmoezeniersweg 20, 9000 Gent\r\n\r\n💶 €5,5 voor leden; €7,5 voor niet-leden\r\n\r\n🔗 https://forms.gle/fwgXHYgoD1M2MBqE8	\N	events/Banner_Schaatsen.png	2025-12-09 18:45:00+00	2025-12-09 20:30:00+00	Ijsbaan Kristallijn | Warmoezeniersweg 20, 9000 Gent	t	\N	2
519	Heimdal Ledenweekend	Oi Heimies! \r\n\r\nZijn jullie bereid om mee te komen naar ons dragon training camp, waar jullie zullen leren om echte vikings te worden? Spreid jullie vleugels en kom mee met ons op een onvergetelijk** ledenweekend van Heimdal dat zal doorgaan van vrijdag 20 februari 2026 tot en met zondag 22 februari 2026!** \r\nDe plek waar onze vikings zullen getraind worden om legendarische drakenrijders te worden is: **De Kluis 1, 3051 Oud-Heverlee**\r\n\r\nVoor meer info: https://fb.me/e/6Z8Z06WbW\r\n\r\nAvontuurlijke groetjes,\r\nJullie liefste Cultuur, Ricardo	\N	events/Banner_weekend.png	2026-02-20 17:00:00+00	2026-02-22 14:00:00+00	De Kluis 1 (Oud-Heverlee)	f	\N	4
521	Secret Santa Clubavond	Oi Heimies!\r\n\r\nDecember, het einde van het jaar, begint steeds dichter te komen wat betekent dat de sfeer van de feestdagen stilletjes aan het opkomen is! Natuurlijk zullen we die warme, fijne Kerstsfeer ook naar Heimdal brengen dit jaar met niets anders dan de Secret Santa op 17 december!\r\n\r\n**Wat is een Secret Santa?**\r\n\r\nEen Secret Santa betekend dat wij even de rol van de kerstman zullen overnemen en een (of meerdere) cadeautje(s) gaan kopen voor een medeheimie! Belangrijk hierbij om te vermelden, is dat **de persoon waarvoor je een cadeau koopt niet weet dat jij dat bent dus het moet volledig geheim blijven!** Dat is juist wat het een *secret* Santa maakt.\r\n\r\n**Praktische Info**\r\n\r\nOm deel te nemen aan de Secret Santa moet je de onderstaande form invullen. Zo kom je in de pot met namen te zitten met al de deelnemers en **zal ik je op zondag 30/11 sturen wie je hebt** met eventueel bijhorende voorkeuren van die persoon! Hou hierbij rekening mee dat het **budget niet hoger dan € 20** ligt! *(indien je de persoon die je hebt gekregen persoonlijk goed kent en iets voor hen wil kopen dat hoger dan het budget ligt, is dit toegelaten van mij)*\r\nDus **zorg ervoor dat je de form hebt ingevuld vóór 30/11!**\r\n\r\nForm om je in te schrijven: https://forms.gle/RSFa8R8d25gjKGXL6\r\nAlvast veel succes en hopelijk kijken jullie er erg naar uit!\r\n\r\nFeestelijke groetjes,\r\nJullie liefste Cultuur, Ricardo\r\n\r\nTL:DR\r\n\r\n🗓️ 17 december\r\n\r\n🕗 20:00u\r\n\r\n📍 Comic Sans\r\n\r\n💰 € 20 max.\r\n\r\n🔗 https://forms.gle/RSFa8R8d25gjKGXL6\r\nInschrijven voor 30/11!	\N	events/Banner_Secret_Santa.png	2025-12-17 19:00:00+00	2025-12-17 22:00:00+00	Comic Sans ( Klein Turkije 8, 9000 Gent)	t	\N	4
522	Museumnacht	Hey hey Heimies!\r\n\r\nDoor afwezigheid van onze geliefde Cultuur die week wil ik jullie zelf wat cultuur bijbrengen ;) \r\n\r\nMijn kunstige kant stond te popelen om samen met jullie de musea van Gent te ontdekken! Daarom nodig ik jullie graag uit voor de museumnacht **4 december vanaf 19u**. Hierbij kunnen jullie op onderstaande poll jullie voorkeur van musea doorgeven en dan zal ik een route uitstippelen die we samen kunnen ontdekken :D \r\n\r\nDit is natuurlijk geen schooluitstap dus moesten jullie andere musea willen doen met jullie vrienden/doopouders dan kan dit zeker ook! \r\nHieronder vinden jullie een korte uitleg per museum (deze kunnen jullie ook vinden op de website: https://degentsemusea.be/musea) \r\n\r\n### Algemene uitleg musea\r\n* Kina = museum voor kind en natuur (vooral fossielen, gesteenten en insecten)\r\n* GUM & Plantentuin = wetenschappelijk museum (van biologie en archeologie tot geneeskunde en psychologie) \r\n* Huis van Alijn = rituelen, tradities en gewoontes van de 20e eeuw tot nu \r\n* Industriemuseum = industriële geschiedenis in een indrukwekkend fabrieksgebouw\r\n* MSK = museum van schone kunsten (beeldhouwwerken en schilderijen)\r\n* Museum Dr. Guislain = Lokale geschiedenis + medische collectie\r\n* Sint-Pietersabdij \r\n* S.M.A.K. = stedelijk museum voor actuele kunst \r\n* STAM = stadsmuseum Gent (ontwikkeling en groei van Gent)\r\n* Historische huizen Gent \r\n\r\nTL;DR\r\n\r\n🗓️  4 december \r\n\r\n🕖 19u-01u (ten laatste)\r\n\r\n💵 Gratis!\r\n\r\n📍 Afhankelijk route (wordt later gecommuniceerd) \r\n\r\nKunstige groetjes \r\nJullie Media Axelle 🖌️ 🎨	\N	events/Banner_museumnacht.png	2025-12-04 18:00:00+00	2025-12-05 00:00:00+00	Gentse Musea	t	\N	4
523	Sinterklaas clubavond	Oi Heimies! \r\n\r\nEen van onze favoriete Belgische *(en Nederlandse)* feestdagen is er bijna weer, de welgekende Sint-Nicolaasdag die op 6 december hier in België gevierd wordt! \r\nTuurlijk gaan we dit ook samen met Heimdal beleven, maar aangezien de meeste van ons lekker gezellig thuis zitten op 6 december, zullen we die dag op een ander moment vieren, namelijk** op 3 december tijdens onze clubavond!** \r\n\r\nOp deze clubavond zal je een klein cadeautje krijgen van de Sint, op voorwaarde dat je braaf bent geweest en een brief schrijft of een tekeningetje maakt die je persoonlijk aan de Sint kan afgeven! Hiervoor krijg je gelukkig tijd om dit tijdens de clubavond in de CS te doen.\r\n\r\nSpijtig genoeg zal ik er niet aanwezig kunnen zijn, maar ik vertrouw erop dat mijn mede-praesidiumleden dit evenement in goede banen zullen leiden! \r\nHopelijk kijken jullie er alvast erg naar uit om Sinterklaas en zijn hulppiet te ontmoeten! \r\n\r\nFeestelijke groetjes,\r\nJullie liefste Cultuur, Ricardo\r\n\r\nTL;DR\r\n\r\n🗓️ 3 december \r\n\r\n🕗 20:00u\r\n\r\n📍 Comic Sans	\N	events/Banner_sinterklaas.png	2025-12-03 19:00:00+00	2025-12-03 22:00:00+00	Comic Sans ( Klein Turkije 8, 9000 Gent)	t	\N	4
556	Pokémon Showdown	Heya Heimies!\r\n\r\nAls twee mensen elkaar diep in de ogen kijken… dan is het tijd voor een Pokémon Battle!\r\n\r\nOp donderdag 12/2 maak je kans om een echte Pokémon Champion te worden! Hiervoor zal er gebruik gemaakt worden van <a href= "https://pokemonshowdown.com"> Pokémon Showdown <a> , een gratis website waar je direct alle Pokémon tot je beschikking hebt, en dus ook zonder problemen je eigen team kan samenstellen (als deze volgens de regels zijn).\r\n\r\nDe regels die gebruikt zullen worden voor dit toernooi, zijn die van OU (OverUsed). Als je op de website een team begint samen te stellen, zal je ook deze regels kunnen selecteren, waardoor je enkel de toegelaten Pokémon voorgesteld krijgt.\r\n\r\nHeb je wat inspiratie nodig? <a href= "https://www.smogon.com/forums/threads/sv-ou-sample-teams-new-samples-added-post-scl-and-olt.3712513/">Deze forumpost<a> geeft enkele voorbeelden van vaak gebruikte teams.\r\n\r\nPokémon battlende groetjes\r\n\r\nAlejandro\r\n\r\ntl;dr\r\n\r\n🗓️ 12/2/2026\r\n\r\n🕡 18:30-22:30\r\n\r\n📍 Comic Sans Gent | Klein Turkije 8, 9000 Gent\r\n\r\n🔗 <a href= "https://forms.gle/vDWZGD4eakmbbLf67" ">Formslink	\N	events/Banner_Pokemon_Showdown.png	2026-02-12 17:30:00+00	2026-02-12 21:30:00+00	Comic Sans ( Klein Turkije 8, 9000 Gent)	t	\N	2
589	Pizza & Boardgames	Oi Heimies!\r\n\r\n\r\nWat kan er mogelijks beter zijn dan genieten van een vers gemaakte pizza? Ervan genieten samen met je mede-Heimies tijdens dat je board games aan het spelen bent natuurlijk! \r\n\r\n\r\nOp donderdag 26/02/2026 in ons metercafé De Vrolijke Viking, ben je welkom vanaf 18u om samen met je liefste Heimies een heleboel board games te spelen en, indien je dit wil, een pizza van de Vrolijke Viking te eten. Er zullen ter plekke een groot assortiment aan board games beschikbaar zijn dus je hoeft je geen zorgen te maken over geen spelletje te kunnen spelen! \r\n\r\n\r\nWat de pizza's betreft... Je kan via onderstaand bestelformulier doorgeven welke pizza je graag zou willen tussen welk tijdstip! Je hebt tot 23/02/2026 om 23u59 om je bestelling door te geven! \r\n\r\n\r\n*Opgelet: als er een tijdstip niet meer tussen staat zijn daar alle beschikbare pizza's al uitgekozen, dus first come first serve!*\r\nhttps://forms.gle/4XhrvubUEoaKe46b9 \r\n\r\n\r\nAmuserende (en smakelijke) saudações,\r\n\r\nJullie liefste Cultuur, Ricardo\r\n\r\nTL;DR\r\n\r\n\r\n🗓️ 26/02/2026\r\n\r\n🕡 18:00 - 23:00\r\n\r\n📍 Vrolijke Viking\r\n\r\n🔗 https://forms.gle/4XhrvubUEoaKe46b9	\N	events/Banner_PB.png	2026-02-26 17:00:00+00	2026-02-26 22:00:00+00	Vrolijke Viking (Voskenslaan 67, 9000 Gent)	t	\N	4
622	Escape Room	Oi Heimies!\r\n\r\nOp dinsdag 3 maart vanaf 19u00 gaan we escape rooms gaan spelen bij Exit Games in Gent!\r\n\r\nOf je nu een expert bent in dit soort spellen of als het je eerste beleving zal worden met een escape room; het zal zeker en vast een toffe ervaring worden en iedereen is welkom om te komen! \r\n\r\nJe zal de keuze hebben uit 4 verschillende escape rooms, met elks hun eigen unieke verhaal dat je kan beleven. Er kunnen maximum 32 deelnemers zijn (8 spelers x 4 rooms) dus schrijf je op tijd in om je spot te claimen! Liefst zou je een half uur op voorhand aanwezig moeten zij vooraleer je aan je escape room begint.\r\n\r\nEr zullen ter plekke door ons ook een aantal gezelschapsspellen voorzien worden. De mensen die aanwezig zullen zijn maar door eender welke reden niet in een room zitten, kunnen een gezelschapsspel tussendoor spelen. Ingeschreven of niet, je bent altijd welkom om erbij te komen zitten en wat spelletjes te spelen met een drankje van de bar! \r\n\r\nHieronder kan je het inschrijvingsformulier vinden:\r\nhttps://forms.gle/gUiNdncRLrhxAkHYA\r\n\r\nDe kostprijs om deel te nemen is € 20 als lid en € 25 als niet-lid van Heimdal. Je dient tegen 02/03 het bedrag over te schrijven, ter plaatse betalen is niet mogelijk.\r\nIndien je vragen of bezorgdheden hebt, mag je mij altijd een bericht sturen! :) \r\n\r\n\r\nEscaping saudações,\r\nJullie liefste Cultuur, Ricardo\r\n\r\nTL;DR\r\n\r\n🗓️ 03/03/2026\r\n\r\n🕖 19:00 - 23:30\r\n\r\n📍 Exit Games Gent | Bagattenstraat 132, 9000 Gent\r\n\r\n🔗 https://forms.gle/gUiNdncRLrhxAkHYA	\N	events/Banner_escape_room.png	2026-03-03 18:00:00+00	2026-03-03 22:00:00+00	Exit Games Gent ( Bagattenstraat 132, 9000 Gent)	t	\N	4
655	The Feast of Valhalla: Cocktailfeestje II	Hey Heimies!\r\n\r\nOp 𝟭𝟵 𝗺𝗮𝗮𝗿𝘁 trekken we naar 𝗗𝗲 𝗣𝗮𝗹𝗹𝗶𝗲𝘁𝗲𝗿 (Overpoort) voor een episch Vikinggelag.\r\n\r\nVanaf 20u30\r\nKom verkleed als Viking of Noordse god en krijg een gratis cocktail !\r\n\r\nSkål!\r\n𝗕𝗼𝗺𝗽𝗮 𝗟𝗔𝗡\r\n\r\nTL;DR\r\n\r\n📍 De Pallieter, \r\nOverpoortstraat 68, 9000 Gent\r\n\r\n📅 19 maart\r\n\r\n🕣  20u30\r\n\r\n👗 Viking outfit (optional)	\N	events/Banner_fiesta_II.png	2026-03-19 19:30:00+00	2026-03-20 00:00:00+00	De Pallieter (Overpoortstraat 68, 9000 Gent)	t	\N	7
656	The Hidden LAN	Goeiemorgen Heimies,\r\n\r\nIs iedereen klaar voor het meest anticipated evenement van het jaar? \r\nThat's right! Het is eindelijk tijd voor de officiële Heimdal LAN van 2026!\r\n\r\nSta paraat om je set-up te verhuizen voor een nacht aan plezier want op **2 April om 19u30** gaan de deuren van de LAN open in de **resto van gebouw D op de Hogent campus Schoonmeersen!**\r\n\r\nSchrijf jezelf maar snel in via onderstaande link:\r\n\r\n<a href="https://forms.gle/aVhb72ctPD3pCR458">Inschrijving LAN <a>\r\n\r\nHieronder vind je een korte opsomming van de Tournament Games die je kan verwachten tijdens de LAN en natuurlijk zijn er voor deze competities ook prijzen voorzien!   \r\n(meer info in de inschrijvingsform)\r\n\r\n- Crab Game\r\n- Mario Kart World\r\n- Rocket League (2v2)\r\n- League Of Legends (2v2)\r\n\r\nEnkele Side Challenges 👀\r\n\r\nExclusive Randanimatie hoekje voorzien door **Nemesis Gent!** \r\n\r\n**TLDR:**\r\n\r\n📍 HOGENT Campus Schoonmeersen, Resto D\r\n\r\n📅 02/04/2026 - 03/04/2026\r\n\r\n🕢 Time: 19:30u - 06:00u\r\n\r\n💶 € 5\r\n\r\n\r\nIk kijk zelf al erg uit naar deze onvergetelijke nacht, hopelijk jullie ook!\r\n\r\nGroetjes \r\nBompa LAN	\N	events/Banner_LAN.png	2026-04-02 17:30:00+00	2026-04-03 04:00:00+00	Campus Schoonmeersen, Resto D	t	\N	7
658	Schachtenevent: The Dragon Trapper	Hey Heimies! \r\n\r\nOp dinsdag 17 maart vindt ons epische schachtenevent plaats. Dit zal een super leuk stadsspel zijn. En de leukste stadsspelen hebben natuurlijk een twist. Jullie zullen verdeeld worden in groepen, en er zal een Dragon Trapper aanwezig zijn in elke groep die zal saboteren (zoals Dragon Trappers natuurlijk graag doen). \r\n\r\nOm je in te schrijven vul je **onderstaande form** in zodat wij op voorhand groepjes kunnen samenstellen: \r\n\r\nhttps://forms.gle/rPnWLLuRvW9bC3GQ8\r\n\r\nWij spreken af om 19u30, aan de Comic Sans om goed aan het spel te beginnen en zouden zeker klaar zijn om 23u00. Mochten er problemen zijn, zoals dingen die jullie zijn vergeten in de form te zetten of iets gelijkaardigs, let us know zodat het genoteerd kan worden.\r\n\r\nMay the Force be with you onze lieve draken.\r\n\r\nMet veel liefde, jullie geweldige schachtjes.\r\n\r\n**-----**\r\n\r\n⚔️ TL;DR:\r\n\r\n📍 De Comic Sans, Klein Turkije 8, 9000 \r\nGent\r\n\r\n📅 17 maart\r\n\r\n🕣  19u30 - 23u00	\N	events/Banner_FB_-_Discord_-_Website_event_info_-_Campus_app.png	2026-03-17 18:30:00+00	2026-03-17 22:00:00+00	Comic Sans ( Klein Turkije 8, 9000 Gent)	t	\N	6
659	Movie Night II	Oi Heimies! \r\n\r\nOp maandag 30/03 zal de tweede Movie Night van het academiejaar plaatsvinden! \r\nDit zal doorgaan in ons petercafé de Comic Sans in de gameroom. Aangezien de gameroom niet de allergrootste ruimte is, zullen er twee verschillende voorstellingen zijn voor wanneer we de film zullen afspelen: je hebt de keuze tussen 18:00u of 20:00u.\r\nIk raad aan om je via onderstaande Forms in te schrijven en aan te duiden naar welke voorstelling je wil komen. Er is namelijk een maximum capaciteit voor hoeveel mensen er in de gameroom kunnen zitten: \r\nhttps://forms.gle/Bq6tjtZsXoXQLwEU6\r\n\r\n"Wat is de film eigenlijk?" vraag je je misschien af. Wel, anders dan vorig semester, waarbij we de film via een zeer democratisch systeem hebben verkozen, heb ik deze keer zelf de film gekozen. \r\nHet gaat natuurlijk de film van ons jaarthema zijn: How To Train Your Dragon (2010)! \r\n\r\nSnacks en drank:\r\nAangezien we in de Comic Sans zullen zitten, kan je snacks en drank aankopen aan de bar of zelf je eigen snacks meebrengen. Drank is verboden om zelf mee te brengen! \r\n\r\nMaar what about de andere Movie Nights?\r\nAls je goed hebt opgelet, zal het je misschien al opgemerkt zijn dat er niet één Movie Night II op de kalender is gepland, maar drie! De eerste Movie Night II zal namelijk fysiek, in de Comic Sans, plaatsvinden. De andere twee zullen dan op de twee opeenvolgende weken online op zaterdag doorgaan. Meer info hierover zal later aangekondigd worden ;) \r\n\r\n\r\nTrainende saudações,\r\nJullie liefste Cultuur, Ricardo\r\n\r\nTL;DR\r\n\r\n🗓️ 30/03/2026\r\n\r\n🕕 18:00 - 22:30\r\n\r\n📍 Comic Sans Gent | Klein Turkije 8, 9000 Gent\r\n\r\n🔗 https://forms.gle/Bq6tjtZsXoXQLwEU6	\N	events/Banner_Movie_Night_II.png	2026-03-30 16:00:00+00	2026-03-30 21:00:00+00	Comic Sans ( Klein Turkije 8, 9000 Gent)	t	\N	4
660	Pasen clubavond	Oi Heimies \r\n\r\nOp woensdag 01/04 (nee dit is geen joke) gaan we in de Comic Sans tijdens onze clubavond een van onze favoriete feestdagen vieren: Pasen! \r\n\r\nTijdens deze clubavond zal je je bezig kunnen houden met het kleuren van paaseieren en mag je een bezoekje verwachten van de paashaas! \r\nJe hoeft zelf geen materiaal of dergelijke te voorzien, dus kom gewoon af om Pasen met ons vieren! \r\n\r\n\r\nFeestelijke saudações,\r\n\r\nJullie liefste Cultuur, Ricardo	\N	events/Banner_Pasen.png	2026-04-01 18:00:00+00	2026-04-01 20:00:00+00	Comic Sans ( Klein Turkije 8, 9000 Gent)	t	\N	4
661	Karakoe II	Oi Heimies!\r\n\r\nOp woensdag 22 april zullen we, net zoals in het eerste semester, een karaokeavond organiseren tijdens de clubavond in de Comic Sans! Bereid je stembanden dus goed voor tijdens de paasvakantie, want het zal weer een avond vol gezang en plezier worden! \r\n\r\nJe hoeft je hiervoor niet in te schrijven, dus je bent welkom om op eender welk moment in de avond toe te komen en mee te doen! Dit is ook een ideaal moment om je niet-Heimie vrienden uit te nodigen en samen jullie favoriete liedjes te zingen. \r\nEr zal ter plekke op alle tafels een QR-code liggen die je met je gsm kan scannen. Zo kom je terecht op een Google Forms document waarmee je je lied(jes) kan insturen. \r\n\r\nIk ben alvast erg enthousiast om jullie zangtalenten nog eens voor een laatste keer te horen! \r\n\r\n\r\nCantando saudações,\r\n\r\nJullie liefste Cultuur, Ricardo\r\n\r\nTL;DR\r\n\r\n🗓️ 22/04/2026\r\n\r\n🕣 20:30 - 02:00\r\n\r\n📍 Comic Sans Gent | Klein Turkije 8, 9000 Gent :comic:	\N	events/Banner_Karakoe.png	2026-04-22 18:30:00+00	2026-04-23 00:00:00+00	Comic Sans ( Klein Turkije 8, 9000 Gent)	t	\N	4
695	Verkiezingen 2026-2027	Beste Heimies\r\n\r\nMaandag 11 mei is het zover: de jaarlijkse verkiezingen staan voor de deur! 🗳️\r\nJullie zijn welkom vanaf 18u30in de Comic Sans.\r\nWe starten stipt om 19u — wees op tijd!\r\n\r\nJe kandidatuur indienen en het aanvragen van een uitzondering kan via onderstaande Google Form. \r\nDe deadline hiervoor is maandag 4 mei 23u59. \r\n🔗 https://forms.gle/6AdzgV79QWtFuRMd6\r\n\r\nHeb je nog vragen? Contacteer gerust iemand van het kiescomité:\r\nHayley Rasschaert  \r\nReina Tanghe\r\nRitchie Van Mele  \r\nSander De Bruyker\r\n\r\n**TL;DR**\r\n\r\n🗓️ Maandag 11 mei\r\n\r\n🕡 18u30\r\n\r\n📍 Comic Sans\r\n\r\n📝 Deadline kandidaturen: 4 mei om 23u59\r\n\r\n🔗 https://forms.gle/6AdzgV79QWtFuRMd6\r\n\r\nVeel liefs en tot de verkiezingen!\r\n\r\nHet kiescomité	\N	events/Banner_verkiezingen.png	2026-05-11 16:30:00+00	2026-05-11 23:00:00+00	Comic Sans ( Klein Turkije 8, 9000 Gent)	t	\N	35
728	Heimdal Quiz	Hey Heimies \r\n\r\nZijn jullie klaar voor een supercoole Heimdalquiz? Wij alvast wel! \r\n\r\nJullie zijn allemaal welkom in de Vrolijke Viking op 27 april vanaf 19 uur om jullie kennis op de proef te stellen. Deze quiz zal gespeeld worden in groepen van 4 t.e.m. 6 personen, die door jullie op voorhand gevormd zijn! :3\r\n\r\nWe vragen jullie wel om je in te schrijven via onderstaande Forms, zodat we weten hoeveel volk we kunnen verwachten ;) Dit hoeft slechts 1 persoon van de groep te doen!\r\nhttps://forms.gle/ntTEnba3Mot5hFk66\r\n\r\nTLDR\r\n\r\n🗓️ 27 april\r\n\r\n🕕 19u-20u30\r\n\r\n📍De Vrolijke Viking | Voskenslaan 67, 9000 Gent\r\n\r\n📎 Schrijf je hier in! \r\n(https://forms.gle/ntTEnba3Mot5hFk66)\r\n\r\n\r\nAlvast veel quizplezier!\r\n\r\nQuizzende groetjes\r\n\r\njullie Secretaris en Praeses!	\N	events/Banner_FB_-_Discord_-_Website_event_info_-_Campus_app.png	2026-04-27 17:00:00+00	2026-04-27 18:30:00+00	Vrolijke Viking (Voskenslaan 67, 9000 Gent)	t	\N	4
732	Heimdal Potluck	Oi Heimies! \r\n\r\nNu dat de temperaturen weer aan het stijgen zijn en het zonnetje vaker tevoorschijn komt om ons te begroeten, is het ideaal om eens een potluck te doen! \r\nOp woensdag 13/05 vanaf 18u zullen we verzamelen op het Emile Braunplein in Gent. Iedereen is welkom om erbij te komen en zélf iets mee te brengen (voor de groep)! Is er een gerecht die je enorm graag maakt en het met ons wil delen? Wil je jouw baktalenten tonen? Ben je een prof in het maken van salades? Of kook je niet zo graag maar wil je toch nog iets delen met de groep? Alles dat eetbaar is mag mee voorzien worden door jullie! \r\nIndien het weer wat tegenvalt, zullen we verzamelen aan de Comic Sans. \r\n\r\nZo kunnen we definitief afscheid nemen van het huidige Praesidium en het nieuwe Praesidium van 2026-2027 verwelkomen! \r\n\r\n\r\nAllerlaatste saudações,\r\n\r\nJullie liefste Cultuur, Ricardo\r\n\r\n\r\nTL;DR\r\n\r\n🗓️ 13/05/2026\r\n\r\n🕓 18:00 - 20:00\r\n\r\n📍 Emile Braunplein Gent |\r\n\r\n indien slecht weer: Comic Sans	\N	events/banner_potluck.png	2026-05-13 16:00:00+00	2026-05-13 21:00:00+00	Emile Braunplein, 9000 Gent	t	\N	4
662	Ontgroening: Attacking the Dragon's Lair	Heyhey lieve Schachtjes, \r\n\r\nVoor velen van jullie zit je schachtentijd er bijna op. Maar jullie hebben nog een laatste test om te doorstaan! Terwijl jullie druk in de weer zijn met het verdienen van jullie schachtenpunten is het Doopcomité de ontgroening aan het voorbereiden. Tijdens de aanval op het drakennest kunnen jullie je kennis en vaardigheden als Heimies bewijzen en worden jullie op het einde als mede Commilitones ontvangen.\r\n\r\nDe ontgroening is op 29 april en begint om 18:00 in de Vrolijke Viking en zal tegen 22:30 eindigen onder de Stadshal op de Poeljemarkt. Als je iets later zal aankomen, vroeger weg moet of die dag niet beschikbaar bent maar toch ontgroend wilt worden, vul het in bij de [inschrijvingsform](https://docs.google.com/forms/d/e/1FAIpQLSdMWHp74WJJj0SrebHeC1J19spVLedyg4a9u7obb0bUnKRzGw/viewform?usp=sharing&ouid=115471842509242930094) of stuur me zo snel mogelijk een bericht!\r\n\r\nVergeet zeker niet om jullie lint mee te nemen! Er zullen een hoop buitenactiviteiten gebeuren dus kleed je gepast en neem eventueel water en snacks mee. Probeer de komende weken nog zo veel mogelijk puntjes te verdienen, jullie kunnen ook altijd samenwerken aan opdrachtjes :)\r\n\r\nVeel groetjes van jullie Temmer en het Doopcomité, tot dan!\r\n\r\nTL:DR\r\n\r\n🗓️ 29 april\r\n\r\n🕕 18:00u-22:30u \r\n\r\n📍de Vrolijke Viking | Voskenslaan 67, 9000 Gent\r\n\r\n📎 [Schrijf je hier in!](https://docs.google.com/forms/d/e/1FAIpQLSdMWHp74WJJj0SrebHeC1J19spVLedyg4a9u7obb0bUnKRzGw/viewform?usp=sharing&ouid=115471842509242930094)	\N	events/Banner_ontgroeningn.png	2026-04-29 16:00:00+00	2026-04-29 20:30:00+00	de Vrolijke Viking, Voskenslaan 67, 9000 Gent	f	\N	6
729	Magic: The Gathering	¡Hola Heimies!\r\n\r\nZou je graag Magic: The Gathering willen leren spelen? Of zoek je gewoon nog een excuus om het nog eens te spelen? Vergezel ons dan op dinsdag 5 mei in de Vrolijke Viking!\r\n\r\nAls je het spel (beter) wilt leren spelen, dan ben je welkom vanaf 17:00-23:00 bij de Magic Academy.\r\nVerder is er ook vanaf 20:00-00:00 de Magic Draft: hier mag je zelf een deck samenstellen (en deze achteraf ook houden), om vervolgens 3 rondes tegen andere spelers te spelen. Als je 3 keer wint, dan krijg je zelfs een extra foil promo pack! Win je 2 keer, dan krijg je een extra regular promo pack.\r\n\r\nHopelijk tot dan!\r\n\r\nMagische groetjes\r\nAlejandro\r\n\r\ntl;dr\r\n\r\n🗓️ 5/5/2026\r\n\r\n🕔 17:00-00:00\r\n\r\n📍 De Vrolijke Viking | Voskenslaan 67, 9000 Gent\r\n\r\n🔗 https://forms.gle/9VWvEY1FEr1EGjEHA	\N	events/Banner_MTG.png	2026-05-05 15:00:00+00	2026-05-05 22:00:00+00	Vrolijke Viking (Voskenslaan 67, 9000 Gent)	t	\N	2
731	Bowling	¡Hola Heimies!\r\n\r\nDe laatste activiteiten komen genadeloos dichterbij, en dit geldt ook voor de Sportevents. :(\r\nKom dus af naar het laatste Sportevent van dit jaar, namelijk bowlen!\r\n\r\nOp donderdag 7/5 gaan we om 17:45u naar de O’Learys in Dok Noord, schrijf je dus zeker op tijd in als je er wilt bijzijn!\r\n\r\n**Opgelet!** Om op tijd te kunnen reserveren, **zal de Forms sluiten op 30/4 om 15:00**, wees er dus op tijd bij!\r\n\r\nBowlende groetjes\r\nAlejandro\r\n\r\ntl;dr\r\n\r\n🗓️ 7/5/2026\r\n\r\n🕖 17:45-20:00\r\n\r\n📍 O’Learys | Dok Noord 7/301, 9000 Gent\r\n\r\n💶 €6 voor leden; €8,5 voor niet-leden\r\n\r\n🔗 https://forms.gle/nwGMeWVV95UEi8iU6	\N	events/Banner_Bowling.png	2026-05-07 15:45:00+00	2026-05-07 18:00:00+00	O’Learys (Dok Noord 7/301, 9000 Gent)	t	\N	2
\.


--
-- Data for Name: Backend_eventgenre; Type: TABLE DATA; Schema: public; Owner: jormungandr
--

COPY public."Backend_eventgenre" (id, name, description, logo) FROM stdin;
1	Open vergadering	Een moment wanneer leden input kunnen geven op de werking van de vereniging.	event_type/hayley.png
2	Sport	Sportevents	event_type/5641.jpg
3	Clubavond	Clubavond in de Comic Sans	event_type/ComicSans_1.png
4	Cultuur	Events georganiseerd door onze Cultuur	event_type/Test_download.png
5	Samenwerking met extern	Evenementen georganiseerd door of in samenwerking met externe organisaties	event_type/Schild-Normal-Non-Transparant-removebg-preview.png
6	Schachtentemmer	Events georganiseerd voor de schachten door de schachtentemmer.	event_type/Schild-Normal-Non-Transparant-removebg-preview_s2aLL0B.png
7	Feest & LAN	Events georganiseerd door de Feest & LAN.	event_type/Schild-Normal-Non-Transparant-removebg-preview_PiELfsm.png
8	Lustrum	Evenementen die het Lustrumcomité	event_type/Schild_Normal_Lustrum_5_1.png
35	Verkiezingen	Alles rond het creepy event: De verkiezingen	event_type/220113-G-WC787-004.webp
\.


--
-- Data for Name: Backend_footerpage; Type: TABLE DATA; Schema: public; Owner: jormungandr
--

COPY public."Backend_footerpage" (id, name, url, "order") FROM stdin;
1	Home	https://heimdal.be	0
2	Over ons	https://heimdal.be/overons	1
3	Foto's	https://heimdal.be/albums	2
5	Sponsor worden?	https://heimdal.be/sponsorworden	3
4	Privacy Policy	https://heimdal.be/privacy	3
\.


--
-- Data for Name: Backend_graphnode; Type: TABLE DATA; Schema: public; Owner: jormungandr
--

COPY public."Backend_graphnode" (id, name, photo, display, parent_id) FROM stdin;
\.


--
-- Data for Name: Backend_navsubitem; Type: TABLE DATA; Schema: public; Owner: jormungandr
--

COPY public."Backend_navsubitem" (id, titel, "order", url, parent_id) FROM stdin;
7	Foto's	1	https://heimdal.be/albums	3
5	Statuten	4	https://heimdal.be/statuten	3
4	Clublied	1	https://heimdal.be/clublied	3
2	Werkgroepen	5	https://heimdal.be/werkgroepen	3
1	Boekje	2	https://heimdal.be/boekje	3
\.


--
-- Data for Name: Backend_navtopitem; Type: TABLE DATA; Schema: public; Owner: jormungandr
--

COPY public."Backend_navtopitem" (id, titel, "order", url, role) FROM stdin;
3	Over Ons	1	https://heimdal.be/overons	5
2	Praesidium	2	https://heimdal.be/praesidium	5
1	Evenementen	3	https://heimdal.be/events	5
34	Jaarthema	4	https://heimdal.be/jaarthema/	5
\.


--
-- Data for Name: Backend_photoalbum; Type: TABLE DATA; Schema: public; Owner: jormungandr
--

COPY public."Backend_photoalbum" (id, name, created_at, "order", visible) FROM stdin;
1	Caroussel	2020-12-18 16:20:28+00	999	f
2	Schaatsen 2021	2021-11-20 12:42:55+00	1	t
3	Weekend 2022	2022-04-11 12:39:17+00	3	t
4	Secret Santa 2021	2021-12-23 13:55:15+00	2	t
5	LAN Exeter 2022	2022-04-11 12:56:18+00	4	t
6	Overdracht 2021	2021-09-14 15:00:53+00	0	f
34	Schaatsen 2022	2022-12-01 17:24:41+00	1	t
67	Mariokart 2023	2023-10-09 18:31:48+00	1	t
69	lintophanging Vrolijke Viking	2023-10-05 20:05:39+00	1	t
68	Lintophanging Comic Sans	2023-09-20 19:55:24+00	1	t
70	Karakoe 2023	2023-10-18 20:15:27+00	1	t
223	Nadoop + Sinterklaas 2025	2025-12-03 19:00:00+00	1	t
224	Schaatsen 2025	2025-12-09 19:00:00+00	1	t
71	Weekend 2023	2023-02-18 21:42:23+00	1	t
72	LAN 2023	2023-04-27 21:04:57+00	1	t
74	Stadsspel 2024	2024-10-01 17:02:19+00	1	t
73	SKO en 1ste clubavond 2024	2024-09-25 17:01:43+00	1	t
75	MarioKart Toernooi 2024	2024-10-11 15:28:44+00	0	t
225	Baseball 2025	2025-11-18 19:00:00+00	3	t
76	Karakoe 2024	2024-10-30 13:08:02+00	1	t
77	Tetris Toernooi 2024	2024-11-06 07:41:57+00	1	t
78	Schaatsen 2024	2024-12-07 17:38:46+00	0	t
79	Comfy Secret Santa 2024	2024-12-24 15:04:42+00	1	t
80	Heimdalweekend 2025	2025-02-23 13:54:11+00	1	t
81	Schaaktoernooi 2025	2025-02-24 10:23:42+00	1	t
114	Just Dance Toernooi 2025	2025-03-07 17:34:28+00	1	t
147	Verbroedering 2025 - Nemesis & Wieslandia	2025-04-05 13:40:02+00	1	t
148	LAN 2025 - The neverending LAN	2025-04-10 15:53:12+00	1	t
181	Karakoe pt.2 2025	2025-04-27 12:25:45+00	1	t
182	Ontgroening 2025	2025-04-30 20:49:28+00	1	t
183	Smash Bros Toernooi 2025	2025-04-28 21:08:05+00	1	t
184	Bowling 2025	2025-05-11 09:53:31+00	1	t
185	Ontgroening pt.2 2025	2025-05-11 10:09:10+00	1	t
220	Karakoe I 2025	2025-10-22 18:00:00+00	1	t
219	SKO + Opendeurdag 2025	2025-09-24 10:00:00+00	2	t
218	MarioKart Toernooi 2025	2025-10-06 18:00:00+00	1	t
221	Halloween Clubavond 2025	2025-10-29 19:00:00+00	2	t
222	Studentenverenigingen 101 2025	2025-10-20 18:00:00+00	2	t
\.


--
-- Data for Name: Backend_picture; Type: TABLE DATA; Schema: public; Owner: jormungandr
--

COPY public."Backend_picture" (id, name, description, link, is_carousel_pic, album_id) FROM stdin;
1	groeps foto	groeps foto schaatsten	https://i.imgur.com/fPUeh6L.jpg	t	2
2	groepsfoto 2	groepsfoto 2 schattsen	https://i.imgur.com/b861Os7.jpg	f	2
3	schaatsen 1	schaatsen 1	https://i.imgur.com/xV35MqZ.jpg	f	2
4	Polonaise	Polonaise	https://i.imgur.com/fE67sOE.jpg	f	2
5	POLONAISE!!!	POLONAISE!!!	https://i.imgur.com/Qbx5DJu.jpg	f	2
6	noch meer polonaise	noch meer polonaise	https://i.imgur.com/8zzFVPa.jpg	f	2
7	nick toung	nick toung	https://i.imgur.com/M1KjgEL.jpg	f	2
8	BANANA	BANANA	https://i.imgur.com/YP3fa2F.jpg	f	2
9	schaats schaats	schaats schaats	https://i.imgur.com/uubh7Ya.jpg	f	2
10	openbaar vervoer nick	openbaar vervoer nick	https://i.imgur.com/w3OFOec.jpg	f	2
11	nick vervoer 2	nick vervoer 2	https://i.imgur.com/gcWPFfr.jpg	f	2
12	even more polonaise	even more polonaise	https://i.imgur.com/efKVCfE.jpg	f	2
13	Sander en Hayley being cute AF	Sander en Hayley being cute AF	https://i.imgur.com/JXAykdI.jpg	f	2
14	schaatsen 2	schaatsen 2	https://i.imgur.com/lDKGZkm.jpg	f	2
15	group foto	group foto	https://i.imgur.com/g4TvTY5.jpg	f	2
16	nick and vio cozy	nick and vio cozy	https://i.imgur.com/AzzKeed.jpg	f	4
17	foto buiten	foto buiten	https://i.imgur.com/tRCbczp.jpg	f	4
18	kadootje	kadootje	https://i.imgur.com/4WTjwTS.jpg	f	4
19	cozy outside	cozy outside	https://i.imgur.com/RFPMsDf.jpg	f	4
20	kadootje 2	kadootje 2	https://i.imgur.com/il7cQD7.jpg	f	4
21	heimdal bloempot	heimdal bloempot	https://i.imgur.com/UmupwkY.jpg	f	4
22	kadootje 3	kadootje 3	https://i.imgur.com/45NcEre.jpg	f	4
23	kerstkaatjes	kerstkaatjes	https://i.imgur.com/LXvjxKQ.jpg	f	4
24	eerste avondmaal	eerste avondmaal	https://i.imgur.com/Ox43KzA.jpg	f	3
25	wandel wandel	wandel wandel	https://i.imgur.com/ZBz9uzB.jpg	f	3
26	tijl being tijl	tijl being tijl	https://i.imgur.com/g81omRo.jpg	f	3
27	nelson has alceholstift	nelson has alceholstift	https://i.imgur.com/owUuY7K.jpg	f	3
28	nelson gets head pets	nelson gets head pets	https://i.imgur.com/0Xtttwu.jpg	f	3
29	kaarsten	kaarsten	https://i.imgur.com/0HwzS5t.jpg	f	3
30	kirsten doing the splits	kirsten doing the splits	https://i.imgur.com/vy4iGpy.jpg	f	3
31	stoel peramiede	een peramide van stoellen	https://i.imgur.com/FHsWPa7.jpg	f	3
32	wandel wandel 2	wandel wandel 2	https://i.imgur.com/1gt71GQ.jpg	f	3
33	wandel wandel 3	wandel wandel 3	https://i.imgur.com/pOTU6wO.jpg	f	3
35	op het strand 2	op het strand 2	https://i.imgur.com/qo7wSct.jpg	f	3
36	sexy Andreas	sexy Andreas	https://i.imgur.com/3Fp76yz.jpg	f	3
37	posing	posing	https://i.imgur.com/HZIcX0X.jpg	f	3
38	ogen	oogjes	https://i.imgur.com/VSVDHPN.jpg	f	3
39	vleeshoop	vleeshoop	https://i.imgur.com/wR214SB.jpg	f	3
40	andreas gaming	andreas gaming	https://i.imgur.com/xx8Jmto.jpg	t	5
41	streamende wetvlaming	streamende wetvlaming	https://i.imgur.com/Iy2zm3y.jpg	f	5
42	gaming	gaming	https://i.imgur.com/FP0VfpK.jpg	f	5
43	gaming 2	gaming 2	https://i.imgur.com/gP5LAh7.jpg	f	5
44	boardgaming	boardgaming	https://i.imgur.com/cIqblWq.jpg	f	5
45	rubon	rubon	https://i.imgur.com/jTcEkuM.jpg	f	5
46	ingang	ingang	https://i.imgur.com/rlqzMHD.jpg	f	5
47	anton	anton	https://i.imgur.com/JlOMViM.jpg	f	5
48	gaming 3	gaming 3	https://i.imgur.com/9gXDBi6.jpg	f	5
49	big chess	big chess	https://i.imgur.com/lQw0Wra.jpg	f	5
50	beat saber	beat saber	https://i.imgur.com/mSLSav8.jpg	f	5
51	Tanguy beat saber	Tanguy beat saber	https://i.imgur.com/eBGncdQ.jpg	f	5
52	stream	stream	https://i.imgur.com/HZjqKq7.jpg	f	5
53	Nick	nick gaming	https://i.imgur.com/7yR5skp.jpg	f	5
54	lan crew	lan crew	https://i.imgur.com/dD8Cayc.jpg	f	5
55	ruben playing	ruben playing	https://i.imgur.com/lNeCZ61.jpg	f	5
56	opbouw	opbouw	https://i.imgur.com/bOrluBJ.jpg	f	5
57	opbouw	opbouw	https://i.imgur.com/pPpJA17.jpg	f	5
58	anime tijl	anime tijl	https://i.imgur.com/0nQ8UP7.jpg	f	5
34	op het strand	op het strand	https://i.imgur.com/9r7AIPh.jpg	t	3
90	groepsfoto	groepsfoto	https://i.imgur.com/XTFRJ9q.jpg	t	34
91	banana treijn	banana treijn	https://i.imgur.com/F4ZCCwQ.jpg	f	34
92	more bababa	more bababa	https://i.imgur.com/VVTCUjE.jpg	f	34
93	even mote banana	even mote banana	https://i.imgur.com/uXepKag.jpg	f	34
94	reijn wuk	reijn wuk	https://i.imgur.com/3MOvmpi.jpg	f	34
95	ICT on ice	ICT on ice	https://i.imgur.com/ytxKPPW.jpg	f	34
96	jolien en kirsten	jolien en kirsten	https://i.imgur.com/m4dMEr4.jpg	f	34
97	shpeeeeed	shpeeeeed	https://i.imgur.com/BkgusUR.jpg	f	34
98	sport selfie	sport selfie	https://i.imgur.com/6gxMdAV.jpg	f	34
99	schaats schaats	schaats schaats	https://i.imgur.com/MQYEz9p.jpg	f	34
132	priiizes	priiizes	https://i.imgur.com/bKxpu3O.png?1	f	67
133	WHO IS THE NEW GUY?????	WHO IS THE NEW GUY?????	https://i.imgur.com/OkNLvmO.jpg	f	67
134	Milan opt podium ofwa	Milan opt podium ofwa	https://i.imgur.com/QbODdnD.jpg	f	67
135	Tank takes dos	Tank takes dos	https://i.imgur.com/X9dCusa.jpg	f	67
136	game gang	game gang	https://i.imgur.com/tBPNp9V.jpg	f	67
137	tank and the gang	tank and the gang	https://i.imgur.com/DoCdVGv.jpg	f	67
138	ROOOOOBINNNNN	ROOOOOBINNNNN	https://i.imgur.com/VwJljbX.jpg	f	67
139	groep	groep	https://i.imgur.com/JxcT6UZ.jpg	f	67
140	lintje met nieuw jaar	lintje met nieuw jaar	https://i.imgur.com/35xsxZN.jpg	f	68
141	de sander geeft lint af aan de beste barmannen op aarde	de sander geeft lint af aan de beste barmannen op aarde	https://i.imgur.com/h3ydNGG.jpg	f	68
142	eeeee	eeeee	https://i.imgur.com/ThNXQje.jpg	f	68
143	asfd	dfg	https://i.imgur.com/wjVGs0i.jpg	f	68
144	Niels that smile please have my babys	Niels that smile please have my babys	https://i.imgur.com/uK14T8u.jpg	f	69
145	This man can be my daddy	This man can be my daddy	https://i.imgur.com/UccSdNW.jpg	f	69
146	HEIMDAL IS GEEN DRANK VERENEGING MAAR PINTJE LEKKER	HEIMDAL IS GEEN DRANK VERENEGING MAAR PINTJE LEKKER	https://i.imgur.com/q3rgNsY.jpg	f	69
147	LONG HAIR GAAANG	LONG HAIR GAAANG	https://i.imgur.com/BMSYuNl.jpg	f	69
148	4 op een rij en bram die weer bram is	4 op een rij en bram die weer bram is	https://i.imgur.com/xryh34w.jpg	f	69
149	Meter lint Meter lint	Meter lint Meter lint	https://i.imgur.com/oXmk79I.jpg	f	69
150	Digging a hole	Digging a hole	https://i.imgur.com/NblM5hB.jpg	f	70
151	groep of happy feutjes	groep of happy feutjes	https://i.imgur.com/ySkQ2Uh.jpg	f	70
152	chilling in bothe	chilling in bothe	https://i.imgur.com/0GzdPJR.jpg	f	70
153	Happy singing noises	Happy singing noises	https://i.imgur.com/5PpuNyI.jpg	f	70
154	pozing like bosses	pozing like bosses	https://i.imgur.com/iG3MM7E.jpg	f	70
155	D i d  y ou  k n o w  about the word?	D i d  y ou  k n o w  about the word?	https://i.imgur.com/HKkdBPN.jpg	f	70
156	Happy singing	Happy singing	https://i.imgur.com/rZKPnzP.jpg	f	70
157	BENNY sexy man	BENNY sexy man	https://i.imgur.com/aKKtkt7.jpg	f	70
158	Blije mensen om op karakoe te zijn	Blije mensen om op karakoe te zijn	https://i.imgur.com/GChITVp.jpg	f	70
159	Ik heb geen zin om een alt text te verzinnen voor den deze dus: mensen aan tafel	Ik heb geen zin om een alt text te verzinnen voor den deze dus: mensen aan tafel	https://i.imgur.com/5iG2aVx.jpg	f	70
194	Gaming zoveel	Gaming zoveel	https://i.imgur.com/SyPBWbQ.jpg	f	72
195	U hier	U hier	https://i.imgur.com/g62zw19.jpg	f	72
163	Lukas te groote voor auto	Lukas te groote voor auto	https://i.imgur.com/UwyyzbA.jpg	f	71
164	VUUUUUUUUR	VUUUUUUUUR	https://i.imgur.com/lQL7tIs.jpg	f	71
165	Avond eten me dabbende bram	Avond eten me dabbende bram	https://i.imgur.com/Qj5WfK6.jpg	f	71
166	Wannes in de volvo met hotdogs	Wannes in de volvo met hotdogs	https://i.imgur.com/UvieQEr.jpg	f	71
167	Rein me geit	Rein me geit	https://i.imgur.com/127rMui.jpg	f	71
168	UNIT SEPP	UNIT SEPP	https://i.imgur.com/KkYcZUq.jpg	f	71
169	Milan is slep	Milan is slep	https://i.imgur.com/S0YfDKr.jpg	f	71
170	Eline me geit	Eline me geit	https://i.imgur.com/dvk5vU2.jpg	f	71
171	Reina geit	Reina geit	https://i.imgur.com/gWNn4za.jpg	f	71
172	Benny met peil	Benny met peil	https://i.imgur.com/d0UTlpy.jpg	f	71
173	Benny achter pijl	Benny achter pijl	https://i.imgur.com/Uvj5bLG.jpg	f	71
162	The gang	The gang	https://i.imgur.com/S477dwv.jpg	t	71
174	wolla fire	wolla fire	https://i.imgur.com/3UYI84c.jpg	f	71
175	Tussen stop in de BK obderweg naar huis	Tussen stop in de BK obderweg naar huis	https://i.imgur.com/SEjIm7w.jpg	f	71
177	F1 sim go brrrr	F1 sim go brrrr	https://i.imgur.com/RwnXVxZ.jpg	f	72
178	Playing woman repelant	Playing woman repelant	https://i.imgur.com/W4WrMci.jpg	f	72
179	GAMING GAMING	GAMING GAMING	https://i.imgur.com/29hekJV.jpg	f	72
180	Nonkel jochen	Nonkel jochen	https://i.imgur.com/odk1ywg.jpg	f	72
181	Ons tyra	Ons tyra	https://i.imgur.com/4E6P5QQ.jpg	f	72
182	Squiiiish	Squiiiish	https://i.imgur.com/8iV4z5S.jpg	f	72
183	Squiiiish 2	Squiiiish 2	https://i.imgur.com/ZAAPJcb.jpg	f	72
184	FOCUS	FOCUS	https://i.imgur.com/8r0o0iI.jpg	f	72
185	Jolien enthousisat	Jolien enthousisat	https://i.imgur.com/XpG9YhR.jpg	f	72
186	Ons shild	Ons shild	https://i.imgur.com/w7J23JZ.jpg	f	72
187	Hayley Happy	Hayley Happy	https://i.imgur.com/OVikkge.jpg	f	72
188	Robin FOCUS	Robin FOCUS	https://i.imgur.com/VMNSavK.jpg	f	72
189	Sfeer foto	Sfeer foto	https://i.imgur.com/gDGoAFv.jpg	f	72
190	Febe aant lachen	Febe aant lachen	https://i.imgur.com/C1aTQlp.jpg	f	72
191	Teil laptop master race	Teil laptop master race	https://i.imgur.com/XivjPlh.jpg	f	72
192	Tibo reeee	Tibo reeee	https://i.imgur.com/OCznudI.jpg	f	72
196	Thumbs up	Thumbs up	https://i.imgur.com/WSvOxyD.jpg	f	72
197	Rein met scherm	Rein met scherm	https://i.imgur.com/PLHd29O.jpg	f	72
198	Inkom gang	Inkom gang	https://i.imgur.com/7Y0mAkb.jpg	f	72
199	Gasming 10000	Gasming 10000	https://i.imgur.com/lET8fsS.jpg	f	72
200	Nick hoed	Nick hoed	https://i.imgur.com/qcmougk.jpg	f	72
201	Rocket league	Rocket league	https://i.imgur.com/WcVZ1ky.jpg	f	72
202	Beware of the nerd	Beware of the nerd	https://i.imgur.com/ky6Z5et.jpg	f	72
203	Sepp op achtergrund being wuk	Sepp op achtergrund being wuk	https://i.imgur.com/M0nHuLh.jpg	f	72
204	BRAM ZIJN STOEL BRAM ZIJN STOEL	BRAM ZIJN STOEL BRAM ZIJN STOEL	https://i.imgur.com/5NFpe8X.jpg	f	72
205	Jochen being cute af	Jochen being cute af	https://i.imgur.com/ueT9MnB.jpg	f	72
206	Winnaar winnaar kip avondeten	Winnaar winnaar kip avondeten	https://i.imgur.com/95H9BNy.jpg	f	72
176	AWelcome to LAN 2023	AWelcome to LAN 2023	https://i.imgur.com/30YwE0y.jpg	t	72
207	SKO_nemesisMK	SKO_nemesisMK	https://i.imgur.com/FHNF2Ad.jpg	f	73
208	SKO_MKback	SKO_MKback	https://i.imgur.com/gmWhor7.jpg	f	73
209	SKO_ReinaZagDatHetGoedWas	SKO_ReinaZagDatHetGoedWas	https://i.imgur.com/8cto95C.jpg	f	73
215	SKO_ReinaEnDiedeThumbs	SKO_ReinaEnDiedeThumbs	https://i.imgur.com/YRjE0ou.jpg	f	73
217	SKO_DiedeBewaaktHetStandje	SKO_DiedeBewaaktHetStandje	https://i.imgur.com/QDC7zti.jpg	f	73
220	SKO_DiedeTrots	SKO_DiedeTrots	https://i.imgur.com/iM4Zg6G.jpg	f	73
222	Clubavond_Lintophanging	Clubavond_Lintophanging	https://i.imgur.com/22CwyR9.jpg	f	73
223	Clubavond_Lintophanging_Before	Clubavond_Lintophanging_Before	https://i.imgur.com/58Wz4FP.jpg	f	73
210	SKO_StandjeOverzicht	SKO_StandjeOverzicht	https://i.imgur.com/esq6Mfi.jpg	f	73
211	SKO_MKJongensBack	SKO_MKJongensBack	https://i.imgur.com/VECL7Ow.jpg	f	73
212	SKO_DiedeConfused	SKO_DiedeConfused	https://i.imgur.com/5Rl2m4Y.jpg	f	73
213	SKO_DiedeWave	SKO_DiedeWave	https://i.imgur.com/nO7MbXl.jpg	f	73
214	SKO_MKNogPeople	SKO_MKNogPeople	https://i.imgur.com/vWYb6ZP.jpg	f	73
216	SKO_ReinaAanHetWinnen	SKO_ReinaAanHetWinnen	https://i.imgur.com/ezx7PsX.jpg	f	73
218	SKO_VolStandje	SKO_VolStandje	https://i.imgur.com/KDJ4pwA.jpg	f	73
219	SKO_Nemesis_MK	SKO_Nemesis_MK	https://i.imgur.com/J1UYd3h.jpg	f	73
221	Clubavond_CSVol	Clubavond_CSVol	https://i.imgur.com/PQSH1TX.jpg	f	73
224	Clubavond_Clublied	Clubavond_Clublied	https://i.imgur.com/fXGiMOb.jpg	f	73
225	Clubavond_GamingRoom	Clubavond_GamingRoom	https://i.imgur.com/CXsYEJe.jpg	f	73
226	Clubavond_SeppePool	Clubavond_SeppePool	https://i.imgur.com/n9Cw82X.jpg	f	73
227	Clubavond_SeppePooltNog	Clubavond_SeppePooltNog	https://i.imgur.com/G5r1UnU.jpg	f	73
228	Clubavond_OnsMooiLint	Clubavond_OnsMooiLint	https://i.imgur.com/IgGQQgY.jpg	f	73
229	SuperheroGroep1	SuperheroGroep1	https://i.imgur.com/JNEyBVZ.jpg	f	74
230	SuperheroGroep2	SuperheroGroep2	https://i.imgur.com/x8Vp1H2.jpg	f	74
231	SuperheroGroep3	SuperheroGroep3	https://i.imgur.com/qNvkWw3.jpg	f	74
232	SuperheroGroep4	SuperheroGroep4	https://i.imgur.com/KVpeyce.jpg	f	74
233	GeleAuto_MaxeEnFlorian	GeleAuto_MaxeEnFlorian	https://i.imgur.com/w3XYNWi.jpg	f	74
234	Beeld_Groep1	Beeld_Groep1	https://i.imgur.com/dMyGKjY.jpg	f	74
236	Beeld_Groep2	Beeld_Groep2	https://i.imgur.com/X2dTaM8.jpg	f	74
237	TreeHug	TreeHug	https://i.imgur.com/uuxRizS.jpg	f	74
238	NyoValtAanDenkIk	NyoValtAanDenkIk	https://i.imgur.com/thyuQqA.jpg	f	74
240	Vlaggen_Groep2	Vlaggen_Groep2	https://i.imgur.com/eh8KrdO.jpg	f	74
241	Gravensteen_Groep4	Gravensteen_Groep4	https://i.imgur.com/u1SbpPd.jpg	f	74
242	Gravensteen_Groep2	Gravensteen_Groep2	https://i.imgur.com/ezdRPXp.jpg	f	74
243	Beeld_Groep4	Beeld_Groep4	https://i.imgur.com/GYZqRCh.jpg	f	74
244	Gravensteen_Groep1	Gravensteen_Groep1	https://i.imgur.com/1UMzViM.jpg	f	74
245	Gravensteen_Groep1_Verdedigen	Gravensteen_Groep1_Verdedigen	https://i.imgur.com/EvIeHWp.jpg	f	74
246	Drinkpauze_Groep3	Drinkpauze_Groep3	https://i.imgur.com/DOdMLSW.jpg	f	74
247	VrolijkeVikingen_Groep2	VrolijkeVikingen_Groep2	https://i.imgur.com/tUK646u.jpg	f	74
248	Duif_Groep2	Duif_Groep2	https://i.imgur.com/03MP0Pi.jpg	f	74
249	Groep2LeentEenHond	Groep2LeentEenHond	https://i.imgur.com/p26P6D2.jpg	f	74
250	Piramide_Groep4	Piramide_Groep4	https://i.imgur.com/ujQK7f0.jpg	f	74
251	VrolijkeVikingen_Groep4	VrolijkeVikingen_Groep4	https://i.imgur.com/ZYD2BQM.jpg	f	74
235	Maxe_En_Duif	Maxe_En_Duif	https://i.imgur.com/x5t1N7E.jpg	f	74
239	Lichtspektakel_Groep1	Lichtspektakel_Groep1	https://i.imgur.com/DQHXXLj.jpg	f	74
252	Maxe_ThumbsUp	Maxe_ThumbsUp	https://i.imgur.com/t0vZzSp.jpg	f	75
253	PlayingMK_FromBack	PlayingMK_FromBack	https://i.imgur.com/6f3BXzg.jpg	f	75
254	PlayingMK_VoorScorebord	https://i.imgur.com/K8qzzGO.jpg	https://i.imgur.com/K8qzzGO.jpg	f	75
255	PlayingMK_AanIngang_Voorrondes	PlayingMK_AanIngang_Voorrondes	https://i.imgur.com/jXWPTdu.jpg	f	75
256	Overzicht_ComicSans	Overzicht_ComicSans	https://i.imgur.com/KJaq9tK.jpg	f	75
257	PlayingMK_InGameRoom	PlayingMK_InGameRoom	https://i.imgur.com/KSBfHyY.jpg	f	75
258	PlayingMK_AanIngang_Voorrondes_2	PlayingMK_AanIngang_Voorrondes_2	https://i.imgur.com/7NOMAmR.jpg	f	75
259	Seppe_ThumbsUp	Seppe_ThumbsUp	https://i.imgur.com/uxRKOpL.jpg	f	75
260	PlayingMK_FromBack_Booth2	PlayingMK_FromBack_Booth2	https://i.imgur.com/Ns4n8JV.jpg	f	75
261	PlayingMK_FromBack_Booth3	PlayingMK_FromBack_Booth3	https://i.imgur.com/MenuoPZ.jpg	f	75
262	PlayingMK_RienJoranRuben	PlayingMK_RienJoranRuben	https://i.imgur.com/2DjYKaa.jpg	f	75
263	PlayingMK_ElisabetFromBack	PlayingMK_ElisabetFromBack	https://i.imgur.com/eh7BgKQ.jpg	f	75
264	PlayingMK_InGameRoom_GodWeetWelkeRonde	PlayingMK_InGameRoom_GodWeetWelkeRonde	https://i.imgur.com/TkRvLGe.jpg	f	75
265	PlayingMK_FromBack_NogEens	PlayingMK_FromBack_NogEens	https://i.imgur.com/OS1hPUh.jpg	f	75
266	PlayingMK_InGameRoom_Ingang	PlayingMK_InGameRoom_Ingang	https://i.imgur.com/1pUIFsP.jpg	f	75
267	PlayingMK_InGameRoom_GodWeetWelkeRondeMaarWelDezelfde	PlayingMK_InGameRoom_GodWeetWelkeRondeMaarWelDezelfde	https://i.imgur.com/ZIh7d6f.jpg	f	75
268	PlayingMK_Booth1	PlayingMK_Booth1	https://i.imgur.com/UzaL13p.jpg	f	75
269	PlayingMK_Booth1_HalveFinales	PlayingMK_Booth1_HalveFinales	https://i.imgur.com/heD4lDZ.jpg	f	75
270	PlayingMK_MilanTyraLucasElisabet	PlayingMK_MilanTyraLucasElisabet	https://i.imgur.com/j5L2Du4.jpg	f	75
271	PlayingMK_Booth1_AnderPerspectief	PlayingMK_Booth1_AnderPerspectief	https://i.imgur.com/GqoIbdb.jpg	f	75
272	MKScreens	MKScreens	https://i.imgur.com/ePhOjBC.jpg	f	75
273	PlayingMK_MetEnthousiasteGezichten	PlayingMK_MetEnthousiasteGezichten	https://i.imgur.com/X95q3q2.jpg	f	75
274	PlayingMK_MetEnthousiasteGezichten_EnSeppe	PlayingMK_MetEnthousiasteGezichten_EnSeppe	https://i.imgur.com/2xxJ1YC.jpg	f	75
275	PlayingMK_NogEenAndereBooth	PlayingMK_NogEenAndereBooth	https://i.imgur.com/5uLqnlD.jpg	f	75
276	PlayingMK_InGameRoom_GodWeetWelkeRonde_NogSteedsDezelfde	PlayingMK_InGameRoom_GodWeetWelkeRonde_NogSteedsDezelfde	https://i.imgur.com/0tleKK0.jpg	f	75
277	Prijzen	Prijzen	https://i.imgur.com/Bh07VSb.jpg	f	75
587	Amber_SurprisedVictory	Amber_SurprisedVictory	https://i.imgur.com/SIG3vcP.jpg	f	114
682	LAN - sfeerbeeld3	LAN - sfeerbeeld3	https://i.imgur.com/NHKRi0g.jpg	f	148
278	GameRoom_Kikvors	GameRoom_Kikvors	https://i.imgur.com/fgcQx43.jpg	f	75
279	Overzicht_AchterkantComicSans	Overzicht_AchterkantComicSans	https://i.imgur.com/hK3hwJG.jpg	f	75
282	PlayingMK_HappyBert	PlayingMK_HappyBert	https://i.imgur.com/9n8pcPm.jpg	f	75
284	PlayingMK_FromBack_Ruben	PlayingMK_FromBack_Ruben	https://i.imgur.com/uH27W9B.jpg	f	75
286	PlayingMK_FromBack_Ruben_Afstand	PlayingMK_FromBack_Ruben_Afstand	https://i.imgur.com/w1UcCKd.jpg	f	75
289	2dePlaats	2dePlaats	https://i.imgur.com/Yk8Ve7U.jpg	f	75
280	BrittSeppeBriek_ThumbsUp	BrittSeppeBriek_ThumbsUp	https://i.imgur.com/GmF0fog.jpg	f	75
281	PlayingMK_Finale_Bovenaanzicht	PlayingMK_Finale_Bovenaanzicht	https://i.imgur.com/KgFeDUs.jpg	f	75
283	PlayingMK_MilanTyraLucasElisabet_2	PlayingMK_MilanTyraLucasElisabet_2	https://i.imgur.com/BhsB5M8.jpg	f	75
285	MKScreen	MKScreen	https://i.imgur.com/QjoUhYR.jpg	f	75
287	3dePlaats	3dePlaats	https://i.imgur.com/MQf1rty.jpg	f	75
288	PlayingMK_Finale	PlayingMK_Finale	https://i.imgur.com/8mHV9P5.jpg	f	75
290	1stePlaats	1stePlaats	https://i.imgur.com/aD75IqF.jpg	f	75
291	Rien&Lisa_Zingen	Rien&Lisa_Zingen	https://i.imgur.com/OZ6Be1Z.jpg	f	76
293	Kieron&Rein_Zingen	Kieron&Rein_Zingen	https://i.imgur.com/19Pl0Xh.jpg	f	76
294	Arne&Rien_Zingen	Arne&Rien_Zingen	https://i.imgur.com/vXRBcrN.jpg	f	76
295	Nikki&Rien_Zingen	Nikki&Rien_Zingen	https://i.imgur.com/caDZjUN.jpg	f	76
296	Nikki_Happy	Nikki_Happy	https://i.imgur.com/6Yle7kB.jpg	f	76
297	Benny_Happy	Benny_Happy	https://i.imgur.com/twgAy86.jpg	f	76
298	Nikki&Yoran_Zingen	Nikki&Yoran_Zingen	https://i.imgur.com/Wago9xU.jpg	f	76
299	Seppe_Happy	Seppe_Happy	https://i.imgur.com/5u0k7PI.jpg	f	76
300	Maxe_3Thumbs	Maxe_3Thumbs	https://i.imgur.com/KPUtgvx.jpg	f	76
301	Warre&Maxe_Zingen	Warre&Maxe_Zingen	https://i.imgur.com/KNZ5LqJ.jpg	f	76
302	Tyra_Zingt	Tyra_Zingt	https://i.imgur.com/ObQIB0C.jpg	f	76
303	Warre&Maxe_Zingen_NogEens	Warre&Maxe_Zingen_NogEens	https://i.imgur.com/3TRvEQH.jpg	f	76
304	AllIWantForChristmasIsYOOUUU	AllIWantForChristmasIsYOOUUU	https://i.imgur.com/U2vbWsT.jpg	f	76
305	Olivier_Zingt	Olivier_Zingt	https://i.imgur.com/5Gwdfbh.jpg	f	76
306	Kieron&Rein_Zingen_Zwoel	Kieron&Rein_Zingen_Zwoel	https://i.imgur.com/1yABBVR.jpg	f	76
307	Tyra_Zingt_NogEens	Tyra_Zingt_NogEens	https://i.imgur.com/TtFD4p1.jpg	f	76
308	Nikki&Rien_Zingen_Blij	Nikki&Rien_Zingen_Blij	https://i.imgur.com/KmsIIai.jpg	f	76
310	Bram_Cool	Bram_Cool	https://i.imgur.com/3BJ9YV8.jpg	f	76
311	Sfeerbeeld_Karakoe2024	Sfeerbeeld_Karakoe2024	https://i.imgur.com/77vtLmW.jpg	f	76
312	Rien_Happy	Rien_Happy	https://i.imgur.com/CZ5f8rs.jpg	f	76
313	Seppe&Milan_Unaware	Seppe&Milan_Unaware	https://i.imgur.com/gorSd6d.jpg	f	76
314	DiggyDiggyHole	DiggyDiggyHole	https://i.imgur.com/mWEQUBX.jpg	f	76
316	Vincent&Vriend_Zingen	Vincent&Vriend_Zingen	https://i.imgur.com/dBfR4jJ.jpg	f	76
317	Ritchie_Zingt	Ritchie_Zingt	https://i.imgur.com/5rDJM17.jpg	f	76
318	DiggyDiggyHole_NogEens	DiggyDiggyHole_NogEens	https://i.imgur.com/UyFWk6i.jpg	f	76
319	Warre&Crew_Zingen	Warre&Crew_Zingen	https://i.imgur.com/PRZicFw.jpg	f	76
320	BohemianRhapsodyCrew	BohemianRhapsodyCrew	https://i.imgur.com/OGAabRd.jpg	f	76
321	Oli&Ritchie_Zingen	Oli&Ritchie_Zingen	https://i.imgur.com/76tMME1.jpg	f	76
322	4MensjesZingen	4MensjesZingen	https://i.imgur.com/lXqlCWl.jpg	f	76
323	Diede&Martijn&Rien_Thumbs	Diede&Martijn&Rien_Thumbs	https://i.imgur.com/qxWTZ7j.jpg	f	76
324	Vincent&Vriend_Zingen_NogEens	Vincent&Vriend_Zingen_NogEens	https://i.imgur.com/DdOWkKq.jpg	f	76
325	Brecht&Warre_NaZingen	Brecht&Warre_NaZingen	https://i.imgur.com/PXf0Cui.jpg	f	76
326	Sfeerbeeld_Karakoe2024_MensjesAanTafel	Sfeerbeeld_Karakoe2024_MensjesAanTafel	https://i.imgur.com/SZmdnT5.jpg	f	76
327	Benny&Maxe_Zingen	Benny&Maxe_Zingen	https://i.imgur.com/3UXB6aP.jpg	f	76
328	Benny&Arne_Zingen	Benny&Arne_Zingen	https://i.imgur.com/r2fv4cf.jpg	f	76
329	Lucas&Brecht&Warre_Zingen	Lucas&Brecht&Warre_Zingen	https://i.imgur.com/vClnZi6.jpg	f	76
331	Arne&Rein_Zingen	Arne&Rein_Zingen	https://i.imgur.com/ArYX147.jpg	f	76
330	Brecht&Warre&Florian_Zingen	Brecht&Warre&Florian_Zingen	https://i.imgur.com/tPTEkRJ.jpg	f	76
332	Tetris_Sofia_Back	Tetris_Sofia_Back	https://i.imgur.com/huXMh2o.jpg	f	77
333	Tetris_Sfeerbeeld_Booth	Tetris_Sfeerbeeld_Booth	https://i.imgur.com/0fyhrbY.jpg	f	77
334	Tetris_Nathan &Timon_Finale	Tetris_Nathan &Timon_Finale	https://i.imgur.com/kRrII4S.jpg	f	77
335	Tetris_Milan&Nathan_HalveFinale	Tetris_Milan&Nathan_HalveFinale	https://i.imgur.com/gZrk4AA.jpg	f	77
336	Tetris_Sfeerbeeld1	Tetris_Sfeerbeeld1	https://i.imgur.com/jyJcKB2.jpg	f	77
337	Tetris_Winnaar_Nathan	Tetris_Winnaar_Nathan	https://i.imgur.com/GnNlAnK.jpg	f	77
338	Tetris_2de_Timon	Tetris_2de_Timon	https://i.imgur.com/kUxx28K.jpg	f	77
339	Tetris_3de_Milan	Tetris_3de_Milan	https://i.imgur.com/eWQbyjT.jpg	f	77
340	Tetris_Timon_Back	Tetris_Timon_Back	https://i.imgur.com/oXGboNq.jpg	f	77
341	AanTafel_Met_Nikki&Bram&Simon	AanTafel_Met_Nikki&Bram&Simon	https://i.imgur.com/0lCOhQ3.jpg	f	77
342	Tetris_Finale_GrootScherm	Tetris_Finale_GrootScherm	https://i.imgur.com/TLLlCQq.jpg	f	77
343	Reina_AchterToog	Reina_AchterToog	https://i.imgur.com/J9F1r8c.jpg	f	77
344	Tetris_Sfeerbeeld2	Tetris_Sfeerbeeld2	https://i.imgur.com/sKpNGTt.jpg	f	77
345	Tetris_Milan_Focus	Tetris_Milan_Focus	https://i.imgur.com/RAbgOCl.jpg	f	77
346	Tetris_Milan_Back	Tetris_Milan_Back	https://i.imgur.com/KltxoRv.jpg	f	77
347	Tetris_Britt&AaronLuisterenAandachtig	Tetris_Britt&AaronLuisterenAandachtig	https://i.imgur.com/slEFkcM.jpg	f	77
348	Tetris_Sfeerbeeld3	Tetris_Sfeerbeeld3	https://i.imgur.com/eGRI7u5.jpg	f	77
349	Seppe&Rein_cute	Seppe&Rein_cute	https://i.imgur.com/WoEO7A1.jpg	f	77
586	Maxe_sassyPose2_finale	Maxe_sassyPose2_finale	https://i.imgur.com/tF6YtkY.jpg	f	114
1035	Karakoe I 2025	\N	https://i.imgur.com/YSigPMG.jpg	f	220
1037	Karakoe I 2025	\N	https://i.imgur.com/Z5tgvMY.jpg	f	220
1039	Karakoe I 2025	\N	https://i.imgur.com/5U1iSnn.jpg	f	220
1040	Karakoe I 2025	\N	https://i.imgur.com/or4Zcct.jpg	f	220
350	Tetris_LachendeBritt	Tetris_LachendeBritt	https://i.imgur.com/Mq4hwuM.jpg	f	77
353	Tetris_Nick_Pool	Tetris_Nick_Pool	https://i.imgur.com/VtJcB49.jpg	f	77
354	Tetris_VincentHappy	Tetris_VincentHappy	https://i.imgur.com/kRWDZ0f.jpg	f	77
356	Tetris_Britt&Sofia	Tetris_Britt&Sofia	https://i.imgur.com/aroCkrs.jpg	f	77
360	Tetris_Kirsten&Aaron	Tetris_Kirsten&Aaron	https://i.imgur.com/C0hBdu1.jpg	f	77
361	Tetris_Sfeerbeeld5	Tetris_Sfeerbeeld5	https://i.imgur.com/Lix9uZ1.jpg	f	77
362	Tetris_Seppe&Rein_Pool	Tetris_Seppe&Rein_Pool	https://i.imgur.com/8junN5k.jpg	f	77
364	Tetris_Simon&Bram_Happy_NogEens	Tetris_Simon&Bram_Happy_NogEens	https://i.imgur.com/E9Kjf8F.jpg	f	77
368	Tetris_Jonah_Toog	Tetris_Jonah_Toog	https://i.imgur.com/eMGUCjY.jpg	f	77
369	Tetris_Benny&Maxe	Tetris_Benny&Maxe	https://i.imgur.com/3xSJpRJ.jpg	f	77
371	Tetris_Maxe_Focus_CloseUp	Tetris_Maxe_Focus_CloseUp	https://i.imgur.com/dUG4bMW.jpg	f	77
351	Tetris_Simon&Bram_Happy	Tetris_Simon&Bram_Happy	https://i.imgur.com/WgBQiSP.jpg	f	77
352	Tetris_Kirsten_Back	Tetris_Kirsten_Back	https://i.imgur.com/kT8gD9H.jpg	f	77
355	Tetris_Simon&Bram_GezelligGesprek	Tetris_Simon&Bram_GezelligGesprek	https://i.imgur.com/j5cjcGv.jpg	f	77
357	Tetris_Sfeerbeeld4_MilanThumbsUp	Tetris_Sfeerbeeld4	https://i.imgur.com/cg7AumJ.jpg	f	77
358	Tetris_Britt_Back	Tetris_Britt_Back	https://i.imgur.com/LY1KaDn.jpg	f	77
359	Tetris_Wout&Kirsten	Tetris_Wout&Kirsten	https://i.imgur.com/3IrTKWq.jpg	f	77
363	Tetris_FlorianHappy	Tetris_FlorianHappy	https://i.imgur.com/sh0mSxe.jpg	f	77
365	Tetris_Kirsten&Aaron_2	Tetris_Kirsten&Aaron_2	https://i.imgur.com/URK1CQf.jpg	f	77
366	Tetris_Maxe_Focus	Tetris_Maxe_Focus	https://i.imgur.com/y3ANP0M.jpg	f	77
367	Tetris_Simon&Bram_BramInFocus	Tetris_Simon&Bram_BramInFocus	https://i.imgur.com/pHdRaMf.jpg	f	77
370	Tetris_Benny_OpeensMinderTetrisHaat	Tetris_Benny_OpeensMinderTetrisHaat	https://i.imgur.com/EDvG9wT.jpg	f	77
372	Tetris_Reina_Focus	Tetris_Reina_Focus	https://i.imgur.com/s13CRgm.jpg	f	77
373	Tetris_Timon_Focus	Tetris_Timon_Focus	https://i.imgur.com/YZaaiK8.jpg	f	77
374	Tetris_Sfeerbeeld6	Tetris_Sfeerbeeld6	https://i.imgur.com/Tm6Q8v6.jpg	f	77
375	Tetris_Jonah_Toog_Invite	Tetris_Jonah_Toog_Invite	https://i.imgur.com/M2xJthk.jpg	f	77
376	Tetris_Reina_Happy	Tetris_Reina_Happy	https://i.imgur.com/JHYL3oc.jpg	f	77
377	Tetris_SeppeWeetBeter	Tetris_SeppeWeetBeter	https://i.imgur.com/287txjG.jpg	f	77
378	Tetris_Oli_Happy	Tetris_Oli_Happy	https://i.imgur.com/8HtDCmU.jpg	f	77
379	Tetris_Alexander_Focus	Tetris_Alexander_Focus	https://i.imgur.com/JqO1Te8.jpg	f	77
380	Tetris_Britt_Panic	Tetris_Britt_Panic	https://i.imgur.com/iJvbFU4.jpg	f	77
381	Tetris_Reina&Andres_ReinaFocus	Tetris_Reina&Andres_ReinaFocus	https://i.imgur.com/Jd2OpwV.jpg	f	77
382	Tetris_Scherm	Tetris_Scherm	https://i.imgur.com/nnKsx3x.jpg	f	77
383	Schaatsen 2024 - Groepsfoto	Groepsfoto	https://i.imgur.com/8psMnt4.jpg	f	78
384	Schaatsen 2024 - NyoThumbsup	NyoThumbsup	https://i.imgur.com/rxDAg26.jpg	f	78
385	Schaatsen 2024 - Reverse Heimie	Reverse Heimie	https://i.imgur.com/tRel0zn.jpg	f	78
386	Schaatsen 2024 - BrittSpeed	Wa ne cutie met speed	https://i.imgur.com/kunEN8G.jpg	f	78
387	Schaatsen 2024 - AxelleCloseup	\N	https://i.imgur.com/LqwLmA2.jpg	f	78
388	Schaatsen 2024 - AndreasZen	\N	https://i.imgur.com/JaKEmYx.jpg	f	78
389	Schaatsen 2024 - Sandwich	\N	https://i.imgur.com/PGkG9tD.jpg	f	78
390	Schaatsen 2024 - Banana	\N	https://i.imgur.com/zQkRe7x.jpg	f	78
391	Schaatsen 2024 - ReinaCloseup	\N	https://i.imgur.com/yNdWWTA.jpg	f	78
392	Schaatsen 2024 - KieronSpeed	\N	https://i.imgur.com/8urKhYS.jpg	f	78
393	Schaatsen 2024 - CuteCouple	What a cute couple	https://i.imgur.com/FVt8Xem.jpg	f	78
394	Schaatsen 2024 - BeVeryCarefulEvelien	\N	https://i.imgur.com/3JzOJ8W.jpg	f	78
395	Schaatsen 2024 - BiggestPimpOnTheBlock	\N	https://i.imgur.com/vcB6gkO.jpg	f	78
396	Schaatsen 2024 - TradeNegotiations	\N	https://i.imgur.com/WIKf6qk.jpg	f	78
397	Schaatsen 2024 - ALittleGayIsOkay	\N	https://i.imgur.com/gpmkOPG.jpg	f	78
398	Schaatsen 2024 - JustChillin	\N	https://i.imgur.com/f88kl1A.jpg	f	78
399	Schaatsen 2024 - DidTyraWin?	\N	https://i.imgur.com/weFs8EC.jpg	f	78
400	Schaatsen 2024 - Polonaise	\N	https://i.imgur.com/1UCaQ1y.jpg	f	78
401	Schaatsen 2024 - ReinHubbaHubba	\N	https://i.imgur.com/ODxnZW5.jpg	f	78
402	Schaatsen 2024 - CuteCouple2ElectricBoogaloo	\N	https://i.imgur.com/aCZjjKr.jpg	f	78
403	Schaatsen 2024 - LocalPsychoLocated	\N	https://i.imgur.com/nIM8fwD.jpg	f	78
404	Schaatsen 2024 - SeppeDefaultPose	\N	https://i.imgur.com/oxk69Bv.jpg	f	78
405	Schaatsen 2024 - POVYourCrushFromAcrossTheRoom	\N	https://i.imgur.com/biy4ol6.jpg	f	78
407	Schaatsen 2024 - WhatAHandsomeYoungLad	\N	https://i.imgur.com/s6MG62V.jpg	f	78
408	Schaatsen 2024 - AmberLaugh	\N	https://i.imgur.com/L0YuARR.jpg	f	78
409	Schaatsen 2024 - HeGotSomethingInteresting	\N	https://i.imgur.com/2vQ1PVn.jpg	f	78
406	Schaatsen 2024 - MediaGoesVroem	another cutie	https://i.imgur.com/iyxx1T0.jpg	f	78
410	Schaatsen 2024 - TheNegotiationsWereShort	\N	https://i.imgur.com/cjK4r8y.jpg	f	78
411	Schaatsen 2024 - KirstenLaugh	\N	https://i.imgur.com/iip4CQd.jpg	f	78
412	Schaatsen 2024 - BestOfFriends	\N	https://i.imgur.com/Aa5JsfX.jpg	f	78
413	Schaatsen 2024 - OldButGold	\N	https://i.imgur.com/ENBvAOT.jpg	f	78
414	Schaatsen 2024 - TheLadyInTheRedSkirt	\N	https://i.imgur.com/hMBDe78.jpg	f	78
415	Schaatsen 2024 - MilanDistortsReality	\N	https://i.imgur.com/dUdmazz.jpg	f	78
416	Schaatsen 2024 - ThePokemonJourneyCanBegin	\N	https://i.imgur.com/Rkhhvpn.jpg	f	78
417	Schaatsen 2024 - Banana2	\N	https://i.imgur.com/6TqL2Py.jpg	f	78
418	Schaatsen 2024 - ReinaThumbsUp	\N	https://i.imgur.com/TAprdOY.jpg	f	78
419	Schaatsen 2024 - GreatFriends	\N	https://i.imgur.com/VU7NsZN.jpg	f	78
420	Schaatsen 2024 - Bonding	\N	https://i.imgur.com/LGyYwN3.jpg	f	78
421	Schaatsen 2024 - Polonaise2	\N	https://i.imgur.com/c9WVRRF.jpg	f	78
422	Schaatsen 2024 - TimeSlowingDown	\N	https://i.imgur.com/96uGmwD.jpg	f	78
423	Schaatsen 2024 - AnotherCuteCouple	\N	https://i.imgur.com/2a4Rael.jpg	f	78
424	Schaatsen 2024 - JonahSwag	\N	https://i.imgur.com/NxiH5mh.jpg	f	78
425	Schaatsen 2024 - NyoCloseUp	\N	https://i.imgur.com/dQHuPED.jpg	f	78
426	Schaatsen 2024 - TheMexicanWave	\N	https://i.imgur.com/BeGYF8o.jpg	f	78
428	SESA 2024 - EvelienWithPresent	HappyEvelienWithPresent	https://i.imgur.com/Gbrl3tb.jpg	f	79
429	SESA 2024 - BrittMislukteSelfieQueen	BrittMislukteSelfieQueen	https://i.imgur.com/h5JNMjc.jpg	f	79
430	SESA 2024 - RicardoWithPresent	RicardoWithPresent	https://i.imgur.com/y7dq40W.jpg	f	79
431	SESA 2024 - VincentPandaPresent	VincentPandaPresent	https://i.imgur.com/DzMcgXS.jpg	f	79
432	SESA 2024 - DiedePresentMaxeWow	DiedePresentMaxeWow	https://i.imgur.com/zrOvufk.jpg	f	79
433	SESA 2024 - MaxeWOW	MaxeWOW	https://i.imgur.com/GsBtuLJ.jpg	f	79
434	SESA 2024 - WarreShowingOfPresent	WarreShowingOfPresent	https://i.imgur.com/nYdw6RK.jpg	f	79
435	SESA 2024 - WarreWithPresent	WarreWithPresent	https://i.imgur.com/2YcSJFw.jpg	f	79
436	SESA 2024 - HappyRienYay	HappyRienYay	https://i.imgur.com/mtoPQ0k.jpg	f	79
437	SESA 2024 - MilanStruggledMetCadeau	MilanStruggledMetCadeau	https://i.imgur.com/BUrhUMI.jpg	f	79
438	SESA 2024 - MilanStruggledMetCadeauPart2	MilanStruggledMetCadeauPart2	https://i.imgur.com/3zPpVI1.jpg	f	79
439	SESA 2024 - MaxeWithPresent	MaxeWithPresent	https://i.imgur.com/FJd2OKf.jpg	f	79
440	SESA 2024 - TyraWithPresent	TyraWithPresent	https://i.imgur.com/QRj2Oh3.jpg	f	79
441	SESA 2024 - ElfFlofWithPresent	ElfFlofWithPresent	https://i.imgur.com/PTCQ023.jpg	f	79
442	SESA 2024 - KobeWithPresent	KobeWithPresent	https://i.imgur.com/8vizEEf.jpg	f	79
443	SESA 2024 - KobeWithPresentLOOK	KobeWithPresentLOOK	https://i.imgur.com/cH1KCbK.jpg	f	79
444	SESA 2024 - HappyRienYAAAAY3	HappyRienYAAAAY3	https://i.imgur.com/ym1mVdn.jpg	f	79
445	SESA 2024 - LisaWithDucks	LisaWithDucks	https://i.imgur.com/w1LNuxK.jpg	f	79
446	SESA 2024 - BrittWithUno	BrittWithUno	https://i.imgur.com/hN2AHjr.jpg	f	79
447	SESA 2024 - ValerieWithPlush	ValerieWithPlush	https://i.imgur.com/AgiDCGO.jpg	f	79
448	SESA 2024 - JensWithPresent	JensWithPresent	https://i.imgur.com/gqZsqZK.jpg	f	79
449	SESA - TejasWOOW	TejasWOOW	https://i.imgur.com/i3YI7Hk.jpg	f	79
450	SESA 2024 - AmberCuteWithPresent	AmberCuteWithPresent	https://i.imgur.com/JYiIDDe.jpg	f	79
451	SESA 2024 - AaronMetPlaat	AaronMetPlaat	https://i.imgur.com/zdLCcqN.jpg	f	79
452	SESA 2024 - BennyWithPresent	BennyWithPresent	https://i.imgur.com/zN1qsB3.jpg	f	79
453	SESA 2024 - AlgemeenSfeerbeeld	AlgemeenSfeerbeeldSESA	https://i.imgur.com/ZKg02I8.jpg	f	79
454	SESA 2024 - TarsWithPresent	TarsWithPresent	https://i.imgur.com/heE2vHe.jpg	f	79
455	SESA 2024 - HappyBriekWithPresent	HappyBriekWithPresent	https://i.imgur.com/l54PlT3.jpg	f	79
456	SESA 2024 - BriekShowingPresent	BriekShowingPresent	https://i.imgur.com/lzCS1VA.jpg	f	79
457	SESA 2024 - SeppHappyWithMug	SeppHappyWithMug	https://i.imgur.com/hPTF35D.jpg	f	79
458	SESA 2024 - SeppUnboxing	SeppUnboxing	https://i.imgur.com/gsU0Of2.jpg	f	79
459	SESA 2024 - YoranShowingPresent	YoranShowingPresent	https://i.imgur.com/ucIPCyk.jpg	f	79
460	SESA 2024 - TanguyWithPresent	TanguyWithPresent	https://i.imgur.com/0hDMua0.jpg	f	79
461	Weekend_Groepsfoto_Schild	Weekend_Groepsfoto_Schild	https://i.imgur.com/IKnLngc.jpg	f	80
462	Weekend_Groepsfoto_ZonderSchild	Weekend_Groepsfoto_ZonderSchild	https://i.imgur.com/cU2xjqr.jpg	f	80
490	Daan_BijzonderBalletjeInSoep	Daan_BijzonderBalletjeInSoep	https://i.imgur.com/Sekkyjg.jpg	f	80
489	Lisa_GuitarSolo	Lisa_GuitarSolo	https://i.imgur.com/vt5zMZi.mp4	f	80
488	UpsideDown_Macarena	UpsideDown_Macarena	https://i.imgur.com/kWQ3DU8.mp4	f	80
487	Florian_SlowmoDancing	Florian_SlowmoDancing	https://i.imgur.com/JSRoMg5.mp4	f	80
486	RussianDance_denkIk	RussianDance_denkIk	https://i.imgur.com/uSnlMOU.mp4	f	80
485	Stoelendans	Stoelendans	https://i.imgur.com/6vTjbQj.mp4	f	80
484	Benny_BekertjesOmgooien	Benny_BekertjesOmgooien	https://i.imgur.com/hHR89Vj.mp4	f	80
483	Rien_Disorientated	Rien_Disorientated	https://i.imgur.com/4VDdVIB.mp4	f	80
482	TeleurstellendePijlAfketsing	TeleurstellendePijlAfketsing	https://i.imgur.com/3ZKxlVl.mp4	f	80
481	Tyra_WithBowAndArrow	Tyra_WithBowAndArrow	https://i.imgur.com/R1LhVy7.jpg	f	80
480	KarstenPunishingNyoWithStick	KarstenPunishingNyoWithStick	https://i.imgur.com/W0Nd22b.jpg	f	80
477	Will_NieuweKapsels	Will_NieuweKapsels	https://i.imgur.com/Mype0yl.jpg	f	80
478	DonkeyKong_Challenge	DonkeyKong_Challenge	https://i.imgur.com/LI4Kn82.jpg	f	80
479	Kampvuur	Kampvuur	https://i.imgur.com/M7VwVzd.jpg	f	80
476	HeldhaftigeHelden	HeldhaftigeHelden	https://i.imgur.com/ZSuQ3tP.jpg	f	80
475	Milan_Rein_Monkey	Milan_Rein_Monkey	https://i.imgur.com/zgC8x2T.jpg	f	80
474	Milan_Nyo_Toren	Milan_Nyo_Toren	https://i.imgur.com/Yc8mKWE.jpg	f	80
473	Patatje_Fredje	Patatje_Fredje	https://i.imgur.com/tbPfu3l.jpg	f	80
472	ChairTowerOfGlory	ChairTowerOfGlory	https://i.imgur.com/kGublVh.jpg	f	80
471	Simon_Arrow	Simon_Arrow	https://i.imgur.com/9qvyc5m.jpg	f	80
470	Sacha_En_Karsten_Stick	Sacha_En_Karsten_Stick	https://i.imgur.com/gOCe01e.jpg	f	80
469	MilanMonkey	MilanMonkey	https://i.imgur.com/xFYcoN8.jpg	f	80
468	MaxeWordtOpgeofferd	MaxeWordtOpgeofferd	https://i.imgur.com/Fcg66pM.jpg	f	80
467	Seppe_ThumbsUp_KirstenEnCo	Seppe_ThumbsUp_KirstenEnCo	https://i.imgur.com/JKAz0lF.jpg	f	80
466	HuesAndCuesChaos	HuesAndCuesChaos	https://i.imgur.com/eQiqv55.jpg	f	80
465	Autorit_Diede	Autorit_Diede	https://i.imgur.com/ZbaesDU.jpg	f	80
464	Autorit_Maxe	Autorit_Maxe	https://i.imgur.com/wWikqd5.jpg	f	80
491	Schaakbord_Pionnen	Schaakbord_Pionnen	https://i.imgur.com/JGJpQhO.jpg	f	81
463	Autorit_Brum	Autorit_Brum	https://i.imgur.com/5JnJ48z.jpg	f	80
492	TrofeetjeVoorSchaaktoernooi	TrofeetjeVoorSchaaktoernooi	https://i.imgur.com/CINemxr.jpg	f	81
493	ThumbsUp_SeppeMetPetekindjes	ThumbsUp_SeppeMetPetekindjes	https://i.imgur.com/rsZ5hz4.jpg	f	81
494	Simon_AcceptingDefeat	Simon_AcceptingDefeat	https://i.imgur.com/KBQxmSy.jpg	f	81
496	2dePlaats_Wout_Schaaktoernooi	2dePlaats_Wout_Schaaktoernooi	https://i.imgur.com/rdpmKhX.jpg	f	81
498	ThumbsUp_SeppeMetPetekindjes_Smile	ThumbsUp_SeppeMetPetekindjes_Smile	https://i.imgur.com/YKPSnHz.jpg	f	81
500	FinaleSchaaktoernooi_SeppeRooting	FinaleSchaaktoernooi_SeppeRooting	https://i.imgur.com/gfSSf7F.jpg	f	81
495	Winnaar_Tanguy_Schaaktoernooi	Winnaar_Tanguy_Schaaktoernooi	https://i.imgur.com/r8w0XGr.jpg	f	81
497	3dePlaats_Marwan_Schaaktoernooi	3dePlaats_Marwan_Schaaktoernooi	https://i.imgur.com/CM1ANuc.jpg	f	81
499	Axelle_ThumbsUp	Axelle_ThumbsUp	https://i.imgur.com/AgGViU9.jpg	f	81
501	Schaak_YoranFocus_MilanSatisfied	Schaak_YoranFocus_MilanSatisfied	https://i.imgur.com/bv6QRAP.jpg	f	81
502	Finale_TanguyFocus	Finale_TanguyFocus	https://i.imgur.com/RW4APlZ.jpg	f	81
503	FinaleEinde_Wout_vs_Tanguy	FinaleEinde_Wout_vs_Tanguy	https://i.imgur.com/CMi8n9c.jpg	f	81
504	Schaaktoernooi_Seppe_ThumbsUp	Schaaktoernooi_Seppe_ThumbsUp	https://i.imgur.com/MsJMv0Q.jpg	f	81
505	Schaakbord_Pionnen_2	Schaakbord_Pionnen_2	https://i.imgur.com/VURbQGJ.jpg	f	81
506	Tanguy_Focus_Finale	Tanguy_Focus_Finale	https://i.imgur.com/yWes993.jpg	f	81
507	Milan_Focus	Milan_Focus	https://i.imgur.com/Ya4oTJR.jpg	f	81
508	Wout_Explaining_Chess	Wout_Explaining_Chess	https://i.imgur.com/usA5sOY.jpg	f	81
509	Simon_Sad	Simon_Sad	https://i.imgur.com/Tn2rolA.jpg	f	81
510	Simon_HappilyAcceptingDefeat	Simon_HappilyAcceptingDefeat	https://i.imgur.com/GQUIXd4.jpg	f	81
511	Tanguy_Focus	Tanguy_Focus	https://i.imgur.com/0w7KLVW.jpg	f	81
512	Marwan_En_Tanguy_Focus	Marwan_En_Tanguy_Focus	https://i.imgur.com/E93yyl5.jpg	f	81
513	Simon_EnjoyingChess	Simon_EnjoyingChess	https://i.imgur.com/c7KUmaY.jpg	f	81
514	Yoran_ThumbsUp_WinningChess	Yoran_ThumbsUp_WinningChess	https://i.imgur.com/OuJHNxz.jpg	f	81
515	Ruben_Focus	Ruben_Focus	https://i.imgur.com/QqD0Mp5.jpg	f	81
516	Yoran_Focus	Yoran_Focus	https://i.imgur.com/WT6iNrE.jpg	f	81
517	Sander_HappyChess	Sander_HappyChess	https://i.imgur.com/nBo4HW8.jpg	f	81
518	MilanTryingToDefeatWout	MilanTryingToDefeatWout	https://i.imgur.com/Ee9nZ7E.jpg	f	81
541	Dancing_Axelle&Kirsten	Dancing_Axelle&Kirsten	https://i.imgur.com/SdhhCQs.jpg	f	114
542	Dancing_Diede&Tyra&Axelle	Dancing_Diede&Tyra&Axelle	https://i.imgur.com/0dWqBtr.jpg	f	114
543	WOW_DansendeSeppe	WOW_DansendeSeppe	https://i.imgur.com/FAiUk0f.jpg	f	114
544	Dancing_Axelle&Kirsten_2	Dancing_Axelle&Kirsten_2	https://i.imgur.com/jKp3yna.jpg	f	114
545	Dancing_Rasputin_Tyra&Maxe	Dancing_Rasputin_Tyra&Maxe	https://i.imgur.com/rbLKHvg.jpg	f	114
546	Dancing_Diede&Tyra	Dancing_Diede&Tyra	https://i.imgur.com/Q9ElpVv.jpg	f	114
547	Sfeerbeeld_JustDance2025	Sfeerbeeld_JustDance2025	https://i.imgur.com/rjbi3nB.jpg	f	114
548	Sfeerbeeld_JustDance2025_RienHappy	Sfeerbeeld_JustDance2025_RienHappy	https://i.imgur.com/29r15XO.jpg	f	114
549	Reina_AchterToog_Hat	Reina_AchterToog_Hat	https://i.imgur.com/tJn9dkX.jpg	f	114
550	Hayley_posing	Hayley_posing	https://i.imgur.com/Gn8EyrT.jpg	f	114
551	Maxe_Cheers	Maxe_Cheers	https://i.imgur.com/O1t0NTt.jpg	f	114
552	Chillguy_Nick&Tyra	Chillguy_Nick&Tyra	https://i.imgur.com/afKtair.jpg	f	114
553	Simon_Cheers	Simon_Cheers	https://i.imgur.com/BaqaTvN.jpg	f	114
554	Simon_Happy	Simon_Happy	https://i.imgur.com/NPJfbUY.jpg	f	114
555	Axelle&Flof_AanBar	Axelle&Flof_AanBar	https://i.imgur.com/m8kLz5z.jpg	f	114
556	Sfeerbeeld_JustDance2025_RasputinBG	Sfeerbeeld_JustDance2025_RasputinBG	https://i.imgur.com/wT8WfyL.jpg	f	114
557	Sfeerbeeld_JustDance2025_RasputinBG_2	Sfeerbeeld_JustDance2025_RasputinBG_2	https://i.imgur.com/rEoWbzR.jpg	f	114
558	Rasputin_Maxe_Ruben_2	Rasputin_Maxe_Ruben_2	https://i.imgur.com/f5ZW1UQ.jpg	f	114
559	Rien_Headband	Rien_Headband	https://i.imgur.com/cDW3YlP.jpg	f	114
560	Sfeerbeeld_JustDance2025_bar	Sfeerbeeld_JustDance2025_bar	https://i.imgur.com/jDJ7QXI.jpg	f	114
561	Dancing_Axelle	Dancing_Axelle	https://i.imgur.com/nndsigS.jpg	f	114
562	SeppeWOW	SeppeWOW	https://i.imgur.com/lW7Uew2.jpg	f	114
563	RobocopMaxe	RobocopMaxe	https://i.imgur.com/3IG3GRW.jpg	f	114
564	Axelle&Flof_AanBar_OtherPerspective	Axelle&Flof_AanBar_OtherPerspective	https://i.imgur.com/BfOy5cc.jpg	f	114
565	BennyWhateverThisPoseIs	BennyWhateverThisPoseIs	https://i.imgur.com/NYzAIk0.jpg	f	114
566	Seppe_CorrectingGlasses	Seppe_CorrectingGlasses	https://i.imgur.com/wsQ5CBS.jpg	f	114
567	JustDanceScreen	JustDanceScreen	https://i.imgur.com/mMFLfGu.jpg	f	114
568	Seppe_Explaining	Seppe_Explaining	https://i.imgur.com/MlpWFhw.jpg	f	114
569	JustDanceScreen_vogue	JustDanceScreen_vogue	https://i.imgur.com/0uEVFI4.jpg	f	114
570	1OfAnderZombieLied	1OfAnderZombieLied	https://i.imgur.com/42igLKv.jpg	f	114
571	Boodschappenlied	Boodschappenlied	https://i.imgur.com/N931ujY.jpg	f	114
572	Daan_BeingCreepy	Daan_BeingCreepy	https://i.imgur.com/bpm6xFy.jpg	f	114
573	Winnaar_Maxe_JDT	Winnaar_Maxe_JDT	https://i.imgur.com/pyLirJk.jpg	f	114
574	Winnaar_Maxe_JDT_2	Winnaar_Maxe_JDT_2	https://i.imgur.com/gU1dSA6.jpg	f	114
575	Amber_2nd_JDT	Amber_2nd_JDT	https://i.imgur.com/uVIY2Ai.jpg	f	114
576	Axelle_3rd_JDT_BooSeppe	Axelle_3rd_JDT_BooSeppe	https://i.imgur.com/p8AfGzI.jpg	f	114
577	Amber_2nd_JDT_2	Amber_2nd_JDT_2	https://i.imgur.com/5MUKc6R.jpg	f	114
578	Winnaar_Maxe_JDT_peeking	Winnaar_Maxe_JDT_peeking	https://i.imgur.com/YeQvQYO.jpg	f	114
579	Axelle_3rd_JDT	Axelle_3rd_JDT	https://i.imgur.com/C1IjwBZ.jpg	f	114
580	Albatraoz_RubenYay	Albatraoz_RubenYay	https://i.imgur.com/xeOOXWw.jpg	f	114
581	EveryoneDancing	EveryoneDancing	https://i.imgur.com/MR8euvZ.jpg	f	114
582	Albatraoz_Pros	Albatraoz_Pros	https://i.imgur.com/mivxue8.jpg	f	114
583	Maxe_chachaslide	Maxe_chachaslide	https://i.imgur.com/9TpEmbd.jpg	f	114
584	Maxe_sassyPose	Maxe_sassyPose	https://i.imgur.com/3dygtGG.jpg	f	114
683	LAN - Zeaya	LAN - Zeaya	https://i.imgur.com/CqbwQJW.jpg	f	148
1036	Karakoe I 2025	\N	https://i.imgur.com/A9HsovB.jpg	f	220
588	GameRoom_Dansers	GameRoom_Dansers	https://i.imgur.com/7ryh0LN.jpg	f	114
589	CatDance	CatDance	https://i.imgur.com/ShjxG2v.jpg	f	114
591	SImonMaxeTyraFebe_ReadyToDance	SImonMaxeTyraFebe_ReadyToDance	https://i.imgur.com/kc9unDQ.jpg	f	114
597	Dancing_DiedeTyraAxelleKirsten	Dancing_DiedeTyraAxelleKirsten	https://i.imgur.com/vdBPELz.jpg	f	114
598	HalveFinale_TyraAxelleAmber	HalveFinale_TyraAxelleAmber	https://i.imgur.com/wAjHpxa.jpg	f	114
599	GameRoom_Dansers_beforeDancing	GameRoom_Dansers_beforeDancing	https://i.imgur.com/RPdsPRB.jpg	f	114
590	VerliefdeDansendeHeimies	VerliefdeDansendeHeimies	https://i.imgur.com/tol5xZf.jpg	f	114
592	AfterCompetitionDancing_MaxeAxelle_Amber	AfterCompetitionDancing_MaxeAxelle_Amber	https://i.imgur.com/djcE2ie.jpg	f	114
593	JustDanceScreen2	JustDanceScreen2	https://i.imgur.com/1C6X8Ta.jpg	f	114
594	HalveFinale_TyraAxelleMaxe	HalveFinale_TyraAxelleMaxe	https://i.imgur.com/n7SBJ8X.jpg	f	114
595	AmberMaxe_ReadyForFinal	AmberMaxe_ReadyForFinal	https://i.imgur.com/EORSwxw.jpg	f	114
596	RasputinJumping	RasputinJumping	https://i.imgur.com/I0T2VzB.jpg	f	114
600	HalveFinale_Before	HalveFinale_Before	https://i.imgur.com/kFIv44s.jpg	f	114
601	SImonMaxeTyra_ReadyToDance	SImonMaxeTyra_ReadyToDance	https://i.imgur.com/M1NO7Qu.jpg	f	114
602	RasputinJumping2	RasputinJumping2	https://i.imgur.com/00oWTdl.jpg	f	114
603	JustDanceEnthousiastSeppe	JustDanceEnthousiastSeppe	https://i.imgur.com/E2HFDQD.jpg	f	114
604	Albatraoz_AxelleAmber	Albatraoz_AxelleAmber	https://i.imgur.com/VbZiNIO.jpg	f	114
605	GameRoom_Dansers_Dancing	GameRoom_Dansers_Dancing	https://i.imgur.com/MuWksBX.jpg	f	114
606	Dancing_RubenMarwanElineTyra	Dancing_RubenMarwanElineTyra	https://i.imgur.com/JJlBntx.jpg	f	114
607	GameRoom_Dansers_Hands	GameRoom_Dansers_Hands	https://i.imgur.com/JC1M6Kv.jpg	f	114
608	EveryoneDancingRaisingHand	EveryoneDancingRaisingHand	https://i.imgur.com/z0ns9oo.jpg	f	114
609	Dancing_Axelle&Kirsten2	Dancing_Axelle&Kirsten2	https://i.imgur.com/f1gygFQ.jpg	f	114
610	Rasputin_TyraMaxeAxelle_Flying	Rasputin_TyraMaxeAxelle_Flying	https://i.imgur.com/a7dsdpw.jpg	f	114
540	Rasputin_Maxe_Ruben	Rasputin_Maxe_Ruben	https://i.imgur.com/buld24P.jpg	f	114
632	JackboxTafel_1	JackboxTafel_1	https://i.imgur.com/twgvW3u.jpg	f	147
633	MarioKartTafel_1	MarioKartTafel_1	https://i.imgur.com/D8efxjS.jpg	f	147
634	JackboxTafel_2	JackboxTafel_2	https://i.imgur.com/hv987Nb.jpg	f	147
635	WiesTafel_1	WiesTafel_1	https://i.imgur.com/Sb2ZP2y.jpg	f	147
636	BoardgameTafel_1	BoardgameTafel_1	https://i.imgur.com/pPedYoz.jpg	f	147
637	WiesTafel_2	WiesTafel_2	https://i.imgur.com/IhNpn6I.jpg	f	147
638	WiesTafel_2_SeppeUnsure	WiesTafel_2_SeppeUnsure	https://i.imgur.com/Kuf3d3F.jpg	f	147
639	WiiSportMastery	WiiSportMastery	https://i.imgur.com/PoXq7Ra.jpg	f	147
640	WiezenIsFun	WiezenIsFun	https://i.imgur.com/FY8Azbw.jpg	f	147
641	SoloSlim_Achievement	SoloSlim_Moment	https://i.imgur.com/WjpWhY9.jpg	f	147
642	BoardgameTafel_2	BoardgameTafel_2	https://i.imgur.com/dbScDXH.jpg	f	147
643	MarioKartTafel_2	MarioKartTafel_2	https://i.imgur.com/KFveOr8.jpg	f	147
644	WiiSportMastery_2	WiiSportMastery_2	https://i.imgur.com/5HeqNuh.jpg	f	147
645	BoardgameTafel_3	BoardgameTafel_3	https://i.imgur.com/xW6TpND.jpg	f	147
646	BoardgameTafel_4	BoardgameTafel_4	https://i.imgur.com/VTSmKHQ.jpg	f	147
647	BoardgameTafel_5	BoardgameTafel_5	https://i.imgur.com/aSgEz2D.jpg	f	147
648	WiiSportMastery_3	WiiSportMastery_3	https://i.imgur.com/AzNIObQ.jpg	f	147
649	JackboxTafel_3	JackboxTafel_3	https://i.imgur.com/zxxOkRm.jpg	f	147
650	Seppe_ReadyForVerbroedering	Seppe_ReadyForVerbroedering	https://i.imgur.com/tDfRQWO.jpg	f	147
651	BoardgameTafel_6	BoardgameTafel_6	https://i.imgur.com/JTGvDk1.jpg	f	147
652	WiesTafel_3	WiesTafel_3	https://i.imgur.com/Si0DXSr.jpg	f	147
653	LAN - sfeerbeeld1	LAN - sfeerbeeld1	https://i.imgur.com/QiDWsh0.jpg	f	148
654	LAN - campfire	LAN - campfire	https://i.imgur.com/J8JTRKp.jpg	f	148
655	LAN - overShoulderFlof	LAN - overShoulderFlof	https://i.imgur.com/PEbRwhN.jpg	f	148
656	LAN - Seppe&Marwan	LAN - Seppe&Marwan	https://i.imgur.com/HWQUswn.jpg	f	148
657	LAN - friendshipIsKey	LAN - friendshipIsKey	https://i.imgur.com/ZFaHsWk.jpg	f	148
658	LAN - MK	LAN - MK	https://i.imgur.com/iVyy1US.jpg	f	148
659	LAN - MK2	LAN - MK2	https://i.imgur.com/tuzVL15.jpg	f	148
660	LAN - eurotruck	LAN - eurotruck	https://i.imgur.com/niKxwYT.jpg	f	148
661	LAN - Ruben&Daan	LAN - Ruben&Daan	https://i.imgur.com/J9wAlqt.jpg	f	148
662	LAN - overShoulderEuroTruck	LAN - overShoulderEuroTruck	https://i.imgur.com/tovTZ8g.jpg	f	148
663	LAN - MK3	LAN - MK3	https://i.imgur.com/QOV72S4.jpg	f	148
664	LAN - SachaMuismat	LAN - SachaMuismat	https://i.imgur.com/XnI1tSG.jpg	f	148
665	LAN - Lucas&Sepp	LAN - Lucas&Sepp	https://i.imgur.com/yJQErTy.jpg	f	148
666	LAN - ThumbsUp - YoranSeppeMaxe	LAN - ThumbsUp - YoranSeppeMaxe	https://i.imgur.com/szYlOq7.jpg	f	148
667	LAN - crew	LAN - crew	https://i.imgur.com/eObYuld.jpg	f	148
668	LAN - sfeerbeeld2	LAN - sfeerbeeld2	https://i.imgur.com/YDAI2Id.jpg	f	148
669	LAN - BSL	LAN - BSL	https://i.imgur.com/fsxwwqn.jpg	f	148
670	LAN - ThumbsUpSeppe	LAN - ThumbsUpSeppe	https://i.imgur.com/RPolo2U.jpg	f	148
671	LAN - Alejandro&Vincent	LAN - Alejandro&Vincent	https://i.imgur.com/p2a9usZ.jpg	f	148
672	LAN - Monster	LAN - Monster	https://i.imgur.com/9IKAVem.jpg	f	148
673	LAN - MonsterAddiction	LAN - MonsterAddiction	https://i.imgur.com/6qBkyFO.jpg	f	148
674	LAN - Monster2	LAN - Monster2	https://i.imgur.com/qOMEaL3.jpg	f	148
675	LAN - eurotruck2	LAN - eurotruck2	https://i.imgur.com/GuUCOmG.jpg	f	148
676	LAN - SachaMonster	LAN - SachaMonster	https://i.imgur.com/ujcqnMW.jpg	f	148
677	LAN - trofeeFallguy	LAN - trofeeFallguy	https://i.imgur.com/qDk8vaD.jpg	f	148
678	LAN - TanguyHappy	LAN - TanguyHappy	https://i.imgur.com/QK1cgoS.jpg	f	148
679	LAN - NyoHappy	LAN - NyoHappy	https://i.imgur.com/EVLWtnv.jpg	f	148
680	LAN - Setup	LAN - Setup	https://i.imgur.com/D0BEdri.jpg	f	148
681	LAN - Monster3	LAN - Monster3	https://i.imgur.com/7TrnSWt.jpg	f	148
684	LAN - cozyMK	LAN - cozyMK	https://i.imgur.com/Bl7lMwW.jpg	f	148
685	LAN - WinnaarsLOL	LAN - WinnaarsLOL	https://i.imgur.com/5YOIQL1.jpg	f	148
687	LAN - StoerPoserendeRuben	LAN - StoerPoserendeRuben	https://i.imgur.com/FKpDBkW.jpg	f	148
688	LAN - DaanFocus	LAN - DaanFocus	https://i.imgur.com/pEHh0vr.jpg	f	148
691	LAN - WinnaarsRocketLeague	LAN - WinnaarsRocketLeague	https://i.imgur.com/BT4YBRA.jpg	f	148
693	LAN - NickOnFloor	LAN - NickOnFloor	https://i.imgur.com/0XTVOpZ.jpg	f	148
694	LAN - WarreFocus	LAN - WarreFocus	https://i.imgur.com/EeasAdq.jpg	f	148
695	LAN - LoLtrophies	LAN - LoLtrophies	https://i.imgur.com/lxiuKzZ.jpg	f	148
696	LAN - WinnaarsMarioKart	LAN - WinnaarsMarioKart	https://i.imgur.com/5CZthwx.jpg	f	148
686	LAN - WinnaarsLOL2	LAN - WinnaarsLOL2	https://i.imgur.com/0B4VqYt.jpg	f	148
689	LAN - MilanFallguys	LAN - MilanFallguys	https://i.imgur.com/c9H3VIj.jpg	f	148
690	LAN - RocketLeague1	LAN - RocketLeague1	https://i.imgur.com/h04P76c.jpg	f	148
692	LAN - inkomEnthousiasme	LAN - inkomEnthousiasme	https://i.imgur.com/RZMDFOT.jpg	f	148
697	LAN - WinnaarsMK - Milan	LAN - WinnaarsMK - Milan	https://i.imgur.com/1PaCUUA.jpg	f	148
698	LAN - WinnaarsMKWithBoo	LAN - WinnaarsMKWithBoo	https://i.imgur.com/vRoL2PR.jpg	f	148
699	LAN - VRSfeer	LAN - VRSfeer	https://i.imgur.com/Utas9AS.jpg	f	148
700	LAN - DuolingoGoals	LAN - DuolingoGoals	https://i.imgur.com/Cb9n1t9.jpg	f	148
701	LAN - beanbags	LAN - beanbags	https://i.imgur.com/n3nMLoM.jpg	f	148
702	LAN - WinnaarsFG - Tanguy	LAN - WinnaarsFG - Tanguy	https://i.imgur.com/6PpsuHl.jpg	f	148
703	LAN - WinnaarsFGWithBooks	LAN - WinnaarsFGWithBooks	https://i.imgur.com/DlGAsCM.jpg	f	148
704	LAN - WinnaarsFG	LAN - WinnaarsFG	https://i.imgur.com/0IvF6b0.jpg	f	148
705	LAN - eurotruck3	LAN - eurotruck3	https://i.imgur.com/FbDWclb.jpg	f	148
706	LAN - WinnaarsFG - Arno	LAN - WinnaarsFG - Arno	https://i.imgur.com/Ao9HhmX.jpg	f	148
707	LAN - Sacha&Bram	LAN - Sacha&Bram	https://i.imgur.com/lNcfxPM.jpg	f	148
708	LAN - eurotruckAndreas	LAN - eurotruckAndreas	https://i.imgur.com/Ehs5lDs.jpg	f	148
709	LAN - HeadMassageJermin	LAN - HeadMassageJermin	https://i.imgur.com/Q11eMit.jpg	f	148
710	LAN - MK4	LAN - MK4	https://i.imgur.com/bZV3HbZ.jpg	f	148
711	LAN - VRSfeer2	LAN - VRSfeer2	https://i.imgur.com/mj1r2tn.jpg	f	148
712	LAN - sfeerbeeld4	LAN - sfeerbeeld4	https://i.imgur.com/OEelwBh.jpg	f	148
713	LAN - MK5	LAN - MK5	https://i.imgur.com/yVJpfnP.jpg	f	148
714	LAN - sfeerbeeld5	LAN - sfeerbeeld5	https://i.imgur.com/YnRQDUm.jpg	f	148
715	LAN - sfeerbeeld6	LAN - sfeerbeeld6	https://i.imgur.com/ZVGHpvt.jpg	f	148
716	LAN - sfeerbeeld7	LAN - sfeerbeeld7	https://i.imgur.com/8UzpdWX.jpg	f	148
717	LAN - sfeerbeeld7	LAN - sfeerbeeld7	https://i.imgur.com/utAyJdi.jpg	f	148
718	LAN - WinnaarsMKWithBullet	LAN - WinnaarsMKWithBullet	https://i.imgur.com/YuFaXEp.jpg	f	148
719	LAN - BSL2	LAN - BSL2	https://i.imgur.com/3SnwLqD.jpg	f	148
720	LAN - TanguySatisfied	LAN - TanguySatisfied	https://i.imgur.com/7w7fzYw.jpg	f	148
721	LAN - DaanShowingSetup	LAN - DaanShowingSetup	https://i.imgur.com/GCveuqX.jpg	f	148
722	LAN - TanguyInnerPiranhaPlant	LAN - TanguyInnerPiranhaPlant	https://i.imgur.com/2FLoj1V.jpg	f	148
723	LAN - WinnaarsMKWithBoo2	LAN - WinnaarsMKWithBoo2	https://i.imgur.com/j7xIdpK.jpg	f	148
724	LAN - WinnaarsMK - Nathan	LAN - WinnaarsMK - Nathan	https://i.imgur.com/5Y6RRak.jpg	f	148
751	SingingForLife	SingingForLife	https://i.imgur.com/jSm5GNE.jpg	f	181
752	Sfeerbeeld_KarakoePt2	Sfeerbeeld_KarakoePt2	https://i.imgur.com/rPAt6ex.jpg	f	181
753	SingingForLife_2	SingingForLife_2	https://i.imgur.com/jyu17OY.jpg	f	181
754	Tyra_EnjoyingKarakoe	Tyra_EnjoyingKarakoe	https://i.imgur.com/noIccKj.jpg	f	181
755	Rein_IdkWat	Rein_IdkWat	https://i.imgur.com/6hhguSt.jpg	f	181
756	Tyra_Zingt_Silhouette	Tyra_Zingt_Silhouette	https://i.imgur.com/lzItuBy.jpg	f	181
757	ReinEnBennyLove	ReinEnBennyLove	https://i.imgur.com/lBO33Rh.jpg	f	181
758	Sfeerbeeld_KarakoePt2_YayZingen	Sfeerbeeld_KarakoePt2_YayZingen	https://i.imgur.com/U1RXcNm.jpg	f	181
759	Vincent_Zingend	Vincent_Zingend	https://i.imgur.com/zKLIOPV.jpg	f	181
760	Vincent_Zingend2	Vincent_Zingend2	https://i.imgur.com/GEa3wgc.jpg	f	181
761	Nikki&Marwan_Karakoe	Nikki&Marwan_Karakoe	https://i.imgur.com/80coPlD.jpg	f	181
762	Maxe&Milan_Karakoe	Maxe&Milan_Karakoe	https://i.imgur.com/mOYsloy.jpg	f	181
763	Silke_GivingItAll	Silke_GivingItAll	https://i.imgur.com/zfeFGDz.jpg	f	181
764	RubenStrikingAPose	RubenStrikingAPose	https://i.imgur.com/ORvI2Yt.jpg	f	181
765	Maxe&Marwan_Karakoe	Maxe&Marwan_Karakoe	https://i.imgur.com/A77sDwC.jpg	f	181
766	NemesisVriendjes_Zingen	NemesisVriendjes_Zingen	https://i.imgur.com/yh3l6IB.jpg	f	181
767	Sfeerbeeld_KarakoePt2_2	Sfeerbeeld_KarakoePt2_2	https://i.imgur.com/hezU4zD.jpg	f	181
768	Tyra_Zingt_NogEens_NogEens	Tyra_Zingt_NogEens_NogEens	https://i.imgur.com/znZNzhe.jpg	f	181
769	Sfeerbeeld_KarakoePt2_3	Sfeerbeeld_KarakoePt2_3	https://i.imgur.com/hsfcqjB.jpg	f	181
770	Schachtenopdrachtje_Tape	Schachtenopdrachtje_Tape	https://i.imgur.com/5Ipolgo.jpg	f	181
771	Sfeerbeeld_KarakoePt2_4	Sfeerbeeld_KarakoePt2_4	https://i.imgur.com/Qo70ZqN.jpg	f	181
772	Karakoe_Banner_Screen	Karakoe_Banner_Screen	https://i.imgur.com/vEHIMfu.jpg	f	181
773	Sfeerbeeld_KarakoePt2_5	Sfeerbeeld_KarakoePt2_5	https://i.imgur.com/p8xtlae.jpg	f	181
774	Arno&Lisa&Rien_Zingen	Arno&Lisa&Rien_Zingen	https://i.imgur.com/aqqYW2e.jpg	f	181
775	Arno&Lisa&Rien_Zingen_2	Arno&Lisa&Rien_Zingen_2	https://i.imgur.com/BVXTWzX.jpg	f	181
776	Nikki_Schachtenopdrachtje_Tape	Nikki_Schachtenopdrachtje_Tape	https://i.imgur.com/tfNZCSl.jpg	f	181
777	Bram_Rocking	Bram_Rocking	https://i.imgur.com/GKpOEa6.jpg	f	181
778	Olivier_Zingt_2	Olivier_Zingt_2	https://i.imgur.com/SiDyr7I.jpg	f	181
779	Sfeerbeeld_KarakoePt2_6	Sfeerbeeld_KarakoePt2_6	https://i.imgur.com/I9hHAnf.jpg	f	181
780	Jermin&Yoran&Marwan&Nikki_Zingen	Jermin&Yoran&Marwan&Nikki_Zingen	https://i.imgur.com/tB5JLH4.jpg	f	181
781	Aaron&Rein_Zingen	Aaron&Rein_Zingen	https://i.imgur.com/A8UI9tu.jpg	f	181
782	Sfeerbeeld_KarakoePt2_7	Sfeerbeeld_KarakoePt2_7	https://i.imgur.com/69UWmGz.jpg	f	181
783	Lucas&Lisa&Nyo	Lucas&Lisa&Nyo	https://i.imgur.com/j5U7KOI.jpg	f	181
784	Bram_Rocking2	Bram_Rocking2	https://i.imgur.com/Yig5G94.jpg	f	181
785	Milan&Richy	Milan&Richy	https://i.imgur.com/mCJ0BJP.jpg	f	181
786	Nyo&Silke	Nyo&Silke	https://i.imgur.com/lm98nyS.jpg	f	181
788	Schachtenopdrachtje_TapeBonding	Schachtenopdrachtje_TapeBonding	https://i.imgur.com/JHMeWuS.jpg	f	181
790	Schachtjes_Zwart&WitGekleed	Schachtjes_Zwart&WitGekleed	https://i.imgur.com/UX0IbAG.jpg	f	181
792	Schachtjes_Zwart&WitGekleed2	Schachtjes_Zwart&WitGekleed2	https://i.imgur.com/WBiFL2b.jpg	f	181
796	Sfeerbeeld_KarakoePt2_8	Sfeerbeeld_KarakoePt2_8	https://i.imgur.com/Pnk0zdp.jpg	f	181
787	Nikki&Jermin&Rien_Zingen	Nikki&Jermin&Rien_Zingen	https://i.imgur.com/3ZgxYrb.jpg	f	181
789	Sfeerbeeld_KarakoePt2_7	Sfeerbeeld_KarakoePt2_7	https://i.imgur.com/5Z1gpBF.jpg	f	181
791	Schachtenopdrachtje_Tape_Alejandro	Schachtenopdrachtje_Tape_Alejandro	https://i.imgur.com/eurCgj5.jpg	f	181
793	Benny&Nyo_ThumbsUp	Benny&Nyo_ThumbsUp	https://i.imgur.com/eluwp25.jpg	f	181
794	BohemianRhapsodyCrew_Pt2	BohemianRhapsodyCrew_Pt2	https://i.imgur.com/hSlwLbM.jpg	f	181
795	Silke&Nyo	Silke&Nyo	https://i.imgur.com/1hug2Hu.jpg	f	181
797	Ontgroening_Groep24-25	Ontgroening_Groep24-25	https://i.imgur.com/yYaEGAW.jpg	f	182
798	Ontgroening_Sfeerbeeld1	Ontgroening_Sfeerbeeld1	https://i.imgur.com/eqnLhgx.jpg	f	182
799	SachaHoldingBram	SachaHoldingBram	https://i.imgur.com/tQZ0agW.jpg	f	182
800	Ontgroening_Sfeerbeeld2	Ontgroening_Sfeerbeeld2	https://i.imgur.com/SAalHtL.jpg	f	182
801	Ontgroening_Sfeerbeeld3	Ontgroening_Sfeerbeeld3	https://i.imgur.com/KJDpTyH.jpg	f	182
802	Ontgroening_Karsten_Superschacht25	Ontgroening_Karsten_Superschacht25	https://i.imgur.com/v5p80pH.jpg	f	182
803	Simon_DoopDejavu	Simon_DoopDejavu	https://i.imgur.com/j2YR483.jpg	f	182
804	Ontgroening_Groep24-25_Everyone_Funny	Ontgroening_Groep24-25_Everyone_Funny	https://i.imgur.com/Chbs3fZ.jpg	f	182
805	Ontgroening_Sfeerbeeld3	Ontgroening_Sfeerbeeld3	https://i.imgur.com/UkZt75j.jpg	f	182
806	Ontgroening_Sfeerbeeld4	Ontgroening_Sfeerbeeld4	https://i.imgur.com/uSE4GSD.jpg	f	182
807	SchachtjesHug	SchachtjesHug	https://i.imgur.com/JqYcIcB.jpg	f	182
808	Ontgroening_Sfeerbeeld5	Ontgroening_Sfeerbeeld5	https://i.imgur.com/G5zznPp.jpg	f	182
809	DiedeExplaining_Ontgroening	DiedeExplaining_Ontgroening	https://i.imgur.com/DmxGdU1.jpg	f	182
810	RicardoSeppe&Amber	RicardoSeppe&Amber	https://i.imgur.com/Vjzl5Wm.jpg	f	182
811	Milan_Peeking_Schild	Milan_Peeking_Schild	https://i.imgur.com/7BTFsez.jpg	f	182
812	Ontgroening_Groep24-25_Everyone	Ontgroening_Groep24-25_Everyone	https://i.imgur.com/vW4LxxW.jpg	f	182
813	Schild&MiniSchild	Schild&MiniSchild	https://i.imgur.com/ZLpoWRx.jpg	f	182
814	Groepsfoto_BeginOntgroening	Groepsfoto_BeginOntgroening	https://i.imgur.com/9VVdkqA.jpg	f	182
815	Ontgroening_Sfeerbeeld6	Ontgroening_Sfeerbeeld6	https://i.imgur.com/rFRgJbw.jpg	f	182
816	SmashBrosScreen	SmashBrosScreen	https://i.imgur.com/QKSSGXs.jpg	f	183
817	CoolsteSportHappy	CoolsteSportHappy	https://i.imgur.com/bbaZ4a0.jpg	f	183
818	SmashBrosScreen2	SmashBrosScreen2	https://i.imgur.com/R6eOnLO.jpg	f	183
819	SmashTijlAgony	SmashTijlAgony	https://i.imgur.com/G3e72kl.jpg	f	183
820	Rien&TijlSmashing	Rien&TijlSmashing	https://i.imgur.com/R4JPRc8.jpg	f	183
821	Maxe_Arno_Lucas_Smashing	Maxe_Arno_Lucas_Smashing	https://i.imgur.com/BYTNitI.jpg	f	183
822	Smash_2nd_Toon	Smash_2nd_Toon	https://i.imgur.com/Lku9MXw.jpg	f	183
823	Smash_1st_Milan	Smash_1st_Milan	https://i.imgur.com/agvstsc.jpg	f	183
824	Aaron_Tijl_Smashing	Aaron_Tijl_Smashing	https://i.imgur.com/rfaliSg.jpg	f	183
825	Seppe&Alejandro_ThumbsUp	Seppe&Alejandro_ThumbsUp	https://i.imgur.com/OeYL2RW.jpg	f	183
826	Smash_3rd_Tijl	Smash_3rd_Tijl	https://i.imgur.com/eHAlfKm.jpg	f	183
827	Smash_SetUp_Milan	Smash_SetUp_Milan	https://i.imgur.com/Chci9d6.jpg	f	183
828	Chiara_Toon_Ricardo_Yoran_Smashing	Chiara_Toon_Ricardo_Yoran_Smashing	https://i.imgur.com/CXgpi7f.jpg	f	183
829	Brecht_Ruben_Milan_Smashing	Brecht_Ruben_Milan_Smashing	https://i.imgur.com/NeKsLtM.jpg	f	183
830	Maxe_Milan_Yoran_Smashing	Maxe_Milan_Yoran_Smashing	https://i.imgur.com/lqMe4xZ.jpg	f	183
831	SmashBrosScreen3	SmashBrosScreen3	https://i.imgur.com/HqwUc4K.jpg	f	183
832	Tanguy_ThumbsUp	Tanguy_ThumbsUp	https://i.imgur.com/U3jfvod.jpg	f	183
833	Toon_Milan_Smashing_MaxeBored	Toon_Milan_Smashing_MaxeBored	https://i.imgur.com/EKq16OX.jpg	f	183
834	SmashBrosScreen3	SmashBrosScreen3	https://i.imgur.com/h6Ib4zA.jpg	f	183
835	CommisWaitingOutside	CommisWaitingOutside	https://i.imgur.com/l7kTlBg.jpg	f	183
836	Ruben_Posing_badass	Ruben_Posing_badass	https://i.imgur.com/9EwLgbX.jpg	f	183
837	SmashBrosScreen4	SmashBrosScreen4	https://i.imgur.com/DtB7mA0.jpg	f	183
838	Finale_Toon&Milan	Finale_Toon&Milan	https://i.imgur.com/mROiJW2.jpg	f	183
839	SmashBrosScreen4	SmashBrosScreen4	https://i.imgur.com/0iyx1tM.jpg	f	183
840	Smash_Sfeerbeeld1	Smash_Sfeerbeeld1	https://i.imgur.com/J9HhDPt.jpg	f	183
841	Smash_Sfeerbeeld2	Smash_Sfeerbeeld2	https://i.imgur.com/ubJK5gF.jpg	f	183
842	Ruben&Seppe_Laptop	Ruben&Seppe_Laptop	https://i.imgur.com/BZZEf5k.jpg	f	183
843	Seppe_Explaining_Smash	Seppe_Explaining_Smash	https://i.imgur.com/tSnfo6E.jpg	f	183
844	SmashBrosScreen5	SmashBrosScreen5	https://i.imgur.com/Jb1WrhD.jpg	f	183
845	Brecht_Maxe_Lisa_Smashing	Brecht_Maxe_Lisa_Smashing	https://i.imgur.com/9FMwVuf.jpg	f	183
846	Ricardo&Milan_ThumbsUp	Ricardo&Milan_ThumbsUp	https://i.imgur.com/yBxYQX9.jpg	f	183
847	SmashBrosScreen5	SmashBrosScreen5	https://i.imgur.com/D1KIkAM.jpg	f	183
848	ReadyToFight	ReadyToFight	https://i.imgur.com/gH3Zxhr.jpg	f	183
849	Axelle_Photographer	Axelle_Photographer	https://i.imgur.com/vmZsxu7.jpg	f	183
850	Smash_Sfeerbeeld3	Smash_Sfeerbeeld3	https://i.imgur.com/Y50Pewi.jpg	f	183
851	SmashBrosScreen6	SmashBrosScreen6	https://i.imgur.com/S0IJHYn.jpg	f	183
852	Ruben_Yoran_Aaron_Chiara_Smashing	Ruben_Yoran_Aaron_Chiara_Smashing	https://i.imgur.com/73T7cQr.jpg	f	183
853	BramLurking_Smash	BramLurking_Smash	https://i.imgur.com/fRwp0pK.jpg	f	183
854	Smash_Sfeerbeeld4	Smash_Sfeerbeeld4	https://i.imgur.com/BAoZ1dQ.jpg	f	183
855	SmashBrosScreen6	SmashBrosScreen6	https://i.imgur.com/o5dScnT.jpg	f	183
1038	Karakoe I 2025	\N	https://i.imgur.com/fpv56MZ.jpg	f	220
856	SmashBrosScreen7	SmashBrosScreen7	https://i.imgur.com/ifvVomT.jpg	f	183
858	Lucas_Ricardo_Ruben_Lisa_Smashing	Lucas_Ricardo_Ruben_Lisa_Smashing	https://i.imgur.com/2oXvC8f.jpg	f	183
859	Maxe_BeingChallenged	Maxe_BeingChallenged	https://i.imgur.com/uIvGDrf.jpg	f	183
861	Axelle_Photographer_Terminator	Axelle_Photographer_Terminator	https://i.imgur.com/wSowKCn.jpg	f	183
857	Aaron_Brecht_Arno_Rien_Smashing	Aaron_Brecht_Arno_Rien_Smashing	https://i.imgur.com/0VpN1Ua.jpg	f	183
860	Lucas_Ricardo_Ruben_Lisa_Smashing_2	Lucas_Ricardo_Ruben_Lisa_Smashing_2	https://i.imgur.com/f01acrH.jpg	f	183
862	Lucas_Ricardo_Focus	Lucas_Ricardo_Focus	https://i.imgur.com/7FkEkD2.jpg	f	183
863	Maxe_Milan_Amazed	Maxe_Milan_Amazed	https://i.imgur.com/CXrOrHA.jpg	f	183
864	Brecht_Toon_Smashing	Brecht_Toon_Smashing	https://i.imgur.com/UoCfVXB.jpg	f	183
865	Seppe_Explaining_Smash2	Seppe_Explaining_Smash2	https://i.imgur.com/3sY7qPd.jpg	f	183
866	Spectators_Focus	Spectators_Focus	https://i.imgur.com/JmBFYVl.jpg	f	183
867	Chiara_Toon_Ricardo_Yoran_Happy	Chiara_Toon_Ricardo_Yoran_Happy	https://i.imgur.com/7Bfs9ST.jpg	f	183
868	MilanMisery	MilanMisery	https://i.imgur.com/6GYkfbZ.jpg	f	183
869	Tijl_Arno_Smashing	Tijl_Arno_Smashing	https://i.imgur.com/UrByCDM.jpg	f	183
870	Chiara_Rien_Smashing	Chiara_Rien_Smashing	https://i.imgur.com/BtMCbFe.jpg	f	183
871	Rien_Toon_Smashing_SurprisedSpectator	Rien_Toon_Smashing_SurprisedSpectator	https://i.imgur.com/8MNrtoO.jpg	f	183
872	Smash_ThumbsUp	Smash_ThumbsUp	https://i.imgur.com/5zXljxn.jpg	f	183
873	SmashBrosScreen7	SmashBrosScreen7	https://i.imgur.com/zEBFD6K.jpg	f	183
874	SmashBrosScreen8	SmashBrosScreen8	https://i.imgur.com/UnqQOFM.jpg	f	183
875	Chiara_Rien_Smashing2	Chiara_Rien_Smashing2	https://i.imgur.com/lQQnGgm.jpg	f	183
876	Wout&Maxe_Bowling	Wout&Maxe_Bowling	https://i.imgur.com/bQuIwkh.jpg	f	184
877	Diede&Nikki_Bowling	Diede&Nikki_Bowling	https://i.imgur.com/WcKz1y1.jpg	f	184
878	Diede&Nikki_Bowling2	Diede&Nikki_Bowling2	https://i.imgur.com/7FlqVIN.jpg	f	184
879	Diede&Nikki_Bowling3	Diede&Nikki_Bowling3	https://i.imgur.com/22GnVzx.jpg	f	184
880	Diede&Nikki_Bowling4	Diede&Nikki_Bowling4	https://i.imgur.com/Q8tewqn.jpg	f	184
881	Bram_ThinkingHeIsCool	Bram_ThinkingHeIsCool	https://i.imgur.com/enUb81t.jpg	f	184
882	Diede&Nikki_Bowling5	Diede&Nikki_Bowling5	https://i.imgur.com/rv4S5bb.jpg	f	184
883	Seppe_NailedIt	Seppe_NailedIt	https://i.imgur.com/CKFVoUR.jpg	f	184
884	MaxeWaitingForImpact	MaxeWaitingForImpact	https://i.imgur.com/8XMOFdC.jpg	f	184
885	RicardoPrecisionThrow	RicardoPrecisionThrow	https://i.imgur.com/35lN1zf.jpg	f	184
886	Axelle&Lucas_Bowling	Axelle&Lucas_Bowling	https://i.imgur.com/EfyN5Ak.jpg	f	184
887	Daan_Satisfied	Daan_Satisfied	https://i.imgur.com/uFuGWDC.jpg	f	184
888	Daan_Finger	Daan_Finger	https://i.imgur.com/ibhUCbr.jpg	f	184
889	Seppe_NailedIt2	Seppe_NailedIt2	https://i.imgur.com/BU57gp0.jpg	f	184
890	Richie&Thomas&Zeaya_Bowling	Richie&Thomas&Zeaya_Bowling	https://i.imgur.com/rIqyuxe.jpg	f	184
891	BramPicture	BramPicture	https://i.imgur.com/NiGCHtE.jpg	f	184
892	Zeaya&Seppe&Thomas_WithCreepyBram	Zeaya&Seppe&Thomas_WithCreepyBram	https://i.imgur.com/hm1KzvD.jpg	f	184
893	Axelle&Lucas_Bowling2	Axelle&Lucas_Bowling2	https://i.imgur.com/thFFhAu.jpg	f	184
894	Jonah&Zeaya_Bowling	Jonah&Zeaya_Bowling	https://i.imgur.com/lwfjmYV.jpg	f	184
895	BowlingSfeerbeeld	BowlingSfeerbeeld	https://i.imgur.com/0hfoo9S.jpg	f	184
896	Nikki_BowlingPose	Nikki_BowlingPose	https://i.imgur.com/stTbopu.jpg	f	184
897	BowlingSfeerbeeld2	BowlingSfeerbeeld2	https://i.imgur.com/gomDvQ5.jpg	f	184
898	Richie_Bowling	Richie_Bowling	https://i.imgur.com/wrYSvXO.jpg	f	184
899	Richie&Kobe_Bowling	Richie&Kobe_Bowling	https://i.imgur.com/HYGuhZB.jpg	f	184
900	Richie&Kobe_Bowling2	Richie&Kobe_Bowling2	https://i.imgur.com/n84lejR.jpg	f	184
901	BowlingSfeerbeeld3	BowlingSfeerbeeld3	https://i.imgur.com/0MEtSoE.jpg	f	184
902	Milan_Dino_Bowling	Milan_Dino_Bowling	https://i.imgur.com/6DZQjh6.jpg	f	184
903	BowlingSfeerbeeld4	BowlingSfeerbeeld4	https://i.imgur.com/ahB04l8.jpg	f	184
904	BowlingSfeerbeeld5	BowlingSfeerbeeld5	https://i.imgur.com/WessXlv.jpg	f	184
905	Richie&Zeaya_Bowling	Richie&Zeaya_Bowling	https://i.imgur.com/hK98wBT.jpg	f	184
906	Milan_Dino_Bowling2	Milan_Dino_Bowling2	https://i.imgur.com/HPy4uXt.jpg	f	184
907	BowlingSfeerbeeld6	BowlingSfeerbeeld6	https://i.imgur.com/nsu8JU2.jpg	f	184
908	Nick&Nikki_Bowling	Nick&Nikki_Bowling	https://i.imgur.com/TU8AhSG.jpg	f	184
909	YoranHappyDancing_Bowling	YoranHappyDancing_Bowling	https://i.imgur.com/iXDqUMt.jpg	f	184
910	Bram&Maxe&Milan_HappyBowling	Bram&Maxe&Milan_HappyBowling	https://i.imgur.com/e0Qjpo2.jpg	f	184
911	Bram&Maxe&Milan_HappyBowling2	Bram&Maxe&Milan_HappyBowling2	https://i.imgur.com/D3hFAel.jpg	f	184
912	Amber&Wout&Arno_HappyBowling	Amber&Wout&Arno_HappyBowling	https://i.imgur.com/akRSPMb.jpg	f	184
913	Briek&Jens_Bowling	Briek&Jens_Bowling	https://i.imgur.com/5klyg1J.jpg	f	184
914	Daan_Bowling	Daan_Bowling	https://i.imgur.com/x6a2w8x.jpg	f	184
915	Ricardo&Axelle_Selfie	Ricardo&Axelle_Selfie	https://i.imgur.com/XtHoMoS.jpg	f	184
916	Ruben_Bowling	Ruben_Bowling	https://i.imgur.com/MuHoAkM.jpg	f	184
917	BowlingSfeerbeeld6	BowlingSfeerbeeld6	https://i.imgur.com/qXC2Nbd.jpg	f	184
918	Diede&Seppe_BowlingHype	Diede&Seppe_BowlingHype	https://i.imgur.com/XV9QKl7.jpg	f	184
919	BowlingActieShot	BowlingActieShot	https://i.imgur.com/j6YeG28.jpg	f	184
920	Benny_Bowling	Benny_Bowling	https://i.imgur.com/fDRfq8M.jpg	f	184
921	Simon_ProBowling	Simon_ProBowling	https://i.imgur.com/nZWodno.jpg	f	184
922	Benny_Bowling2	Benny_Bowling2	https://i.imgur.com/bfRmogM.jpg	f	184
923	BowlingSfeerbeeld7	BowlingSfeerbeeld7	https://i.imgur.com/Wju2lcs.jpg	f	184
924	BowlingSfeerbeeld8	BowlingSfeerbeeld8	https://i.imgur.com/GWUjlo0.jpg	f	184
1041	Karakoe I 2025	\N	https://i.imgur.com/Xkt9itY.jpg	f	220
1042	Karakoe I 2025	\N	https://i.imgur.com/Y7YOZcK.jpg	f	220
925	TanguyNailedBowling	TanguyNailedBowling	https://i.imgur.com/hglJ2dL.jpg	f	184
926	Milan_Bowling	Milan_Bowling	https://i.imgur.com/lAYsD1x.jpg	f	184
927	Ruben_Bowling2	Ruben_Bowling2	https://i.imgur.com/30DLKAS.jpg	f	184
928	Ruben_Bowling3	Ruben_Bowling3	https://i.imgur.com/FtZamGN.jpg	f	184
929	Milan_Bowling2	Milan_Bowling2	https://i.imgur.com/7EA3GCV.jpg	f	184
936	Ontgroening_pt2_Groepsfoto_Beperkt	Ontgroening_pt2_Groepsfoto_Beperkt	https://i.imgur.com/gkX4boh.jpg	f	185
937	Ontgroening_pt2_Groepsfoto_Everyone	Ontgroening_pt2_Groepsfoto_Everyone	https://i.imgur.com/7DkCH2b.jpg	f	185
930	BowlingSfeerbeeld9	BowlingSfeerbeeld9	https://i.imgur.com/Fc1oXSW.jpg	f	184
931	WiiBowling	WiiBowling	https://i.imgur.com/SMRL034.mp4	f	184
933	Ontgroening_pt2_OfficieelGedeelte	Ontgroening_pt2_OfficieelGedeelte	https://i.imgur.com/fLA0HVF.jpg	f	185
934	Ontgroening_pt2_OfficieelGedeelte2	Ontgroening_pt2_OfficieelGedeelte2	https://i.imgur.com/tc3EtkI.jpg	f	185
935	Ontgroening_pt2_OfficieelGedeelte3	Ontgroening_pt2_OfficieelGedeelte3	https://i.imgur.com/CCrmHat.jpg	f	185
967	MarioKart Toernooi 2025-2026	Scherm	https://i.imgur.com/4RAdyvn.jpg	f	218
968	MarioKart Toernooi 2025-2026	Karsten&Simon	https://i.imgur.com/OUIoR6P.jpg	f	218
969	MarioKart Toernooi 2025-2026	Milan_pooltafel	https://i.imgur.com/lUlmtw6.jpg	f	218
970	MarioKart Toernooi 2025-2026	Seppe&Alejandro	https://i.imgur.com/YNircBm.jpg	f	218
971	MarioKart Toernooi 2025-2026	Alejandro&Tanguy	https://i.imgur.com/XFK9GqL.jpg	f	218
973	MarioKart Toernooi 2025-2026	Gaming_1	https://i.imgur.com/4wQq3Fd.jpg	f	218
974	MarioKart Toernooi 2025-2026	Gaming_2	https://i.imgur.com/I1BXgLL.jpg	f	218
975	MarioKart Toernooi 2025-2026	\N	https://i.imgur.com/wELj8Qw.jpg	f	218
976	MarioKart Toernooi 2025-2026	\N	https://i.imgur.com/0nlsTwx.jpg	f	218
977	MarioKart Toernooi 2025-2026	\N	https://i.imgur.com/ReI40Ku.jpg	f	218
978	MarioKart Toernooi 2025-2026	\N	https://i.imgur.com/BrYalJh.jpg	f	218
979	MarioKart Toernooi 2025-2026	\N	https://i.imgur.com/dBBUjcB.jpg	f	218
982	MarioKart Toernooi 2025-2026	\N	https://i.imgur.com/jTzjhe2.jpg	f	218
983	MarioKart Toernooi 2025-2026	\N	https://i.imgur.com/IoHxQ5S.jpg	f	218
984	MarioKart Toernooi 2025-2026	\N	https://i.imgur.com/KTm4QAF.jpg	f	218
985	MarioKart Toernooi 2025-2026	\N	https://i.imgur.com/I6EI5tt.jpg	f	218
986	MarioKart Toernooi 2025-2026	\N	https://i.imgur.com/QW9OljE.jpg	f	218
987	MarioKart Toernooi 2025-2026	\N	https://i.imgur.com/wldr0jn.jpg	f	218
988	MarioKart Toernooi 2025-2026	\N	https://i.imgur.com/AeouS6T.jpg	f	218
989	MarioKart Toernooi 2025-2026	\N	https://i.imgur.com/6W1tAUj.jpg	f	218
990	MarioKart Toernooi 2025-2026	\N	https://i.imgur.com/BFpcjBJ.jpg	f	218
991	MarioKart Toernooi 2025-2026	\N	https://i.imgur.com/2kgdJdZ.jpg	f	218
992	MarioKart Toernooi 2025-2026	\N	https://i.imgur.com/RQNOoS1.jpg	f	218
993	MarioKart Toernooi 2025-2026	\N	https://i.imgur.com/ONmZnI7.jpg	f	218
994	MarioKart Toernooi 2025-2026	\N	https://i.imgur.com/4hubFaN.jpg	f	218
995	MarioKart Toernooi 2025-2026	\N	https://i.imgur.com/EjneOZ3.jpg	f	218
997	MarioKart Toernooi 2025-2026	\N	https://i.imgur.com/5KJ2ZaR.jpg	f	218
998	MarioKart Toernooi 2025-2026	\N	https://i.imgur.com/KxDQwvp.jpg	f	218
999	MarioKart Toernooi 2025-2026	\N	https://i.imgur.com/xIHubji.jpg	f	218
1001	MarioKart Toernooi 2025-2026	\N	https://i.imgur.com/SycDKjL.jpg	f	218
1002	MarioKart Toernooi 2025-2026	\N	https://i.imgur.com/xpXz4BL.jpg	f	218
1003	MarioKart Toernooi 2025-2026	\N	https://i.imgur.com/zq3c74M.jpg	f	218
1004	SKO + Opendeurdag 2025-2026	\N	https://i.imgur.com/6TqRgJH.jpg	f	219
1005	SKO + Opendeurdag 2025-2026	\N	https://i.imgur.com/rXYVzHj.jpg	f	219
1006	SKO + Opendeurdag 2025-2026	\N	https://i.imgur.com/sTnyevE.jpg	f	219
1007	SKO + Opendeurdag 2025-2026	\N	https://i.imgur.com/BCpnI3u.jpg	f	219
1008	SKO + Opendeurdag 2025-2026	\N	https://i.imgur.com/pUwzOGT.jpg	f	219
1009	SKO + Opendeurdag 2025-2026	\N	https://i.imgur.com/xQBU1jY.jpg	f	219
1010	SKO + Opendeurdag 2025-2026	\N	https://i.imgur.com/MYV7Et7.jpg	f	219
1011	SKO + Opendeurdag 2025-2026	\N	https://i.imgur.com/AAxWhvz.jpg	f	219
1012	SKO + Opendeurdag 2025-2026	\N	https://i.imgur.com/XWjXPqj.jpg	f	219
1013	SKO + Opendeurdag 2025-2026	\N	https://i.imgur.com/D5iHhTo.jpg	f	219
1014	SKO + Opendeurdag 2025-2026	\N	https://i.imgur.com/sV41qba.jpg	f	219
1015	SKO + Opendeurdag 2025-2026	\N	https://i.imgur.com/aLegCY1.jpg	f	219
1016	SKO + Opendeurdag 2025-2026	\N	https://i.imgur.com/n8zImKm.jpg	f	219
1017	SKO + Opendeurdag 2025-2026	\N	https://i.imgur.com/SjMJDMn.jpg	f	219
1018	SKO + Opendeurdag 2025-2026	\N	https://i.imgur.com/frTSESX.jpg	f	219
1019	Karakoe I 2025	\N	https://i.imgur.com/zwqJeMr.jpg	f	220
1020	Karakoe I 2025	\N	https://i.imgur.com/QwuOS44.jpg	f	220
1021	Karakoe I 2025	\N	https://i.imgur.com/YUWEw2H.jpg	f	220
1022	Karakoe I 2025	\N	https://i.imgur.com/gv3SRrj.jpg	f	220
1023	Karakoe I 2025	\N	https://i.imgur.com/xAdbael.jpg	f	220
1024	Karakoe I 2025	\N	https://i.imgur.com/aS2EtsT.jpg	f	220
1025	Karakoe I 2025	\N	https://i.imgur.com/CpvxuHk.jpg	f	220
1026	Karakoe I 2025	\N	https://i.imgur.com/eE4dNLQ.jpg	f	220
1027	Karakoe I 2025	\N	https://i.imgur.com/gxK6EH0.jpg	f	220
1028	Karakoe I 2025	\N	https://i.imgur.com/7U0uGQu.jpg	f	220
1029	Karakoe I 2025	\N	https://i.imgur.com/tRLuh03.jpg	f	220
1032	Karakoe I 2025	\N	https://i.imgur.com/KMhsVkw.jpg	f	220
1033	Karakoe I 2025	\N	https://i.imgur.com/mFOCv5P.jpg	f	220
1034	Karakoe I 2025	\N	https://i.imgur.com/q8hGEyz.jpg	f	220
1043	Karakoe I 2025	\N	https://i.imgur.com/CCq0F2T.jpg	f	220
1044	Karakoe I 2025	\N	https://i.imgur.com/Qnypkee.jpg	f	220
1045	Karakoe I 2025	\N	https://i.imgur.com/LKSWu2i.jpg	f	220
1046	Karakoe I 2025	\N	https://i.imgur.com/TXj3Pxj.jpg	f	220
1049	Halloween Clubavond 2025	\N	https://i.imgur.com/FhXQJ2z.jpg	f	221
1050	Halloween Clubavond 2025	\N	https://i.imgur.com/pkosAac.jpg	f	221
1051	Halloween Clubavond 2025	\N	https://i.imgur.com/wcHs0dd.jpg	f	221
1052	Halloween Clubavond 2025	\N	https://i.imgur.com/gPGNwxY.jpg	f	221
1053	Halloween Clubavond 2025	\N	https://i.imgur.com/o9t118k.jpg	f	221
1054	Halloween Clubavond 2025	\N	https://i.imgur.com/4k5YMAZ.jpg	f	221
1055	Halloween Clubavond 2025	\N	https://i.imgur.com/AuyV2re.jpg	f	221
1056	Studentenverenigingen 101- 2025	\N	https://i.imgur.com/WQlG8nc.jpg	f	222
1057	Studentenverenigingen 101- 2025	\N	https://i.imgur.com/CXxkv9P.jpg	f	222
1059	Studentenverenigingen 101- 2025	\N	https://i.imgur.com/ToA6WAd.jpg	f	222
1060	Studentenverenigingen 101- 2025	\N	https://i.imgur.com/1tgH2sQ.jpg	f	222
1061	Studentenverenigingen 101- 2025	\N	https://i.imgur.com/UCIAbED.jpg	f	222
1062	Studentenverenigingen 101- 2025	\N	https://i.imgur.com/y0eeRxS.jpg	f	222
1063	Studentenverenigingen 101- 2025	\N	https://i.imgur.com/xmjytun.jpg	f	222
1064	Studentenverenigingen 101- 2025	\N	https://i.imgur.com/d5zHKps.jpg	f	222
1066	Studentenverenigingen 101- 2025	\N	https://i.imgur.com/DWfTVXy.jpg	f	222
1067	Studentenverenigingen 101- 2025	\N	https://i.imgur.com/oHtZyUp.jpg	f	222
1072	Studentenverenigingen 101- 2025	\N	https://i.imgur.com/cPKuw5p.jpg	f	222
1073	Studentenverenigingen 101- 2025	\N	https://i.imgur.com/FMlFvnq.jpg	f	222
1074	Nadoop + Sinterklaas 2025	\N	https://i.imgur.com/8Z8gzej.jpg	f	223
1075	Nadoop + Sinterklaas 2025	\N	https://i.imgur.com/vEJWknU.jpg	f	223
1076	Nadoop + Sinterklaas 2025	\N	https://i.imgur.com/AE6ThK5.jpg	f	223
1077	Nadoop + Sinterklaas 2025	\N	https://i.imgur.com/nD4WKe5.jpg	f	223
1078	Nadoop + Sinterklaas 2025	\N	https://i.imgur.com/PU9hDHJ.jpg	f	223
1079	Nadoop + Sinterklaas 2025	\N	https://i.imgur.com/KLhi1vB.jpg	f	223
1080	Nadoop + Sinterklaas 2025	\N	https://i.imgur.com/xWg2fVp.jpg	f	223
1081	Nadoop + Sinterklaas 2025	\N	https://i.imgur.com/m8tznS7.jpg	f	223
1082	Nadoop + Sinterklaas 2025	\N	https://i.imgur.com/JWitEui.jpg	f	223
1083	Nadoop + Sinterklaas 2025	\N	https://i.imgur.com/gnTJWQU.jpg	f	223
1086	Nadoop + Sinterklaas 2025	\N	https://i.imgur.com/XJGXg39.jpg	f	223
1087	Nadoop + Sinterklaas 2025	\N	https://i.imgur.com/t7ziVLs.jpg	f	223
1088	Nadoop + Sinterklaas 2025	\N	https://i.imgur.com/EKwMuM4.jpg	f	223
1089	Nadoop + Sinterklaas 2025	\N	https://i.imgur.com/uaFC7jz.jpg	f	223
1090	Nadoop + Sinterklaas 2025	\N	https://i.imgur.com/4TAcapd.jpg	f	223
1091	Nadoop + Sinterklaas 2025	\N	https://i.imgur.com/01lbrgu.jpg	f	223
1092	Nadoop + Sinterklaas 2025	\N	https://i.imgur.com/Mqc4rlE.jpg	f	223
1094	Nadoop + Sinterklaas 2025	\N	https://i.imgur.com/GNmKh5c.jpg	f	223
1095	Nadoop + Sinterklaas 2025	\N	https://i.imgur.com/a8YYsqG.jpg	f	223
1096	Nadoop + Sinterklaas 2025	\N	https://i.imgur.com/i4heaqs.jpg	f	223
1097	Nadoop + Sinterklaas 2025	\N	https://i.imgur.com/riljMpD.jpg	f	223
1100	Nadoop + Sinterklaas 2025	\N	https://i.imgur.com/QRbYzKG.jpg	f	223
1101	Nadoop + Sinterklaas 2025	\N	https://i.imgur.com/Ffl3uhk.jpg	f	223
1102	Nadoop + Sinterklaas 2025	\N	https://i.imgur.com/h4QEcKr.jpg	f	223
1103	Nadoop + Sinterklaas 2025	\N	https://i.imgur.com/GaDGSH2.jpg	f	223
1104	Schaatsen 2025	\N	https://i.imgur.com/axOrBwr.jpg	f	224
1105	Schaatsen 2025	\N	https://i.imgur.com/8yKaVkg.jpg	f	224
1108	Schaatsen 2025	\N	https://i.imgur.com/8ZXMgYN.jpg	f	224
1110	Schaatsen 2025	\N	https://i.imgur.com/CIjcsnt.jpg	f	224
1111	Schaatsen 2025	\N	https://i.imgur.com/s6rrqk2.jpg	f	224
1112	Schaatsen 2025	\N	https://i.imgur.com/THTk9dg.jpg	f	224
1113	Schaatsen 2025	\N	https://i.imgur.com/wQqSMli.jpg	f	224
1114	Schaatsen 2025	\N	https://i.imgur.com/FCeNmbf.jpg	f	224
1115	Schaatsen 2025	\N	https://i.imgur.com/IBflNaq.jpg	f	224
1116	Schaatsen 2025	\N	https://i.imgur.com/nVv9c5h.jpg	f	224
1118	Schaatsen 2025	\N	https://i.imgur.com/Q9Po6FG.jpg	f	224
1120	Schaatsen 2025	\N	https://i.imgur.com/ESbj1tb.jpg	f	224
1123	Schaatsen 2025	\N	https://i.imgur.com/31hs4aW.jpg	f	224
1124	Schaatsen 2025	\N	https://i.imgur.com/u3p2Djl.jpg	f	224
1130	Nadoop + Sinterklaas 2025	\N	https://i.imgur.com/cFtbWbb.jpg	f	223
1131	Nadoop + Sinterklaas 2025	\N	https://i.imgur.com/phzp2iw.jpg	f	223
1132	Nadoop + Sinterklaas 2025	\N	https://i.imgur.com/2KxW2Ys.jpg	f	223
1134	Nadoop + Sinterklaas 2025	\N	https://i.imgur.com/tc1UebL.jpg	f	223
1135	Nadoop + Sinterklaas 2025	\N	https://i.imgur.com/FeV7g2g.jpg	f	223
1137	Baseball 2025	\N	https://i.imgur.com/5J1nfE5.jpg	f	225
1121	Schaatsen 2025	\N	https://i.imgur.com/Eotgo88.jpg	f	224
1128	Nadoop + Sinterklaas 2025	\N	https://i.imgur.com/L4g6pXt.jpg	f	223
1129	Nadoop + Sinterklaas 2025	\N	https://i.imgur.com/85dbhEp.jpg	f	223
1133	Nadoop + Sinterklaas 2025	\N	https://i.imgur.com/hHe1fhf.jpg	f	223
1136	Nadoop + Sinterklaas 2025	\N	https://i.imgur.com/iTt6Ik6.jpg	f	223
1138	Baseball 2025	\N	https://i.imgur.com/qkTFiiF.jpg	f	225
1139	Baseball 2025	\N	https://i.imgur.com/7tPA33i.jpg	f	225
1140	Baseball 2025	\N	https://i.imgur.com/DpXirqu.jpg	f	225
1141	Baseball 2025	\N	https://i.imgur.com/UvV7l0U.jpg	f	225
1142	Baseball 2025	\N	https://i.imgur.com/PKI96Ou.jpg	f	225
1143	Baseball 2025	\N	https://i.imgur.com/ZOrpdP6.jpg	f	225
1144	Baseball 2025	\N	https://i.imgur.com/sPC2Jy5.jpg	f	225
1145	Baseball 2025	\N	https://i.imgur.com/DPu4Gn3.jpg	f	225
1146	Baseball 2025	\N	https://i.imgur.com/oHtyWrs.jpg	f	225
1147	Baseball 2025	\N	https://i.imgur.com/z7bZe7k.jpg	f	225
1148	Baseball 2025	\N	https://i.imgur.com/alcxHy5.jpg	f	225
\.


--
-- Data for Name: Backend_praesidiumfunction; Type: TABLE DATA; Schema: public; Owner: jormungandr
--

COPY public."Backend_praesidiumfunction" (id, name, email, "order") FROM stdin;
1	Praeses	praeses@heimdal.be	0
2	Vice-Praeses	vice-praeses@heimdal.be	1
3	Quaestor	quaestor@heimdal.be	2
4	Secretaris	secretaris@heimdal.be	3
13	Medewerker	n/a@heimdal.be	98
15	Superschacht	n@a.com	99
16	Erelid	n@a.com	98
7	PR	pr@heimdal.be	4
11	Media	media@heimdal.be	5
10	Schachtentemmer	schachtentemmer@heimdal.be	6
6	Cultuur	cultuur@heimdal.be	7
9	Sport	sport@heimdal.be	8
5	Feest & LAN	feest-lan@heimdal.be	9
8	ICT	ict@heimdal.be	10
12	Scriptor	scriptor@heimdal.be	11
48	Keizer Feest & LAN	feest-lan@heimdal.be	9
\.


--
-- Data for Name: Backend_praesidiumfunctionyearmember; Type: TABLE DATA; Schema: public; Owner: jormungandr
--

COPY public."Backend_praesidiumfunctionyearmember" (id, praesidium_function_id, praesidium_member_id, praesidium_year_id, photo) FROM stdin;
12	10	11	3	https://i.imgur.com/Mc9lgfO.jpg
48	8	31	1	https://i.imgur.com/ksg5WKf.jpg
47	7	34	1	https://i.imgur.com/ayowkSP.png
49	15	37	7	https://i.imgur.com/mCeoCl0.png
46	9	32	1	https://i.imgur.com/sR2PJoW.jpg
57	16	36	6	https://i.imgur.com/aiXnDhm.png
45	10	33	1	https://i.imgur.com/1ZR3Ay5.jpg
44	3	30	1	https://i.imgur.com/Hzf9A6J.jpg
43	6	29	1	https://i.imgur.com/9q8idW1.jpg
15	6	8	2	https://i.imgur.com/vmWNqD5.png
41	4	18	1	https://i.imgur.com/PgeOoNe.jpg
42	5	15	1	https://i.imgur.com/e52praS.png
40	2	16	1	https://i.imgur.com/sKQj9F1.jpg
39	1	17	1	https://i.imgur.com/8WC7IB2.jpg
55	16	4	6	https://i.imgur.com/IMUrVuT.png
37	2	27	4	https://i.imgur.com/gSPntRq.png
36	7	27	5	https://i.imgur.com/gSPntRq.png
35	4	25	4	https://i.imgur.com/dvpxSLZ.jpg
34	3	21	4	https://i.imgur.com/n3UwbKU.jpg
33	7	26	4	https://i.imgur.com/GKMZwib.png
32	12	25	5	https://i.imgur.com/dvpxSLZ.jpg
31	11	24	5	https://i.imgur.com/VmNvDLr.jpg
30	5	19	5	https://i.imgur.com/G6nNgjh.png
29	6	23	5	https://i.imgur.com/lTG6yCy.jpg
28	4	22	5	https://i.imgur.com/UrVD1Oe.jpg
27	3	21	5	https://i.imgur.com/n3UwbKU.jpg
26	1	20	5	https://i.imgur.com/QQ1y0RB.png
25	6	5	4	https://i.imgur.com/G7wBXJF.png
22	9	18	2	https://i.imgur.com/881RDdr.jpg
21	10	17	2	https://i.imgur.com/MbV8jwi.jpg
20	4	16	2	https://i.imgur.com/tLzHzrp.jpg
19	5	15	2	https://i.imgur.com/ScX1wPi.jpg
18	8	14	2	https://i.imgur.com/XlXTlvl.jpg
17	9	13	5	https://i.imgur.com/0y4FBYY.jpg
16	7	11	2	https://i.imgur.com/Mc9lgfO.jpg
14	1	6	2	https://i.imgur.com/IFadTLs.jpg
13	11	12	3	https://i.imgur.com/msq5Hz1.jpg
11	9	10	3	https://i.imgur.com/BxPTr24.jpg
10	7	7	3	https://i.imgur.com/PEsfapB.png
9	6	8	3	https://i.imgur.com/vmWNqD5.png
8	5	9	3	https://i.imgur.com/hWnqqDT.jpg
6	2	5	3	https://i.imgur.com/H02RBb9.png
4	8	3	5	https://i.imgur.com/fDsqDTC.jpg
3	1	3	4	https://i.imgur.com/fDsqDTC.jpg
2	8	2	3	https://i.imgur.com/73eCWvR.jpg
1	2	1	5	https://i.imgur.com/PLofxYJ.jpg
7	4	6	3	https://i.imgur.com/qTnBu3M.png
5	1	4	3	https://i.imgur.com/IMUrVuT.png
24	9	6	4	https://i.imgur.com/qTnBu3M.png
38	8	28	4	https://i.imgur.com/aiXnDhm.png
23	10	4	4	https://i.imgur.com/IMUrVuT.png
50	16	1	6	https://i.imgur.com/PLofxYJ.jpg
51	16	20	6	https://i.imgur.com/QQ1y0RB.png
52	16	22	6	https://i.imgur.com/UrVD1Oe.jpg
53	16	21	6	https://i.imgur.com/n3UwbKU.jpg
54	16	3	6	https://i.imgur.com/fDsqDTC.jpg
96	10	34	40	https://i.imgur.com/LWbbnqY.png
56	16	35	6	https://i.imgur.com/KK4FOCC.jpg
93	4	71	40	https://i.imgur.com/GWE5wsm.png
90	1	16	40	https://i.imgur.com/1u2DWDe.png
100	8	31	40	https://i.imgur.com/fd0eTMo.png
97	6	6	40	https://i.imgur.com/8MrCTB5.png
168	10	140	74	https://i.imgur.com/EKFHbmF.png
92	3	32	40	https://i.imgur.com/hrmtJgH.png
98	9	74	40	https://i.imgur.com/ukojMZK.png
95	11	73	40	https://i.imgur.com/teHQLVQ.png
91	2	17	40	https://i.imgur.com/79epaNQ.png
94	7	72	40	https://i.imgur.com/bwSFAyO.png
99	48	15	40	https://i.imgur.com/Po1JVwv.png
89	15	70	7	https://i.imgur.com/s71DidK.png
274	1	145	107	https://i.imgur.com/MrGuJ1V.png
175	2	71	74	https://i.imgur.com/o2v5dBp.png
176	9	145	74	https://i.imgur.com/2PI4o27.png
170	3	142	74	https://i.imgur.com/wH56L9G.png
169	8	141	74	https://i.imgur.com/wrQtSgZ.png
206	1	17	74	https://i.imgur.com/pKShvxH.png
166	11	138	74	https://i.imgur.com/swAvSyI.png
239	48	15	74	https://i.imgur.com/A9DC7Jk.png
172	4	6	74	https://i.imgur.com/G1PhQQw.png
133	15	105	7	https://i.imgur.com/JsopnkG.png
273	15	176	7	https://i.imgur.com/Ut7jYtR.png
276	4	142	107	https://i.imgur.com/dDbVVDB.png
174	6	144	74	https://i.imgur.com/dMAB9ia.png
282	5	182	107	https://i.imgur.com/sY8UlYX.png
283	8	183	107	https://i.imgur.com/iFK05el.png
281	9	181	107	https://i.imgur.com/s7Sqmv9.png
278	11	178	107	https://i.imgur.com/RkMH8P6.png
277	7	177	107	https://i.imgur.com/xMghFXk.png
275	3	184	107	https://i.imgur.com/33b6ZLx.png
313	16	17	6	https://i.imgur.com/pKShvxH.png
280	6	180	107	https://i.imgur.com/Gaihwoq.png
279	10	179	107	https://i.imgur.com/TuhLFVN.png
346	1	182	140	https://i.imgur.com/aiXnDhm.png
347	2	178	140	https://i.imgur.com/aiXnDhm.png
348	3	184	140	https://i.imgur.com/aiXnDhm.png
349	4	217	140	https://i.imgur.com/aiXnDhm.png
350	7	218	140	https://i.imgur.com/aiXnDhm.png
351	11	219	140	https://i.imgur.com/aiXnDhm.png
352	10	220	140	https://i.imgur.com/aiXnDhm.png
353	6	221	140	https://i.imgur.com/aiXnDhm.png
354	9	222	140	https://i.imgur.com/aiXnDhm.png
355	5	180	140	https://i.imgur.com/aiXnDhm.png
356	8	223	140	https://i.imgur.com/aiXnDhm.png
357	15	221	7	https://i.imgur.com/aiXnDhm.png
\.


--
-- Data for Name: Backend_praesidiummember; Type: TABLE DATA; Schema: public; Owner: jormungandr
--

COPY public."Backend_praesidiummember" (id, first_name, last_name, email, phone, quote, description, trivia, facebook_link, linkedin_link, twitter_link, instagram_link) FROM stdin;
1	Stef	Bondroit	stef.bondroit@gmail.com	0498113032	\N	\N	n/a	https://www.facebook.com/profile.php?id=100003741166479	https://www.linkedin.com/in/stef-bondroit/	\N	https://www.instagram.com/stefbondroit/
2	Nick	Lersberghe	ict@heimdal.be	\N	\N	\N	Test	\N	https://www.linkedin.com/in/nick-lersberghe/	\N	\N
3	Thomas	Schuddinck	thomas.schuddinck@gmail.com	+32491449500	\N	\N	**I'm awesome**	https://www.facebook.com/thomas.stephenschuddinck	https://www.linkedin.com/in/thomas-schuddinck-3b9436174/	\N	\N
4	Andreas	Moerman	praeses@heimdal.be	\N	\N	\N	N/A	\N	\N	\N	\N
5	Nelson	Horemans	vice-praeses@heimdal.be	\N	\N	\N	N/A	\N	\N	\N	\N
6	Tyra	Bourgeois	secretaris@heimdal.be	\N	\N	\N	N/A	\N	\N	\N	\N
7	Brent	Van Acker	pr@heimdal.be	\N	\N	\N	N/A	https://www.facebook.com/Brent.va.bva/	\N	\N	https://www.instagram.com/brent_vanacker/
8	Chaira	Goethals	cultuur@heimdal.be	\N	\N	\N	N/A	https://www.facebook.com/chairag	\N	\N	https://www.instagram.com/chairagoethals/
9	Ellen	Van Damme	feest-lan@heimdal.be	\N	\N	\N	N/A	\N	https://www.linkedin.com/in/ellenvandamme2001/	\N	\N
10	Jarne	De Vulder	sport@heimdal.be	\N	\N	\N	N/A	https://www.facebook.com/devulder.jarne	\N	\N	\N
11	Luna	Deroo	schachtentemmer@heimdal.be	\N	\N	\N	N/A	\N	\N	\N	\N
12	Ruben	Stalpaert	media@heimdal.be	\N	\N	\N	N/A	\N	\N	\N	\N
13	Tijl	Zwartjes	vice-praeses@heimdal.be	\N	\N	\N	N/A	\N	\N	\N	\N
14	Benny	De Bock	BdeBock@protonmail.com	\N	\N	\N	N/A	\N	https://www.linkedin.com/in/bennydebock/	https://twitter.com/BennyDeBock	\N
15	Tanguy	Montaine	feest-lan@heimdal.be	\N	\N	\N	N/A	https://www.facebook.com/tanguy.montaine	https://www.linkedin.com/in/tanguy-montaine-8b561b202/	https://twitter.com/TanguyMontaine	https://www.instagram.com/tanguymontaine/
16	Sander	De Bruyker	secretaris@heimdal.be	\N	\N	\N	N/A	https://www.facebook.com/sander.debruyker/	https://www.linkedin.com/in/sander-de-bruyker-7a0442165/	\N	\N
17	Hayley	Rasschaert	schachtentemmer@heimdal.be	\N	\N	\N	N/A	\N	\N	\N	\N
18	Jolien	Leenknegt	sport@heimdal.be	\N	\N	\N	N/A	https://www.facebook.com/Jolienleenknegt/	\N	\N	https://www.instagram.com/jolienleenknegt/
19	Lucien	De Leeuw	feest-lan@heimdal.be	\N	\N	\N	N/A	\N	\N	\N	\N
20	Hans	De Boeck	praeses@heimdal.be	\N	\N	\N	N/A	\N	\N	\N	\N
21	Stephen	Nijsten	quaestor@heimdal.be	\N	\N	\N	N/A	\N	\N	\N	\N
22	Timothy	Williame	secretaris@heimdal.be	\N	\N	\N	N/A	\N	\N	\N	\N
23	Jolien	Bardyn	cultuur@heimdal.be	\N	\N	\N	N/A	\N	\N	\N	\N
24	Miriam	Plugge	media@heimdal.be	\N	\N	\N	N/A	\N	\N	\N	\N
25	Joren	Debois	scriptor@heimdal.be	\N	\N	\N	N/A	\N	\N	\N	\N
26	Laurens	Ghekiere	pr@heimdal.be	\N	\N	\N	N/A	https://www.facebook.com/lghekiere	https://www.linkedin.com/in/laurens-ghekiere-774b77140	\N	\N
27	Ritchie	Van Mele	gate@heimdal.be	\N	\N	\N	N/A	\N	\N	\N	\N
28	Sofie	Seru	ict@heimdal.be	\N	\N	\N	N/A	\N	\N	\N	\N
29	Bram	Zeeuwe	n@a.com	\N	\N	\N	n/a	https://www.facebook.com/zeeuwe.bram	\N	https://twitter.com/WheksNestle	https://www.instagram.com/bram.zeeuwe/
30	Lucas	Havermans	n@a.com	\N	\N	\N	N/A	\N	\N	\N	\N
31	Sepp	Degroote	n@a.com	\N	\N	\N	N/A	https://www.facebook.com/seppatron	https://www.linkedin.com/in/sepp-degroote/	https://twitter.com/seppatron	https://www.instagram.com/seppatron/
32	Daan	Beernaert	n@a.com	\N	\N	\N	N/A	\N	\N	\N	\N
34	Rein	Goossens	n@a.com	\N	\N	\N	N/A	https://www.facebook.com/rein.goossens.37	\N	\N	https://www.instagram.com/reingoossens/
33	Jochen	Wimme	n@a.com	\N	\N	\N	N/A	\N	\N	\N	\N
35	Stijn	Verschueren	N@A.com	\N	\N	\N	n/a	\N	\N	\N	\N
36	Jarne	Schotte	n@a.com	\N	\N	\N	n/a	\N	\N	\N	\N
140	Diede	Devriendt	n/a@gmail.com	\N	\N	\N	n/a@gmail.com	\N	\N	\N	\N
176	Karsten	2024-2025	n/a@com.com	\N	\N	\N	n/a	\N	\N	\N	\N
37	Bram	2021-2022	n/a@com.com	\N	\N	\N	n/a	https://www.facebook.com/zeeuwe.bram	\N	https://twitter.com/WheksNestle	https://www.instagram.com/bram.zeeuwe/
71	Reina	Tanghe	n/a@gmailo.com	n/a	n/a	n/a	n/a	\N	\N	\N	\N
73	Febe	Coutteau	n/a@gmail.com	n/a	n/a	n/a	n/a	\N	\N	\N	\N
74	Eline	Claeys	n/a@gmail.com	n/a	n/a	n/a	n/a	\N	\N	\N	\N
105	Britt	2023-2024	n/a@com.com	n/a	n/a	n/a	n/a	\N	\N	\N	\N
139	Annelies	Van Nuffel	n/a@gmail.com	\N	\N	\N	n/a	\N	\N	\N	\N
142	Maxe	Adams	n/a@gmail.com	\N	\N	\N	n/a	\N	\N	\N	\N
143	Jonah	Van Den Brandt	n/a@gmail.com	\N	\N	\N	n/a	\N	\N	\N	\N
144	Kirsten	Pype	n/a@gmail.com	\N	\N	\N	n/a	\N	\N	\N	\N
138	Britt	Emanuel	media@heimdal.be	\N	\N	\N	n/a	https://www.facebook.com/profile.php?id=100004805947152	https://www.linkedin.com/in/britt-emanuel-161b76193/	\N	https://www.instagram.com/britt.emanuel/
141	Aaron	Vandeweghe	n/a@gmail.com	\N	\N	\N	n/a	\N	https://www.linkedin.com/in/aaron-vandeweghe/	https://bsky.app/profile/argonai.net	\N
145	Seppe	Landtsheer	n/a@gmail.com	\N	\N	\N	n/a	\N	https://www.linkedin.com/in/seppe-landtsheer-083357306/	https://x.com/ZepjePlays	\N
70	Febe	2022-2023	n/a@com.com	n/a	n/a	n/a	n/a	\N	\N	\N	\N
177	Zeaya	Nys	n/a@com.com	\N	\N	\N	n/a	\N	\N	\N	\N
178	Axelle	Ducouran	n/a@com.com	\N	\N	\N	n/a	\N	\N	\N	\N
179	Simon	Tytgat	n/a@com.com	\N	\N	\N	n/a	\N	\N	\N	\N
180	Ricardo	De Blust	n/a@com.com	\N	\N	\N	n/a	\N	\N	\N	\N
181	Alejandro	De Bruyne	n/a@com.com	\N	\N	\N	n/a	\N	\N	\N	\N
182	Richy	Rahman	n/a@com.com	\N	\N	\N	n/a	\N	\N	\N	\N
183	Yoran	Ollevier	n/a@com.com	\N	\N	\N	n/a	\N	\N	\N	\N
72	Milan	De Smet	n/a@gmail.com	n/a	n/a	n/a	Mijn tweede naam is Thomas	\N	\N	https://open.spotify.com/user/depressedslxyer?si=a619afa1c43e45e6	\N
217	Marwan	Elkhallouki	n/a@com.com	\N	\N	\N	n/a	\N	\N	\N	\N
219	Vincent	Minjauw	n/a@com.com	\N	\N	\N	n/a	\N	\N	\N	\N
220	Kobe	Maebe	n/a@com.com	\N	\N	\N	n/a	\N	\N	\N	\N
221	Milan	Dhondt	n/a@com.com	\N	\N	\N	n/a	\N	\N	\N	\N
222	Shanty	Laureyns	n/a@com.com	\N	\N	\N	n/a	\N	\N	\N	\N
223	Wout	Lesschaeve	n/a@com.com	\N	\N	\N	n/a	\N	\N	\N	\N
218	Mauro	Maratta	n/a@com.com	\N	\N	\N	n/a	\N	https://www.linkedin.com/in/mauro-maratta	\N	\N
184	Karsten	Depoorter	n/a@com.com	\N	\N	\N	n/a	\N	https://be.linkedin.com/in/karsten-depoorter-b74a422a1/?skipRedirect=true	\N	https://www.instagram.com/poorter.k/
\.


--
-- Data for Name: Backend_praesidiumyear; Type: TABLE DATA; Schema: public; Owner: jormungandr
--

COPY public."Backend_praesidiumyear" (id, start, "end", display_name) FROM stdin;
1	2022-06-01 15:49:19+00	2023-05-31 15:49:19+00	\N
2	2021-06-01 15:50:12+00	2022-05-31 15:50:11+00	\N
3	2020-05-01 15:51:09+00	2021-05-31 15:51:10+00	\N
4	2019-06-01 15:51:37+00	2020-05-31 15:51:36+00	\N
5	2018-01-01 16:51:58+00	2019-05-31 15:51:59+00	\N
6	1999-01-01 20:26:32+00	2000-01-01 20:26:33+00	Ereleden
7	2000-01-01 20:27:06+00	2001-01-01 20:27:07+00	Superschachten
40	2023-05-16 18:15:08+00	2024-05-16 18:15:10+00	\N
74	2024-05-31 22:00:00+00	2025-05-30 22:00:00+00	2024 - 2025
107	2025-05-31 22:00:00+00	2026-05-30 22:00:00+00	2025 - 2026
140	2026-05-23 22:00:00+00	2027-05-23 22:00:00+00	2026 - 2027
\.


--
-- Data for Name: Backend_profile; Type: TABLE DATA; Schema: public; Owner: jormungandr
--

COPY public."Backend_profile" (id, gsm, geslacht, interesses, mails, policy_approved, votes, status, role, election_active, user_id) FROM stdin;
12		VROUW	GAMES,ANIME,SUPERHEROES	t	t	0	ACTIVE	4	f	12
217	0478326006	VROUW		f	t	1	ACTIVE	4	f	217
7		VROUW	GAMES,ANIME,COSPLAY,TABLETOPS,SUPERHEROES	t	t	0	ACTIVE	3	f	7
6	0497423330	MAN	GAMES,ANIME,COSPLAY,TABLETOPS,SUPERHEROES	t	t	0	ACTIVE	3	f	6
328	0494920994	MAN	GAMES,ANIME,TABLETOPS	f	t	1	ACTIVE	4	f	328
9		MAN	GAMES,ANIME,TABLETOPS	t	t	0	ACTIVE	3	f	9
10	0475509356	MAN	GAMES,ANIME,COSPLAY,TABLETOPS,SUPERHEROES	t	t	0	ACTIVE	3	f	10
449		MAN	GAMES,ANIME,COSPLAY,TABLETOPS,SUPERHEROES	t	t	1	ACTIVE	5	f	449
327		MAN	GAMES,ANIME,COSPLAY,TABLETOPS,SUPERHEROES	t	t	1	ACTIVE	4	f	327
377		ANDERS	GAMES,ANIME,COSPLAY,TABLETOPS,SUPERHEROES	t	t	1	ACTIVE	4	f	377
226	0477272472	MAN	GAMES,ANIME,COSPLAY,TABLETOPS,SUPERHEROES	t	t	1	ACTIVE	4	f	226
224		VROUW	GAMES	t	t	1	ACTIVE	4	f	224
11	n/a	MAN		f	t	0	ACTIVE	3	f	11
220	0489065081	MAN	GAMES,ANIME,TABLETOPS,SUPERHEROES	t	t	1	ACTIVE	4	f	220
145		MAN	GAMES,TABLETOPS	t	t	1	ACTIVE	5	f	145
3		MAN	GAMES,ANIME,COSPLAY,TABLETOPS,SUPERHEROES	f	t	0	ACTIVE	1	f	3
148	0491888398	MAN	GAMES,ANIME,TABLETOPS	t	t	1	ACTIVE	5	f	148
149	0496043241	MAN	GAMES,ANIME,TABLETOPS,SUPERHEROES	f	t	1	ACTIVE	5	f	149
112	0493887311	MAN	GAMES,COSPLAY,TABLETOPS	f	t	1	ACTIVE	4	f	112
45		MAN	GAMES,ANIME,TABLETOPS,SUPERHEROES	f	t	1	ACTIVE	4	f	45
379	0487534995		GAMES,TABLETOPS	f	t	0	ACTIVE	4	f	379
722	0467024090	VROUW	GAMES,ANIME,COSPLAY	t	t	1	ACTIVE	4	f	722
5	0487454911	MAN	GAMES,TABLETOPS,SUPERHEROES	t	t	0	ACTIVE	3	f	5
4	/			t	t	0	ACTIVE	1	f	4
222	0484704046	MAN	GAMES	t	t	1	ACTIVE	5	f	222
365	wil je wel he ;)	MAN		f	t	1	ACTIVE	4	f	365
652	0456020656	VROUW	GAMES,ANIME	t	t	1	ACTIVE	4	f	652
371		MAN	GAMES,ANIME	f	t	1	ACTIVE	4	f	371
331		MAN	GAMES,ANIME,TABLETOPS,SUPERHEROES	f	t	0	DISABLED	4	f	331
227	0491939810	MAN	GAMES	t	t	1	ACTIVE	5	f	227
450	+32475965706	MAN	GAMES,ANIME	t	t	1	ACTIVE	5	f	450
223	0470772899	MAN	GAMES,COSPLAY,SUPERHEROES	t	t	1	ACTIVE	4	f	223
383		MAN	GAMES,TABLETOPS	f	t	1	ACTIVE	4	f	383
366	0468233552	ANDERS	GAMES,ANIME,COSPLAY,TABLETOPS,SUPERHEROES	f	t	2	ACTIVE	4	f	366
221		VROUW		f	t	0	ACTIVE	3	f	221
1				f	t	0	ACTIVE	1	f	1
381		MAN	GAMES	f	t	1	ACTIVE	4	f	381
368		MAN	GAMES,TABLETOPS	f	t	1	ACTIVE	5	f	368
147	0472605976	MAN	GAMES,ANIME,COSPLAY	t	t	1	ACTIVE	4	f	147
367	+32475772857	VROUW	GAMES,COSPLAY	f	t	1	ACTIVE	4	f	367
332	0476025721	MAN	GAMES,COSPLAY,TABLETOPS,SUPERHEROES	t	t	1	ACTIVE	4	f	332
374	+32 483 27 49 18	MAN	GAMES,COSPLAY,TABLETOPS	t	t	1	ACTIVE	4	f	374
294	0498065464	ANDERS	GAMES,COSPLAY,TABLETOPS	f	t	1	ACTIVE	4	f	294
216		VROUW	GAMES,COSPLAY,TABLETOPS,SUPERHEROES	f	t	1	ACTIVE	4	f	216
382		VROUW	GAMES,ANIME,COSPLAY,TABLETOPS,SUPERHEROES	f	t	1	ACTIVE	4	f	382
376		MAN	GAMES,ANIME,COSPLAY,TABLETOPS,SUPERHEROES	t	t	1	ACTIVE	4	f	376
415		MAN	GAMES,TABLETOPS	t	t	1	ACTIVE	5	f	415
416	0456 20 79 53	MAN	GAMES,ANIME,TABLETOPS,SUPERHEROES	t	t	1	ACTIVE	5	f	416
484		MAN	GAMES	f	t	1	ACTIVE	5	f	484
517	0483534618	VROUW	GAMES,ANIME,COSPLAY	f	t	1	ACTIVE	5	f	517
2		MAN	GAMES,TABLETOPS	f	t	0	ACTIVE	1	f	2
451		VROUW	GAMES,TABLETOPS	f	t	1	ACTIVE	4	f	451
330	477098787	VROUW	GAMES,ANIME,COSPLAY,TABLETOPS,SUPERHEROES	f	t	1	ACTIVE	4	f	330
618	0493483479	MAN	GAMES,COSPLAY	f	t	1	ACTIVE	5	f	618
651		MAN	GAMES,ANIME,TABLETOPS,SUPERHEROES	t	t	1	ACTIVE	5	f	651
751	0493930698	MAN	GAMES,ANIME,SUPERHEROES	f	t	1	ACTIVE	4	f	751
8	+32483274918	MAN	GAMES,TABLETOPS	t	t	0	ACTIVE	3	f	8
742		MAN	GAMES	f	t	1	ACTIVE	4	f	742
748	0493068667	MAN	GAMES,ANIME,TABLETOPS	t	t	1	ACTIVE	4	f	748
686		MAN	GAMES	f	t	0	ACTIVE	4	f	686
749	0472523735	MAN	GAMES,ANIME,COSPLAY,SUPERHEROES	t	t	1	ACTIVE	4	f	749
736		MAN	GAMES,ANIME,COSPLAY,TABLETOPS,SUPERHEROES	f	t	1	ACTIVE	4	f	736
730	0456094674	ANDERS	GAMES,ANIME,COSPLAY	t	t	1	ACTIVE	4	f	730
735	0493930698	MAN	GAMES,ANIME,SUPERHEROES	f	t	1	ACTIVE	4	f	735
225				f	f	0	ACTIVE	5	f	225
724			GAMES	f	t	1	ACTIVE	4	f	724
111				f	f	0	ACTIVE	5	f	111
550				f	f	1	ACTIVE	4	f	550
146				f	f	0	ACTIVE	5	f	146
380		VROUW	GAMES,TABLETOPS,SUPERHEROES	t	t	0	ACTIVE	4	f	380
727				f	f	1	ACTIVE	5	f	727
746	0467024090	VROUW	GAMES,ANIME,COSPLAY	t	t	1	ACTIVE	4	f	746
743	0470742664	VROUW	GAMES,ANIME,COSPLAY	t	t	1	ACTIVE	4	f	743
372		MAN	GAMES	t	t	1	ACTIVE	4	f	372
375	0493930698	MAN	GAMES,ANIME,TABLETOPS,SUPERHEROES	t	t	1	ACTIVE	4	f	375
725	+32 497 42 33 30	MAN	GAMES,ANIME,COSPLAY,TABLETOPS,SUPERHEROES	t	t	1	ACTIVE	4	f	725
728		VROUW	GAMES,ANIME,COSPLAY,TABLETOPS,SUPERHEROES	t	t	1	ACTIVE	4	f	728
756			GAMES	f	t	1	ACTIVE	4	f	756
737		MAN	GAMES,ANIME,COSPLAY,SUPERHEROES	f	t	1	ACTIVE	4	f	737
755		ANDERS	ANIME	f	t	1	ACTIVE	4	f	755
754		ANDERS	GAMES,ANIME,COSPLAY,TABLETOPS,SUPERHEROES	f	t	1	ACTIVE	4	f	754
753			GAMES	f	t	1	ACTIVE	4	f	753
747	0456020656	VROUW	GAMES,ANIME,COSPLAY	f	t	1	ACTIVE	4	f	747
732	0468313296	VROUW	GAMES	f	t	1	ACTIVE	4	f	732
745	0467024090	VROUW	GAMES,ANIME,COSPLAY	t	t	1	ACTIVE	4	f	745
741	0468107299	MAN	GAMES,ANIME,COSPLAY,TABLETOPS,SUPERHEROES	f	t	1	ACTIVE	4	f	741
729		MAN	GAMES,ANIME,COSPLAY	t	t	1	ACTIVE	4	f	729
739	0488720760	MAN	GAMES	f	t	2	ACTIVE	4	f	739
752	0474817083	ANDERS	GAMES,ANIME,COSPLAY,SUPERHEROES	f	t	1	ACTIVE	4	f	752
329		MAN	GAMES,TABLETOPS	f	t	1	ACTIVE	4	f	329
726	0493450160	VROUW	GAMES,ANIME,COSPLAY,TABLETOPS,SUPERHEROES	f	t	1	ACTIVE	4	f	726
733	0474817083	VROUW	GAMES,ANIME,COSPLAY,SUPERHEROES	t	t	1	ACTIVE	4	f	733
721	0479090722	VROUW	GAMES,ANIME,SUPERHEROES	f	t	1	ACTIVE	4	f	721
723	0470652745	MAN	GAMES,ANIME,TABLETOPS,SUPERHEROES	t	t	1	ACTIVE	4	f	723
378	0483385018	MAN	GAMES,ANIME,COSPLAY,TABLETOPS,SUPERHEROES	t	t	1	ACTIVE	4	f	378
373	0486031632	MAN	GAMES,TABLETOPS	t	t	1	ACTIVE	4	f	373
370	+32468354292	MAN	GAMES,ANIME,COSPLAY,TABLETOPS,SUPERHEROES	f	t	1	ACTIVE	4	f	370
551	0467049102	MAN	GAMES	f	t	2	ACTIVE	4	f	551
552		MAN	GAMES,TABLETOPS,SUPERHEROES	t	t	1	ACTIVE	4	f	552
585		VROUW	GAMES	f	t	1	ACTIVE	4	f	585
685	+32468484518	MAN	GAMES,ANIME,COSPLAY	t	t	1	ACTIVE	4	f	685
219	0472978183	VROUW	GAMES,ANIME,COSPLAY	t	t	1	ACTIVE	4	f	219
719		MAN	GAMES,ANIME,TABLETOPS	t	t	1	ACTIVE	4	f	719
720	0470742664	VROUW	GAMES,COSPLAY,TABLETOPS	t	t	1	ACTIVE	4	f	720
369	0487454911	MAN	GAMES,TABLETOPS,SUPERHEROES	t	t	1	ACTIVE	4	f	369
740		MAN	GAMES,TABLETOPS,SUPERHEROES	f	t	1	ACTIVE	4	f	740
757			GAMES,TABLETOPS,SUPERHEROES	f	t	1	ACTIVE	4	f	757
734		MAN	GAMES,ANIME,COSPLAY,TABLETOPS,SUPERHEROES	f	t	1	ACTIVE	4	f	734
750	0492874049	MAN	GAMES,ANIME,COSPLAY,TABLETOPS,SUPERHEROES	t	t	1	ACTIVE	4	f	750
731	0492787667	MAN	GAMES,ANIME,COSPLAY,TABLETOPS,SUPERHEROES	t	t	1	ACTIVE	4	f	731
744	0469441857	MAN	GAMES,ANIME,COSPLAY,TABLETOPS,SUPERHEROES	f	t	1	ACTIVE	4	f	744
738	488977883	VROUW	GAMES,SUPERHEROES	f	t	1	ACTIVE	4	f	738
\.


--
-- Data for Name: Backend_round; Type: TABLE DATA; Schema: public; Owner: jormungandr
--

COPY public."Backend_round" (id, titel, actief, visible, resultatenactief, election_id) FROM stdin;
\.


--
-- Data for Name: Backend_sponsor; Type: TABLE DATA; Schema: public; Owner: jormungandr
--

COPY public."Backend_sponsor" (id, name, website, logo, inverted_color) FROM stdin;
178	9. Studentendrukker	https://studentendrukker.be	sponsor/Studentendrukker.png	f
2	1. HOGENT	https://www.hogent.be/	sponsor/HoGent.png	t
1	Comic Sans	https://cafecomicsans.be/	sponsor/ComicSans.png	f
3	Vrolijke Viking	https://www.devrolijkeviking.be	sponsor/VrolijkeViking_logo.png	f
4	delaware	https://www.delaware.pro/en-be	sponsor/delaware.png	f
142	SEPP	https://www.linkedin.com/in/sepp-degroote/	sponsor/profielfoto_center.png	f
\.


--
-- Data for Name: Backend_uservotes; Type: TABLE DATA; Schema: public; Owner: jormungandr
--

COPY public."Backend_uservotes" (id, votes, round_id, user_id) FROM stdin;
\.


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: jormungandr
--

COPY public.auth_group (id, name) FROM stdin;
1	SponsorAanpasser
2	MediaAanpasser
3	Kiescomite
4	ICT
5	EventAanpasser
6	ContentAanpasser
7	Aanpassers
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: jormungandr
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
1	1	65
2	1	66
3	1	67
4	1	68
5	2	77
6	2	45
7	2	46
8	2	48
9	2	47
10	2	78
11	2	79
12	2	80
13	4	1
14	4	2
15	4	3
16	4	4
17	4	5
18	4	6
19	4	7
20	4	8
21	4	9
22	4	10
23	4	11
24	4	12
25	4	13
26	4	14
27	4	15
28	4	16
29	4	17
30	4	18
31	4	19
32	4	20
33	4	21
34	4	22
35	4	23
36	4	24
37	4	25
38	4	26
39	4	27
40	4	28
41	4	29
42	4	30
43	4	31
44	4	32
45	4	61
46	4	62
47	4	63
48	4	64
49	4	69
50	4	70
51	4	71
52	4	72
53	4	93
54	4	94
55	4	95
56	4	96
57	4	97
58	4	98
59	4	99
60	4	100
61	5	33
62	5	34
63	5	35
64	5	36
65	5	68
66	5	89
67	5	90
68	5	91
69	5	92
70	6	68
71	6	41
72	6	42
73	6	43
74	6	44
75	6	81
76	6	82
77	6	83
78	6	84
79	6	25
80	6	26
81	6	27
82	6	28
83	7	25
84	7	26
85	7	27
86	7	28
87	7	33
88	7	34
89	7	35
90	7	36
91	7	45
92	7	46
93	7	47
94	7	48
95	7	65
96	7	66
97	7	67
98	7	68
99	7	77
100	7	78
101	7	79
102	7	80
103	7	89
104	7	90
105	7	91
106	7	92
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: jormungandr
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add Custom Pagina	7	add_cms
26	Can change Custom Pagina	7	change_cms
27	Can delete Custom Pagina	7	delete_cms
28	Can view Custom Pagina	7	view_cms
29	Can add election	8	add_election
30	Can change election	8	change_election
31	Can delete election	8	delete_election
32	Can view election	8	view_election
33	Can add Event Genre	9	add_eventgenre
34	Can change Event Genre	9	change_eventgenre
35	Can delete Event Genre	9	delete_eventgenre
36	Can view Event Genre	9	view_eventgenre
37	Can add footer page	10	add_footerpage
38	Can change footer page	10	change_footerpage
39	Can delete footer page	10	delete_footerpage
40	Can view footer page	10	view_footerpage
41	Can add Menu Header	11	add_navtopitem
42	Can change Menu Header	11	change_navtopitem
43	Can delete Menu Header	11	delete_navtopitem
44	Can view Menu Header	11	view_navtopitem
45	Can add Photo Album	12	add_photoalbum
46	Can change Photo Album	12	change_photoalbum
47	Can delete Photo Album	12	delete_photoalbum
48	Can view Photo Album	12	view_photoalbum
49	Can add Praesidium Functie	13	add_praesidiumfunction
50	Can change Praesidium Functie	13	change_praesidiumfunction
51	Can delete Praesidium Functie	13	delete_praesidiumfunction
52	Can view Praesidium Functie	13	view_praesidiumfunction
53	Can add Data Praesidium Lid	14	add_praesidiummember
54	Can change Data Praesidium Lid	14	change_praesidiummember
55	Can delete Data Praesidium Lid	14	delete_praesidiummember
56	Can view Data Praesidium Lid	14	view_praesidiummember
57	Can add Praesidium Werkjaar	15	add_praesidiumyear
58	Can change Praesidium Werkjaar	15	change_praesidiumyear
59	Can delete Praesidium Werkjaar	15	delete_praesidiumyear
60	Can view Praesidium Werkjaar	15	view_praesidiumyear
61	Can add round	16	add_round
62	Can change round	16	change_round
63	Can delete round	16	delete_round
64	Can view round	16	view_round
65	Can add sponsor	17	add_sponsor
66	Can change sponsor	17	change_sponsor
67	Can delete sponsor	17	delete_sponsor
68	Can view sponsor	17	view_sponsor
69	Can add profile	18	add_profile
70	Can change profile	18	change_profile
71	Can delete profile	18	delete_profile
72	Can view profile	18	view_profile
73	Can add Praesidium Lid	19	add_praesidiumfunctionyearmember
74	Can change Praesidium Lid	19	change_praesidiumfunctionyearmember
75	Can delete Praesidium Lid	19	delete_praesidiumfunctionyearmember
76	Can view Praesidium Lid	19	view_praesidiumfunctionyearmember
77	Can add picture	20	add_picture
78	Can change picture	20	change_picture
79	Can delete picture	20	delete_picture
80	Can view picture	20	view_picture
81	Can add Menu Item	21	add_navsubitem
82	Can change Menu Item	21	change_navsubitem
83	Can delete Menu Item	21	delete_navsubitem
84	Can view Menu Item	21	view_navsubitem
85	Can add graph node	22	add_graphnode
86	Can change graph node	22	change_graphnode
87	Can delete graph node	22	delete_graphnode
88	Can view graph node	22	view_graphnode
89	Can add event	23	add_event
90	Can change event	23	change_event
91	Can delete event	23	delete_event
92	Can view event	23	view_event
93	Can add choice	24	add_choice
94	Can change choice	24	change_choice
95	Can delete choice	24	delete_choice
96	Can view choice	24	view_choice
97	Can add user votes	25	add_uservotes
98	Can change user votes	25	change_uservotes
99	Can delete user votes	25	delete_uservotes
100	Can view user votes	25	view_uservotes
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: jormungandr
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
225	pbkdf2_sha256$260000$UUzO0nAqvbZ9jaIXHAV4wg$bRZD4Q4eevCgPsC2wyRUeO+ocZyKzLmhEE++oIaBw/0=	2024-12-06 09:40:50.107776+00	f	zonder				f	t	2024-12-06 09:40:49.755581+00
227	pbkdf2_sha256$260000$iqolS4JI2uOprQZM7DU9aF$TdTHfmtJkBO8VDn6lAVTi20vrdH/l2hNcXJUSondPXc=	2025-01-06 20:02:02.018822+00	f	JonathanS	jonathan	samyn	samyn.jonathan@gmail.com	f	t	2025-01-06 20:02:01.548259+00
45	pbkdf2_sha256$260000$yurg416Rvmu6pvYGu8RPQz$XgW96MJ3XGXCEv3UBMtBhMwv0esIMutT4r/uSr2wAyc=	2023-01-31 19:57:23.492844+00	f	ItsJerkie	Jerko	Marain	jerkomarain@hotmail.com	f	t	2023-01-31 19:57:21.609593+00
216	pbkdf2_sha256$260000$vTZBA43x4giqFYlTPRWwnO$a5Dfd5Ljr5XH7Rw0t5QqRSj4C3s96RRJHcyZzJDN7V8=	2026-05-21 19:15:24.132666+00	f	Brittney001	Britt	Emanuel	Britt.Emanuel@telenet.be	f	t	2023-11-02 21:12:45.615676+00
146	pbkdf2_sha256$260000$nRJmpaNWDOCq1WNzdWTs4Y$2qPC7UBiVCeulm5VVV+Mg2seSWeqoJ/4/xNGEIVCrvc=	2023-10-05 21:12:12.7766+00	f	melkfles				f	t	2023-10-05 21:12:12.481554+00
5	pbkdf2_sha256$260000$BqBB3zpdK9hOormpsRscBS$AtjyUDoM9UjzOzUke07qB+bnAErD5qymDZsFhWktaS0=	2025-05-24 15:11:42.180807+00	f	quaestor@heimdal.be	Karsten	Depoorter	quaestor@heimdal.be	t	t	2023-01-01 01:27:08+00
111	pbkdf2_sha256$260000$A1o20aw1aeYA29m8rqNdVU$O5nm8PTR/AkJ7lgbxe8cvG+OSnT+NlMKyMGfydFPhVA=	2023-05-03 14:56:21.399778+00	f	Amber1				f	t	2023-05-03 14:56:19.544159+00
1	pbkdf2_sha256$260000$ugcMSCatwrRuRjpDxKTc2n$PREfxuInGTqbC4+H1k98jXDTdeSQdJCxg0Zt4AP9pDM=	2024-03-16 14:51:48.897108+00	t	gate@heimdal.be			gate@heimdal.be	t	t	2022-12-31 16:24:54+00
329	pbkdf2_sha256$260000$yxGEVQ9D4NjQ9if2hgObGl$w86dMu/AczpzlXps4iDCImj2+AsmtseBJtFkEECjJO0=	2025-06-28 17:05:16+00	f	yoran-ollevier	Yoran	Ollevier	yoran.ollevier1@gmail.com	f	t	2025-06-01 17:13:44+00
112	pbkdf2_sha256$260000$x16eJg8ig6s5U0FLgWY3ch$OLgOaceoZCj2+TP0yFW5ky2POPMax07MW4RFW2Q6mW4=	2023-05-14 15:43:22.181579+00	f	TheSilverfang	Jakob	Van der Vennet	jakob@vandervennet.be	f	t	2023-05-14 15:43:21.181772+00
147	pbkdf2_sha256$260000$cEu3p0YdxYAGVGD6mQjUi7$P6Ce4eeBKZH3tHcSC0eDFcpDSavW72UMW4GSw4jSqdg=	2023-10-07 10:31:30.006959+00	f	briekdc	Briek	De Clercq	briekdc@gmail.com	f	t	2023-10-07 10:31:29.713698+00
10	pbkdf2_sha256$260000$6gaAejWUtzZwUmqQL29nVQ$EEyWia0oQDZCIp/WtPBkr/3LVGrf+ge00OomsWH0BUQ=	2026-05-24 22:33:45.289755+00	f	pr@heimdal.be	Mauro	Maratta	pr@heimdal.be	t	t	2023-01-01 01:33:58+00
328	pbkdf2_sha256$260000$7CbtCfCxfitM7ZmNEDV0vZ$6B1Q8PEhv5V4YK65PS+kXQX4z+KMhnnU7P2Y6wIhNKk=	2026-05-18 20:18:05.247137+00	f	Zeaya	Zeaya	Nys	nyszeaya@gmail.com	f	t	2025-04-30 12:33:29.486947+00
721	pbkdf2_sha256$260000$RL3R2k5NHXdkjZiTFS8e86$BsIODXwIAW+PuNI80zTlA2NTvI3vM9Yf8It/K+n0TS8=	2026-05-15 15:10:05.169732+00	f	Tine	Tine	Van Nevel	tine.vannevel@outlook.com	f	t	2026-05-15 15:10:04.863438+00
224	pbkdf2_sha256$260000$hajLVtOR1llptbBFgZ7nOn$sMbt5aIVoDuKmle5Q4YMcR3lIMSMO3F30W2AfkpSPzU=	2024-10-15 08:31:43.751801+00	f	Nikki	Nikki	Stuster	stuster@live.be	f	t	2024-10-15 08:31:43.430605+00
148	pbkdf2_sha256$260000$OLCRLAfP30K1zOpWetm69W$QGIBFX30aiZufqERSu1VI+Qs9g2I011sYq9EBDkKzqc=	2023-10-11 11:42:08.255866+00	f	Fentomized	Martijn	Jiang	martiijnjiang@gmail.com	f	t	2023-10-11 11:42:07.962504+00
145	pbkdf2_sha256$260000$5RSNmnIDBtPwjDPkLk2Lsb$Mmeux4Cx+9dvYFyne1YoMjKU0r2U/shYqOueBuU3pco=	2023-10-03 12:18:55.100347+00	f	emperion	cody	Decreton	mistik.personal@gmail.com	f	t	2023-10-03 12:18:54.809067+00
723	pbkdf2_sha256$260000$FDoSeykXycnZ4Ias701Lrv$wpEfVqrDy4Pap/oxWd3oMj2bcy5Rqm/62Ef6kkBcbCM=	2026-05-23 16:21:08.227524+00	f	Lobski	Robbe	Van Droogenbroeck	robbekeb2004@hotmail.com	f	t	2026-05-15 17:30:02.232862+00
228	pbkdf2_sha256$260000$QuoE3pDwIkix1PVwe0cnFQ$hv5v70zH6j7RRs3L9uWfiksG6wpWqgweuxI/gEjpd3c=	2025-01-23 18:37:21.873046+00	f	Linkal057	Alejandro	De Bruyne	alejandro.de.bruyne@telenet.be	f	t	2025-01-23 18:37:21.492036+00
7	pbkdf2_sha256$260000$mEYu3q1kvzkec9ElH7QXtz$1kM6X98enFm2ApiYfrvxIN9Q9XbJ1Tqe53F99CGUFGg=	2026-05-24 10:29:59.085064+00	f	sport@heimdal.be	Shanty	Laureyns	sport@heimdal.be	t	t	2023-01-01 01:31:12+00
149	pbkdf2_sha256$260000$DKcajcQ4ETGCBMMJMAFS7j$svUQ0bTLIBeKnTd4kiNT6rMXy/abzuiwdqUvk7b+OgQ=	2023-10-13 09:39:30.642432+00	f	lightreaver45	Keanan	Callebout	keanan.callebout@gmail.com	f	t	2023-10-13 09:39:30.34169+00
4	pbkdf2_sha256$260000$umU6EiMjtTVSz42VzuMF8t$Zd/nKZBjuDWCIWlrDQdPDvq3x8VmZoAe5XibNu7cncg=	2024-12-11 14:00:34+00	t	vice-praeses@heimdal.be	Axelle	Ducouran	vice-praeses@heimdal.be	t	t	2023-01-01 01:18:13+00
220	pbkdf2_sha256$260000$knB6R9EZmmH24tfjcxfAuF$AqejXxKvodjzkhbFBoEVsH/PAvPZjwBZRlS2zk1+5Ks=	2024-09-18 15:18:17.605634+00	f	tomm	Thomas	Pauwels	thomas.pauwels@outlook.com	f	t	2024-09-18 15:18:17.31072+00
222	pbkdf2_sha256$260000$RaPZ0VO5MPqBhuouXeE1OG$dhHwhUTRMTHuX3WHGJjRV/Tz4kOZS2pNPADeVMF8DkI=	2024-10-02 20:43:41.394748+00	f	Sandwich	Kenji	De Vos	Kenjidv12@gmail.com	f	t	2024-10-02 20:43:41.037818+00
217	pbkdf2_sha256$260000$uC6XQOaiQpKVquf7GT7rAt$rOOpofj+kPfgB8C5S8r3nOsD9boA78SiLGF3lzH4o+I=	2025-06-02 14:10:16.361595+00	f	diede	Diede	Devriendt	diede.devriendt@icloud.com	f	t	2023-12-10 17:52:56.599382+00
11	pbkdf2_sha256$260000$fxsageFZ2b7mPyOD8mTnwt$icSlUFre9tWTP0Y4ZLhgWqMXq4qxYrvZ1QgRb4MMlp8=	2026-06-05 15:54:05.751231+00	f	cultuur@heimdal.be	Milan	Dhondt	cultuur@heimdal.be	t	t	2023-01-01 01:34:55+00
12	pbkdf2_sha256$260000$c40vuFcS9BjyZt5dkRLbXe$7hCTfCugZWHCLch+G2v23QdHAPMGYNjqnvfpQgJqJ5Y=	2025-04-04 17:31:12+00	f	Tyra	Tyra	Bourgeois	bourgeois.tyra1@gmail.com	f	t	2023-01-10 11:12:26+00
219	pbkdf2_sha256$260000$PcKDxcNeU5JvY4eNDzWRHI$P2p7ZyZ7DR8sHlmDbZGVUX5CEygs8xtDYdN3UN6xUlQ=	2026-05-23 16:23:07.651402+00	f	PhantomBun	Amber	D'Hondt	amber.dhondt.zenner@gmail.com	f	t	2024-09-09 16:26:41.889324+00
223	pbkdf2_sha256$260000$b7E0t0bMrXJZDTw4HMv5en$3le0OEuvhEXWjOAUTdjl5XNjzAWzrYmdMglHI3AXSIc=	2024-10-11 16:20:49.82504+00	f	Zr0_H0TD0G	Aaron	Van Goethem	aaron.vangoethem06@gmail.com	f	t	2024-10-11 16:20:49.529455+00
3	pbkdf2_sha256$260000$srfJ65e9KtupgUIIJYkI2i$Sl1TGULhrE8isB7CZRdRTQijNvSjQP0CEu4N1lk9sRE=	2026-05-23 13:36:14+00	t	praeses@heimdal.be	Richy	Rahman	praeses@heimdal.be	t	t	2023-01-01 01:16:59+00
8	pbkdf2_sha256$260000$s88u0lPXnzrKnh54mhPkZP$DK+z9ASrNr6oF5qC4b3wd98Y1ntoYQYsZIsxcTe5VOs=	2026-05-12 19:57:07+00	f	schachtentemmer@heimdal.be	Kobe	Maebe	schachtentemmer@heimdal.be	t	t	2023-01-01 01:32:08+00
6	pbkdf2_sha256$260000$51MVZp2bNJOXbTpPh9G9q7$maeprwJRZmhmozdqNaNo0MKULHNclEhzK9CMWNvWaIc=	2026-05-29 18:49:34.235657+00	f	secretaris@heimdal.be	Marwan	Elkhallouki	secretaris@heimdal.be	t	t	2023-01-01 01:28:04+00
294	pbkdf2_sha256$260000$wPKzPGZGDXxeDvipuzCtMy$j/a8BAuiZioqRsSqeBZQWTOUYFmgvXXN5m5nxkucznY=	2025-04-09 19:19:15.630597+00	f	justcats	Jasper	Van der Stichelen	vdsjasper@outlook.com	f	t	2025-04-09 19:19:14.835031+00
226	pbkdf2_sha256$260000$uu3ZHjLW7mTvXK7aK8NP8j$VbcgXFGBi40+YIGvx8Ofeyz8cO1Sv+WrPlstTJazS4k=	2026-03-27 07:39:48.596093+00	f	tijl.zwartjes4@gmail.com	Tijl	Zwartjes	tijl.zwartjes4@gmail.com	f	t	2024-12-10 14:07:37.631323+00
327	pbkdf2_sha256$260000$EqpOsFC8kZ5p6MZ9yWo8og$qSKmZ+8os6aw02WZA3lCRX0S4Js5q8W79NKu49uM5XI=	2025-04-29 16:28:46.130197+00	f	simpel1521_	Brecht	Huys	brechthuys30@gmail.com	f	t	2025-04-29 16:28:45.765305+00
720	pbkdf2_sha256$260000$tx4IFhO0H3jhBJPWBFzSbZ$PGBAfxleVm7UQbr5Zi427cRK7B10o5c8YNiYAn2zyaY=	2026-05-15 11:04:12.082071+00	f	laureynsshanty@gmail.com	Shanty	Laureyns	laureynsshanty@gmail.com	f	t	2026-05-15 11:04:11.441228+00
9	pbkdf2_sha256$260000$zyElYtolWRstkHT0fZTtRl$P+BDs8F7b0VNPZgCBV+bHdExg39/xXeJOLQG5cw0Wp8=	2025-05-24 14:30:41+00	f	feest-lan@heimdal.be	Ricardo	De Blust	feest-lan@heimdal.be	t	t	2023-01-01 01:33:03+00
722	pbkdf2_sha256$260000$qQfuC73xUVqXI6zJO4TeEI$HHctsLJUG5SvL0+cnpJgMN/j+Bt8ZvhPoyFfPeJPgIU=	2026-05-15 17:29:52.377392+00	f	naomi.vk	Naomi	Van Kerckhove	naomi.van.kerckhove@gmail.com	f	t	2026-05-15 17:29:52.043535+00
221	pbkdf2_sha256$260000$qvdaobtF6cptrDRYygx7GI$DKOhtP29Zb5U/YbW0oY3/aGAdlB/LN0jBY/BxSNGEa8=	2026-05-15 20:19:42+00	f	media@heimdal.be	Vincent	Minjauw	media@heimdal.be	t	t	2024-09-21 16:36:15+00
550	pbkdf2_sha256$260000$lxX1VfYEqiZqwsr4VzbU3d$aewuJCKHKAipx8l/4ceY980TdjvIlMpDg5ul9D+AMBo=	2025-12-04 12:24:30.512574+00	f	Sepp				f	t	2025-12-04 12:24:30.215885+00
451	pbkdf2_sha256$260000$U7AYk4AmlWn18sV2OzxrYh$NKjCsFqKjGUO6ErO5OZpduL0vgHAlA+FoxOfX79uWeo=	2025-09-24 22:24:03.801829+00	f	Demi	Demi	Eller	demieller2004@gmail.com	f	t	2025-09-24 22:24:03.486386+00
373	pbkdf2_sha256$260000$GVEd1DlXicdb9yms0hBAfB$T3bVSFz6NlDuArdcBgJlzCr7Rh8JgDNlU3d9qXMKbmQ=	2026-05-23 16:32:55.877556+00	f	ricardo.deblust6@gmail.com	Ricardo	De Blust	ricardo.deblust6@gmail.com	f	t	2025-06-28 14:54:54.655876+00
378	pbkdf2_sha256$260000$6YBAm8JZQVXzO7WkVFa240$E/SbH8LuQi+vrOj7jVBFkzU/kbhn6wO5aaom3o9lTMQ=	2026-05-23 16:48:20.515657+00	f	richmanswagger27	Richy	Rahman	richyrahman27@gmail.com	f	t	2025-06-28 16:20:07.124109+00
376	pbkdf2_sha256$260000$UxB3tIPsD91f5xEyBxLC2g$U7J/P4cbmm7EGzDIfTQ/Vt+sKv9yF8B/f9vt0ImXIiw=	2026-05-23 18:24:44.589211+00	f	goossens.rein@gmail.com	Rein	Goossens	goossens.rein@gmail.com	f	t	2025-06-28 15:53:50.609468+00
377	pbkdf2_sha256$260000$Rm5LVFqXJPH6DkLltoRWFe$dFI2hwkHqP9RluyAg/gdgPqOQ952fdFKHOjTmjTRGA0=	2025-06-28 16:03:25.302535+00	f	loyay45902@ofacer.com	Bram	Volmacht	loyay45902@ofacer.com	f	t	2025-06-28 16:03:24.957111+00
383	pbkdf2_sha256$260000$Wm65g0s0llAGmV7F7gHwMj$lZUkiHI7v5BY0H/dFG1xUIVyNBjQo9KVNfnVVoG8i8g=	2025-06-28 17:00:53.835848+00	f	Wahurt	Wout	Hancart	hanwo.evhal@gmail.com	f	t	2025-06-28 17:00:53.523724+00
368	pbkdf2_sha256$260000$fnda25bVeTDgunUl5McyZT$dbK1FkgqvVLQB1E1Hs88m5XSOYSgd14sYWP0YWGaQTs=	2025-06-27 12:42:06.77792+00	f	Theovanegdom	Theo	Van Egdom	theo.vanegdom@gmail.com	f	t	2025-06-27 12:42:06.419552+00
375	pbkdf2_sha256$260000$p5iMv5Wodyi0oAEQV9qLan$jKwklFsbtpupIPFG26MxJpAdbEZ1TC244rWUTA/6UeQ=	2025-06-28 15:25:16.224682+00	f	Kobemaebe	Kobe	Maebe	kobe.maebe@gmail.com	f	t	2025-06-28 15:25:15.927977+00
719	pbkdf2_sha256$260000$lYHP3TmzpNwdgEzVMr6mQI$VAHvhlKhb/5SIe9DIoBK8QehjTANEpmD2qD+Is5yQjw=	2026-05-16 18:05:24.226243+00	f	MaMarat	Mauro	Maratta	mamarat@duck.com	f	t	2026-05-13 13:23:31.259914+00
331	pbkdf2_sha256$260000$1jWauGPZra65NGHmMeAbQG$Zn8eOkrtNVXO87uSGDBSm/OvbuCw8gIihX/cPpz6TP4=	2026-05-16 12:25:52.939063+00	f	BennyDB	Benny	De Bock	de.bock.benny@gmail.com	f	t	2025-06-02 13:31:48.431788+00
371	pbkdf2_sha256$260000$O4ANx4lctrgJgz9CwLaAcj$gkFM8FRUQVjBBj+TYEKrGjzMZnOY1JBTOr/B6XZZIcI=	2025-06-28 14:30:13.346398+00	f	Sacha	Sacha	Everaert	sachaeveraert@gmail.com	f	t	2025-06-28 14:30:13.037012+00
372	pbkdf2_sha256$260000$FUn1t9muDIAnLjTWXpdOKa$/VT5EKE9efuo6yM87qPLOp0r+R5GF8BIug3lz5x68hU=	2025-06-28 14:31:08.414064+00	f	VincentMinjauw	Vincent	minjauw	minjauw.vincent@gmail.com	f	t	2025-06-28 14:31:08.096406+00
552	pbkdf2_sha256$260000$32loOQ02qoIz0E2VAWhUuA$Uh/Eb5JGaMnXxIViiddOzyuGmt8KoMnJQ0BIdsSKtfQ=	2026-05-23 13:37:46.389556+00	f	milandhondt	Milan	Dhondt	dhondt.milan@protonmail.com	f	t	2025-12-05 21:51:44.949642+00
332	pbkdf2_sha256$260000$Grs6NdchXN0btsKRLs4I07$EUcgGREz9V/cFBkRfkv5dOBNRJtxHbECikRPv9pt85U=	2026-05-26 13:38:56+00	f	SanderDeBruyker	Sander	De Bruyker	sandeman.9@gmail.com	f	t	2025-06-02 13:39:34+00
685	pbkdf2_sha256$260000$laQr0dI8LitCBHCAiLirwf$a761I0ozYARyT7F5mjxT9cD/G3nW9k5QV5HBs0aXSFs=	2026-05-23 16:24:43.358569+00	f	Tokkertje123	Toon	Dendoncker	toon.dendoncker2012@gmail.com	f	t	2026-04-25 13:31:58.59384+00
415	pbkdf2_sha256$260000$kox0eDdnajRVSISJKrbyMR$nyhjA7Q5Iv1BqiuN9CDrccTb0yjmOt/VEI6O2jT2O5M=	2025-09-17 09:39:00.157783+00	f	MichaelDB	Michael	De Bruecker	michael.debruecker@student.hogent.be	f	t	2025-09-17 09:38:59.851803+00
380	pbkdf2_sha256$260000$BDRYKwdrlsPXNfYJGiJWkA$xEWL6HjIiVlnOd8lWDD9X+r/bIqwT4jqAg7KirrEjZ8=	2026-05-23 17:10:56+00	f	hayley.rasschaert	Hayley	Rasschaert	hayley.r10@hotmail.com	f	t	2025-06-28 16:30:15+00
381	pbkdf2_sha256$260000$MmRWtU7YhdCbR1QgrKsy75$bYW4pCKHC5UtSi6l2gKmww+LWhKDIQXzN2mSXgYxA0E=	2025-06-28 16:30:22.562093+00	f	NyoVolmacht	Nyo	Volmacht	lisateren@hotmail.be	f	t	2025-06-28 16:30:22.268051+00
618	pbkdf2_sha256$260000$KbM0mBgVk8EMZjnP2qrdiy$IuoY2sFQUfVE+cpXnoyN74T3hLcIpRTNY2iLwzbL1RE=	2026-02-17 06:33:57.014116+00	f	Zepke	Zepke	Braeckman	zepke.braeckman@student.ugent.be	f	t	2026-02-17 06:33:56.600616+00
416	pbkdf2_sha256$260000$PCuw0NVntjk0gslWT9NaDX$Icp7DV0ujqE+7cKWD1wD6qevIIYFU6opM7mt+WKoJf8=	2025-09-17 13:31:04.101422+00	f	Niminamgani	Jarryd	Geurtsen	Jarryd_james@hotmail.com	f	t	2025-09-17 13:31:03.801702+00
686	pbkdf2_sha256$260000$6frUvwiJ5vZKTSMmR08806$u+TtUAnnVRSjlSVVqxXgJ8IoaYu7wzbzjLLn7mWAvdg=	2026-05-23 12:42:46.056826+00	f	TestAccountKiesComité	Test	Account	sander4786@gmail.com	f	t	2026-05-12 13:07:24.877912+00
374	pbkdf2_sha256$260000$JAcZGSzPtEMtaixnNzPIL9$i3scU9afd86DJaGAkpGAcitLVmL5cDxbAozVMEPU31Y=	2026-05-23 15:50:58.583752+00	f	ThePotatoOverlord	Simon	Tytgat	Simontytgat77@gmail.com	f	t	2025-06-28 15:04:56.903968+00
382	pbkdf2_sha256$260000$w4A31cytQQ5kmuxxpqVLB5$XACFi4MUd+4YPB4t49fsfYZZs3l3D4IDyz1WyVmKynE=	2025-06-28 16:59:50.306067+00	f	Amber_dk	Amber	De Kinder	de.kinder.amber@gmail.com	f	t	2025-06-28 16:59:50.013447+00
366	pbkdf2_sha256$260000$qS3UgP0CokEYbSz5KpDT84$PHg2hvkpOnIv30jfwvTnWM7trw2SAiXqeorLcBwU4Q0=	2026-05-23 16:32:56.160669+00	f	MilAAAAAAAAAAAAAAAAAAAAn	Milan	De Smet	milan_de_smet@hotmail.com	f	t	2025-06-15 19:12:31.713853+00
449	pbkdf2_sha256$260000$JBGXmYQfwX9dyBXyRUFId8$JzE84e0DIAAROnUjOkoqY1I9y5Z9lBM7Ffbuccy4emQ=	2025-09-22 07:16:43.955206+00	f	tristan	Tristan	Wiedeman	tristan.wiedeman@student.hogent.be	f	t	2025-09-22 07:16:43.651105+00
484	pbkdf2_sha256$260000$yl13ek9nYfEoUqtSfIRdFt$OMyVgY0hwoMMRw4QfcqsW+WB60B/spfVlsh2h2HBGzg=	2025-10-08 05:11:43.818691+00	f	Demetsie	Gil	De Mets	demetsgil@gmail.com	f	t	2025-10-08 05:11:43.521979+00
450	pbkdf2_sha256$260000$llnkwCQwmlRlZlgrH4EB5c$D4Z2HS6mDGRPmdofm/62/M4jTcXAS79SWaqx3ToHdbY=	2025-09-23 17:13:57.862782+00	f	Owen	Owen	Ide	owenide57@gmail.com	f	t	2025-09-23 17:13:57.577914+00
517	pbkdf2_sha256$260000$nH4Q3EvXEhdTKsQbPmpZ3L$73ypm1BGFoKOvpJdE6T03qQz0RqX1OTomVyi+j8q8sM=	2025-11-01 21:27:01.378705+00	f	Zenna	Zenna	baert	zennabaert1234567890@gmail.com	f	t	2025-11-01 21:27:01.071648+00
585	pbkdf2_sha256$260000$OPVutaKxL4VQCEzxTj4erj$dw4ntBiiCZT2ZeZMINCnHnlelbhGJzodZAxgUJbkNlc=	2026-01-02 19:23:25.22123+00	f	Annsofie.stevens	Ann-Sofie	Stevens	annsofie.stevens@hotmail.com	f	t	2026-01-02 19:23:24.872823+00
370	pbkdf2_sha256$260000$wEksQNbaW2xDmLFOduDULf$TQY4ELKU2Dpo9sBZXMSA3niMrCPQGBuwmIugYiOCn1E=	2026-05-18 19:22:39.01894+00	f	AlejandroDeBruyne	Alejandro	De Bruyne	alejandro.de.bruyne@telenet.be	f	t	2025-06-28 14:29:51.137037+00
651	pbkdf2_sha256$260000$3Fciwqc8XbovkEpOCXSvmG$FjVSqD4zu7gWSZe8DAIEW2woUnglffCXZeGnMko2E5A=	2026-03-08 15:49:55.441017+00	f	enzo_dk	enzo	de keukeleire	enzo.dekeukeleire@icloud.com	f	t	2026-03-08 15:49:54.825701+00
652	pbkdf2_sha256$260000$KT2O7XCB0Z7v9jgxZfinRK$BdiH6YsygSHqKrVxotCpPtpNMIdUC7BnVB/HdbUSFKQ=	2026-03-26 18:50:02.182174+00	f	ziru	Kelsy	Van Bogaert	kelsy.van.bogaert2006@gmail.com	f	t	2026-03-26 18:50:01.815397+00
367	pbkdf2_sha256$260000$kN9hZ8xBK0JA6n6MLVQVDi$2uhaqQW/3/66FygOTw7zTowNHeR2VHaUZPjgRPkpXyQ=	2026-05-23 09:53:35.203108+00	f	LisaLiza	Lisa	Téren	lisa.teren2003@gmail.com	f	t	2025-06-23 12:00:35.600754+00
369	pbkdf2_sha256$260000$tTDDJJaGFQjY7jUNO4cVan$VIkWLtkzlPKtGj9Yq+q37O3VkNRos1JY2T8wzMXrRbs=	2026-05-20 13:42:37.453175+00	f	depoorterkarsten	Karsten	Depoorter	depoorterkarsten@gmail.com	f	t	2025-06-28 14:28:59.023083+00
330	pbkdf2_sha256$260000$52wVBOgzL8CUSPh5d30QaQ$kRuRMcjrGHzgLfpXT4scFEDYc9/45m6NYF/e7784z3c=	2026-05-13 13:22:51.713321+00	f	AdamsMaxe	Maxe	Adams	maxe.adams@gmail.com	f	t	2025-06-01 17:27:43.672384+00
379	pbkdf2_sha256$260000$RKL6V2H2kZHwbCkbMiShyq$S5RSOokiCPMSO35+U4I7oLYEvnksd4gdo5NGrvPv67M=	2026-05-23 12:30:35+00	f	Reina	Reina	Tanghe	reina.tanghe@gmail.com	f	t	2025-06-28 16:27:12+00
365	pbkdf2_sha256$260000$1mvsSYlyTivqNGuaMvaNji$MuUD/3CXqC5WEYuXnvI6IHgQ1W46DxdzRQl0W2nkkM0=	2026-05-23 17:40:43.907748+00	f	Argonai	Aaron	Vandeweghe	argonai+dontsendmeshit@protonmail.com	f	t	2025-06-15 19:12:22.832795+00
724	pbkdf2_sha256$260000$NSPsxvLdUygzz2dkrhLRzm$54tXNiH2hINqsJf2CzUr9osikSiHfD5iFr/vOnJoDlE=	2026-05-15 17:32:11.147448+00	f	jonah.jvdb@gmail.com	Jonah	Van den Brandt	jonah.jvdb@gmail.com	f	t	2026-05-15 17:32:10.850433+00
730	pbkdf2_sha256$260000$R3XkblO2SL0PQX211mbGOz$CwEG5opmtuJBLIfPBFFYGoqsrIVbQvfV7SnvDQ/tGtE=	2026-05-23 16:17:55+00	f	Charlie1212	Charlotte	Ilegems	charlotte.ilegems@gmail.com	f	t	2026-05-18 15:29:28+00
729	pbkdf2_sha256$260000$hbvPCRHNYzVMlZo7JjTDRB$s2D7qKe/Bz0YCA80rktxcH1W1JUl0jOWQxkVi4naP+U=	2026-05-22 19:03:30.350687+00	f	vincent_mijauw	Vincent	Minjauw	vincent.duck2@gmail.com	f	t	2026-05-18 09:01:08.583862+00
727	pbkdf2_sha256$260000$nM1gVnEBQ45Iti6Ykl0si0$lPj1VRM4xm1jBldAdElpoDXkAR9AmnaOKKnQMfPkmrE=	2026-05-15 20:16:15.785234+00	f	ImmortalWhisper				f	t	2026-05-15 20:16:15.484325+00
740	pbkdf2_sha256$260000$YPZ6RAaBS8EO3BDHMrdKLE$/uPc8z0XrDDYuxbaojZZbVUxTFpSSvwIVnIo0c0rPHA=	2026-05-23 17:07:42+00	f	KLAASverwilst	Klaas	Verwilst	klaasverwilst@gmail.com	f	t	2026-05-23 15:12:18+00
755	pbkdf2_sha256$260000$ZsPBwszae9AcqOoHwIvFJd$+u8bBAwkHkDVoJsyP/DsG8q3yzelhDuAdxrKqHyTgvI=	2026-05-23 17:53:03.721714+00	f	VOLMACHTAXELLE	Volmacht	Axelle Ducouran	axelle.ducouran1@gmail.com	f	t	2026-05-23 17:53:02.778732+00
757	pbkdf2_sha256$260000$ZBn39OTB7CxezGqN96FD7q$oZhd92aYaXSIowFHCH97VnMp8Nj5kLxm1asBEbkFUQg=	2026-05-23 17:56:04.878739+00	f	DEMIeller	Demi	Eller	klaasverwilst@gmail.com	f	t	2026-05-23 17:56:04.395586+00
736	pbkdf2_sha256$260000$LBzvcbH6T8bd1yQckIqyQy$a39Tb+MJIU4lXKXEqqdbLLJprrwMWneGpp9qD+cCDHM=	2026-05-23 16:47:15.837939+00	f	seppe.landtsheer@gmail.com	Seppe	Landtsheer	seppe.landtsheer@gmail.com	f	t	2026-05-22 17:24:39.47884+00
753	pbkdf2_sha256$260000$uvs4gddZmtQNxgoCXjIGqs$L+aWZUUwca1qdxSUqvoMSJSZ2i4cSy6vVZhA6s3w9ww=	2026-05-23 17:55:09.344285+00	f	Volmacht_Brittney001	Volmacht Britt	Emanuel	britt.emanuel@telenet.be	f	t	2026-05-23 17:51:53.433865+00
749	pbkdf2_sha256$260000$asR5TaRgAjd13GVHJzpAOs$26NuG2jvNqf4PmgUNsKBV2sryYh9lT926uG7DCAaIxU=	2026-05-23 17:11:19.036814+00	f	notsoglitchy	Jermin	De Witte	dewittejermin@gmail.com	f	t	2026-05-23 17:11:18.389129+00
754	pbkdf2_sha256$260000$nYJtrKb6SzCJDbelqK7EWm$SXZ7OkM/Nhf4jCqw7VlUgzde12ByAtQAa9srhYtRY1M=	2026-05-23 20:03:06.914227+00	f	VolmachtDieSeppeHeeft	Seppe	Volmacht	1234hoedjevanpapier@heimdal.be	f	t	2026-05-23 17:52:38.001148+00
750	pbkdf2_sha256$260000$cRAvRVPAsH4zzBWMK4Vr5B$ziujq22n+eG8IeTMe7CfCpZrScIuEDOIymLkKlyxwvk=	2026-05-23 17:25:35.039079+00	f	warretuybens	Warre	Tuybens	warretuybens@gmail.com	f	t	2026-05-23 17:25:34.472773+00
751	pbkdf2_sha256$260000$Y8KQ0Ydn7mUy15o6ioYI29$lxYjgLQBLRpox/5a6AQN70iq7kUVIyFdaZnbypOGfhg=	2026-05-23 17:51:03.338056+00	f	volmacht_kobemaebe	kobe	maebe	kobe.maebe@gmail.com	f	t	2026-05-23 17:51:02.911707+00
752	pbkdf2_sha256$260000$6b2DuJorhSAndWMWbeqWxn$xw1bokZZem9SFwncPblGJqoqPheiS7MZzbgSBY/rdFc=	2026-05-23 17:51:13.120871+00	f	VolmachtZeaya	Volmacht	Zeaya	nelevdm@hotmail.com	f	t	2026-05-23 17:51:12.819695+00
738	pbkdf2_sha256$260000$Rh2hlkn2QaQ88r186uUybs$WK3cc8Em6ANiHHduxzh+3+QNySzmN19uBjwejQ3TP08=	2026-05-22 19:53:37.284464+00	f	Sarah	Sarah	Pauwels	sarah.pauwels@outlook.com	f	t	2026-05-22 19:51:21.862808+00
743	pbkdf2_sha256$260000$pHXO3kFfDXHKe3281icmqY$JIk15RDHVIXm3HmIzJzf0QRfG8+6mZFXrgPi5JJ7tD4=	2026-05-23 16:21:06.778203+00	f	shnit	Shanty	Laureyns	laureynsshanty@gmail.com	f	t	2026-05-23 16:21:06.182667+00
741	pbkdf2_sha256$260000$gO6KZwU5QaDIOSxXS4rqUP$OBVGHRimlh4XFb4UrVpE0CuYg3uz0RoTfCGWJ4C9N7Y=	2026-05-23 15:51:59.546953+00	f	Brim	Bram	Wuyts	Bram@1236.be	f	t	2026-05-23 15:51:59.173902+00
739	pbkdf2_sha256$260000$998KUFZwDzGTfcrPK4N7Pm$CszgInAX71JRd++VmNjClxWEvJKiBZ+jQCRDBVvGvpE=	2026-05-23 09:52:16.073662+00	f	party	Tanguy	Montaine	netguy@outlook.be	f	t	2026-05-23 09:19:01.526579+00
742	pbkdf2_sha256$260000$4TK42HQ1NdTYCeU5ezEIZy$ICxIXnO+Z2ZU7yyyleXnsvQTi3pA2WgKurOzna/WOjs=	2026-05-23 16:08:39+00	f	jasper	Jasper	Van der Stichelen	vdsjasper@outlook.com	f	t	2026-05-23 16:08:38+00
737	pbkdf2_sha256$260000$Z8O2z31RqMb1Lwc353s8XX$aNL89Vq182e4WxgTKK9ZAn+ERODkxMZ6T4sKqjMbeSE=	2026-05-23 13:36:56.953787+00	f	Brum	Bram	Zeeuwe	bzeeuwe@gmail.com	f	t	2026-05-22 17:38:50.296753+00
725	pbkdf2_sha256$260000$6ILrRcxZjofEFYMLyoy9Ev$A370RHxanMViWDoPFDWTeWMsbfxAZpvOzXHStRl+JHo=	2026-05-23 13:38:00.034199+00	f	MarwanElkhallouki	Marwan	Elkhallouki	marwan.elk2002@gmail.com	f	t	2026-05-15 17:53:18.221208+00
747	pbkdf2_sha256$260000$Ibhm9Xx0yHKaGZsH3NXIJt$sKHER55kMnhLKMSfgdbkbdGLm+nOXKft2WK/+QjeUxM=	2026-05-23 17:16:30.297994+00	f	ziruine	Kelsy	Van Bogaert	kelsy.van.bogaert2006@gmail.com	f	t	2026-05-23 17:04:28.314339+00
748	pbkdf2_sha256$260000$xvSLu5Nukdkutaoy4wjTlD$bXMS9aBY1W2zBmtOlQiBs5EeN8E6aiIRrP9OhYYvFLk=	2026-05-23 17:07:48.639203+00	f	Guus	Guus	Loccufier	guus.loccufier@gmail.com	f	t	2026-05-23 17:07:47.95193+00
744	pbkdf2_sha256$260000$rOBoPVhRAkLlAhy1r8RWfC$EP1XWz4ufJtM2UWLEkla/TDk3Q4JYhEf3jg3zrVAdHs=	2026-05-23 16:24:11.955537+00	f	tejas	Tejas	Rahman	tejasrahman5@gmail.com	f	t	2026-05-23 16:22:50.357906+00
728	pbkdf2_sha256$260000$6VpK9skNgz7Asa1i7gLh89$bFFtinjg3WZLz8+PK65Ow5oP5ziUuNLbLtyciMs6IrI=	2026-05-23 16:32:49.09431+00	f	Aureline	Aureline	Van der Plaetsen	aureline.vanderplaetsen@gmail.com	f	t	2026-05-15 20:20:00.069784+00
746	pbkdf2_sha256$260000$rjwDdpr0oVRGa0V32LBQ4n$GC8g2tyu9T14XS5DM5XLqkTBDoe8gY2bO4s/9VPD3OU=	2026-05-23 17:00:15.221453+00	f	Naomimi	Naomi	Van Kerckhove	naomi.van.kerckhove@gmail.com	f	t	2026-05-23 16:50:27.98791+00
745	pbkdf2_sha256$260000$fHDIyDwInkrCc24fm0jmqv$MikkuNyi8BzS0kCfzN6ONdPBCnYkcOpo5ox4SU086V8=	2026-05-23 18:45:03.519714+00	f	naomi.van.kerckhove@gmail.com	Naomi	Van Kerckhove	naomi.van.kerckhove@gmail.com	f	t	2026-05-23 16:38:36.954119+00
731	pbkdf2_sha256$260000$wi1DAuPTW7cGLmO3d5im0v$GxOLRocw8sVU+obNZlrxHcFil9MrX4rSAN8bnzYZuog=	2026-05-23 19:10:50.409301+00	f	Rubenzboss	Ruben	Colson	heimdal.petition668@simplelogin.com	f	t	2026-05-18 16:28:50.737581+00
734	pbkdf2_sha256$260000$j4fchLlsW9LmnIHb4xtSyd$oOLA6HKW2Gxj/nZRB0fsNU5yr2hUw41DoKD7vsV0JWg=	2026-05-23 17:28:17.360966+00	f	Astakos	Sybren	Windels	sybren_windels@live.be	f	t	2026-05-20 19:30:17.410345+00
2	pbkdf2_sha256$260000$T79xqKqt92OuX4Ny6CdT9I$S1koS8yEyiWwXmvjtSnF7cxzjEFF+e3U0gnXposdfms=	2026-05-25 22:13:22.163399+00	t	ict@heimdal.be	Wout	Lesschaeve	ict@heimdal.be	t	t	2022-12-31 16:26:10+00
551	pbkdf2_sha256$260000$vAvsuybf2FQNIbfn5QByXo$WbmQ4YwVk9Q9zROcaOJpcY/K2fTO8oYRmgoMFWSL/Vo=	2026-05-15 20:11:41+00	f	Woud	Wout	Lesschaeve	wout.lesschaeve@icloud.com	f	t	2025-12-04 13:53:16+00
726	pbkdf2_sha256$260000$yMuSLKbpiv3dtSIm4yDSfy$nOKZ59LU6ZXojpe6MqDzqpMyTx9/bcFixc2uxJCunn8=	2026-05-23 17:56:29.749236+00	f	JustZelda_	Axelle	Ducouran	axelle.ducouran1@gmail.com	f	t	2026-05-15 18:25:32.6332+00
735	pbkdf2_sha256$260000$44mru1fzkhPN0Mbd8eGs9n$PhF2O80VGmQCE8nsqX/ggDhKC3PWO1BeMrsuM2fVxSU=	2026-05-23 17:53:24.477144+00	f	kobemaebe	kobe	maebe	kobe.maebe@gmail.com	f	t	2026-05-21 13:24:23.333913+00
733	pbkdf2_sha256$260000$YpqTFkQkHdPaE085PbttLU$I6iRXPoEaMFb4yBUMk482RrJE5TGGtv1JnUHOtn79LM=	2026-05-23 17:54:10.05105+00	f	NelerMoon	Nele	Vandemaele	nelevdm@hotmail.com	f	t	2026-05-20 17:28:06.237349+00
756	pbkdf2_sha256$260000$VnATNSfpIr9mh6QugIzmrR$GUcRaUsTe/8oAIgfKjjAH6kh8U0cQ5pkYe9Iz6DGN+o=	2026-05-23 17:54:06.03594+00	f	Volmacht-Yoran-Ollevier	Yoran	Ollevier	yoran.ollevier1@gmail.com	f	t	2026-05-23 17:54:05.294739+00
732	pbkdf2_sha256$260000$Ep7f5v6GhDB5S5fzZtYXN3$LJYceHDTH60cquMk7ehg4bwpiVLY2/23ynWEtW4RczY=	2026-05-23 18:13:43.794239+00	f	annsofie.stevens	Ann-Sofie	Stevens	annsofie.stevens@hotmail.com	f	t	2026-05-19 17:08:54.994695+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: jormungandr
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
1	4	7
2	6	5
3	6	6
4	2	4
5	7	5
6	8	5
7	9	5
8	10	7
9	11	5
74	221	2
75	221	5
76	221	6
77	221	7
140	8	2
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: jormungandr
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
34	221	74
35	221	76
67	221	70
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: jormungandr
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2022-12-31 16:25:40.006619+00	1	gate@heimdal.be	2	[{"changed": {"name": "profile", "object": " ", "fields": ["Role"]}}]	4	1
2	2022-12-31 16:26:10.19118+00	2	ict@heimdal.be	1	[{"added": {}}]	4	1
3	2022-12-31 16:26:34.221838+00	2	ict@heimdal.be	2	[{"changed": {"fields": ["Staff status", "Superuser status"]}}, {"changed": {"name": "profile", "object": " ", "fields": ["Policy approved", "Role"]}}]	4	1
4	2022-12-31 16:26:44.911405+00	1	gate@heimdal.be	2	[{"changed": {"name": "profile", "object": " ", "fields": ["Policy approved"]}}]	4	1
5	2022-12-31 16:32:14.03057+00	1	boekje	1	[{"added": {}}]	7	1
6	2022-12-31 16:32:40.11198+00	2	werkgroepen	1	[{"added": {}}]	7	1
7	2022-12-31 16:33:09.66415+00	3	sponsorworden	1	[{"added": {}}]	7	1
8	2022-12-31 16:33:34.468993+00	4	clublied	1	[{"added": {}}]	7	1
9	2022-12-31 16:34:05.457905+00	5	privacy	1	[{"added": {}}]	7	1
10	2022-12-31 16:34:25.885624+00	6	overons	1	[{"added": {}}]	7	1
11	2022-12-31 16:35:37.826392+00	1	Evenementen	1	[{"added": {}}]	11	1
12	2022-12-31 16:36:13.716869+00	2	Praesidium	1	[{"added": {}}]	11	1
13	2022-12-31 16:36:36.778865+00	3	Over Ons	1	[{"added": {}}]	11	1
14	2022-12-31 16:37:46.884761+00	1	Boekje	1	[{"added": {}}]	21	1
15	2022-12-31 16:38:35.57462+00	3	Over Ons	2	[{"changed": {"fields": ["Order"]}}]	11	1
16	2022-12-31 16:38:49.505038+00	2	Praesidium	2	[{"changed": {"fields": ["Order"]}}]	11	1
17	2022-12-31 16:38:54.257187+00	1	Evenementen	2	[{"changed": {"fields": ["Order"]}}]	11	1
18	2022-12-31 16:39:33.956261+00	2	Werkgroepen	1	[{"added": {}}]	21	1
19	2022-12-31 16:40:17.552277+00	3	Stamboom	1	[{"added": {}}]	21	1
20	2022-12-31 16:41:06.597735+00	4	Clublied	1	[{"added": {}}]	21	1
21	2022-12-31 16:41:29.578766+00	5	Statuten	1	[{"added": {}}]	21	1
22	2022-12-31 16:41:45.46287+00	6	Ereleden	1	[{"added": {}}]	21	1
23	2022-12-31 16:42:08.455154+00	7	Foto's	1	[{"added": {}}]	21	1
24	2022-12-31 16:43:56.857088+00	1	Home: https://jormungandr.fly.dev	1	[{"added": {}}]	10	1
25	2022-12-31 16:45:10.109188+00	2	Over ons: https://jormungandr.fly.dev/overons	1	[{"added": {}}]	10	1
26	2022-12-31 16:45:25.897802+00	3	Foto's: https://jormungandr.fly.dev/albums	1	[{"added": {}}]	10	1
27	2022-12-31 16:45:45.661806+00	4	Privacy Policy: https://jormungandr.fly.dev/privacy	1	[{"added": {}}]	10	1
28	2022-12-31 16:46:15.463603+00	5	Sponsor worden?: https://jormungandr.fly.dev/sponsorworden	1	[{"added": {}}]	10	1
29	2022-12-31 16:49:47.61744+00	1	2022-06-01 17:49:19+02:00 - 2023-05-31 17:49:19+02:00	1	[{"added": {}}]	15	1
30	2022-12-31 16:50:29.96975+00	2	2021-06-01 17:50:12+02:00 - 2022-05-31 17:50:11+02:00	1	[{"added": {}}]	15	1
31	2022-12-31 16:51:11.484253+00	3	2020-05-01 17:51:09+02:00 - 2021-05-31 17:51:10+02:00	1	[{"added": {}}]	15	1
32	2022-12-31 16:51:38.828477+00	4	2019-06-01 17:51:37+02:00 - 2020-05-31 17:51:36+02:00	1	[{"added": {}}]	15	1
33	2022-12-31 16:52:19.288158+00	5	2018-01-01 17:51:58+01:00 - 2019-05-31 17:51:59+02:00	1	[{"added": {}}]	15	1
34	2022-12-31 16:54:40.685699+00	1	Praeses	1	[{"added": {}}]	13	1
35	2022-12-31 16:54:57.169824+00	2	Vice-Praeses	1	[{"added": {}}]	13	1
36	2022-12-31 16:55:11.902098+00	3	Quaestor	1	[{"added": {}}]	13	1
37	2022-12-31 16:55:25.171663+00	4	Secretaris	1	[{"added": {}}]	13	1
38	2022-12-31 16:55:42.218986+00	5	Feest & LAN	1	[{"added": {}}]	13	1
39	2022-12-31 16:55:55.313695+00	6	Cultuur	1	[{"added": {}}]	13	1
40	2022-12-31 16:56:10.145549+00	7	PR	1	[{"added": {}}]	13	1
41	2022-12-31 16:56:22.817312+00	8	ICT	1	[{"added": {}}]	13	1
42	2022-12-31 16:56:35.930814+00	9	Sport	1	[{"added": {}}]	13	1
43	2022-12-31 16:56:51.676127+00	10	Schachtentemmer	1	[{"added": {}}]	13	1
44	2022-12-31 16:57:04.684143+00	11	Media	1	[{"added": {}}]	13	1
45	2022-12-31 16:57:17.807187+00	12	Scriptor	1	[{"added": {}}]	13	1
46	2022-12-31 16:57:32.291045+00	13	Medewerker	1	[{"added": {}}]	13	1
47	2022-12-31 16:57:46.214302+00	14	Superschacht	1	[{"added": {}}]	13	1
48	2023-01-01 00:13:26.3855+00	1	Stef: Bondroit	1	[{"added": {}}]	14	1
49	2023-01-01 00:13:54.515615+00	2	Nick: Lersberghe	1	[{"added": {}}]	14	1
50	2023-01-01 00:14:46.002885+00	3	Thomas: Schuddinck	1	[{"added": {}}]	14	1
51	2023-01-01 00:15:10.7545+00	4	Andreas: Moerman	1	[{"added": {}}]	14	1
52	2023-01-01 00:15:33.060354+00	5	Nelson: Horemans	1	[{"added": {}}]	14	1
53	2023-01-01 00:16:00.813265+00	6	Tyra: Bourgeois	1	[{"added": {}}]	14	1
54	2023-01-01 00:16:24.803584+00	7	Brent: Van Acker	1	[{"added": {}}]	14	1
55	2023-01-01 00:16:54.539505+00	8	Chaira: Goethals	1	[{"added": {}}]	14	1
56	2023-01-01 00:17:24.272391+00	9	Ellen: Van Damme	1	[{"added": {}}]	14	1
57	2023-01-01 00:18:23.215155+00	10	Jarne: De Vulder	1	[{"added": {}}]	14	1
58	2023-01-01 00:18:59.936844+00	11	Luna: Deroo	1	[{"added": {}}]	14	1
59	2023-01-01 00:19:28.27205+00	12	Ruben: Stalpaert	1	[{"added": {}}]	14	1
60	2023-01-01 00:19:55.254318+00	13	Tijl: Zwartjes	1	[{"added": {}}]	14	1
61	2023-01-01 00:20:21.193231+00	14	Benny: De Bock	1	[{"added": {}}]	14	1
62	2023-01-01 00:20:55.108678+00	15	Tanguy: Montaine	1	[{"added": {}}]	14	1
63	2023-01-01 00:21:21.553462+00	16	Sander: De Bruyker	1	[{"added": {}}]	14	1
64	2023-01-01 00:21:41.350977+00	17	Hayley: Rasschaert	1	[{"added": {}}]	14	1
65	2023-01-01 00:22:06.553498+00	18	Jolien: Leenknegt	1	[{"added": {}}]	14	1
66	2023-01-01 00:22:26.092922+00	19	Lucien: De Leeuw	1	[{"added": {}}]	14	1
67	2023-01-01 00:23:12.685363+00	20	Hans: De Boeck	1	[{"added": {}}]	14	1
68	2023-01-01 00:23:33.912347+00	21	Stephen: Nijsten	1	[{"added": {}}]	14	1
69	2023-01-01 00:24:01.98907+00	22	Timothy: Williame	1	[{"added": {}}]	14	1
70	2023-01-01 00:24:24.228549+00	23	Jolien: Bardyn	1	[{"added": {}}]	14	1
71	2023-01-01 00:24:46.916159+00	24	Miriam: Plugge	1	[{"added": {}}]	14	1
72	2023-01-01 00:25:04.392242+00	25	Joren: Debois	1	[{"added": {}}]	14	1
73	2023-01-01 00:25:30.317674+00	26	Laurens: Ghekiere	1	[{"added": {}}]	14	1
74	2023-01-01 00:25:49.185884+00	27	Ritchie: Van Mele	1	[{"added": {}}]	14	1
75	2023-01-01 00:26:10.664636+00	28	Sofie: Seru	1	[{"added": {}}]	14	1
76	2023-01-01 00:26:34.743087+00	29	Bram: Zeeuwe	1	[{"added": {}}]	14	1
77	2023-01-01 00:26:55.353451+00	30	Lucas: Havermans	1	[{"added": {}}]	14	1
78	2023-01-01 00:27:24.367098+00	31	Sepp: Degroote	1	[{"added": {}}]	14	1
79	2023-01-01 00:27:42.360261+00	32	Daan: Beernaert	1	[{"added": {}}]	14	1
80	2023-01-01 00:28:00.531741+00	33	Jochen: Wimme	1	[{"added": {}}]	14	1
81	2023-01-01 00:28:35.479918+00	34	Rein: Goossens	1	[{"added": {}}]	14	1
82	2023-01-01 00:29:40.290171+00	1	2018-01-01 16:51:58+00:00 - 2019-05-31 15:51:59+00:00 Vice-Praeses	1	[{"added": {}}]	19	1
83	2023-01-01 00:30:52.420597+00	2	2020-05-01 15:51:09+00:00 - 2021-05-31 15:51:10+00:00 ICT	1	[{"added": {}}]	19	1
84	2023-01-01 00:31:26.262741+00	3	2019-06-01 15:51:37+00:00 - 2020-05-31 15:51:36+00:00 Praeses	1	[{"added": {}}]	19	1
86	2023-01-01 00:32:03.955423+00	5	2020-05-01 15:51:09+00:00 - 2021-05-31 15:51:10+00:00 Praeses	1	[{"added": {}}]	19	1
88	2023-01-01 00:32:35.476935+00	7	2020-05-01 15:51:09+00:00 - 2021-05-31 15:51:10+00:00 Secretaris	1	[{"added": {}}]	19	1
89	2023-01-01 00:32:59.90356+00	8	2020-05-01 15:51:09+00:00 - 2021-05-31 15:51:10+00:00 Feest & LAN	1	[{"added": {}}]	19	1
90	2023-01-01 00:33:24.904277+00	9	2020-05-01 15:51:09+00:00 - 2021-05-31 15:51:10+00:00 Cultuur	1	[{"added": {}}]	19	1
91	2023-01-01 00:33:51.764274+00	10	2020-05-01 15:51:09+00:00 - 2021-05-31 15:51:10+00:00 PR	1	[{"added": {}}]	19	1
93	2023-01-01 00:36:07.970207+00	12	2020-05-01 15:51:09+00:00 - 2021-05-31 15:51:10+00:00 Schachtentemmer	1	[{"added": {}}]	19	1
95	2023-01-01 00:36:50.592126+00	14	2021-06-01 15:50:12+00:00 - 2022-05-31 15:50:11+00:00 Praeses	1	[{"added": {}}]	19	1
97	2023-01-01 00:37:30.206463+00	16	2021-06-01 15:50:12+00:00 - 2022-05-31 15:50:11+00:00 PR	1	[{"added": {}}]	19	1
99	2023-01-01 00:38:20.311278+00	18	2021-06-01 15:50:12+00:00 - 2022-05-31 15:50:11+00:00 ICT	1	[{"added": {}}]	19	1
85	2023-01-01 00:31:44.696269+00	4	2018-01-01 16:51:58+00:00 - 2019-05-31 15:51:59+00:00 ICT	1	[{"added": {}}]	19	1
87	2023-01-01 00:32:19.990104+00	6	2020-05-01 15:51:09+00:00 - 2021-05-31 15:51:10+00:00 Vice-Praeses	1	[{"added": {}}]	19	1
92	2023-01-01 00:34:29.795555+00	11	2020-05-01 15:51:09+00:00 - 2021-05-31 15:51:10+00:00 Sport	1	[{"added": {}}]	19	1
94	2023-01-01 00:36:35.41706+00	13	2020-05-01 15:51:09+00:00 - 2021-05-31 15:51:10+00:00 Media	1	[{"added": {}}]	19	1
96	2023-01-01 00:37:11.041958+00	15	2021-06-01 15:50:12+00:00 - 2022-05-31 15:50:11+00:00 Cultuur	1	[{"added": {}}]	19	1
98	2023-01-01 00:37:53.117818+00	17	2018-01-01 16:51:58+00:00 - 2019-05-31 15:51:59+00:00 Sport	1	[{"added": {}}]	19	1
100	2023-01-01 00:38:48.132284+00	19	2021-06-01 15:50:12+00:00 - 2022-05-31 15:50:11+00:00 Feest & LAN	1	[{"added": {}}]	19	1
101	2023-01-01 00:39:08.771384+00	20	2021-06-01 15:50:12+00:00 - 2022-05-31 15:50:11+00:00 Secretaris	1	[{"added": {}}]	19	1
102	2023-01-01 00:39:22.44072+00	21	2021-06-01 15:50:12+00:00 - 2022-05-31 15:50:11+00:00 Schachtentemmer	1	[{"added": {}}]	19	1
103	2023-01-01 00:39:38.611887+00	22	2021-06-01 15:50:12+00:00 - 2022-05-31 15:50:11+00:00 Sport	1	[{"added": {}}]	19	1
104	2023-01-01 00:39:55.6286+00	23	2019-06-01 15:51:37+00:00 - 2020-05-31 15:51:36+00:00 Schachtentemmer	1	[{"added": {}}]	19	1
105	2023-01-01 00:40:12.95968+00	24	2019-06-01 15:51:37+00:00 - 2020-05-31 15:51:36+00:00 Sport	1	[{"added": {}}]	19	1
106	2023-01-01 00:40:31.149714+00	25	2019-06-01 15:51:37+00:00 - 2020-05-31 15:51:36+00:00 Cultuur	1	[{"added": {}}]	19	1
107	2023-01-01 00:40:51.578039+00	26	2018-01-01 16:51:58+00:00 - 2019-05-31 15:51:59+00:00 Praeses	1	[{"added": {}}]	19	1
108	2023-01-01 00:41:09.429075+00	27	2018-01-01 16:51:58+00:00 - 2019-05-31 15:51:59+00:00 Quaestor	1	[{"added": {}}]	19	1
109	2023-01-01 00:41:33.861876+00	28	2018-01-01 16:51:58+00:00 - 2019-05-31 15:51:59+00:00 Secretaris	1	[{"added": {}}]	19	1
110	2023-01-01 00:42:26.736055+00	27	2018-01-01 16:51:58+00:00 - 2019-05-31 15:51:59+00:00 Quaestor	2	[{"changed": {"fields": ["Praesidium member"]}}]	19	1
111	2023-01-01 00:42:54.664882+00	29	2018-01-01 16:51:58+00:00 - 2019-05-31 15:51:59+00:00 Cultuur	1	[{"added": {}}]	19	1
112	2023-01-01 00:43:11.277929+00	30	2018-01-01 16:51:58+00:00 - 2019-05-31 15:51:59+00:00 Feest & LAN	1	[{"added": {}}]	19	1
113	2023-01-01 00:43:27.910412+00	31	2018-01-01 16:51:58+00:00 - 2019-05-31 15:51:59+00:00 Media	1	[{"added": {}}]	19	1
114	2023-01-01 00:43:52.567965+00	32	2018-01-01 16:51:58+00:00 - 2019-05-31 15:51:59+00:00 Scriptor	1	[{"added": {}}]	19	1
115	2023-01-01 00:44:17.854553+00	33	2019-06-01 15:51:37+00:00 - 2020-05-31 15:51:36+00:00 PR	1	[{"added": {}}]	19	1
116	2023-01-01 00:45:08.281465+00	34	2019-06-01 15:51:37+00:00 - 2020-05-31 15:51:36+00:00 Quaestor	1	[{"added": {}}]	19	1
117	2023-01-01 00:45:26.21908+00	35	2019-06-01 15:51:37+00:00 - 2020-05-31 15:51:36+00:00 Secretaris	1	[{"added": {}}]	19	1
118	2023-01-01 00:45:48.715391+00	36	2018-01-01 16:51:58+00:00 - 2019-05-31 15:51:59+00:00 PR	1	[{"added": {}}]	19	1
119	2023-01-01 00:46:04.438506+00	37	2019-06-01 15:51:37+00:00 - 2020-05-31 15:51:36+00:00 Vice-Praeses	1	[{"added": {}}]	19	1
120	2023-01-01 00:46:22.248991+00	38	2019-06-01 15:51:37+00:00 - 2020-05-31 15:51:36+00:00 ICT	1	[{"added": {}}]	19	1
121	2023-01-01 00:46:40.70172+00	39	2022-06-01 15:49:19+00:00 - 2023-05-31 15:49:19+00:00 Praeses	1	[{"added": {}}]	19	1
122	2023-01-01 00:46:54.234409+00	40	2022-06-01 15:49:19+00:00 - 2023-05-31 15:49:19+00:00 Vice-Praeses	1	[{"added": {}}]	19	1
123	2023-01-01 00:47:13.038445+00	41	2022-06-01 15:49:19+00:00 - 2023-05-31 15:49:19+00:00 Secretaris	1	[{"added": {}}]	19	1
124	2023-01-01 00:47:38.850493+00	42	2022-06-01 15:49:19+00:00 - 2023-05-31 15:49:19+00:00 Feest & LAN	1	[{"added": {}}]	19	1
125	2023-01-01 00:47:49.637263+00	43	2022-06-01 15:49:19+00:00 - 2023-05-31 15:49:19+00:00 Cultuur	1	[{"added": {}}]	19	1
126	2023-01-01 00:48:02.091047+00	44	2022-06-01 15:49:19+00:00 - 2023-05-31 15:49:19+00:00 Quaestor	1	[{"added": {}}]	19	1
127	2023-01-01 00:48:13.355804+00	45	2022-06-01 15:49:19+00:00 - 2023-05-31 15:49:19+00:00 Schachtentemmer	1	[{"added": {}}]	19	1
128	2023-01-01 00:48:24.551225+00	46	2022-06-01 15:49:19+00:00 - 2023-05-31 15:49:19+00:00 Sport	1	[{"added": {}}]	19	1
129	2023-01-01 00:48:37.863797+00	47	2022-06-01 15:49:19+00:00 - 2023-05-31 15:49:19+00:00 PR	1	[{"added": {}}]	19	1
130	2023-01-01 00:48:47.094889+00	48	2022-06-01 15:49:19+00:00 - 2023-05-31 15:49:19+00:00 ICT	1	[{"added": {}}]	19	1
131	2023-01-01 00:49:26.682939+00	34	2019-06-01 15:51:37+00:00 - 2020-05-31 15:51:36+00:00 Quaestor	2	[]	19	1
132	2023-01-01 00:49:55.555033+00	27	2018-01-01 16:51:58+00:00 - 2019-05-31 15:51:59+00:00 Quaestor	2	[{"changed": {"fields": ["Praesidium member"]}}]	19	1
133	2023-01-01 00:51:00.969694+00	35	2019-06-01 15:51:37+00:00 - 2020-05-31 15:51:36+00:00 Secretaris	2	[{"changed": {"fields": ["Praesidium member"]}}]	19	1
134	2023-01-01 00:51:56.931566+00	25	2019-06-01 15:51:37+00:00 - 2020-05-31 15:51:36+00:00 Cultuur	2	[{"changed": {"fields": ["Praesidium member"]}}]	19	1
135	2023-01-01 00:55:00.070574+00	1	Comic Sans	1	[{"added": {}}]	17	1
136	2023-01-01 00:56:50.46294+00	1	Open vergadering	1	[{"added": {}}]	9	1
137	2023-01-01 00:57:14.430548+00	2	Sport	1	[{"added": {}}]	9	1
138	2023-01-01 00:57:47.807732+00	3	Clubavond	1	[{"added": {}}]	9	1
139	2023-01-01 00:58:11.36709+00	4	Cultuur	1	[{"added": {}}]	9	1
140	2023-01-01 00:58:33.847918+00	5	Samenwerking met extern	1	[{"added": {}}]	9	1
141	2023-01-01 00:58:49.825641+00	6	Schachtentemmer	1	[{"added": {}}]	9	1
142	2023-01-01 00:59:02.343751+00	7	Feest & LAN	1	[{"added": {}}]	9	1
143	2023-01-01 00:59:36.278261+00	8	Lustrum	1	[{"added": {}}]	9	1
144	2023-01-01 01:00:54.810369+00	1	The one LAN to rule them all	1	[{"added": {}}]	23	1
145	2023-01-01 01:03:10.827393+00	2	Lustrumbal	1	[{"added": {}}]	23	1
146	2023-01-01 01:04:13.3764+00	3	Heimdal Weekend	1	[{"added": {}}]	23	1
147	2023-01-01 01:08:27.697951+00	1	Caroussel	1	[{"added": {}}]	12	1
148	2023-01-01 01:08:42.705777+00	2	Schaatsen 2021	1	[{"added": {}}]	12	1
149	2023-01-01 01:09:00.401305+00	3	Weekend 2022	1	[{"added": {}}]	12	1
150	2023-01-01 01:09:22.896131+00	4	Secret Santa 2021	1	[{"added": {}}]	12	1
151	2023-01-01 01:09:37.349337+00	5	LAN Exeter 2022	1	[{"added": {}}]	12	1
152	2023-01-01 01:09:52.20949+00	6	Overdracht 2021	1	[{"added": {}}]	12	1
153	2023-01-01 01:12:12.614382+00	2	HOGENT	1	[{"added": {}}]	17	1
154	2023-01-01 01:12:35.746867+00	3	Vrolijke Viking	1	[{"added": {}}]	17	1
155	2023-01-01 01:12:59.524343+00	4	delaware	1	[{"added": {}}]	17	1
156	2023-01-01 01:13:24.509902+00	5	Kenneth Franckaert	1	[{"added": {}}]	17	1
157	2023-01-01 01:16:59.623846+00	3	praeses@heimdal.be	1	[{"added": {}}]	4	1
220	2023-01-01 22:33:01.021635+00	4	Schaatsen 2021 - Polonaise	1	[{"added": {}}]	20	2
221	2023-01-01 22:33:47.205276+00	5	Schaatsen 2021 - POLONAISE!!!	1	[{"added": {}}]	20	2
158	2023-01-01 01:17:38.456317+00	3	praeses@heimdal.be	2	[{"changed": {"fields": ["First name", "Last name", "Email address"]}}, {"changed": {"name": "profile", "object": "Hayley Rasschaert", "fields": ["Geslacht", "Interesses", "Policy approved", "Votes", "Role"]}}]	4	1
159	2023-01-01 01:18:13.602634+00	4	vice-praeses@heimdal.be	1	[{"added": {}}]	4	1
160	2023-01-01 01:19:05.916035+00	4	vice-praeses@heimdal.be	2	[{"changed": {"fields": ["First name", "Last name", "Email address", "Staff status", "Superuser status"]}}, {"changed": {"name": "profile", "object": "Sander De Bruyker", "fields": ["Gsm", "Geslacht", "Interesses", "Mails", "Policy approved", "Votes", "Role"]}}]	4	1
161	2023-01-01 01:20:13.134832+00	1	SponsorAanpasser	1	[{"added": {}}]	3	1
162	2023-01-01 01:20:54.015536+00	2	MediaAanpasser	1	[{"added": {}}]	3	1
163	2023-01-01 01:21:05.037766+00	3	Kiescomite	1	[{"added": {}}]	3	1
164	2023-01-01 01:23:52.916662+00	4	ICT	1	[{"added": {}}]	3	1
165	2023-01-01 01:24:25.270707+00	5	EventAanpasser	1	[{"added": {}}]	3	1
166	2023-01-01 01:25:06.885429+00	6	ContentAanpasser	1	[{"added": {}}]	3	1
167	2023-01-01 01:26:03.508043+00	7	Aanpassers	1	[{"added": {}}]	3	1
168	2023-01-01 01:26:33.916743+00	3	praeses@heimdal.be	2	[{"changed": {"fields": ["Staff status", "Superuser status"]}}]	4	1
169	2023-01-01 01:26:51.902028+00	4	vice-praeses@heimdal.be	2	[{"changed": {"fields": ["Groups"]}}]	4	1
170	2023-01-01 01:27:08.449761+00	5	quaestor@heimdal.be	1	[{"added": {}}]	4	1
171	2023-01-01 01:27:41.631793+00	5	quaestor@heimdal.be	2	[{"changed": {"fields": ["First name", "Last name", "Email address", "Staff status"]}}, {"changed": {"name": "profile", "object": "Lucas Havermans", "fields": ["Geslacht", "Interesses", "Mails", "Policy approved", "Votes", "Role"]}}]	4	1
172	2023-01-01 01:28:05.006851+00	6	secretaris@heimdal.be	1	[{"added": {}}]	4	1
173	2023-01-01 01:29:12.317218+00	6	secretaris@heimdal.be	2	[{"changed": {"fields": ["First name", "Last name", "Email address", "Staff status", "Groups"]}}, {"changed": {"name": "profile", "object": "Jolien Leenknegt", "fields": ["Geslacht", "Policy approved", "Role"]}}]	4	1
174	2023-01-01 01:30:04.788065+00	2	ict@heimdal.be	2	[{"changed": {"fields": ["password"]}}]	4	1
175	2023-01-01 01:30:49.076219+00	2	ict@heimdal.be	2	[{"changed": {"fields": ["First name", "Last name", "Email address", "Groups"]}}, {"changed": {"name": "profile", "object": "Sepp Degroot", "fields": ["Geslacht", "Interesses", "Votes"]}}]	4	1
176	2023-01-01 01:31:13.217379+00	7	sport@heimdal.be	1	[{"added": {}}]	4	1
177	2023-01-01 01:31:44.624851+00	7	sport@heimdal.be	2	[{"changed": {"fields": ["First name", "Last name", "Email address", "Groups"]}}, {"changed": {"name": "profile", "object": "Daan Beernaert", "fields": ["Geslacht", "Interesses", "Mails", "Policy approved", "Votes", "Role"]}}]	4	1
178	2023-01-01 01:32:08.662027+00	8	schachtentemmer@heimdal.be	1	[{"added": {}}]	4	1
179	2023-01-01 01:32:45.360107+00	8	schachtentemmer@heimdal.be	2	[{"changed": {"fields": ["First name", "Last name", "Email address", "Staff status", "Groups"]}}, {"changed": {"name": "profile", "object": "Jochen Wimme", "fields": ["Gsm", "Geslacht", "Interesses", "Mails", "Policy approved", "Votes", "Role"]}}]	4	1
180	2023-01-01 01:33:03.39681+00	9	feest-lan@heimdal.be	1	[{"added": {}}]	4	1
181	2023-01-01 01:33:38.835653+00	9	feest-lan@heimdal.be	2	[{"changed": {"fields": ["First name", "Last name", "Email address", "Staff status", "Groups"]}}, {"changed": {"name": "profile", "object": "Tanguy Montaine", "fields": ["Geslacht", "Interesses", "Mails", "Policy approved", "Votes", "Role"]}}]	4	1
182	2023-01-01 01:33:58.475433+00	10	pr@heimdal.be	1	[{"added": {}}]	4	1
183	2023-01-01 01:34:31.356429+00	10	pr@heimdal.be	2	[{"changed": {"fields": ["First name", "Last name", "Email address", "Staff status", "Groups"]}}, {"changed": {"name": "profile", "object": "Rein Goossens", "fields": ["Gsm", "Geslacht", "Interesses", "Mails", "Policy approved", "Votes", "Role"]}}]	4	1
184	2023-01-01 01:34:55.739386+00	11	cultuur@heimdal.be	1	[{"added": {}}]	4	1
185	2023-01-01 01:35:31.318297+00	11	cultuur@heimdal.be	2	[{"changed": {"fields": ["First name", "Last name", "Email address", "Staff status", "Groups"]}}, {"changed": {"name": "profile", "object": "Bram Zeeuwe", "fields": ["Gsm", "Geslacht", "Votes", "Role"]}}]	4	1
186	2023-01-01 01:35:56.392817+00	7	sport@heimdal.be	2	[{"changed": {"fields": ["Staff status"]}}]	4	1
187	2023-01-01 01:36:03.33901+00	6	secretaris@heimdal.be	2	[]	4	1
188	2023-01-01 01:36:22.737328+00	11	cultuur@heimdal.be	2	[{"changed": {"name": "profile", "object": "Bram Zeeuwe", "fields": ["Policy approved"]}}]	4	1
189	2023-01-01 01:36:28.843924+00	9	feest-lan@heimdal.be	2	[]	4	1
190	2023-01-01 01:36:37.842958+00	2	ict@heimdal.be	2	[]	4	1
191	2023-01-01 01:36:45.174273+00	3	praeses@heimdal.be	2	[]	4	1
192	2023-01-01 01:36:52.521219+00	10	pr@heimdal.be	2	[]	4	1
193	2023-01-01 01:37:06.542325+00	5	quaestor@heimdal.be	2	[]	4	1
194	2023-01-01 01:37:12.863147+00	8	schachtentemmer@heimdal.be	2	[]	4	1
195	2023-01-01 11:35:09.566438+00	1	Comic Sans	2	[{"changed": {"fields": ["Logo"]}}]	17	2
196	2023-01-01 13:00:14.459877+00	1	The one LAN to rule them all	2	[{"changed": {"fields": ["Poster"]}}]	23	2
197	2023-01-01 20:08:39.38774+00	33	Jochen: Wimme	2	[]	14	1
198	2023-01-01 20:20:03.124052+00	15	Superschacht	1	[{"added": {}}]	13	1
199	2023-01-01 20:20:13.427725+00	16	Erelid	1	[{"added": {}}]	13	1
200	2023-01-01 20:26:57.323436+00	6	Ereleden	1	[{"added": {}}]	15	1
201	2023-01-01 20:27:14.790689+00	7	Superschachten	1	[{"added": {}}]	15	1
202	2023-01-01 20:29:28.702072+00	14	Superschacht	3		13	1
203	2023-01-01 20:29:57.550038+00	49	Superschachten Superschacht	1	[{"added": {}}]	19	1
204	2023-01-01 20:31:21.441274+00	50	Ereleden Erelid	1	[{"added": {}}]	19	1
205	2023-01-01 20:35:31.506167+00	6	Ereleden	3		21	1
206	2023-01-01 20:37:12.717464+00	51	Ereleden Erelid	1	[{"added": {}}]	19	2
207	2023-01-01 20:37:46.854482+00	52	Ereleden Erelid	1	[{"added": {}}]	19	2
208	2023-01-01 20:38:43.854375+00	53	Ereleden Erelid	1	[{"added": {}}]	19	2
209	2023-01-01 20:39:42.355369+00	54	Ereleden Erelid	1	[{"added": {}}]	19	2
210	2023-01-01 20:41:12.519259+00	55	Ereleden Erelid	1	[{"added": {}}]	19	2
211	2023-01-01 20:46:46.282009+00	35	Stijn: Verschueren	1	[{"added": {}}]	14	2
212	2023-01-01 20:47:27.685115+00	56	Ereleden Erelid	1	[{"added": {}}]	19	2
213	2023-01-01 20:50:37.505504+00	36	Jarne: Schotte	1	[{"added": {}}]	14	2
214	2023-01-01 20:51:33.510914+00	57	Ereleden Erelid	1	[{"added": {}}]	19	2
215	2023-01-01 22:28:30.91555+00	1	Schaatsen 2021 - groeps foto	1	[{"added": {}}]	20	2
216	2023-01-01 22:29:55.141157+00	1	Schaatsen 2021 - groeps foto	2	[{"changed": {"fields": ["Link"]}}]	20	2
217	2023-01-01 22:30:54.396239+00	2	Schaatsen 2021 - groepsfoto 2	1	[{"added": {}}]	20	2
218	2023-01-01 22:31:44.515875+00	3	Secret Santa 2021 - schaatsen 1	1	[{"added": {}}]	20	2
219	2023-01-01 22:32:16.457696+00	3	Schaatsen 2021 - schaatsen 1	2	[{"changed": {"fields": ["Album"]}}]	20	2
222	2023-01-01 22:34:41.367242+00	6	Schaatsen 2021 - noch meer polonaise	1	[{"added": {}}]	20	2
223	2023-01-01 22:35:45.814876+00	7	Schaatsen 2021 - nick toung	1	[{"added": {}}]	20	2
224	2023-01-01 22:36:13.875953+00	8	Schaatsen 2021 - BANANA	1	[{"added": {}}]	20	2
225	2023-01-01 22:36:55.507244+00	9	Schaatsen 2021 - schaats schaats	1	[{"added": {}}]	20	2
226	2023-01-01 22:37:24.841168+00	10	Schaatsen 2021 - openbaar vervoer nick	1	[{"added": {}}]	20	2
227	2023-01-01 22:38:27.704652+00	11	Schaatsen 2021 - nick vervoer 2	1	[{"added": {}}]	20	2
228	2023-01-01 22:39:00.086501+00	12	Schaatsen 2021 - even more polonaise	1	[{"added": {}}]	20	2
229	2023-01-01 22:40:04.383197+00	13	Schaatsen 2021 - Sander en Hayley being cute AF	1	[{"added": {}}]	20	2
230	2023-01-01 22:41:40.709734+00	14	Schaatsen 2021 - schaatsen 2	1	[{"added": {}}]	20	2
231	2023-01-01 22:42:07.780889+00	15	Schaatsen 2021 - group foto	1	[{"added": {}}]	20	2
232	2023-01-01 22:43:31.629401+00	16	Secret Santa 2021 - nick and vio cozy	1	[{"added": {}}]	20	2
233	2023-01-01 22:43:54.579143+00	17	Secret Santa 2021 - foto buiten	1	[{"added": {}}]	20	2
234	2023-01-01 22:44:43.737651+00	18	Secret Santa 2021 - kadootje	1	[{"added": {}}]	20	2
235	2023-01-01 22:45:12.756531+00	19	Secret Santa 2021 - cozy outside	1	[{"added": {}}]	20	2
236	2023-01-01 22:45:38.674174+00	20	Secret Santa 2021 - kadootje 2	1	[{"added": {}}]	20	2
237	2023-01-01 22:46:07.938284+00	21	Secret Santa 2021 - heimdal bloempot	1	[{"added": {}}]	20	2
238	2023-01-01 22:46:38.134879+00	22	Secret Santa 2021 - kadootje 3	1	[{"added": {}}]	20	2
239	2023-01-01 22:46:56.457458+00	23	Secret Santa 2021 - kerstkaatjes	1	[{"added": {}}]	20	2
240	2023-01-01 22:49:59.757905+00	24	Weekend 2022 - eerste avondmaal	1	[{"added": {}}]	20	2
241	2023-01-01 22:51:01.567293+00	25	Weekend 2022 - wandel wandel	1	[{"added": {}}]	20	2
242	2023-01-01 22:52:07.29274+00	26	Weekend 2022 - tijl being tijl	1	[{"added": {}}]	20	2
243	2023-01-01 22:52:36.49659+00	27	Weekend 2022 - nelson has alceholstift	1	[{"added": {}}]	20	2
244	2023-01-01 22:53:24.486681+00	28	Weekend 2022 - nelson gets head pets	1	[{"added": {}}]	20	2
245	2023-01-01 22:53:43.038865+00	29	Weekend 2022 - kaarsten	1	[{"added": {}}]	20	2
246	2023-01-01 22:54:33.660922+00	30	Weekend 2022 - kirsten doing the splits	1	[{"added": {}}]	20	2
247	2023-01-01 22:55:08.381215+00	31	Weekend 2022 - stoel peramiede	1	[{"added": {}}]	20	2
248	2023-01-01 22:55:37.112568+00	32	Weekend 2022 - wandel wandel 2	1	[{"added": {}}]	20	2
249	2023-01-01 22:56:00.181623+00	33	Weekend 2022 - wandel wandel 3	1	[{"added": {}}]	20	2
250	2023-01-01 22:57:11.19994+00	34	Weekend 2022 - op het strand	1	[{"added": {}}]	20	2
251	2023-01-01 22:57:44.784656+00	35	Weekend 2022 - op het strand 2	1	[{"added": {}}]	20	2
252	2023-01-01 22:59:17.260701+00	36	Weekend 2022 - sexy Andreas	1	[{"added": {}}]	20	2
253	2023-01-01 22:59:47.646576+00	37	Weekend 2022 - posing	1	[{"added": {}}]	20	2
254	2023-01-01 23:00:18.894586+00	38	Weekend 2022 - ogen	1	[{"added": {}}]	20	2
255	2023-01-01 23:02:15.635138+00	39	Weekend 2022 - vleeshoop	1	[{"added": {}}]	20	2
256	2023-01-01 23:04:54.086627+00	40	LAN Exeter 2022 - andreas gaming	1	[{"added": {}}]	20	2
257	2023-01-01 23:05:48.571552+00	41	LAN Exeter 2022 - streamende wetvlaming	1	[{"added": {}}]	20	2
258	2023-01-01 23:06:33.641033+00	42	LAN Exeter 2022 - gaming	1	[{"added": {}}]	20	2
259	2023-01-01 23:13:57.538748+00	43	LAN Exeter 2022 - gaming 2	1	[{"added": {}}]	20	2
260	2023-01-01 23:15:36.891872+00	44	LAN Exeter 2022 - boardgaming	1	[{"added": {}}]	20	2
261	2023-01-01 23:17:09.119409+00	45	LAN Exeter 2022 - rubon	1	[{"added": {}}]	20	2
262	2023-01-01 23:17:39.738174+00	46	LAN Exeter 2022 - ingang	1	[{"added": {}}]	20	2
263	2023-01-01 23:18:00.749837+00	47	LAN Exeter 2022 - anton	1	[{"added": {}}]	20	2
264	2023-01-01 23:18:26.96644+00	48	LAN Exeter 2022 - gaming 3	1	[{"added": {}}]	20	2
265	2023-01-01 23:18:59.665448+00	49	LAN Exeter 2022 - big chess	1	[{"added": {}}]	20	2
266	2023-01-01 23:22:58.800059+00	50	LAN Exeter 2022 - beat saber	1	[{"added": {}}]	20	2
267	2023-01-01 23:23:56.804356+00	51	LAN Exeter 2022 - Tanguy beat saber	1	[{"added": {}}]	20	2
268	2023-01-01 23:24:25.488046+00	52	LAN Exeter 2022 - stream	1	[{"added": {}}]	20	2
269	2023-01-01 23:24:49.485432+00	53	LAN Exeter 2022 - Nick	1	[{"added": {}}]	20	2
270	2023-01-01 23:25:56.305055+00	54	LAN Exeter 2022 - lan crew	1	[{"added": {}}]	20	2
271	2023-01-01 23:26:23.226275+00	55	LAN Exeter 2022 - ruben playing	1	[{"added": {}}]	20	2
272	2023-01-01 23:26:55.280602+00	56	LAN Exeter 2022 - opbouw	1	[{"added": {}}]	20	2
273	2023-01-01 23:27:26.504474+00	57	LAN Exeter 2022 - opbouw	1	[{"added": {}}]	20	2
274	2023-01-01 23:27:58.244433+00	58	LAN Exeter 2022 - anime tijl	1	[{"added": {}}]	20	2
275	2023-01-01 23:30:28.100773+00	34	Weekend 2022 - op het strand	2	[{"changed": {"fields": ["Is carousel pic"]}}]	20	2
276	2023-01-01 23:35:11.090435+00	6	Overdracht 2021	2	[{"changed": {"fields": ["Visible"]}}]	12	2
277	2023-01-02 15:48:11.890234+00	37	Bram: Bram 2021-2022	1	[{"added": {}}]	14	2
278	2023-01-02 15:48:29.094307+00	37	Bram: superschaht 2021-2022	2	[{"changed": {"fields": ["Last name"]}}]	14	2
279	2023-01-02 15:48:38.95076+00	37	Bram: 2021-2022	2	[{"changed": {"fields": ["Last name"]}}]	14	2
280	2023-01-02 15:49:27.28456+00	49	Superschachten Superschacht	2	[{"changed": {"fields": ["Praesidium member"]}}]	19	2
310	2023-01-17 08:05:47.900132+00	1	Home: https://heimdal.be	2	[{"changed": {"fields": ["Url"]}}]	10	1
311	2023-01-17 08:06:03.21609+00	2	Over ons: https://heimdal.be/overons	2	[{"changed": {"fields": ["Url"]}}]	10	1
312	2023-01-17 08:06:15.708722+00	3	Foto's: https://heimdal.be/albums	2	[{"changed": {"fields": ["Url"]}}]	10	1
313	2023-01-17 08:06:30.047112+00	5	Sponsor worden?: https://heimdal.be/sponsorworden	2	[{"changed": {"fields": ["Url"]}}]	10	1
314	2023-01-17 08:06:43.688159+00	4	Privacy Policy: https://heimdal.be/privacy	2	[{"changed": {"fields": ["Url"]}}]	10	1
315	2023-01-17 08:07:06.270714+00	3	Over Ons	2	[{"changed": {"fields": ["Url"]}}]	11	1
316	2023-01-17 08:07:22.368665+00	2	Praesidium	2	[{"changed": {"fields": ["Url"]}}]	11	1
317	2023-01-17 08:07:36.678122+00	1	Evenementen	2	[{"changed": {"fields": ["Url"]}}]	11	1
318	2023-01-17 08:07:59.637205+00	7	Foto's	2	[{"changed": {"fields": ["Url"]}}]	21	1
319	2023-01-17 08:08:15.440941+00	5	Statuten	2	[{"changed": {"fields": ["Url"]}}]	21	1
320	2023-01-17 08:08:31.658806+00	4	Clublied	2	[{"changed": {"fields": ["Url"]}}]	21	1
321	2023-01-17 08:08:56.887582+00	3	Stamboom	2	[{"changed": {"fields": ["Url"]}}]	21	1
322	2023-01-17 08:09:11.008495+00	2	Werkgroepen	2	[{"changed": {"fields": ["Url"]}}]	21	1
323	2023-01-17 08:09:26.517817+00	1	Boekje	2	[{"changed": {"fields": ["Url"]}}]	21	1
649	2023-05-04 20:35:16.479349+00	70	Febe: Coutteau	1	[{"added": {}}]	14	2
351	2023-02-01 18:21:18.998919+00	11	cultuur@heimdal.be	2	[{"changed": {"fields": ["password"]}}]	4	2
352	2023-02-01 18:25:05.042426+00	35	Karakombola	1	[{"added": {}}]	23	11
353	2023-02-02 16:03:04.89125+00	3	Heimdal Weekend	2	[{"changed": {"fields": ["Description"]}}]	23	11
386	2023-02-04 18:53:23.663697+00	3	praeses@heimdal.be	2	[{"changed": {"fields": ["password"]}}]	4	2
387	2023-02-04 18:54:00.971858+00	4	vice-praeses@heimdal.be	2	[{"changed": {"fields": ["password"]}}]	4	2
388	2023-02-04 18:56:18.881646+00	12	Tyra	2	[{"changed": {"fields": ["Staff status", "Groups"]}}]	4	2
389	2023-02-04 19:42:25.751255+00	12	Tyra	2	[{"changed": {"fields": ["Groups"]}}]	4	2
390	2023-02-04 19:42:53.774276+00	12	Tyra	2	[{"changed": {"fields": ["Groups"]}}]	4	2
391	2023-02-04 19:42:56.548428+00	11	cultuur@heimdal.be	2	[]	4	2
392	2023-02-04 19:52:48.198116+00	2	Lustrumbal	2	[{"changed": {"fields": ["Description"]}}]	23	3
393	2023-02-04 19:56:20.310043+00	2	Lustrumbal	2	[{"changed": {"fields": ["Description"]}}]	23	3
394	2023-02-04 20:09:02.605226+00	12	Tyra	2	[{"changed": {"fields": ["Last login"]}}]	4	2
395	2023-02-04 20:10:50.160934+00	12	Tyra	2	[{"changed": {"fields": ["Groups", "User permissions"]}}]	4	2
396	2023-02-04 20:11:04.544115+00	2	Lustrumbal	2	[{"changed": {"fields": ["Url"]}}]	23	12
397	2023-02-08 00:07:11.018093+00	12	Tyra	2	[{"changed": {"name": "profile", "object": "Tyra Bourgeois", "fields": ["Role"]}}]	4	1
398	2023-02-08 00:07:49.581975+00	12	Tyra	2	[]	4	1
399	2023-02-08 00:07:50.568797+00	12	Tyra	2	[]	4	2
400	2023-02-08 00:08:11.07728+00	78	test	1	[{"added": {}}]	4	2
401	2023-02-08 00:09:08.336707+00	78	test	2	[]	4	2
402	2023-02-08 00:09:18.332234+00	12	Tyra	2	[]	4	1
403	2023-02-08 00:09:25.706773+00	78	test	2	[{"changed": {"fields": ["Staff status"]}}]	4	2
404	2023-02-08 00:09:54.029914+00	78	test	2	[{"changed": {"fields": ["Last login"]}}, {"changed": {"name": "profile", "object": " ", "fields": ["Policy approved", "Role"]}}]	4	1
405	2023-02-08 00:10:29.690205+00	78	test	2	[{"changed": {"name": "profile", "object": " ", "fields": ["Role"]}}]	4	1
406	2023-02-08 00:10:44.172637+00	78	test	3		4	1
407	2023-02-08 00:10:50.700552+00	12	Tyra	2	[{"changed": {"name": "profile", "object": "Tyra Bourgeois", "fields": ["Role"]}}]	4	2
408	2023-02-09 19:35:27.206133+00	35	Karakombola	2	[{"changed": {"fields": ["Description"]}}]	23	3
409	2023-02-09 19:37:08.43041+00	35	Karakombola	2	[{"changed": {"fields": ["Poster"]}}]	23	3
410	2023-02-09 19:37:58.88086+00	35	Karakombola	2	[{"changed": {"fields": ["Poster"]}}]	23	3
411	2023-02-09 19:38:37.436211+00	35	Karakombola	2	[{"changed": {"fields": ["Poster"]}}]	23	3
412	2023-02-10 10:46:42.552035+00	2	Lustrumbal	2	[{"changed": {"fields": ["Description"]}}]	23	12
413	2023-02-11 01:47:46.84488+00	2	HOGENT	2	[{"changed": {"fields": ["Logo"]}}]	17	1
414	2023-02-11 01:47:50.884743+00	5	Kenneth Franckaert	2	[{"changed": {"fields": ["Logo"]}}]	17	2
415	2023-02-11 01:48:19.61903+00	4	delaware	2	[{"changed": {"fields": ["Logo"]}}]	17	2
416	2023-02-11 01:48:51.794099+00	35	Planet Talent	1	[{"added": {}}]	17	1
417	2023-02-11 01:48:56.668941+00	3	Vrolijke Viking	2	[{"changed": {"fields": ["Logo"]}}]	17	2
418	2023-02-11 01:49:37.893877+00	1	Comic Sans	2	[{"changed": {"fields": ["Logo"]}}]	17	2
419	2023-02-11 01:55:19.025966+00	1	Comic Sans	2	[{"changed": {"fields": ["Logo"]}}]	17	2
420	2023-02-11 01:55:51.425578+00	2	HOGENT	2	[{"changed": {"fields": ["Logo"]}}]	17	2
421	2023-02-11 01:56:25.827855+00	3	Vrolijke Viking	2	[{"changed": {"fields": ["Logo"]}}]	17	2
422	2023-02-11 01:57:43.418255+00	4	delaware	2	[{"changed": {"fields": ["Logo"]}}]	17	2
423	2023-02-11 01:58:22.393256+00	5	Kenneth Franckaert	2	[{"changed": {"fields": ["Logo"]}}]	17	2
424	2023-02-11 01:59:30.353737+00	35	Planet Talent	2	[{"changed": {"fields": ["Logo"]}}]	17	2
425	2023-02-11 02:03:50.418723+00	35	Planet Talent	2	[{"changed": {"fields": ["Logo"]}}]	17	2
426	2023-02-11 02:04:10.933725+00	5	Kenneth Franckaert	2	[{"changed": {"fields": ["Logo"]}}]	17	2
427	2023-02-11 02:04:45.356312+00	4	delaware	2	[{"changed": {"fields": ["Logo"]}}]	17	2
428	2023-02-11 02:05:05.143439+00	3	Vrolijke Viking	2	[{"changed": {"fields": ["Logo"]}}]	17	2
429	2023-02-11 02:05:21.328959+00	2	HOGENT	2	[{"changed": {"fields": ["Logo"]}}]	17	2
430	2023-02-11 02:08:01.237022+00	3	Vrolijke Viking	2	[{"changed": {"fields": ["Logo"]}}]	17	2
431	2023-02-11 02:08:36.081827+00	1	Comic Sans	2	[{"changed": {"fields": ["Logo"]}}]	17	2
432	2023-02-11 02:10:26.836082+00	48	2022-06-01 15:49:19+00:00 - 2023-05-31 15:49:19+00:00 ICT	2	[{"changed": {"fields": ["Photo"]}}]	19	2
433	2023-02-11 02:11:34.141137+00	47	2022-06-01 15:49:19+00:00 - 2023-05-31 15:49:19+00:00 PR	2	[{"changed": {"fields": ["Photo"]}}]	19	2
434	2023-02-11 02:12:41.812022+00	49	Superschachten Superschacht	2	[{"changed": {"fields": ["Photo"]}}]	19	2
435	2023-02-11 02:13:30.909832+00	46	2022-06-01 15:49:19+00:00 - 2023-05-31 15:49:19+00:00 Sport	2	[{"changed": {"fields": ["Photo"]}}]	19	2
436	2023-02-11 02:14:13.157151+00	45	2022-06-01 15:49:19+00:00 - 2023-05-31 15:49:19+00:00 Schachtentemmer	2	[{"changed": {"fields": ["Photo"]}}]	19	2
437	2023-02-11 02:14:14.375404+00	45	2022-06-01 15:49:19+00:00 - 2023-05-31 15:49:19+00:00 Schachtentemmer	2	[{"changed": {"fields": ["Photo"]}}]	19	2
438	2023-02-11 02:14:54.318451+00	44	2022-06-01 15:49:19+00:00 - 2023-05-31 15:49:19+00:00 Quaestor	2	[{"changed": {"fields": ["Photo"]}}]	19	2
439	2023-02-11 02:16:00.269519+00	43	2022-06-01 15:49:19+00:00 - 2023-05-31 15:49:19+00:00 Cultuur	2	[{"changed": {"fields": ["Photo"]}}]	19	2
440	2023-02-11 02:17:20.212407+00	42	2022-06-01 15:49:19+00:00 - 2023-05-31 15:49:19+00:00 Feest & LAN	2	[{"changed": {"fields": ["Photo"]}}]	19	2
441	2023-02-11 02:17:40.476682+00	41	2022-06-01 15:49:19+00:00 - 2023-05-31 15:49:19+00:00 Secretaris	2	[{"changed": {"fields": ["Photo"]}}]	19	2
442	2023-02-11 02:17:46.026778+00	42	2022-06-01 15:49:19+00:00 - 2023-05-31 15:49:19+00:00 Feest & LAN	2	[]	19	2
443	2023-02-11 02:18:04.069545+00	40	2022-06-01 15:49:19+00:00 - 2023-05-31 15:49:19+00:00 Vice-Praeses	2	[{"changed": {"fields": ["Photo"]}}]	19	2
444	2023-02-11 02:18:18.244361+00	39	2022-06-01 15:49:19+00:00 - 2023-05-31 15:49:19+00:00 Praeses	2	[{"changed": {"fields": ["Photo"]}}]	19	2
445	2023-02-11 02:20:11.774245+00	38	2019-06-01 15:51:37+00:00 - 2020-05-31 15:51:36+00:00 ICT	2	[{"changed": {"fields": ["Photo"]}}]	19	2
446	2023-02-11 02:20:54.971326+00	37	2019-06-01 15:51:37+00:00 - 2020-05-31 15:51:36+00:00 Vice-Praeses	2	[{"changed": {"fields": ["Photo"]}}]	19	2
447	2023-02-11 02:21:32.83735+00	36	2018-01-01 16:51:58+00:00 - 2019-05-31 15:51:59+00:00 PR	2	[{"changed": {"fields": ["Photo"]}}]	19	2
448	2023-02-11 02:21:58.397283+00	35	2019-06-01 15:51:37+00:00 - 2020-05-31 15:51:36+00:00 Secretaris	2	[{"changed": {"fields": ["Photo"]}}]	19	2
449	2023-02-11 02:23:13.535851+00	34	2019-06-01 15:51:37+00:00 - 2020-05-31 15:51:36+00:00 Quaestor	2	[{"changed": {"fields": ["Photo"]}}]	19	2
450	2023-02-11 02:24:38.316376+00	33	2019-06-01 15:51:37+00:00 - 2020-05-31 15:51:36+00:00 PR	2	[{"changed": {"fields": ["Photo"]}}]	19	2
454	2023-02-11 02:26:07.225058+00	29	2018-01-01 16:51:58+00:00 - 2019-05-31 15:51:59+00:00 Cultuur	2	[{"changed": {"fields": ["Photo"]}}]	19	2
455	2023-02-11 02:26:19.1087+00	28	2018-01-01 16:51:58+00:00 - 2019-05-31 15:51:59+00:00 Secretaris	2	[{"changed": {"fields": ["Photo"]}}]	19	2
451	2023-02-11 02:25:33.719005+00	32	2018-01-01 16:51:58+00:00 - 2019-05-31 15:51:59+00:00 Scriptor	2	[{"changed": {"fields": ["Photo"]}}]	19	2
452	2023-02-11 02:25:47.312854+00	31	2018-01-01 16:51:58+00:00 - 2019-05-31 15:51:59+00:00 Media	2	[{"changed": {"fields": ["Photo"]}}]	19	2
453	2023-02-11 02:25:57.123929+00	30	2018-01-01 16:51:58+00:00 - 2019-05-31 15:51:59+00:00 Feest & LAN	2	[{"changed": {"fields": ["Photo"]}}]	19	2
456	2023-02-11 02:27:41.354214+00	27	2018-01-01 16:51:58+00:00 - 2019-05-31 15:51:59+00:00 Quaestor	2	[{"changed": {"fields": ["Photo"]}}]	19	2
457	2023-02-11 02:27:54.97597+00	26	2018-01-01 16:51:58+00:00 - 2019-05-31 15:51:59+00:00 Praeses	2	[{"changed": {"fields": ["Photo"]}}]	19	2
458	2023-02-11 02:28:27.435802+00	25	2019-06-01 15:51:37+00:00 - 2020-05-31 15:51:36+00:00 Cultuur	2	[{"changed": {"fields": ["Photo"]}}]	19	2
459	2023-02-11 02:29:23.84236+00	24	2019-06-01 15:51:37+00:00 - 2020-05-31 15:51:36+00:00 Sport	2	[{"changed": {"fields": ["Photo"]}}]	19	2
460	2023-02-11 02:29:44.319275+00	23	2019-06-01 15:51:37+00:00 - 2020-05-31 15:51:36+00:00 Schachtentemmer	2	[{"changed": {"fields": ["Photo"]}}]	19	2
461	2023-02-11 02:30:03.189218+00	22	2021-06-01 15:50:12+00:00 - 2022-05-31 15:50:11+00:00 Sport	2	[{"changed": {"fields": ["Photo"]}}]	19	2
462	2023-02-11 02:30:15.948292+00	21	2021-06-01 15:50:12+00:00 - 2022-05-31 15:50:11+00:00 Schachtentemmer	2	[{"changed": {"fields": ["Photo"]}}]	19	2
463	2023-02-11 02:31:59.127467+00	20	2021-06-01 15:50:12+00:00 - 2022-05-31 15:50:11+00:00 Secretaris	2	[{"changed": {"fields": ["Photo"]}}]	19	2
464	2023-02-11 02:32:18.988388+00	19	2021-06-01 15:50:12+00:00 - 2022-05-31 15:50:11+00:00 Feest & LAN	2	[{"changed": {"fields": ["Photo"]}}]	19	2
465	2023-02-11 02:32:28.535278+00	18	2021-06-01 15:50:12+00:00 - 2022-05-31 15:50:11+00:00 ICT	2	[{"changed": {"fields": ["Photo"]}}]	19	2
466	2023-02-11 02:33:27.579754+00	17	2018-01-01 16:51:58+00:00 - 2019-05-31 15:51:59+00:00 Sport	2	[{"changed": {"fields": ["Photo"]}}]	19	2
467	2023-02-11 02:34:47.832526+00	16	2021-06-01 15:50:12+00:00 - 2022-05-31 15:50:11+00:00 PR	2	[{"changed": {"fields": ["Photo"]}}]	19	2
468	2023-02-11 02:35:08.751329+00	15	2021-06-01 15:50:12+00:00 - 2022-05-31 15:50:11+00:00 Cultuur	2	[{"changed": {"fields": ["Photo"]}}]	19	2
469	2023-02-11 02:35:24.94605+00	14	2021-06-01 15:50:12+00:00 - 2022-05-31 15:50:11+00:00 Praeses	2	[{"changed": {"fields": ["Photo"]}}]	19	2
470	2023-02-11 02:35:40.336548+00	13	2020-05-01 15:51:09+00:00 - 2021-05-31 15:51:10+00:00 Media	2	[{"changed": {"fields": ["Photo"]}}]	19	2
471	2023-02-11 02:35:56.569511+00	12	2020-05-01 15:51:09+00:00 - 2021-05-31 15:51:10+00:00 Schachtentemmer	2	[{"changed": {"fields": ["Photo"]}}]	19	2
472	2023-02-11 02:38:01.425322+00	15	2021-06-01 15:50:12+00:00 - 2022-05-31 15:50:11+00:00 Cultuur	2	[{"changed": {"fields": ["Photo"]}}]	19	2
473	2023-02-11 02:38:40.35532+00	15	2021-06-01 15:50:12+00:00 - 2022-05-31 15:50:11+00:00 Cultuur	2	[{"changed": {"fields": ["Photo"]}}]	19	2
474	2023-02-11 02:40:46.029544+00	11	2020-05-01 15:51:09+00:00 - 2021-05-31 15:51:10+00:00 Sport	2	[{"changed": {"fields": ["Photo"]}}]	19	2
475	2023-02-11 02:40:59.271757+00	10	2020-05-01 15:51:09+00:00 - 2021-05-31 15:51:10+00:00 PR	2	[{"changed": {"fields": ["Photo"]}}]	19	2
476	2023-02-11 02:41:13.113066+00	9	2020-05-01 15:51:09+00:00 - 2021-05-31 15:51:10+00:00 Cultuur	2	[{"changed": {"fields": ["Photo"]}}]	19	2
477	2023-02-11 02:41:29.978611+00	8	2020-05-01 15:51:09+00:00 - 2021-05-31 15:51:10+00:00 Feest & LAN	2	[{"changed": {"fields": ["Photo"]}}]	19	2
478	2023-02-11 02:41:46.458096+00	7	2020-05-01 15:51:09+00:00 - 2021-05-31 15:51:10+00:00 Secretaris	2	[{"changed": {"fields": ["Photo"]}}]	19	2
479	2023-02-11 02:41:58.861282+00	6	2020-05-01 15:51:09+00:00 - 2021-05-31 15:51:10+00:00 Vice-Praeses	2	[{"changed": {"fields": ["Photo"]}}]	19	2
480	2023-02-11 02:42:19.223453+00	5	2020-05-01 15:51:09+00:00 - 2021-05-31 15:51:10+00:00 Praeses	2	[{"changed": {"fields": ["Photo"]}}]	19	2
481	2023-02-11 02:42:45.369016+00	4	2018-01-01 16:51:58+00:00 - 2019-05-31 15:51:59+00:00 ICT	2	[{"changed": {"fields": ["Photo"]}}]	19	2
482	2023-02-11 02:42:47.787366+00	3	2019-06-01 15:51:37+00:00 - 2020-05-31 15:51:36+00:00 Praeses	2	[{"changed": {"fields": ["Photo"]}}]	19	2
483	2023-02-11 02:43:07.407658+00	2	2020-05-01 15:51:09+00:00 - 2021-05-31 15:51:10+00:00 ICT	2	[{"changed": {"fields": ["Photo"]}}]	19	2
484	2023-02-11 02:43:25.309944+00	1	2018-01-01 16:51:58+00:00 - 2019-05-31 15:51:59+00:00 Vice-Praeses	2	[{"changed": {"fields": ["Photo"]}}]	19	2
485	2023-02-11 02:45:50.212133+00	7	2020-05-01 15:51:09+00:00 - 2021-05-31 15:51:10+00:00 Secretaris	2	[{"changed": {"fields": ["Photo"]}}]	19	2
486	2023-02-11 02:46:04.670633+00	7	2020-05-01 15:51:09+00:00 - 2021-05-31 15:51:10+00:00 Secretaris	2	[]	19	2
487	2023-02-11 02:47:01.508935+00	7	2020-05-01 15:51:09+00:00 - 2021-05-31 15:51:10+00:00 Secretaris	2	[{"changed": {"fields": ["Photo"]}}]	19	2
488	2023-02-11 02:48:18.099919+00	5	2020-05-01 15:51:09+00:00 - 2021-05-31 15:51:10+00:00 Praeses	2	[{"changed": {"fields": ["Photo"]}}]	19	2
489	2023-02-11 02:50:10.56945+00	24	2019-06-01 15:51:37+00:00 - 2020-05-31 15:51:36+00:00 Sport	2	[{"changed": {"fields": ["Photo"]}}]	19	2
490	2023-02-11 02:50:50.770514+00	38	2019-06-01 15:51:37+00:00 - 2020-05-31 15:51:36+00:00 ICT	2	[{"changed": {"fields": ["Photo"]}}]	19	2
491	2023-02-11 02:51:40.256983+00	23	2019-06-01 15:51:37+00:00 - 2020-05-31 15:51:36+00:00 Schachtentemmer	2	[{"changed": {"fields": ["Photo"]}}]	19	2
492	2023-02-11 02:53:35.103325+00	50	Ereleden Erelid	2	[{"changed": {"fields": ["Photo"]}}]	19	2
493	2023-02-11 02:53:43.580992+00	51	Ereleden Erelid	2	[{"changed": {"fields": ["Photo"]}}]	19	2
494	2023-02-11 02:54:11.009612+00	52	Ereleden Erelid	2	[{"changed": {"fields": ["Photo"]}}]	19	2
495	2023-02-11 02:54:20.059636+00	53	Ereleden Erelid	2	[{"changed": {"fields": ["Photo"]}}]	19	2
496	2023-02-11 02:54:32.920608+00	54	Ereleden Erelid	2	[{"changed": {"fields": ["Photo"]}}]	19	2
497	2023-02-11 02:55:35.95957+00	55	Ereleden Erelid	2	[{"changed": {"fields": ["Photo"]}}]	19	2
498	2023-02-11 02:56:29.439075+00	56	Ereleden Erelid	2	[{"changed": {"fields": ["Photo"]}}]	19	2
499	2023-02-11 02:56:36.592772+00	57	Ereleden Erelid	2	[{"changed": {"fields": ["Photo"]}}]	19	2
500	2023-02-11 02:56:47.729904+00	55	Ereleden Erelid	2	[{"changed": {"fields": ["Photo"]}}]	19	2
501	2023-02-11 03:04:32.261021+00	3	Heimdal Weekend	2	[{"changed": {"fields": ["Poster"]}}]	23	2
502	2023-02-11 03:05:14.933975+00	2	Lustrumbal	2	[{"changed": {"fields": ["Poster"]}}]	23	2
503	2023-02-11 03:08:01.725634+00	35	Karakombola	2	[{"changed": {"fields": ["Url", "Poster"]}}]	23	2
504	2023-02-11 03:12:25.419397+00	1	The one LAN to rule them all	2	[{"changed": {"fields": ["Poster"]}}]	23	2
505	2023-02-12 20:20:08.852458+00	36	jumpsky	1	[{"added": {}}]	17	2
506	2023-02-12 20:21:34.270199+00	36	jumpsky	2	[{"changed": {"fields": ["Logo"]}}]	17	2
507	2023-02-12 20:23:55.387662+00	37	lockdown escape	1	[{"added": {}}]	17	2
508	2023-02-12 20:27:43.396315+00	37	lockdown escape	2	[{"changed": {"fields": ["Logo"]}}]	17	2
509	2023-02-12 20:28:55.269661+00	37	lockdown escape	2	[{"changed": {"fields": ["Logo"]}}]	17	2
510	2023-02-13 09:55:15.359078+00	1	Comic Sans	2	[]	17	2
511	2023-02-13 09:55:38.119073+00	2	HOGENT	2	[]	17	2
512	2023-02-13 09:55:46.839341+00	3	Vrolijke Viking	2	[]	17	2
513	2023-02-13 09:56:07.56802+00	4	delaware	2	[]	17	2
514	2023-02-13 09:56:15.782143+00	5	Kenneth Franckaert	2	[]	17	2
515	2023-02-13 09:56:36.301263+00	35	Planet Talent	2	[]	17	2
516	2023-02-13 09:56:46.232828+00	36	jumpsky	2	[]	17	2
517	2023-02-13 09:56:54.372588+00	37	lockdown escape	2	[]	17	2
518	2023-02-13 10:09:01.331752+00	35	Planet Talent	2	[{"changed": {"fields": ["Logo"]}}]	17	2
519	2023-02-13 10:09:32.047118+00	35	Planet Talent	2	[{"changed": {"fields": ["Logo"]}}]	17	2
520	2023-02-13 10:11:27.242914+00	35	Planet Talent	2	[{"changed": {"fields": ["Logo"]}}]	17	2
521	2023-02-13 10:15:02.403182+00	38	Planet talent	1	[{"added": {}}]	17	2
522	2023-02-13 10:15:23.738944+00	38	Planet talent	2	[]	17	2
523	2023-02-13 10:15:28.75542+00	38	Planet talent	3		17	2
524	2023-02-13 10:17:46.842503+00	35	Planet Talent	2	[{"changed": {"fields": ["Logo"]}}]	17	2
525	2023-02-13 10:19:28.210041+00	35	Planet Talent	2	[{"changed": {"fields": ["Logo"]}}]	17	2
526	2023-02-13 10:20:56.349299+00	35	Planet Talent	2	[{"changed": {"fields": ["Logo"]}}]	17	2
527	2023-02-14 19:55:03.95773+00	35	Karakombola	2	[{"changed": {"fields": ["Start"]}}]	23	12
528	2023-02-20 13:28:35.410965+00	2	Lustrumbal	2	[{"changed": {"fields": ["Url"]}}]	23	12
529	2023-02-20 19:11:43.641354+00	68	Lustrumreceptie	1	[{"added": {}}]	23	12
530	2023-02-21 16:57:16.387624+00	7	sport@heimdal.be	2	[{"changed": {"fields": ["password"]}}]	4	2
531	2023-02-21 16:59:02.316798+00	69	Lustrumcantus	1	[{"added": {}}]	23	12
532	2023-02-21 17:10:47.637378+00	69	Lustrumcantus	2	[{"changed": {"fields": ["Description"]}}]	23	12
533	2023-02-21 17:14:51.895302+00	70	Karten	1	[{"added": {}}]	23	7
534	2023-02-21 17:25:06.673996+00	34	Schaatsen 2022	1	[{"added": {}}]	12	2
535	2023-02-21 17:30:09.527325+00	90	Schaatsen 2022 - groepsfoto	1	[{"added": {}}]	20	2
536	2023-02-21 18:54:00.28485+00	91	Schaatsen 2022 - banana treijn	1	[{"added": {}}]	20	2
537	2023-02-21 18:54:43.517572+00	92	Schaatsen 2022 - more bababa	1	[{"added": {}}]	20	2
538	2023-02-21 18:55:35.15243+00	93	Schaatsen 2022 - even mote banana	1	[{"added": {}}]	20	2
539	2023-02-21 18:56:44.408096+00	94	Schaatsen 2022 - reijn wuk	1	[{"added": {}}]	20	2
540	2023-02-21 18:57:47.699358+00	95	Schaatsen 2022 - ICT on ice	1	[{"added": {}}]	20	2
541	2023-02-21 18:58:57.625911+00	96	Schaatsen 2022 - jolien en kirsten	1	[{"added": {}}]	20	2
542	2023-02-21 18:59:45.187306+00	97	Schaatsen 2022 - shpeeeeed	1	[{"added": {}}]	20	2
543	2023-02-21 19:01:15.183991+00	98	Schaatsen 2022 - sport selfie	1	[{"added": {}}]	20	2
544	2023-02-21 19:03:08.999323+00	99	Schaatsen 2022 - schaats schaats	1	[{"added": {}}]	20	2
545	2023-02-21 19:06:40.500758+00	69	Lustrumcantus	2	[{"changed": {"fields": ["Description"]}}]	23	2
546	2023-02-22 16:53:49.376716+00	71	Lustrumstadsspel	1	[{"added": {}}]	23	12
547	2023-02-22 18:04:50.855751+00	71	Lustrumstadsspel	2	[{"changed": {"fields": ["Poster"]}}]	23	12
548	2023-02-22 18:09:20.004085+00	71	Lustrumstadsspel	2	[{"changed": {"fields": ["Poster"]}}]	23	12
549	2023-02-22 18:13:16.676189+00	71	Lustrumstadsspel	2	[{"changed": {"fields": ["Poster"]}}]	23	12
550	2023-02-22 18:24:15.056519+00	71	Lustrumstadsspel	3		23	12
551	2023-02-22 18:31:33.984862+00	72	Lustrumstadsspel	1	[{"added": {}}]	23	12
552	2023-02-22 21:45:51.868402+00	72	Lustrumstadsspel	2	[{"changed": {"fields": ["Description", "Poster"]}}]	23	12
553	2023-02-22 21:47:27.741737+00	72	Lustrumstadsspel	2	[{"changed": {"fields": ["Poster"]}}]	23	12
554	2023-02-23 16:56:41.700987+00	73	BBB: Bar, BBQ & Bands	1	[{"added": {}}]	23	12
555	2023-02-24 16:57:44.412916+00	2	Lustrumbal	2	[{"changed": {"fields": ["Description"]}}]	23	12
556	2023-03-09 14:06:53.450422+00	9	feest-lan@heimdal.be	2	[{"changed": {"fields": ["password"]}}]	4	2
557	2023-03-09 14:24:11.624354+00	1	The one LAN to rule them all	2	[{"changed": {"fields": ["Description", "Start", "End"]}}]	23	9
558	2023-03-09 16:29:29.522194+00	1	The one LAN to rule them all	2	[]	23	9
559	2023-03-12 16:23:20.254575+00	2	Lustrumbal	2	[{"changed": {"fields": ["Description"]}}]	23	3
592	2023-03-20 22:44:36.683633+00	11	cultuur@heimdal.be	2	[{"changed": {"fields": ["password"]}}]	4	2
593	2023-03-20 22:51:04.187821+00	106	Return of the filmavond	1	[{"added": {}}]	23	11
594	2023-03-24 08:12:57.928738+00	8	schachtentemmer@heimdal.be	2	[{"changed": {"fields": ["password"]}}]	4	2
595	2023-03-24 18:54:56.116057+00	1	The one LAN to rule them all	2	[{"changed": {"fields": ["Description"]}}]	23	9
628	2023-04-05 15:20:34.796597+00	71	ehbo-koffer.nl	1	[{"added": {}}]	17	2
629	2023-04-05 15:30:29.896867+00	71	ehbo-koffer.nl	2	[{"changed": {"fields": ["Logo"]}}]	17	2
630	2023-04-05 15:33:24.750048+00	71	ehbo-koffer.nl	2	[{"changed": {"fields": ["Logo"]}}]	17	2
631	2023-04-05 15:33:57.678348+00	71	ehbo-koffer.nl	2	[{"changed": {"fields": ["Logo"]}}]	17	2
632	2023-04-16 15:26:33.239128+00	139	Kano	1	[{"added": {}}]	23	7
633	2023-04-16 15:43:04.299757+00	140	Open vergadering	1	[{"added": {}}]	23	3
634	2023-04-16 15:49:05.297974+00	141	Piraten Zeeslag	1	[{"added": {}}]	23	4
635	2023-04-16 15:52:53.437905+00	142	Ontgroening	1	[{"added": {}}]	23	4
636	2023-04-16 15:56:23.100628+00	140	Open vergadering	2	[{"changed": {"fields": ["Description", "Poster", "Location"]}}]	23	7
637	2023-04-16 15:59:18.479224+00	35	Verkiezingen	1	[{"added": {}}]	9	4
638	2023-04-16 16:00:13.897397+00	143	Heimdal verkiezingen 2023-2024	1	[{"added": {}}]	23	3
639	2023-04-16 16:04:31.203878+00	140	Open vergadering	2	[{"changed": {"fields": ["Description"]}}]	23	7
640	2023-04-17 20:26:18.994879+00	143	Heimdal verkiezingen 2023-2024	2	[{"changed": {"fields": ["Description"]}}]	23	3
641	2023-04-18 16:39:58.88208+00	144	Fantasy Party	1	[{"added": {}}]	23	12
642	2023-04-21 17:00:07.156566+00	1	The one LAN to rule them all	2	[{"changed": {"fields": ["Url", "Poster"]}}]	23	3
643	2023-04-24 12:12:56.278908+00	1	The one LAN to rule them all	2	[{"changed": {"fields": ["Description"]}}]	23	2
644	2023-04-24 16:29:48.012953+00	142	Ontgroening: The Last Obstacle: A Journey Through Middle Earth	2	[{"changed": {"fields": ["Name", "Description", "Url", "Poster", "Start", "Location"]}}]	23	8
645	2023-04-24 16:30:54.969088+00	142	Ontgroening: The Last Obstacle: A Journey Through Middle Earth	2	[{"changed": {"fields": ["Is open"]}}]	23	8
646	2023-04-26 12:33:08.536377+00	144	Fantasy Party	2	[{"changed": {"fields": ["Description"]}}]	23	12
647	2023-04-26 13:48:44.235343+00	144	Fantasy Party	2	[{"changed": {"fields": ["Description", "Start"]}}]	23	12
648	2023-04-27 12:51:16.767473+00	72	it-planet	1	[{"added": {}}]	17	2
650	2023-05-04 20:36:28.224067+00	70	Febe: 2022-2023	2	[{"changed": {"fields": ["Last name"]}}]	14	2
651	2023-05-04 20:38:10.597942+00	89	Superschachten Superschacht	1	[{"added": {}}]	19	2
652	2023-05-16 07:57:21.671596+00	144	Fantasy Party	2	[{"changed": {"fields": ["Description"]}}]	23	12
653	2023-05-16 18:15:20.673397+00	40	2023-05-16 20:15:08+02:00 - 2024-05-16 20:15:10+02:00	1	[{"added": {}}]	15	2
654	2023-05-16 18:21:34.634145+00	71	Reina: Tanghe	1	[{"added": {}}]	14	2
655	2023-05-16 18:23:51.400526+00	72	Milan: De Smet	1	[{"added": {}}]	14	2
656	2023-05-16 18:25:41.385733+00	73	Febe: Coutteau	1	[{"added": {}}]	14	2
657	2023-05-16 18:26:55.853384+00	74	Eline: Claeys	1	[{"added": {}}]	14	2
658	2023-05-16 18:30:14.489212+00	90	2023-05-16 18:15:08+00:00 - 2024-05-16 18:15:10+00:00 Praeses	1	[{"added": {}}]	19	2
659	2023-05-16 18:31:31.602747+00	91	2023-05-16 18:15:08+00:00 - 2024-05-16 18:15:10+00:00 Vice-Praeses	1	[{"added": {}}]	19	2
660	2023-05-16 18:34:30.648392+00	92	2023-05-16 18:15:08+00:00 - 2024-05-16 18:15:10+00:00 Quaestor	1	[{"added": {}}]	19	2
661	2023-05-16 18:35:30.587984+00	93	2023-05-16 18:15:08+00:00 - 2024-05-16 18:15:10+00:00 Secretaris	1	[{"added": {}}]	19	2
662	2023-05-16 18:36:04.025809+00	94	2023-05-16 18:15:08+00:00 - 2024-05-16 18:15:10+00:00 PR	1	[{"added": {}}]	19	2
663	2023-05-16 18:37:45.597123+00	95	2023-05-16 18:15:08+00:00 - 2024-05-16 18:15:10+00:00 Media	1	[{"added": {}}]	19	2
664	2023-05-16 18:38:55.511537+00	96	2023-05-16 18:15:08+00:00 - 2024-05-16 18:15:10+00:00 Schachtentemmer	1	[{"added": {}}]	19	2
665	2023-05-16 18:40:34.046961+00	97	2023-05-16 18:15:08+00:00 - 2024-05-16 18:15:10+00:00 Cultuur	1	[{"added": {}}]	19	2
666	2023-05-16 18:42:13.63308+00	98	2023-05-16 18:15:08+00:00 - 2024-05-16 18:15:10+00:00 Sport	1	[{"added": {}}]	19	2
667	2023-05-16 18:43:16.078023+00	99	2023-05-16 18:15:08+00:00 - 2024-05-16 18:15:10+00:00 Feest & LAN	1	[{"added": {}}]	19	2
668	2023-05-16 18:44:35.943776+00	100	2023-05-16 18:15:08+00:00 - 2024-05-16 18:15:10+00:00 ICT	1	[{"added": {}}]	19	2
669	2023-05-16 20:00:17.403419+00	5	Feest & LAN	2	[]	13	2
670	2023-05-16 20:00:53.541787+00	48	Feest & LAN	1	[{"added": {}}]	13	2
671	2023-05-16 20:01:54.105933+00	48	keizer Feest & LAN	2	[{"changed": {"fields": ["Name"]}}]	13	2
672	2023-05-16 20:02:06.536871+00	99	2023-05-16 18:15:08+00:00 - 2024-05-16 18:15:10+00:00 keizer Feest & LAN	2	[{"changed": {"fields": ["Praesidium function"]}}]	19	2
673	2023-05-16 20:02:53.761514+00	48	Keizer Feest & LAN	2	[{"changed": {"fields": ["Name"]}}]	13	2
674	2023-05-16 20:18:12.501579+00	34	Erestuff	1	[{"added": {}}]	7	2
675	2023-05-16 20:26:01.416741+00	34	Erestuff	2	[{"changed": {"fields": ["Description"]}}]	7	2
676	2023-05-16 20:26:24.11412+00	34	rrestuff	2	[{"changed": {"fields": ["Name", "Title"]}}]	7	2
677	2023-05-16 20:26:33.333608+00	34	erestuff	2	[{"changed": {"fields": ["Name"]}}]	7	2
678	2023-05-16 20:27:36.20508+00	34	erestuff	2	[{"changed": {"fields": ["Description"]}}]	7	2
679	2023-05-16 20:28:28.575875+00	34	erestuff	2	[{"changed": {"fields": ["Description"]}}]	7	2
680	2023-05-16 20:31:51.187639+00	34	erestuff	2	[{"changed": {"fields": ["Description"]}}]	7	2
681	2023-05-16 20:51:09.325014+00	34	erestuff	2	[{"changed": {"fields": ["Description"]}}]	7	2
682	2023-05-16 20:52:02.77073+00	34	erestuff	2	[{"changed": {"fields": ["Title"]}}]	7	2
683	2023-05-16 20:55:37.562792+00	34	erestuff	2	[{"changed": {"fields": ["Description"]}}]	7	2
684	2023-05-16 20:57:21.675964+00	34	erestuff	2	[{"changed": {"fields": ["Description"]}}]	7	2
685	2023-05-16 20:57:46.84835+00	34	erestuff	2	[{"changed": {"fields": ["Description"]}}]	7	2
686	2023-05-16 20:58:24.926533+00	34	erestuff	2	[{"changed": {"fields": ["Description"]}}]	7	2
687	2023-05-16 21:00:30.001536+00	34	erestuff	2	[{"changed": {"fields": ["Description"]}}]	7	2
688	2023-05-16 21:01:08.648871+00	34	erestuff	2	[{"changed": {"fields": ["Description"]}}]	7	2
689	2023-05-21 21:12:15.409576+00	41	Lustrum comité	1	[{"added": {}}]	15	2
690	2023-05-21 21:15:33.223224+00	41	Lustrum comité	3		15	2
723	2023-06-02 21:02:18.275926+00	98	2023-05-16 18:15:08+00:00 - 2024-05-16 18:15:10+00:00 Sport	2	[{"changed": {"fields": ["Photo"]}}]	19	2
724	2023-06-02 21:02:36.888452+00	95	2023-05-16 18:15:08+00:00 - 2024-05-16 18:15:10+00:00 Media	2	[{"changed": {"fields": ["Photo"]}}]	19	2
725	2023-06-02 21:02:51.795233+00	94	2023-05-16 18:15:08+00:00 - 2024-05-16 18:15:10+00:00 PR	2	[{"changed": {"fields": ["Photo"]}}]	19	2
726	2023-06-02 21:03:04.66532+00	93	2023-05-16 18:15:08+00:00 - 2024-05-16 18:15:10+00:00 Secretaris	2	[{"changed": {"fields": ["Photo"]}}]	19	2
727	2023-06-02 22:10:11.719423+00	94	2023-05-16 18:15:08+00:00 - 2024-05-16 18:15:10+00:00 PR	2	[{"changed": {"fields": ["Photo"]}}]	19	2
728	2023-06-02 22:10:23.032124+00	95	2023-05-16 18:15:08+00:00 - 2024-05-16 18:15:10+00:00 Media	2	[{"changed": {"fields": ["Photo"]}}]	19	2
760	2023-06-12 12:09:09.925708+00	3	Stamboom	3		21	2
761	2023-06-27 14:14:23.276013+00	11	cultuur@heimdal.be	2	[{"changed": {"fields": ["First name", "Last name"]}}, {"changed": {"name": "profile", "object": "Tyra Bourgeois", "fields": ["Gsm", "Geslacht"]}}]	4	2
762	2023-06-27 14:14:44.518541+00	11	cultuur@heimdal.be	2	[{"changed": {"fields": ["password"]}}]	4	2
763	2023-06-27 14:14:51.636961+00	11	cultuur@heimdal.be	2	[]	4	2
764	2023-06-27 14:15:08.224745+00	9	feest-lan@heimdal.be	2	[{"changed": {"fields": ["password"]}}]	4	2
765	2023-06-27 14:15:16.427681+00	9	feest-lan@heimdal.be	2	[]	4	2
766	2023-06-27 14:15:27.846894+00	3	praeses@heimdal.be	2	[{"changed": {"fields": ["password"]}}]	4	2
767	2023-06-27 14:16:31.101177+00	3	praeses@heimdal.be	2	[{"changed": {"fields": ["First name", "Last name"]}}, {"changed": {"name": "profile", "object": "Sander De Bruyker", "fields": ["Geslacht"]}}]	4	2
768	2023-06-27 14:17:06.610203+00	10	pr@heimdal.be	2	[{"changed": {"fields": ["First name", "Last name"]}}]	4	2
769	2023-06-27 14:17:42.356415+00	5	quaestor@heimdal.be	2	[{"changed": {"fields": ["password"]}}]	4	2
770	2023-06-27 14:17:59.958164+00	5	quaestor@heimdal.be	2	[{"changed": {"fields": ["First name", "Last name"]}}]	4	2
771	2023-06-27 14:18:12.26312+00	10	pr@heimdal.be	2	[{"changed": {"fields": ["password"]}}]	4	2
772	2023-06-27 14:18:16.02562+00	10	pr@heimdal.be	2	[]	4	2
773	2023-06-27 14:18:55.378197+00	8	schachtentemmer@heimdal.be	2	[{"changed": {"fields": ["First name", "Last name"]}}]	4	2
774	2023-06-27 14:19:06.241501+00	8	schachtentemmer@heimdal.be	2	[{"changed": {"fields": ["password"]}}]	4	2
775	2023-06-27 14:19:20.852954+00	8	schachtentemmer@heimdal.be	2	[]	4	2
776	2023-06-27 14:20:12.038981+00	6	secretaris@heimdal.be	2	[{"changed": {"fields": ["First name", "Last name"]}}]	4	2
777	2023-06-27 14:20:24.007941+00	6	secretaris@heimdal.be	2	[{"changed": {"fields": ["password"]}}]	4	2
778	2023-06-27 14:20:38.017701+00	6	secretaris@heimdal.be	2	[]	4	2
779	2023-06-27 14:21:17.418995+00	7	sport@heimdal.be	2	[{"changed": {"fields": ["First name", "Last name"]}}, {"changed": {"name": "profile", "object": "Eline Claeys", "fields": ["Geslacht"]}}]	4	2
780	2023-06-27 14:21:26.737562+00	7	sport@heimdal.be	2	[{"changed": {"fields": ["password"]}}]	4	2
784	2023-06-27 14:22:15.048905+00	4	vice-praeses@heimdal.be	2	[]	4	2
781	2023-06-27 14:21:33.158664+00	7	sport@heimdal.be	2	[]	4	2
782	2023-06-27 14:22:01.625244+00	4	vice-praeses@heimdal.be	2	[{"changed": {"fields": ["First name", "Last name"]}}, {"changed": {"name": "profile", "object": "Hayley Rasschaert", "fields": ["Geslacht"]}}]	4	2
783	2023-06-27 14:22:11.519509+00	4	vice-praeses@heimdal.be	2	[{"changed": {"fields": ["password"]}}]	4	2
785	2023-08-28 18:21:44.865287+00	100	2023-05-16 18:15:08+00:00 - 2024-05-16 18:15:10+00:00 ICT	2	[{"changed": {"fields": ["Photo"]}}]	19	2
786	2023-08-28 18:23:04.339269+00	100	2023-05-16 18:15:08+00:00 - 2024-05-16 18:15:10+00:00 ICT	2	[{"changed": {"fields": ["Photo"]}}]	19	2
787	2023-08-28 18:23:11.051767+00	100	2023-05-16 18:15:08+00:00 - 2024-05-16 18:15:10+00:00 ICT	2	[]	19	2
788	2023-08-28 18:23:49.550423+00	92	2023-05-16 18:15:08+00:00 - 2024-05-16 18:15:10+00:00 Quaestor	2	[{"changed": {"fields": ["Photo"]}}]	19	2
789	2023-08-28 18:24:06.396807+00	98	2023-05-16 18:15:08+00:00 - 2024-05-16 18:15:10+00:00 Sport	2	[{"changed": {"fields": ["Photo"]}}]	19	2
790	2023-08-28 18:24:19.442183+00	95	2023-05-16 18:15:08+00:00 - 2024-05-16 18:15:10+00:00 Media	2	[{"changed": {"fields": ["Photo"]}}]	19	2
791	2023-08-28 18:24:29.828514+00	91	2023-05-16 18:15:08+00:00 - 2024-05-16 18:15:10+00:00 Vice-Praeses	2	[{"changed": {"fields": ["Photo"]}}]	19	2
792	2023-08-28 18:24:40.904855+00	94	2023-05-16 18:15:08+00:00 - 2024-05-16 18:15:10+00:00 PR	2	[{"changed": {"fields": ["Photo"]}}]	19	2
793	2023-08-28 18:24:53.692634+00	96	2023-05-16 18:15:08+00:00 - 2024-05-16 18:15:10+00:00 Schachtentemmer	2	[{"changed": {"fields": ["Photo"]}}]	19	2
794	2023-08-28 18:25:06.976749+00	93	2023-05-16 18:15:08+00:00 - 2024-05-16 18:15:10+00:00 Secretaris	2	[{"changed": {"fields": ["Photo"]}}]	19	2
795	2023-08-28 18:25:16.535339+00	90	2023-05-16 18:15:08+00:00 - 2024-05-16 18:15:10+00:00 Praeses	2	[{"changed": {"fields": ["Photo"]}}]	19	2
796	2023-08-28 18:25:36.909976+00	97	2023-05-16 18:15:08+00:00 - 2024-05-16 18:15:10+00:00 Cultuur	2	[{"changed": {"fields": ["Photo"]}}]	19	2
829	2023-09-20 11:55:50.5733+00	177	Stadsspel & Lintophanging	1	[{"added": {}}]	23	12
830	2023-09-20 11:56:55.1843+00	178	Karakoe	1	[{"added": {}}]	23	12
831	2023-09-20 11:58:02.747859+00	179	Ghost Hunt Clubavond	1	[{"added": {}}]	23	12
832	2023-09-20 11:59:49.410701+00	180	Escape room & Boardgames	1	[{"added": {}}]	23	12
833	2023-09-20 12:00:46.814367+00	181	Santa Claus clubavond	1	[{"added": {}}]	23	12
834	2023-09-20 12:01:38.324582+00	182	Casino Night	1	[{"added": {}}]	23	12
835	2023-09-20 12:02:45.849282+00	183	Comfy Secret Santa	1	[{"added": {}}]	23	12
836	2023-09-20 12:05:02.154241+00	184	1e Clubavond	1	[{"added": {}}]	23	12
837	2023-09-20 12:06:11.760756+00	177	Stadsspel & Lintophanging	2	[{"changed": {"fields": ["Description"]}}]	23	12
838	2023-09-20 19:38:00.128879+00	185	Student Kick-off 2023 Student Village	1	[{"added": {}}]	23	3
839	2023-09-20 19:44:18.412126+00	186	Stuvo Village	1	[{"added": {}}]	23	3
840	2023-09-20 19:53:57.529883+00	187	HOGENT openingsfuif: The Masterclass	1	[{"added": {}}]	23	3
841	2023-09-21 16:46:18.931835+00	177	Stadsspel & Lintophanging	2	[{"changed": {"fields": ["Url"]}}]	23	12
842	2023-09-25 16:32:15.583416+00	184	1ste Clubavond	2	[{"changed": {"fields": ["Name", "Description", "Url", "Poster"]}}]	23	12
843	2023-09-27 09:19:52.858662+00	6	overons	2	[{"changed": {"fields": ["Description"]}}]	7	2
844	2023-09-27 09:34:30.718808+00	6	overons	2	[{"changed": {"fields": ["Description"]}}]	7	2
845	2023-09-27 09:37:02.637862+00	71	ehbo-koffer.nl	3		17	2
846	2023-09-27 09:37:15.178652+00	5	Kenneth Franckaert	3		17	2
847	2023-09-27 09:37:23.953661+00	36	jumpsky	3		17	2
848	2023-09-27 09:37:28.923812+00	37	lockdown escape	3		17	2
849	2023-09-27 09:37:57.958009+00	72	it-planet	3		17	2
850	2023-09-27 09:38:04.371799+00	35	Planet Talent	3		17	2
851	2023-09-28 12:50:44.79363+00	105	Cloudcom	1	[{"added": {}}]	17	2
852	2023-09-29 06:49:31.49571+00	7	sport@heimdal.be	2	[{"changed": {"fields": ["password"]}}]	4	2
853	2023-09-30 17:50:38.680332+00	188	Mario Kart toernooi	1	[{"added": {}}]	23	3
854	2023-09-30 17:53:06.712552+00	188	Mario Kart toernooi	2	[{"changed": {"fields": ["Description"]}}]	23	3
855	2023-10-04 09:09:41.776354+00	8	schachtentemmer@heimdal.be	2	[{"changed": {"fields": ["password"]}}]	4	2
856	2023-10-04 10:14:27.001089+00	189	Doop: Attack on the Spanish Galleon	1	[{"added": {}}]	23	8
857	2023-10-04 10:15:50.683208+00	190	Schachtenevenement: TBA	1	[{"added": {}}]	23	8
858	2023-10-04 10:17:17.634382+00	191	Nadoop	1	[{"added": {}}]	23	8
859	2023-10-04 16:02:03.995996+00	181	Sinterklaas clubavond	2	[{"changed": {"fields": ["Name"]}}]	23	12
860	2023-10-04 16:03:59.363238+00	178	Karakoe	2	[{"changed": {"fields": ["Description", "Url", "Poster"]}}]	23	12
861	2023-10-05 08:35:28.46331+00	9	feest-lan@heimdal.be	2	[{"changed": {"fields": ["password"]}}]	4	2
862	2023-10-05 15:45:02.447566+00	192	Overpoort Feest	1	[{"added": {}}]	23	9
863	2023-10-07 13:27:20.8011+00	193	WAN	1	[{"added": {}}]	23	9
864	2023-10-07 13:30:07.578716+00	193	WAN	2	[{"changed": {"fields": ["Description", "Poster"]}}]	23	9
865	2023-10-09 13:57:15.604295+00	99	2023-05-16 18:15:08+00:00 - 2024-05-16 18:15:10+00:00 Keizer Feest & LAN	2	[{"changed": {"fields": ["Photo"]}}]	19	2
866	2023-10-09 13:58:00.252677+00	99	2023-05-16 18:15:08+00:00 - 2024-05-16 18:15:10+00:00 Keizer Feest & LAN	2	[{"changed": {"fields": ["Photo"]}}]	19	2
867	2023-10-09 14:00:21.444027+00	97	2023-05-16 18:15:08+00:00 - 2024-05-16 18:15:10+00:00 Cultuur	2	[{"changed": {"fields": ["Photo"]}}]	19	2
868	2023-10-09 14:06:15.951223+00	99	2023-05-16 18:15:08+00:00 - 2024-05-16 18:15:10+00:00 Keizer Feest & LAN	2	[{"changed": {"fields": ["Photo"]}}]	19	2
869	2023-10-09 14:07:10.973187+00	97	2023-05-16 18:15:08+00:00 - 2024-05-16 18:15:10+00:00 Cultuur	2	[{"changed": {"fields": ["Photo"]}}]	19	2
870	2023-10-10 10:37:30.191312+00	3	praeses@heimdal.be	2	[{"changed": {"fields": ["password"]}}]	4	2
871	2023-10-13 20:03:18.838382+00	189	Doop: Attack on the Spanish Galleon	2	[{"changed": {"fields": ["Poster"]}}]	23	8
872	2023-10-13 20:05:37.968161+00	189	Doop: Attack on the Spanish Galleon	2	[{"changed": {"fields": ["Url"]}}]	23	8
905	2023-10-25 17:08:28.717961+00	179	Ghost Hunt Clubavond	2	[{"changed": {"fields": ["Description", "Poster"]}}]	23	12
906	2023-10-26 07:05:55.695615+00	179	Ghost Hunt Clubavond	2	[{"changed": {"fields": ["Url"]}}]	23	12
939	2023-10-27 18:50:48.738682+00	192	Overpoort Feest	2	[{"changed": {"fields": ["Description", "Poster", "Start", "End", "Location"]}}]	23	9
940	2023-10-27 18:51:06.398139+00	192	Overpoort Feestje: The Hunt for booty	2	[{"changed": {"fields": ["Name"]}}]	23	9
941	2023-10-30 19:14:36.98873+00	180	Escape room & Boardgames	2	[{"changed": {"fields": ["Description", "Poster"]}}]	23	12
942	2023-10-30 19:32:10.604917+00	67	Mariokart 2023	1	[{"added": {}}]	12	2
943	2023-10-30 19:34:29.097659+00	132	Mariokart 2023 - priiizes	1	[{"added": {}}]	20	2
944	2023-10-30 19:36:46.879094+00	132	Mariokart 2023 - priiizes	2	[{"changed": {"fields": ["Link"]}}]	20	2
946	2023-10-30 19:38:57.756279+00	134	Mariokart 2023 - Milan opt podium ofwa	1	[{"added": {}}]	20	2
947	2023-10-30 19:39:24.156264+00	135	Mariokart 2023 - Tank takes dos	1	[{"added": {}}]	20	2
945	2023-10-30 19:38:30.7433+00	133	Mariokart 2023 - WHO IS THE NEW GUY?????	1	[{"added": {}}]	20	2
948	2023-10-30 20:18:31.282693+00	180	Escape room & Boardgames	2	[{"changed": {"fields": ["Url"]}}]	23	12
949	2023-10-30 20:43:50.499717+00	136	Mariokart 2023 - game gang	1	[{"added": {}}]	20	2
950	2023-10-30 20:44:49.043898+00	137	Mariokart 2023 - tank and the gang	1	[{"added": {}}]	20	2
951	2023-10-30 20:46:32.969189+00	138	Mariokart 2023 - ROOOOOBINNNNN	1	[{"added": {}}]	20	2
952	2023-10-30 20:49:30.61305+00	139	Mariokart 2023 - groep	1	[{"added": {}}]	20	2
953	2023-10-30 20:55:25.92362+00	68	Lintophanging CS	1	[{"added": {}}]	12	2
954	2023-10-30 20:57:02.350742+00	140	Lintophanging CS - lintje met nieuw jaar	1	[{"added": {}}]	20	2
955	2023-10-30 20:57:59.931902+00	141	Lintophanging CS - de sander geeft lint af aan de beste barmannen op aarde	1	[{"added": {}}]	20	2
956	2023-10-30 20:58:42.559111+00	142	Lintophanging CS - eeeee	1	[{"added": {}}]	20	2
957	2023-10-30 20:59:06.084398+00	143	Lintophanging CS - asfd	1	[{"added": {}}]	20	2
958	2023-10-30 21:05:43.991889+00	69	lintophanging Vrolijke Viking	1	[{"added": {}}]	12	2
959	2023-10-30 21:06:39.643423+00	144	lintophanging Vrolijke Viking - Niels that smile please have my babys	1	[{"added": {}}]	20	2
960	2023-10-30 21:07:05.032764+00	144	lintophanging Vrolijke Viking - Niels that smile please have my babys	2	[{"changed": {"fields": ["Link"]}}]	20	2
961	2023-10-30 21:08:19.394731+00	145	lintophanging Vrolijke Viking - This man can be my daddy	1	[{"added": {}}]	20	2
962	2023-10-30 21:09:59.859131+00	146	lintophanging Vrolijke Viking - HEIMDAL IS GEEN DRANK VERENEGING MAAR PINTJE LEKKER	1	[{"added": {}}]	20	2
963	2023-10-30 21:10:48.955225+00	147	lintophanging Vrolijke Viking - LONG HAIR GAAANG	1	[{"added": {}}]	20	2
964	2023-10-30 21:11:45.394519+00	148	lintophanging Vrolijke Viking - 4 op een rij en bram die weer bram is	1	[{"added": {}}]	20	2
965	2023-10-30 21:12:37.762508+00	149	lintophanging Vrolijke Viking - Meter lint Meter lint	1	[{"added": {}}]	20	2
966	2023-10-30 21:14:56.38582+00	68	Lintophanging Comic Sans	2	[{"changed": {"fields": ["Name"]}}]	12	2
967	2023-10-30 21:15:32.308392+00	70	Karakoe 2023	1	[{"added": {}}]	12	2
968	2023-10-30 21:18:48.230894+00	150	Karakoe 2023 - Digging a hole	1	[{"added": {}}]	20	2
969	2023-10-30 21:21:15.470562+00	150	Karakoe 2023 - Digging a hole	2	[{"changed": {"fields": ["Link"]}}]	20	2
970	2023-10-30 21:22:33.975413+00	151	Karakoe 2023 - groep of happy feutjes	1	[{"added": {}}]	20	2
971	2023-10-30 21:23:22.755864+00	152	Karakoe 2023 - chilling in bothe	1	[{"added": {}}]	20	2
972	2023-10-30 21:25:12.59467+00	153	Karakoe 2023 - Happy singing noises	1	[{"added": {}}]	20	2
973	2023-10-30 21:26:08.047233+00	154	Karakoe 2023 - pozing like bosses	1	[{"added": {}}]	20	2
974	2023-10-30 21:27:22.92596+00	155	Karakoe 2023 - D i d  y ou  k n o w  about the word?	1	[{"added": {}}]	20	2
975	2023-10-30 21:28:04.876122+00	156	Karakoe 2023 - Happy singing	1	[{"added": {}}]	20	2
976	2023-10-30 21:29:48.074459+00	157	Karakoe 2023 - BENNY sexy man	1	[{"added": {}}]	20	2
977	2023-10-30 21:30:38.94239+00	158	Karakoe 2023 - Blije mensen om op karakoe te zijn	1	[{"added": {}}]	20	2
978	2023-10-30 21:31:24.474822+00	159	Karakoe 2023 - Ik heb geen zin om een alt text te verzinnen voor den deze dus: mensen aan tafel	1	[{"added": {}}]	20	2
979	2023-10-30 21:42:27.946547+00	71	Weekend 2022	1	[{"added": {}}]	12	2
980	2023-10-30 21:44:21.597173+00	160	Weekend 2022 - The gang	1	[{"added": {}}]	20	2
981	2023-10-30 21:44:42.281807+00	160	Weekend 2022 - The gang	2	[]	20	2
982	2023-10-30 21:45:30.407362+00	160	Weekend 2022 - The gang	2	[]	20	2
983	2023-10-30 21:45:55.087493+00	161	Weekend 2022 - The gang 2	1	[{"added": {}}]	20	2
984	2023-10-30 21:46:25.937003+00	161	Weekend 2022 - The gang 2	3		20	2
985	2023-10-30 21:46:44.651465+00	71	Weekend 2022	2	[]	12	2
986	2023-10-30 21:46:47.32971+00	160	Weekend 2022 - The gang	3		20	2
987	2023-10-30 21:47:21.151787+00	162	Weekend 2022 - The gang	1	[{"added": {}}]	20	2
988	2023-10-30 21:48:21.529504+00	71	Weekend 2022	2	[{"changed": {"fields": ["Created at"]}}]	12	2
989	2023-10-30 21:48:35.750022+00	162	Weekend 2022 - The gang	2	[]	20	2
990	2023-10-30 21:49:11.262933+00	71	Weekend 2023	2	[{"changed": {"fields": ["Name", "Created at"]}}]	12	2
991	2023-10-30 21:49:19.20844+00	162	Mariokart 2023 - The gang	2	[{"changed": {"fields": ["Album"]}}]	20	2
992	2023-10-30 21:49:25.125509+00	162	Weekend 2023 - The gang	2	[{"changed": {"fields": ["Album"]}}]	20	2
993	2023-10-30 21:51:33.659159+00	163	Weekend 2023 - Lukas te groote voor auto	1	[{"added": {}}]	20	2
994	2023-10-30 21:51:54.982827+00	164	Weekend 2023 - VUUUUUUUUR	1	[{"added": {}}]	20	2
995	2023-10-30 21:52:23.584973+00	165	Weekend 2023 - Avond eten me dabbende bram	1	[{"added": {}}]	20	2
996	2023-10-30 21:53:05.983725+00	166	Weekend 2023 - Wannes in de volvo met hotdogs	1	[{"added": {}}]	20	2
997	2023-10-30 21:53:42.687985+00	167	Weekend 2023 - Rein me geit	1	[{"added": {}}]	20	2
998	2023-10-30 21:54:21.85496+00	168	Weekend 2023 - UNIT SEPP	1	[{"added": {}}]	20	2
999	2023-10-30 21:54:54.590361+00	169	Weekend 2023 - Milan is slep	1	[{"added": {}}]	20	2
1000	2023-10-30 21:55:25.805603+00	170	Weekend 2023 - Eline me geit	1	[{"added": {}}]	20	2
1001	2023-10-30 21:55:48.612321+00	171	Weekend 2023 - Reina geit	1	[{"added": {}}]	20	2
1002	2023-10-30 21:56:29.756122+00	172	Weekend 2023 - Benny met peil	1	[{"added": {}}]	20	2
1003	2023-10-30 21:56:54.769118+00	173	Weekend 2023 - Benny achter pijl	1	[{"added": {}}]	20	2
1004	2023-10-30 21:56:59.862232+00	162	Weekend 2023 - The gang	2	[{"changed": {"fields": ["Is carousel pic"]}}]	20	2
1005	2023-10-30 21:57:38.70239+00	174	Weekend 2023 - wolla fire	1	[{"added": {}}]	20	2
1006	2023-10-30 21:58:16.881117+00	175	Weekend 2023 - Tussen stop in de BK obderweg naar huis	1	[{"added": {}}]	20	2
1007	2023-10-30 22:05:01.072863+00	72	LAN 2023	1	[{"added": {}}]	12	2
1008	2023-10-30 22:17:48.436979+00	176	LAN 2023 - Welcome to LAN 2023	1	[{"added": {}}]	20	2
1009	2023-10-30 22:18:29.241778+00	177	LAN 2023 - F1 sim go brrrr	1	[{"added": {}}]	20	2
1010	2023-10-30 22:19:06.239619+00	178	LAN 2023 - Playing woman repelant	1	[{"added": {}}]	20	2
1011	2023-10-30 22:19:30.001658+00	179	LAN 2023 - GAMING GAMING	1	[{"added": {}}]	20	2
1012	2023-10-30 22:20:00.06943+00	180	LAN 2023 - Nonkel jochen	1	[{"added": {}}]	20	2
1013	2023-10-30 22:20:19.14574+00	181	LAN 2023 - Ons tyra	1	[{"added": {}}]	20	2
1014	2023-10-30 22:20:44.604977+00	182	LAN 2023 - Squiiiish	1	[{"added": {}}]	20	2
1015	2023-10-30 22:21:04.59976+00	183	LAN 2023 - Squiiiish 2	1	[{"added": {}}]	20	2
1016	2023-10-30 22:21:37.288517+00	184	LAN 2023 - FOCUS	1	[{"added": {}}]	20	2
1017	2023-10-30 22:22:02.457328+00	185	LAN 2023 - Jolien enthousisat	1	[{"added": {}}]	20	2
1018	2023-10-30 22:22:29.767036+00	186	LAN 2023 - Ons shild	1	[{"added": {}}]	20	2
1019	2023-10-30 22:22:51.860587+00	187	LAN 2023 - Hayley Happy	1	[{"added": {}}]	20	2
1020	2023-10-30 22:23:30.30843+00	188	LAN 2023 - Robin FOCUS	1	[{"added": {}}]	20	2
1023	2023-10-30 22:24:48.662364+00	191	LAN 2023 - Teil laptop master race	1	[{"added": {}}]	20	2
1024	2023-10-30 22:25:09.824141+00	192	LAN 2023 - Tibo reeee	1	[{"added": {}}]	20	2
1021	2023-10-30 22:23:54.995015+00	189	LAN 2023 - Sfeer foto	1	[{"added": {}}]	20	2
1022	2023-10-30 22:24:16.888836+00	190	LAN 2023 - Febe aant lachen	1	[{"added": {}}]	20	2
1025	2023-10-30 22:25:31.587731+00	193	LAN 2023 - Winner winner	1	[{"added": {}}]	20	2
1026	2023-10-30 22:25:59.595609+00	194	LAN 2023 - Gaming zoveel	1	[{"added": {}}]	20	2
1027	2023-10-30 22:26:18.903344+00	195	LAN 2023 - U hier	1	[{"added": {}}]	20	2
1028	2023-10-30 22:26:40.371459+00	196	LAN 2023 - Thumbs up	1	[{"added": {}}]	20	2
1029	2023-10-30 22:27:02.691312+00	197	LAN 2023 - Rein met scherm	1	[{"added": {}}]	20	2
1030	2023-10-30 22:27:24.47304+00	198	LAN 2023 - Inkom gang	1	[{"added": {}}]	20	2
1031	2023-10-30 22:27:46.889907+00	199	LAN 2023 - Gasming 10000	1	[{"added": {}}]	20	2
1032	2023-10-30 22:28:07.780161+00	200	LAN 2023 - Nick hoed	1	[{"added": {}}]	20	2
1033	2023-10-30 22:28:42.625605+00	201	LAN 2023 - Rocket league	1	[{"added": {}}]	20	2
1034	2023-10-30 22:29:06.727733+00	202	LAN 2023 - Beware of the nerd	1	[{"added": {}}]	20	2
1035	2023-10-30 22:30:02.10945+00	203	LAN 2023 - Sepp op achtergrund being wuk	1	[{"added": {}}]	20	2
1036	2023-10-30 22:30:35.450339+00	204	LAN 2023 - BRAM ZIJN STOEL BRAM ZIJN STOEL	1	[{"added": {}}]	20	2
1037	2023-10-30 22:31:02.660487+00	205	LAN 2023 - Jochen being cute af	1	[{"added": {}}]	20	2
1038	2023-10-30 22:31:51.604754+00	206	LAN 2023 - Winnaar winnaar kip avondeten	1	[{"added": {}}]	20	2
1039	2023-10-30 22:32:56.387425+00	176	LAN 2023 - AWelcome to LAN 2023	2	[{"changed": {"fields": ["Name", "Description", "Is carousel pic"]}}]	20	2
1040	2023-10-30 22:33:59.30365+00	193	LAN 2023 - Winner winner	3		20	2
1041	2023-11-07 14:00:51.802869+00	226	Heimdal schaatsen	1	[{"added": {}}]	23	7
1042	2023-11-07 19:41:32.551459+00	190	Schachtenevenement: TBA	3		23	3
1043	2023-11-08 16:33:42.76395+00	227	Open vergadering	1	[{"added": {}}]	23	6
1044	2023-11-08 17:21:08.494654+00	227	Open vergadering	2	[{"changed": {"fields": ["Url"]}}]	23	6
1045	2023-11-12 18:13:45.869443+00	192	Overpoort Feestje: The Hunt for booty	2	[{"changed": {"fields": ["End"]}}]	23	9
1046	2023-11-15 18:09:23.324161+00	228	Heimdalweekend	1	[{"added": {}}]	23	12
1047	2023-11-18 19:40:44.134862+00	1	boekje	2	[]	7	6
1048	2023-11-18 19:48:49.14279+00	1	boekje	2	[{"changed": {"fields": ["Description"]}}]	7	6
1049	2023-11-22 18:01:14.930916+00	183	Comfy Secret Santa	2	[{"changed": {"fields": ["Description", "Url", "Poster", "Start"]}}]	23	12
1050	2023-11-24 18:07:22.45533+00	229	The WAN of the flying Dutchman	1	[{"added": {}}]	23	9
1051	2023-11-24 18:07:54.651398+00	193	WAN	3		23	9
1052	2023-11-24 18:08:37.402209+00	229	The WAN of the flying Dutchman	2	[{"changed": {"fields": ["Description"]}}]	23	9
1053	2023-11-24 18:12:49.777537+00	229	The WAN of the Flying Dutchman	2	[{"changed": {"fields": ["Name", "Description"]}}]	23	9
1054	2023-11-27 17:43:12.563848+00	182	Casino Night	2	[{"changed": {"fields": ["Description", "Poster"]}}]	23	12
1055	2023-11-27 17:58:13.948431+00	182	Casino Night	2	[{"changed": {"fields": ["Url"]}}]	23	12
1056	2023-12-01 16:53:42.031692+00	229	The WAN of the Flying Dutchman	2	[{"changed": {"fields": ["Description", "Poster"]}}]	23	9
1057	2023-12-01 17:30:40.362164+00	229	The WAN of the Flying Dutchman	2	[{"changed": {"fields": ["Poster"]}}]	23	9
1058	2023-12-01 18:18:05.454958+00	181	Sinterklaas clubavond	2	[{"changed": {"fields": ["Description", "Url", "Poster"]}}]	23	12
1059	2023-12-04 19:44:19.467649+00	191	Nadoop	2	[{"changed": {"fields": ["Description", "Url", "Location"]}}]	23	3
1060	2023-12-12 05:47:40.879395+00	182	Casino Night	3		23	12
1061	2023-12-15 09:07:49.733294+00	138	Reproduct.be	1	[{"added": {}}]	17	2
1062	2023-12-18 20:19:46.054033+00	139	planet-talent	1	[{"added": {}}]	17	2
1063	2023-12-25 12:59:33.391702+00	1	boekje	2	[{"changed": {"fields": ["Description"]}}]	7	6
1064	2024-02-02 11:19:21.129889+00	230	Will you be my Valentine Clubavond	1	[{"added": {}}]	23	12
1065	2024-02-02 11:21:19.897121+00	231	Pizza & Boardgames	1	[{"added": {}}]	23	12
1066	2024-02-02 11:22:27.781489+00	232	Easter Egg Hunt Clubavond	1	[{"added": {}}]	23	12
1067	2024-02-02 11:23:51.787495+00	233	Movie Night	1	[{"added": {}}]	23	12
1068	2024-02-02 11:26:18.178442+00	234	Karakoe	1	[{"added": {}}]	23	12
1069	2024-02-02 11:27:14.468638+00	235	Verbroedering met Confabula	1	[{"added": {}}]	23	12
1070	2024-02-03 17:51:54.832847+00	236	Just Dance Toernooi	1	[{"added": {}}]	23	7
1071	2024-02-03 17:54:43.2607+00	237	Schaaktoernooi Heimdal	1	[{"added": {}}]	23	7
1072	2024-02-03 17:55:43.939066+00	238	Heimdal Bowlen	1	[{"added": {}}]	23	7
1073	2024-02-05 14:32:34.581294+00	239	Verkiezingen	1	[{"added": {}}]	23	3
1074	2024-02-06 15:55:35.862904+00	240	Open vergadering	1	[{"added": {}}]	23	6
1075	2024-02-07 17:57:06.33267+00	230	Will you be my Valentine Clubavond	2	[{"changed": {"fields": ["Description", "Url", "Poster"]}}]	23	12
1076	2024-02-08 16:43:47.652491+00	241	LAN 2024	1	[{"added": {}}]	23	9
1077	2024-02-08 16:50:55.860755+00	242	Feest 2024	1	[{"added": {}}]	23	9
1078	2024-02-18 18:09:08.289897+00	8	schachtentemmer@heimdal.be	2	[{"changed": {"fields": ["password"]}}]	4	2
1079	2024-02-20 18:18:09.965244+00	243	Ontgroening	1	[{"added": {}}]	23	8
1080	2024-02-26 14:30:51.193193+00	241	LAN 2024	2	[{"changed": {"fields": ["Description", "Poster"]}}]	23	9
1081	2024-02-26 14:31:38.855811+00	241	LAN 2024	2	[{"changed": {"fields": ["Location"]}}]	23	9
1082	2024-02-26 14:32:22.92196+00	241	LAN 2024	2	[{"changed": {"fields": ["Description"]}}]	23	9
1083	2024-03-05 17:26:12.769302+00	241	LAN 2024	2	[{"changed": {"fields": ["Description"]}}]	23	9
1084	2024-03-05 17:29:03.974386+00	241	LAN 2024	2	[{"changed": {"fields": ["Description", "Location"]}}]	23	9
1085	2024-03-05 17:30:56.223191+00	241	LAN 2024	2	[{"changed": {"fields": ["Poster"]}}]	23	9
1086	2024-03-05 19:39:07.0091+00	241	LAN 2024	2	[{"changed": {"fields": ["Description", "Url", "Location"]}}]	23	12
1087	2024-03-06 10:32:13.034508+00	226	Heimdal schaatsen	2	[]	23	7
1088	2024-03-06 10:33:24.027675+00	237	Schaaktoernooi Heimdal	2	[{"changed": {"fields": ["Description"]}}]	23	7
1089	2024-03-07 18:05:44.129008+00	231	Pizza & Boardgames	2	[{"changed": {"fields": ["Description", "Url", "Poster", "Start", "End"]}}]	23	12
1090	2024-03-08 18:47:09.639354+00	140	sponsor benny	1	[{"added": {}}]	17	2
1091	2024-03-13 08:38:58.424515+00	141	Alternate	1	[{"added": {}}]	17	2
1092	2024-03-21 11:16:25.598161+00	232	Easter Egg Hunt Clubavond	2	[{"changed": {"fields": ["Description", "Url", "Poster"]}}]	23	12
1093	2024-03-21 11:17:11.47494+00	232	Easter Egg Hunt Clubavond	2	[{"changed": {"fields": ["Location"]}}]	23	12
1094	2024-03-26 20:04:33.768972+00	232	Easter Egg Hunt Clubavond	2	[{"changed": {"fields": ["Description", "Location"]}}]	23	12
1095	2024-04-01 19:06:12.020612+00	233	Movie Night	2	[{"changed": {"fields": ["Description", "Url", "Poster", "Start"]}}]	23	12
3152	2026-03-05 20:08:17.753011+00	1126	Schaatsen 2025 - Schaatsen 2025	3		20	8
1096	2024-04-03 18:04:57.762763+00	234	Karakoe & schildophanging	2	[{"changed": {"fields": ["Name", "Description", "Url", "Poster", "Start"]}}]	23	12
1097	2024-04-08 18:46:42.575764+00	238	Heimdal Bowlen	2	[{"changed": {"fields": ["Description", "Start"]}}]	23	7
1098	2024-04-16 11:31:29.947133+00	240	Open vergadering	2	[{"changed": {"fields": ["Description", "Url", "Poster", "Location", "Max registered"]}}]	23	6
1099	2024-04-16 17:00:06.321405+00	235	Verbroedering met Confabula	2	[{"changed": {"fields": ["Description", "Url", "Poster", "Start", "End", "Location"]}}]	23	12
1100	2024-04-16 17:01:26.932702+00	235	Verbroedering met Confabula	2	[{"changed": {"fields": ["Description"]}}]	23	12
1101	2024-04-18 17:06:31.635627+00	242	Feest 2024	2	[{"changed": {"fields": ["Description", "Poster", "Start", "End", "Location"]}}]	23	9
1102	2024-04-18 17:07:04.370434+00	242	Feest 2024	2	[{"changed": {"fields": ["Description"]}}]	23	9
1103	2024-04-18 19:34:29.621988+00	239	Verkiezingen	2	[{"changed": {"fields": ["Description", "Url", "Poster", "Start"]}}]	23	3
1104	2024-04-27 21:08:33.438337+00	235	Verbroedering met Confabula	2	[{"changed": {"fields": ["Description", "Start", "Location"]}}]	23	12
1105	2024-04-27 21:10:57.373551+00	235	Verbroedering met Confabula	2	[{"changed": {"fields": ["Poster", "Location"]}}]	23	12
1106	2024-05-05 09:42:08.327017+00	105	Britt: Emanuel	1	[{"added": {}}]	14	2
1107	2024-05-05 09:43:06.219532+00	133	Superschachten Superschacht	1	[{"added": {}}]	19	2
1108	2024-05-05 09:43:08.228343+00	133	Superschachten Superschacht	2	[]	19	2
1109	2024-05-05 15:13:15.877226+00	105	Britt: 2022-2023	2	[{"changed": {"fields": ["Last name"]}}]	14	2
1110	2024-05-08 17:45:46.325041+00	105	Britt: 2023-2024	2	[{"changed": {"fields": ["Last name"]}}]	14	3
1143	2024-05-21 18:45:28.156508+00	3	praeses@heimdal.be	2	[{"changed": {"fields": ["password"]}}]	4	2
1176	2024-06-18 19:32:32.356549+00	74	Praesidium 2024-2025	1	[{"added": {}}]	15	2
1177	2024-06-18 19:34:37.225321+00	74	2024 - 2025	2	[{"changed": {"fields": ["Display name"]}}]	15	2
1178	2024-06-18 19:39:11.262538+00	89	Superschachten Superschacht	2	[{"changed": {"fields": ["Photo"]}}]	19	2
1179	2024-06-18 19:39:30.377794+00	89	Superschachten Superschacht	2	[{"changed": {"fields": ["Photo"]}}]	19	2
1180	2024-06-18 19:43:11.852323+00	166	2024 - 2025 Media	1	[{"added": {}}]	19	2
1181	2024-06-18 19:47:08.781843+00	138	Britt: Emanuel	1	[{"added": {}}]	14	2
1182	2024-06-18 19:47:34.549657+00	166	2024 - 2025 Media	2	[{"changed": {"fields": ["Praesidium member"]}}]	19	2
1183	2024-06-18 19:49:34.281719+00	139	Annelies: Van Nuffel	1	[{"added": {}}]	14	2
1184	2024-06-18 19:50:59.843507+00	167	2024 - 2025 PR	1	[{"added": {}}]	19	2
1185	2024-06-18 19:52:15.246237+00	140	Diede: Devriendt	1	[{"added": {}}]	14	2
1186	2024-06-18 19:52:42.57656+00	168	2024 - 2025 Schachtentemmer	1	[{"added": {}}]	19	2
1187	2024-06-18 20:01:25.084556+00	141	Aaron: Vandeweghe	1	[{"added": {}}]	14	2
1188	2024-06-18 20:01:43.97606+00	169	2024 - 2025 ICT	1	[{"added": {}}]	19	2
1189	2024-06-18 20:04:59.569563+00	142	Maxe: Adams	1	[{"added": {}}]	14	2
1190	2024-06-18 20:05:40.631186+00	170	2024 - 2025 Quaestor	1	[{"added": {}}]	19	2
1191	2024-06-18 20:08:08.909267+00	171	2024 - 2025 Praeses	1	[{"added": {}}]	19	2
1192	2024-06-18 20:10:11.239256+00	172	2024 - 2025 Secretaris	1	[{"added": {}}]	19	2
1193	2024-06-18 20:11:28.139365+00	143	Jonah: Van Den Brandt	1	[{"added": {}}]	14	2
1194	2024-06-18 20:12:01.811576+00	173	2024 - 2025 Feest & LAN	1	[{"added": {}}]	19	2
1195	2024-06-18 20:12:36.5684+00	144	Kirsten: Pype	1	[{"added": {}}]	14	2
1196	2024-06-18 20:13:34.223208+00	174	2024 - 2025 Cultuur	1	[{"added": {}}]	19	2
1197	2024-06-18 20:14:18.769888+00	175	2024 - 2025 Vice-Praeses	1	[{"added": {}}]	19	2
1198	2024-06-18 20:14:44.531951+00	145	Seppe: Landtsheer	1	[{"added": {}}]	14	2
1199	2024-06-18 20:15:12.079306+00	176	2024 - 2025 Sport	1	[{"added": {}}]	19	2
1200	2024-06-18 23:42:45.451565+00	175	2024 - 2025 Vice-Praeses	2	[{"changed": {"fields": ["Photo"]}}]	19	2
1201	2024-06-21 00:18:09.212729+00	89	Superschachten Superschacht	2	[{"changed": {"fields": ["Photo"]}}]	19	2
1234	2024-08-23 19:48:29.770215+00	67	jaarthema	1	[{"added": {}}]	7	3
1267	2024-09-04 16:53:43.779209+00	67	jaarthemaenzojeweetzelluf	2	[{"changed": {"fields": ["Name", "Title", "Permission"]}}]	7	3
1268	2024-09-06 10:53:28.915212+00	67	jaarthema	2	[{"changed": {"fields": ["Name", "Title", "Permission"]}}]	7	3
1269	2024-09-08 13:18:01.709088+00	67	Jaarthema	2	[{"changed": {"fields": ["Name", "Title"]}}]	7	3
1270	2024-09-08 13:20:37.878692+00	67	jaarthema	2	[{"changed": {"fields": ["Name"]}}]	7	3
1271	2024-09-08 13:21:07.364988+00	67	jaarthema	2	[{"changed": {"fields": ["Title"]}}]	7	3
1272	2024-09-08 13:22:02.334332+00	67	jaarthema	2	[{"changed": {"fields": ["Description"]}}]	7	3
1273	2024-09-08 13:24:01.308503+00	67	jaarthema	2	[{"changed": {"fields": ["Description"]}}]	7	3
1274	2024-09-08 16:19:41.891871+00	141	Alternate	3		17	2
1275	2024-09-08 16:19:41.896783+00	140	sponsor benny	3		17	2
1276	2024-09-08 16:19:41.898266+00	139	planet-talent	3		17	2
1277	2024-09-08 16:19:41.900261+00	105	Cloudcom	3		17	2
1278	2024-09-11 18:35:44.509104+00	244	Eerste Clubavond	1	[{"added": {}}]	23	3
1279	2024-09-11 18:37:10.92661+00	245	Stadsspel	1	[{"added": {}}]	23	3
1280	2024-09-11 18:38:34.856931+00	246	Mario Kart Toernooi	1	[{"added": {}}]	23	3
1281	2024-09-11 18:38:56.995583+00	245	Stadsspel	2	[{"changed": {"fields": ["Start", "End"]}}]	23	3
1282	2024-09-11 18:39:58.972339+00	247	Retro Game Revival	1	[{"added": {}}]	23	3
1283	2024-09-11 18:40:50.969232+00	248	Karakoe	1	[{"added": {}}]	23	3
1284	2024-09-11 18:42:07.876842+00	249	Halloween Clubavond	1	[{"added": {}}]	23	3
1285	2024-09-11 18:46:12.460392+00	250	Doop	1	[{"added": {}}]	23	3
1286	2024-09-11 18:49:23.144545+00	251	Feestje	1	[{"added": {}}]	23	3
1287	2024-09-11 18:50:05.293444+00	252	Schachtenevent	1	[{"added": {}}]	23	3
1288	2024-09-11 18:50:47.549734+00	253	Schaatsen	1	[{"added": {}}]	23	3
1289	2024-09-11 18:53:51.489387+00	254	Nadoop	1	[{"added": {}}]	23	3
1290	2024-09-11 18:54:29.901265+00	255	Sinterklaas clubavond	1	[{"added": {}}]	23	3
1291	2024-09-11 18:55:11.515893+00	256	Meter/Peter bonding	1	[{"added": {}}]	23	3
1292	2024-09-11 19:02:50.830186+00	257	Comfy Secret Santa	1	[{"added": {}}]	23	3
1293	2024-09-11 19:08:41.980792+00	258	Open Vergadering	1	[{"added": {}}]	23	3
1294	2024-09-11 19:30:37.21154+00	244	Eerste Clubavond	2	[{"changed": {"fields": ["Description"]}}]	23	3
1295	2024-09-12 19:13:49.789634+00	34	Jaarthema	1	[{"added": {}}]	11	2
1296	2024-09-12 19:17:39.782752+00	89	Superschachten Superschacht	2	[{"changed": {"fields": ["Photo"]}}]	19	2
1297	2024-09-20 10:05:09.629172+00	246	Mario Kart Toernooi	2	[{"changed": {"fields": ["Description", "Url"]}}]	23	3
1298	2024-09-20 10:11:22.899918+00	246	Mario Kart Toernooi	2	[{"changed": {"fields": ["Description", "Poster"]}}]	23	3
1299	2024-09-20 10:13:42.683033+00	245	Stadsspel	2	[{"changed": {"fields": ["Description", "Url", "Poster", "Start", "End", "Location"]}}]	23	3
1300	2024-09-20 10:15:07.833593+00	244	Eerste Clubavond	2	[{"changed": {"fields": ["Poster"]}}]	23	3
1301	2024-09-21 16:36:15.961903+00	221	media@heimdal.be	1	[{"added": {}}]	4	3
1302	2024-09-21 16:38:45.339089+00	221	media@heimdal.be	2	[{"changed": {"fields": ["First name", "Last name", "Email address", "Staff status"]}}, {"changed": {"name": "profile", "object": "Britt Emanuel", "fields": ["Policy approved", "Role"]}}]	4	3
1303	2024-09-21 18:57:44.42266+00	221	media@heimdal.be	2	[]	4	3
1304	2024-09-22 10:24:03.170509+00	221	media@heimdal.be	2	[{"changed": {"fields": ["Groups", "User permissions"]}}, {"changed": {"name": "profile", "object": "Britt Emanuel", "fields": ["Geslacht"]}}]	4	3
1305	2024-09-22 10:26:25.818699+00	176	2024 - 2025 Sport	2	[{"changed": {"fields": ["Photo"]}}]	19	221
1306	2024-09-22 10:26:46.882559+00	176	2024 - 2025 Sport	2	[]	19	221
1307	2024-09-22 10:27:02.225231+00	175	2024 - 2025 Vice-Praeses	2	[{"changed": {"fields": ["Photo"]}}]	19	221
1308	2024-09-22 10:27:16.377072+00	174	2024 - 2025 Cultuur	2	[{"changed": {"fields": ["Photo"]}}]	19	221
1309	2024-09-22 10:27:28.76043+00	173	2024 - 2025 Feest & LAN	2	[{"changed": {"fields": ["Photo"]}}]	19	221
1310	2024-09-22 10:27:39.636409+00	172	2024 - 2025 Secretaris	2	[{"changed": {"fields": ["Photo"]}}]	19	221
1311	2024-09-22 10:27:41.294445+00	172	2024 - 2025 Secretaris	2	[]	19	221
1312	2024-09-22 10:27:55.751276+00	171	2024 - 2025 Praeses	2	[{"changed": {"fields": ["Photo"]}}]	19	221
1313	2024-09-22 10:28:10.019448+00	170	2024 - 2025 Quaestor	2	[{"changed": {"fields": ["Photo"]}}]	19	221
1314	2024-09-22 10:28:19.529263+00	169	2024 - 2025 ICT	2	[{"changed": {"fields": ["Photo"]}}]	19	221
1315	2024-09-22 10:28:34.250501+00	167	2024 - 2025 PR	2	[{"changed": {"fields": ["Photo"]}}]	19	221
1316	2024-09-22 10:28:47.936591+00	166	2024 - 2025 Media	2	[{"changed": {"fields": ["Photo"]}}]	19	221
1317	2024-09-22 11:06:28.858409+00	133	Superschachten Superschacht	2	[{"changed": {"fields": ["Photo"]}}]	19	221
1318	2024-09-25 15:24:22.948399+00	6	overons	2	[{"changed": {"fields": ["Description"]}}]	7	3
1319	2024-09-25 15:26:25.654946+00	6	overons	2	[{"changed": {"fields": ["Description"]}}]	7	3
1320	2024-10-03 15:56:04.929336+00	168	2024 - 2025 Schachtentemmer	2	[{"changed": {"fields": ["Photo"]}}]	19	221
1321	2024-10-04 17:01:56.695641+00	73	SKO en 1ste clubavond 2024	1	[{"added": {}}]	12	221
1322	2024-10-04 17:02:24.767071+00	74	Stadsspel 2024	1	[{"added": {}}]	12	221
1323	2024-10-04 17:04:54.464675+00	207	SKO en 1ste clubavond 2024 - SKO_nemesisMK	1	[{"added": {}}]	20	221
1324	2024-10-04 17:05:24.120074+00	208	SKO en 1ste clubavond 2024 - SKO_MKback	1	[{"added": {}}]	20	221
1325	2024-10-04 17:06:08.334365+00	209	SKO en 1ste clubavond 2024 - SKO_ReinaZagDatHetGoedWas	1	[{"added": {}}]	20	221
1326	2024-10-04 17:06:33.514263+00	210	SKO en 1ste clubavond 2024 - SKO_StandjeOverzicht	1	[{"added": {}}]	20	221
1327	2024-10-04 17:07:01.676926+00	211	SKO en 1ste clubavond 2024 - SKO_MKJongensBack	1	[{"added": {}}]	20	221
1328	2024-10-04 17:07:23.461327+00	212	SKO en 1ste clubavond 2024 - SKO_DiedeConfused	1	[{"added": {}}]	20	221
1329	2024-10-04 17:07:38.908992+00	213	SKO en 1ste clubavond 2024 - SKO_DiedeWave	1	[{"added": {}}]	20	221
1330	2024-10-04 17:08:06.551337+00	214	SKO en 1ste clubavond 2024 - SKO_MKNogPeople	1	[{"added": {}}]	20	221
1331	2024-10-04 17:08:28.277566+00	215	SKO en 1ste clubavond 2024 - SKO_ReinaEnDiedeThumbs	1	[{"added": {}}]	20	221
1332	2024-10-04 17:08:57.19126+00	216	SKO en 1ste clubavond 2024 - SKO_ReinaAanHetWinnen	1	[{"added": {}}]	20	221
1333	2024-10-04 17:09:21.64716+00	217	SKO en 1ste clubavond 2024 - SKO_DiedeBewaaktHetStandje	1	[{"added": {}}]	20	221
1334	2024-10-04 17:09:35.146585+00	218	SKO en 1ste clubavond 2024 - SKO_VolStandje	1	[{"added": {}}]	20	221
1335	2024-10-04 17:10:04.331967+00	219	SKO en 1ste clubavond 2024 - SKO_Nemesis_MK	1	[{"added": {}}]	20	221
1336	2024-10-04 17:10:25.575608+00	220	SKO en 1ste clubavond 2024 - SKO_DiedeTrots	1	[{"added": {}}]	20	221
1337	2024-10-04 17:10:56.469769+00	221	SKO en 1ste clubavond 2024 - Clubavond_CSVol	1	[{"added": {}}]	20	221
1338	2024-10-04 17:11:22.83952+00	222	SKO en 1ste clubavond 2024 - Clubavond_Lintophanging	1	[{"added": {}}]	20	221
1339	2024-10-04 17:11:50.082968+00	223	SKO en 1ste clubavond 2024 - Clubavond_Lintophanging_Before	1	[{"added": {}}]	20	221
1340	2024-10-04 17:12:16.771131+00	224	SKO en 1ste clubavond 2024 - Clubavond_Clublied	1	[{"added": {}}]	20	221
1341	2024-10-04 17:12:36.100124+00	225	SKO en 1ste clubavond 2024 - Clubavond_GamingRoom	1	[{"added": {}}]	20	221
1342	2024-10-04 17:13:04.918511+00	226	SKO en 1ste clubavond 2024 - Clubavond_SeppePool	1	[{"added": {}}]	20	221
1343	2024-10-04 17:13:24.449527+00	227	SKO en 1ste clubavond 2024 - Clubavond_SeppePooltNog	1	[{"added": {}}]	20	221
1344	2024-10-04 17:13:50.46098+00	228	SKO en 1ste clubavond 2024 - Clubavond_OnsMooiLint	1	[{"added": {}}]	20	221
1345	2024-10-04 17:14:00.695946+00	73	SKO en 1ste clubavond 2024	2	[{"changed": {"fields": ["Visible"]}}]	12	221
1346	2024-10-04 17:20:08.205516+00	229	Stadsspel 2024 - SuperheroGroep1	1	[{"added": {}}]	20	221
1347	2024-10-04 17:20:24.16928+00	230	Stadsspel 2024 - SuperheroGroep2	1	[{"added": {}}]	20	221
1348	2024-10-04 17:20:35.904797+00	231	Stadsspel 2024 - SuperheroGroep3	1	[{"added": {}}]	20	221
1349	2024-10-04 17:22:01.742751+00	232	Stadsspel 2024 - SuperheroGroep4	1	[{"added": {}}]	20	221
1350	2024-10-04 17:22:24.546526+00	233	Stadsspel 2024 - GeleAuto_MaxeEnFlorian	1	[{"added": {}}]	20	221
1351	2024-10-04 17:22:42.308469+00	234	Stadsspel 2024 - Beeld_Groep1	1	[{"added": {}}]	20	221
1352	2024-10-04 17:22:55.203586+00	235	Stadsspel 2024 - Maxe_En_Duif	1	[{"added": {}}]	20	221
1353	2024-10-04 17:23:08.465538+00	236	Stadsspel 2024 - Beeld_Groep2	1	[{"added": {}}]	20	221
1354	2024-10-04 17:23:24.941794+00	237	Stadsspel 2024 - TreeHug	1	[{"added": {}}]	20	221
1355	2024-10-04 17:23:47.863362+00	238	Stadsspel 2024 - NyoValtAanDenkIk	1	[{"added": {}}]	20	221
1356	2024-10-04 17:24:07.716685+00	239	Stadsspel 2024 - Lichtspektakel_Groep1	1	[{"added": {}}]	20	221
1357	2024-10-04 17:24:28.036505+00	240	Stadsspel 2024 - Vlaggen_Groep2	1	[{"added": {}}]	20	221
1358	2024-10-04 17:24:40.184459+00	241	Stadsspel 2024 - Gravensteen_Groep4	1	[{"added": {}}]	20	221
1359	2024-10-04 17:24:53.750653+00	242	Stadsspel 2024 - Gravensteen_Groep2	1	[{"added": {}}]	20	221
1360	2024-10-04 17:25:07.506231+00	243	Stadsspel 2024 - Beeld_Groep4	1	[{"added": {}}]	20	221
1361	2024-10-04 17:25:24.595358+00	244	Stadsspel 2024 - Gravensteen_Groep1	1	[{"added": {}}]	20	221
1362	2024-10-04 17:25:38.598452+00	245	Stadsspel 2024 - Gravensteen_Groep1_Verdedigen	1	[{"added": {}}]	20	221
1363	2024-10-04 17:25:56.439535+00	246	Stadsspel 2024 - Drinkpauze_Groep3	1	[{"added": {}}]	20	221
1364	2024-10-04 17:26:10.751782+00	247	Stadsspel 2024 - VrolijkeVikingen_Groep2	1	[{"added": {}}]	20	221
1365	2024-10-04 17:26:31.193069+00	248	Stadsspel 2024 - Duif_Groep2	1	[{"added": {}}]	20	221
1366	2024-10-04 17:26:50.510489+00	249	Stadsspel 2024 - Groep2LeentEenHond	1	[{"added": {}}]	20	221
1368	2024-10-04 17:28:30.705995+00	251	Stadsspel 2024 - VrolijkeVikingen_Groep4	1	[{"added": {}}]	20	221
1367	2024-10-04 17:28:16.265526+00	250	Stadsspel 2024 - Piramide_Groep4	1	[{"added": {}}]	20	221
1369	2024-10-04 17:29:15.970993+00	235	Stadsspel 2024 - Maxe_En_Duif	2	[{"changed": {"fields": ["Link"]}}]	20	221
1370	2024-10-04 17:29:56.624247+00	239	Stadsspel 2024 - Lichtspektakel_Groep1	2	[{"changed": {"fields": ["Link"]}}]	20	221
1371	2024-10-04 18:50:33.295849+00	8	schachtentemmer@heimdal.be	2	[{"changed": {"fields": ["First name", "Last name"]}}]	4	3
1372	2024-10-04 18:51:05.557096+00	8	schachtentemmer@heimdal.be	2	[{"changed": {"fields": ["password"]}}]	4	3
1373	2024-10-04 19:01:46.07233+00	250	Doop: Escape from the Upside Down	2	[{"changed": {"fields": ["Name", "Description", "Url", "Poster", "Start", "End", "Location"]}}]	23	8
1374	2024-10-04 19:02:37.070065+00	250	Doop: Escape the Upside Down	2	[{"changed": {"fields": ["Name", "Description"]}}]	23	8
1375	2024-10-04 19:05:16.269798+00	250	Doop: Escape the Upside Down	2	[{"changed": {"fields": ["Description"]}}]	23	8
1376	2024-10-04 19:08:54.933747+00	250	Doop: Escape the Upside Down	2	[{"changed": {"fields": ["Description"]}}]	23	8
1377	2024-10-08 17:35:20.154674+00	142	SEPP	1	[{"added": {}}]	17	2
1378	2024-10-08 17:36:27.694912+00	142	SEPP	2	[{"changed": {"fields": ["Logo"]}}]	17	2
1379	2024-10-08 17:37:00.19799+00	142	SEPP	2	[{"changed": {"fields": ["Logo"]}}]	17	2
1380	2024-10-11 15:28:52.305797+00	75	MarioKart Toernooi 2024	1	[{"added": {}}]	12	221
1381	2024-10-11 15:30:21.171968+00	252	MarioKart Toernooi 2024 - Maxe_ThumbsUp	1	[{"added": {}}]	20	221
1382	2024-10-11 15:30:54.408475+00	253	MarioKart Toernooi 2024 - PlayingMK_FromBack	1	[{"added": {}}]	20	221
1383	2024-10-11 15:31:12.70211+00	254	MarioKart Toernooi 2024 - PlayingMK_VoorScorebord	1	[{"added": {}}]	20	221
1384	2024-10-11 15:31:40.186912+00	255	MarioKart Toernooi 2024 - PlayingMK_AanIngang_Voorrondes	1	[{"added": {}}]	20	221
1385	2024-10-11 15:32:02.892951+00	256	MarioKart Toernooi 2024 - Overzicht_ComicSans	1	[{"added": {}}]	20	221
1386	2024-10-11 15:32:23.088683+00	257	MarioKart Toernooi 2024 - PlayingMK_InGameRoom	1	[{"added": {}}]	20	221
1387	2024-10-11 15:32:48.988534+00	258	MarioKart Toernooi 2024 - PlayingMK_AanIngang_Voorrondes_2	1	[{"added": {}}]	20	221
1388	2024-10-11 15:33:03.078835+00	259	MarioKart Toernooi 2024 - Seppe_ThumbsUp	1	[{"added": {}}]	20	221
1389	2024-10-11 15:33:26.727346+00	260	MarioKart Toernooi 2024 - PlayingMK_FromBack_Booth2	1	[{"added": {}}]	20	221
1390	2024-10-11 15:33:51.43277+00	261	MarioKart Toernooi 2024 - PlayingMK_FromBack_Booth3	1	[{"added": {}}]	20	221
1391	2024-10-11 15:34:21.940652+00	262	MarioKart Toernooi 2024 - PlayingMK_RienJoranRuben	1	[{"added": {}}]	20	221
1392	2024-10-11 15:34:40.729988+00	263	MarioKart Toernooi 2024 - PlayingMK_ElisabetFromBack	1	[{"added": {}}]	20	221
1393	2024-10-11 15:35:12.37447+00	264	MarioKart Toernooi 2024 - PlayingMK_InGameRoom_GodWeetWelkeRonde	1	[{"added": {}}]	20	221
1394	2024-10-11 15:35:33.78286+00	265	MarioKart Toernooi 2024 - PlayingMK_FromBack_NogEens	1	[{"added": {}}]	20	221
1395	2024-10-11 15:35:58.346784+00	266	MarioKart Toernooi 2024 - PlayingMK_InGameRoom_Ingang	1	[{"added": {}}]	20	221
1396	2024-10-11 15:36:31.654777+00	267	MarioKart Toernooi 2024 - PlayingMK_InGameRoom_GodWeetWelkeRondeMaarWelDezelfde	1	[{"added": {}}]	20	221
1397	2024-10-11 15:36:53.351629+00	268	MarioKart Toernooi 2024 - PlayingMK_Booth1	1	[{"added": {}}]	20	221
1398	2024-10-11 15:37:48.974752+00	269	MarioKart Toernooi 2024 - PlayingMK_Booth1_HalveFinales	1	[{"added": {}}]	20	221
1399	2024-10-11 15:38:11.510934+00	270	MarioKart Toernooi 2024 - PlayingMK_MilanTyraLucasElisabet	1	[{"added": {}}]	20	221
1400	2024-10-11 15:38:31.99326+00	271	MarioKart Toernooi 2024 - PlayingMK_Booth1_AnderPerspectief	1	[{"added": {}}]	20	221
1401	2024-10-11 15:38:44.248018+00	272	MarioKart Toernooi 2024 - MKScreens	1	[{"added": {}}]	20	221
1402	2024-10-11 15:39:17.874969+00	273	MarioKart Toernooi 2024 - PlayingMK_MetEnthousiasteGezichten	1	[{"added": {}}]	20	221
1403	2024-10-11 15:39:46.373848+00	274	MarioKart Toernooi 2024 - PlayingMK_MetEnthousiasteGezichten_EnSeppe	1	[{"added": {}}]	20	221
1404	2024-10-11 15:40:12.529291+00	275	MarioKart Toernooi 2024 - PlayingMK_NogEenAndereBooth	1	[{"added": {}}]	20	221
1405	2024-10-11 15:40:42.720037+00	276	MarioKart Toernooi 2024 - PlayingMK_InGameRoom_GodWeetWelkeRonde_NogSteedsDezelfde	1	[{"added": {}}]	20	221
1406	2024-10-11 15:41:02.399914+00	277	MarioKart Toernooi 2024 - Prijzen	1	[{"added": {}}]	20	221
1407	2024-10-11 15:41:17.003894+00	278	MarioKart Toernooi 2024 - GameRoom_Kikvors	1	[{"added": {}}]	20	221
1408	2024-10-11 15:41:38.344218+00	279	MarioKart Toernooi 2024 - Overzicht_AchterkantComicSans	1	[{"added": {}}]	20	221
1409	2024-10-11 15:42:02.818455+00	280	MarioKart Toernooi 2024 - BrittSeppeBriek_ThumbsUp	1	[{"added": {}}]	20	221
1410	2024-10-11 15:42:26.293583+00	281	MarioKart Toernooi 2024 - PlayingMK_Finale_Bovenaanzicht	1	[{"added": {}}]	20	221
1411	2024-10-11 15:42:40.827054+00	282	MarioKart Toernooi 2024 - PlayingMK_HappyBert	1	[{"added": {}}]	20	221
1412	2024-10-11 15:43:01.4051+00	283	MarioKart Toernooi 2024 - PlayingMK_MilanTyraLucasElisabet_2	1	[{"added": {}}]	20	221
1413	2024-10-11 15:43:22.808469+00	284	MarioKart Toernooi 2024 - PlayingMK_FromBack_Ruben	1	[{"added": {}}]	20	221
1414	2024-10-11 15:43:37.977588+00	285	MarioKart Toernooi 2024 - MKScreen	1	[{"added": {}}]	20	221
1415	2024-10-11 15:44:00.999561+00	286	MarioKart Toernooi 2024 - PlayingMK_FromBack_Ruben_Afstand	1	[{"added": {}}]	20	221
1416	2024-10-11 15:44:13.915499+00	287	MarioKart Toernooi 2024 - 3dePlaats	1	[{"added": {}}]	20	221
1417	2024-10-11 15:45:07.947732+00	288	MarioKart Toernooi 2024 - PlayingMK_Finale	1	[{"added": {}}]	20	221
1418	2024-10-11 15:45:19.809528+00	289	MarioKart Toernooi 2024 - 2dePlaats	1	[{"added": {}}]	20	221
1419	2024-10-11 15:45:31.295494+00	290	MarioKart Toernooi 2024 - 1stePlaats	1	[{"added": {}}]	20	221
1420	2024-10-11 15:46:47.980878+00	75	MarioKart Toernooi 2024	2	[{"changed": {"fields": ["Order"]}}]	12	221
1421	2024-10-13 09:59:34.374639+00	247	Retro Game Revival	2	[{"changed": {"fields": ["Description", "Url", "Poster", "Start", "End", "Location"]}}]	23	3
1422	2024-10-14 17:47:34.104585+00	248	Karakoe	2	[{"changed": {"fields": ["Description", "Poster", "Start"]}}]	23	221
1423	2024-10-14 17:49:34.399589+00	248	Karakoe	2	[{"changed": {"fields": ["Description", "End"]}}]	23	221
1424	2024-10-14 17:50:05.270386+00	248	Karakoe	2	[{"changed": {"fields": ["Description"]}}]	23	221
1425	2024-10-26 20:26:47.099069+00	7	sport@heimdal.be	2	[{"changed": {"fields": ["First name", "Last name"]}}, {"changed": {"name": "profile", "object": "Seppe Landtsheer", "fields": ["Geslacht"]}}]	4	2
1426	2024-10-26 20:28:44.23431+00	7	sport@heimdal.be	2	[{"changed": {"fields": ["password"]}}]	4	2
1427	2024-10-26 20:42:24.42395+00	259	Tetris Toernooi	1	[{"added": {}}]	23	7
1428	2024-10-28 13:38:52.314066+00	249	Halloween Clubavond	2	[{"changed": {"fields": ["Description", "Poster"]}}]	23	221
1429	2024-10-28 13:40:15.174173+00	249	Halloween Clubavond	2	[{"changed": {"fields": ["Description"]}}]	23	221
1430	2024-10-28 16:30:47.594406+00	259	Tetris Toernooi	2	[{"changed": {"fields": ["Description", "Url"]}}]	23	7
1431	2024-10-28 18:39:32.052836+00	259	Tetris Toernooi	2	[{"changed": {"fields": ["Description"]}}]	23	221
1432	2024-10-30 13:08:05.533619+00	76	Karakoe 2024	1	[{"added": {}}]	12	221
1433	2024-10-30 13:13:47.785307+00	291	Karakoe 2024 - Rien&Lisa_Zingen	1	[{"added": {}}]	20	221
1434	2024-10-30 13:14:05.960908+00	292	Karakoe 2024 - Annelies&Maxe_Zingen	1	[{"added": {}}]	20	221
1435	2024-10-30 13:15:35.427573+00	293	Karakoe 2024 - Kieron&Rein_Zingen	1	[{"added": {}}]	20	221
1436	2024-10-30 13:17:04.056122+00	294	Karakoe 2024 - Arne&Rien_Zingen	1	[{"added": {}}]	20	221
1437	2024-10-30 13:17:24.264603+00	295	Karakoe 2024 - Nikki&Rien_Zingen	1	[{"added": {}}]	20	221
1438	2024-10-30 13:17:35.017015+00	296	Karakoe 2024 - Nikki_Happy	1	[{"added": {}}]	20	221
1439	2024-10-30 13:17:46.588438+00	297	Karakoe 2024 - Benny_Happy	1	[{"added": {}}]	20	221
1440	2024-10-30 13:18:31.663424+00	298	Karakoe 2024 - Nikki&Yoran_Zingen	1	[{"added": {}}]	20	221
1441	2024-10-30 13:18:44.969695+00	299	Karakoe 2024 - Seppe_Happy	1	[{"added": {}}]	20	221
1442	2024-10-30 13:19:05.31076+00	300	Karakoe 2024 - Maxe_3Thumbs	1	[{"added": {}}]	20	221
1443	2024-10-30 13:19:25.119649+00	301	Karakoe 2024 - Warre&Maxe_Zingen	1	[{"added": {}}]	20	221
1444	2024-10-30 13:19:36.978683+00	302	Karakoe 2024 - Tyra_Zingt	1	[{"added": {}}]	20	221
1445	2024-10-30 13:19:57.14071+00	303	Karakoe 2024 - Warre&Maxe_Zingen_NogEens	1	[{"added": {}}]	20	221
1446	2024-10-30 13:20:33.501658+00	304	Karakoe 2024 - AllIWantForChristmasIsYOOUUU	1	[{"added": {}}]	20	221
1447	2024-10-30 13:21:43.968898+00	305	Karakoe 2024 - Olivier_Zingt	1	[{"added": {}}]	20	221
1448	2024-10-30 13:22:08.039038+00	306	Karakoe 2024 - Kieron&Rein_Zingen_Zwoel	1	[{"added": {}}]	20	221
1449	2024-10-30 13:22:20.757814+00	307	Karakoe 2024 - Tyra_Zingt_NogEens	1	[{"added": {}}]	20	221
1450	2024-10-30 13:22:33.772114+00	308	Karakoe 2024 - Nikki&Rien_Zingen_Blij	1	[{"added": {}}]	20	221
1451	2024-10-30 13:22:48.649422+00	309	Karakoe 2024 - Annelies&Maxe_Zingen_NogEens	1	[{"added": {}}]	20	221
1452	2024-10-30 13:23:07.993789+00	310	Karakoe 2024 - Bram_Cool	1	[{"added": {}}]	20	221
1453	2024-10-30 13:23:22.080587+00	311	Karakoe 2024 - Sfeerbeeld_Karakoe2024	1	[{"added": {}}]	20	221
1454	2024-10-30 13:23:36.196145+00	312	Karakoe 2024 - Rien_Happy	1	[{"added": {}}]	20	221
1455	2024-10-30 13:23:54.451835+00	313	Karakoe 2024 - Seppe&Milan_Unaware	1	[{"added": {}}]	20	221
1456	2024-10-30 13:24:24.028323+00	314	Karakoe 2024 - DiggyDiggyHole	1	[{"added": {}}]	20	221
1457	2024-10-30 13:24:47.264657+00	315	Karakoe 2024 - Maxe&Amber&Annelies_Zingen	1	[{"added": {}}]	20	221
1458	2024-10-30 13:25:06.48086+00	316	Karakoe 2024 - Vincent&Vriend_Zingen	1	[{"added": {}}]	20	221
1459	2024-10-30 13:25:54.948886+00	317	Karakoe 2024 - Ritchie_Zingt	1	[{"added": {}}]	20	221
1460	2024-10-30 13:26:08.321007+00	318	Karakoe 2024 - DiggyDiggyHole_NogEens	1	[{"added": {}}]	20	221
1461	2024-10-30 13:26:49.687055+00	319	Karakoe 2024 - Warre&Crew_Zingen	1	[{"added": {}}]	20	221
1462	2024-10-30 13:27:03.154637+00	320	Karakoe 2024 - BohemianRhapsodyCrew	1	[{"added": {}}]	20	221
1463	2024-10-30 13:27:14.179322+00	321	Karakoe 2024 - Oli&Ritchie_Zingen	1	[{"added": {}}]	20	221
1464	2024-10-30 13:27:37.317474+00	322	Karakoe 2024 - 4MensjesZingen	1	[{"added": {}}]	20	221
1465	2024-10-30 13:27:53.137326+00	323	Karakoe 2024 - Diede&Martijn&Rien_Thumbs	1	[{"added": {}}]	20	221
1466	2024-10-30 13:28:04.763009+00	324	Karakoe 2024 - Vincent&Vriend_Zingen_NogEens	1	[{"added": {}}]	20	221
1467	2024-10-30 13:28:43.546711+00	325	Karakoe 2024 - Brecht&Warre_NaZingen	1	[{"added": {}}]	20	221
1468	2024-10-30 13:29:06.416296+00	326	Karakoe 2024 - Sfeerbeeld_Karakoe2024_MensjesAanTafel	1	[{"added": {}}]	20	221
1469	2024-10-30 13:29:17.389573+00	327	Karakoe 2024 - Benny&Maxe_Zingen	1	[{"added": {}}]	20	221
1470	2024-10-30 13:29:29.842664+00	328	Karakoe 2024 - Benny&Arne_Zingen	1	[{"added": {}}]	20	221
1471	2024-10-30 13:29:46.207497+00	329	Karakoe 2024 - Lucas&Brecht&Warre_Zingen	1	[{"added": {}}]	20	221
1472	2024-10-30 13:30:00.717914+00	330	Karakoe 2024 - Brecht&Warre&Florian	1	[{"added": {}}]	20	221
1473	2024-10-30 13:33:54.601494+00	331	Karakoe 2024 - Arne&Rein_Zingen	1	[{"added": {}}]	20	221
1474	2024-10-30 13:34:11.830455+00	330	Karakoe 2024 - Brecht&Warre&Florian_Zingen	2	[{"changed": {"fields": ["Name", "Description"]}}]	20	221
1475	2024-10-30 13:34:38.227827+00	76	Karakoe 2024	2	[{"changed": {"fields": ["Visible"]}}]	12	221
1476	2024-10-30 13:34:58.273757+00	76	Karakoe 2024	2	[{"changed": {"fields": ["Visible"]}}]	12	221
1477	2024-10-30 14:17:27.468074+00	76	Karakoe 2024	2	[{"changed": {"fields": ["Visible"]}}]	12	221
1478	2024-10-30 14:17:38.990702+00	76	Karakoe 2024	2	[{"changed": {"fields": ["Visible"]}}]	12	221
1479	2024-11-01 17:03:41.797463+00	76	Karakoe 2024	2	[{"changed": {"fields": ["Visible"]}}]	12	221
1480	2024-11-04 19:17:16.829928+00	9	feest-lan@heimdal.be	2	[{"changed": {"fields": ["First name", "Last name"]}}]	4	3
1481	2024-11-04 19:17:44.384124+00	9	feest-lan@heimdal.be	2	[{"changed": {"fields": ["password"]}}]	4	3
1482	2024-11-04 19:25:31.967158+00	251	Feestje Retro Revolution	2	[{"changed": {"fields": ["Name", "Description", "Start", "End", "Location"]}}]	23	9
1483	2024-11-04 19:26:50.101973+00	251	Feestje Retro Revolution	2	[{"changed": {"fields": ["Description"]}}]	23	9
1484	2024-11-04 19:29:43.378897+00	251	Feestje Retro Revolution	2	[{"changed": {"fields": ["Description"]}}]	23	9
1485	2024-11-04 19:30:16.784497+00	251	Feestje Retro Revolution	2	[{"changed": {"fields": ["Description"]}}]	23	9
1486	2024-11-04 19:32:04.23382+00	251	Feestje Retro Revolution	2	[{"changed": {"fields": ["Poster"]}}]	23	9
1487	2024-11-06 07:42:03.990349+00	77	Tetris Toernooi 2024	1	[{"added": {}}]	12	221
1488	2024-11-06 07:43:25.371291+00	332	Tetris Toernooi 2024 - Tetris_Sofia_Back	1	[{"added": {}}]	20	221
1489	2024-11-06 07:43:57.708777+00	333	Tetris Toernooi 2024 - Tetris_Sfeerbeeld_Booth	1	[{"added": {}}]	20	221
1490	2024-11-06 07:44:21.128373+00	334	Tetris Toernooi 2024 - Tetris_Nathan &Timon_Finale	1	[{"added": {}}]	20	221
1491	2024-11-06 07:44:36.456609+00	335	Tetris Toernooi 2024 - Tetris_Milan&Nathan_HalveFinale	1	[{"added": {}}]	20	221
1492	2024-11-06 07:44:50.422333+00	336	Tetris Toernooi 2024 - Tetris_Sfeerbeeld1	1	[{"added": {}}]	20	221
1493	2024-11-06 07:45:08.261682+00	337	Tetris Toernooi 2024 - Tetris_Winnaar_Nathan	1	[{"added": {}}]	20	221
1494	2024-11-06 07:45:26.390664+00	338	Tetris Toernooi 2024 - Tetris_2de_Timon	1	[{"added": {}}]	20	221
1495	2024-11-06 07:45:41.062958+00	339	Tetris Toernooi 2024 - Tetris_3de_Milan	1	[{"added": {}}]	20	221
1496	2024-11-06 07:45:59.792916+00	340	Tetris Toernooi 2024 - Tetris_Timon_Back	1	[{"added": {}}]	20	221
1497	2024-11-06 07:46:50.185424+00	341	Tetris Toernooi 2024 - AanTafel_Met_Nikki&Bram&Simon	1	[{"added": {}}]	20	221
1498	2024-11-06 07:47:11.908842+00	342	Tetris Toernooi 2024 - Tetris_Finale_GrootScherm	1	[{"added": {}}]	20	221
1499	2024-11-06 07:47:22.397571+00	343	Tetris Toernooi 2024 - Reina_AchterToog	1	[{"added": {}}]	20	221
1500	2024-11-06 07:47:33.817485+00	344	Tetris Toernooi 2024 - Tetris_Sfeerbeeld2	1	[{"added": {}}]	20	221
1501	2024-11-06 07:47:44.984768+00	345	Tetris Toernooi 2024 - Tetris_Milan_Focus	1	[{"added": {}}]	20	221
1502	2024-11-06 07:47:55.326185+00	346	Tetris Toernooi 2024 - Tetris_Milan_Back	1	[{"added": {}}]	20	221
1503	2024-11-06 07:48:38.509936+00	347	Tetris Toernooi 2024 - Tetris_Britt&AaronLuisterenAandachtig	1	[{"added": {}}]	20	221
1504	2024-11-06 07:48:49.05369+00	348	Tetris Toernooi 2024 - Tetris_Sfeerbeeld3	1	[{"added": {}}]	20	221
1507	2024-11-06 07:49:46.280818+00	351	Tetris Toernooi 2024 - Tetris_Simon&Bram_Happy	1	[{"added": {}}]	20	221
1508	2024-11-06 07:49:55.916862+00	352	Tetris Toernooi 2024 - Tetris_Kirsten_Back	1	[{"added": {}}]	20	221
1511	2024-11-06 07:50:32.654398+00	355	Tetris Toernooi 2024 - Tetris_Simon&Bram_GezelligGesprek	1	[{"added": {}}]	20	221
1513	2024-11-06 07:51:06.248565+00	357	Tetris Toernooi 2024 - Tetris_Sfeerbeeld4_MilanThumbsUp	1	[{"added": {}}]	20	221
1514	2024-11-06 07:51:16.452966+00	358	Tetris Toernooi 2024 - Tetris_Britt_Back	1	[{"added": {}}]	20	221
1515	2024-11-06 07:51:28.376623+00	359	Tetris Toernooi 2024 - Tetris_Wout&Kirsten	1	[{"added": {}}]	20	221
1519	2024-11-06 07:52:37.676208+00	363	Tetris Toernooi 2024 - Tetris_FlorianHappy	1	[{"added": {}}]	20	221
1521	2024-11-06 07:53:08.699608+00	365	Tetris Toernooi 2024 - Tetris_Kirsten&Aaron_2	1	[{"added": {}}]	20	221
1522	2024-11-06 07:53:18.317311+00	366	Tetris Toernooi 2024 - Tetris_Maxe_Focus	1	[{"added": {}}]	20	221
1523	2024-11-06 07:53:52.160033+00	367	Tetris Toernooi 2024 - Tetris_Simon&Bram_BramInFocus	1	[{"added": {}}]	20	221
1526	2024-11-06 07:54:40.028878+00	370	Tetris Toernooi 2024 - Tetris_Benny_OpeensMinderTetrisHaat	1	[{"added": {}}]	20	221
1528	2024-11-06 07:55:04.811485+00	372	Tetris Toernooi 2024 - Tetris_Reina_Focus	1	[{"added": {}}]	20	221
1529	2024-11-06 07:55:16.194052+00	373	Tetris Toernooi 2024 - Tetris_Timon_Focus	1	[{"added": {}}]	20	221
1530	2024-11-06 07:55:27.431668+00	374	Tetris Toernooi 2024 - Tetris_Sfeerbeeld6	1	[{"added": {}}]	20	221
1531	2024-11-06 07:55:40.862844+00	375	Tetris Toernooi 2024 - Tetris_Jonah_Toog_Invite	1	[{"added": {}}]	20	221
1505	2024-11-06 07:49:05.606579+00	349	Tetris Toernooi 2024 - Seppe&Rein_cute	1	[{"added": {}}]	20	221
1506	2024-11-06 07:49:30.662783+00	350	Tetris Toernooi 2024 - Tetris_LachendeBritt	1	[{"added": {}}]	20	221
1509	2024-11-06 07:50:05.728951+00	353	Tetris Toernooi 2024 - Tetris_Nick_Pool	1	[{"added": {}}]	20	221
1510	2024-11-06 07:50:15.397845+00	354	Tetris Toernooi 2024 - Tetris_VincentHappy	1	[{"added": {}}]	20	221
1512	2024-11-06 07:50:45.650942+00	356	Tetris Toernooi 2024 - Tetris_Britt&Sofia	1	[{"added": {}}]	20	221
1516	2024-11-06 07:51:42.030558+00	360	Tetris Toernooi 2024 - Tetris_Kirsten&Aaron	1	[{"added": {}}]	20	221
1517	2024-11-06 07:52:14.65972+00	361	Tetris Toernooi 2024 - Tetris_Sfeerbeeld5	1	[{"added": {}}]	20	221
1518	2024-11-06 07:52:25.913475+00	362	Tetris Toernooi 2024 - Tetris_Seppe&Rein_Pool	1	[{"added": {}}]	20	221
1520	2024-11-06 07:52:54.239212+00	364	Tetris Toernooi 2024 - Tetris_Simon&Bram_Happy_NogEens	1	[{"added": {}}]	20	221
1524	2024-11-06 07:54:07.656432+00	368	Tetris Toernooi 2024 - Tetris_Jonah_Toog	1	[{"added": {}}]	20	221
1525	2024-11-06 07:54:19.362959+00	369	Tetris Toernooi 2024 - Tetris_Benny&Maxe	1	[{"added": {}}]	20	221
1527	2024-11-06 07:54:54.725113+00	371	Tetris Toernooi 2024 - Tetris_Maxe_Focus_CloseUp	1	[{"added": {}}]	20	221
1532	2024-11-06 07:55:50.83946+00	376	Tetris Toernooi 2024 - Tetris_Reina_Happy	1	[{"added": {}}]	20	221
1533	2024-11-06 07:56:03.206104+00	377	Tetris Toernooi 2024 - Tetris_SeppeWeetBeter	1	[{"added": {}}]	20	221
1534	2024-11-06 07:56:38.176826+00	378	Tetris Toernooi 2024 - Tetris_Oli_Happy	1	[{"added": {}}]	20	221
1535	2024-11-06 07:56:48.684686+00	379	Tetris Toernooi 2024 - Tetris_Alexander_Focus	1	[{"added": {}}]	20	221
1536	2024-11-06 07:57:04.6751+00	380	Tetris Toernooi 2024 - Tetris_Britt_Panic	1	[{"added": {}}]	20	221
1537	2024-11-06 07:57:17.958198+00	381	Tetris Toernooi 2024 - Tetris_Reina&Andres_ReinaFocus	1	[{"added": {}}]	20	221
1538	2024-11-06 07:57:27.5997+00	382	Tetris Toernooi 2024 - Tetris_Scherm	1	[{"added": {}}]	20	221
1539	2024-11-06 07:57:46.846626+00	77	Tetris Toernooi 2024	2	[{"changed": {"fields": ["Visible"]}}]	12	221
1540	2024-11-06 07:58:29.98529+00	77	Tetris Toernooi 2024	2	[{"changed": {"fields": ["Visible"]}}]	12	221
1541	2024-11-06 08:22:01.001723+00	77	Tetris Toernooi 2024	2	[{"changed": {"fields": ["Visible"]}}]	12	221
1542	2024-11-06 08:22:59.275755+00	77	Tetris Toernooi 2024	2	[{"changed": {"fields": ["Visible"]}}]	12	221
1543	2024-11-08 17:28:23.867401+00	77	Tetris Toernooi 2024	2	[{"changed": {"fields": ["Visible"]}}]	12	221
1544	2024-11-15 17:23:43.714123+00	260	Heimdal Weekend	1	[{"added": {}}]	23	221
1545	2024-11-15 17:24:09.250217+00	260	Heimdal Weekend	2	[{"changed": {"fields": ["Description"]}}]	23	221
1546	2024-11-15 17:25:50.896917+00	260	Heimdal Weekend	2	[{"changed": {"fields": ["Description"]}}]	23	221
1547	2024-11-15 17:26:36.637531+00	260	Heimdal Weekend	2	[{"changed": {"fields": ["Description"]}}]	23	221
1548	2024-11-15 17:27:22.66427+00	260	Heimdal Weekend	2	[{"changed": {"fields": ["Description"]}}]	23	221
1549	2024-11-15 17:27:54.234809+00	260	Heimdal Weekend	2	[{"changed": {"fields": ["Description"]}}]	23	221
1550	2024-11-15 17:28:29.019735+00	260	Heimdal Weekend	2	[{"changed": {"fields": ["Description"]}}]	23	221
1551	2024-11-15 17:29:15.20029+00	260	Heimdal Weekend	2	[{"changed": {"fields": ["Description"]}}]	23	221
1552	2024-11-15 17:29:29.963818+00	260	Heimdal Weekend	2	[{"changed": {"fields": ["Description"]}}]	23	221
1553	2024-11-15 18:47:58.416764+00	260	Heimdal Weekend	2	[{"changed": {"fields": ["Description"]}}]	23	221
1554	2024-11-17 21:27:18.747946+00	4	vice-praeses@heimdal.be	2	[{"changed": {"fields": ["password"]}}]	4	2
1555	2024-11-17 21:30:50.214458+00	260	Heimdal Weekend	2	[{"changed": {"fields": ["Description"]}}]	23	4
1556	2024-11-18 17:15:07.970528+00	252	Schachtenevent	2	[{"changed": {"fields": ["Description", "Url", "Poster", "Start", "End", "Location"]}}]	23	221
1557	2024-11-18 17:16:05.946972+00	252	Schachtenevent	2	[{"changed": {"fields": ["Description"]}}]	23	221
1558	2024-11-18 17:19:43.837949+00	253	Schaatsen	2	[{"changed": {"fields": ["Description", "Url", "Poster", "Start", "End", "Location"]}}]	23	221
1559	2024-11-18 17:20:45.265187+00	253	Schaatsen	2	[{"changed": {"fields": ["Description", "Location"]}}]	23	221
1560	2024-11-18 17:21:34.211144+00	252	Schachtenevent	2	[{"changed": {"fields": ["Location"]}}]	23	221
1561	2024-11-22 17:27:17.045122+00	254	Nadoop	2	[{"changed": {"fields": ["Description", "Url", "Poster", "Start", "End", "Location"]}}]	23	221
1562	2024-11-22 17:31:05.810356+00	256	Meter/Peter bonding: Gentse Museumnacht ✨	2	[{"changed": {"fields": ["Name", "Description", "Url", "Poster", "Start", "End", "Location"]}}]	23	221
1563	2024-11-22 17:31:19.078444+00	256	Meter/Peter bonding: Gentse Museumnacht	2	[{"changed": {"fields": ["Name"]}}]	23	221
1564	2024-11-22 17:31:39.443058+00	254	Nadoop	2	[{"changed": {"fields": ["Description"]}}]	23	221
1565	2024-11-25 16:41:02.784485+00	255	Sinterklaas clubavond	2	[{"changed": {"fields": ["Description", "Poster", "Start", "End"]}}]	23	221
1566	2024-11-25 16:41:38.510822+00	255	Sinterklaas clubavond	2	[{"changed": {"fields": ["Description"]}}]	23	221
1567	2024-11-25 16:49:38.696638+00	257	Secret Santa	2	[{"changed": {"fields": ["Name", "Description", "Url", "Poster", "Start", "End", "Location"]}}]	23	221
1568	2024-11-25 16:50:35.563816+00	257	Secret Santa	2	[{"changed": {"fields": ["Description"]}}]	23	221
1569	2024-12-02 17:15:06.003549+00	254	Nadoop	2	[{"changed": {"fields": ["Start"]}}]	23	221
1570	2024-12-02 17:39:51.074504+00	6	secretaris@heimdal.be	2	[{"changed": {"fields": ["password"]}}]	4	2
1571	2024-12-02 17:42:35.639063+00	6	secretaris@heimdal.be	2	[{"changed": {"fields": ["password"]}}]	4	2
1572	2024-12-02 17:47:06.443059+00	258	Open Vergadering	3		23	2
1573	2024-12-03 22:24:59.453157+00	143	Planet Talent	1	[{"added": {}}]	17	2
1574	2024-12-07 17:38:59.052127+00	78	Schaatsen 2024	1	[{"added": {}}]	12	3
1575	2024-12-07 17:40:31.204641+00	383	Schaatsen 2024 - Schaatsen 2024 - Groepsfoto	1	[{"added": {}}]	20	3
1576	2024-12-07 17:42:57.802818+00	384	Schaatsen 2024 - Schaatsen 2024 - NyoThumbsup	1	[{"added": {}}]	20	3
1577	2024-12-07 17:44:49.963585+00	385	Schaatsen 2024 - Schaatsen 2024 - Reverse Heimie	1	[{"added": {}}]	20	3
1578	2024-12-07 17:45:26.339995+00	386	Schaatsen 2024 - Schaatsen 2024 - BrittSpeed	1	[{"added": {}}]	20	3
1579	2024-12-07 17:46:21.027194+00	387	Schaatsen 2024 - Schaatsen 2024 - AxelleCloseup	1	[{"added": {}}]	20	3
1580	2024-12-07 17:46:37.948558+00	388	Schaatsen 2024 - Schaatsen 2024 - AndreasZen	1	[{"added": {}}]	20	3
1581	2024-12-07 17:47:00.022004+00	389	Schaatsen 2024 - Schaatsen 2024 - Sandwich	1	[{"added": {}}]	20	3
1582	2024-12-07 17:48:18.490966+00	390	Schaatsen 2024 - Schaatsen 2024 - Banana	1	[{"added": {}}]	20	3
1583	2024-12-07 17:48:32.850069+00	391	Schaatsen 2024 - Schaatsen 2024 - ReinaCloseup	1	[{"added": {}}]	20	3
1584	2024-12-07 17:48:52.492189+00	392	Schaatsen 2024 - Schaatsen 2024 - KieronSpeed	1	[{"added": {}}]	20	3
1585	2024-12-07 17:49:20.027882+00	393	Schaatsen 2024 - Schaatsen 2024 - CuteCouple	1	[{"added": {}}]	20	3
1586	2024-12-07 17:49:41.487415+00	394	Schaatsen 2024 - Schaatsen 2024 - BeVeryCarefulEvelien	1	[{"added": {}}]	20	3
1587	2024-12-07 17:50:00.041348+00	395	Schaatsen 2024 - Schaatsen 2024 - BiggestPimpOnTheBlock	1	[{"added": {}}]	20	3
1588	2024-12-07 17:50:20.786178+00	396	Schaatsen 2024 - Schaatsen 2024 - TradeNegotiations	1	[{"added": {}}]	20	3
1589	2024-12-07 17:50:39.767334+00	397	Schaatsen 2024 - Schaatsen 2024 - ALittleGayIsOkay	1	[{"added": {}}]	20	3
1590	2024-12-07 17:50:56.545036+00	398	Schaatsen 2024 - Schaatsen 2024 - JustChillin	1	[{"added": {}}]	20	3
1591	2024-12-07 17:51:19.941906+00	399	Schaatsen 2024 - Schaatsen 2024 - DidTyraWin?	1	[{"added": {}}]	20	3
1592	2024-12-07 17:51:49.994309+00	400	Schaatsen 2024 - Schaatsen 2024 - Polonaise	1	[{"added": {}}]	20	3
1593	2024-12-07 17:52:08.149561+00	401	Schaatsen 2024 - Schaatsen 2024 - ReinHubbaHubba	1	[{"added": {}}]	20	3
1594	2024-12-07 17:52:27.445204+00	402	Schaatsen 2024 - Schaatsen 2024 - CuteCouple2ElectricBoogaloo	1	[{"added": {}}]	20	3
1595	2024-12-07 17:52:51.88156+00	403	Schaatsen 2024 - Schaatsen 2024 - LocalPsychoLocated	1	[{"added": {}}]	20	3
1596	2024-12-07 17:53:36.410128+00	404	Schaatsen 2024 - Schaatsen 2024 - SeppeDefaultPose	1	[{"added": {}}]	20	3
1597	2024-12-07 17:54:29.731689+00	405	Schaatsen 2024 - Schaatsen 2024 - POVYourCrushFromAcrossTheRoom	1	[{"added": {}}]	20	3
1598	2024-12-07 17:54:53.666078+00	406	Schaatsen 2024 - Schaatsen 2024 - MediaGoesVroem	1	[{"added": {}}]	20	3
1599	2024-12-07 17:55:14.612578+00	407	Schaatsen 2024 - Schaatsen 2024 - WhatAHandsomeYoungLad	1	[{"added": {}}]	20	3
1600	2024-12-07 17:55:35.214409+00	408	Schaatsen 2024 - Schaatsen 2024 - AmberLaugh	1	[{"added": {}}]	20	3
1601	2024-12-07 17:56:02.422994+00	409	Schaatsen 2024 - Schaatsen 2024 - HeGotSomethingInteresting	1	[{"added": {}}]	20	3
1602	2024-12-07 17:56:39.978852+00	406	Schaatsen 2024 - Schaatsen 2024 - MediaGoesVroem	2	[{"changed": {"fields": ["Link"]}}]	20	3
1603	2024-12-07 17:57:16.608908+00	410	Schaatsen 2024 - Schaatsen 2024 - TheNegotiationsWereShort	1	[{"added": {}}]	20	3
1604	2024-12-07 17:57:31.262422+00	411	Schaatsen 2024 - Schaatsen 2024 - KirstenLaugh	1	[{"added": {}}]	20	3
1605	2024-12-07 17:57:47.341987+00	412	Schaatsen 2024 - Schaatsen 2024 - BestOfFriends	1	[{"added": {}}]	20	3
1606	2024-12-07 17:58:02.791288+00	413	Schaatsen 2024 - Schaatsen 2024 - OldButGold	1	[{"added": {}}]	20	3
1607	2024-12-07 17:58:23.551698+00	414	Schaatsen 2024 - Schaatsen 2024 - TheLadyInTheRedSkirt	1	[{"added": {}}]	20	3
1608	2024-12-07 17:58:40.569304+00	415	Schaatsen 2024 - Schaatsen 2024 - MilanDistortsReality	1	[{"added": {}}]	20	3
1609	2024-12-07 17:59:06.978056+00	416	Schaatsen 2024 - Schaatsen 2024 - ThePokemonJourneyCanBegin	1	[{"added": {}}]	20	3
1610	2024-12-07 17:59:38.491041+00	417	Schaatsen 2024 - Schaatsen 2024 - Banana2	1	[{"added": {}}]	20	3
1611	2024-12-07 17:59:54.374229+00	418	Schaatsen 2024 - Schaatsen 2024 - ReinaThumbsUp	1	[{"added": {}}]	20	3
1612	2024-12-07 18:00:10.172196+00	419	Schaatsen 2024 - Schaatsen 2024 - GreatFriends	1	[{"added": {}}]	20	3
1613	2024-12-07 18:00:24.294595+00	420	Schaatsen 2024 - Schaatsen 2024 - Bonding	1	[{"added": {}}]	20	3
1614	2024-12-07 18:00:44.976063+00	421	Schaatsen 2024 - Schaatsen 2024 - Polonaise2	1	[{"added": {}}]	20	3
1615	2024-12-07 18:01:05.899464+00	422	Schaatsen 2024 - Schaatsen 2024 - TimeSlowingDown	1	[{"added": {}}]	20	3
1616	2024-12-07 18:01:23.399122+00	423	Schaatsen 2024 - Schaatsen 2024 - AnotherCuteCouple	1	[{"added": {}}]	20	3
1617	2024-12-07 18:01:37.39679+00	424	Schaatsen 2024 - Schaatsen 2024 - JonahSwag	1	[{"added": {}}]	20	3
1618	2024-12-07 18:01:52.813208+00	425	Schaatsen 2024 - Schaatsen 2024 - NyoCloseUp	1	[{"added": {}}]	20	3
1619	2024-12-07 18:02:08.091893+00	426	Schaatsen 2024 - Schaatsen 2024 - TheMexicanWave	1	[{"added": {}}]	20	3
1620	2024-12-07 18:02:26.634166+00	427	Schaatsen 2024 - Schaatsen 2024 - MaxeSkating	1	[{"added": {}}]	20	3
1621	2024-12-07 18:03:15.307747+00	427	Schaatsen 2024 - Schaatsen 2024 - MaxeSkating	3		20	3
1622	2024-12-18 20:16:44.049545+00	171	2024 - 2025 Praeses	3		19	3
1623	2024-12-24 15:04:48.605268+00	79	Comfy Secret Santa 2024	1	[{"added": {}}]	12	221
1624	2024-12-24 15:09:38.146322+00	428	Comfy Secret Santa 2024 - SESA 2024 - EvelienWithPresent	1	[{"added": {}}]	20	221
1625	2024-12-24 15:10:15.933664+00	429	Comfy Secret Santa 2024 - SESA 2024 - BrittMislukteSelfieQueen	1	[{"added": {}}]	20	221
1626	2024-12-24 15:10:41.120551+00	430	Comfy Secret Santa 2024 - SESA 2024 - RicardoWithPresent	1	[{"added": {}}]	20	221
1627	2024-12-24 15:11:00.689157+00	431	Comfy Secret Santa 2024 - SESA 2024 - VincentPandaPresent	1	[{"added": {}}]	20	221
1628	2024-12-24 15:11:19.558918+00	432	Comfy Secret Santa 2024 - SESA 2024 - DiedePresentMaxeWow	1	[{"added": {}}]	20	221
1629	2024-12-24 15:11:48.89875+00	433	Comfy Secret Santa 2024 - SESA 2024 - MaxeWOW	1	[{"added": {}}]	20	221
1630	2024-12-24 15:12:13.895525+00	434	Comfy Secret Santa 2024 - SESA 2024 - WarreShowingOfPresent	1	[{"added": {}}]	20	221
1631	2024-12-24 15:12:33.35065+00	435	Comfy Secret Santa 2024 - SESA 2024 - WarreWithPresent	1	[{"added": {}}]	20	221
1632	2024-12-24 15:12:53.168157+00	436	Comfy Secret Santa 2024 - SESA 2024 - HappyRienYay	1	[{"added": {}}]	20	221
1633	2024-12-24 15:13:13.061872+00	437	Comfy Secret Santa 2024 - SESA 2024 - MilanStruggledMetCadeau	1	[{"added": {}}]	20	221
1634	2024-12-24 15:13:38.234717+00	438	Comfy Secret Santa 2024 - SESA 2024 - MilanStruggledMetCadeauPart2	1	[{"added": {}}]	20	221
1635	2024-12-24 15:13:53.393895+00	439	Comfy Secret Santa 2024 - SESA 2024 - MaxeWithPresent	1	[{"added": {}}]	20	221
1636	2024-12-24 15:14:11.501891+00	440	Comfy Secret Santa 2024 - SESA 2024 - TyraWithPresent	1	[{"added": {}}]	20	221
1637	2024-12-24 15:14:36.106911+00	441	Comfy Secret Santa 2024 - SESA 2024 - ElfFlofWithPresent	1	[{"added": {}}]	20	221
1638	2024-12-24 15:15:04.766254+00	442	Comfy Secret Santa 2024 - SESA 2024 - KobeWithPresent	1	[{"added": {}}]	20	221
1639	2024-12-24 15:15:22.354913+00	443	Comfy Secret Santa 2024 - SESA 2024 - KobeWithPresentLOOK	1	[{"added": {}}]	20	221
1640	2024-12-24 15:15:46.565666+00	444	Comfy Secret Santa 2024 - SESA 2024 - HappyRienYAAAAY3	1	[{"added": {}}]	20	221
1641	2024-12-24 15:16:04.781236+00	445	Comfy Secret Santa 2024 - SESA 2024 - LisaWithDucks	1	[{"added": {}}]	20	221
1642	2024-12-24 15:16:23.269779+00	446	Comfy Secret Santa 2024 - SESA 2024 - BrittWithUno	1	[{"added": {}}]	20	221
1643	2024-12-24 15:16:58.0152+00	447	Comfy Secret Santa 2024 - SESA 2024 - ValerieWithPlush	1	[{"added": {}}]	20	221
1644	2024-12-24 15:17:17.834812+00	448	Comfy Secret Santa 2024 - SESA 2024 - JensWithPresent	1	[{"added": {}}]	20	221
1645	2024-12-24 15:17:29.979393+00	449	Comfy Secret Santa 2024 - SESA - TejasWOOW	1	[{"added": {}}]	20	221
1646	2024-12-24 15:17:53.703507+00	450	Comfy Secret Santa 2024 - SESA 2024 - AmberCuteWithPresent	1	[{"added": {}}]	20	221
1647	2024-12-24 15:18:11.458547+00	451	Comfy Secret Santa 2024 - SESA 2024 - AaronMetPlaat	1	[{"added": {}}]	20	221
1648	2024-12-24 15:18:27.419805+00	452	Comfy Secret Santa 2024 - SESA 2024 - BennyWithPresent	1	[{"added": {}}]	20	221
1650	2024-12-24 15:20:29.235583+00	454	Comfy Secret Santa 2024 - SESA 2024 - TarsWithPresent	1	[{"added": {}}]	20	221
1653	2024-12-24 15:21:27.577036+00	457	Comfy Secret Santa 2024 - SESA 2024 - SeppHappyWithMug	1	[{"added": {}}]	20	221
1655	2024-12-24 15:22:05.305898+00	459	Comfy Secret Santa 2024 - SESA 2024 - YoranShowingPresent	1	[{"added": {}}]	20	221
1656	2024-12-24 15:22:29.847539+00	460	Comfy Secret Santa 2024 - SESA 2024 - TanguyWithPresent	1	[{"added": {}}]	20	221
1657	2024-12-24 15:22:43.693186+00	79	Comfy Secret Santa 2024	2	[{"changed": {"fields": ["Visible"]}}]	12	221
1649	2024-12-24 15:18:44.572025+00	453	Comfy Secret Santa 2024 - SESA 2024 - AlgemeenSfeerbeeld	1	[{"added": {}}]	20	221
1651	2024-12-24 15:20:50.308935+00	455	Comfy Secret Santa 2024 - SESA 2024 - HappyBriekWithPresent	1	[{"added": {}}]	20	221
1652	2024-12-24 15:21:11.129762+00	456	Comfy Secret Santa 2024 - SESA 2024 - BriekShowingPresent	1	[{"added": {}}]	20	221
1654	2024-12-24 15:21:43.101699+00	458	Comfy Secret Santa 2024 - SESA 2024 - SeppUnboxing	1	[{"added": {}}]	20	221
1658	2025-01-15 18:53:32.255863+00	173	2024 - 2025 Feest & LAN	3		19	2
1659	2025-01-25 12:16:48.972876+00	261	LAN	1	[{"added": {}}]	23	221
1660	2025-01-25 12:17:36.374872+00	261	LAN	2	[{"changed": {"fields": ["End"]}}]	23	221
1661	2025-01-25 18:30:49.787882+00	262	Schaaktoernooi	1	[{"added": {}}]	23	7
1662	2025-01-27 18:37:26.662492+00	263	Valentijn clubavond	1	[{"added": {}}]	23	221
1663	2025-01-27 18:38:21.885694+00	264	Movie Night	1	[{"added": {}}]	23	221
1664	2025-01-30 17:28:53.400235+00	261	The neverending LAN	2	[{"changed": {"fields": ["Name", "Description", "Poster"]}}]	23	221
1665	2025-01-30 17:29:14.025155+00	261	The neverending LAN	2	[{"changed": {"fields": ["Description"]}}]	23	221
1666	2025-01-30 17:29:47.693346+00	261	The neverending LAN	2	[{"changed": {"fields": ["Description"]}}]	23	221
1667	2025-01-31 21:31:44.651035+00	142	SEPP	2	[{"changed": {"fields": ["Website"]}}]	17	2
1668	2025-02-01 14:34:21.050401+00	265	Just Dance Toernooi	1	[{"added": {}}]	23	221
1669	2025-02-01 14:35:05.940795+00	266	Feestje	1	[{"added": {}}]	23	221
1670	2025-02-03 10:34:08.093058+00	267	Pizza & Boardgames	1	[{"added": {}}]	23	221
1671	2025-02-03 10:34:46.504889+00	268	Escape Room	1	[{"added": {}}]	23	221
1672	2025-02-03 17:10:18.335034+00	262	Schaaktoernooi	2	[{"changed": {"fields": ["Description", "Url"]}}]	23	221
1673	2025-02-03 17:10:30.603816+00	262	Schaaktoernooi	2	[{"changed": {"fields": ["Poster"]}}]	23	221
1674	2025-02-03 17:11:00.178931+00	262	Schaaktoernooi	2	[{"changed": {"fields": ["Description"]}}]	23	221
1675	2025-02-03 17:11:29.337426+00	262	Schaaktoernooi	2	[{"changed": {"fields": ["Description"]}}]	23	221
1676	2025-02-05 17:21:59.346114+00	263	Valentijn clubavond	2	[{"changed": {"fields": ["Description", "Poster"]}}]	23	221
1677	2025-02-07 16:03:56.051544+00	144	Mythropool	1	[{"added": {}}]	17	2
1678	2025-02-07 16:04:14.079118+00	144	Mythropool	2	[{"changed": {"fields": ["Inverted color"]}}]	17	2
1679	2025-02-07 16:09:16.017231+00	145	8tea5	1	[{"added": {}}]	17	2
1680	2025-02-09 15:44:59.426779+00	167	2024 - 2025 PR	3		19	2
1681	2025-02-12 20:33:05.017197+00	264	Movie Night	2	[{"changed": {"fields": ["Description", "Url", "Poster", "Start"]}}]	23	221
1682	2025-02-17 20:37:43.150929+00	206	2024 - 2025 Praeses	1	[{"added": {}}]	19	2
1683	2025-02-19 11:56:16.309275+00	265	Just Dance Toernooi	2	[{"changed": {"fields": ["Description", "Url", "Poster", "Start"]}}]	23	221
1684	2025-02-20 17:09:23.624971+00	266	Back to the 80's - Throwback Party	2	[{"changed": {"fields": ["Name", "Description", "Poster", "Start", "Location"]}}]	23	221
1685	2025-02-20 17:34:31.912548+00	266	Back to the 80's - Throwback Party	2	[{"changed": {"fields": ["Description"]}}]	23	221
1686	2025-02-22 18:32:37.530655+00	268	Escape Room	2	[{"changed": {"fields": ["Description", "Url", "Poster", "Start", "End", "Location", "Max registered"]}}]	23	221
1687	2025-02-22 18:32:55.924856+00	268	Escape Room	2	[{"changed": {"fields": ["Description"]}}]	23	221
1688	2025-02-23 13:54:22.116582+00	80	Heimdalweekend 2025	1	[{"added": {}}]	12	221
1689	2025-02-23 13:54:30.868804+00	80	Heimdalweekend 2025	2	[{"changed": {"fields": ["Visible"]}}]	12	221
1690	2025-02-23 13:54:37.528675+00	80	Heimdalweekend 2025	2	[{"changed": {"fields": ["Visible"]}}]	12	221
1691	2025-02-23 13:55:52.58528+00	461	Heimdalweekend 2025 - Weekend_Groepsfoto_Schild	1	[{"added": {}}]	20	221
1692	2025-02-23 13:56:14.256379+00	462	Heimdalweekend 2025 - Weekend_Groepsfoto_ZonderSchild	1	[{"added": {}}]	20	221
1693	2025-02-23 13:56:42.912464+00	463	Heimdalweekend 2025 - Autorit_Brum	1	[{"added": {}}]	20	221
1694	2025-02-23 13:56:55.142214+00	464	Heimdalweekend 2025 - Autorit_Maxe	1	[{"added": {}}]	20	221
1695	2025-02-23 13:57:16.655339+00	465	Heimdalweekend 2025 - Autorit_Diede	1	[{"added": {}}]	20	221
1696	2025-02-23 13:57:53.126728+00	466	Heimdalweekend 2025 - HuesAndCuesChaos	1	[{"added": {}}]	20	221
1697	2025-02-23 13:58:17.259885+00	467	Heimdalweekend 2025 - Seppe_ThumbsUp_KirstenEnCo	1	[{"added": {}}]	20	221
1698	2025-02-23 13:58:58.401657+00	468	Heimdalweekend 2025 - MaxeWordtOpgeofferd	1	[{"added": {}}]	20	221
1699	2025-02-23 13:59:19.52924+00	469	Heimdalweekend 2025 - MilanMonkey	1	[{"added": {}}]	20	221
1700	2025-02-23 13:59:41.511075+00	470	Heimdalweekend 2025 - Sacha_En_Karsten_Stick	1	[{"added": {}}]	20	221
1701	2025-02-23 13:59:59.581671+00	471	Heimdalweekend 2025 - Simon_Arrow	1	[{"added": {}}]	20	221
1702	2025-02-23 14:00:21.580758+00	472	Heimdalweekend 2025 - ChairTowerOfGlory	1	[{"added": {}}]	20	221
1703	2025-02-23 14:00:59.60154+00	473	Heimdalweekend 2025 - Patatje_Fredje	1	[{"added": {}}]	20	221
1704	2025-02-23 14:01:14.45964+00	474	Heimdalweekend 2025 - Milan_Nyo_Toren	1	[{"added": {}}]	20	221
1705	2025-02-23 14:01:29.091603+00	475	Heimdalweekend 2025 - Milan_Rein_Monkey	1	[{"added": {}}]	20	221
1706	2025-02-23 14:01:52.73356+00	476	Heimdalweekend 2025 - HeldhaftigeHelden	1	[{"added": {}}]	20	221
1707	2025-02-23 14:02:14.449395+00	477	Heimdalweekend 2025 - Will_NieuweKapsels	1	[{"added": {}}]	20	221
1708	2025-02-23 14:02:42.168142+00	478	Heimdalweekend 2025 - DonkeyKong_Challenge	1	[{"added": {}}]	20	221
1709	2025-02-23 14:02:55.192354+00	479	Heimdalweekend 2025 - Kampvuur	1	[{"added": {}}]	20	221
1710	2025-02-23 14:03:12.319915+00	480	Heimdalweekend 2025 - KarstenPunishingNyoWithStick	1	[{"added": {}}]	20	221
1711	2025-02-23 14:03:26.331978+00	481	Heimdalweekend 2025 - Tyra_WithBowAndArrow	1	[{"added": {}}]	20	221
1712	2025-02-23 14:03:46.218062+00	482	Heimdalweekend 2025 - TeleurstellendePijlAfketsing	1	[{"added": {}}]	20	221
1713	2025-02-23 14:04:12.46653+00	483	Heimdalweekend 2025 - Rien_Disorientated	1	[{"added": {}}]	20	221
1714	2025-02-23 14:04:31.135354+00	484	Heimdalweekend 2025 - Benny_BekertjesOmgooien	1	[{"added": {}}]	20	221
1715	2025-02-23 14:04:43.428893+00	485	Heimdalweekend 2025 - Stoelendans	1	[{"added": {}}]	20	221
1716	2025-02-23 14:05:06.818942+00	486	Heimdalweekend 2025 - RussianDance_denkIk	1	[{"added": {}}]	20	221
1717	2025-02-23 14:05:24.478554+00	487	Heimdalweekend 2025 - Florian_SlowmoDancing	1	[{"added": {}}]	20	221
1718	2025-02-23 14:05:38.899366+00	488	Heimdalweekend 2025 - UpsideDown_Macarena	1	[{"added": {}}]	20	221
1719	2025-02-23 14:05:51.39521+00	489	Heimdalweekend 2025 - Lisa_GuitarSolo	1	[{"added": {}}]	20	221
1720	2025-02-23 14:06:43.160564+00	80	Heimdalweekend 2025	2	[{"changed": {"fields": ["Visible"]}}]	12	221
1721	2025-02-23 14:07:38.720141+00	80	Heimdalweekend 2025	2	[{"changed": {"fields": ["Visible"]}}]	12	221
1722	2025-02-23 14:14:46.636089+00	80	Heimdalweekend 2025	2	[{"changed": {"fields": ["Visible"]}}]	12	221
1723	2025-02-23 14:15:03.170962+00	80	Heimdalweekend 2025	2	[{"changed": {"fields": ["Visible"]}}]	12	221
1724	2025-02-23 14:16:05.920398+00	80	Heimdalweekend 2025	2	[{"changed": {"fields": ["Visible"]}}]	12	221
1725	2025-02-23 14:16:28.955697+00	80	Heimdalweekend 2025	2	[{"changed": {"fields": ["Visible"]}}]	12	221
1726	2025-02-23 14:17:57.151245+00	490	Heimdalweekend 2025 - Daan_BijzonderBalletjeInSoep	1	[{"added": {}}]	20	221
1727	2025-02-23 14:57:37.375364+00	461	Heimdalweekend 2025 - Weekend_Groepsfoto_Schild	2	[{"changed": {"fields": ["Link"]}}]	20	221
1728	2025-02-23 14:57:52.343712+00	462	Heimdalweekend 2025 - Weekend_Groepsfoto_ZonderSchild	2	[{"changed": {"fields": ["Link"]}}]	20	221
1729	2025-02-23 14:58:09.379411+00	80	Heimdalweekend 2025	2	[{"changed": {"fields": ["Visible"]}}]	12	221
1730	2025-02-23 14:58:49.203608+00	490	Heimdalweekend 2025 - Daan_BijzonderBalletjeInSoep	2	[]	20	221
1731	2025-02-23 14:58:51.336464+00	489	Heimdalweekend 2025 - Lisa_GuitarSolo	2	[]	20	221
1732	2025-02-23 14:58:53.650542+00	488	Heimdalweekend 2025 - UpsideDown_Macarena	2	[]	20	221
1733	2025-02-23 14:58:56.170978+00	487	Heimdalweekend 2025 - Florian_SlowmoDancing	2	[]	20	221
1734	2025-02-23 14:58:58.294234+00	486	Heimdalweekend 2025 - RussianDance_denkIk	2	[]	20	221
1735	2025-02-23 14:59:02.180716+00	485	Heimdalweekend 2025 - Stoelendans	2	[]	20	221
1736	2025-02-23 14:59:04.830817+00	484	Heimdalweekend 2025 - Benny_BekertjesOmgooien	2	[]	20	221
1737	2025-02-23 14:59:07.176919+00	483	Heimdalweekend 2025 - Rien_Disorientated	2	[]	20	221
1738	2025-02-23 14:59:09.506289+00	482	Heimdalweekend 2025 - TeleurstellendePijlAfketsing	2	[]	20	221
1739	2025-02-23 14:59:11.608134+00	481	Heimdalweekend 2025 - Tyra_WithBowAndArrow	2	[]	20	221
1740	2025-02-23 14:59:13.659869+00	480	Heimdalweekend 2025 - KarstenPunishingNyoWithStick	2	[]	20	221
1741	2025-02-23 14:59:15.876915+00	479	Heimdalweekend 2025 - Kampvuur	2	[]	20	221
1742	2025-02-23 14:59:18.190919+00	478	Heimdalweekend 2025 - DonkeyKong_Challenge	2	[]	20	221
1743	2025-02-23 14:59:20.243982+00	479	Heimdalweekend 2025 - Kampvuur	2	[]	20	221
1744	2025-02-23 14:59:22.575699+00	477	Heimdalweekend 2025 - Will_NieuweKapsels	2	[]	20	221
1745	2025-02-23 14:59:26.120269+00	476	Heimdalweekend 2025 - HeldhaftigeHelden	2	[]	20	221
1746	2025-02-23 14:59:28.96911+00	475	Heimdalweekend 2025 - Milan_Rein_Monkey	2	[]	20	221
1747	2025-02-23 14:59:33.963797+00	474	Heimdalweekend 2025 - Milan_Nyo_Toren	2	[]	20	221
1748	2025-02-23 14:59:37.083371+00	473	Heimdalweekend 2025 - Patatje_Fredje	2	[]	20	221
1749	2025-02-23 14:59:38.906644+00	472	Heimdalweekend 2025 - ChairTowerOfGlory	2	[]	20	221
1750	2025-02-23 14:59:41.35251+00	471	Heimdalweekend 2025 - Simon_Arrow	2	[]	20	221
1751	2025-02-23 14:59:43.439615+00	470	Heimdalweekend 2025 - Sacha_En_Karsten_Stick	2	[]	20	221
1752	2025-02-23 14:59:45.750106+00	469	Heimdalweekend 2025 - MilanMonkey	2	[]	20	221
1753	2025-02-23 14:59:48.4794+00	468	Heimdalweekend 2025 - MaxeWordtOpgeofferd	2	[]	20	221
1754	2025-02-23 14:59:50.872876+00	467	Heimdalweekend 2025 - Seppe_ThumbsUp_KirstenEnCo	2	[]	20	221
1755	2025-02-23 14:59:55.710923+00	466	Heimdalweekend 2025 - HuesAndCuesChaos	2	[]	20	221
1756	2025-02-23 14:59:59.016732+00	465	Heimdalweekend 2025 - Autorit_Diede	2	[]	20	221
1757	2025-02-23 15:00:01.471856+00	464	Heimdalweekend 2025 - Autorit_Maxe	2	[]	20	221
1758	2025-02-23 15:00:04.446941+00	463	Heimdalweekend 2025 - Autorit_Brum	2	[]	20	221
1759	2025-02-23 15:00:53.164199+00	463	Heimdalweekend 2025 - Autorit_Brum	2	[]	20	221
1760	2025-02-24 10:23:44.553031+00	81	Schaaktoernooi 2025	1	[{"added": {}}]	12	221
1761	2025-02-24 10:24:27.060865+00	491	Schaaktoernooi 2025 - Schaakbord_Pionnen	1	[{"added": {}}]	20	221
1762	2025-02-24 10:25:02.998362+00	492	Schaaktoernooi 2025 - TrofeetjeVoorSchaaktoernooi	1	[{"added": {}}]	20	221
1763	2025-02-24 10:25:27.393668+00	493	Schaaktoernooi 2025 - ThumbsUp_SeppeMetPetekindjes	1	[{"added": {}}]	20	221
1764	2025-02-24 10:25:48.593591+00	494	Schaaktoernooi 2025 - Simon_AcceptingDefeat	1	[{"added": {}}]	20	221
1765	2025-02-24 10:26:13.333109+00	495	Schaaktoernooi 2025 - Winnaar_Tanguy_Schaaktoernooi	1	[{"added": {}}]	20	221
1766	2025-02-24 10:26:30.62082+00	496	Schaaktoernooi 2025 - 2dePlaats_Wout_Schaaktoernooi	1	[{"added": {}}]	20	221
1767	2025-02-24 10:26:51.806223+00	497	Schaaktoernooi 2025 - 3dePlaats_Marwan_Schaaktoernooi	1	[{"added": {}}]	20	221
1768	2025-02-24 10:27:11.156728+00	498	Schaaktoernooi 2025 - ThumbsUp_SeppeMetPetekindjes_Smile	1	[{"added": {}}]	20	221
1769	2025-02-24 10:27:31.496737+00	499	Schaaktoernooi 2025 - Axelle_ThumbsUp	1	[{"added": {}}]	20	221
1770	2025-02-24 10:27:56.091927+00	500	Schaaktoernooi 2025 - FinaleSchaaktoernooi_SeppeRooting	1	[{"added": {}}]	20	221
1771	2025-02-24 10:30:50.466953+00	501	Schaaktoernooi 2025 - Schaak_YoranFocus_MilanSatisfied	1	[{"added": {}}]	20	221
1772	2025-02-24 10:31:13.095655+00	502	Schaaktoernooi 2025 - Finale_TanguyFocus	1	[{"added": {}}]	20	221
1773	2025-02-24 10:31:42.218769+00	503	Schaaktoernooi 2025 - FinaleEinde_Wout_vs_Tanguy	1	[{"added": {}}]	20	221
1774	2025-02-24 10:31:58.827183+00	504	Schaaktoernooi 2025 - Schaaktoernooi_Seppe_ThumbsUp	1	[{"added": {}}]	20	221
1775	2025-02-24 10:32:13.302756+00	505	Schaaktoernooi 2025 - Schaakbord_Pionnen_2	1	[{"added": {}}]	20	221
1776	2025-02-24 10:32:30.553801+00	506	Schaaktoernooi 2025 - Tanguy_Focus_Finale	1	[{"added": {}}]	20	221
1777	2025-02-24 10:32:48.005801+00	507	Schaaktoernooi 2025 - Milan_Focus	1	[{"added": {}}]	20	221
1778	2025-02-24 10:33:06.184107+00	508	Schaaktoernooi 2025 - Wout_Explaining_Chess	1	[{"added": {}}]	20	221
1779	2025-02-24 10:33:44.29688+00	509	Schaaktoernooi 2025 - Simon_Sad	1	[{"added": {}}]	20	221
1780	2025-02-24 10:34:16.183654+00	510	Schaaktoernooi 2025 - Simon_HappilyAcceptingDefeat	1	[{"added": {}}]	20	221
1781	2025-02-24 10:34:32.605015+00	511	Schaaktoernooi 2025 - Tanguy_Focus	1	[{"added": {}}]	20	221
1782	2025-02-24 10:34:56.695176+00	512	Schaaktoernooi 2025 - Marwan_En_Tanguy_Focus	1	[{"added": {}}]	20	221
1783	2025-02-24 10:35:12.696196+00	513	Schaaktoernooi 2025 - Simon_EnjoyingChess	1	[{"added": {}}]	20	221
1784	2025-02-24 10:35:32.730813+00	514	Schaaktoernooi 2025 - Yoran_ThumbsUp_WinningChess	1	[{"added": {}}]	20	221
1785	2025-02-24 10:36:00.604852+00	515	Schaaktoernooi 2025 - Ruben_Focus	1	[{"added": {}}]	20	221
1786	2025-02-24 10:36:14.098181+00	516	Schaaktoernooi 2025 - Yoran_Focus	1	[{"added": {}}]	20	221
1787	2025-02-24 10:36:32.541125+00	517	Schaaktoernooi 2025 - Sander_HappyChess	1	[{"added": {}}]	20	221
1788	2025-02-24 10:36:50.236056+00	518	Schaaktoernooi 2025 - MilanTryingToDefeatWout	1	[{"added": {}}]	20	221
1789	2025-02-24 10:37:15.373005+00	81	Schaaktoernooi 2025	2	[{"changed": {"fields": ["Visible"]}}]	12	221
1790	2025-02-24 10:38:03.766143+00	81	Schaaktoernooi 2025	2	[{"changed": {"fields": ["Visible"]}}]	12	221
1791	2025-02-24 19:09:01.577202+00	267	Pizza & Boardgames	2	[{"changed": {"fields": ["Description", "Url", "Poster", "Start"]}}]	23	221
1792	2025-02-25 17:04:00.772315+00	269	Schachtenevent: Return to Hawkins	1	[{"added": {}}]	23	8
1793	2025-02-25 17:04:38.65224+00	269	Schachtenevent: Return to Hawkins	2	[{"changed": {"fields": ["Description"]}}]	23	8
1794	2025-02-25 17:09:43.873676+00	269	Schachtenevent: Return to Hawkins	2	[{"changed": {"fields": ["Description"]}}]	23	8
1795	2025-02-25 17:11:13.478422+00	269	Schachtenevent: Return to Hawkins	2	[{"changed": {"fields": ["Description"]}}]	23	8
1796	2025-02-25 17:18:47.90547+00	269	Schachtenevent: Return to Hawkins	2	[{"changed": {"fields": ["Url"]}}]	23	221
1829	2025-03-02 17:09:23.253736+00	81	Schaaktoernooi 2025	2	[{"changed": {"fields": ["Visible"]}}]	12	221
1830	2025-03-02 19:39:29.031059+00	302	Super Smash Bros Ultimate Toernooi	1	[{"added": {}}]	23	7
1831	2025-03-04 19:13:54.257078+00	303	HOGENT Dodgeball Toernooi	1	[{"added": {}}]	23	221
1832	2025-03-04 19:15:11.101611+00	304	PowerPoint avond: Praesidiumfuncties	1	[{"added": {}}]	23	221
1833	2025-03-04 19:16:07.445426+00	305	Karakoe II	1	[{"added": {}}]	23	221
1834	2025-03-04 19:16:56.021492+00	306	Ontgroening	1	[{"added": {}}]	23	221
1835	2025-03-06 11:56:57.651536+00	172	2024 - 2025 Secretaris	2	[{"changed": {"fields": ["Praesidium member", "Photo"]}}]	19	2
1836	2025-03-06 11:59:18.68959+00	239	2024 - 2025 Keizer Feest & LAN	1	[{"added": {}}]	19	2
1837	2025-03-07 17:34:38.058096+00	114	Just Dance Toernooi 2025	1	[{"added": {}}]	12	221
1838	2025-03-07 17:47:36.125964+00	540	Just Dance Toernooi 2025 - Rasputin_Maxe_Ruben	1	[{"added": {}}]	20	221
1839	2025-03-07 17:48:03.75104+00	541	Just Dance Toernooi 2025 - Dancing_Axelle&Kirsten	1	[{"added": {}}]	20	221
1840	2025-03-07 17:48:27.721194+00	542	Just Dance Toernooi 2025 - Dancing_Diede&Tyra&Axelle	1	[{"added": {}}]	20	221
1841	2025-03-07 17:48:46.504779+00	543	Just Dance Toernooi 2025 - WOW_DansendeSeppe	1	[{"added": {}}]	20	221
1842	2025-03-07 17:49:01.326135+00	544	Just Dance Toernooi 2025 - Dancing_Axelle&Kirsten_2	1	[{"added": {}}]	20	221
1843	2025-03-07 17:49:16.285765+00	545	Just Dance Toernooi 2025 - Dancing_Rasputin_Tyra&Maxe	1	[{"added": {}}]	20	221
1844	2025-03-07 17:49:39.101123+00	546	Just Dance Toernooi 2025 - Dancing_Diede&Tyra	1	[{"added": {}}]	20	221
1845	2025-03-07 17:49:51.87778+00	547	Just Dance Toernooi 2025 - Sfeerbeeld_JustDance2025	1	[{"added": {}}]	20	221
1846	2025-03-07 17:50:09.414124+00	548	Just Dance Toernooi 2025 - Sfeerbeeld_JustDance2025_RienHappy	1	[{"added": {}}]	20	221
1847	2025-03-07 17:50:24.936262+00	549	Just Dance Toernooi 2025 - Reina_AchterToog_Hat	1	[{"added": {}}]	20	221
1848	2025-03-07 17:50:58.140114+00	550	Just Dance Toernooi 2025 - Hayley_posing	1	[{"added": {}}]	20	221
1849	2025-03-07 17:51:08.760413+00	551	Just Dance Toernooi 2025 - Maxe_Cheers	1	[{"added": {}}]	20	221
1850	2025-03-07 17:51:31.921884+00	552	Just Dance Toernooi 2025 - Chillguy_Nick&Tyra	1	[{"added": {}}]	20	221
1851	2025-03-07 17:51:42.979657+00	553	Just Dance Toernooi 2025 - Simon_Cheers	1	[{"added": {}}]	20	221
1852	2025-03-07 17:51:54.821134+00	554	Just Dance Toernooi 2025 - Simon_Happy	1	[{"added": {}}]	20	221
1853	2025-03-07 17:52:22.129454+00	555	Just Dance Toernooi 2025 - Axelle&Flof_AanBar	1	[{"added": {}}]	20	221
1854	2025-03-07 17:52:42.537792+00	556	Just Dance Toernooi 2025 - Sfeerbeeld_JustDance2025_RasputinBG	1	[{"added": {}}]	20	221
1855	2025-03-07 17:52:56.59368+00	557	Just Dance Toernooi 2025 - Sfeerbeeld_JustDance2025_RasputinBG_2	1	[{"added": {}}]	20	221
1856	2025-03-07 17:53:11.868569+00	558	Just Dance Toernooi 2025 - Rasputin_Maxe_Ruben_2	1	[{"added": {}}]	20	221
1857	2025-03-07 17:53:23.588725+00	559	Just Dance Toernooi 2025 - Rien_Headband	1	[{"added": {}}]	20	221
1858	2025-03-07 17:53:36.537353+00	560	Just Dance Toernooi 2025 - Sfeerbeeld_JustDance2025_bar	1	[{"added": {}}]	20	221
1859	2025-03-07 17:53:51.226793+00	561	Just Dance Toernooi 2025 - Dancing_Axelle	1	[{"added": {}}]	20	221
1860	2025-03-07 17:54:01.841069+00	562	Just Dance Toernooi 2025 - SeppeWOW	1	[{"added": {}}]	20	221
1861	2025-03-07 17:54:12.939293+00	563	Just Dance Toernooi 2025 - RobocopMaxe	1	[{"added": {}}]	20	221
1862	2025-03-07 17:54:34.025281+00	564	Just Dance Toernooi 2025 - Axelle&Flof_AanBar_OtherPerspective	1	[{"added": {}}]	20	221
1863	2025-03-07 17:54:54.774576+00	565	Just Dance Toernooi 2025 - BennyWhateverThisPoseIs	1	[{"added": {}}]	20	221
1864	2025-03-07 17:55:12.298055+00	566	Just Dance Toernooi 2025 - Seppe_CorrectingGlasses	1	[{"added": {}}]	20	221
1865	2025-03-07 17:55:25.923222+00	567	Just Dance Toernooi 2025 - JustDanceScreen	1	[{"added": {}}]	20	221
1866	2025-03-07 17:55:39.370058+00	568	Just Dance Toernooi 2025 - Seppe_Explaining	1	[{"added": {}}]	20	221
1867	2025-03-07 17:55:55.944761+00	569	Just Dance Toernooi 2025 - JustDanceScreen_vogue	1	[{"added": {}}]	20	221
1868	2025-03-07 17:56:10.815431+00	570	Just Dance Toernooi 2025 - 1OfAnderZombieLied	1	[{"added": {}}]	20	221
1869	2025-03-07 17:56:30.088427+00	571	Just Dance Toernooi 2025 - Boodschappenlied	1	[{"added": {}}]	20	221
1870	2025-03-07 17:56:42.737458+00	572	Just Dance Toernooi 2025 - Daan_BeingCreepy	1	[{"added": {}}]	20	221
1871	2025-03-07 17:57:04.480339+00	573	Just Dance Toernooi 2025 - Winnaar_Maxe_JDT	1	[{"added": {}}]	20	221
1872	2025-03-07 17:57:15.724826+00	574	Just Dance Toernooi 2025 - Winnaar_Maxe_JDT_2	1	[{"added": {}}]	20	221
1873	2025-03-07 17:57:37.354679+00	575	Just Dance Toernooi 2025 - Amber_2nd_JDT	1	[{"added": {}}]	20	221
1874	2025-03-07 17:57:58.58277+00	576	Just Dance Toernooi 2025 - Axelle_3rd_JDT_BooSeppe	1	[{"added": {}}]	20	221
1875	2025-03-07 17:58:11.797771+00	577	Just Dance Toernooi 2025 - Amber_2nd_JDT_2	1	[{"added": {}}]	20	221
1876	2025-03-07 17:58:28.260232+00	578	Just Dance Toernooi 2025 - Winnaar_Maxe_JDT_peeking	1	[{"added": {}}]	20	221
1877	2025-03-07 17:58:40.855125+00	579	Just Dance Toernooi 2025 - Axelle_3rd_JDT	1	[{"added": {}}]	20	221
1878	2025-03-07 17:59:19.728869+00	580	Just Dance Toernooi 2025 - Albatraoz_RubenYay	1	[{"added": {}}]	20	221
1879	2025-03-07 17:59:31.512312+00	581	Just Dance Toernooi 2025 - EveryoneDancing	1	[{"added": {}}]	20	221
1880	2025-03-07 17:59:47.066325+00	582	Just Dance Toernooi 2025 - Albatraoz_Pros	1	[{"added": {}}]	20	221
1881	2025-03-07 18:00:03.475555+00	583	Just Dance Toernooi 2025 - Maxe_chachaslide	1	[{"added": {}}]	20	221
1882	2025-03-07 18:00:16.963136+00	584	Just Dance Toernooi 2025 - Maxe_sassyPose	1	[{"added": {}}]	20	221
1883	2025-03-07 18:00:26.458719+00	585	Just Dance Toernooi 2025 - Maxe_Exhausted	1	[{"added": {}}]	20	221
1884	2025-03-07 18:00:49.806637+00	586	Just Dance Toernooi 2025 - Maxe_sassyPose2_finale	1	[{"added": {}}]	20	221
1885	2025-03-07 18:01:05.777214+00	587	Just Dance Toernooi 2025 - Amber_SurprisedVictory	1	[{"added": {}}]	20	221
1886	2025-03-07 18:01:24.329898+00	588	Just Dance Toernooi 2025 - GameRoom_Dansers	1	[{"added": {}}]	20	221
1887	2025-03-07 18:01:35.123488+00	589	Just Dance Toernooi 2025 - CatDance	1	[{"added": {}}]	20	221
1888	2025-03-07 18:01:54.156539+00	590	Just Dance Toernooi 2025 - VerliefdeDansendeHeimies	1	[{"added": {}}]	20	221
1889	2025-03-07 18:02:13.271686+00	591	Just Dance Toernooi 2025 - SImonMaxeTyraFebe_ReadyToDance	1	[{"added": {}}]	20	221
1895	2025-03-07 18:04:09.480214+00	597	Just Dance Toernooi 2025 - Dancing_DiedeTyraAxelleKirsten	1	[{"added": {}}]	20	221
1890	2025-03-07 18:02:38.844236+00	592	Just Dance Toernooi 2025 - AfterCompetitionDancing_MaxeAxelle_Amber	1	[{"added": {}}]	20	221
1891	2025-03-07 18:02:50.386018+00	593	Just Dance Toernooi 2025 - JustDanceScreen2	1	[{"added": {}}]	20	221
1892	2025-03-07 18:03:14.315856+00	594	Just Dance Toernooi 2025 - HalveFinale_TyraAxelleMaxe	1	[{"added": {}}]	20	221
1893	2025-03-07 18:03:29.520072+00	595	Just Dance Toernooi 2025 - AmberMaxe_ReadyForFinal	1	[{"added": {}}]	20	221
1894	2025-03-07 18:03:42.00742+00	596	Just Dance Toernooi 2025 - RasputinJumping	1	[{"added": {}}]	20	221
1896	2025-03-07 18:04:24.036426+00	598	Just Dance Toernooi 2025 - HalveFinale_TyraAxelleAmber	1	[{"added": {}}]	20	221
1897	2025-03-07 18:04:37.92097+00	599	Just Dance Toernooi 2025 - GameRoom_Dansers_beforeDancing	1	[{"added": {}}]	20	221
1898	2025-03-07 18:05:27.753564+00	600	Just Dance Toernooi 2025 - HalveFinale_Before	1	[{"added": {}}]	20	221
1899	2025-03-07 18:05:45.124582+00	601	Just Dance Toernooi 2025 - SImonMaxeTyra_ReadyToDance	1	[{"added": {}}]	20	221
1900	2025-03-07 18:06:04.545045+00	602	Just Dance Toernooi 2025 - RasputinJumping2	1	[{"added": {}}]	20	221
1901	2025-03-07 18:06:32.434241+00	603	Just Dance Toernooi 2025 - JustDanceEnthousiastSeppe	1	[{"added": {}}]	20	221
1902	2025-03-07 18:06:46.687676+00	604	Just Dance Toernooi 2025 - Albatraoz_AxelleAmber	1	[{"added": {}}]	20	221
1903	2025-03-07 18:07:00.931199+00	605	Just Dance Toernooi 2025 - GameRoom_Dansers_Dancing	1	[{"added": {}}]	20	221
1904	2025-03-07 18:07:17.526619+00	606	Just Dance Toernooi 2025 - Dancing_RubenMarwanElineTyra	1	[{"added": {}}]	20	221
1905	2025-03-07 18:07:37.328316+00	607	Just Dance Toernooi 2025 - GameRoom_Dansers_Hands	1	[{"added": {}}]	20	221
1906	2025-03-07 18:07:51.168966+00	608	Just Dance Toernooi 2025 - EveryoneDancingRaisingHand	1	[{"added": {}}]	20	221
1907	2025-03-07 18:08:06.091272+00	609	Just Dance Toernooi 2025 - Dancing_Axelle&Kirsten2	1	[{"added": {}}]	20	221
1908	2025-03-07 18:08:24.640214+00	610	Just Dance Toernooi 2025 - Rasputin_TyraMaxeAxelle_Flying	1	[{"added": {}}]	20	221
1909	2025-03-07 18:08:38.080811+00	114	Just Dance Toernooi 2025	2	[{"changed": {"fields": ["Visible"]}}]	12	221
1910	2025-03-07 18:08:58.215206+00	114	Just Dance Toernooi 2025	2	[{"changed": {"fields": ["Visible"]}}]	12	221
1911	2025-03-07 18:09:38.605558+00	540	Just Dance Toernooi 2025 - Rasputin_Maxe_Ruben	2	[]	20	221
1912	2025-03-07 18:10:07.365524+00	114	Just Dance Toernooi 2025	2	[{"changed": {"fields": ["Visible"]}}]	12	221
1913	2025-03-07 18:11:16.949091+00	114	Just Dance Toernooi 2025	2	[{"changed": {"fields": ["Visible"]}}]	12	221
1914	2025-03-09 11:05:02.27456+00	114	Just Dance Toernooi 2025	2	[{"changed": {"fields": ["Visible"]}}]	12	221
1915	2025-03-09 11:05:41.081553+00	585	Just Dance Toernooi 2025 - Maxe_Exhausted	3		20	221
1916	2025-03-09 18:43:41.322135+00	307	Verbroedering Heimdal - Nemesis - Wieslandia	1	[{"added": {}}]	23	7
1917	2025-03-14 17:41:20.986259+00	307	Verbroedering Heimdal - Nemesis - Wieslandia	2	[{"changed": {"fields": ["Description", "Url", "Poster", "Location"]}}]	23	221
1918	2025-03-17 18:02:53.390581+00	304	PowerPoint avond: Praesidiumfuncties	2	[{"changed": {"fields": ["Description", "Url", "Poster", "Start", "Location", "Is open"]}}]	23	221
1919	2025-03-25 17:03:59.247497+00	308	Open vergadering	1	[{"added": {}}]	23	12
1952	2025-04-03 13:02:29.898018+00	261	The neverending LAN	2	[{"changed": {"fields": ["Description", "Url", "Start"]}}]	23	221
1953	2025-04-04 17:32:18.497972+00	341	Verkiezingen	1	[{"added": {}}]	23	12
1954	2025-04-05 13:40:27.305705+00	147	Verbroedering 2025 - Nemesis & Wieslandia	1	[{"added": {}}]	12	221
1955	2025-04-05 13:40:39.671952+00	147	Verbroedering 2025 - Nemesis & Wieslandia	2	[{"changed": {"fields": ["Visible"]}}]	12	221
1956	2025-04-05 13:49:24.302372+00	632	Verbroedering 2025 - Nemesis & Wieslandia - JackboxTafel_1	1	[{"added": {}}]	20	221
1957	2025-04-05 13:49:48.50859+00	633	Verbroedering 2025 - Nemesis & Wieslandia - MarioKartTafel_1	1	[{"added": {}}]	20	221
1958	2025-04-05 13:49:59.795486+00	634	Verbroedering 2025 - Nemesis & Wieslandia - JackboxTafel_2	1	[{"added": {}}]	20	221
1959	2025-04-05 13:50:10.00695+00	635	Verbroedering 2025 - Nemesis & Wieslandia - WiesTafel_1	1	[{"added": {}}]	20	221
1960	2025-04-05 13:50:23.05902+00	636	Verbroedering 2025 - Nemesis & Wieslandia - BoardgameTafel_1	1	[{"added": {}}]	20	221
1961	2025-04-05 13:50:33.026278+00	637	Verbroedering 2025 - Nemesis & Wieslandia - WiesTafel_2	1	[{"added": {}}]	20	221
1962	2025-04-05 13:50:47.922495+00	638	Verbroedering 2025 - Nemesis & Wieslandia - WiesTafel_2_SeppeUnsure	1	[{"added": {}}]	20	221
1963	2025-04-05 13:51:16.236585+00	639	Verbroedering 2025 - Nemesis & Wieslandia - WiiSportMastery	1	[{"added": {}}]	20	221
1964	2025-04-05 13:51:33.62816+00	640	Verbroedering 2025 - Nemesis & Wieslandia - WiezenIsFun	1	[{"added": {}}]	20	221
1965	2025-04-05 13:51:59.577459+00	641	Verbroedering 2025 - Nemesis & Wieslandia - SoloSlim_Achievement	1	[{"added": {}}]	20	221
1966	2025-04-05 13:52:10.043436+00	642	Verbroedering 2025 - Nemesis & Wieslandia - BoardgameTafel_2	1	[{"added": {}}]	20	221
1967	2025-04-05 13:52:19.054797+00	643	Verbroedering 2025 - Nemesis & Wieslandia - MarioKartTafel_2	1	[{"added": {}}]	20	221
1968	2025-04-05 13:52:32.682603+00	644	Verbroedering 2025 - Nemesis & Wieslandia - WiiSportMastery_2	1	[{"added": {}}]	20	221
1969	2025-04-05 13:52:48.683891+00	645	Verbroedering 2025 - Nemesis & Wieslandia - BoardgameTafel_3	1	[{"added": {}}]	20	221
1970	2025-04-05 13:52:57.511278+00	646	Verbroedering 2025 - Nemesis & Wieslandia - BoardgameTafel_4	1	[{"added": {}}]	20	221
1971	2025-04-05 13:53:08.80427+00	647	Verbroedering 2025 - Nemesis & Wieslandia - BoardgameTafel_5	1	[{"added": {}}]	20	221
1972	2025-04-05 13:53:18.437044+00	648	Verbroedering 2025 - Nemesis & Wieslandia - WiiSportMastery_3	1	[{"added": {}}]	20	221
1973	2025-04-05 13:53:28.562923+00	649	Verbroedering 2025 - Nemesis & Wieslandia - JackboxTafel_3	1	[{"added": {}}]	20	221
1974	2025-04-05 13:53:42.938311+00	650	Verbroedering 2025 - Nemesis & Wieslandia - Seppe_ReadyForVerbroedering	1	[{"added": {}}]	20	221
1975	2025-04-05 13:53:54.965727+00	651	Verbroedering 2025 - Nemesis & Wieslandia - BoardgameTafel_6	1	[{"added": {}}]	20	221
1976	2025-04-05 13:54:07.489434+00	652	Verbroedering 2025 - Nemesis & Wieslandia - WiesTafel_3	1	[{"added": {}}]	20	221
1977	2025-04-05 13:54:32.464893+00	147	Verbroedering 2025 - Nemesis & Wieslandia	2	[{"changed": {"fields": ["Visible"]}}]	12	221
1978	2025-04-05 13:54:59.268731+00	147	Verbroedering 2025 - Nemesis & Wieslandia	2	[{"changed": {"fields": ["Visible"]}}]	12	221
1979	2025-04-05 16:14:16.573587+00	147	Verbroedering 2025 - Nemesis & Wieslandia	2	[{"changed": {"fields": ["Visible"]}}]	12	221
1980	2025-04-07 16:20:52.503347+00	308	Open vergadering	2	[{"changed": {"fields": ["Url"]}}]	23	12
1981	2025-04-09 11:24:14.955261+00	305	Karakoe pt.2	2	[{"changed": {"fields": ["Name", "Description", "Poster"]}}]	23	221
1982	2025-04-09 11:24:33.306954+00	305	Karakoe pt.2	2	[{"changed": {"fields": ["Description"]}}]	23	221
1983	2025-04-09 16:20:57.188087+00	341	Verkiezingen	2	[{"changed": {"fields": ["Description", "Url", "Poster"]}}]	23	221
1984	2025-04-09 16:23:36.43564+00	341	Verkiezingen	2	[{"changed": {"fields": ["Description"]}}]	23	221
1985	2025-04-09 16:24:41.278649+00	341	Verkiezingen	2	[{"changed": {"fields": ["Description"]}}]	23	221
1986	2025-04-09 16:35:58.148428+00	341	Verkiezingen	2	[{"changed": {"fields": ["Description"]}}]	23	221
1987	2025-04-09 16:36:41.812314+00	341	Verkiezingen	2	[{"changed": {"fields": ["Description"]}}]	23	221
1988	2025-04-09 16:37:06.231084+00	341	Verkiezingen	2	[{"changed": {"fields": ["Description"]}}]	23	221
1989	2025-04-10 15:53:15.1281+00	148	The neverending LAN	1	[{"added": {}}]	12	221
1990	2025-04-10 15:53:23.926539+00	148	The neverending LAN 2025	2	[{"changed": {"fields": ["Name"]}}]	12	221
1991	2025-04-10 15:53:35.997692+00	148	LAN 2025 - The neverending LAN	2	[{"changed": {"fields": ["Name"]}}]	12	221
1992	2025-04-10 15:56:14.081779+00	653	LAN 2025 - The neverending LAN - LAN - sfeerbeeld1	1	[{"added": {}}]	20	221
1993	2025-04-10 15:56:18.947059+00	148	LAN 2025 - The neverending LAN	2	[{"changed": {"fields": ["Visible"]}}]	12	221
1994	2025-04-10 15:56:27.414343+00	148	LAN 2025 - The neverending LAN	2	[{"changed": {"fields": ["Visible"]}}]	12	221
1995	2025-04-10 15:56:59.006955+00	654	LAN 2025 - The neverending LAN - LAN - campfire	1	[{"added": {}}]	20	221
1996	2025-04-10 15:57:17.983394+00	655	LAN 2025 - The neverending LAN - LAN - overShoulderFlof	1	[{"added": {}}]	20	221
1997	2025-04-10 15:57:30.52368+00	656	LAN 2025 - The neverending LAN - LAN - Seppe&Marwan	1	[{"added": {}}]	20	221
1998	2025-04-10 15:57:52.119244+00	657	LAN 2025 - The neverending LAN - LAN - friendshipIsKey	1	[{"added": {}}]	20	221
1999	2025-04-10 15:58:02.516667+00	658	LAN 2025 - The neverending LAN - LAN - MK	1	[{"added": {}}]	20	221
2000	2025-04-10 15:58:14.059207+00	659	LAN 2025 - The neverending LAN - LAN - MK2	1	[{"added": {}}]	20	221
2001	2025-04-10 15:58:24.173168+00	660	LAN 2025 - The neverending LAN - LAN - eurotruck	1	[{"added": {}}]	20	221
2002	2025-04-10 16:18:52.824936+00	342	Bowling	1	[{"added": {}}]	23	221
2003	2025-04-10 16:52:25.645637+00	661	LAN 2025 - The neverending LAN - LAN - Ruben&Daan	1	[{"added": {}}]	20	221
2004	2025-04-10 16:52:40.006111+00	662	LAN 2025 - The neverending LAN - LAN - overShoulderEuroTruck	1	[{"added": {}}]	20	221
2005	2025-04-10 16:52:50.078218+00	663	LAN 2025 - The neverending LAN - LAN - MK3	1	[{"added": {}}]	20	221
2006	2025-04-10 16:53:02.172354+00	664	LAN 2025 - The neverending LAN - LAN - SachaMuismat	1	[{"added": {}}]	20	221
2007	2025-04-10 16:53:15.032774+00	665	LAN 2025 - The neverending LAN - LAN - Lucas&Sepp	1	[{"added": {}}]	20	221
2008	2025-04-10 16:53:30.610397+00	666	LAN 2025 - The neverending LAN - LAN - ThumbsUp - YoranSeppeMaxe	1	[{"added": {}}]	20	221
2009	2025-04-10 16:53:43.766018+00	667	LAN 2025 - The neverending LAN - LAN - crew	1	[{"added": {}}]	20	221
2010	2025-04-10 16:53:54.064727+00	668	LAN 2025 - The neverending LAN - LAN - sfeerbeeld2	1	[{"added": {}}]	20	221
2011	2025-04-10 16:54:03.913542+00	669	LAN 2025 - The neverending LAN - LAN - BSL	1	[{"added": {}}]	20	221
2012	2025-04-10 16:54:16.549496+00	670	LAN 2025 - The neverending LAN - LAN - ThumbsUpSeppe	1	[{"added": {}}]	20	221
2013	2025-04-10 16:54:32.273702+00	671	LAN 2025 - The neverending LAN - LAN - Alejandro&Vincent	1	[{"added": {}}]	20	221
2014	2025-04-10 16:54:42.816612+00	672	LAN 2025 - The neverending LAN - LAN - Monster	1	[{"added": {}}]	20	221
2015	2025-04-10 16:54:59.836068+00	673	LAN 2025 - The neverending LAN - LAN - MonsterAddiction	1	[{"added": {}}]	20	221
2016	2025-04-10 16:55:15.594294+00	674	LAN 2025 - The neverending LAN - LAN - Monster2	1	[{"added": {}}]	20	221
2017	2025-04-10 16:55:26.553007+00	675	LAN 2025 - The neverending LAN - LAN - eurotruck2	1	[{"added": {}}]	20	221
2018	2025-04-10 16:55:37.170418+00	676	LAN 2025 - The neverending LAN - LAN - SachaMonster	1	[{"added": {}}]	20	221
2019	2025-04-10 16:55:50.963518+00	677	LAN 2025 - The neverending LAN - LAN - trofeeFallguy	1	[{"added": {}}]	20	221
2020	2025-04-10 16:56:04.114383+00	678	LAN 2025 - The neverending LAN - LAN - TanguyHappy	1	[{"added": {}}]	20	221
2021	2025-04-10 16:56:16.549134+00	679	LAN 2025 - The neverending LAN - LAN - NyoHappy	1	[{"added": {}}]	20	221
2022	2025-04-10 16:56:37.370358+00	680	LAN 2025 - The neverending LAN - LAN - Setup	1	[{"added": {}}]	20	221
2023	2025-04-10 16:56:49.82937+00	681	LAN 2025 - The neverending LAN - LAN - Monster3	1	[{"added": {}}]	20	221
2024	2025-04-10 16:57:00.915337+00	682	LAN 2025 - The neverending LAN - LAN - sfeerbeeld3	1	[{"added": {}}]	20	221
2025	2025-04-10 16:57:30.333125+00	683	LAN 2025 - The neverending LAN - LAN - Zeaya	1	[{"added": {}}]	20	221
2026	2025-04-10 16:57:41.440998+00	684	LAN 2025 - The neverending LAN - LAN - cozyMK	1	[{"added": {}}]	20	221
2027	2025-04-10 16:58:09.056355+00	685	LAN 2025 - The neverending LAN - LAN - WinnaarsLOL	1	[{"added": {}}]	20	221
2028	2025-04-10 16:58:24.730888+00	686	LAN 2025 - The neverending LAN - LAN - WinnaarsLOL2	1	[{"added": {}}]	20	221
2029	2025-04-10 16:59:10.126042+00	687	LAN 2025 - The neverending LAN - LAN - StoerPoserendeRuben	1	[{"added": {}}]	20	221
2030	2025-04-10 16:59:19.717997+00	688	LAN 2025 - The neverending LAN - LAN - DaanFocus	1	[{"added": {}}]	20	221
2031	2025-04-10 16:59:30.967102+00	689	LAN 2025 - The neverending LAN - LAN - MilanFallguys	1	[{"added": {}}]	20	221
2032	2025-04-10 17:00:04.445303+00	690	LAN 2025 - The neverending LAN - LAN - RocketLeague1	1	[{"added": {}}]	20	221
2033	2025-04-10 17:00:17.653693+00	691	LAN 2025 - The neverending LAN - LAN - WinnaarsRocketLeague	1	[{"added": {}}]	20	221
2034	2025-04-10 17:00:35.309884+00	692	LAN 2025 - The neverending LAN - LAN - inkomEnthousiasme	1	[{"added": {}}]	20	221
2035	2025-04-10 17:00:46.564387+00	693	LAN 2025 - The neverending LAN - LAN - NickOnFloor	1	[{"added": {}}]	20	221
2036	2025-04-10 17:00:57.148724+00	694	LAN 2025 - The neverending LAN - LAN - WarreFocus	1	[{"added": {}}]	20	221
2037	2025-04-10 17:01:27.137041+00	695	LAN 2025 - The neverending LAN - LAN - LoLtrophies	1	[{"added": {}}]	20	221
2038	2025-04-10 17:01:40.231602+00	696	LAN 2025 - The neverending LAN - LAN - WinnaarsMarioKart	1	[{"added": {}}]	20	221
2039	2025-04-10 17:01:57.380931+00	697	LAN 2025 - The neverending LAN - LAN - WinnaarsMK - Milan	1	[{"added": {}}]	20	221
2040	2025-04-10 17:02:26.859829+00	698	LAN 2025 - The neverending LAN - LAN - WinnaarsMKWithBoo	1	[{"added": {}}]	20	221
2041	2025-04-10 17:02:37.523826+00	699	LAN 2025 - The neverending LAN - LAN - VRSfeer	1	[{"added": {}}]	20	221
2042	2025-04-10 17:02:53.604036+00	700	LAN 2025 - The neverending LAN - LAN - DuolingoGoals	1	[{"added": {}}]	20	221
2043	2025-04-10 17:03:03.818905+00	701	LAN 2025 - The neverending LAN - LAN - beanbags	1	[{"added": {}}]	20	221
2044	2025-04-10 17:03:22.010253+00	702	LAN 2025 - The neverending LAN - LAN - WinnaarsFG - Tanguy	1	[{"added": {}}]	20	221
2045	2025-04-10 17:03:51.716684+00	703	LAN 2025 - The neverending LAN - LAN - WinnaarsFGWithBooks	1	[{"added": {}}]	20	221
2046	2025-04-10 17:04:05.913887+00	704	LAN 2025 - The neverending LAN - LAN - WinnaarsFG	1	[{"added": {}}]	20	221
2047	2025-04-10 17:04:16.232732+00	705	LAN 2025 - The neverending LAN - LAN - eurotruck3	1	[{"added": {}}]	20	221
2048	2025-04-10 17:06:32.751125+00	706	LAN 2025 - The neverending LAN - LAN - WinnaarsFG - Arno	1	[{"added": {}}]	20	221
2049	2025-04-10 17:06:42.952066+00	707	LAN 2025 - The neverending LAN - LAN - Sacha&Bram	1	[{"added": {}}]	20	221
2050	2025-04-10 17:06:56.124992+00	708	LAN 2025 - The neverending LAN - LAN - eurotruckAndreas	1	[{"added": {}}]	20	221
2051	2025-04-10 17:07:12.302207+00	709	LAN 2025 - The neverending LAN - LAN - HeadMassageJermin	1	[{"added": {}}]	20	221
2052	2025-04-10 17:07:28.406311+00	710	LAN 2025 - The neverending LAN - LAN - MK4	1	[{"added": {}}]	20	221
2053	2025-04-10 17:07:38.500916+00	711	LAN 2025 - The neverending LAN - LAN - VRSfeer2	1	[{"added": {}}]	20	221
2054	2025-04-10 17:07:49.934786+00	712	LAN 2025 - The neverending LAN - LAN - sfeerbeeld4	1	[{"added": {}}]	20	221
2055	2025-04-10 17:08:13.785889+00	148	LAN 2025 - The neverending LAN	2	[{"changed": {"fields": ["Visible"]}}]	12	221
2056	2025-04-10 17:08:57.764764+00	148	LAN 2025 - The neverending LAN	2	[{"changed": {"fields": ["Visible"]}}]	12	221
2057	2025-04-10 17:10:14.601515+00	713	LAN 2025 - The neverending LAN - LAN - MK5	1	[{"added": {}}]	20	221
2058	2025-04-10 17:10:26.989517+00	714	LAN 2025 - The neverending LAN - LAN - sfeerbeeld5	1	[{"added": {}}]	20	221
2059	2025-04-10 17:10:37.877444+00	715	LAN 2025 - The neverending LAN - LAN - sfeerbeeld6	1	[{"added": {}}]	20	221
2060	2025-04-10 17:10:47.501251+00	716	LAN 2025 - The neverending LAN - LAN - sfeerbeeld7	1	[{"added": {}}]	20	221
2061	2025-04-10 17:10:58.905495+00	717	LAN 2025 - The neverending LAN - LAN - sfeerbeeld7	1	[{"added": {}}]	20	221
2062	2025-04-10 17:11:21.908004+00	718	LAN 2025 - The neverending LAN - LAN - WinnaarsMKWithBullet	1	[{"added": {}}]	20	221
2064	2025-04-10 17:11:55.64009+00	720	LAN 2025 - The neverending LAN - LAN - TanguySatisfied	1	[{"added": {}}]	20	221
2063	2025-04-10 17:11:38.943897+00	719	LAN 2025 - The neverending LAN - LAN - BSL2	1	[{"added": {}}]	20	221
2065	2025-04-10 17:12:13.149266+00	721	LAN 2025 - The neverending LAN - LAN - DaanShowingSetup	1	[{"added": {}}]	20	221
2066	2025-04-10 17:12:44.851303+00	722	LAN 2025 - The neverending LAN - LAN - TanguyInnerPiranhaPlant	1	[{"added": {}}]	20	221
2067	2025-04-10 17:13:00.271076+00	723	LAN 2025 - The neverending LAN - LAN - WinnaarsMKWithBoo2	1	[{"added": {}}]	20	221
2068	2025-04-10 17:13:13.896755+00	724	LAN 2025 - The neverending LAN - LAN - WinnaarsMK - Nathan	1	[{"added": {}}]	20	221
2069	2025-04-11 10:06:03.417054+00	148	LAN 2025 - The neverending LAN	2	[{"changed": {"fields": ["Visible"]}}]	12	221
2070	2025-04-14 21:19:48.202109+00	302	Super Smash Bros Ultimate Toernooi	2	[{"changed": {"fields": ["Description", "Poster"]}}]	23	7
2071	2025-04-15 17:19:50.031826+00	302	Super Smash Bros Ultimate Toernooi	2	[{"changed": {"fields": ["Description", "Url"]}}]	23	221
2104	2025-04-19 20:41:32.36742+00	306	Ontgroening: Vecna's Curse	2	[{"changed": {"fields": ["Name", "Description", "Url", "Poster"]}}]	23	221
2105	2025-04-19 20:41:57.538063+00	306	Ontgroening: Vecna's Curse	2	[{"changed": {"fields": ["Description"]}}]	23	221
2106	2025-04-27 12:25:48.787593+00	181	Karakoe pt.2 2024	1	[{"added": {}}]	12	221
2107	2025-04-27 12:26:08.914557+00	181	Karakoe pt.2 2025	2	[{"changed": {"fields": ["Name"]}}]	12	221
2108	2025-04-27 12:26:46.416963+00	751	Karakoe pt.2 2025 - SingingForLife	1	[{"added": {}}]	20	221
2109	2025-04-27 12:27:23.983625+00	752	Karakoe pt.2 2025 - Sfeerbeeld_KarakoePt2	1	[{"added": {}}]	20	221
2110	2025-04-27 12:27:45.317881+00	753	Karakoe pt.2 2025 - SingingForLife_2	1	[{"added": {}}]	20	221
2111	2025-04-27 12:28:08.745189+00	754	Karakoe pt.2 2025 - Tyra_EnjoyingKarakoe	1	[{"added": {}}]	20	221
2112	2025-04-27 12:28:21.986713+00	755	Karakoe pt.2 2025 - Rein_IdkWat	1	[{"added": {}}]	20	221
2113	2025-04-27 12:28:39.678985+00	756	Karakoe pt.2 2025 - Tyra_Zingt_Silhouette	1	[{"added": {}}]	20	221
2114	2025-04-27 12:28:51.248463+00	757	Karakoe pt.2 2025 - ReinEnBennyLove	1	[{"added": {}}]	20	221
2115	2025-04-27 12:29:18.829467+00	758	Karakoe pt.2 2025 - Sfeerbeeld_KarakoePt2_YayZingen	1	[{"added": {}}]	20	221
2116	2025-04-27 12:29:31.847118+00	759	Karakoe pt.2 2025 - Vincent_Zingend	1	[{"added": {}}]	20	221
2117	2025-04-27 12:29:48.280935+00	760	Karakoe pt.2 2025 - Vincent_Zingend2	1	[{"added": {}}]	20	221
2118	2025-04-27 12:30:05.183559+00	761	Karakoe pt.2 2025 - Nikki&Marwan_Karakoe	1	[{"added": {}}]	20	221
2119	2025-04-27 12:30:24.966367+00	762	Karakoe pt.2 2025 - Maxe&Milan_Karakoe	1	[{"added": {}}]	20	221
2120	2025-04-27 12:30:39.467796+00	763	Karakoe pt.2 2025 - Silke_GivingItAll	1	[{"added": {}}]	20	221
2121	2025-04-27 12:30:57.205391+00	764	Karakoe pt.2 2025 - RubenStrikingAPose	1	[{"added": {}}]	20	221
2122	2025-04-27 12:31:42.037286+00	765	Karakoe pt.2 2025 - Maxe&Marwan_Karakoe	1	[{"added": {}}]	20	221
2123	2025-04-27 12:31:56.638424+00	766	Karakoe pt.2 2025 - NemesisVriendjes_Zingen	1	[{"added": {}}]	20	221
2124	2025-04-27 12:32:16.425554+00	767	Karakoe pt.2 2025 - Sfeerbeeld_KarakoePt2_2	1	[{"added": {}}]	20	221
2125	2025-04-27 12:32:39.569271+00	768	Karakoe pt.2 2025 - Tyra_Zingt_NogEens_NogEens	1	[{"added": {}}]	20	221
2126	2025-04-27 12:32:57.104886+00	769	Karakoe pt.2 2025 - Sfeerbeeld_KarakoePt2_3	1	[{"added": {}}]	20	221
2127	2025-04-27 12:33:14.143378+00	770	Karakoe pt.2 2025 - Schachtenopdrachtje_Tape	1	[{"added": {}}]	20	221
2128	2025-04-27 12:33:28.339372+00	771	Karakoe pt.2 2025 - Sfeerbeeld_KarakoePt2_4	1	[{"added": {}}]	20	221
2129	2025-04-27 12:33:43.279947+00	772	Karakoe pt.2 2025 - Karakoe_Banner_Screen	1	[{"added": {}}]	20	221
2130	2025-04-27 12:34:02.84716+00	773	Karakoe pt.2 2025 - Sfeerbeeld_KarakoePt2_5	1	[{"added": {}}]	20	221
2131	2025-04-27 12:35:07.946867+00	774	Karakoe pt.2 2025 - Arno&Lisa&Rien_Zingen	1	[{"added": {}}]	20	221
2132	2025-04-27 12:35:19.546577+00	775	Karakoe pt.2 2025 - Arno&Lisa&Rien_Zingen_2	1	[{"added": {}}]	20	221
2133	2025-04-27 12:35:33.271697+00	776	Karakoe pt.2 2025 - Nikki_Schachtenopdrachtje_Tape	1	[{"added": {}}]	20	221
2134	2025-04-27 12:35:45.204508+00	777	Karakoe pt.2 2025 - Bram_Rocking	1	[{"added": {}}]	20	221
2135	2025-04-27 12:38:38.346923+00	778	Karakoe pt.2 2025 - Olivier_Zingt_2	1	[{"added": {}}]	20	221
2136	2025-04-27 12:38:52.952522+00	779	Karakoe pt.2 2025 - Sfeerbeeld_KarakoePt2_6	1	[{"added": {}}]	20	221
2137	2025-04-27 12:39:46.698695+00	780	Karakoe pt.2 2025 - Jermin&Yoran&Marwan&Nikki_Zingen	1	[{"added": {}}]	20	221
2138	2025-04-27 12:40:04.953067+00	781	Karakoe pt.2 2025 - Aaron&Rein_Zingen	1	[{"added": {}}]	20	221
2139	2025-04-27 12:40:23.458521+00	782	Karakoe pt.2 2025 - Sfeerbeeld_KarakoePt2_7	1	[{"added": {}}]	20	221
2140	2025-04-27 12:40:49.374409+00	783	Karakoe pt.2 2025 - Lucas&Lisa&Nyo	1	[{"added": {}}]	20	221
2141	2025-04-27 12:41:00.057008+00	784	Karakoe pt.2 2025 - Bram_Rocking2	1	[{"added": {}}]	20	221
2142	2025-04-27 12:41:35.786258+00	785	Karakoe pt.2 2025 - Milan&Richy	1	[{"added": {}}]	20	221
2143	2025-04-27 12:41:46.708055+00	786	Karakoe pt.2 2025 - Nyo&Silke	1	[{"added": {}}]	20	221
2144	2025-04-27 12:42:02.789716+00	787	Karakoe pt.2 2025 - Nikki&Jermin&Rien_Zingen	1	[{"added": {}}]	20	221
2145	2025-04-27 12:42:20.349813+00	788	Karakoe pt.2 2025 - Schachtenopdrachtje_TapeBonding	1	[{"added": {}}]	20	221
2146	2025-04-27 12:42:36.98986+00	789	Karakoe pt.2 2025 - Sfeerbeeld_KarakoePt2_7	1	[{"added": {}}]	20	221
2147	2025-04-27 12:42:53.954205+00	790	Karakoe pt.2 2025 - Schachtjes_Zwart&WitGekleed	1	[{"added": {}}]	20	221
2148	2025-04-27 12:43:08.820589+00	791	Karakoe pt.2 2025 - Schachtenopdrachtje_Tape_Alejandro	1	[{"added": {}}]	20	221
2149	2025-04-27 12:43:32.9208+00	792	Karakoe pt.2 2025 - Schachtjes_Zwart&WitGekleed2	1	[{"added": {}}]	20	221
2150	2025-04-27 12:43:50.371923+00	793	Karakoe pt.2 2025 - Benny&Nyo_ThumbsUp	1	[{"added": {}}]	20	221
2151	2025-04-27 12:44:05.380902+00	794	Karakoe pt.2 2025 - BohemianRhapsodyCrew_Pt2	1	[{"added": {}}]	20	221
2152	2025-04-27 12:44:16.635617+00	795	Karakoe pt.2 2025 - Silke&Nyo	1	[{"added": {}}]	20	221
2153	2025-04-27 12:44:36.565018+00	796	Karakoe pt.2 2025 - Sfeerbeeld_KarakoePt2_8	1	[{"added": {}}]	20	221
2154	2025-04-27 13:25:23.312614+00	206	2024 - 2025 Praeses	2	[{"changed": {"fields": ["Photo"]}}]	19	221
2155	2025-04-27 13:31:37.015981+00	206	2024 - 2025 Praeses	2	[{"changed": {"fields": ["Photo"]}}]	19	221
2156	2025-04-27 13:34:25.162729+00	206	2024 - 2025 Praeses	2	[{"changed": {"fields": ["Photo"]}}]	19	221
2157	2025-04-27 13:49:55.685193+00	172	2024 - 2025 Secretaris	2	[{"changed": {"fields": ["Photo"]}}]	19	221
2158	2025-04-27 13:52:11.80503+00	172	2024 - 2025 Secretaris	2	[{"changed": {"fields": ["Photo"]}}]	19	221
2159	2025-04-27 14:01:36.845298+00	239	2024 - 2025 Keizer Feest & LAN	2	[{"changed": {"fields": ["Photo"]}}]	19	221
2160	2025-04-27 21:30:53.806805+00	138	Britt: Emanuel	2	[{"changed": {"fields": ["Facebook link", "Linkedin link", "Instagram link"]}}]	14	2
2161	2025-04-27 21:38:34.096849+00	141	Aaron: Vandeweghe	2	[{"changed": {"fields": ["Linkedin link", "Twitter link"]}}]	14	2
2162	2025-04-28 13:34:24.514216+00	6	overons	2	[{"changed": {"fields": ["Description"]}}]	7	2
2163	2025-04-30 10:07:17.769357+00	342	Bowling	2	[{"changed": {"fields": ["Description", "Start", "End"]}}]	23	7
2164	2025-04-30 14:16:22.6178+00	342	Bowling	2	[{"changed": {"fields": ["Description", "Poster"]}}]	23	221
2165	2025-04-30 14:16:49.040755+00	342	Bowling	2	[{"changed": {"fields": ["Poster"]}}]	23	221
2166	2025-04-30 14:17:08.481913+00	342	Bowling	2	[{"changed": {"fields": ["Poster"]}}]	23	221
2167	2025-04-30 14:17:29.32995+00	342	Bowling	2	[{"changed": {"fields": ["Poster"]}}]	23	221
2168	2025-04-30 15:57:22.110537+00	375	Picknick	1	[{"added": {}}]	23	221
2169	2025-05-01 17:39:49.500007+00	145	Seppe: Landtsheer	2	[{"changed": {"fields": ["Linkedin link", "Twitter link"]}}]	14	2
2170	2025-05-02 20:49:35.07931+00	182	Ontgroening 2025	1	[{"added": {}}]	12	221
2171	2025-05-02 20:50:30.521233+00	797	Ontgroening 2025 - Ontgroening_Groep24-25	1	[{"added": {}}]	20	221
2172	2025-05-02 20:50:54.895023+00	798	Ontgroening 2025 - Ontgroening_Sfeerbeeld1	1	[{"added": {}}]	20	221
2173	2025-05-02 20:51:07.780668+00	799	Ontgroening 2025 - SachaHoldingBram	1	[{"added": {}}]	20	221
2174	2025-05-02 20:51:20.600212+00	800	Ontgroening 2025 - Ontgroening_Sfeerbeeld2	1	[{"added": {}}]	20	221
2175	2025-05-02 20:51:33.915194+00	801	Ontgroening 2025 - Ontgroening_Sfeerbeeld3	1	[{"added": {}}]	20	221
2176	2025-05-02 20:51:58.13373+00	802	Ontgroening 2025 - Ontgroening_Karsten_Superschacht25	1	[{"added": {}}]	20	221
2177	2025-05-02 20:52:14.495202+00	803	Ontgroening 2025 - Simon_DoopDejavu	1	[{"added": {}}]	20	221
2178	2025-05-02 20:52:33.287136+00	804	Ontgroening 2025 - Ontgroening_Groep24-25_Everyone_Funny	1	[{"added": {}}]	20	221
2179	2025-05-02 20:52:44.813067+00	805	Ontgroening 2025 - Ontgroening_Sfeerbeeld3	1	[{"added": {}}]	20	221
2180	2025-05-02 20:52:57.456696+00	806	Ontgroening 2025 - Ontgroening_Sfeerbeeld4	1	[{"added": {}}]	20	221
2181	2025-05-02 20:53:32.391581+00	807	Ontgroening 2025 - SchachtjesHug	1	[{"added": {}}]	20	221
2182	2025-05-02 20:53:43.657099+00	808	Ontgroening 2025 - Ontgroening_Sfeerbeeld5	1	[{"added": {}}]	20	221
2183	2025-05-02 20:53:56.664725+00	809	Ontgroening 2025 - DiedeExplaining_Ontgroening	1	[{"added": {}}]	20	221
2184	2025-05-02 20:54:20.460676+00	810	Ontgroening 2025 - RicardoSeppe&Amber	1	[{"added": {}}]	20	221
2185	2025-05-02 20:54:38.917766+00	811	Ontgroening 2025 - Milan_Peeking_Schild	1	[{"added": {}}]	20	221
2186	2025-05-02 20:54:58.515406+00	812	Ontgroening 2025 - Ontgroening_Groep24-25_Everyone	1	[{"added": {}}]	20	221
2187	2025-05-02 20:55:09.431313+00	813	Ontgroening 2025 - Schild&MiniSchild	1	[{"added": {}}]	20	221
2188	2025-05-02 20:55:23.86345+00	814	Ontgroening 2025 - Groepsfoto_BeginOntgroening	1	[{"added": {}}]	20	221
2189	2025-05-02 20:55:41.118652+00	815	Ontgroening 2025 - Ontgroening_Sfeerbeeld6	1	[{"added": {}}]	20	221
2190	2025-05-02 20:56:02.190993+00	182	Ontgroening 2025	2	[{"changed": {"fields": ["Visible"]}}]	12	221
2191	2025-05-02 21:08:11.007745+00	183	Smash BrosToernooi	1	[{"added": {}}]	12	221
2192	2025-05-02 21:09:45.329294+00	816	Smash BrosToernooi - SmashBrosScreen	1	[{"added": {}}]	20	221
2193	2025-05-02 21:13:19.21079+00	817	Smash BrosToernooi - CoolsteSportHappy	1	[{"added": {}}]	20	221
2194	2025-05-02 21:13:31.036727+00	818	Smash BrosToernooi - SmashBrosScreen2	1	[{"added": {}}]	20	221
2195	2025-05-02 21:13:48.436604+00	819	Smash BrosToernooi - SmashTijlAgony	1	[{"added": {}}]	20	221
2196	2025-05-02 21:13:59.637836+00	820	Smash BrosToernooi - Rien&TijlSmashing	1	[{"added": {}}]	20	221
2197	2025-05-02 21:14:20.152524+00	821	Smash BrosToernooi - Maxe_Arno_Lucas_Smashing	1	[{"added": {}}]	20	221
2198	2025-05-02 21:14:36.158094+00	822	Smash BrosToernooi - Smash_2nd_Toon	1	[{"added": {}}]	20	221
2199	2025-05-02 21:14:50.732471+00	823	Smash BrosToernooi - Smash_1st_Milan	1	[{"added": {}}]	20	221
2200	2025-05-02 21:15:15.11677+00	824	Smash BrosToernooi - Aaron_Tijl_Smashing	1	[{"added": {}}]	20	221
2201	2025-05-02 21:15:28.444652+00	825	Smash BrosToernooi - Seppe&Alejandro_ThumbsUp	1	[{"added": {}}]	20	221
2202	2025-05-02 21:15:41.684129+00	826	Smash BrosToernooi - Smash_3rd_Tijl	1	[{"added": {}}]	20	221
2203	2025-05-02 21:15:58.329307+00	827	Smash BrosToernooi - Smash_SetUp_Milan	1	[{"added": {}}]	20	221
2204	2025-05-02 21:16:20.716637+00	828	Smash BrosToernooi - Chiara_Toon_Ricardo_Yoran_Smashing	1	[{"added": {}}]	20	221
2205	2025-05-02 21:16:41.288496+00	829	Smash BrosToernooi - Brecht_Ruben_Milan_Smashing	1	[{"added": {}}]	20	221
2206	2025-05-02 21:16:56.801815+00	830	Smash BrosToernooi - Maxe_Milan_Yoran_Smashing	1	[{"added": {}}]	20	221
2207	2025-05-02 21:17:09.960771+00	831	Smash BrosToernooi - SmashBrosScreen3	1	[{"added": {}}]	20	221
2208	2025-05-02 21:17:21.590528+00	832	Smash BrosToernooi - Tanguy_ThumbsUp	1	[{"added": {}}]	20	221
2209	2025-05-02 21:17:39.627582+00	833	Smash BrosToernooi - Toon_Milan_Smashing_MaxeBored	1	[{"added": {}}]	20	221
2210	2025-05-02 21:17:55.707677+00	834	Smash BrosToernooi - SmashBrosScreen3	1	[{"added": {}}]	20	221
2211	2025-05-02 21:18:10.311066+00	835	Smash BrosToernooi - CommisWaitingOutside	1	[{"added": {}}]	20	221
2212	2025-05-02 21:18:24.174551+00	836	Smash BrosToernooi - Ruben_Posing_badass	1	[{"added": {}}]	20	221
2213	2025-05-02 21:18:43.269554+00	837	Smash BrosToernooi - SmashBrosScreen4	1	[{"added": {}}]	20	221
2214	2025-05-02 21:18:56.28455+00	838	Smash BrosToernooi - Finale_Toon&Milan	1	[{"added": {}}]	20	221
2215	2025-05-02 21:19:09.464288+00	839	Smash BrosToernooi - SmashBrosScreen4	1	[{"added": {}}]	20	221
2216	2025-05-02 21:19:21.318251+00	840	Smash BrosToernooi - Smash_Sfeerbeeld1	1	[{"added": {}}]	20	221
2217	2025-05-02 21:19:37.953324+00	841	Smash BrosToernooi - Smash_Sfeerbeeld2	1	[{"added": {}}]	20	221
2218	2025-05-02 21:20:57.0589+00	842	Smash BrosToernooi - Ruben&Seppe_Laptop	1	[{"added": {}}]	20	221
2219	2025-05-02 21:21:27.162704+00	843	Smash BrosToernooi - Seppe_Explaining_Smash	1	[{"added": {}}]	20	221
2220	2025-05-02 21:21:37.115214+00	844	Smash BrosToernooi - SmashBrosScreen5	1	[{"added": {}}]	20	221
2221	2025-05-02 21:21:51.931162+00	845	Smash BrosToernooi - Brecht_Maxe_Lisa_Smashing	1	[{"added": {}}]	20	221
2222	2025-05-02 21:22:05.476579+00	846	Smash BrosToernooi - Ricardo&Milan_ThumbsUp	1	[{"added": {}}]	20	221
2223	2025-05-02 21:22:23.182611+00	847	Smash BrosToernooi - SmashBrosScreen5	1	[{"added": {}}]	20	221
2224	2025-05-02 21:22:33.398328+00	848	Smash BrosToernooi - ReadyToFight	1	[{"added": {}}]	20	221
2225	2025-05-02 21:22:48.2661+00	849	Smash BrosToernooi - Axelle_Photographer	1	[{"added": {}}]	20	221
2226	2025-05-02 21:23:04.001881+00	850	Smash BrosToernooi - Smash_Sfeerbeeld3	1	[{"added": {}}]	20	221
2227	2025-05-02 21:23:16.475378+00	851	Smash BrosToernooi - SmashBrosScreen6	1	[{"added": {}}]	20	221
2228	2025-05-02 21:23:34.240784+00	852	Smash BrosToernooi - Ruben_Yoran_Aaron_Chiara_Smashing	1	[{"added": {}}]	20	221
2229	2025-05-02 21:23:46.304979+00	853	Smash BrosToernooi - BramLurking_Smash	1	[{"added": {}}]	20	221
2230	2025-05-02 21:24:00.306862+00	854	Smash BrosToernooi - Smash_Sfeerbeeld4	1	[{"added": {}}]	20	221
2231	2025-05-02 21:24:16.031977+00	855	Smash BrosToernooi - SmashBrosScreen6	1	[{"added": {}}]	20	221
2233	2025-05-02 21:24:45.51196+00	857	Smash BrosToernooi - Aaron_Brecht_Arno_Rien_Smashing	1	[{"added": {}}]	20	221
2236	2025-05-02 21:25:31.441254+00	860	Smash BrosToernooi - Lucas_Ricardo_Ruben_Lisa_Smashing_2	1	[{"added": {}}]	20	221
2238	2025-05-02 21:25:57.101643+00	862	Smash BrosToernooi - Lucas_Ricardo_Focus	1	[{"added": {}}]	20	221
2239	2025-05-02 21:26:11.229256+00	863	Smash BrosToernooi - Maxe_Milan_Amazed	1	[{"added": {}}]	20	221
2240	2025-05-02 21:26:23.171051+00	864	Smash BrosToernooi - Brecht_Toon_Smashing	1	[{"added": {}}]	20	221
2241	2025-05-02 21:26:37.836185+00	865	Smash BrosToernooi - Seppe_Explaining_Smash2	1	[{"added": {}}]	20	221
2242	2025-05-02 21:26:49.073838+00	866	Smash BrosToernooi - Spectators_Focus	1	[{"added": {}}]	20	221
2232	2025-05-02 21:24:25.55755+00	856	Smash BrosToernooi - SmashBrosScreen7	1	[{"added": {}}]	20	221
2234	2025-05-02 21:24:59.685525+00	858	Smash BrosToernooi - Lucas_Ricardo_Ruben_Lisa_Smashing	1	[{"added": {}}]	20	221
2235	2025-05-02 21:25:16.419415+00	859	Smash BrosToernooi - Maxe_BeingChallenged	1	[{"added": {}}]	20	221
2237	2025-05-02 21:25:45.620609+00	861	Smash BrosToernooi - Axelle_Photographer_Terminator	1	[{"added": {}}]	20	221
2243	2025-05-02 21:27:01.852424+00	867	Smash BrosToernooi - Chiara_Toon_Ricardo_Yoran_Happy	1	[{"added": {}}]	20	221
2244	2025-05-02 21:27:10.589261+00	868	Smash BrosToernooi - MilanMisery	1	[{"added": {}}]	20	221
2245	2025-05-02 21:27:33.053121+00	869	Smash BrosToernooi - Tijl_Arno_Smashing	1	[{"added": {}}]	20	221
2246	2025-05-02 21:27:44.36365+00	870	Smash BrosToernooi - Chiara_Rien_Smashing	1	[{"added": {}}]	20	221
2247	2025-05-02 21:28:00.573774+00	871	Smash BrosToernooi - Rien_Toon_Smashing_SurprisedSpectator	1	[{"added": {}}]	20	221
2248	2025-05-02 21:28:12.429081+00	872	Smash BrosToernooi - Smash_ThumbsUp	1	[{"added": {}}]	20	221
2249	2025-05-02 21:28:21.590158+00	873	Smash BrosToernooi - SmashBrosScreen7	1	[{"added": {}}]	20	221
2250	2025-05-02 21:28:31.492466+00	874	Smash BrosToernooi - SmashBrosScreen8	1	[{"added": {}}]	20	221
2251	2025-05-02 21:28:43.020892+00	875	Smash BrosToernooi - Chiara_Rien_Smashing2	1	[{"added": {}}]	20	221
2252	2025-05-02 21:29:09.77107+00	183	Smash Bros Toernooi	2	[{"changed": {"fields": ["Name"]}}]	12	221
2253	2025-05-02 21:29:18.877678+00	183	Smash Bros Toernooi 2025	2	[{"changed": {"fields": ["Name", "Visible"]}}]	12	221
2254	2025-05-03 09:51:49.572544+00	183	Smash Bros Toernooi 2025	2	[{"changed": {"fields": ["Visible"]}}]	12	221
2255	2025-05-03 09:51:52.489157+00	182	Ontgroening 2025	2	[{"changed": {"fields": ["Visible"]}}]	12	221
2256	2025-05-05 08:09:22.151816+00	182	Ontgroening 2025	2	[{"changed": {"fields": ["Created at"]}}]	12	221
2257	2025-05-05 08:09:31.000755+00	183	Smash Bros Toernooi 2025	2	[{"changed": {"fields": ["Created at"]}}]	12	221
2258	2025-05-06 12:29:36.329328+00	292	Karakoe 2024 - Annelies&Maxe_Zingen	3		20	221
2259	2025-05-06 12:30:25.608746+00	315	Karakoe 2024 - Maxe&Amber&Annelies_Zingen	3		20	221
2260	2025-05-06 12:30:25.610858+00	309	Karakoe 2024 - Annelies&Maxe_Zingen_NogEens	3		20	221
2261	2025-05-08 15:14:25.212727+00	133	Superschachten Superschacht	2	[{"changed": {"fields": ["Photo"]}}]	19	221
2262	2025-05-08 15:14:45.904678+00	133	Superschachten Superschacht	2	[{"changed": {"fields": ["Photo"]}}]	19	221
2263	2025-05-08 15:15:14.860073+00	133	Superschachten Superschacht	2	[{"changed": {"fields": ["Photo"]}}]	19	221
2264	2025-05-08 15:37:40.601922+00	133	Superschachten Superschacht	2	[{"changed": {"fields": ["Praesidium member", "Photo"]}}]	19	221
2265	2025-05-08 15:38:11.192306+00	133	Superschachten Superschacht	2	[{"changed": {"fields": ["Praesidium member"]}}]	19	221
2266	2025-05-08 15:38:30.709227+00	133	Superschachten Superschacht	2	[{"changed": {"fields": ["Photo"]}}]	19	221
2267	2025-05-08 15:38:44.617134+00	133	Superschachten Superschacht	2	[{"changed": {"fields": ["Photo"]}}]	19	221
2268	2025-05-11 09:53:36.858348+00	184	Bowling 2025	1	[{"added": {}}]	12	221
2269	2025-05-11 09:54:07.155112+00	876	Bowling 2025 - Diede&Nikki_Bowling	1	[{"added": {}}]	20	221
2270	2025-05-11 09:54:27.31368+00	876	Bowling 2025 - Wout&Maxe_Bowling	2	[{"changed": {"fields": ["Name", "Description"]}}]	20	221
2271	2025-05-11 09:54:45.326709+00	877	Bowling 2025 - Diede&Nikki_Bowling	1	[{"added": {}}]	20	221
2272	2025-05-11 09:54:54.846123+00	878	Bowling 2025 - Diede&Nikki_Bowling2	1	[{"added": {}}]	20	221
2273	2025-05-11 09:55:03.804988+00	879	Bowling 2025 - Diede&Nikki_Bowling3	1	[{"added": {}}]	20	221
2274	2025-05-11 09:55:13.148576+00	880	Bowling 2025 - Diede&Nikki_Bowling4	1	[{"added": {}}]	20	221
2275	2025-05-11 09:55:30.46251+00	881	Bowling 2025 - Bram_ThinkingHeIsCool	1	[{"added": {}}]	20	221
2276	2025-05-11 09:55:39.887274+00	882	Bowling 2025 - Diede&Nikki_Bowling5	1	[{"added": {}}]	20	221
2277	2025-05-11 09:55:50.576156+00	883	Bowling 2025 - Seppe_NailedIt	1	[{"added": {}}]	20	221
2278	2025-05-11 09:56:03.225363+00	884	Bowling 2025 - MaxeWaitingForImpact	1	[{"added": {}}]	20	221
2279	2025-05-11 09:56:17.518025+00	885	Bowling 2025 - RicardoPrecisionThrow	1	[{"added": {}}]	20	221
2280	2025-05-11 09:56:32.01393+00	886	Bowling 2025 - Axelle&Lucas_Bowling	1	[{"added": {}}]	20	221
2281	2025-05-11 09:56:43.415762+00	887	Bowling 2025 - Daan_Satisfied	1	[{"added": {}}]	20	221
2282	2025-05-11 09:56:55.690462+00	888	Bowling 2025 - Daan_Finger	1	[{"added": {}}]	20	221
2283	2025-05-11 09:57:05.124732+00	889	Bowling 2025 - Seppe_NailedIt2	1	[{"added": {}}]	20	221
2284	2025-05-11 09:57:28.766729+00	890	Bowling 2025 - Richie&Thomas&Zeaya_Bowling	1	[{"added": {}}]	20	221
2285	2025-05-11 09:57:43.493342+00	891	Bowling 2025 - BramPicture	1	[{"added": {}}]	20	221
2286	2025-05-11 09:58:03.503486+00	892	Bowling 2025 - Zeaya&Seppe&Thomas_WithCreepyBram	1	[{"added": {}}]	20	221
2287	2025-05-11 09:58:22.178864+00	893	Bowling 2025 - Axelle&Lucas_Bowling2	1	[{"added": {}}]	20	221
2288	2025-05-11 09:58:39.136443+00	894	Bowling 2025 - Jonah&Zeaya_Bowling	1	[{"added": {}}]	20	221
2289	2025-05-11 09:58:49.94971+00	895	Bowling 2025 - BowlingSfeerbeeld	1	[{"added": {}}]	20	221
2290	2025-05-11 09:59:04.148866+00	896	Bowling 2025 - Nikki_BowlingPose	1	[{"added": {}}]	20	221
2291	2025-05-11 09:59:15.124538+00	897	Bowling 2025 - BowlingSfeerbeeld2	1	[{"added": {}}]	20	221
2292	2025-05-11 09:59:25.183684+00	898	Bowling 2025 - Richie_Bowling	1	[{"added": {}}]	20	221
2293	2025-05-11 09:59:35.237428+00	899	Bowling 2025 - Richie&Kobe_Bowling	1	[{"added": {}}]	20	221
2294	2025-05-11 09:59:45.089623+00	900	Bowling 2025 - Richie&Kobe_Bowling2	1	[{"added": {}}]	20	221
2295	2025-05-11 09:59:55.702345+00	901	Bowling 2025 - BowlingSfeerbeeld3	1	[{"added": {}}]	20	221
2296	2025-05-11 10:00:08.082206+00	902	Bowling 2025 - Milan_Dino_Bowling	1	[{"added": {}}]	20	221
2297	2025-05-11 10:00:19.690331+00	903	Bowling 2025 - BowlingSfeerbeeld4	1	[{"added": {}}]	20	221
2298	2025-05-11 10:00:31.671231+00	904	Bowling 2025 - BowlingSfeerbeeld5	1	[{"added": {}}]	20	221
2299	2025-05-11 10:00:45.821191+00	905	Bowling 2025 - Richie&Zeaya_Bowling	1	[{"added": {}}]	20	221
2300	2025-05-11 10:00:55.35299+00	906	Bowling 2025 - Milan_Dino_Bowling2	1	[{"added": {}}]	20	221
2301	2025-05-11 10:01:07.774019+00	907	Bowling 2025 - BowlingSfeerbeeld6	1	[{"added": {}}]	20	221
2302	2025-05-11 10:03:45.523104+00	908	Bowling 2025 - Nick&Nikki_Bowling	1	[{"added": {}}]	20	221
2303	2025-05-11 10:03:57.974168+00	909	Bowling 2025 - YoranHappyDancing_Bowling	1	[{"added": {}}]	20	221
2304	2025-05-11 10:04:17.015283+00	910	Bowling 2025 - Bram&Maxe&Milan_HappyBowling	1	[{"added": {}}]	20	221
2305	2025-05-11 10:04:26.734322+00	911	Bowling 2025 - Bram&Maxe&Milan_HappyBowling2	1	[{"added": {}}]	20	221
2306	2025-05-11 10:04:41.709115+00	912	Bowling 2025 - Amber&Wout&Arno_HappyBowling	1	[{"added": {}}]	20	221
2307	2025-05-11 10:05:12.805162+00	913	Bowling 2025 - Briek&Jens_Bowling	1	[{"added": {}}]	20	221
2308	2025-05-11 10:05:29.419206+00	914	Bowling 2025 - Daan_Bowling	1	[{"added": {}}]	20	221
2309	2025-05-11 10:05:40.811651+00	915	Bowling 2025 - Ricardo&Axelle_Selfie	1	[{"added": {}}]	20	221
2315	2025-05-11 10:06:57.900586+00	921	Bowling 2025 - Simon_ProBowling	1	[{"added": {}}]	20	221
2316	2025-05-11 10:07:07.010126+00	922	Bowling 2025 - Benny_Bowling2	1	[{"added": {}}]	20	221
2317	2025-05-11 10:07:19.833121+00	923	Bowling 2025 - BowlingSfeerbeeld7	1	[{"added": {}}]	20	221
2318	2025-05-11 10:07:30.668723+00	924	Bowling 2025 - BowlingSfeerbeeld8	1	[{"added": {}}]	20	221
2324	2025-05-11 10:08:41.95292+00	930	Bowling 2025 - BowlingSfeerbeeld9	1	[{"added": {}}]	20	221
2325	2025-05-11 10:08:53.977897+00	931	Bowling 2025 - WiiBowling	1	[{"added": {}}]	20	221
2326	2025-05-11 10:09:14.47051+00	185	Ontgroening pt.2 2025	1	[{"added": {}}]	12	221
2328	2025-05-11 10:09:52.255471+00	933	Ontgroening pt.2 2025 - Ontgroening_pt2_OfficieelGedeelte	1	[{"added": {}}]	20	221
2329	2025-05-11 10:10:05.501216+00	934	Ontgroening pt.2 2025 - Ontgroening_pt2_OfficieelGedeelte2	1	[{"added": {}}]	20	221
2330	2025-05-11 10:10:16.641124+00	935	Ontgroening pt.2 2025 - Ontgroening_pt2_OfficieelGedeelte3	1	[{"added": {}}]	20	221
2310	2025-05-11 10:05:59.70482+00	916	Bowling 2025 - Ruben_Bowling	1	[{"added": {}}]	20	221
2311	2025-05-11 10:06:10.171213+00	917	Bowling 2025 - BowlingSfeerbeeld6	1	[{"added": {}}]	20	221
2312	2025-05-11 10:06:22.779322+00	918	Bowling 2025 - Diede&Seppe_BowlingHype	1	[{"added": {}}]	20	221
2313	2025-05-11 10:06:35.171839+00	919	Bowling 2025 - BowlingActieShot	1	[{"added": {}}]	20	221
2314	2025-05-11 10:06:45.777637+00	920	Bowling 2025 - Benny_Bowling	1	[{"added": {}}]	20	221
2319	2025-05-11 10:07:42.626651+00	925	Bowling 2025 - TanguyNailedBowling	1	[{"added": {}}]	20	221
2320	2025-05-11 10:07:52.960545+00	926	Bowling 2025 - Milan_Bowling	1	[{"added": {}}]	20	221
2321	2025-05-11 10:08:03.040838+00	927	Bowling 2025 - Ruben_Bowling2	1	[{"added": {}}]	20	221
2322	2025-05-11 10:08:13.345001+00	928	Bowling 2025 - Ruben_Bowling3	1	[{"added": {}}]	20	221
2323	2025-05-11 10:08:26.112331+00	929	Bowling 2025 - Milan_Bowling2	1	[{"added": {}}]	20	221
2327	2025-05-11 10:09:36.622003+00	932	Ontgroening pt.2 2025 - Ontgroening_pt2_Groepsfoto	1	[{"added": {}}]	20	221
2331	2025-05-11 10:10:35.916669+00	936	Ontgroening pt.2 2025 - Ontgroening_pt2_Groepsfoto_Beperkt	1	[{"added": {}}]	20	221
2332	2025-05-11 10:11:00.878224+00	932	Ontgroening pt.2 2025 - Ontgroening_pt2_Groepsfoto	3		20	221
2333	2025-05-11 10:11:22.094995+00	937	Ontgroening pt.2 2025 - Ontgroening_pt2_Groepsfoto_Everyone	1	[{"added": {}}]	20	221
2334	2025-05-13 13:10:51.557282+00	176	Karsten: 2024-2025	1	[{"added": {}}]	14	2
2335	2025-05-13 13:12:31.176263+00	107	2025 - 2026	1	[{"added": {}}]	15	2
2336	2025-05-13 13:13:00.156542+00	272	Superschachten Superschacht	1	[{"added": {}}]	19	2
2337	2025-05-14 11:10:10.233443+00	176	Karsten: 2024-2025	2	[{"changed": {"fields": ["Trivia"]}}]	14	2
2338	2025-05-14 11:11:10.731733+00	176	Karsten: 2024-2025	2	[{"changed": {"fields": ["Email"]}}]	14	2
2339	2025-05-14 11:11:15.866824+00	70	Febe: 2022-2023	2	[{"changed": {"fields": ["Email"]}}]	14	2
2340	2025-05-14 11:11:20.499425+00	37	Bram: 2021-2022	2	[{"changed": {"fields": ["Email"]}}]	14	2
2341	2025-05-14 11:12:14.86526+00	89	Superschachten Superschacht	2	[{"changed": {"fields": ["Photo"]}}]	19	2
2342	2025-05-14 11:18:11.527776+00	89	Superschachten Superschacht	2	[]	19	2
2343	2025-05-14 11:18:36.899747+00	133	Superschachten Superschacht	2	[]	19	2
2344	2025-05-14 11:18:52.280865+00	272	Superschachten Superschacht	2	[]	19	2
2345	2025-05-14 11:19:18.196797+00	133	Superschachten Superschacht	2	[]	19	2
2346	2025-05-14 11:19:28.173187+00	272	Superschachten Superschacht	2	[]	19	2
2347	2025-05-14 11:19:45.040373+00	272	Superschachten Superschacht	3		19	2
2348	2025-05-14 11:20:02.222263+00	273	Superschachten Superschacht	1	[{"added": {}}]	19	2
2349	2025-05-17 22:34:15.782144+00	274	2025 - 2026 Praeses	1	[{"added": {}}]	19	2
2350	2025-05-17 22:35:42.930619+00	176	Karsten: 2024-2025	2	[]	14	2
2351	2025-05-17 22:35:55.356622+00	275	2025 - 2026 Quaestor	1	[{"added": {}}]	19	2
2352	2025-05-17 22:36:12.047881+00	276	2025 - 2026 Secretaris	1	[{"added": {}}]	19	2
2353	2025-05-17 22:37:12.003776+00	177	Zeaya: Nys	1	[{"added": {}}]	14	2
2354	2025-05-17 22:37:51.270196+00	277	2025 - 2026 PR	1	[{"added": {}}]	19	2
2355	2025-05-17 22:38:20.066846+00	178	Axelle: Ducouran	1	[{"added": {}}]	14	2
2356	2025-05-17 22:38:36.723768+00	278	2025 - 2026 Media	1	[{"added": {}}]	19	2
2357	2025-05-17 22:39:11.077606+00	179	Simon: Tytgat	1	[{"added": {}}]	14	2
2358	2025-05-17 22:39:16.870531+00	279	2025 - 2026 Schachtentemmer	1	[{"added": {}}]	19	2
2359	2025-05-17 22:40:21.923224+00	180	Ricardo: De Blust	1	[{"added": {}}]	14	2
2360	2025-05-17 22:40:29.793774+00	280	2025 - 2026 Cultuur	1	[{"added": {}}]	19	2
2361	2025-05-17 22:40:51.325121+00	181	Alejandro: De Bruyne	1	[{"added": {}}]	14	2
2362	2025-05-17 22:41:05.698601+00	281	2025 - 2026 Sport	1	[{"added": {}}]	19	2
2363	2025-05-17 22:41:38.066551+00	182	Richy: Rahman	1	[{"added": {}}]	14	2
2364	2025-05-17 22:41:45.694187+00	282	2025 - 2026 Feest & LAN	1	[{"added": {}}]	19	2
2365	2025-05-17 22:42:10.083631+00	183	Yoran: Ollevier	1	[{"added": {}}]	14	2
2366	2025-05-17 22:42:16.74034+00	283	2025 - 2026 ICT	1	[{"added": {}}]	19	2
2367	2025-05-17 22:43:16.696859+00	275	2025 - 2026 Quaestor	2	[{"changed": {"fields": ["Photo"]}}]	19	2
2368	2025-05-17 22:43:22.771117+00	276	2025 - 2026 Secretaris	2	[{"changed": {"fields": ["Photo"]}}]	19	2
2369	2025-05-17 22:43:28.335601+00	278	2025 - 2026 Media	2	[{"changed": {"fields": ["Photo"]}}]	19	2
2370	2025-05-17 22:43:32.926698+00	278	2025 - 2026 Media	2	[]	19	2
2371	2025-05-17 22:43:36.76575+00	279	2025 - 2026 Schachtentemmer	2	[{"changed": {"fields": ["Photo"]}}]	19	2
2372	2025-05-17 22:43:41.46488+00	280	2025 - 2026 Cultuur	2	[{"changed": {"fields": ["Photo"]}}]	19	2
2373	2025-05-17 22:43:45.360134+00	281	2025 - 2026 Sport	2	[{"changed": {"fields": ["Photo"]}}]	19	2
2374	2025-05-17 22:43:49.307439+00	283	2025 - 2026 ICT	2	[{"changed": {"fields": ["Photo"]}}]	19	2
2375	2025-05-17 22:44:02.671161+00	282	2025 - 2026 Feest & LAN	2	[{"changed": {"fields": ["Photo"]}}]	19	2
2376	2025-05-17 22:44:07.187175+00	277	2025 - 2026 PR	2	[{"changed": {"fields": ["Photo"]}}]	19	2
2377	2025-05-17 22:45:19.768685+00	7	PR	2	[{"changed": {"fields": ["Order"]}}]	13	2
2378	2025-05-17 22:45:25.521278+00	8	ICT	2	[]	13	2
2379	2025-05-17 22:45:40.136397+00	11	Media	2	[{"changed": {"fields": ["Order"]}}]	13	2
2380	2025-05-17 22:45:50.598279+00	10	Schachtentemmer	2	[{"changed": {"fields": ["Order"]}}]	13	2
2381	2025-05-17 22:45:57.906746+00	6	Cultuur	2	[{"changed": {"fields": ["Order"]}}]	13	2
2382	2025-05-17 22:46:08.375208+00	10	Schachtentemmer	2	[]	13	2
2383	2025-05-17 22:46:13.388963+00	6	Cultuur	2	[]	13	2
2384	2025-05-17 22:46:17.834811+00	9	Sport	2	[{"changed": {"fields": ["Order"]}}]	13	2
2385	2025-05-17 22:46:24.443276+00	5	Feest & LAN	2	[{"changed": {"fields": ["Order"]}}]	13	2
2386	2025-05-17 22:57:16.475723+00	184	Karsten: Depoorter	1	[{"added": {}}]	14	2
2387	2025-05-17 22:57:20.151481+00	275	2025 - 2026 Quaestor	2	[{"changed": {"fields": ["Praesidium member"]}}]	19	2
2388	2025-05-17 22:58:18.256914+00	276	2025 - 2026 Secretaris	2	[{"changed": {"fields": ["Photo"]}}]	19	2
2389	2025-05-17 22:58:28.064342+00	274	2025 - 2026 Praeses	2	[{"changed": {"fields": ["Photo"]}}]	19	2
2390	2025-05-17 22:59:10.491842+00	275	2025 - 2026 Quaestor	2	[{"changed": {"fields": ["Photo"]}}]	19	2
2391	2025-05-23 16:57:58.322308+00	5	privacy	2	[{"changed": {"fields": ["Description"]}}]	7	3
2392	2025-05-23 17:00:10.95923+00	5	privacy	2	[{"changed": {"fields": ["Description"]}}]	7	3
2393	2025-05-24 09:29:42.36078+00	5	privacy	2	[{"changed": {"fields": ["Description"]}}]	7	2
2394	2025-05-24 09:30:37.803734+00	3	praeses@heimdal.be	2	[{"changed": {"fields": ["password"]}}]	4	2
2395	2025-05-24 09:30:47.511823+00	3	praeses@heimdal.be	2	[{"changed": {"fields": ["First name", "Last name"]}}]	4	2
2396	2025-05-24 09:32:37.195522+00	2	ict@heimdal.be	2	[{"changed": {"fields": ["password"]}}]	4	2
2397	2025-05-24 09:36:45.46608+00	2	ict@heimdal.be	2	[{"changed": {"fields": ["First name", "Last name"]}}]	4	2
2398	2025-05-24 09:40:40.977828+00	5	quaestor@heimdal.be	2	[{"changed": {"fields": ["First name", "Last name"]}}]	4	2
2399	2025-05-24 09:40:50.918607+00	5	quaestor@heimdal.be	2	[{"changed": {"fields": ["password"]}}]	4	2
2400	2025-05-24 09:45:01.61071+00	6	secretaris@heimdal.be	2	[{"changed": {"fields": ["First name", "Last name"]}}]	4	2
2401	2025-05-24 09:45:19.780991+00	6	secretaris@heimdal.be	2	[{"changed": {"fields": ["password"]}}]	4	2
2402	2025-05-24 09:51:28.529439+00	10	pr@heimdal.be	2	[{"changed": {"fields": ["First name", "Last name"]}}]	4	2
2403	2025-05-24 09:51:39.407151+00	10	pr@heimdal.be	2	[{"changed": {"fields": ["password"]}}]	4	2
2404	2025-05-24 09:54:03.473053+00	10	pr@heimdal.be	2	[{"changed": {"fields": ["password"]}}]	4	2
2405	2025-05-24 09:55:26.833637+00	221	media@heimdal.be	2	[{"changed": {"fields": ["First name", "Last name"]}}]	4	2
2406	2025-05-24 09:56:51.170538+00	8	schachtentemmer@heimdal.be	2	[{"changed": {"fields": ["password"]}}]	4	2
2407	2025-05-24 09:58:47.446414+00	11	cultuur@heimdal.be	2	[{"changed": {"fields": ["First name", "Last name"]}}, {"changed": {"name": "profile", "object": "Ricardo De Blust", "fields": ["Geslacht"]}}]	4	2
2408	2025-05-24 09:59:14.3837+00	11	cultuur@heimdal.be	2	[{"changed": {"fields": ["password"]}}]	4	2
2409	2025-05-24 10:00:08.221545+00	7	sport@heimdal.be	2	[{"changed": {"fields": ["First name", "Last name"]}}]	4	2
2410	2025-05-24 10:00:28.442387+00	7	sport@heimdal.be	2	[{"changed": {"fields": ["password"]}}]	4	2
2411	2025-05-24 10:02:04.057875+00	9	feest-lan@heimdal.be	2	[{"changed": {"fields": ["First name", "Last name"]}}]	4	2
2412	2025-05-24 10:02:24.684017+00	9	feest-lan@heimdal.be	2	[{"changed": {"fields": ["password"]}}]	4	2
2413	2025-06-01 17:02:14.811586+00	1	test election	1	[{"added": {}}]	8	3
2414	2025-06-01 17:02:19.459152+00	1	test election	2	[]	8	3
2415	2025-06-01 17:02:30.961437+00	1	test election	2	[{"changed": {"fields": ["Visible"]}}]	8	2
2416	2025-06-01 17:02:32.275289+00	1	test election	2	[]	8	3
2417	2025-06-01 17:02:53.272918+00	1	test election: ronde 4	1	[{"added": {}}]	16	3
2418	2025-06-01 17:03:02.892509+00	1	test election: ronde 4	2	[]	16	3
2419	2025-06-01 17:03:52.359246+00	3	Seppe Landtsheer	2	[{"changed": {"fields": ["Election active"]}}]	18	3
2420	2025-06-01 17:04:26.478287+00	2	ict@heimdal.be	2	[{"changed": {"name": "profile", "object": "Yoran Ollevier", "fields": ["Election active"]}}]	4	2
2421	2025-06-01 17:04:47.225983+00	1	test election: ronde 4	2	[{"changed": {"fields": ["Actief"]}}]	16	3
2422	2025-06-01 17:05:06.151536+00	1	test election: ronde 4	2	[{"changed": {"fields": ["Resultatenactief"]}}]	16	2
2423	2025-06-01 17:05:20.007507+00	1	test election: ronde 4	2	[{"changed": {"fields": ["Resultatenactief"]}}]	16	2
2424	2025-06-01 17:06:09.270285+00	3	Seppe Landtsheer	2	[{"changed": {"fields": ["Votes"]}}]	18	3
2425	2025-06-01 17:06:35.606395+00	2	ict@heimdal.be	2	[{"changed": {"name": "profile", "object": "Yoran Ollevier", "fields": ["Votes"]}}]	4	2
2426	2025-06-01 17:07:13.345396+00	1	test election: ronde 4 - ik	1	[{"added": {}}]	24	2
2427	2025-06-01 17:08:11.845849+00	2	ict@heimdal.be	2	[{"changed": {"name": "profile", "object": "Yoran Ollevier", "fields": ["Votes", "Election active"]}}]	4	2
2428	2025-06-01 17:08:46.624534+00	1	test election: ronde 4 - ik	3		24	2
2429	2025-06-01 17:08:51.363457+00	1	test election: ronde 4	3		16	2
2430	2025-06-01 17:08:57.226451+00	1	test election	3		8	2
2431	2025-06-01 17:09:23.284168+00	2	a	1	[{"added": {}}]	8	2
2432	2025-06-01 17:09:32.088236+00	2	a: b	1	[{"added": {}}]	16	2
2433	2025-06-01 17:09:43.364598+00	2	a: b - c	1	[{"added": {}}]	24	2
2434	2025-06-01 17:09:48.767652+00	3	a: b - d	1	[{"added": {}}]	24	2
2435	2025-06-01 17:16:22.286611+00	329	Yoran Ollevier	2	[{"changed": {"fields": ["Role"]}}]	18	3
2436	2025-06-01 17:16:42.359058+00	329	Yoran Ollevier	2	[{"changed": {"fields": ["Election active"]}}]	18	3
2437	2025-06-01 17:20:23.609118+00	12	Tyra Bourgeois	2	[{"changed": {"fields": ["Role"]}}]	18	3
2438	2025-06-01 17:21:30.516872+00	4	Reina Tanghe	2	[{"changed": {"fields": ["Election active"]}}]	18	2
2439	2025-06-01 17:21:34.991816+00	3	Seppe Landtsheer	2	[{"changed": {"fields": ["Election active"]}}]	18	2
2440	2025-06-01 17:23:18.290778+00	3	Seppe Landtsheer	2	[{"changed": {"fields": ["Votes"]}}]	18	2
2441	2025-06-01 17:23:30.258845+00	221	Axelle Ducouran	2	[{"changed": {"fields": ["Votes"]}}]	18	2
2442	2025-06-01 17:23:37.065772+00	1	 	2	[{"changed": {"fields": ["Votes"]}}]	18	2
2443	2025-06-01 17:23:47.992218+00	6	Maxe Adams	2	[{"changed": {"fields": ["Votes"]}}]	18	2
2444	2025-06-01 17:23:58.57923+00	12	Tyra Bourgeois	2	[{"changed": {"fields": ["Role"]}}]	18	2
2445	2025-06-01 17:27:51.898833+00	329	yoran-ollevier	2	[{"changed": {"fields": ["Username"]}}]	4	2
2446	2025-06-01 17:30:41.003386+00	221	media@heimdal.be	2	[{"changed": {"fields": ["Groups"]}}]	4	3
2447	2025-06-01 17:33:01.541008+00	12	Tyra	2	[{"changed": {"fields": ["Staff status"]}}]	4	2
2448	2025-06-01 17:33:42.994299+00	12	Tyra	2	[{"changed": {"fields": ["Groups", "User permissions"]}}]	4	2
2449	2025-06-01 17:34:49.811138+00	221	media@heimdal.be	2	[{"changed": {"fields": ["Groups", "User permissions"]}}]	4	3
2450	2025-06-01 17:35:40.649801+00	3	Seppe Landtsheer	2	[{"changed": {"fields": ["Votes", "Election active"]}}]	18	221
2451	2025-06-01 17:35:51.214722+00	3	Seppe Landtsheer	2	[{"changed": {"fields": ["Votes", "Election active"]}}]	18	221
2452	2025-06-01 17:36:12.663621+00	327	Brecht Huys	2	[{"changed": {"fields": ["Role"]}}]	18	221
2453	2025-06-01 17:36:25.744253+00	327	Brecht Huys	2	[{"changed": {"fields": ["Role"]}}]	18	221
2454	2025-06-01 17:39:56.567424+00	261	amberdhondt	3		4	3
2455	2025-06-01 17:42:31.474122+00	330	Maxe Adams	2	[{"changed": {"fields": ["Role"]}}]	18	3
2456	2025-06-01 17:42:35.950579+00	328	Zeaya Nys	2	[{"changed": {"fields": ["Role"]}}]	18	3
2457	2025-06-01 17:42:39.475209+00	327	Brecht Huys	2	[{"changed": {"fields": ["Role"]}}]	18	3
2458	2025-06-01 17:42:43.23882+00	228	Alejandro De Bruyne	2	[{"changed": {"fields": ["Role"]}}]	18	3
2459	2025-06-01 17:42:47.321816+00	226	Tijl Zwartjes	2	[{"changed": {"fields": ["Role"]}}]	18	3
2460	2025-06-01 17:42:50.816793+00	224	Nikki Stuster	2	[{"changed": {"fields": ["Role"]}}]	18	3
2461	2025-06-01 17:42:53.966297+00	220	Thomas Pauwels	2	[{"changed": {"fields": ["Role"]}}]	18	3
2462	2025-06-01 17:42:57.239788+00	219	Amber D'Hondt	2	[{"changed": {"fields": ["Role"]}}]	18	3
2463	2025-06-01 17:43:00.450738+00	216	Britt Emanuel	2	[{"changed": {"fields": ["Role"]}}]	18	3
2464	2025-06-01 17:43:03.195194+00	112	Jakob Van der Vennet	2	[{"changed": {"fields": ["Role"]}}]	18	3
2465	2025-06-01 17:43:06.178131+00	45	Jerko Marain	2	[{"changed": {"fields": ["Role"]}}]	18	3
2466	2025-06-01 17:43:08.805696+00	12	Tyra Bourgeois	2	[{"changed": {"fields": ["Role"]}}]	18	3
2467	2025-06-01 17:43:24.171584+00	4	vice-praeses@heimdal.be	2	[{"changed": {"fields": ["First name", "Last name"]}}, {"changed": {"name": "profile", "object": "/ /", "fields": ["Gsm", "Geslacht", "Interesses"]}}]	4	2
2468	2025-06-01 17:43:44.204375+00	4	vice-praeses@heimdal.be	2	[{"changed": {"fields": ["password"]}}]	4	2
2469	2025-06-01 17:51:19.30913+00	3	a: b - d	3		24	2
2470	2025-06-01 17:51:21.958917+00	2	a: b - c	3		24	2
2471	2025-06-01 17:51:28.619776+00	2	a: b	3		16	2
2472	2025-06-01 17:51:36.693658+00	2	a	3		8	2
2473	2025-06-02 13:46:23.58294+00	216	Brittney001	2	[{"changed": {"fields": ["password"]}}]	4	3
2506	2025-06-20 13:42:47.541751+00	375	Picknick	2	[{"changed": {"fields": ["End"]}}]	23	2
2507	2025-06-20 13:43:22.248139+00	375	Picknick	2	[{"changed": {"fields": ["End"]}}]	23	2
2508	2025-06-24 18:11:31.116647+00	72	Milan: De Smet	2	[{"changed": {"fields": ["Twitter link"]}}]	14	2
2509	2025-06-24 18:12:57.14982+00	72	Milan: De Smet	2	[{"changed": {"fields": ["Trivia"]}}]	14	2
2510	2025-06-24 22:07:18.799349+00	216	Brittney001	2	[{"changed": {"fields": ["password"]}}]	4	3
2511	2025-06-25 09:40:48.005649+00	313	Ereleden Erelid	1	[{"added": {}}]	19	2
2512	2025-06-25 09:49:08.976606+00	7	PR	2	[{"changed": {"fields": ["Order"]}}]	13	2
2513	2025-06-25 09:49:30.096575+00	11	Media	2	[{"changed": {"fields": ["Order"]}}]	13	2
2514	2025-06-25 09:49:40.908607+00	10	Schachtentemmer	2	[{"changed": {"fields": ["Order"]}}]	13	2
2515	2025-06-25 09:49:48.283348+00	6	Cultuur	2	[{"changed": {"fields": ["Order"]}}]	13	2
2516	2025-06-25 09:49:55.63543+00	9	Sport	2	[{"changed": {"fields": ["Order"]}}]	13	2
2517	2025-06-25 09:50:07.869079+00	5	Feest & LAN	2	[{"changed": {"fields": ["Order"]}}]	13	2
2518	2025-06-25 09:50:19.639484+00	8	ICT	2	[{"changed": {"fields": ["Order"]}}]	13	2
2519	2025-06-25 09:50:39.98666+00	12	Scriptor	2	[{"changed": {"fields": ["Order"]}}]	13	2
2520	2025-06-25 09:51:11.223948+00	12	Scriptor	2	[{"changed": {"fields": ["Order"]}}]	13	2
2521	2025-06-25 09:51:55.576691+00	48	Keizer Feest & LAN	2	[{"changed": {"fields": ["Order"]}}]	13	2
2522	2025-06-28 13:41:47.051392+00	147	Briek De Clercq	2	[{"changed": {"fields": ["Role"]}}]	18	3
2523	2025-06-28 13:48:34.182007+00	182	Briekdc	3		4	3
2524	2025-06-28 13:48:34.186658+00	218	Briekdc2002	3		4	3
2525	2025-06-28 13:48:34.188934+00	215	briekdc@gmail.com	3		4	3
2526	2025-06-28 14:02:50.298266+00	332	Sander De Bruyker	2	[{"changed": {"fields": ["Role"]}}]	18	3
2527	2025-06-28 14:02:56.137087+00	331	Benny De Bock	2	[{"changed": {"fields": ["Role"]}}]	18	3
2528	2025-06-28 14:03:00.745368+00	217	Diede Devriendt	2	[{"changed": {"fields": ["Role"]}}]	18	3
2529	2025-06-28 14:07:10.976317+00	365	Aaron Vandeweghe	2	[{"changed": {"fields": ["Role"]}}]	18	3
2530	2025-06-28 14:07:14.75768+00	366	Milan De Smet	2	[{"changed": {"fields": ["Role"]}}]	18	3
2531	2025-06-28 14:07:17.910107+00	367	Lisa Téren	2	[{"changed": {"fields": ["Role"]}}]	18	3
2532	2025-06-28 14:56:10.742058+00	228	Alejandro De Bruyne	3		18	3
2533	2025-06-28 14:56:33.151178+00	373	Ricardo De Blust	2	[{"changed": {"fields": ["Role"]}}]	18	3
2534	2025-06-28 14:56:37.239604+00	372	Vincent minjauw	2	[{"changed": {"fields": ["Role"]}}]	18	3
2535	2025-06-28 14:56:42.376228+00	371	Sacha Everaert	2	[{"changed": {"fields": ["Role"]}}]	18	3
2536	2025-06-28 14:56:45.24622+00	370	Alejandro De Bruyne	2	[{"changed": {"fields": ["Role"]}}]	18	3
2537	2025-06-28 14:56:50.102757+00	369	Karsten Depoorter	2	[{"changed": {"fields": ["Role"]}}]	18	3
2538	2025-06-28 15:41:05.539145+00	375	Kobe Maebe	2	[{"changed": {"fields": ["Role"]}}]	18	221
2539	2025-06-28 15:41:24.923467+00	374	Simon Tytgat	2	[{"changed": {"fields": ["Role"]}}]	18	221
2540	2025-06-28 15:56:20.989686+00	3	Seppe Landtsheer	2	[{"changed": {"fields": ["Votes", "Election active"]}}]	18	3
2541	2025-06-28 15:56:26.853376+00	3	Seppe Landtsheer	2	[{"changed": {"fields": ["Votes", "Election active"]}}]	18	3
2542	2025-06-28 15:56:32.490079+00	3	Seppe Landtsheer	2	[{"changed": {"fields": ["Votes", "Election active"]}}]	18	3
2543	2025-06-28 15:56:49.191722+00	35	test	1	[{"added": {}}]	8	3
2544	2025-06-28 15:56:55.226893+00	35	test: test	1	[{"added": {}}]	16	3
2545	2025-06-28 15:56:58.993559+00	34	test: test - test1	1	[{"added": {}}]	24	3
2546	2025-06-28 15:57:03.41235+00	35	test: test - test2	1	[{"added": {}}]	24	3
2547	2025-06-28 15:57:38.081465+00	35	test: test	2	[{"changed": {"fields": ["Resultatenactief"]}}]	16	3
2548	2025-06-28 15:59:23.427476+00	35	test: test	3		16	3
2549	2025-06-28 16:02:32.052202+00	376	Rein Goossens	2	[{"changed": {"fields": ["Role"]}}]	18	3
2550	2025-06-28 16:02:36.387359+00	3	Seppe Landtsheer	2	[{"changed": {"fields": ["Election active"]}}]	18	3
2551	2025-06-28 16:04:23.673166+00	377	Bram Volmacht	2	[{"changed": {"fields": ["Role"]}}]	18	3
2552	2025-06-28 16:04:32.216881+00	3	Seppe Landtsheer	2	[{"changed": {"fields": ["Votes"]}}]	18	3
2553	2025-06-28 16:21:52.624982+00	378	Richy Rahman	2	[{"changed": {"fields": ["Role"]}}]	18	3
2554	2025-06-28 16:42:47.074457+00	381	Nyo Volmacht	2	[{"changed": {"fields": ["Role"]}}]	18	3
2555	2025-06-28 16:42:50.037047+00	380	Hayley Rasschaert	2	[{"changed": {"fields": ["Role"]}}]	18	3
2556	2025-06-28 16:42:52.923716+00	379	Reina Tanghe	2	[{"changed": {"fields": ["Role"]}}]	18	3
2557	2025-06-28 16:58:15.991347+00	331	BennyDB	2	[{"changed": {"fields": ["password"]}}]	4	2
2558	2025-06-28 16:58:47.0707+00	331	BennyDB	2	[{"changed": {"fields": ["password"]}}]	4	2
2559	2025-06-28 16:59:40.890767+00	35	test	3		8	2
2590	2025-08-13 20:50:46.507828+00	6	overons	2	[{"changed": {"fields": ["Description"]}}]	7	3
2591	2025-08-21 09:02:02.910402+00	138	Reproduct.be	3		17	2
2592	2025-09-01 17:12:59.847191+00	67	jaarthema	2	[{"changed": {"fields": ["Description"]}}]	7	2
2593	2025-09-01 17:14:10.413263+00	67	jaarthema	2	[{"changed": {"fields": ["Title"]}}]	7	2
2594	2025-09-01 17:14:30.694912+00	67	jaarthema	2	[{"changed": {"fields": ["Description"]}}]	7	2
2595	2025-09-01 17:14:45.414578+00	67	jaarthema	2	[]	7	2
2596	2025-09-01 17:15:58.907378+00	67	jaarthema	2	[{"changed": {"fields": ["Description"]}}]	7	2
2597	2025-09-01 17:17:09.134003+00	67	jaarthema	2	[{"changed": {"fields": ["Description"]}}]	7	2
2598	2025-09-01 17:18:42.219413+00	67	jaarthema	2	[{"changed": {"fields": ["Description"]}}]	7	2
2599	2025-09-05 23:14:54.900455+00	278	2025 - 2026 Media	2	[{"changed": {"fields": ["Photo"]}}]	19	2
2600	2025-09-05 23:16:42.7601+00	278	2025 - 2026 Media	2	[{"changed": {"fields": ["Photo"]}}]	19	2
2601	2025-09-05 23:18:28.993638+00	278	2025 - 2026 Media	2	[{"changed": {"fields": ["Photo"]}}]	19	2
2602	2025-09-05 23:18:56.107114+00	279	2025 - 2026 Schachtentemmer	2	[{"changed": {"fields": ["Photo"]}}]	19	2
2603	2025-09-05 23:19:32.350999+00	279	2025 - 2026 Schachtentemmer	2	[{"changed": {"fields": ["Photo"]}}]	19	2
2604	2025-09-05 23:19:58.721816+00	278	2025 - 2026 Media	2	[{"changed": {"fields": ["Photo"]}}]	19	2
2605	2025-09-05 23:24:46.979036+00	278	2025 - 2026 Media	2	[{"changed": {"fields": ["Photo"]}}]	19	2
2607	2025-09-05 23:25:57.186376+00	279	2025 - 2026 Schachtentemmer	2	[{"changed": {"fields": ["Photo"]}}]	19	2
2606	2025-09-05 23:25:52.753474+00	278	2025 - 2026 Media	2	[{"changed": {"fields": ["Photo"]}}]	19	2
2608	2025-09-06 20:32:04.755901+00	280	2025 - 2026 Cultuur	2	[{"changed": {"fields": ["Photo"]}}]	19	2
2609	2025-09-06 20:48:01.07005+00	280	2025 - 2026 Cultuur	2	[{"changed": {"fields": ["Photo"]}}]	19	2
2610	2025-09-06 20:48:40.827294+00	280	2025 - 2026 Cultuur	2	[{"changed": {"fields": ["Photo"]}}]	19	2
2611	2025-09-06 20:49:05.145972+00	282	2025 - 2026 Feest & LAN	2	[{"changed": {"fields": ["Photo"]}}]	19	2
2612	2025-09-06 20:49:33.161645+00	282	2025 - 2026 Feest & LAN	2	[{"changed": {"fields": ["Photo"]}}]	19	2
2613	2025-09-06 20:49:50.331002+00	283	2025 - 2026 ICT	2	[{"changed": {"fields": ["Photo"]}}]	19	2
2614	2025-09-06 20:50:47.520002+00	275	2025 - 2026 Quaestor	2	[{"changed": {"fields": ["Photo"]}}]	19	2
2615	2025-09-06 20:51:05.143276+00	276	2025 - 2026 Secretaris	2	[{"changed": {"fields": ["Photo"]}}]	19	2
2616	2025-09-06 20:51:19.126265+00	274	2025 - 2026 Praeses	2	[{"changed": {"fields": ["Photo"]}}]	19	2
2617	2025-09-06 20:51:34.003692+00	281	2025 - 2026 Sport	2	[{"changed": {"fields": ["Photo"]}}]	19	2
2618	2025-09-06 20:51:54.15446+00	279	2025 - 2026 Schachtentemmer	2	[{"changed": {"fields": ["Photo"]}}]	19	2
2619	2025-09-06 20:52:06.536779+00	278	2025 - 2026 Media	2	[{"changed": {"fields": ["Photo"]}}]	19	2
2620	2025-09-06 20:52:27.674498+00	273	Superschachten Superschacht	2	[{"changed": {"fields": ["Photo"]}}]	19	2
2621	2025-09-19 20:05:53.715394+00	277	2025 - 2026 PR	2	[{"changed": {"fields": ["Photo"]}}]	19	2
2622	2025-09-19 20:47:44.689651+00	277	2025 - 2026 PR	2	[{"changed": {"fields": ["Photo"]}}]	19	2
2655	2025-09-22 17:03:07.47956+00	408	Stadsspel	1	[{"added": {}}]	23	221
2656	2025-09-22 18:12:42.112994+00	277	2025 - 2026 PR	2	[{"changed": {"fields": ["Photo"]}}]	19	2
2657	2025-09-26 17:04:31.589541+00	409	Mario Kart Toernooi	1	[{"added": {}}]	23	221
2658	2025-09-26 17:05:31.04456+00	409	Mario Kart Toernooi	2	[{"changed": {"fields": ["Description"]}}]	23	221
2691	2025-09-30 16:18:02.381371+00	442	Lasershooting	1	[{"added": {}}]	23	221
2692	2025-10-02 16:56:57.46106+00	443	Karakoe I	1	[{"added": {}}]	23	221
2693	2025-10-02 16:59:51.229179+00	443	Karakoe I	2	[{"changed": {"fields": ["End"]}}]	23	221
2694	2025-10-03 20:28:28.379218+00	409	Mario Kart Toernooi	2	[{"changed": {"fields": ["Poster"]}}]	23	3
2695	2025-10-03 20:30:05.347425+00	442	Lasershooting	2	[{"changed": {"fields": ["Poster"]}}]	23	3
2696	2025-10-03 20:30:15.622374+00	409	Mario Kart Toernooi	2	[{"changed": {"fields": ["Poster"]}}]	23	3
2697	2025-10-03 20:33:01.923177+00	409	Mario Kart Toernooi	2	[{"changed": {"fields": ["Poster"]}}]	23	221
2698	2025-10-03 20:33:31.916977+00	443	Karakoe I	2	[{"changed": {"fields": ["Poster"]}}]	23	221
2699	2025-10-08 17:02:34.36175+00	444	Heimdal Doop: The Trail of Fire	1	[{"added": {}}]	23	221
2700	2025-10-09 15:52:34.229051+00	442	Lasershooting	2	[{"changed": {"fields": ["Description", "Start", "End"]}}]	23	7
2701	2025-10-13 17:00:35.712289+00	445	Studentenverenigingen 101	1	[{"added": {}}]	23	221
2734	2025-10-15 17:37:02.013991+00	221	media@heimdal.be	2	[{"changed": {"fields": ["password"]}}]	4	2
2735	2025-10-15 17:40:06.923028+00	478	Halloween Clubavond	1	[{"added": {}}]	23	221
2736	2025-10-22 16:06:08.264634+00	6	overons	2	[{"changed": {"fields": ["Description"]}}]	7	2
2737	2025-10-28 19:09:19.79916+00	479	Weerwolvenavond	1	[{"added": {}}]	23	2
2738	2025-10-28 19:11:12.507963+00	479	Weerwolvenavond	2	[{"changed": {"fields": ["End", "Location"]}}]	23	2
2739	2025-10-30 18:11:45.213452+00	221	media@heimdal.be	2	[{"changed": {"fields": ["password"]}}]	4	2
2740	2025-10-30 18:14:35.523193+00	480	The Dragon Dance: cocktailfeestje	1	[{"added": {}}]	23	221
2741	2025-11-04 17:21:57.866448+00	481	Baseball	1	[{"added": {}}]	23	221
2742	2025-11-06 12:45:20.441323+00	145	8tea5	3		17	2
2743	2025-11-06 12:45:26.867955+00	144	Mythropool	3		17	2
2744	2025-11-06 12:45:32.589607+00	143	Planet Talent	3		17	2
2745	2025-11-08 18:01:08.009352+00	482	Schachtenevent: Presentatieavond	1	[{"added": {}}]	23	221
2778	2025-11-10 19:05:41.212741+00	515	Movie Night	1	[{"added": {}}]	23	221
2779	2025-11-15 17:11:39.198866+00	516	Nadoop	1	[{"added": {}}]	23	221
2780	2025-11-15 17:16:45.52001+00	516	Nadoop	2	[{"changed": {"fields": ["Description"]}}]	23	221
2781	2025-11-22 17:27:11.584061+00	517	Secret Santa Clubavond	1	[{"added": {}}]	23	221
2782	2025-11-22 18:10:14.703755+00	518	De Warmste Stream 2025	1	[{"added": {}}]	23	221
2783	2025-11-23 18:17:16.162604+00	519	Heimdal Ledenweekend	1	[{"added": {}}]	23	221
2784	2025-11-24 19:28:14.179133+00	520	Schaatsen	1	[{"added": {}}]	23	221
2785	2025-11-24 19:28:56.510974+00	519	Heimdal Ledenweekend	2	[{"changed": {"fields": ["Is open"]}}]	23	221
2786	2025-11-24 19:32:31.763923+00	521	Secret Santa Clubavond	1	[{"added": {}}]	23	221
2787	2025-11-27 18:40:29.773089+00	522	Museumnacht	1	[{"added": {}}]	23	221
2788	2025-11-28 18:30:35.74371+00	523	Sinterklaas clubavond	1	[{"added": {}}]	23	221
2821	2026-02-03 19:14:40.930759+00	556	Pokémon Showdown	1	[{"added": {}}]	23	221
2822	2026-02-03 19:26:38.940907+00	556	Pokémon Showdown	2	[{"changed": {"fields": ["Description"]}}]	23	221
2855	2026-02-08 14:39:52.509452+00	218	MarioKart Toernooi 2025-2026	1	[{"added": {}}]	12	221
2856	2026-02-08 14:40:44.314629+00	965	MarioKart Toernooi 2025-2026 - MarioKart Toernooi 2025-2026	1	[{"added": {}}]	20	221
2857	2026-02-08 14:41:15.487681+00	965	MarioKart Toernooi 2025-2026 - MarioKart Toernooi 2025-2026	3		20	221
2858	2026-02-08 14:41:54.722916+00	966	MarioKart Toernooi 2025-2026 - MarioKart Toernooi 2025-2026	1	[{"added": {}}]	20	221
2859	2026-02-08 14:54:20.78344+00	966	MarioKart Toernooi 2025-2026 - MarioKart Toernooi 2025-2026	3		20	221
2860	2026-02-08 14:54:39.161322+00	967	MarioKart Toernooi 2025-2026 - MarioKart Toernooi 2025-2026	1	[{"added": {}}]	20	221
2861	2026-02-08 14:55:05.174963+00	968	MarioKart Toernooi 2025-2026 - MarioKart Toernooi 2025-2026	1	[{"added": {}}]	20	221
2862	2026-02-08 14:55:57.356648+00	969	MarioKart Toernooi 2025-2026 - MarioKart Toernooi 2025-2026	1	[{"added": {}}]	20	221
2863	2026-02-08 14:56:16.014089+00	970	MarioKart Toernooi 2025-2026 - MarioKart Toernooi 2025-2026	1	[{"added": {}}]	20	221
2864	2026-02-08 14:56:39.108862+00	971	MarioKart Toernooi 2025-2026 - MarioKart Toernooi 2025-2026	1	[{"added": {}}]	20	221
2865	2026-02-08 14:57:09.884264+00	972	MarioKart Toernooi 2025-2026 - MarioKart Toernooi 2025-2026	1	[{"added": {}}]	20	221
2866	2026-02-08 14:57:32.494695+00	973	MarioKart Toernooi 2025-2026 - MarioKart Toernooi 2025-2026	1	[{"added": {}}]	20	221
2867	2026-02-08 14:57:53.066817+00	974	MarioKart Toernooi 2025-2026 - MarioKart Toernooi 2025-2026	1	[{"added": {}}]	20	221
2868	2026-02-08 14:58:11.82845+00	975	MarioKart Toernooi 2025-2026 - MarioKart Toernooi 2025-2026	1	[{"added": {}}]	20	221
2869	2026-02-08 14:58:26.4541+00	976	MarioKart Toernooi 2025-2026 - MarioKart Toernooi 2025-2026	1	[{"added": {}}]	20	221
3153	2026-03-06 19:51:31.911541+00	656	The Hidden LAN	1	[{"added": {}}]	23	221
2870	2026-02-08 14:59:10.129968+00	977	MarioKart Toernooi 2025-2026 - MarioKart Toernooi 2025-2026	1	[{"added": {}}]	20	221
2872	2026-02-08 14:59:36.660421+00	979	MarioKart Toernooi 2025-2026 - MarioKart Toernooi 2025-2026	1	[{"added": {}}]	20	221
2873	2026-02-08 14:59:53.346103+00	980	MarioKart Toernooi 2025-2026 - MarioKart Toernooi 2025-2026	1	[{"added": {}}]	20	221
2874	2026-02-08 15:00:07.396895+00	981	MarioKart Toernooi 2025-2026 - MarioKart Toernooi 2025-2026	1	[{"added": {}}]	20	221
2876	2026-02-08 15:00:41.815039+00	983	MarioKart Toernooi 2025-2026 - MarioKart Toernooi 2025-2026	1	[{"added": {}}]	20	221
2878	2026-02-08 15:01:04.934183+00	985	MarioKart Toernooi 2025-2026 - MarioKart Toernooi 2025-2026	1	[{"added": {}}]	20	221
2882	2026-02-08 15:02:01.062022+00	989	MarioKart Toernooi 2025-2026 - MarioKart Toernooi 2025-2026	1	[{"added": {}}]	20	221
2885	2026-02-08 15:02:46.005351+00	992	MarioKart Toernooi 2025-2026 - MarioKart Toernooi 2025-2026	1	[{"added": {}}]	20	221
2886	2026-02-08 15:02:57.850672+00	993	MarioKart Toernooi 2025-2026 - MarioKart Toernooi 2025-2026	1	[{"added": {}}]	20	221
2890	2026-02-08 15:04:06.075267+00	997	MarioKart Toernooi 2025-2026 - MarioKart Toernooi 2025-2026	1	[{"added": {}}]	20	221
2896	2026-02-08 15:05:35.245929+00	1003	MarioKart Toernooi 2025-2026 - MarioKart Toernooi 2025-2026	1	[{"added": {}}]	20	221
2871	2026-02-08 14:59:24.058316+00	978	MarioKart Toernooi 2025-2026 - MarioKart Toernooi 2025-2026	1	[{"added": {}}]	20	221
2875	2026-02-08 15:00:21.521774+00	982	MarioKart Toernooi 2025-2026 - MarioKart Toernooi 2025-2026	1	[{"added": {}}]	20	221
2877	2026-02-08 15:00:52.755067+00	984	MarioKart Toernooi 2025-2026 - MarioKart Toernooi 2025-2026	1	[{"added": {}}]	20	221
2879	2026-02-08 15:01:19.815531+00	986	MarioKart Toernooi 2025-2026 - MarioKart Toernooi 2025-2026	1	[{"added": {}}]	20	221
2880	2026-02-08 15:01:34.723205+00	987	MarioKart Toernooi 2025-2026 - MarioKart Toernooi 2025-2026	1	[{"added": {}}]	20	221
2881	2026-02-08 15:01:51.407597+00	988	MarioKart Toernooi 2025-2026 - MarioKart Toernooi 2025-2026	1	[{"added": {}}]	20	221
2883	2026-02-08 15:02:19.154641+00	990	MarioKart Toernooi 2025-2026 - MarioKart Toernooi 2025-2026	1	[{"added": {}}]	20	221
2884	2026-02-08 15:02:31.990051+00	991	MarioKart Toernooi 2025-2026 - MarioKart Toernooi 2025-2026	1	[{"added": {}}]	20	221
2887	2026-02-08 15:03:10.719684+00	994	MarioKart Toernooi 2025-2026 - MarioKart Toernooi 2025-2026	1	[{"added": {}}]	20	221
2888	2026-02-08 15:03:29.64751+00	995	MarioKart Toernooi 2025-2026 - MarioKart Toernooi 2025-2026	1	[{"added": {}}]	20	221
2889	2026-02-08 15:03:55.573281+00	996	MarioKart Toernooi 2025-2026 - MarioKart Toernooi 2025-2026	1	[{"added": {}}]	20	221
2891	2026-02-08 15:04:19.932677+00	998	MarioKart Toernooi 2025-2026 - MarioKart Toernooi 2025-2026	1	[{"added": {}}]	20	221
2892	2026-02-08 15:04:30.504971+00	999	MarioKart Toernooi 2025-2026 - MarioKart Toernooi 2025-2026	1	[{"added": {}}]	20	221
2893	2026-02-08 15:04:44.605398+00	1000	MarioKart Toernooi 2025-2026 - MarioKart Toernooi 2025-2026	1	[{"added": {}}]	20	221
2894	2026-02-08 15:04:57.444185+00	1001	MarioKart Toernooi 2025-2026 - MarioKart Toernooi 2025-2026	1	[{"added": {}}]	20	221
2895	2026-02-08 15:05:15.709342+00	1002	MarioKart Toernooi 2025-2026 - MarioKart Toernooi 2025-2026	1	[{"added": {}}]	20	221
2897	2026-02-08 15:55:19.893849+00	219	SKO + Opendeurdag 2025-2026	1	[{"added": {}}]	12	221
2898	2026-02-08 15:58:39.773466+00	1004	SKO + Opendeurdag 2025-2026 - SKO + Opendeurdag 2025-2026	1	[{"added": {}}]	20	221
2899	2026-02-08 15:58:54.301579+00	1005	SKO + Opendeurdag 2025-2026 - SKO + Opendeurdag 2025-2026	1	[{"added": {}}]	20	221
2900	2026-02-08 15:59:06.731026+00	1006	SKO + Opendeurdag 2025-2026 - SKO + Opendeurdag 2025-2026	1	[{"added": {}}]	20	221
2901	2026-02-08 15:59:17.94956+00	1007	SKO + Opendeurdag 2025-2026 - SKO + Opendeurdag 2025-2026	1	[{"added": {}}]	20	221
2902	2026-02-08 16:00:12.319569+00	1008	SKO + Opendeurdag 2025-2026 - SKO + Opendeurdag 2025-2026	1	[{"added": {}}]	20	221
2903	2026-02-08 16:00:24.423059+00	1009	SKO + Opendeurdag 2025-2026 - SKO + Opendeurdag 2025-2026	1	[{"added": {}}]	20	221
2904	2026-02-08 16:00:34.544152+00	1010	SKO + Opendeurdag 2025-2026 - SKO + Opendeurdag 2025-2026	1	[{"added": {}}]	20	221
2905	2026-02-08 16:00:45.699317+00	1011	SKO + Opendeurdag 2025-2026 - SKO + Opendeurdag 2025-2026	1	[{"added": {}}]	20	221
2906	2026-02-08 16:00:58.664415+00	1012	SKO + Opendeurdag 2025-2026 - SKO + Opendeurdag 2025-2026	1	[{"added": {}}]	20	221
2907	2026-02-08 16:01:13.099033+00	1013	SKO + Opendeurdag 2025-2026 - SKO + Opendeurdag 2025-2026	1	[{"added": {}}]	20	221
2908	2026-02-08 16:01:29.503876+00	1014	SKO + Opendeurdag 2025-2026 - SKO + Opendeurdag 2025-2026	1	[{"added": {}}]	20	221
2909	2026-02-08 16:01:43.033924+00	1015	SKO + Opendeurdag 2025-2026 - SKO + Opendeurdag 2025-2026	1	[{"added": {}}]	20	221
2910	2026-02-08 16:02:43.785502+00	1016	SKO + Opendeurdag 2025-2026 - SKO + Opendeurdag 2025-2026	1	[{"added": {}}]	20	221
2911	2026-02-08 16:04:53.760858+00	1017	SKO + Opendeurdag 2025-2026 - SKO + Opendeurdag 2025-2026	1	[{"added": {}}]	20	221
2912	2026-02-08 16:05:05.728748+00	1018	SKO + Opendeurdag 2025-2026 - SKO + Opendeurdag 2025-2026	1	[{"added": {}}]	20	221
2913	2026-02-08 16:07:29.709743+00	220	Karakoe I 2025	1	[{"added": {}}]	12	221
2914	2026-02-08 16:07:53.249903+00	219	SKO + Opendeurdag 2025	2	[{"changed": {"fields": ["Name"]}}]	12	221
2915	2026-02-08 16:07:58.981118+00	218	MarioKart Toernooi 2025	2	[{"changed": {"fields": ["Name"]}}]	12	221
2916	2026-02-08 16:08:26.792203+00	1019	Karakoe I 2025 - Karakoe I 2025	1	[{"added": {}}]	20	221
2917	2026-02-08 16:08:43.419623+00	1020	Karakoe I 2025 - Karakoe I 2025	1	[{"added": {}}]	20	221
2918	2026-02-08 16:08:55.126657+00	1021	Karakoe I 2025 - Karakoe I 2025	1	[{"added": {}}]	20	221
2919	2026-02-08 16:09:12.070788+00	1022	Karakoe I 2025 - Karakoe I 2025	1	[{"added": {}}]	20	221
2920	2026-02-08 16:09:23.485856+00	1023	Karakoe I 2025 - Karakoe I 2025	1	[{"added": {}}]	20	221
2921	2026-02-08 16:09:35.373222+00	1024	Karakoe I 2025 - Karakoe I 2025	1	[{"added": {}}]	20	221
2922	2026-02-08 16:09:55.544375+00	1025	Karakoe I 2025 - Karakoe I 2025	1	[{"added": {}}]	20	221
2923	2026-02-08 16:10:29.75626+00	1026	Karakoe I 2025 - Karakoe I 2025	1	[{"added": {}}]	20	221
2924	2026-02-08 16:10:43.203996+00	1027	Karakoe I 2025 - Karakoe I 2025	1	[{"added": {}}]	20	221
2925	2026-02-08 16:10:57.106747+00	1028	Karakoe I 2025 - Karakoe I 2025	1	[{"added": {}}]	20	221
2926	2026-02-08 16:11:14.750576+00	1029	Karakoe I 2025 - Karakoe I 2025	1	[{"added": {}}]	20	221
2927	2026-02-08 16:11:33.185285+00	1030	Karakoe I 2025 - Karakoe I 2025	1	[{"added": {}}]	20	221
2928	2026-02-08 16:11:50.785981+00	1031	Karakoe I 2025 - Karakoe I 2025	1	[{"added": {}}]	20	221
2929	2026-02-08 16:12:04.067832+00	1032	Karakoe I 2025 - Karakoe I 2025	1	[{"added": {}}]	20	221
2930	2026-02-08 16:12:22.080819+00	1033	Karakoe I 2025 - Karakoe I 2025	1	[{"added": {}}]	20	221
2931	2026-02-08 16:12:39.878299+00	1034	Karakoe I 2025 - Karakoe I 2025	1	[{"added": {}}]	20	221
2932	2026-02-08 16:12:53.640519+00	1035	Karakoe I 2025 - Karakoe I 2025	1	[{"added": {}}]	20	221
2933	2026-02-08 16:13:04.413455+00	1036	Karakoe I 2025 - Karakoe I 2025	1	[{"added": {}}]	20	221
2934	2026-02-08 16:13:17.945575+00	1037	Karakoe I 2025 - Karakoe I 2025	1	[{"added": {}}]	20	221
2935	2026-02-08 16:13:30.652345+00	1038	Karakoe I 2025 - Karakoe I 2025	1	[{"added": {}}]	20	221
2936	2026-02-08 16:13:47.060589+00	1039	Karakoe I 2025 - Karakoe I 2025	1	[{"added": {}}]	20	221
2937	2026-02-08 16:14:18.08935+00	1040	Karakoe I 2025 - Karakoe I 2025	1	[{"added": {}}]	20	221
2938	2026-02-08 16:14:31.150275+00	1041	Karakoe I 2025 - Karakoe I 2025	1	[{"added": {}}]	20	221
2939	2026-02-08 16:14:50.068397+00	1042	Karakoe I 2025 - Karakoe I 2025	1	[{"added": {}}]	20	221
2940	2026-02-08 16:15:00.934173+00	1043	Karakoe I 2025 - Karakoe I 2025	1	[{"added": {}}]	20	221
2941	2026-02-08 16:15:11.363521+00	1044	Karakoe I 2025 - Karakoe I 2025	1	[{"added": {}}]	20	221
2942	2026-02-08 16:15:23.878971+00	1045	Karakoe I 2025 - Karakoe I 2025	1	[{"added": {}}]	20	221
2943	2026-02-08 16:15:42.089426+00	1046	Karakoe I 2025 - Karakoe I 2025	1	[{"added": {}}]	20	221
2944	2026-02-08 16:20:12.971042+00	221	Halloween Clubavond	1	[{"added": {}}]	12	221
2945	2026-02-08 16:20:23.655652+00	1047	Halloween Clubavond - Halloween Clubavond	1	[{"added": {}}]	20	221
2946	2026-02-08 16:20:41.498076+00	221	Halloween Clubavond 2025	2	[{"changed": {"fields": ["Name"]}}]	12	221
2947	2026-02-08 16:20:55.735562+00	1048	Halloween Clubavond 2025 - Halloween Clubavond 2025	1	[{"added": {}}]	20	221
2949	2026-02-08 16:21:39.259981+00	1050	Halloween Clubavond 2025 - Halloween Clubavond 2025	1	[{"added": {}}]	20	221
2951	2026-02-08 16:22:07.96558+00	1052	Halloween Clubavond 2025 - Halloween Clubavond 2025	1	[{"added": {}}]	20	221
2952	2026-02-08 16:22:36.554712+00	1053	Halloween Clubavond 2025 - Halloween Clubavond 2025	1	[{"added": {}}]	20	221
2954	2026-02-08 16:23:04.277096+00	1055	Halloween Clubavond 2025 - Halloween Clubavond 2025	1	[{"added": {}}]	20	221
2948	2026-02-08 16:21:16.251263+00	1049	Halloween Clubavond 2025 - Halloween Clubavond 2025	1	[{"added": {}}]	20	221
2950	2026-02-08 16:21:54.400309+00	1051	Halloween Clubavond 2025 - Halloween Clubavond 2025	1	[{"added": {}}]	20	221
2953	2026-02-08 16:22:53.692757+00	1054	Halloween Clubavond 2025 - Halloween Clubavond 2025	1	[{"added": {}}]	20	221
2955	2026-02-08 17:37:21.078524+00	222	Studentenverenigingen 101	1	[{"added": {}}]	12	221
2956	2026-02-08 17:37:43.372644+00	221	Halloween Clubavond 2025	2	[{"changed": {"fields": ["Order"]}}]	12	221
2957	2026-02-08 17:38:39.999353+00	222	Studentenverenigingen 101- 2025	2	[{"changed": {"fields": ["Name"]}}]	12	221
2958	2026-02-08 17:39:01.617696+00	1056	Studentenverenigingen 101- 2025 - Studentenverenigingen 101- 2025	1	[{"added": {}}]	20	221
2959	2026-02-08 17:39:24.93676+00	1057	Studentenverenigingen 101- 2025 - Studentenverenigingen 101- 2025	1	[{"added": {}}]	20	221
2960	2026-02-08 17:39:50.711613+00	1058	Studentenverenigingen 101- 2025 - Studentenverenigingen 101- 2025	1	[{"added": {}}]	20	221
2961	2026-02-08 17:40:04.489041+00	1059	Studentenverenigingen 101- 2025 - Studentenverenigingen 101- 2025	1	[{"added": {}}]	20	221
2962	2026-02-08 17:40:15.315085+00	1060	Studentenverenigingen 101- 2025 - Studentenverenigingen 101- 2025	1	[{"added": {}}]	20	221
2963	2026-02-08 17:40:34.705293+00	1061	Studentenverenigingen 101- 2025 - Studentenverenigingen 101- 2025	1	[{"added": {}}]	20	221
2964	2026-02-08 17:40:46.001289+00	1062	Studentenverenigingen 101- 2025 - Studentenverenigingen 101- 2025	1	[{"added": {}}]	20	221
2965	2026-02-08 17:40:58.904548+00	1063	Studentenverenigingen 101- 2025 - Studentenverenigingen 101- 2025	1	[{"added": {}}]	20	221
2966	2026-02-08 17:41:12.299111+00	1064	Studentenverenigingen 101- 2025 - Studentenverenigingen 101- 2025	1	[{"added": {}}]	20	221
2967	2026-02-08 17:41:29.147409+00	1065	Studentenverenigingen 101- 2025 - Studentenverenigingen 101- 2025	1	[{"added": {}}]	20	221
2968	2026-02-08 17:41:41.935956+00	1066	Studentenverenigingen 101- 2025 - Studentenverenigingen 101- 2025	1	[{"added": {}}]	20	221
2969	2026-02-08 17:41:53.866896+00	1067	Studentenverenigingen 101- 2025 - Studentenverenigingen 101- 2025	1	[{"added": {}}]	20	221
2970	2026-02-08 17:42:08.973229+00	1068	Studentenverenigingen 101- 2025 - Studentenverenigingen 101- 2025	1	[{"added": {}}]	20	221
2971	2026-02-08 17:42:21.517541+00	1069	Studentenverenigingen 101- 2025 - Studentenverenigingen 101- 2025	1	[{"added": {}}]	20	221
2972	2026-02-08 17:42:40.191883+00	1070	Studentenverenigingen 101- 2025 - Studentenverenigingen 101- 2025	1	[{"added": {}}]	20	221
2973	2026-02-08 17:42:52.910316+00	1071	Studentenverenigingen 101- 2025 - Studentenverenigingen 101- 2025	1	[{"added": {}}]	20	221
2974	2026-02-08 17:43:01.473279+00	1072	Studentenverenigingen 101- 2025 - Studentenverenigingen 101- 2025	1	[{"added": {}}]	20	221
2975	2026-02-08 17:43:16.234511+00	1073	Studentenverenigingen 101- 2025 - Studentenverenigingen 101- 2025	1	[{"added": {}}]	20	221
2976	2026-02-08 17:44:33.660483+00	222	Studentenverenigingen 101 2025	2	[{"changed": {"fields": ["Name"]}}]	12	221
2977	2026-02-08 17:46:30.765882+00	223	Nadoop + Sinterklaas 2025	1	[{"added": {}}]	12	221
2978	2026-02-08 17:46:48.139695+00	224	Schaatsen 2025	1	[{"added": {}}]	12	221
2979	2026-02-08 21:22:50.101262+00	225	Baseball	1	[{"added": {}}]	12	221
2980	2026-02-08 21:24:11.0302+00	1074	Nadoop + Sinterklaas 2025 - Nadoop + Sinterklaas 2025	1	[{"added": {}}]	20	221
2981	2026-02-08 21:24:52.899418+00	1075	Nadoop + Sinterklaas 2025 - Nadoop + Sinterklaas 2025	1	[{"added": {}}]	20	221
2982	2026-02-08 21:25:08.091405+00	1076	Nadoop + Sinterklaas 2025 - Nadoop + Sinterklaas 2025	1	[{"added": {}}]	20	221
2983	2026-02-08 21:25:22.266092+00	1077	Nadoop + Sinterklaas 2025 - Nadoop + Sinterklaas 2025	1	[{"added": {}}]	20	221
2984	2026-02-08 21:25:52.737513+00	1078	Nadoop + Sinterklaas 2025 - Nadoop + Sinterklaas 2025	1	[{"added": {}}]	20	221
2985	2026-02-08 21:26:06.83861+00	1079	Nadoop + Sinterklaas 2025 - Nadoop + Sinterklaas 2025	1	[{"added": {}}]	20	221
2986	2026-02-08 21:26:19.772336+00	1080	Nadoop + Sinterklaas 2025 - Nadoop + Sinterklaas 2025	1	[{"added": {}}]	20	221
2987	2026-02-08 21:26:33.933346+00	1081	Nadoop + Sinterklaas 2025 - Nadoop + Sinterklaas 2025	1	[{"added": {}}]	20	221
2988	2026-02-08 21:26:53.412009+00	1082	Nadoop + Sinterklaas 2025 - Nadoop + Sinterklaas 2025	1	[{"added": {}}]	20	221
2989	2026-02-08 21:27:04.455266+00	1083	Nadoop + Sinterklaas 2025 - Nadoop + Sinterklaas 2025	1	[{"added": {}}]	20	221
2990	2026-02-08 21:27:20.425418+00	1084	Nadoop + Sinterklaas 2025 - Nadoop + Sinterklaas 2025	1	[{"added": {}}]	20	221
2991	2026-02-08 21:27:32.870318+00	1085	Nadoop + Sinterklaas 2025 - Nadoop + Sinterklaas 2025	1	[{"added": {}}]	20	221
2992	2026-02-08 21:27:52.784119+00	1086	Nadoop + Sinterklaas 2025 - Nadoop + Sinterklaas 2025	1	[{"added": {}}]	20	221
2993	2026-02-08 21:28:09.232286+00	1087	Nadoop + Sinterklaas 2025 - Nadoop + Sinterklaas 2025	1	[{"added": {}}]	20	221
2994	2026-02-08 21:28:24.238515+00	1088	Nadoop + Sinterklaas 2025 - Nadoop + Sinterklaas 2025	1	[{"added": {}}]	20	221
2995	2026-02-08 21:28:44.900205+00	1089	Nadoop + Sinterklaas 2025 - Nadoop + Sinterklaas 2025	1	[{"added": {}}]	20	221
2996	2026-02-08 21:29:10.62664+00	1090	Nadoop + Sinterklaas 2025 - Nadoop + Sinterklaas 2025	1	[{"added": {}}]	20	221
2997	2026-02-08 21:29:37.433652+00	1091	Nadoop + Sinterklaas 2025 - Nadoop + Sinterklaas 2025	1	[{"added": {}}]	20	221
2998	2026-02-08 21:29:52.483155+00	1092	Nadoop + Sinterklaas 2025 - Nadoop + Sinterklaas 2025	1	[{"added": {}}]	20	221
2999	2026-02-08 21:30:10.853317+00	1093	Nadoop + Sinterklaas 2025 - Nadoop + Sinterklaas 2025	1	[{"added": {}}]	20	221
3000	2026-02-08 21:30:27.05767+00	1094	Nadoop + Sinterklaas 2025 - Nadoop + Sinterklaas 2025	1	[{"added": {}}]	20	221
3001	2026-02-08 21:30:42.970541+00	1095	Nadoop + Sinterklaas 2025 - Nadoop + Sinterklaas 2025	1	[{"added": {}}]	20	221
3002	2026-02-08 21:30:55.706495+00	1096	Nadoop + Sinterklaas 2025 - Nadoop + Sinterklaas 2025	1	[{"added": {}}]	20	221
3003	2026-02-08 21:31:09.408798+00	1097	Nadoop + Sinterklaas 2025 - Nadoop + Sinterklaas 2025	1	[{"added": {}}]	20	221
3004	2026-02-08 21:31:23.024248+00	1098	Nadoop + Sinterklaas 2025 - Nadoop + Sinterklaas 2025	1	[{"added": {}}]	20	221
3005	2026-02-08 21:31:40.930665+00	1099	Nadoop + Sinterklaas 2025 - Nadoop + Sinterklaas 2025	1	[{"added": {}}]	20	221
3006	2026-02-08 21:31:54.009236+00	1100	Nadoop + Sinterklaas 2025 - Nadoop + Sinterklaas 2025	1	[{"added": {}}]	20	221
3007	2026-02-08 21:32:04.341481+00	1101	Nadoop + Sinterklaas 2025 - Nadoop + Sinterklaas 2025	1	[{"added": {}}]	20	221
3008	2026-02-08 21:32:21.05925+00	1102	Nadoop + Sinterklaas 2025 - Nadoop + Sinterklaas 2025	1	[{"added": {}}]	20	221
3009	2026-02-08 21:32:30.590307+00	1103	Nadoop + Sinterklaas 2025 - Nadoop + Sinterklaas 2025	1	[{"added": {}}]	20	221
3010	2026-02-08 21:33:09.229867+00	1104	Schaatsen 2025 - Schaatsen 2025	1	[{"added": {}}]	20	221
3011	2026-02-08 21:33:29.710845+00	1105	Schaatsen 2025 - Schaatsen 2025	1	[{"added": {}}]	20	221
3012	2026-02-08 21:33:47.117112+00	1106	Schaatsen 2025 - Schaatsen 2025	1	[{"added": {}}]	20	221
3013	2026-02-08 21:34:09.864261+00	1107	Schaatsen 2025 - Schaatsen 2025	1	[{"added": {}}]	20	221
3014	2026-02-08 21:34:24.924287+00	1108	Schaatsen 2025 - Schaatsen 2025	1	[{"added": {}}]	20	221
3018	2026-02-08 21:35:26.195855+00	1112	Schaatsen 2025 - Schaatsen 2025	1	[{"added": {}}]	20	221
3015	2026-02-08 21:34:37.846337+00	1109	Schaatsen 2025 - Schaatsen 2025	1	[{"added": {}}]	20	221
3016	2026-02-08 21:34:55.493984+00	1110	Schaatsen 2025 - Schaatsen 2025	1	[{"added": {}}]	20	221
3017	2026-02-08 21:35:12.440307+00	1111	Schaatsen 2025 - Schaatsen 2025	1	[{"added": {}}]	20	221
3019	2026-02-08 21:35:42.100423+00	1113	Schaatsen 2025 - Schaatsen 2025	1	[{"added": {}}]	20	221
3020	2026-02-08 21:35:57.344941+00	1114	Schaatsen 2025 - Schaatsen 2025	1	[{"added": {}}]	20	221
3021	2026-02-08 21:36:07.577268+00	1115	Schaatsen 2025 - Schaatsen 2025	1	[{"added": {}}]	20	221
3022	2026-02-08 21:36:23.030128+00	1116	Schaatsen 2025 - Schaatsen 2025	1	[{"added": {}}]	20	221
3023	2026-02-08 21:36:39.50615+00	1117	Schaatsen 2025 - Schaatsen 2025	1	[{"added": {}}]	20	221
3024	2026-02-08 21:36:56.617701+00	1118	Schaatsen 2025 - Schaatsen 2025	1	[{"added": {}}]	20	221
3025	2026-02-08 21:37:13.982965+00	1119	Schaatsen 2025 - Schaatsen 2025	1	[{"added": {}}]	20	221
3026	2026-02-08 21:37:29.896462+00	1120	Schaatsen 2025 - Schaatsen 2025	1	[{"added": {}}]	20	221
3027	2026-02-08 21:37:38.482763+00	1121	Schaatsen 2025 - Schaatsen 2025	1	[{"added": {}}]	20	221
3028	2026-02-08 21:37:50.805868+00	1122	Schaatsen 2025 - Schaatsen 2025	1	[{"added": {}}]	20	221
3029	2026-02-08 21:38:27.691518+00	1123	Schaatsen 2025 - Schaatsen 2025	1	[{"added": {}}]	20	221
3030	2026-02-08 21:38:46.235746+00	1124	Schaatsen 2025 - Schaatsen 2025	1	[{"added": {}}]	20	221
3031	2026-02-08 21:39:08.805691+00	1125	Schaatsen 2025 - Schaatsen 2025	1	[{"added": {}}]	20	221
3032	2026-02-08 21:39:33.852225+00	1126	Schaatsen 2025 - Schaatsen 2025	1	[{"added": {}}]	20	221
3033	2026-02-08 21:40:34.64782+00	1127	Schaatsen 2025 - Schaatsen 2025	1	[{"added": {}}]	20	221
3034	2026-02-08 21:41:34.020099+00	1128	Nadoop + Sinterklaas 2025 - Nadoop + Sinterklaas 2025	1	[{"added": {}}]	20	221
3035	2026-02-08 21:41:54.086057+00	1129	Nadoop + Sinterklaas 2025 - Nadoop + Sinterklaas 2025	1	[{"added": {}}]	20	221
3036	2026-02-08 21:42:10.308302+00	1130	Nadoop + Sinterklaas 2025 - Nadoop + Sinterklaas 2025	1	[{"added": {}}]	20	221
3037	2026-02-08 21:42:31.213809+00	1131	Nadoop + Sinterklaas 2025 - Nadoop + Sinterklaas 2025	1	[{"added": {}}]	20	221
3038	2026-02-08 21:42:45.370418+00	1132	Nadoop + Sinterklaas 2025 - Nadoop + Sinterklaas 2025	1	[{"added": {}}]	20	221
3039	2026-02-08 21:43:01.176653+00	1133	Nadoop + Sinterklaas 2025 - Nadoop + Sinterklaas 2025	1	[{"added": {}}]	20	221
3040	2026-02-08 21:43:14.550863+00	1134	Nadoop + Sinterklaas 2025 - Nadoop + Sinterklaas 2025	1	[{"added": {}}]	20	221
3041	2026-02-08 21:43:31.353458+00	1135	Nadoop + Sinterklaas 2025 - Nadoop + Sinterklaas 2025	1	[{"added": {}}]	20	221
3042	2026-02-08 21:43:48.549941+00	1136	Nadoop + Sinterklaas 2025 - Nadoop + Sinterklaas 2025	1	[{"added": {}}]	20	221
3043	2026-02-08 21:44:30.055491+00	225	Baseball 2025	2	[{"changed": {"fields": ["Name"]}}]	12	221
3044	2026-02-08 21:44:49.95755+00	1137	Baseball 2025 - Baseball 2025	1	[{"added": {}}]	20	221
3045	2026-02-08 21:46:37.335518+00	1138	Baseball 2025 - Baseball 2025	1	[{"added": {}}]	20	221
3046	2026-02-08 21:46:52.617282+00	1139	Baseball 2025 - Baseball 2025	1	[{"added": {}}]	20	221
3047	2026-02-08 21:47:18.583574+00	1140	Baseball 2025 - Baseball 2025	1	[{"added": {}}]	20	221
3048	2026-02-08 21:47:33.971202+00	1141	Baseball 2025 - Baseball 2025	1	[{"added": {}}]	20	221
3049	2026-02-08 21:47:53.445005+00	1142	Baseball 2025 - Baseball 2025	1	[{"added": {}}]	20	221
3050	2026-02-08 21:48:07.349317+00	1143	Baseball 2025 - Baseball 2025	1	[{"added": {}}]	20	221
3051	2026-02-08 21:48:18.159329+00	1144	Baseball 2025 - Baseball 2025	1	[{"added": {}}]	20	221
3052	2026-02-08 21:48:33.93735+00	1145	Baseball 2025 - Baseball 2025	1	[{"added": {}}]	20	221
3053	2026-02-08 21:48:44.245497+00	1146	Baseball 2025 - Baseball 2025	1	[{"added": {}}]	20	221
3054	2026-02-08 21:48:59.752659+00	1147	Baseball 2025 - Baseball 2025	1	[{"added": {}}]	20	221
3055	2026-02-08 21:49:09.502542+00	1148	Baseball 2025 - Baseball 2025	1	[{"added": {}}]	20	221
3056	2026-02-10 18:42:33.240353+00	589	Pizza & Boardgames	1	[{"added": {}}]	23	221
3089	2026-02-19 18:20:19.921092+00	622	Escape Room	1	[{"added": {}}]	23	221
3122	2026-03-02 19:56:11.385726+00	655	The Feast of Valhalla: Cocktailfeestje II	1	[{"added": {}}]	23	221
3123	2026-03-05 18:10:30.689212+00	8	schachtentemmer@heimdal.be	2	[{"changed": {"fields": ["Groups"]}}]	4	2
3124	2026-03-05 18:21:21.199286+00	1000	MarioKart Toernooi 2025 - MarioKart Toernooi 2025-2026	3		20	8
3125	2026-03-05 18:29:08.08589+00	972	MarioKart Toernooi 2025 - MarioKart Toernooi 2025-2026	3		20	8
3126	2026-03-05 18:30:04.778295+00	980	MarioKart Toernooi 2025 - MarioKart Toernooi 2025-2026	3		20	8
3127	2026-03-05 18:31:38.404223+00	981	MarioKart Toernooi 2025 - MarioKart Toernooi 2025-2026	3		20	8
3128	2026-03-05 18:33:04.147477+00	996	MarioKart Toernooi 2025 - MarioKart Toernooi 2025-2026	3		20	8
3129	2026-03-05 18:40:31.122444+00	1058	Studentenverenigingen 101 2025 - Studentenverenigingen 101- 2025	3		20	8
3130	2026-03-05 18:41:04.032497+00	1065	Studentenverenigingen 101 2025 - Studentenverenigingen 101- 2025	3		20	8
3131	2026-03-05 18:42:37.279206+00	1071	Studentenverenigingen 101 2025 - Studentenverenigingen 101- 2025	3		20	8
3132	2026-03-05 18:43:24.856998+00	1070	Studentenverenigingen 101 2025 - Studentenverenigingen 101- 2025	3		20	8
3133	2026-03-05 18:43:24.859308+00	1069	Studentenverenigingen 101 2025 - Studentenverenigingen 101- 2025	3		20	8
3134	2026-03-05 18:43:50.687888+00	1068	Studentenverenigingen 101 2025 - Studentenverenigingen 101- 2025	3		20	8
3135	2026-03-05 18:54:18.111872+00	1030	Karakoe I 2025 - Karakoe I 2025	3		20	8
3136	2026-03-05 18:54:20.957269+00	1031	Karakoe I 2025 - Karakoe I 2025	3		20	8
3137	2026-03-05 18:56:19.035653+00	1048	Halloween Clubavond 2025 - Halloween Clubavond 2025	3		20	8
3138	2026-03-05 18:56:19.037605+00	1047	Halloween Clubavond 2025 - Halloween Clubavond	3		20	8
3139	2026-03-05 19:01:34.682083+00	1085	Nadoop + Sinterklaas 2025 - Nadoop + Sinterklaas 2025	3		20	8
3140	2026-03-05 19:01:34.692764+00	1084	Nadoop + Sinterklaas 2025 - Nadoop + Sinterklaas 2025	3		20	8
3141	2026-03-05 19:19:09.323941+00	1099	Nadoop + Sinterklaas 2025 - Nadoop + Sinterklaas 2025	3		20	8
3142	2026-03-05 19:19:09.328526+00	1098	Nadoop + Sinterklaas 2025 - Nadoop + Sinterklaas 2025	3		20	8
3143	2026-03-05 19:19:09.330516+00	1093	Nadoop + Sinterklaas 2025 - Nadoop + Sinterklaas 2025	3		20	8
3144	2026-03-05 20:07:52.526526+00	1127	Schaatsen 2025 - Schaatsen 2025	3		20	8
3145	2026-03-05 20:07:52.530831+00	1125	Schaatsen 2025 - Schaatsen 2025	3		20	8
3146	2026-03-05 20:07:52.533089+00	1122	Schaatsen 2025 - Schaatsen 2025	3		20	8
3147	2026-03-05 20:07:52.534715+00	1119	Schaatsen 2025 - Schaatsen 2025	3		20	8
3148	2026-03-05 20:07:52.536181+00	1117	Schaatsen 2025 - Schaatsen 2025	3		20	8
3149	2026-03-05 20:07:52.537539+00	1109	Schaatsen 2025 - Schaatsen 2025	3		20	8
3150	2026-03-05 20:07:52.538901+00	1107	Schaatsen 2025 - Schaatsen 2025	3		20	8
3151	2026-03-05 20:07:52.540077+00	1106	Schaatsen 2025 - Schaatsen 2025	3		20	8
3154	2026-03-07 20:33:59.156049+00	657	HOGENT Dodgeball Toernooi	1	[{"added": {}}]	23	221
3155	2026-03-14 11:47:07.682855+00	658	Schachtenevent: The Dragon Trapper	1	[{"added": {}}]	23	221
3156	2026-03-16 18:03:31.678384+00	659	Movie Night II	1	[{"added": {}}]	23	221
3157	2026-03-22 18:07:45.527866+00	660	Pasen clubavond	1	[{"added": {}}]	23	221
3158	2026-03-23 14:55:53.945714+00	657	HOGENT Dodgeball Toernooi	2	[{"changed": {"fields": ["Poster"]}}]	23	7
3159	2026-04-01 06:25:59.323161+00	280	2025 - 2026 Cultuur	2	[{"changed": {"fields": ["Photo"]}}]	19	2
3160	2026-04-01 06:27:39.986013+00	174	2024 - 2025 Cultuur	2	[{"changed": {"fields": ["Photo"]}}]	19	2
3161	2026-04-01 06:28:20.431844+00	174	2024 - 2025 Cultuur	2	[{"changed": {"fields": ["Photo"]}}]	19	2
3162	2026-04-01 06:28:51.713187+00	283	2025 - 2026 ICT	2	[{"changed": {"fields": ["Photo"]}}]	19	2
3163	2026-04-01 06:29:23.021154+00	278	2025 - 2026 Media	2	[{"changed": {"fields": ["Photo"]}}]	19	2
3164	2026-04-01 06:33:28.821719+00	276	2025 - 2026 Secretaris	2	[{"changed": {"fields": ["Photo"]}}]	19	2
3165	2026-04-01 06:33:59.678069+00	275	2025 - 2026 Quaestor	2	[{"changed": {"fields": ["Photo"]}}]	19	2
3166	2026-04-01 06:34:19.277378+00	274	2025 - 2026 Praeses	2	[{"changed": {"fields": ["Photo"]}}]	19	2
3167	2026-04-01 06:34:38.803739+00	279	2025 - 2026 Schachtentemmer	2	[{"changed": {"fields": ["Photo"]}}]	19	2
3168	2026-04-01 06:34:59.703897+00	282	2025 - 2026 Feest & LAN	2	[{"changed": {"fields": ["Photo"]}}]	19	2
3169	2026-04-01 06:35:51.874356+00	281	2025 - 2026 Sport	2	[{"changed": {"fields": ["Photo"]}}]	19	2
3170	2026-04-01 06:48:00.68946+00	174	2024 - 2025 Cultuur	2	[]	19	2
3171	2026-04-01 06:50:47.751481+00	280	2025 - 2026 Cultuur	2	[{"changed": {"fields": ["Photo"]}}]	19	2
3172	2026-04-02 07:23:50.477671+00	280	2025 - 2026 Cultuur	2	[{"changed": {"fields": ["Photo"]}}]	19	2
3173	2026-04-02 07:24:09.821664+00	282	2025 - 2026 Feest & LAN	2	[{"changed": {"fields": ["Photo"]}}]	19	2
3174	2026-04-02 07:24:24.386146+00	283	2025 - 2026 ICT	2	[{"changed": {"fields": ["Photo"]}}]	19	2
3175	2026-04-02 07:24:39.853693+00	275	2025 - 2026 Quaestor	2	[{"changed": {"fields": ["Photo"]}}]	19	2
3176	2026-04-02 07:24:52.105987+00	275	2025 - 2026 Quaestor	2	[{"changed": {"fields": ["Photo"]}}]	19	2
3177	2026-04-02 07:25:06.798949+00	274	2025 - 2026 Praeses	2	[{"changed": {"fields": ["Photo"]}}]	19	2
3178	2026-04-02 07:25:19.205322+00	281	2025 - 2026 Sport	2	[{"changed": {"fields": ["Photo"]}}]	19	2
3179	2026-04-02 07:25:41.937795+00	279	2025 - 2026 Schachtentemmer	2	[{"changed": {"fields": ["Photo"]}}]	19	2
3180	2026-04-02 07:25:55.998781+00	278	2025 - 2026 Media	2	[{"changed": {"fields": ["Photo"]}}]	19	2
3181	2026-04-02 07:26:12.95772+00	277	2025 - 2026 PR	2	[]	19	2
3182	2026-04-02 07:26:59.043566+00	276	2025 - 2026 Secretaris	2	[{"changed": {"fields": ["Photo"]}}]	19	2
3183	2026-04-02 07:27:20.080362+00	275	2025 - 2026 Quaestor	2	[{"changed": {"fields": ["Photo"]}}]	19	2
3184	2026-04-07 17:30:44.001613+00	661	Karakoe II	1	[{"added": {}}]	23	221
3185	2026-04-08 18:08:27.765006+00	662	Ontgroening: Attacking the Dragon's Lair	1	[{"added": {}}]	23	8
3218	2026-04-10 17:20:00.892769+00	695	Verkiezingen 2026-2027	1	[{"added": {}}]	23	221
3251	2026-04-14 17:00:35.934643+00	728	Heimdal Quiz	1	[{"added": {}}]	23	221
3252	2026-04-14 17:01:33.567852+00	662	Ontgroening: Attacking the Dragon's Lair	2	[{"changed": {"fields": ["Description"]}}]	23	221
3253	2026-04-17 17:19:10.301865+00	174	2024 - 2025 Cultuur	2	[{"changed": {"fields": ["Photo"]}}]	19	2
3254	2026-04-22 16:26:09.840254+00	662	Ontgroening: Attacking the Dragon's Lair	2	[{"changed": {"fields": ["Description"]}}]	23	221
3255	2026-04-22 16:26:10.323161+00	662	Ontgroening: Attacking the Dragon's Lair	2	[{"changed": {"fields": ["Description"]}}]	23	221
3256	2026-04-22 16:26:10.958111+00	662	Ontgroening: Attacking the Dragon's Lair	2	[]	23	221
3257	2026-04-22 16:26:11.199363+00	662	Ontgroening: Attacking the Dragon's Lair	2	[]	23	221
3258	2026-04-22 16:26:11.602213+00	662	Ontgroening: Attacking the Dragon's Lair	2	[]	23	221
3259	2026-04-22 16:27:42.094863+00	662	Ontgroening: Attacking the Dragon's Lair	2	[{"changed": {"fields": ["Poster"]}}]	23	221
3260	2026-04-22 17:59:31.452491+00	729	Magic: The Gathering	1	[{"added": {}}]	23	221
3261	2026-04-22 17:59:32.340012+00	730	Magic: The Gathering	1	[{"added": {}}]	23	221
3262	2026-04-23 18:12:27.660433+00	731	Bowling	1	[{"added": {}}]	23	221
3263	2026-04-30 08:31:08.922003+00	731	Bowling	2	[{"changed": {"fields": ["Description", "End"]}}]	23	7
3264	2026-05-04 17:59:18.445129+00	732	Heimdal Potluck	1	[{"added": {}}]	23	221
3265	2026-05-05 09:41:17.59198+00	730	Magic: The Gathering	3		23	2
3266	2026-05-12 12:10:34.245928+00	68	Derde Ronde '26-'27	1	[{"added": {}}]	8	2
3267	2026-05-12 12:10:49.706821+00	68	Derde Ronde '26-'27: Praeses	1	[{"added": {}}]	16	2
3268	2026-05-12 12:11:29.13039+00	67	Derde Ronde '26-'27: Praeses - Simon Tytgat	1	[{"added": {}}]	24	2
3269	2026-05-12 12:11:42.412151+00	68	Derde Ronde '26-'27: Praeses - Richy Rahman	1	[{"added": {}}]	24	2
3270	2026-05-12 12:13:41.446073+00	329	yoran-ollevier	2	[{"changed": {"fields": ["password"]}}]	4	2
3271	2026-05-12 12:14:49.602379+00	329	yoran-ollevier	2	[{"changed": {"fields": ["Groups", "Last login"]}}]	4	2
3272	2026-05-12 12:15:48.773788+00	379	Reina	2	[{"changed": {"fields": ["Groups"]}}]	4	2
3273	2026-05-12 12:16:05.462162+00	332	SanderDeBruyker	2	[{"changed": {"fields": ["Groups"]}}]	4	2
3274	2026-05-12 12:16:20.886415+00	380	hayley.rasschaert	2	[{"changed": {"fields": ["Groups"]}}]	4	2
3275	2026-05-12 12:21:19.271754+00	329	yoran-ollevier	2	[{"changed": {"fields": ["User permissions"]}}]	4	2
3276	2026-05-12 12:22:09.839069+00	329	yoran-ollevier	2	[{"changed": {"fields": ["Staff status"]}}]	4	2
3277	2026-05-12 12:22:40.160412+00	329	yoran-ollevier	2	[{"changed": {"fields": ["Groups"]}}]	4	2
3278	2026-05-12 12:23:09.83872+00	329	yoran-ollevier	2	[{"changed": {"fields": ["Staff status", "Groups", "User permissions"]}}]	4	2
3279	2026-05-12 12:24:23.845525+00	329	yoran-ollevier	2	[{"changed": {"fields": ["Staff status"]}}]	4	2
3280	2026-05-12 12:25:39.873193+00	329	yoran-ollevier	2	[{"changed": {"fields": ["User permissions", "Last login"]}}]	4	2
3281	2026-05-12 12:26:27.651978+00	329	yoran-ollevier	2	[{"changed": {"fields": ["User permissions"]}}]	4	2
3282	2026-05-12 12:26:45.540749+00	329	yoran-ollevier	2	[{"changed": {"fields": ["User permissions"]}}]	4	2
3283	2026-05-12 12:27:18.492598+00	332	SanderDeBruyker	2	[{"changed": {"fields": ["User permissions"]}}]	4	2
3284	2026-05-12 12:27:39.144744+00	380	hayley.rasschaert	2	[{"changed": {"fields": ["User permissions"]}}]	4	2
3285	2026-05-12 12:27:58.564416+00	379	Reina	2	[{"changed": {"fields": ["User permissions"]}}]	4	2
3286	2026-05-12 12:28:31.581118+00	379	Reina	2	[{"changed": {"fields": ["Staff status"]}}]	4	2
3287	2026-05-12 12:28:41.878078+00	332	SanderDeBruyker	2	[{"changed": {"fields": ["Staff status"]}}]	4	2
3288	2026-05-12 12:28:50.967525+00	380	hayley.rasschaert	2	[{"changed": {"fields": ["Staff status"]}}]	4	2
3289	2026-05-12 12:43:26.019051+00	329	yoran-ollevier	2	[{"changed": {"fields": ["Staff status", "Groups", "User permissions"]}}]	4	2
3290	2026-05-12 13:09:10.64011+00	686	Test Account	2	[{"changed": {"fields": ["Role"]}}]	18	332
3291	2026-05-12 13:20:01.299159+00	686	Test Account	2	[{"changed": {"fields": ["Role", "Election active"]}}]	18	332
3292	2026-05-12 13:20:18.883318+00	686	Test Account	2	[{"changed": {"fields": ["Status"]}}]	18	332
3293	2026-05-12 13:21:48.651352+00	686	Test Account	2	[{"changed": {"fields": ["Status", "Role", "Election active"]}}]	18	332
3326	2026-05-15 18:27:13.129456+00	726	Axelle Ducouran	2	[{"changed": {"fields": ["Role"]}}]	18	379
3327	2026-05-15 18:28:36.463839+00	725	Marwan Elkhallouki	2	[{"changed": {"fields": ["Role"]}}]	18	379
3328	2026-05-15 18:28:53.496536+00	724	Jonah Van den Brandt	2	[{"changed": {"fields": ["Role"]}}]	18	379
3329	2026-05-15 18:29:01.674189+00	723	Robbe Van Droogenbroeck	2	[{"changed": {"fields": ["Role"]}}]	18	379
3330	2026-05-15 18:29:13.237551+00	721	Tine Van Nevel	2	[{"changed": {"fields": ["Role"]}}]	18	379
3331	2026-05-15 18:29:29.49281+00	720	Shanty Laureyns	2	[{"changed": {"fields": ["Role"]}}]	18	379
3332	2026-05-15 18:29:36.360312+00	719	Mauro Maratta	2	[{"changed": {"fields": ["Role"]}}]	18	379
3333	2026-05-15 18:29:47.3231+00	685	Toon Dendoncker	2	[{"changed": {"fields": ["Role"]}}]	18	379
3334	2026-05-15 18:29:55.843638+00	585	Ann-Sofie Stevens	2	[{"changed": {"fields": ["Role"]}}]	18	379
3335	2026-05-15 18:30:03.918443+00	552	Milan Dhondt	2	[{"changed": {"fields": ["Role"]}}]	18	379
3336	2026-05-15 18:30:15.640148+00	551	Wout Lesschaeve	2	[{"changed": {"fields": ["Role"]}}]	18	379
3337	2026-05-15 18:30:42.718019+00	451	Demi Eller	2	[{"changed": {"fields": ["Role"]}}]	18	379
3338	2026-05-15 18:30:54.011668+00	383	Wout Hancart	2	[{"changed": {"fields": ["Role"]}}]	18	379
3339	2026-05-15 18:31:01.322873+00	382	Amber De Kinder	2	[{"changed": {"fields": ["Role"]}}]	18	379
3340	2026-05-15 18:31:10.081202+00	294	Jasper Van der Stichelen	2	[{"changed": {"fields": ["Role"]}}]	18	379
3341	2026-05-21 13:48:43.442056+00	735	kobe maebe	2	[{"changed": {"fields": ["Role"]}}]	18	379
3342	2026-05-21 13:48:48.290907+00	734	Sybren Windels	2	[{"changed": {"fields": ["Role"]}}]	18	379
3343	2026-05-21 13:48:52.524606+00	732	Ann-Sofie Stevens	2	[{"changed": {"fields": ["Role"]}}]	18	379
3344	2026-05-21 13:48:57.076807+00	731	Ruben Colson	2	[{"changed": {"fields": ["Role"]}}]	18	379
3345	2026-05-21 13:49:00.405275+00	729	Vincent Minjauw	2	[{"changed": {"fields": ["Role"]}}]	18	379
3346	2026-05-21 13:49:05.701676+00	728	Aureline Van der Plaetsen	2	[{"changed": {"fields": ["Role"]}}]	18	379
3347	2026-05-21 19:14:09.147889+00	216	Brittney001	2	[{"changed": {"fields": ["password"]}}]	4	2
3348	2026-05-22 12:26:38.520039+00	225	 	2	[{"changed": {"fields": ["Votes"]}}]	18	332
3349	2026-05-22 12:26:47.45372+00	111	 	2	[{"changed": {"fields": ["Votes"]}}]	18	332
3350	2026-05-22 12:26:59.868971+00	733	Nele Vandemaele	2	[{"changed": {"fields": ["Role"]}}]	18	332
3351	2026-05-22 12:27:33.997952+00	550	 	2	[{"changed": {"fields": ["Role"]}}]	18	332
3352	2026-05-22 12:27:56.244408+00	146	 	2	[{"changed": {"fields": ["Votes"]}}]	18	332
3353	2026-05-22 12:28:14.318817+00	735	kobe maebe	2	[{"changed": {"fields": ["Votes"]}}]	18	332
3354	2026-05-22 12:28:24.211391+00	726	Axelle Ducouran	2	[{"changed": {"fields": ["Votes"]}}]	18	332
3355	2026-05-22 12:28:42.201879+00	380	Hayley Rasschaert	2	[{"changed": {"fields": ["Votes"]}}]	18	332
3356	2026-05-22 12:28:57.497984+00	686	Test Account	2	[{"changed": {"fields": ["Votes"]}}]	18	332
3357	2026-05-22 12:29:32.238003+00	331	Benny De Bock	2	[{"changed": {"fields": ["Votes", "Status", "Role"]}}]	18	332
3358	2026-05-22 12:29:48.243471+00	12	Tyra Bourgeois	2	[{"changed": {"fields": ["Votes"]}}]	18	332
3359	2026-05-23 09:45:05.765603+00	739	party	2	[{"changed": {"fields": ["password"]}}]	4	2
3360	2026-05-23 09:57:37.979278+00	739	Tanguy Montaine	2	[{"changed": {"fields": ["Role"]}}]	18	379
3361	2026-05-23 09:57:46.083049+00	738	Sarah Pauwels	2	[{"changed": {"fields": ["Role"]}}]	18	379
3362	2026-05-23 09:57:51.047051+00	737	Bram Zeeuwe	2	[{"changed": {"fields": ["Role"]}}]	18	379
3363	2026-05-23 09:57:55.24023+00	736	Seppe Landtsheer	2	[{"changed": {"fields": ["Role"]}}]	18	379
3364	2026-05-23 12:16:18.552578+00	379	Reina Tanghe	2	[{"changed": {"fields": ["Votes"]}}]	18	332
3365	2026-05-23 12:16:30.995158+00	366	Milan De Smet	2	[{"changed": {"fields": ["Votes"]}}]	18	379
3366	2026-05-23 12:17:10.354924+00	739	Tanguy Montaine	2	[{"changed": {"fields": ["Votes"]}}]	18	379
3367	2026-05-23 12:17:34.532848+00	726	Axelle Ducouran	2	[]	18	379
3368	2026-05-23 12:17:46.425611+00	735	kobe maebe	2	[]	18	379
3369	2026-05-23 12:19:05.612073+00	733	Nele Vandemaele	2	[{"changed": {"fields": ["Votes"]}}]	18	379
3370	2026-05-23 12:19:26.117684+00	329	Yoran Ollevier	2	[{"changed": {"fields": ["Votes"]}}]	18	379
3371	2026-05-23 12:19:45.713746+00	551	Wout Lesschaeve	2	[{"changed": {"fields": ["Votes"]}}]	18	379
3372	2026-05-23 12:20:06.638007+00	736	Seppe Landtsheer	2	[{"changed": {"fields": ["Votes"]}}]	18	379
3373	2026-05-23 12:27:10.117943+00	379	Reina Tanghe	2	[{"changed": {"fields": ["Role"]}}]	18	379
3374	2026-05-23 12:28:06.034958+00	379	Reina Tanghe	2	[{"changed": {"fields": ["Role"]}}]	18	379
3375	2026-05-23 12:28:41.08079+00	379	Reina Tanghe	2	[{"changed": {"fields": ["Role"]}}]	18	379
3376	2026-05-23 12:30:14.337948+00	332	SanderDeBruyker	2	[{"changed": {"fields": ["User permissions"]}}]	4	2
3377	2026-05-23 12:30:29.795838+00	379	Reina	2	[{"changed": {"fields": ["User permissions"]}}]	4	2
3378	2026-05-23 12:30:53.467188+00	102	Verkiezingen 2026 - 2027	1	[{"added": {}}]	8	332
3379	2026-05-23 12:31:15.927373+00	380	hayley.rasschaert	2	[{"changed": {"fields": ["User permissions"]}}]	4	2
3380	2026-05-23 12:31:36.966414+00	380	hayley.rasschaert	2	[{"changed": {"fields": ["password"]}}]	4	2
3381	2026-05-23 12:42:30.807658+00	686	Test Account	2	[{"changed": {"fields": ["Election active"]}}]	18	332
3382	2026-05-23 16:08:14.91266+00	686	Test Account	2	[{"changed": {"fields": ["Election active"]}}]	18	332
3383	2026-05-23 16:44:39.339708+00	740	Klaas Verwilst	2	[{"changed": {"fields": ["Votes"]}}]	18	379
3384	2026-05-23 17:08:09.238654+00	742	jasper	2	[{"changed": {"name": "profile", "object": "Jasper Van der Stichelen", "fields": ["Role"]}}]	4	2
3385	2026-05-23 17:10:07.006835+00	730	Charlie1212	2	[{"changed": {"name": "profile", "object": "Charlotte Ilegems", "fields": ["Role"]}}]	4	2
3386	2026-05-23 17:10:52.323645+00	740	KLAASverwilst	2	[{"changed": {"name": "profile", "object": "Klaas Verwilst", "fields": ["Role"]}}]	4	2
3387	2026-05-23 17:11:41.180067+00	216	Britt Emanuel	2	[{"changed": {"fields": ["Election active"]}}]	18	332
3388	2026-05-23 17:13:02.559081+00	744	Tejas Rahman	2	[{"changed": {"fields": ["Role"]}}]	18	2
3389	2026-05-23 17:15:10.915331+00	749	Jermin De Witte	2	[{"changed": {"fields": ["Role"]}}]	18	2
3390	2026-05-23 17:15:13.880635+00	748	Guus Loccufier	2	[{"changed": {"fields": ["Role"]}}]	18	2
3392	2026-05-23 17:15:19.492752+00	746	Naomi Van Kerckhove	2	[{"changed": {"fields": ["Role"]}}]	18	2
3394	2026-05-23 17:15:26.877718+00	743	Shanty Laureyns	2	[{"changed": {"fields": ["Role"]}}]	18	2
3395	2026-05-23 17:15:31.605417+00	741	Bram Wuyts	2	[{"changed": {"fields": ["Role"]}}]	18	2
3396	2026-05-23 17:15:33.951783+00	722	Naomi Van Kerckhove	2	[{"changed": {"fields": ["Role"]}}]	18	2
3397	2026-05-23 17:15:36.805212+00	652	Kelsy Van Bogaert	2	[{"changed": {"fields": ["Role"]}}]	18	2
3398	2026-05-23 17:15:39.428189+00	331	Benny De Bock	2	[{"changed": {"fields": ["Role"]}}]	18	2
3399	2026-05-23 17:15:42.136995+00	223	Aaron Van Goethem	2	[{"changed": {"fields": ["Role"]}}]	18	2
3391	2026-05-23 17:15:17.088646+00	747	Kelsy Van Bogaert	2	[{"changed": {"fields": ["Role"]}}]	18	2
3393	2026-05-23 17:15:22.387752+00	745	Naomi Van Kerckhove	2	[{"changed": {"fields": ["Role"]}}]	18	2
3400	2026-05-23 17:29:44.801589+00	748	Guus Loccufier	2	[{"changed": {"fields": ["Election active"]}}]	18	332
3401	2026-05-23 17:46:28.869443+00	216	Britt Emanuel	2	[{"changed": {"fields": ["Votes"]}}]	18	332
3402	2026-05-23 17:49:40.877613+00	750	Warre Tuybens	2	[{"changed": {"fields": ["Role"]}}]	18	379
3403	2026-05-23 17:54:50.239542+00	756	Yoran Ollevier	2	[]	18	379
3404	2026-05-23 17:55:23.917535+00	756	Yoran Ollevier	2	[{"changed": {"fields": ["Role"]}}]	18	2
3405	2026-05-23 17:55:26.79845+00	755	Volmacht Axelle Ducouran	2	[{"changed": {"fields": ["Role"]}}]	18	2
3406	2026-05-23 17:55:29.046894+00	754	Seppe Volmacht	2	[{"changed": {"fields": ["Role"]}}]	18	2
3407	2026-05-23 17:55:32.026375+00	753	Volmacht Britt Emanuel	2	[{"changed": {"fields": ["Role"]}}]	18	2
3408	2026-05-23 17:55:34.816961+00	752	Volmacht Zeaya	2	[{"changed": {"fields": ["Role"]}}]	18	2
3409	2026-05-23 17:55:37.921911+00	751	kobe maebe	2	[{"changed": {"fields": ["Role"]}}]	18	2
3410	2026-05-23 17:56:30.961958+00	736	Seppe Landtsheer	2	[{"changed": {"fields": ["Votes"]}}]	18	379
3411	2026-05-23 17:57:11.347059+00	735	kobe maebe	2	[{"changed": {"fields": ["Votes"]}}]	18	379
3412	2026-05-23 17:57:23.8784+00	216	Britt Emanuel	2	[{"changed": {"fields": ["Votes"]}}]	18	379
3413	2026-05-23 17:57:31.877436+00	329	Yoran Ollevier	2	[{"changed": {"fields": ["Votes"]}}]	18	379
3414	2026-05-23 17:57:51.341404+00	726	Axelle Ducouran	2	[{"changed": {"fields": ["Votes"]}}]	18	379
3415	2026-05-23 17:58:00.248626+00	733	Nele Vandemaele	2	[{"changed": {"fields": ["Votes"]}}]	18	379
3416	2026-05-23 17:59:08.768214+00	740	Klaas Verwilst	2	[{"changed": {"fields": ["Votes"]}}]	18	379
3417	2026-05-23 18:03:24.565026+00	757	Demi Eller	2	[{"changed": {"fields": ["Role"]}}]	18	379
3418	2026-05-23 18:26:39.039219+00	376	Rein Goossens	2	[{"changed": {"fields": ["Election active"]}}]	18	332
3419	2026-05-23 19:16:58.380588+00	731	Ruben Colson	2	[{"changed": {"fields": ["Election active"]}}]	18	332
3420	2026-05-24 21:06:20.483195+00	4	vice-praeses@heimdal.be	2	[{"changed": {"fields": ["First name", "Last name"]}}]	4	2
3421	2026-05-24 21:07:10.455474+00	6	secretaris@heimdal.be	2	[{"changed": {"fields": ["First name", "Last name"]}}]	4	2
3422	2026-05-24 21:07:26.501391+00	8	schachtentemmer@heimdal.be	2	[{"changed": {"fields": ["First name", "Last name"]}}]	4	2
3423	2026-05-24 21:08:23.679651+00	10	pr@heimdal.be	2	[{"changed": {"fields": ["First name", "Last name"]}}]	4	2
3424	2026-05-24 21:08:45.623745+00	3	praeses@heimdal.be	2	[{"changed": {"fields": ["First name", "Last name"]}}]	4	2
3425	2026-05-24 21:09:18.087785+00	221	media@heimdal.be	2	[{"changed": {"fields": ["First name", "Last name"]}}]	4	2
3426	2026-05-24 21:09:44.479094+00	2	ict@heimdal.be	2	[{"changed": {"fields": ["First name", "Last name"]}}]	4	2
3427	2026-05-24 21:11:31.73571+00	9	feest-lan@heimdal.be	2	[{"changed": {"fields": ["First name", "Last name"]}}]	4	2
3428	2026-05-24 21:12:02.516075+00	11	cultuur@heimdal.be	2	[{"changed": {"fields": ["First name", "Last name"]}}]	4	2
3429	2026-05-24 22:15:00.998656+00	140	2026 - 2027	1	[{"added": {}}]	15	2
3430	2026-05-24 22:18:40.077019+00	217	Marwan: Elkhallouki	1	[{"added": {}}]	14	2
3431	2026-05-24 22:19:15.157434+00	218	Mauro: Maratta	1	[{"added": {}}]	14	2
3432	2026-05-24 22:19:49.245513+00	219	Vincent: Minjauw	1	[{"added": {}}]	14	2
3433	2026-05-24 22:20:23.293931+00	220	Kobe: Maebe	1	[{"added": {}}]	14	2
3434	2026-05-24 22:21:01.474025+00	221	Milan: Dhondt	1	[{"added": {}}]	14	2
3435	2026-05-24 22:21:34.586945+00	222	Shanty: Laureyns	1	[{"added": {}}]	14	2
3436	2026-05-24 22:21:59.236059+00	223	Wout: Lesschaeve	1	[{"added": {}}]	14	2
3437	2026-05-24 22:24:16.397057+00	346	2026 - 2027 Praeses	1	[{"added": {}}]	19	2
3438	2026-05-24 22:24:44.650128+00	347	2026 - 2027 Vice-Praeses	1	[{"added": {}}]	19	2
3439	2026-05-24 22:25:00.878497+00	348	2026 - 2027 Quaestor	1	[{"added": {}}]	19	2
3440	2026-05-24 22:25:17.585586+00	349	2026 - 2027 Secretaris	1	[{"added": {}}]	19	2
3441	2026-05-24 22:25:32.967236+00	350	2026 - 2027 PR	1	[{"added": {}}]	19	2
3442	2026-05-24 22:25:57.559584+00	351	2026 - 2027 Media	1	[{"added": {}}]	19	2
3443	2026-05-24 22:26:14.034538+00	352	2026 - 2027 Schachtentemmer	1	[{"added": {}}]	19	2
3444	2026-05-24 22:26:31.874893+00	353	2026 - 2027 Cultuur	1	[{"added": {}}]	19	2
3445	2026-05-24 22:26:49.109331+00	354	2026 - 2027 Sport	1	[{"added": {}}]	19	2
3446	2026-05-24 22:27:12.957184+00	355	2026 - 2027 Feest & LAN	1	[{"added": {}}]	19	2
3447	2026-05-24 22:27:31.598216+00	356	2026 - 2027 ICT	1	[{"added": {}}]	19	2
3448	2026-05-24 22:28:43.348416+00	357	Superschachten Superschacht	1	[{"added": {}}]	19	2
3449	2026-05-24 22:33:14.917202+00	10	pr@heimdal.be	2	[{"changed": {"fields": ["password"]}}]	4	2
3450	2026-05-24 22:35:00.195444+00	551	Woud	2	[{"changed": {"fields": ["Username"]}}]	4	2
3451	2026-05-24 22:45:19.795769+00	178	Studentendrukker	1	[{"added": {}}]	17	10
3452	2026-05-24 22:45:46.726767+00	178	Studentendrukker	2	[{"changed": {"fields": ["Inverted color"]}}]	17	10
3453	2026-05-24 22:45:57.777536+00	178	Studentendrukker	2	[{"changed": {"fields": ["Inverted color"]}}]	17	10
3454	2026-05-24 23:00:18.080459+00	178	Studentendrukker	2	[{"changed": {"fields": ["Logo"]}}]	17	10
3455	2026-05-24 23:03:35.941885+00	178	9. Studentendrukker	2	[{"changed": {"fields": ["Name"]}}]	17	10
3456	2026-05-24 23:03:43.207289+00	2	1. HOGENT	2	[{"changed": {"fields": ["Name"]}}]	17	10
3457	2026-05-25 22:15:52.248227+00	218	Mauro: Maratta	2	[{"changed": {"fields": ["Linkedin link"]}}]	14	2
3458	2026-05-26 08:46:57.884121+00	184	Karsten: Depoorter	2	[{"changed": {"fields": ["Linkedin link", "Instagram link"]}}]	14	2
3459	2026-05-26 08:49:29.210587+00	184	Karsten: Depoorter	2	[{"changed": {"fields": ["Linkedin link"]}}]	14	2
3460	2026-05-26 08:50:31.775861+00	184	Karsten: Depoorter	2	[{"changed": {"fields": ["Linkedin link"]}}]	14	2
3461	2026-05-29 12:04:59.887758+00	380	hayley.rasschaert	2	[{"changed": {"fields": ["Staff status", "Groups", "User permissions"]}}]	4	2
3462	2026-05-29 12:06:21.284231+00	380	hayley.rasschaert	2	[{"changed": {"fields": ["User permissions"]}}]	4	2
3463	2026-05-29 12:07:17.606166+00	379	Reina	2	[{"changed": {"fields": ["Staff status", "Groups", "User permissions"]}}]	4	2
3464	2026-05-29 12:08:02.638818+00	332	SanderDeBruyker	2	[{"changed": {"fields": ["Staff status", "Groups", "User permissions"]}}]	4	2
3465	2026-05-29 18:45:16.971473+00	6	secretaris@heimdal.be	2	[{"changed": {"fields": ["password"]}}]	4	2
3466	2026-06-05 15:52:58.144765+00	11	cultuur@heimdal.be	2	[{"changed": {"fields": ["password"]}}]	4	2
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: jormungandr
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	Backend	cms
8	Backend	election
9	Backend	eventgenre
10	Backend	footerpage
11	Backend	navtopitem
12	Backend	photoalbum
13	Backend	praesidiumfunction
14	Backend	praesidiummember
15	Backend	praesidiumyear
16	Backend	round
17	Backend	sponsor
18	Backend	profile
19	Backend	praesidiumfunctionyearmember
20	Backend	picture
21	Backend	navsubitem
22	Backend	graphnode
23	Backend	event
24	Backend	choice
25	Backend	uservotes
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: jormungandr
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2022-12-31 16:21:22.741039+00
2	auth	0001_initial	2022-12-31 16:21:22.8746+00
3	Backend	0001_initial	2022-12-31 16:21:23.111089+00
4	Backend	0002_alter_profile_status	2022-12-31 16:21:23.125583+00
5	admin	0001_initial	2022-12-31 16:21:23.168844+00
6	admin	0002_logentry_remove_auto_add	2022-12-31 16:21:23.183226+00
7	admin	0003_logentry_add_action_flag_choices	2022-12-31 16:21:23.198531+00
8	contenttypes	0002_remove_content_type_name	2022-12-31 16:21:23.234879+00
9	auth	0002_alter_permission_name_max_length	2022-12-31 16:21:23.254843+00
10	auth	0003_alter_user_email_max_length	2022-12-31 16:21:23.272679+00
11	auth	0004_alter_user_username_opts	2022-12-31 16:21:23.288657+00
12	auth	0005_alter_user_last_login_null	2022-12-31 16:21:23.305357+00
13	auth	0006_require_contenttypes_0002	2022-12-31 16:21:23.312462+00
14	auth	0007_alter_validators_add_error_messages	2022-12-31 16:21:23.340647+00
15	auth	0008_alter_user_username_max_length	2022-12-31 16:21:23.361303+00
16	auth	0009_alter_user_last_name_max_length	2022-12-31 16:21:23.381108+00
17	auth	0010_alter_group_name_max_length	2022-12-31 16:21:23.402737+00
18	auth	0011_update_proxy_permissions	2022-12-31 16:21:23.427425+00
19	auth	0012_alter_user_first_name_max_length	2022-12-31 16:21:23.445279+00
20	sessions	0001_initial	2022-12-31 16:21:23.466588+00
21	Backend	0003_auto_20230101_1212	2023-01-01 11:15:22.288318+00
22	Backend	0004_auto_20230101_2049	2023-01-01 20:24:37.373205+00
55	Backend	0005_auto_20230211_0232	2023-02-11 01:44:35.256455+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: jormungandr
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
zf8h9u6vmqrwbqgz2l16dh6qbharl50r	.eJxVjEsOAiEQBe_C2hB-LejSvWcgDd3IqIFkmFkZ766TzEK3r6reS0RclxrXwXOcSJyFFoffLWF-cNsA3bHdusy9LfOU5KbInQ557cTPy-7-HVQc9VsDkfbFIrNSR5-AHDgMJZ9s9j44MMxsqQTUwGCcUcr5VIrGgCXroMT7A_HEODA:1pBefm:qSr6sFn7RoBi63hD_yNinyBakFC9IVD0dTJbCVD6FRc	2023-01-14 16:25:26.740089+00
85tjqljj5ln0ub8o2pnd398j15udcy03	.eJxVjEEOwiAQRe_C2hAowoBL9z0DGYZBqoYmpV0Z765NutDtf-_9l4i4rTVunZc4ZXERgzj9bgnpwW0H-Y7tNkua27pMSe6KPGiX45z5eT3cv4OKvX7rhDloygm5KAVnIAiqgFVe22CDJ0gWtTdKOSC0DpxmTqaw8UAmhEG8P-jfN4Y:1pBvWS:xV7rLrEIDa3eh_673Yv00TiOAAFiRRjGXmAj7Mlv8XM	2023-01-15 10:24:56.066234+00
szatpa9omv0tjcl4zo5uhlxuvheg7lg8	.eJxVjEEOwiAQRe_C2pCBoRVcuu8ZyAxMbdVAUtqV8e7apAvd_vfef6lI2zrFrckS56wuylh1-h2Z0kPKTvKdyq3qVMu6zKx3RR-06aFmeV4P9-9gojZ9awhsbNd740JvPXZjRgZGwd6PyITOgZhR6BzAhdQheRHPOQuAMzaAen8A4no3aw:1pFCYO:DceIHOgeQBZiwceYw3ZCZmDNDOFJnyCv8rONmNnjO0w	2023-01-24 11:12:28.707766+00
9dnpg6397ehkgaqi5ax36ppra6ql6blj	.eJxVjEEOwiAQRe_C2hAowoBL9z0DGYZBqoYmpV0Z765NutDtf-_9l4i4rTVunZc4ZXERgzj9bgnpwW0H-Y7tNkua27pMSe6KPGiX45z5eT3cv4OKvX7rhDloygm5KAVnIAiqgFVe22CDJ0gWtTdKOSC0DpxmTqaw8UAmhEG8P-jfN4Y:1pFDRr:uAEFYsETnR_HEGnMdKW_3NdprKOsDce7evrJvlx4cz8	2023-01-24 12:09:47.451632+00
k0y7vjiqe1szatnnwee9h5w4d6dj97q4	.eJxVjEsOAiEQBe_C2hB-LejSvWcgDd3IqIFkmFkZ766TzEK3r6reS0RclxrXwXOcSJyFFoffLWF-cNsA3bHdusy9LfOU5KbInQ557cTPy-7-HVQc9VsDkfbFIrNSR5-AHDgMJZ9s9j44MMxsqQTUwGCcUcr5VIrGgCXroMT7A_HEODA:1pHgxq:A0rwjK1oLdUmDvL4dAYvX2cFdf3BKuq8FVx44WqJzWk	2023-01-31 08:05:02.931264+00
r3mlo9f24aozb3lwsleh86wwxf5rmge0	.eJxVjEEOwiAQRe_C2hCgRcCl-56BzAyDVA0kpV0Z765NutDtf-_9l4iwrSVunZc4J3ERoxWn3xGBHlx3ku5Qb01Sq-syo9wVedAup5b4eT3cv4MCvXxr5w0RYkpgAIgtknIqBw-BbRgIs1Y-AOacddYcyKUhaI9sxpHN2Wrx_gBQRjlc:1pMwkt:Ma2j13DWdv1Za1efB8l8YPlWf81tCRBqDztUAcag5x4	2023-02-14 19:57:23.694198+00
hng92p7ozw1mux9ptrwnxl86mgly46i9	.eJxVjEEOwiAQRe_C2hAowoBL9z0DGYZBqoYmpV0Z765NutDtf-_9l4i4rTVunZc4ZXERgzj9bgnpwW0H-Y7tNkua27pMSe6KPGiX45z5eT3cv4OKvX7rhDloygm5KAVnIAiqgFVe22CDJ0gWtTdKOSC0DpxmTqaw8UAmhEG8P-jfN4Y:1pNHjU:Vsc3XdS6pv1bnC0SiMHN4OtFnw5CnsjO2H3p7f3kSP0	2023-02-15 18:21:20.391353+00
dhrt5ey0yfta9l7d5lhshaquxolr6bwl	.eJxVjLsOwjAMAP8lM4ryaGrKyM43RLbjkAJqpKadEP-OInWA9e50bxVx30rcm6xxTuqirFWnX0jIT1m6SQ9c7lVzXbZ1Jt0TfdimbzXJ63q0f4OCrfSvmTygsHGQiTAgg092yCLM7Mk5GhBBDATOfgz-7CbLOXMYBZwkUZ8vK-U5RA:1pNHkT:dTLQZZIZiafvmzX_iekZiCQQwDaCICDHc3M8-nzKEgo	2023-02-15 18:22:21.228497+00
se3c9nchxjgb45xzcpiljw6z8va9dmv1	.eJxVjEEOwiAQRe_C2pCBoRVcuu8ZyAxMbdVAUtqV8e7apAvd_vfef6lI2zrFrckS56wuylh1-h2Z0kPKTvKdyq3qVMu6zKx3RR-06aFmeV4P9-9gojZ9awhsbNd740JvPXZjRgZGwd6PyITOgZhR6BzAhdQheRHPOQuAMzaAen8A4no3aw:1pOKJL:nRAyRSVAqiJ-n4VR0yxmZ6pvRizf6JWNUUm_p_GU_uM	2023-02-18 15:18:39.622872+00
jai6kq0zt1epv5ojqjfbozmp76w9gjxe	.eJxVjEsOwiAUAO_C2pDAAwou3XsG8j5UqqZNSrtqvLsh6UK3M5M5VMZ9q3lvZc2TqKsCdfllhPwqcxfyxPmxaF7mbZ1I90Sftun7IuV9O9u_QcVW-5YZfBrZxaEIRAiBCjlvo0dhSQMRgBMfI4IBwymRHSI6wRIsJzOqzxfsRTgX:1pOOXU:HXH8t6E7tgRlRxc7AjLbnmXByiOO2uGEelbwmisnCgE	2023-02-18 19:49:32.728816+00
ae3m63ngv12sc7pti2iwnodj155p35jb	.eJxVjEEOwiAQRe_C2pCBoRVcuu8ZyAxMbdVAUtqV8e7apAvd_vfef6lI2zrFrckS56wuylh1-h2Z0kPKTvKdyq3qVMu6zKx3RR-06aFmeV4P9-9gojZ9awhsbNd740JvPXZjRgZGwd6PyITOgZhR6BzAhdQheRHPOQuAMzaAen8A4no3aw:1pOOph:a8iQtsWYHl1PA593LEQGfXMsSxD_xO1ZtcY7gSBIUUo	2023-02-18 20:08:21.182157+00
0xvdxq7zkx2syv20nr1c1usto49u0tsy	.eJxVjEsOAiEQBe_C2hB-LejSvWcgDd3IqIFkmFkZ766TzEK3r6reS0RclxrXwXOcSJyFFoffLWF-cNsA3bHdusy9LfOU5KbInQ557cTPy-7-HVQc9VsDkfbFIrNSR5-AHDgMJZ9s9j44MMxsqQTUwGCcUcr5VIrGgCXroMT7A_HEODA:1pPXyw:IXA81GjwSTkYMtSbVmFtYR8pO6n2ufH4JDlwlvkhSC8	2023-02-22 00:06:38.186963+00
5qt2ghujt56rk67fj32poprhbm0wen6i	.eJxVjEsOAiEQBe_C2hBoPs24dO8ZSDM0Mmogmc_KeHedZBa6fVX1XiLStta4LTzHKYuzwCBOv2Oi8cFtJ_lO7dbl2Ns6T0nuijzoIq898_NyuH8HlZb6rZ0CYmdgsKi9dt6iDegQDA8KvYYSrNVoCFQhj6GoNBTwSQfDiGxAvD-1LzYQ:1pPY23:AZVgijB1DailQ5izUwjslQo876M6EOJkZ15KZizCBkk	2023-02-22 00:09:51.907594+00
sw364obdy15yvdc9q4qrwf392k4i0knf	.eJxVjEsOwiAUAO_C2pDAAwou3XsG8j5UqqZNSrtqvLsh6UK3M5M5VMZ9q3lvZc2TqKsCdfllhPwqcxfyxPmxaF7mbZ1I90Sftun7IuV9O9u_QcVW-5YZfBrZxaEIRAiBCjlvo0dhSQMRgBMfI4IBwymRHSI6wRIsJzOqzxfsRTgX:1pQCgf:q2OI4i1ZehWxTj87GIcIelPDaQkdEg8OwMDXZyTUFsU	2023-02-23 19:34:29.626794+00
in8bh5u6erdkve84f4o35e4yi9ffixuf	.eJxVjEsOwiAUAO_C2hD-BZfuPQN5vAdSNTQp7cp4dyXpQrczk3mxCPtW497zGmdiZ2bY6ZclwEduQ9Ad2m3huLRtnRMfCT9s59eF8vNytH-DCr2OrQZDQRpbkiUZREk4ueSLB9Tqy90UlMecUEkkLYhELgBeWu2tzo7Y-wPqsDg0:1pQCj6:2HMtTLpJki4WXTL_eWk9so6PjcnldKz5pSa-lkX5V4U	2023-02-23 19:37:00.145322+00
yf53vzp9xdsukim81sh4w5pdaxaroby4	.eJxVjEEOwiAQRe_C2pCBoRVcuu8ZyAxMbdVAUtqV8e7apAvd_vfef6lI2zrFrckS56wuylh1-h2Z0kPKTvKdyq3qVMu6zKx3RR-06aFmeV4P9-9gojZ9awhsbNd740JvPXZjRgZGwd6PyITOgZhR6BzAhdQheRHPOQuAMzaAen8A4no3aw:1pU6D1:1oFnMpJX3s_ojRujfPFPPSuiDS6uXzhhin4_fVU4fMs	2023-03-06 13:27:59.879627+00
axrglewxol5n21xitb3r4gmmj8k2y19f	.eJxVjEEOwiAQRe_C2hAowoBL9z0DGYZBqoYmpV0Z765NutDtf-_9l4i4rTVunZc4ZXERgzj9bgnpwW0H-Y7tNkua27pMSe6KPGiX45z5eT3cv4OKvX7rhDloygm5KAVnIAiqgFVe22CDJ0gWtTdKOSC0DpxmTqaw8UAmhEG8P-jfN4Y:1pUVx7:0-i5ll1Vf2dkZP55mhu3xLOs9LupVpbF_g8GE0tHhk0	2023-03-07 16:57:17.738787+00
5bewzmage44t1btbmeubc0mi8ch5qivh	.eJxVjMEOwiAQRP-FsyEtlQU8evcbyMIuUjWQlPZk_HdL0oPeJm_ezFt43Nbst8aLn0lchBGnXxYwPrn0gh5Y7lXGWtZlDrIr8mibvFXi1_Vw_w4yttzXigDScAaGNDmcAtlONBgNiXaorYUIgw1mzxojRDUmVujUyNpZ8fkC6DQ30g:1pUVys:SoGH7qYlKU8uVyWDw2tSNnjQqP9iapiJITyNh__WTww	2023-03-07 16:59:06.859068+00
7tie8ttm9f36wvvxb6fpdgkzwflwuvcl	.eJxVjEEOwiAQRe_C2hAowoBL9z0DGYZBqoYmpV0Z765NutDtf-_9l4i4rTVunZc4ZXERgzj9bgnpwW0H-Y7tNkua27pMSe6KPGiX45z5eT3cv4OKvX7rhDloygm5KAVnIAiqgFVe22CDJ0gWtTdKOSC0DpxmTqaw8UAmhEG8P-jfN4Y:1paGv0:Ju6a5Xyb2JCDGiRoNdVdupP5J3ll0wzpAtUCdKG3tIg	2023-03-23 14:06:54.784635+00
45b7vqeilxqiob2jf56qddeiwti5br72	.eJxVjEEOwiAQRe_C2pCBAoJL9z0DGZhBqoYmpV0Z765NutDtf-_9l4i4rTVunZc4kbiIIE6_W8L84LYDumO7zTLPbV2mJHdFHrTLcSZ-Xg_376Bir986WcOgldU-UPbIuZjgz25IRVvAxEBIASERkFVQBqUcUWbjSg6mOBDvD_dMOIo:1paH9q:0zLafZNqFIe3fsMzCNQqvpXij1qxtG-JXLt83kN-h7Y	2023-03-23 14:22:14.772849+00
ay6n4a0apy9kg842ib2mtbsxt7b8s802	.eJxVjEsOwiAUAO_C2pDAAwou3XsG8j5UqqZNSrtqvLsh6UK3M5M5VMZ9q3lvZc2TqKsCdfllhPwqcxfyxPmxaF7mbZ1I90Sftun7IuV9O9u_QcVW-5YZfBrZxaEIRAiBCjlvo0dhSQMRgBMfI4IBwymRHSI6wRIsJzOqzxfsRTgX:1pbORm:fJpzvscLj89RtcKtEhzVT1k-NC6GKQRzkQ3T8XvRZLg	2023-03-26 16:21:22.517383+00
45snf5ok4excbkr5njplkqbcwm6590di	.eJxVjMsOgjAQRf-la9NQ2lLGpXu_oZlHR1ADCYWV8d-VhIVu7znnvkzGbR3yVsuSRzFn45w5_Y6E_CjTTuSO0222PE_rMpLdFXvQaq-zlOflcP8OBqzDt2YSDcyhj6CgTYuAkUmddJEbD6364iklSH1w2lEXAwpJSNqjA_Zi3h8sozjY:1peOHx:TTX76zaqU-RrG4TF42NIPJ5zRc423vPTDOHWAkT_-hg	2023-04-03 22:47:37.336854+00
m7qep5si35us5oxra02arwwfo5zvv0dy	.eJxVjEEOwiAQRe_C2hAowoBL9z0DGYZBqoYmpV0Z765NutDtf-_9l4i4rTVunZc4ZXERgzj9bgnpwW0H-Y7tNkua27pMSe6KPGiX45z5eT3cv4OKvX7rhDloygm5KAVnIAiqgFVe22CDJ0gWtTdKOSC0DpxmTqaw8UAmhEG8P-jfN4Y:1pfcXj:I1GP5omNyOGRNFEc0ioDcNZQlGrqL3F9I7DQrIr7Hks	2023-04-07 08:12:59.273103+00
uc9h5vaht6suco45tvx4zbh2k7q8q0s3	.eJxVjEEOwiAQRe_C2pCBAoJL9z0DGZhBqoYmpV0Z765NutDtf-_9l4i4rTVunZc4kbiIIE6_W8L84LYDumO7zTLPbV2mJHdFHrTLcSZ-Xg_376Bir986WcOgldU-UPbIuZjgz25IRVvAxEBIASERkFVQBqUcUWbjSg6mOBDvD_dMOIo:1pfmVO:mNCdm7xkbv_Oq8p6yccxzkaEGP5_5RVJyi0DKWY3jh0	2023-04-07 18:51:14.102758+00
fwi3cj2bcmwbyny6wot3px3rc2oxwzdt	.eJxVjEEOwiAQRe_C2pCBAoJL9z0DGZhBqoYmpV0Z765NutDtf-_9l4i4rTVunZc4kbiIIE6_W8L84LYDumO7zTLPbV2mJHdFHrTLcSZ-Xg_376Bir986WcOgldU-UPbIuZjgz25IRVvAxEBIASERkFVQBqUcUWbjSg6mOBDvD_dMOIo:1pfmVP:uqVLD2v4h3Aq3CU-aqqoQLYk11-6NPAn9QEGULq84oA	2023-04-07 18:51:15.635282+00
2vmue12572t2lm532pzqnm7lmnsip7v0	.eJxVjEEOwiAQRe_C2pCBAoJL9z0DGZhBqoYmpV0Z765NutDtf-_9l4i4rTVunZc4kbiIIE6_W8L84LYDumO7zTLPbV2mJHdFHrTLcSZ-Xg_376Bir986WcOgldU-UPbIuZjgz25IRVvAxEBIASERkFVQBqUcUWbjSg6mOBDvD_dMOIo:1pg4iI:2HxnnxfF991K-78qZONJg3e7dE3xPWMKBqvDMhffH68	2023-04-08 14:17:46.347778+00
s3yfkdczpwmyuxxnj7jkk95n5ibw8woc	.eJxVjEEOwiAQRe_C2hAowoBL9z0DGYZBqoYmpV0Z765NutDtf-_9l4i4rTVunZc4ZXERgzj9bgnpwW0H-Y7tNkua27pMSe6KPGiX45z5eT3cv4OKvX7rhDloygm5KAVnIAiqgFVe22CDJ0gWtTdKOSC0DpxmTqaw8UAmhEG8P-jfN4Y:1piGI5:IbvLfZTTM1d9pUaZT03LlqhsCmt9umo-kxRfxx3xjKE	2023-04-14 15:03:45.458352+00
tbtxypwqzzohk9yqq77a8lxt6kx48t2v	.eJxVjMEOwiAQRP-FsyEtlQU8evcbyMIuUjWQlPZk_HdL0oPeJm_ezFt43Nbst8aLn0lchBGnXxYwPrn0gh5Y7lXGWtZlDrIr8mibvFXi1_Vw_w4yttzXigDScAaGNDmcAtlONBgNiXaorYUIgw1mzxojRDUmVujUyNpZ8fkC6DQ30g:1po4Aw:BR5x8i7Sl9UN8ZaJ9fu5FMdMNdPZP1Km8siPhgvFfFY	2023-04-30 15:20:22.960061+00
e4vormjz1ilsqmeffnhc2b30nynkaulc	.eJxVjEsOwiAUAO_C2hD-BZfuPQN5vAdSNTQp7cp4dyXpQrczk3mxCPtW497zGmdiZ2bY6ZclwEduQ9Ad2m3huLRtnRMfCT9s59eF8vNytH-DCr2OrQZDQRpbkiUZREk4ueSLB9Tqy90UlMecUEkkLYhELgBeWu2tzo7Y-wPqsDg0:1po4UK:1TogKp5fa17osr_vM7FYikFifSfe0t1-6G6Cyq7i2Eo	2023-04-30 15:40:24.585696+00
ik8tp17lrppp8g1s1ls19ozimqh3fijm	.eJxVjEsOwiAUAO_C2pDAAwou3XsG8j5UqqZNSrtqvLsh6UK3M5M5VMZ9q3lvZc2TqKsCdfllhPwqcxfyxPmxaF7mbZ1I90Sftun7IuV9O9u_QcVW-5YZfBrZxaEIRAiBCjlvo0dhSQMRgBMfI4IBwymRHSI6wRIsJzOqzxfsRTgX:1po4UP:YR62YiW_uSGQLTOK2mFO8XiDUVPCuNQxdS2MNBazGtw	2023-04-30 15:40:29.355518+00
hpgtre9h6zg6b0l8591xh6vzyx9rqxk6	.eJxVjEEOwiAQRe_C2pCBoRVcuu8ZyAxMbdVAUtqV8e7apAvd_vfef6lI2zrFrckS56wuylh1-h2Z0kPKTvKdyq3qVMu6zKx3RR-06aFmeV4P9-9gojZ9awhsbNd740JvPXZjRgZGwd6PyITOgZhR6BzAhdQheRHPOQuAMzaAen8A4no3aw:1pooKa:_2Ftqqp_e37KT2jrg3BrlwTIugzVS2EtxBbnFmV7y50	2023-05-02 16:37:24.357306+00
sgjqf2tqgj6mm3s8i38olsulq2qfipki	.eJxVjEEOwiAQRe_C2hAowoBL9z0DGYZBqoYmpV0Z765NutDtf-_9l4i4rTVunZc4ZXERgzj9bgnpwW0H-Y7tNkua27pMSe6KPGiX45z5eT3cv4OKvX7rhDloygm5KAVnIAiqgFVe22CDJ0gWtTdKOSC0DpxmTqaw8UAmhEG8P-jfN4Y:1pqv1q:A8YAJD1NTpL0UpWkWA6ufecBs2AjXcCwM99WGOZnL50	2023-05-08 12:10:46.573628+00
oy1tszyt75rs6brqu4od9lq9ekx4bplj	.eJxVjDEOwjAMRe-SGUVpotYOIztniGzHkAJKpaadKu4OlTrA-t97fzOJ1qWktemcxmzOBs3pd2OSp9Yd5AfV-2Rlqss8st0Ve9Bmr1PW1-Vw_w4KtfKtKTCEiJI5SPYiqDJkhOhJKECvAxNE7jpQcg6AA3hF9Dfw3vVOybw_CCc4Ng:1pqz1x:JKtSldrNb3mUxD9Fv89dvoB9IkhvQE3PLzLjXwx16Nc	2023-05-08 16:27:09.851388+00
ev28schyujwu2pvx06rxpf7be8qyz5c6	.eJxVjDEOwjAMRe-SGUVpotYOIztniGzHkAJKpaadKu4OlTrA-t97fzOJ1qWktemcxmzOBs3pd2OSp9Yd5AfV-2Rlqss8st0Ve9Bmr1PW1-Vw_w4KtfKtKTCEiJI5SPYiqDJkhOhJKECvAxNE7jpQcg6AA3hF9Dfw3vVOybw_CCc4Ng:1pqz1y:xEtbwsyvEciiBf_r6vFh61c9S0h8436qE0me0r5KPpQ	2023-05-08 16:27:10.912739+00
zltx1ua4o0zg9p3offbry2kiepaprv0n	.eJxVjEEOwiAQRe_C2pCBoRVcuu8ZyAxMbdVAUtqV8e7apAvd_vfef6lI2zrFrckS56wuylh1-h2Z0kPKTvKdyq3qVMu6zKx3RR-06aFmeV4P9-9gojZ9awhsbNd740JvPXZjRgZGwd6PyITOgZhR6BzAhdQheRHPOQuAMzaAen8A4no3aw:1preHd:C3meC3y1TpQwi14TZhlTv1JEC5kz8ptxnSBIg6Kea7I	2023-05-10 12:30:05.43662+00
8n2jvh6k4cv6icdu2go5azkn4rgupmm8	.eJxVjDsOwjAQBe_iGllZx7EtSnrOEO3POIAcKU4qxN0hUgpo38y8lxlxW8u4NV3GSczZAIA5_a6E_NC6I7ljvc2W57ouE9ldsQdt9jqLPi-H-3dQsJVv3Q_e5UToGUGjBuIYhyReuOcMkgM4QiGgDJpc9DGhdr4P6tQP3AXz_gBMdzjq:1puDu1:wwI0-Qjb675pgPh3O42gGnYgEDS7JewZ0e4QDA_xfuM	2023-05-17 14:56:21.595317+00
6w449tbrqo2j18kp2nb1bduoe6jnriru	.eJxVjDsOwjAUBO_iGll-dvyjpM8ZovWPBFAsxUmFuDuJlALandl5swHbOg5by8swJXZlRJJdfteA-MzzgdID873yWOd1mQI_FH7Sxvua8ut2un-BEW3c36qgkNEKSMEHaAkUr2IU5DsDEiVLF2ymzsVOY-_GbBCchZDak5Xs8wVWUjkI:1pyDsY:w-ID7Rlm1P0D7lfETtyR69-lhX04s3xG6XJpdrOBjxg	2023-05-28 15:43:22.274399+00
2tdux4g25ccrq4mfdsklv8egxv6k1dqq	.eJxVjEEOwiAQRe_C2pCBoRVcuu8ZyAxMbdVAUtqV8e7apAvd_vfef6lI2zrFrckS56wuylh1-h2Z0kPKTvKdyq3qVMu6zKx3RR-06aFmeV4P9-9gojZ9awhsbNd740JvPXZjRgZGwd6PyITOgZhR6BzAhdQheRHPOQuAMzaAen8A4no3aw:1pypXO:mhK4rt-jZLz_eH0ViuYSvdM3HUDQcYodnwCJ1DkwXNE	2023-05-30 07:56:02.356709+00
qatwf2wx8zz4ei6e6i4zqzjy4jf4m4eo	.eJxVjEEOwiAQRe_C2hAowoBL9z0DGYZBqoYmpV0Z765NutDtf-_9l4i4rTVunZc4ZXERgzj9bgnpwW0H-Y7tNkua27pMSe6KPGiX45z5eT3cv4OKvX7rhDloygm5KAVnIAiqgFVe22CDJ0gWtTdKOSC0DpxmTqaw8UAmhEG8P-jfN4Y:1pyz9P:8QfrVvHwCel_buXCJ6_hZSHx0lWCiHUkPrWnEnHCaTw	2023-05-30 18:11:55.151874+00
xggroh992ds1hts48s6qyoodu8w2ymj1	.eJxVjEEOwiAQRe_C2hAowoBL9z0DGYZBqoYmpV0Z765NutDtf-_9l4i4rTVunZc4ZXERgzj9bgnpwW0H-Y7tNkua27pMSe6KPGiX45z5eT3cv4OKvX7rhDloygm5KAVnIAiqgFVe22CDJ0gWtTdKOSC0DpxmTqaw8UAmhEG8P-jfN4Y:1q5BsO:Vssh0cNdBHxA3OOW3LA2_MitZNg6GQmzMnqrnBanemM	2023-06-16 21:00:00.748212+00
cr723muy5ky5pvberyzqjtnv4edln76h	.eJxVjEEOwiAQRe_C2hAowoBL9z0DGYZBqoYmpV0Z765NutDtf-_9l4i4rTVunZc4ZXERgzj9bgnpwW0H-Y7tNkua27pMSe6KPGiX45z5eT3cv4OKvX7rhDloygm5KAVnIAiqgFVe22CDJ0gWtTdKOSC0DpxmTqaw8UAmhEG8P-jfN4Y:1q5Btn:JhwQ0hB0zesH9OClqAWrIYY8cOoPT6hIJLCfhyMckfA	2023-06-16 21:01:27.904147+00
ts3tol3uxfn7b33sabejsnhjh9rsr21w	.eJxVjEEOwiAQRe_C2hAowoBL9z0DGYZBqoYmpV0Z765NutDtf-_9l4i4rTVunZc4ZXERgzj9bgnpwW0H-Y7tNkua27pMSe6KPGiX45z5eT3cv4OKvX7rhDloygm5KAVnIAiqgFVe22CDJ0gWtTdKOSC0DpxmTqaw8UAmhEG8P-jfN4Y:1qE9a7:8E3rJuyuW-Wt8A4NCDaGv_vrd6MIAgi2dsngeixe8GM	2023-07-11 14:22:11.52771+00
usfr2zaolzlsmqh61qqsqoukjoc43hk3	.eJxVjMsOwiAUBf-FtSFAKbd16d5vaO4DpGogKe3K-O_apAvdnpk5LzXhtuZpa3GZZlFn1anT70bIj1h2IHcst6q5lnWZSe-KPmjT1yrxeTncv4OMLX9rCqnzglYALcIQxmBIggDY5KIRcR5658mBhzCkOLLprTBTIDbsraj3B-n3OCw:1qE9kI:IzoJ_FpAQvvdDhCFFT-juMLokefo9Zgb4JYXHOManKQ	2023-07-11 14:32:42.750162+00
ohoft9cnit173fa87c4iyrr8vyb6vu93	.eJxVjEEOwiAQRe_C2hCGgXZw6d4zkOkAtmpoUtqV8e7apAvd_vfef6nI2zrGreUlTkmdVadOv9vA8sh1B-nO9TZrmeu6TIPeFX3Qpq9zys_L4f4djNzGb51FTCLj0EKBHj35QCCheJJgAW3oHXNGIm-FrEDq0GAHDgZTGAXV-wO9ojav:1qEAZn:pIr3g5zIth6vwI51QtjI5XbgPRL2lBXK9FbBJZayQrU	2023-07-11 15:25:55.391919+00
8qvrbqdgy7jg3p4ajbx3q014whefismk	.eJxVjDsOwjAQBe_iGlmJ4zg2JT1nsN7uOjiAbCmfCnF3iJQC2jcz76UitjXHbUlznESdlVWn343Aj1R2IHeUW9VcyzpPpHdFH3TR1yrpeTncv4OMJX9rJJBpTMNdC8fB9zANtZ1xYLJ-MD2nxKPvCNZbEQztCJIQgpHB9R7q_QH3uziD:1qEBhf:RZoIbQGIpvsojpKiqNHGok08Tuzx0DfPjOx9gv5SYhI	2023-07-11 16:38:07.338967+00
t6xazefeqd9477rtbc8s8ga2d29nmi7j	.eJxVjEsOAiEQBe_C2hB-LejSvWcgDd3IqIFkmFkZ766TzEK3r6reS0RclxrXwXOcSJyFFoffLWF-cNsA3bHdusy9LfOU5KbInQ557cTPy-7-HVQc9VsDkfbFIrNSR5-AHDgMJZ9s9j44MMxsqQTUwGCcUcr5VIrGgCXroMT7A_HEODA:1qLl1l:-8Bysv1CUaeZpD3uNJWMvFfONKVwzM2VLCSjfZ_NnUU	2023-08-01 13:46:09.46663+00
tlx7ad8m0uya78imgbnebq17irybt7r9	.eJxVjEEOwiAQRe_C2hAowoBL9z0DGYZBqoYmpV0Z765NutDtf-_9l4i4rTVunZc4ZXERgzj9bgnpwW0H-Y7tNkua27pMSe6KPGiX45z5eT3cv4OKvX7rhDloygm5KAVnIAiqgFVe22CDJ0gWtTdKOSC0DpxmTqaw8UAmhEG8P-jfN4Y:1qagqx:8gQtZZfeshAm_aZyKs3QFSYdKuYbWsnR71TOvS_FoKc	2023-09-11 18:20:43.857564+00
b15q396l1jm4pz1dboh7w260b82u23nk	.eJxVjEEOwiAQRe_C2hAowoBL9z0DGYZBqoYmpV0Z765NutDtf-_9l4i4rTVunZc4ZXERgzj9bgnpwW0H-Y7tNkua27pMSe6KPGiX45z5eT3cv4OKvX7rhDloygm5KAVnIAiqgFVe22CDJ0gWtTdKOSC0DpxmTqaw8UAmhEG8P-jfN4Y:1qbfB3:x6G3h8Eb-qbh96_OUD55CJlXqcJkVoqmh03argdTORo	2023-09-14 10:45:29.613443+00
1v6309lz7gwsqrzgcm1sn5nyv0e6lme7	.eJxVjEEOwiAQRe_C2pCBoRVcuu8ZyAxMbdVAUtqV8e7apAvd_vfef6lI2zrFrckS56wuylh1-h2Z0kPKTvKdyq3qVMu6zKx3RR-06aFmeV4P9-9gojZ9awhsbNd740JvPXZjRgZGwd6PyITOgZhR6BzAhdQheRHPOQuAMzaAen8A4no3aw:1qivJU:55kJZnh6kSmfiA9mvrpEd2OejJdS3TUbRCcZPpqYLcM	2023-10-04 11:24:12.171112+00
4gwzxisd6motejrovn0p2xz4e3sa5jym	.eJxVjMsOwiAUBf-FtSFAKbd16d5vaO4DpGogKe3K-O_apAvdnpk5LzXhtuZpa3GZZlFn1anT70bIj1h2IHcst6q5lnWZSe-KPmjT1yrxeTncv4OMLX9rCqnzglYALcIQxmBIggDY5KIRcR5658mBhzCkOLLprTBTIDbsraj3B-n3OCw:1qj2xH:Y_r0eRMHDoOG4lczxxAZrF_NEerTtgFyz4_k-kFMsCs	2023-10-04 19:33:47.419211+00
rmfpdean8kyqqchcvp6j51yk5gxc3y7m	.eJxVjEEOwiAQRe_C2hCGARtcuvcMhGEYqRqalHbVeHdt0oVu_3vvbyqmdalx7WWOI6uLQnX63SjlZ2k74Edq90nnqS3zSHpX9EG7vk1cXtfD_TuoqddvLRjEiICBgME7KOgIBBjBeA7sbSYwGSWgxcAu-eJpQCAeBMuZrHp_ANB_N5U:1qtwJr:va-3B42Rw_tmZNncI__Ul7FrUlK-sWEOeIL8G4jMM_k	2023-11-03 20:42:07.95226+00
ybmz9ww2lux0o41dxqn0b2mjx9ukndoh	.eJxVjDsOwjAQBe_iGlmJ4zg2JT1nsN7uOjiAbCmfCnF3iJQC2jcz76UitjXHbUlznESdlVWn343Aj1R2IHeUW9VcyzpPpHdFH3TR1yrpeTncv4OMJX9rJJBpTMNdC8fB9zANtZ1xYLJ-MD2nxKPvCNZbEQztCJIQgpHB9R7q_QH3uziD:1qlU6O:-JGXI6e9BmUX-ASY_aakl_eYhqTKW96Kv7IOJPQW-XI	2023-10-11 12:57:16.2211+00
vc3ubgv7l06n4mo45f9y3msg5vl9tu00	.eJxVjEEOwiAQRe_C2hAowoBL9z0DGYZBqoYmpV0Z765NutDtf-_9l4i4rTVunZc4ZXERgzj9bgnpwW0H-Y7tNkua27pMSe6KPGiX45z5eT3cv4OKvX7rhDloygm5KAVnIAiqgFVe22CDJ0gWtTdKOSC0DpxmTqaw8UAmhEG8P-jfN4Y:1uGQRv:SUSyIKo7oUV5PhTKm1tB2zXZt35YGVLFBY7qmyB5Rvk	2025-05-31 22:56:11.83509+00
55foukracq4jpn0xs374uq4nzel8rcvv	.eJxVjEEOwiAQRe_C2pCBoRVcuu8ZyAxMbdVAUtqV8e7apAvd_vfef6lI2zrFrckS56wuylh1-h2Z0kPKTvKdyq3qVMu6zKx3RR-06aFmeV4P9-9gojZ9awhsbNd740JvPXZjRgZGwd6PyITOgZhR6BzAhdQheRHPOQuAMzaAen8A4no3aw:1qvh00:yhctGYupbEy40Q0ZmcOPHRsTkMHWw7_35_SJNGZeJo8	2023-11-08 16:44:52.165647+00
552m62sni39xnasl63hf5ozwijqwttwd	.eJxVjEEOwiAQRe_C2hAowoBL9z0DGYZBqoYmpV0Z765NutDtf-_9l4i4rTVunZc4ZXERgzj9bgnpwW0H-Y7tNkua27pMSe6KPGiX45z5eT3cv4OKvX7rhDloygm5KAVnIAiqgFVe22CDJ0gWtTdKOSC0DpxmTqaw8UAmhEG8P-jfN4Y:1qm7Jb:8oa1UuEGibSNcQZpeImRk3xhDmS9vCQGLG6l0lRx54Y	2023-10-13 06:49:31.513257+00
0xxx01q248yyhndopiupdne7f20nzj5j	.eJxVjEEOwiAQRe_C2pDOCAVcuu8ZyDCAVA0kpV0Z765NutDtf-_9l_C0rcVvPS1-juIiwKI4_a6B-JHqjuKd6q1JbnVd5iB3RR60y6nF9Lwe7t9BoV6-9VkZB8Fi1hYZBnbAozLWpTGorDViTjEq4mSDQc4AZoiELjtiMggs3h8eiThx:1qvmHa:_nCkhHX1B7D1Kdob6U5MBNrH4O37w_QnNyrB-mj7cB4	2023-11-08 22:23:22.916759+00
f4svn8fo290kgcvrmgl4z2o95mm3vsio	.eJxVjEEOwiAQRe_C2hBqmcK4dN8zkBmGStVAUtqV8e7apAvd_vfef6lA25rD1tISZlEX5dTpd2OKj1R2IHcqt6pjLesys94VfdCmxyrpeT3cv4NMLX9rPwgmsQCYgMAnNHgmkYjesgPBoWNmHwGNdQ6swamPIL2bjLGmI1HvD-RMN5Q:1qmbYj:fPIbmo78bi29WtyrnEmZuBd_doT5bV2XSVy8Y1aC5Kg	2023-10-14 15:07:09.230048+00
88gqet9mxnmer1cxjkzqhrtox1mcauff	.eJxVjMsOwiAQRf-FtSFARx4u3fcbyMAMUjU0Ke3K-O_apAvd3nPOfYmI21rj1nmJE4mL0HAWp981YX5w2xHdsd1mmee2LlOSuyIP2uU4Ez-vh_t3ULHXb12cZQQeis7KsnZQgireawIDgbUlBpMKD5nYsCNKakhBg7JE1qNF8f4ARHo4_w:1qneMZ:PhBFinJi0cJmrOn4u1hMpGgP9N-JCUZmAcampE9ig4E	2023-10-17 12:18:55.102932+00
xvexs1vakb7ely93n8tcpcn11uv651s5	.eJxVjEEOwiAQRe_C2pCBoRVcuu8ZyAxMbdVAUtqV8e7apAvd_vfef6lI2zrFrckS56wuylh1-h2Z0kPKTvKdyq3qVMu6zKx3RR-06aFmeV4P9-9gojZ9awhsbNd740JvPXZjRgZGwd6PyITOgZhR6BzAhdQheRHPOQuAMzaAen8A4no3aw:1qvmac:UOxjWBuCeTNBK8EenC7TDClnUn28k9RJqKxlF8A4xgY	2023-11-08 22:43:02.494262+00
mf1kf0k64a2n29px7xvxfkkszqctq7h6	.eJxVjEEOwiAQRe_C2hAowoBL9z0DGYZBqoYmpV0Z765NutDtf-_9l4i4rTVunZc4ZXERgzj9bgnpwW0H-Y7tNkua27pMSe6KPGiX45z5eT3cv4OKvX7rhDloygm5KAVnIAiqgFVe22CDJ0gWtTdKOSC0DpxmTqaw8UAmhEG8P-jfN4Y:1qnxsz:IVVMiad1Vvk8JlN3V-C8pGkA2Hk-A4lHhyPdaOJbnhM	2023-10-18 09:09:41.804947+00
4b3rxb1v6lj2f276b85gnsp79z2aukeh	.eJxVjDsOwjAQBe_iGlmxHf8o6XOGaNe7xgFkS_lUiLuTSCmgnZn33mKEbS3jtvA8TiSuIojLL0NIT66HoAfUe5Op1XWeUB6JPO0ih0b8up3t30GBpexrZB8tskNKjjvsAYMG0h0lMqo3MWSrMxnQmvqoVI7ZegBPuOPO2Sw-XxM8OMI:1qnyrH:n4scof-gSsxyrLRaXIg4U-9VrviW3VDBn_6jvpyGkg4	2023-10-18 10:11:59.248876+00
n6x4oj3g1swiatf994q9zbvn8yb3r1oi	.eJxVjEEOwiAQRe_C2hDAwoBL9z0DGQZGqoYmpV0Z765NutDtf-_9l4i4rTVuvSxxyuIigjj9bgnpUdoO8h3bbZY0t3WZktwVedAuxzmX5_Vw_w4q9vqtwQBaBYEUA2mGDINhSMaW4FUq3rNXjimctccwkGPWqE0ZHJEGna14fwDcdjfB:1qwRtb:aHi8bCMgxlGbYlyAyWvb3LrdxTpKnO4YP4bkBbvx7-k	2023-11-10 18:49:23.599968+00
k77j5wuub3xn5an7r6ptxnwsxcrstkc6	.eJxVjEEOwiAQRe_C2pCBoRVcuu8ZyAxMbdVAUtqV8e7apAvd_vfef6lI2zrFrckS56wuylh1-h2Z0kPKTvKdyq3qVMu6zKx3RR-06aFmeV4P9-9gojZ9awhsbNd740JvPXZjRgZGwd6PyITOgZhR6BzAhdQheRHPOQuAMzaAen8A4no3aw:1qo4JZ:c020cxYBb7pdwOR4ROkfqqfrmrKwV8kBJfhnSxas3Ko	2023-10-18 16:01:33.504255+00
qwak6i9ra977kymw1wjed9641crogexs	.eJxVjEEOwiAQRe_C2pCBoRVcuu8ZyAxMbdVAUtqV8e7apAvd_vfef6lI2zrFrckS56wuylh1-h2Z0kPKTvKdyq3qVMu6zKx3RR-06aFmeV4P9-9gojZ9awhsbNd740JvPXZjRgZGwd6PyITOgZhR6BzAhdQheRHPOQuAMzaAen8A4no3aw:1qxXep:dp9zJ75rsDRdp8AH709IDEu5iQU5ACrDD7f6Z5ZG0ZM	2023-11-13 19:10:39.777985+00
o2sauo058jqt68rorgj8kgpgop47xw20	.eJxVjEEOwiAQRe_C2hAowoBL9z0DGYZBqoYmpV0Z765NutDtf-_9l4i4rTVunZc4ZXERgzj9bgnpwW0H-Y7tNkua27pMSe6KPGiX45z5eT3cv4OKvX7rhDloygm5KAVnIAiqgFVe22CDJ0gWtTdKOSC0DpxmTqaw8UAmhEG8P-jfN4Y:1qxXwR:AIRPMHcsQJazsYyZ6sPwmkf7MafQxfVR4NwgucbJQtI	2023-11-13 19:28:51.576815+00
24c3nps2nnvdrt55nys2dw59b6bx7whb	.eJxVjEEOwiAQRe_C2hDAwoBL9z0DGQZGqoYmpV0Z765NutDtf-_9l4i4rTVuvSxxyuIigjj9bgnpUdoO8h3bbZY0t3WZktwVedAuxzmX5_Vw_w4q9vqtwQBaBYEUA2mGDINhSMaW4FUq3rNXjimctccwkGPWqE0ZHJEGna14fwDcdjfB:1qoQT3:3TaNrrtq5s0U586UrvlEy_ES317jxaAy8WrQKj6tsJo	2023-10-19 15:40:49.517925+00
d5bmpjwxmy1btb66lgd1xyibmscnigu9	.eJxVjDsOwjAQBe_iGlm24y8lPWewdr1rHECJFCcV4u4QKQW0b2beS2TY1pa3zkseSZyF0U6cfleE8uBpR3SH6TbLMk_rMqLcFXnQLq8z8fNyuH8HDXr71onZMCij0KhKmJyGgchGSNqqZKN2lglDDd76EA0P3qdSATHF6HxB8f4AMDM4Sg:1qyCxa:kU6VU_B00AULuRJfdCW6nI37jix0vm32-n9vIxFRQ6M	2023-11-15 15:16:46.13999+00
amyjly8d8dobgosb3z8n7famfcpu6pvi	.eJxVjEEOwiAQRe_C2hBgWgou3fcMhBkGqRqalHZlvLtt0oVu33v_v0WI21rC1ngJUxJXoTsrLr8UIz25Hio9Yr3Pkua6LhPKI5GnbXKcE79uZ_t3UGIr-3pI4Mmh1QzOoFWWTPYDGVRdz04R7dz7hDp5Q8o4BtYaHEbX5wxA4vMFKYQ4RA:1qoVdk:3s03sUxNHsx2aqha38CcGZ8SMendBecmoivXLh_uub8	2023-10-19 21:12:12.779182+00
yzvkx5oew17tocn1msa2rmmhgve27xcz	.eJxVjEsOwiAUAO_C2pDyB5fuPQOBx3tSNTQp7cp4dyXpQrczk3mxmPatxr3jGufCzkxox06_NCd4YBuq3FO7LRyWtq1z5iPhh-38uhR8Xo72b1BTr2NsYKIclMgWHSRFuShjA0iHVIqFSX2dJwvSEGotAgpnsw6A5CX4xN4fRao43Q:1qp4ao:c-sQqc5jwa8WeirVYVGV5sRVn-tv7-2sHT-gpaiS_fs	2023-10-21 10:31:30.010032+00
0npofj006sabqn3bwjkx7wucfkuw5puv	.eJxVjEEOwiAQRe_C2pApMFJcuu8ZyMCAVA0kpV0Z765NutDtf-_9l_C0rcVvPS1-ZnERajiL0-8aKD5S3RHfqd6ajK2uyxzkrsiDdjk1Ts_r4f4dFOrlW4NyZDSghYzWgUUkGBGIWUejFCXl3GhMiugoIKHKwbHOwISG9WDE-wMBMTed:1qyezd:cQcIre92OwDENoe0-ZooP0Nt_6rby3een1eoO7OKaM0	2023-11-16 21:12:45.918491+00
39n9orthz2ga3u2787upykfyv8070ewa	.eJxVjEEOwiAQRe_C2hDAwoBL9z0DGQZGqoYmpV0Z765NutDtf-_9l4i4rTVuvSxxyuIigjj9bgnpUdoO8h3bbZY0t3WZktwVedAuxzmX5_Vw_w4q9vqtwQBaBYEUA2mGDINhSMaW4FUq3rNXjimctccwkGPWqE0ZHJEGna14fwDcdjfB:1qp7DO:khgOgXu-zO3Kpob-BlhXfojnQgEG_-KO5Tf-imYnLgw	2023-10-21 13:19:30.27216+00
j06by650l6qxxci7iq6it15h171uzwvt	.eJxVjEEOwiAQRe_C2hBqmcK4dN8zkBmGStVAUtqV8e7apAvd_vfef6lA25rD1tISZlEX5dTpd2OKj1R2IHcqt6pjLesys94VfdCmxyrpeT3cv4NMLX9rPwgmsQCYgMAnNHgmkYjesgPBoWNmHwGNdQ6swamPIL2bjLGmI1HvD-RMN5Q:1qzKpH:Cb2UZ3b7Wsy-nRXRclzF_bFk7kxBRwWhEIULBytdDvM	2023-11-18 17:52:51.581345+00
fyfcmxl5c3obof0x5wy8qgmsnj3qh97a	.eJxVjEEOwiAQRe_C2hCGARtcuvcMhGEYqRqalHbVeHdt0oVu_3vvbyqmdalx7WWOI6uLQnX63SjlZ2k74Edq90nnqS3zSHpX9EG7vk1cXtfD_TuoqddvLRjEiICBgME7KOgIBBjBeA7sbSYwGSWgxcAu-eJpQCAeBMuZrHp_ANB_N5U:1qqA8e:nCsjuQv3OvsPw3A3ovO32KvS57iNUOpd34pHo_n-27M	2023-10-24 10:38:56.283544+00
is05ki7viju34zhlrhor7tw0fbangam3	.eJxVjEEOwiAQRe_C2hAowoBL9z0DGYZBqoYmpV0Z765NutDtf-_9l4i4rTVunZc4ZXERgzj9bgnpwW0H-Y7tNkua27pMSe6KPGiX45z5eT3cv4OKvX7rhDloygm5KAVnIAiqgFVe22CDJ0gWtTdKOSC0DpxmTqaw8UAmhEG8P-jfN4Y:1qqA8s:t5TMAX1_XjBZ8DCovEkFzqXLvLCsBEtqnGxdvLdtr4M	2023-10-24 10:39:10.273514+00
kawqgppn1plzbv0g0agxbq8xibw5rfd9	.eJxVjEEOwiAQRe_C2hAoRRiX7nsGMsCMVA0kpV0Z765NutDtf-_9lwi4rSVsnZYwZ3ERevTi9LtGTA-qO8p3rLcmU6vrMke5K_KgXU4t0_N6uH8HBXv51sYqjegxkQOlPTAnl5GycggAPCZiUBzJcoTBkmHNWTs_KGvOyowo3h9SHTja:1qqXbM:fWhvyV7JK-5j7WPUF10ySJRwPhxmfz-PU91CPoHLojg	2023-10-25 11:42:08.26009+00
2nqgd42znzpjwmyzzzu0d83quym12lzq	.eJxVjM0OwiAQhN-FsyG0sPx49O4zkGUXpWogKe3J-O62SQ96m8z3zbxFxHUpce15jhOLsxhMEKffNiE9c90RP7Dem6RWl3lKclfkQbu8Ns6vy-H-HRTsZVsryzgCaII8kjMKiQC81pg9O-XYgLdDCgntzbHWPiTyJhAZxWZLWny-KW04Fg:1qrEdm:RZmu1UgKlD26vSwZMZQsMtIRo80iUdhZ7n0f1E9XTPs	2023-10-27 09:39:30.646174+00
6wjkadgchmsdtcfcr8utign9gq0az21e	.eJxVjEEOwiAQRe_C2hCGARtcuvcMhGEYqRqalHbVeHdt0oVu_3vvbyqmdalx7WWOI6uLQnX63SjlZ2k74Edq90nnqS3zSHpX9EG7vk1cXtfD_TuoqddvLRjEiICBgME7KOgIBBjBeA7sbSYwGSWgxcAu-eJpQCAeBMuZrHp_ANB_N5U:1r0Rw5:uE15565dZLjUKc-kFmsD0Ltm4x7g9m0dlma71OOQJRU	2023-11-21 19:40:29.592209+00
6vl0361m9shpzfvvra6u7coyj8t3pf8i	.eJxVjDsOwjAQRO_iGlm2iX-U9JzBWu-ucQA5Uj4V4u44Ugpoppj3Zt4iwbbWtC08p5HERZx9EKffNgM-ue2IHtDuk8SprfOY5a7Igy7yNhG_rof7d1BhqX1dvAnOWW_KECkixgADqGJJRR1K7gGguEsFGC2h0SoiUGAi1sFF8fkCOHs48A:1uVYHf:6uK7VnQMHTH1SQbtpTkUm37RjnItzIMgTptgcleBf_E	2025-07-12 16:20:07.419595+00
6pdvko718k7wp1j0f8m2v0rarc842jwo	.eJxVjEEOwiAQRe_C2hCGgXZw6d4zkOkAtmpoUtqV8e7apAvd_vfef6nI2zrGreUlTkmdVadOv9vA8sh1B-nO9TZrmeu6TIPeFX3Qpq9zys_L4f4djNzGb51FTCLj0EKBHj35QCCheJJgAW3oHXNGIm-FrEDq0GAHDgZTGAXV-wO9ojav:1r0lS8:J9UeAiA3BzxHLD3s6Jj1cWpbUd_12Cm-kTmpDjJSjXQ	2023-11-22 16:30:52.842006+00
6b329ke80t4ilp0le24rufdw9kbyag4i	.eJxVjEEOwiAQRe_C2hDAwoBL9z0DGQZGqoYmpV0Z765NutDtf-_9l4i4rTVuvSxxyuIigjj9bgnpUdoO8h3bbZY0t3WZktwVedAuxzmX5_Vw_w4q9vqtwQBaBYEUA2mGDINhSMaW4FUq3rNXjimctccwkGPWqE0ZHJEGna14fwDcdjfB:1r2ExC:Oj-EWYfgVZQDN_I27f3jTiB5PTdzD9PYkwSmTdk2qOQ	2023-11-26 18:13:02.117924+00
mitxlxys314ttnmulkjbt2fif34v1unq	.eJxVjEEOwiAQRe_C2pCBoRVcuu8ZyAxMbdVAUtqV8e7apAvd_vfef6lI2zrFrckS56wuylh1-h2Z0kPKTvKdyq3qVMu6zKx3RR-06aFmeV4P9-9gojZ9awhsbNd740JvPXZjRgZGwd6PyITOgZhR6BzAhdQheRHPOQuAMzaAen8A4no3aw:1r3JuP:78XbX7hhrr5iXlOIYiRB-n8cvkQp9DumXDAfXU9enjo	2023-11-29 17:42:37.981999+00
jmsu351k1pvvtoj2g0yjfaa3a963jcej	.eJxVjEEOwiAQRe_C2hDAwoBL9z0DGQZGqoYmpV0Z765NutDtf-_9l4i4rTVuvSxxyuIigjj9bgnpUdoO8h3bbZY0t3WZktwVedAuxzmX5_Vw_w4q9vqtwQBaBYEUA2mGDINhSMaW4FUq3rNXjimctccwkGPWqE0ZHJEGna14fwDcdjfB:1r6aUz:iE8UOXJTbZsBEfSy0TLAnM9oufhEJ0d6nX_VKLeEe7o	2023-12-08 18:01:53.021142+00
93po8d12f6h75bxf8vwhgllgjz22n6ly	.eJxVjEEOwiAQRe_C2pCBoRVcuu8ZyAxMbdVAUtqV8e7apAvd_vfef6lI2zrFrckS56wuylh1-h2Z0kPKTvKdyq3qVMu6zKx3RR-06aFmeV4P9-9gojZ9awhsbNd740JvPXZjRgZGwd6PyITOgZhR6BzAhdQheRHPOQuAMzaAen8A4no3aw:1r7fXF:FpdS4bYK3r3uNOmGbPqcnX0GWzo04RCgACOTlSIlvNU	2023-12-11 17:36:41.579574+00
75p1828j5l9rbk3pqtaasw90iabakfok	.eJxVjEEOwiAQRe_C2hAowoBL9z0DGYZBqoYmpV0Z765NutDtf-_9l4i4rTVunZc4ZXERgzj9bgnpwW0H-Y7tNkua27pMSe6KPGiX45z5eT3cv4OKvX7rhDloygm5KAVnIAiqgFVe22CDJ0gWtTdKOSC0DpxmTqaw8UAmhEG8P-jfN4Y:1r7goq:lOVdw-JPpgm5GH80QTch1EjV9Nox2nvEp088lP1-Y3E	2023-12-11 18:58:56.949524+00
ymyc7obmw06pu3y6chbjpyecfmovxjuv	.eJxVjEEOwiAQRe_C2pCBoRVcuu8ZyAxMbdVAUtqV8e7apAvd_vfef6lI2zrFrckS56wuylh1-h2Z0kPKTvKdyq3qVMu6zKx3RR-06aFmeV4P9-9gojZ9awhsbNd740JvPXZjRgZGwd6PyITOgZhR6BzAhdQheRHPOQuAMzaAen8A4no3aw:1r984D:dCpWxYyHrLwVYpfPAmqtARu-3XD0J8N_261S8QuUccM	2023-12-15 18:16:45.604405+00
1ghgbjzu49tebis7uj8j70wemxpcn4gt	.eJxVjDsOwjAQBe_iGlm24y8lPWewdr1rHECJFCcV4u4QKQW0b2beS2TY1pa3zkseSZyF0U6cfleE8uBpR3SH6TbLMk_rMqLcFXnQLq8z8fNyuH8HDXr71onZMCij0KhKmJyGgchGSNqqZKN2lglDDd76EA0P3qdSATHF6HxB8f4AMDM4Sg:1rAA6K:D3DpFkmoE8_GfXPlkEvf6MsRlhHrLg7RcXaQkkCl2gw	2023-12-18 14:39:12.706339+00
0s48jtkjleqvjdr7c1xf191dhf83290a	.eJxVjEEOwiAQRe_C2hCGARtcuvcMhGEYqRqalHbVeHdt0oVu_3vvbyqmdalx7WWOI6uLQnX63SjlZ2k74Edq90nnqS3zSHpX9EG7vk1cXtfD_TuoqddvLRjEiICBgME7KOgIBBjBeA7sbSYwGSWgxcAu-eJpQCAeBMuZrHp_ANB_N5U:1rAElV:_glupzjwrsAKhan2Dd1xTXttDf10t-kHdZrhujZ801w	2023-12-18 19:38:01.050599+00
ajfz5jw9yosahvil36xe9nel9nukunr7	.eJxVjEEOwiAQRe_C2hCGARtcuvcMhGEYqRqalHbVeHdt0oVu_3vvbyqmdalx7WWOI6uLQnX63SjlZ2k74Edq90nnqS3zSHpX9EG7vk1cXtfD_TuoqddvLRjEiICBgME7KOgIBBjBeA7sbSYwGSWgxcAu-eJpQCAeBMuZrHp_ANB_N5U:1rBHiR:rmDCMjomXjZTEzY-aiMQM8rE7RWHxVqIOwGRrnZhK0g	2023-12-21 16:59:11.248664+00
cweef1vvq7fes9q3sz1gyn717zbd1kq1	.eJxVjEEOwiAQRe_C2hCZQiku3XsGMsxMbdVAUtqV8e6WpAvd_bz38t8q4rZOcauyxJnVRYHx6vRLE9JTclP8wHwvmkpelznplujDVn0rLK_r0f4dTFindmwlAAw9EcIwUNt2ZwhnQRc4GDeyUEAae-9TxyC2M2CcBWd3y-rzBSGMN-A:1rCNz6:d8unhaPKysV14uJizjUSK_WyIYpGcPMvNjMFVNbYmtw	2023-12-24 17:52:56.910037+00
ucj2p2eul7v3j2k1qq324a068j6xy371	.eJxVjEEOwiAQRe_C2pCBoRVcuu8ZyAxMbdVAUtqV8e7apAvd_vfef6lI2zrFrckS56wuylh1-h2Z0kPKTvKdyq3qVMu6zKx3RR-06aFmeV4P9-9gojZ9awhsbNd740JvPXZjRgZGwd6PyITOgZhR6BzAhdQheRHPOQuAMzaAen8A4no3aw:1rCvbv:OID4Sh0cF_nE94iDer-SOmVveEITtJHWMU261M9aI6U	2023-12-26 05:47:15.461269+00
phhvd0amsg045t3tqadqfkjselkyaj31	.eJxVjEEOwiAQRe_C2hAowoBL9z0DGYZBqoYmpV0Z765NutDtf-_9l4i4rTVunZc4ZXERgzj9bgnpwW0H-Y7tNkua27pMSe6KPGiX45z5eT3cv4OKvX7rhDloygm5KAVnIAiqgFVe22CDJ0gWtTdKOSC0DpxmTqaw8UAmhEG8P-jfN4Y:1rD0bj:hwp2vFkIULgl4GbkisLHKLy-4g_iRO7Hy9VUjCcNfMg	2023-12-26 11:07:23.304284+00
cway7u751xgvu4t4kdlpwrxppvzkg076	.eJxVjEEOwiAQRe_C2hAowoBL9z0DGYZBqoYmpV0Z765NutDtf-_9l4i4rTVunZc4ZXERgzj9bgnpwW0H-Y7tNkua27pMSe6KPGiX45z5eT3cv4OKvX7rhDloygm5KAVnIAiqgFVe22CDJ0gWtTdKOSC0DpxmTqaw8UAmhEG8P-jfN4Y:1rFJFC:h4I6AUDE_2HS1_R745ZAx4_4Z3FXnbu8wKGZQkhl2Uw	2024-01-01 19:25:38.805303+00
4hkztdfo3bvgigv1zrb5g4xhybh6ask4	.eJxVjEEOwiAQRe_C2hAowoBL9z0DGYZBqoYmpV0Z765NutDtf-_9l4i4rTVunZc4ZXERgzj9bgnpwW0H-Y7tNkua27pMSe6KPGiX45z5eT3cv4OKvX7rhDloygm5KAVnIAiqgFVe22CDJ0gWtTdKOSC0DpxmTqaw8UAmhEG8P-jfN4Y:1rGEf2:RluO-IYbvWkev7W14nAYBF141cQpGOUtg3T73ne213M	2024-01-04 08:44:08.417231+00
z5bqk80d520fh0p2v9fz13l8nuuef5e9	.eJxVjEEOwiAQRe_C2hCGgXZw6d4zkOkAtmpoUtqV8e7apAvd_vfef6nI2zrGreUlTkmdVadOv9vA8sh1B-nO9TZrmeu6TIPeFX3Qpq9zys_L4f4djNzGb51FTCLj0EKBHj35QCCheJJgAW3oHXNGIm-FrEDq0GAHDgZTGAXV-wO9ojav:1rHkVZ:OdPy2THpQnpejra69YQKo5biX7HqEwZnUDbLg9SGNXY	2024-01-08 12:56:37.090142+00
jbglw39974oglhwxe5pk88ct4sk36zhl	.eJxVjEEOwiAQRe_C2pCBoRVcuu8ZyAxMbdVAUtqV8e7apAvd_vfef6lI2zrFrckS56wuylh1-h2Z0kPKTvKdyq3qVMu6zKx3RR-06aFmeV4P9-9gojZ9awhsbNd740JvPXZjRgZGwd6PyITOgZhR6BzAhdQheRHPOQuAMzaAen8A4no3aw:1rVrUg:Oca9NOx8UG4P2ywqOhV7dmTvTHh13MOMbBB4vti7AAA	2024-02-16 11:14:02.572184+00
g5twa0yloo0qc55k11qj6f0gyv3rqdly	.eJxVjEEOwiAQRe_C2hBqmcK4dN8zkBmGStVAUtqV8e7apAvd_vfef6lA25rD1tISZlEX5dTpd2OKj1R2IHcqt6pjLesys94VfdCmxyrpeT3cv4NMLX9rPwgmsQCYgMAnNHgmkYjesgPBoWNmHwGNdQ6swamPIL2bjLGmI1HvD-RMN5Q:1rWK7a:7p5uk-hSBEGKz1qj19tkcJAk2bb4Gzf0Zu58KWjDK4I	2024-02-17 17:48:06.192005+00
ryqprbcflkat5br6pdmxstgjgk0k4u9l	.eJxVjEEOwiAQRe_C2hCGARtcuvcMhGEYqRqalHbVeHdt0oVu_3vvbyqmdalx7WWOI6uLQnX63SjlZ2k74Edq90nnqS3zSHpX9EG7vk1cXtfD_TuoqddvLRjEiICBgME7KOgIBBjBeA7sbSYwGSWgxcAu-eJpQCAeBMuZrHp_ANB_N5U:1rWzv4:xCK7utVtW2TaT2l0WCyfVmE70BkmPK5MUJJQQd9MNn0	2024-02-19 14:25:58.349157+00
c9iyjaqca9h9tuk5xz6x61fj1nn08inr	.eJxVjEEOwiAQRe_C2hCGgXZw6d4zkOkAtmpoUtqV8e7apAvd_vfef6nI2zrGreUlTkmdVadOv9vA8sh1B-nO9TZrmeu6TIPeFX3Qpq9zys_L4f4djNzGb51FTCLj0EKBHj35QCCheJJgAW3oHXNGIm-FrEDq0GAHDgZTGAXV-wO9ojav:1rXNm2:wqaa6Vxa3WLAXJGXwVj45S8GDRNnz0KoyPnumYrnfiw	2024-02-20 15:54:14.333764+00
0b9042kbqpwoqtg0fzl7n3w68jfs73i1	.eJxVjMsOwiAQRf-FtSEMUB4u3fsNZIahUjU0Ke3K-O_apAvd3nPOfYmE21rT1suSJhZnoSGI0-9KmB-l7Yjv2G6zzHNbl4nkrsiDdnmduTwvh_t3ULHXb43eGkcAigg4A3nS7ILyGEkbzpp9BmMtOwY_-hIomljUMIDSGBBH8f4ALuo4UQ:1rXppc:XHQiVj0_s1goc9wOT8Q5tF__r80sYYCO42TPmisZBlg	2024-02-21 21:51:48.4431+00
zbzqhe2kbg7o7f3ihb33wlhht10o7ljo	.eJxVjEEOwiAQRe_C2hDAwoBL9z0DGQZGqoYmpV0Z765NutDtf-_9l4i4rTVuvSxxyuIigjj9bgnpUdoO8h3bbZY0t3WZktwVedAuxzmX5_Vw_w4q9vqtwQBaBYEUA2mGDINhSMaW4FUq3rNXjimctccwkGPWqE0ZHJEGna14fwDcdjfB:1rY7RK:EOspt9eZ5F6v7aUQDtlEV92Vz9I0WfE5PO0UoON5GN4	2024-02-22 16:39:54.962137+00
3pegmwnxnkd2ncyzqieij24hi0ms0o7n	.eJxVjEEOwiAQRe_C2hAowoBL9z0DGYZBqoYmpV0Z765NutDtf-_9l4i4rTVunZc4ZXERgzj9bgnpwW0H-Y7tNkua27pMSe6KPGiX45z5eT3cv4OKvX7rhDloygm5KAVnIAiqgFVe22CDJ0gWtTdKOSC0DpxmTqaw8UAmhEG8P-jfN4Y:1rblbA:bdUudVyZXjnyYCLcOACt_WgM9To0OLcBLhl4T9Wyro4	2024-03-03 18:09:08.301752+00
dhlz6l3bne2a7jcpwdmsy568icis9er6	.eJxVjMsOwiAQRf-FtSGF8hCX7vsNZGYYpGogKe3K-O_apAvd3nPOfYkI21ri1nmJcxIXcRan3w2BHlx3kO5Qb01Sq-syo9wVedAup5b4eT3cv4MCvXxro5xFdIaBMwRGA8GTVorQGzWCtm5QmJl0st4HHuzoRuNIZQzeOJvE-wPzOzfU:1rcUcm:02KUM-MLg5Oa1NAXpmLUbIaGfgnRPln48DpHiIqzh1o	2024-03-05 18:13:48.562029+00
8u1xvegcezvn5sz01tz0dibi8kswvnub	.eJxVjEEOwiAQRe_C2hDAwoBL9z0DGQZGqoYmpV0Z765NutDtf-_9l4i4rTVuvSxxyuIigjj9bgnpUdoO8h3bbZY0t3WZktwVedAuxzmX5_Vw_w4q9vqtwQBaBYEUA2mGDINhSMaW4FUq3rNXjimctccwkGPWqE0ZHJEGna14fwDcdjfB:1rebrx:5WRJVtd97rusMTF0nhRViI0rlPqosZn11J2cq2m5kic	2024-03-11 14:22:13.150365+00
airvr3cf1goluv2atxnljxskl8xqzkaz	.eJxVjEEOwiAQRe_C2hBkCrQu3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFWn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX9rwC6JoWDYQiAgIYcDJXBkHBpDvUMrIbAzCfoYkeQMPpFPg3eQOlbvD_8wOK8:1usl3M:K1EdxjmWpzGsaNESaW6EiPhbOeX4LmYwQAF_6P6tzhc	2025-09-14 16:37:16.990885+00
ndw2kheauciu5frsp12cbfesn2zrlg4c	.eJxVjEEOwiAQRe_C2hBqmcK4dN8zkBmGStVAUtqV8e7apAvd_vfef6lA25rD1tISZlEX5dTpd2OKj1R2IHcqt6pjLesys94VfdCmxyrpeT3cv4NMLX9rPwgmsQCYgMAnNHgmkYjesgPBoWNmHwGNdQ6swamPIL2bjLGmI1HvD-RMN5Q:1rhoY8:rhohlgJfZFrs5iCmJHFQJo5Z8kHnP-CA0RrG4KHWHS4	2024-03-20 10:31:00.641426+00
ud4k7qts4ymak26hx6mn4y7os1gm9tvw	.eJxVjEEOwiAQRe_C2pCBoRVcuu8ZyAxMbdVAUtqV8e7apAvd_vfef6lI2zrFrckS56wuylh1-h2Z0kPKTvKdyq3qVMu6zKx3RR-06aFmeV4P9-9gojZ9awhsbNd740JvPXZjRgZGwd6PyITOgZhR6BzAhdQheRHPOQuAMzaAen8A4no3aw:1riHlc:Nq4XC3hqfo4Kiaw8Sn07c43QQiZeIZxVmr8BqCkHbGU	2024-03-21 17:42:52.009274+00
6b6itbljlvjtcix1vt3dp7bwpnwc5i3g	.eJxVjEEOwiAQRe_C2hAowoBL9z0DGYZBqoYmpV0Z765NutDtf-_9l4i4rTVunZc4ZXERgzj9bgnpwW0H-Y7tNkua27pMSe6KPGiX45z5eT3cv4OKvX7rhDloygm5KAVnIAiqgFVe22CDJ0gWtTdKOSC0DpxmTqaw8UAmhEG8P-jfN4Y:1rifAT:SdbhytI_9hdEcv7noQKzBfHYMKAxNYQBpfJl8xAlByc	2024-03-22 18:42:05.08473+00
c2yqxw31mhe44gjqu94owcoqo6zmm50d	.eJxVjEEOwiAQRe_C2hAowoBL9z0DGYZBqoYmpV0Z765NutDtf-_9l4i4rTVunZc4ZXERgzj9bgnpwW0H-Y7tNkua27pMSe6KPGiX45z5eT3cv4OKvX7rhDloygm5KAVnIAiqgFVe22CDJ0gWtTdKOSC0DpxmTqaw8UAmhEG8P-jfN4Y:1rkK7M:6z8De-4XzQWLdMeviJf9BSBZUm2MJqONXTWWfb0TGjs	2024-03-27 08:37:44.794098+00
zlblbzqxp3fcakay71y7uxt44n8rn8n3	.eJxVjEsOAiEQBe_C2hB-LejSvWcgDd3IqIFkmFkZ766TzEK3r6reS0RclxrXwXOcSJyFFoffLWF-cNsA3bHdusy9LfOU5KbInQ557cTPy-7-HVQc9VsDkfbFIrNSR5-AHDgMJZ9s9j44MMxsqQTUwGCcUcr5VIrGgCXroMT7A_HEODA:1rlVO0:JutlBpClEMWWbIMAdZ9kGLbO0zChsY9afT12gZ6MgyQ	2024-03-30 14:51:48.900289+00
fc4s4xg5v0p9dfewd5c3kf68y5w4u8ks	.eJxVjEEOwiAQRe_C2pCBoRVcuu8ZyAxMbdVAUtqV8e7apAvd_vfef6lI2zrFrckS56wuylh1-h2Z0kPKTvKdyq3qVMu6zKx3RR-06aFmeV4P9-9gojZ9awhsbNd740JvPXZjRgZGwd6PyITOgZhR6BzAhdQheRHPOQuAMzaAen8A4no3aw:1rpD0j:Qo1ZNRwvvcCkn5UJx8dwLDJNIpz_j-uiJwu7Dptwvkc	2024-04-09 20:03:05.976682+00
y9dpvquka4o91nrcpcnzn7jlp27kb4gc	.eJxVjEEOwiAQRe_C2hBqmcK4dN8zkBmGStVAUtqV8e7apAvd_vfef6lA25rD1tISZlEX5dTpd2OKj1R2IHcqt6pjLesys94VfdCmxyrpeT3cv4NMLX9rPwgmsQCYgMAnNHgmkYjesgPBoWNmHwGNdQ6swamPIL2bjLGmI1HvD-RMN5Q:1rttzx:N7QntcL9rjy3TudleJ-sObR3WOKwb7KbxJyJ7Pwyfmg	2024-04-22 18:45:41.840174+00
u6wgfl5p38ku8enladj1f98lju3eh5f6	.eJxVjEEOwiAQRe_C2hCGgXZw6d4zkOkAtmpoUtqV8e7apAvd_vfef6nI2zrGreUlTkmdVadOv9vA8sh1B-nO9TZrmeu6TIPeFX3Qpq9zys_L4f4djNzGb51FTCLj0EKBHj35QCCheJJgAW3oHXNGIm-FrEDq0GAHDgZTGAXV-wO9ojav:1rwgsr:QoOcbOdmBWm8t79U-QNlYdNjqwHQflNly4yXDFuB1lE	2024-04-30 11:21:53.184493+00
9zewlid7x3vp7n63hcbminwmq331z1h9	.eJxVjEEOwiAQRe_C2pCBoRVcuu8ZyAxMbdVAUtqV8e7apAvd_vfef6lI2zrFrckS56wuylh1-h2Z0kPKTvKdyq3qVMu6zKx3RR-06aFmeV4P9-9gojZ9awhsbNd740JvPXZjRgZGwd6PyITOgZhR6BzAhdQheRHPOQuAMzaAen8A4no3aw:1rwm1M:IKd5VJU-ldallZLUrzpMTgUDINaH-Odw2MREpn66bOo	2024-04-30 16:51:00.40157+00
twvbu3dio48j8683g95is5l8c8xqkkpm	.eJxVjEEOwiAQRe_C2hDAwoBL9z0DGQZGqoYmpV0Z765NutDtf-_9l4i4rTVuvSxxyuIigjj9bgnpUdoO8h3bbZY0t3WZktwVedAuxzmX5_Vw_w4q9vqtwQBaBYEUA2mGDINhSMaW4FUq3rNXjimctccwkGPWqE0ZHJEGna14fwDcdjfB:1rxV9C:GegDQWK_cUw01_emIAcOOFd034s4nUOROCfpyNwx_CE	2024-05-02 17:02:06.534168+00
917oxl9sxkg6auu9juwzqihdj8xram39	.eJxVjEEOwiAQRe_C2hCGARtcuvcMhGEYqRqalHbVeHdt0oVu_3vvbyqmdalx7WWOI6uLQnX63SjlZ2k74Edq90nnqS3zSHpX9EG7vk1cXtfD_TuoqddvLRjEiICBgME7KOgIBBjBeA7sbSYwGSWgxcAu-eJpQCAeBMuZrHp_ANB_N5U:1rxXE5:Bsqi8Yhv7FME7RSNVcHaHWvgwgfNVxaHZqr7LEGuL5w	2024-05-02 19:15:17.382977+00
oordldsxhrwn0gaxkwliu32tuvt9d7no	.eJxVjEEOwiAQRe_C2hCZQiku3XsGMsxMbdVAUtqV8e6WpAvd_bz38t8q4rZOcauyxJnVRYHx6vRLE9JTclP8wHwvmkpelznplujDVn0rLK_r0f4dTFindmwlAAw9EcIwUNt2ZwhnQRc4GDeyUEAae-9TxyC2M2CcBWd3y-rzBSGMN-A:1s29KB:4FbMvPMZT7ulk1t0o5fdO28L19_V4HoDX0PlT1Aki6M	2024-05-15 12:44:39.013587+00
tqfd1uer3gzh9my5wu34v18dr5eklj7f	.eJxVjEEOwiAQRe_C2hDAwoBL9z0DGQZGqoYmpV0Z765NutDtf-_9l4i4rTVuvSxxyuIigjj9bgnpUdoO8h3bbZY0t3WZktwVedAuxzmX5_Vw_w4q9vqtwQBaBYEUA2mGDINhSMaW4FUq3rNXjimctccwkGPWqE0ZHJEGna14fwDcdjfB:1s2HAw:tg2M4P0elkOW167KNpprD9nJsRRG1yP3SpCntLh14Fo	2024-05-15 21:07:38.552828+00
gwjrbbactxrkbdjpsizrb3yy5zwtklii	.eJxVjEEOwiAQRe_C2hCGARtcuvcMhGEYqRqalHbVeHdt0oVu_3vvbyqmdalx7WWOI6uLQnX63SjlZ2k74Edq90nnqS3zSHpX9EG7vk1cXtfD_TuoqddvLRjEiICBgME7KOgIBBjBeA7sbSYwGSWgxcAu-eJpQCAeBMuZrHp_ANB_N5U:1s4lM3:Zx3tir0HWWm48YRA6qm0pbFYxZRBuPfnziV3GnWUL14	2024-05-22 17:45:23.097522+00
m7ohhy0iwilwjfsb6e9ns2gp5trcqrt2	.eJxVjEEOwiAQRe_C2hCGgXZw6d4zkOkAtmpoUtqV8e7apAvd_vfef6nI2zrGreUlTkmdVadOv9vA8sh1B-nO9TZrmeu6TIPeFX3Qpq9zys_L4f4djNzGb51FTCLj0EKBHj35QCCheJJgAW3oHXNGIm-FrEDq0GAHDgZTGAXV-wO9ojav:1s6tCX:c6qOE0dZcrXWKti40hDlH0ou5-GCbEfL-NHJoPRBhKQ	2024-05-28 14:32:21.525853+00
9tqazi4hbamnla1e1mbaewwap8uxmvez	.eJxVjEEOwiAQRe_C2hAowoBL9z0DGYZBqoYmpV0Z765NutDtf-_9l4i4rTVunZc4ZXERgzj9bgnpwW0H-Y7tNkua27pMSe6KPGiX45z5eT3cv4OKvX7rhDloygm5KAVnIAiqgFVe22CDJ0gWtTdKOSC0DpxmTqaw8UAmhEG8P-jfN4Y:1s9UUK:7J-iRwPBilPQKbxEJa64LFn8KAvg4gnORIWrUwANzyk	2024-06-04 18:45:28.171423+00
j214k5s330hwt4d2se1ahfuiott214ce	.eJxVjEEOwiAQRe_C2pDC0AIu3XsGMgODVA0kpV0Z765NutDtf-_9lwi4rSVsnZcwJ3EWIE6_G2F8cN1BumO9NRlbXZeZ5K7Ig3Z5bYmfl8P9OyjYy7e2AwETZM5RjY7UgNGD1Tp6k3zMSJNXVgM4TZNjNEReZz8qSAzOAIn3B_N_OAU:1s9UVQ:xdumf3YnVv9PdY1YsCe_uXHA5VbRgYdbNNt3Cyxk-70	2024-06-04 18:46:36.830932+00
dgp42zesirxv29lukdizxdn5cj72o0ok	.eJxVjEEOwiAQRe_C2hBqmcK4dN8zkBmGStVAUtqV8e7apAvd_vfef6lA25rD1tISZlEX5dTpd2OKj1R2IHcqt6pjLesys94VfdCmxyrpeT3cv4NMLX9rPwgmsQCYgMAnNHgmkYjesgPBoWNmHwGNdQ6swamPIL2bjLGmI1HvD-RMN5Q:1sADOZ:efcjUFmAf5azcHLPczJamPgf2OabQQap1zhb6EHlH8Y	2024-06-06 18:42:31.444722+00
dx6gwugybly5v5uh8b9c5vjcfooxdq4b	.eJxVjEEOwiAQRe_C2hAowoBL9z0DGYZBqoYmpV0Z765NutDtf-_9l4i4rTVunZc4ZXERgzj9bgnpwW0H-Y7tNkua27pMSe6KPGiX45z5eT3cv4OKvX7rhDloygm5KAVnIAiqgFVe22CDJ0gWtTdKOSC0DpxmTqaw8UAmhEG8P-jfN4Y:1sJeNI:3WTTARv38DmqpaPM7pdIA0QZ-i433nR25JRYkj3V6nU	2024-07-02 19:20:12.594802+00
fx9kfruj55cumjfijtwlgccoukddyyut	.eJxVjEEOwiAQRe_C2pDC0AIu3XsGMgODVA0kpV0Z765NutDtf-_9lwi4rSVsnZcwJ3EWIE6_G2F8cN1BumO9NRlbXZeZ5K7Ig3Z5bYmfl8P9OyjYy7e2AwETZM5RjY7UgNGD1Tp6k3zMSJNXVgM4TZNjNEReZz8qSAzOAIn3B_N_OAU:1sfE55:elW5JWWJWnIUpQHqZa1iylW_jIojYSAmcCbHgrf2GZM	2024-08-31 07:42:35.537896+00
r355d2cnxjda1su8f71lm50b2sploycw	.eJxVjEEOwiAQRe_C2hAowoBL9z0DGYZBqoYmpV0Z765NutDtf-_9l4i4rTVunZc4ZXERgzj9bgnpwW0H-Y7tNkua27pMSe6KPGiX45z5eT3cv4OKvX7rhDloygm5KAVnIAiqgFVe22CDJ0gWtTdKOSC0DpxmTqaw8UAmhEG8P-jfN4Y:1sgPYZ:ggdKt7-v77LC2-oYcqM1kxCxY8_6VL8vdyOMSq4d2JU	2024-09-03 14:09:55.627807+00
gk7cm6v2ntm1zkbfmntkik0r8pjay92u	.eJxVjEEOwiAQRe_C2hAowoBL9z0DGYZBqoYmpV0Z765NutDtf-_9l4i4rTVunZc4ZXERgzj9bgnpwW0H-Y7tNkua27pMSe6KPGiX45z5eT3cv4OKvX7rhDloygm5KAVnIAiqgFVe22CDJ0gWtTdKOSC0DpxmTqaw8UAmhEG8P-jfN4Y:1sgQNQ:g-ABtKgD7gvbE1nKLMQJJMKHP0-UjmoUNfc3xmWz-G4	2024-09-03 15:02:28.646916+00
p4pg67q46fespv76t6ustgg4au02e2l3	.eJxVjEEOwiAQRe_C2hAowoBL9z0DGYZBqoYmpV0Z765NutDtf-_9l4i4rTVunZc4ZXERgzj9bgnpwW0H-Y7tNkua27pMSe6KPGiX45z5eT3cv4OKvX7rhDloygm5KAVnIAiqgFVe22CDJ0gWtTdKOSC0DpxmTqaw8UAmhEG8P-jfN4Y:1sl9pU:OtjjzYEDrR6jjsHAErZ93FZVugTDxAr_QyF-nmJPrwg	2024-09-16 16:23:00.938755+00
qyvuc3a520qvcesp7d351dphjwvzxkti	.eJxVjEEOwiAQRe_C2pDC0AIu3XsGMgODVA0kpV0Z765NutDtf-_9lwi4rSVsnZcwJ3EWIE6_G2F8cN1BumO9NRlbXZeZ5K7Ig3Z5bYmfl8P9OyjYy7e2AwETZM5RjY7UgNGD1Tp6k3zMSJNXVgM4TZNjNEReZz8qSAzOAIn3B_N_OAU:1sll6N:MRIFCI8C3SlEat4icXYz-D_e44mLrYh9jJZBIcw55GM	2024-09-18 08:10:55.678858+00
js2t89j39hkuaebf25715lmfyzwkw1zr	.eJxVjEEOwiAQRe_C2pDC0AIu3XsGMgODVA0kpV0Z765NutDtf-_9lwi4rSVsnZcwJ3EWIE6_G2F8cN1BumO9NRlbXZeZ5K7Ig3Z5bYmfl8P9OyjYy7e2AwETZM5RjY7UgNGD1Tp6k3zMSJNXVgM4TZNjNEReZz8qSAzOAIn3B_N_OAU:1smWZB:KLg1b7ljH_1c87GLsnxWHET39VoXBKqymeu6qsPwAkE	2024-09-20 10:51:49.354564+00
cadn0mnerr8f1loshz78wgn7zhbcbxjx	.eJxVjEEOwiAQRe_C2hAowoBL9z0DGYZBqoYmpV0Z765NutDtf-_9l4i4rTVunZc4ZXERgzj9bgnpwW0H-Y7tNkua27pMSe6KPGiX45z5eT3cv4OKvX7rhDloygm5KAVnIAiqgFVe22CDJ0gWtTdKOSC0DpxmTqaw8UAmhEG8P-jfN4Y:1snKRi:_q99k533aivfajTOCF-l_-19Y-gmcMK_QoTrbS1z2Yc	2024-09-22 16:07:26.222269+00
bba3jl1imvsbne3w4172nqtru1moxvo8	.eJxVjEEOwiAQRe_C2hAowoBL9z0DGYZBqoYmpV0Z765NutDtf-_9l4i4rTVunZc4ZXERgzj9bgnpwW0H-Y7tNkua27pMSe6KPGiX45z5eT3cv4OKvX7rhDloygm5KAVnIAiqgFVe22CDJ0gWtTdKOSC0DpxmTqaw8UAmhEG8P-jfN4Y:1tCmne:D3insSL8Oh6J7Sr8i3lesKEh4vzTAsWViobigrb7CJU	2024-12-01 21:27:18.776491+00
tpggpwn8d02zrauynnjvh3v5o9w2en4b	.eJxVjMsOwiAQRf-FtSHQKY9x6d5vIEOZStVAUtqV8d-VpAvdnnPufYlA-5bD3ngNSxJnMWgUp18aaXpw6SrdqdyqnGrZ1iXKnsjDNnmtiZ-Xo_07yNTydw2z92rQzAgmObKgUbEi5gjgE6FFNGSNARxHoA60d6TZ2RmcZxbvDxrLN8w:1snhDu:VamDCUzs6x6rX7Bjw3cu0xC-xgqo8DYX8H2X8kJBzv8	2024-09-23 16:26:42.204623+00
dmoqeiebem01nwjgzzfehkqv8g93hddu	.eJxVjEEOwiAQRe_C2hAowoBL9z0DGYZBqoYmpV0Z765NutDtf-_9l4i4rTVunZc4ZXERgzj9bgnpwW0H-Y7tNkua27pMSe6KPGiX45z5eT3cv4OKvX7rhDloygm5KAVnIAiqgFVe22CDJ0gWtTdKOSC0DpxmTqaw8UAmhEG8P-jfN4Y:1sopEv:5IEVcQDIPbOwWS1-3CZWLAitUaV1I8-OcrSlrE-uPo4	2024-09-26 19:12:25.22644+00
a63e6xj2peqe2dobbsjszzfwlvq18kgf	.eJxVjEEOwiAQRe_C2pBhQCAu3XsGAsMgVQNJaVfGu9smXej2vff_W4S4LjWsg-cwZXERiCBOvzRFenLbVX7Edu-SelvmKck9kYcd8tYzv65H-3dQ46jbuhiNiVGz0ho8akjKkbJsIpXiTE5OkTWFAZGc0sSeN3h22VtgAhafLyTvOH4:1sqwRd:tG09uGHkBHZgLKJ5cXwm_ZGfZjxfeTx0OD7jzNSnEug	2024-10-02 15:18:17.608539+00
e1naz981chetwr793q4b2zuioq0phzx1	.eJxVjEEOwiAQRe_C2pAhDDB16d4zEBhAqoYmpV013t026UK3_733N-HDulS_9jz7MYmrQHH53WLgV24HSM_QHpPkqS3zGOWhyJN2eZ9Sft9O9--ghl73OkRnnFWEBU0GS6oUAq3RwMCESA4jsdstZQcCV4hBI4LhmIFLSuLzBbe5Nyc:1tCmpg:MuIMy8AuShhUdH4T-yvHGb_jXOFmbv8eUEmpCrBaOcM	2024-12-01 21:29:24.145059+00
htc0rhljum4h5ypn94wd32pgvwvhogyh	.eJxVjEEOwiAQRe_C2pDC0AIu3XsGMgODVA0kpV0Z765NutDtf-_9lwi4rSVsnZcwJ3EWIE6_G2F8cN1BumO9NRlbXZeZ5K7Ig3Z5bYmfl8P9OyjYy7e2AwETZM5RjY7UgNGD1Tp6k3zMSJNXVgM4TZNjNEReZz8qSAzOAIn3B_N_OAU:1sraTS:_B0WREonFH_T2VV7MpZMm6d_lnmR433UkOHSbBICezM	2024-10-04 10:02:50.981209+00
n9g4bzpvkuqjx7flistaqdlrdhaozdht	.eJxVjDsOwjAQBe_iGlnJ-rNeSnrOENneNQ4gR8qnQtwdIqWA9s3Me6khbmsdtkXmYWR1VgC9Ov2uKeaHtB3xPbbbpPPU1nlMelf0QRd9nViel8P9O6hxqd_aYkkESFbIQSmBuoDGJDZIIQZgk52LPbqE3IljQSDwzELZinjr1fsDF1g4CQ:1tD5DD:hByytXK_3Ua6Gxerg3_moZpgr1bitOoP-f0CBLbL4tM	2024-12-02 17:06:55.815337+00
h3i1yd88hw0364ar58bnp5e483whjjah	.eJxVjDsOwjAQBe_iGlnJ-rNeSnrOENneNQ4gR8qnQtwdIqWA9s3Me6khbmsdtkXmYWR1VgC9Ov2uKeaHtB3xPbbbpPPU1nlMelf0QRd9nViel8P9O6hxqd_aYkkESFbIQSmBuoDGJDZIIQZgk52LPbqE3IljQSDwzELZinjr1fsDF1g4CQ:1ss3ai:eUuC3SAyE143kasRWXzSCkMpOTlyo6BshZbbKxy2aEE	2024-10-05 17:08:16.683566+00
d8z8jc2x35bi4fcwp9qqqv4zkfj2n57y	.eJxVjEEOwiAQRe_C2pDC0AIu3XsGMgODVA0kpV0Z765NutDtf-_9lwi4rSVsnZcwJ3EWIE6_G2F8cN1BumO9NRlbXZeZ5K7Ig3Z5bYmfl8P9OyjYy7e2AwETZM5RjY7UgNGD1Tp6k3zMSJNXVgM4TZNjNEReZz8qSAzOAIn3B_N_OAU:1tD777:Z3TVDVMACULKLKlTOoWPHIJhmq8RvNvKOKLQGIEw0LI	2024-12-02 19:08:45.487698+00
nvcvzyqyj1tm0q5wb7ytmza97ecacw0a	.eJxVjDsOwjAQBe_iGlnJ-rNeSnrOENneNQ4gR8qnQtwdIqWA9s3Me6khbmsdtkXmYWR1VgC9Ov2uKeaHtB3xPbbbpPPU1nlMelf0QRd9nViel8P9O6hxqd_aYkkESFbIQSmBuoDGJDZIIQZgk52LPbqE3IljQSDwzELZinjr1fsDF1g4CQ:1ss41I:bSkr2JCZOPEksQQ3aboBh6ma2mMDLjT_6NHVGL012D4	2024-10-05 17:35:44.383906+00
li22bb5gjago7qekyc24bzgh47f5y0zv	.eJxVjEEOwiAQRe_C2pDC0AIu3XsGMgODVA0kpV0Z765NutDtf-_9lwi4rSVsnZcwJ3EWIE6_G2F8cN1BumO9NRlbXZeZ5K7Ig3Z5bYmfl8P9OyjYy7e2AwETZM5RjY7UgNGD1Tp6k3zMSJNXVgM4TZNjNEReZz8qSAzOAIn3B_N_OAU:1ssJk7:Zqa4UU0b02n0UaaMiMDLhnd1CnGlmFdcE65lUbpXago	2024-10-06 10:23:03.00725+00
2w1lkbxlt655jrhxcu1ov7u18yha7hap	.eJxVjDkOwjAUBe_iGlnhe4sp6XMGy38JCSBbipMKcXeIlALaNzPvpVLe1iltTZY0s7ooAFCn3xUzPaTsiO-53KqmWtZlRr0r-qBND5XleT3cv4Mpt-lbEzgK2BsZY-dtf4aerQsuong0yAKdZYYYyI9xJEtIFEUcSugMe7Dq_QE05jjc:1sw6CD:WPuVIg-HNEbMZvg5Wf33seQGbjL7RQo0XoZVZohOkIU	2024-10-16 20:43:41.398357+00
kp3o9uauho0atk4jl3hebel6ercs639x	.eJxVjEEOwiAQRe_C2pDC0AIu3XsGMgODVA0kpV0Z765NutDtf-_9lwi4rSVsnZcwJ3EWIE6_G2F8cN1BumO9NRlbXZeZ5K7Ig3Z5bYmfl8P9OyjYy7e2AwETZM5RjY7UgNGD1Tp6k3zMSJNXVgM4TZNjNEReZz8qSAzOAIn3B_N_OAU:1swnOL:AM--l17cyBexceTzQmBQtS8SAS_S8lJSllbhctyD1gc	2024-10-18 18:51:05.571015+00
08s27fqjoikly9bepiwjvuf14qb703zp	.eJxVjEEOwiAQRe_C2hCmQAsu3XsGMjCDVA0kpV0Z765NutDtf-_9lwi4rSVsnZcwkzgLJ06_W8T04LoDumO9NZlaXZc5yl2RB-3y2oifl8P9OyjYy7cGqxwhDGyBnfVEk_dkM1DGBKN24AZlfNbZ6Jj85BMyRlajsUwEMYv3B-PEOHM:1swnOf:Xfuq-STDN_XO8G2tkICXQ70IO1XlxVc8IpJhINHM7Gs	2024-10-18 18:51:25.258024+00
c75pmy6xo84edfqi0tkeiympirrndmb8	.eJxVjEEOwiAQRe_C2hAowoBL9z0DGYZBqoYmpV0Z765NutDtf-_9l4i4rTVunZc4ZXERgzj9bgnpwW0H-Y7tNkua27pMSe6KPGiX45z5eT3cv4OKvX7rhDloygm5KAVnIAiqgFVe22CDJ0gWtTdKOSC0DpxmTqaw8UAmhEG8P-jfN4Y:1syE6U:DIP1bp9_vGLiapBIGe9kJdGppX5CF7imm230g-v537w	2024-10-22 17:34:34.222932+00
08l5jh01fz8eagcc5a07k9fqmpp9gvef	.eJxVjDsOwjAQBe_iGlnJ-rNeSnrOENneNQ4gR8qnQtwdIqWA9s3Me6khbmsdtkXmYWR1VgC9Ov2uKeaHtB3xPbbbpPPU1nlMelf0QRd9nViel8P9O6hxqd_aYkkESFbIQSmBuoDGJDZIIQZgk52LPbqE3IljQSDwzELZinjr1fsDF1g4CQ:1szHFk:kOTIsbJWTXgrxtF2IiiSKEMEJB24XZ3MqucoJOIb-yw	2024-10-25 15:08:28.702568+00
9nard6obbozu1pekdv9fkafyzi6mo34u	.eJxVjMsOwiAQRf-FtSEwvNSl-35DwzCDVA0kpV0Z_92QdKHbe865bzHHfSvz3nmdFxJXAWDE6XfFmJ5cB6JHrPcmU6vbuqAcijxol1Mjft0O9--gxF5GrTn67LKipDgpzdmRY-0zwUVbphDQBgTUZKIGazyisXAGyBiMgiA-X1S7OHs:1szINl:fhNrREKDBkTzybyE2jzh7K9DP5cJcHyn-e6eN1w3bbU	2024-10-25 16:20:49.828277+00
baqthorhz2esw2tpdks2fbp0od65g0cl	.eJxVjEEOwiAQRe_C2hAYKAWX7j0DmTKDVA0kpV0Z765NutDtf-_9l4i4rSVunZc4kzgLACtOv-uE6cF1R3THemsytbou8yR3RR60y2sjfl4O9--gYC_fmiHYQYcMSGMyilET5BA8OZ91Up5TAGMB2GmXSLsBTB6RlGHirB2J9wcrfzhu:1t0cxz:sHxUL7QYVS0Zu4BMB7YvlfNWRhrViG8RbwR-9qN5O7s	2024-10-29 08:31:43.755225+00
hpjerzjkj3vc23cmp7g6er9msgsz57f4	.eJxVjEEOwiAQRe_C2hAowoBL9z0DGYZBqoYmpV0Z765NutDtf-_9l4i4rTVunZc4ZXERgzj9bgnpwW0H-Y7tNkua27pMSe6KPGiX45z5eT3cv4OKvX7rhDloygm5KAVnIAiqgFVe22CDJ0gWtTdKOSC0DpxmTqaw8UAmhEG8P-jfN4Y:1t4nOu:22fGUvQHZ4eA3UxTkTP0LGUGeun3r4Y5V6OG7q4z_xk	2024-11-09 20:28:44.273842+00
vv2h61v1w1qemya66zwr9wmplc9vbm6w	.eJxVjMsOwiAQRf-FtSE8OgVcuvcbyDAMUjU0Ke3K-O_apAvd3nPOfYmI21rj1nmJUxZn4cTpd0tID247yHdst1nS3NZlSnJX5EG7vM6Zn5fD_Tuo2Ou3Lsr6bKxBCJathQBIwas0Dno0iTQl47QquqigPZniuAC7QuiMBhhAvD_KAzdC:1t4nVX:1a7dwP67qOikWEIJ8mhbEzbw1g1UF5vTX0MRq_j55l0	2024-11-09 20:35:35.038701+00
ftd5owvsuhy9rn8ymdkro8jqcbgkb32x	.eJxVjDsOwjAQBe_iGlnJ-rNeSnrOENneNQ4gR8qnQtwdIqWA9s3Me6khbmsdtkXmYWR1VgC9Ov2uKeaHtB3xPbbbpPPU1nlMelf0QRd9nViel8P9O6hxqd_aYkkESFbIQSmBuoDGJDZIIQZgk52LPbqE3IljQSDwzELZinjr1fsDF1g4CQ:1t5Pvd:4yfEFMRS8QkufpzO1gfbcQs8YFYCuJ6p8Y1jl9kGDOQ	2024-11-11 13:37:05.666647+00
z2b8hkp3lzhdienrioaokiaqs98yb8d7	.eJxVjEEOwiAQRe_C2pDC0AIu3XsGMgODVA0kpV0Z765NutDtf-_9lwi4rSVsnZcwJ3EWIE6_G2F8cN1BumO9NRlbXZeZ5K7Ig3Z5bYmfl8P9OyjYy7e2AwETZM5RjY7UgNGD1Tp6k3zMSJNXVgM4TZNjNEReZz8qSAzOAIn3B_N_OAU:1t82a8:mzjQxG0RRIKcDrgTaHYaavGJLYh_d-JU8aA0g4f6LwU	2024-11-18 19:17:44.403519+00
a6hcxs2x6gmcgk67inmhnyyshr8nujci	.eJxVjEEOwiAQRe_C2hBKdQCX7j0DmWEGqRpISrsy3l2bdKHb_977LxVxXUpcu8xxYnVWQR1-N8L0kLoBvmO9NZ1aXeaJ9KbonXZ9bSzPy-7-HRTs5VvbJKNPngZPlgIDJCeGyNiTuIGRHYyGDeecyRkhCN4ZPMIIItYKOvX-AAK_OJY:1t82dX:GzmxuwUEHVHDi6mYZbf7LicOGoZV4DJpx8E-RbBeHUI	2024-11-18 19:21:15.693923+00
bexfnan8ems0pzx0ghcfc306ucvmidxv	.eJxVjDsOwjAQBe_iGlnJ-rNeSnrOENneNQ4gR8qnQtwdIqWA9s3Me6khbmsdtkXmYWR1VgC9Ov2uKeaHtB3xPbbbpPPU1nlMelf0QRd9nViel8P9O6hxqd_aYkkESFbIQSmBuoDGJDZIIQZgk52LPbqE3IljQSDwzELZinjr1fsDF1g4CQ:1tBzuJ:fPplBGzt4-9QWAK4g876sp7LR-xM9BXYJO8IVxIHBhA	2024-11-29 17:14:55.830647+00
uwb1ofoi3o27rz76glf6v9iwx5byqt5k	.eJxVjDEOwjAMRe-SGUVOXJLAyM4ZIqe2SQG1UtNOiLtDpQ6w_vfef5lM61Lz2mTOA5uzwXgyh9-1UP-QcUN8p_E22X4al3kodlPsTpu9TizPy-7-HVRq9Vt7VVYEFxIEleIjiKBiSBJKiuIdRkYPkDgysAtQoFdU6LojkSKZ9wc2TThf:1uVYOX:ByWmMyWqV2TEv1ZqGXm_GnGuCvQghoq1kN_qjp-ugfk	2025-07-12 16:27:13.211118+00
6loc1ybtbgw0yzq69bj4ob1aicbkua2q	.eJxVjEEOwiAQRe_C2pC2A1Nw6d4zkBkYbNVAUtqV8e7apAvd_vfef6lA2zqFrckS5qTOahh6dfpdmeJDyo7Sncqt6ljLusysd0UftOlrTfK8HO7fwURt-tbedUhu7NlgBO68F6GRe4Ic2RtBY9EZGD3laAETgDMpW4aM4oeMRr0_JFs4Jw:1tI0Y9:B6IlUb1dj3WOMIv8rt9OxUuaFZFbgDItOOXB7o1azHM	2024-12-16 07:08:53.845392+00
zzsbhfr4mxlpdjyplgbvd9fb3ur5qarm	.eJxVjDsOwjAQBe_iGln-4Q8lfc5grXdtHEC2FCcV4u4QKQW0b2bei0XY1hq3kZc4E7swpSQ7_a4J8JHbjugO7dY59rYuc-K7wg86-NQpP6-H-3dQYdRvjcW5TO6sC2XhIAQ0knwRCgVqE9Bma4RUQms0lpQx3nsLlDCRVjJZ9v4ANQ04Mw:1uIlXl:KUomFkQemMTB8sa-zqjAAnARIe9yz4mvc3pd6hGfHJU	2025-06-07 09:51:53.013102+00
k3v2ri7itgq5h3qoqfe3a9azctd0a2g4	.eJxVjMsOwiAQRf-FtSEDlcK4dN9vaBhmkKqBpI-V8d-1SRe6veec-1Jj3NYybovM48TqoroA6vS7UkwPqTvie6y3plOr6zyR3hV90EUPjeV5Pdy_gxKX8q0NoXWBIDlvAHtKwGcH3nMMIBY7J0IZyKAD5BB6gZwxZsc2YUIC9f4AG6k4RA:1uVYRT:yQS_I_TV8i3BRm8CbMtR07Bw1jzTW1PHGJdtSyqhx0k	2025-07-12 16:30:15.745798+00
pvz6d1kl7h2nnd46m45ilspzian4iq6n	.eJxVjEEOwiAQRe_C2hBkCrQu3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFWn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX9rwC6JoWDYQiAgIYcDJXBkHBpDvUMrIbAzCfoYkeQMPpFPg3eQOlbvD_8wOK8:1uVXvT:_aobD4bUppu8EY6gz5SqYOJkvPUt7baObsLaAn_5iMA	2025-07-12 15:57:11.672264+00
nrav9c4fy96qcdr7g90exgs9a3vfv9et	.eJxVjEEOwiAQRe_C2hBkCrQu3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFWn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX9rwC6JoWDYQiAgIYcDJXBkHBpDvUMrIbAzCfoYkeQMPpFPg3eQOlbvD_8wOK8:1ut7u4:bo8-mya__g3G4bN-LVHYMDNPw2ssugHF8ZVqVKUApRM	2025-09-15 17:01:12.838155+00
alplgttjdanbjy4t0mt0v2thucgtl2ws	.eJxVjDEOwjAMAP-SGUXFSbDDyN43RLaTkgJqpaadEH9HlTrAene6t0m8rTVtrSxpzOZqvI_m9EuF9VmmXeUHT_fZ6jytyyh2T-xhm-3nXF63o_0bVG51Hw8Y8jkAFYouMgkWDeg9gAwZIQIKqFwYPanIIOTIecUOnHRQlMznCygHOCE:1v0amx:q5X0fQaPRHFn6SMIMvI48JqP5FLpG65WZnocPticaZE	2025-10-06 07:16:43.958472+00
2dhwor25cde8rhsbxzr0wrg13eui7u9k	.eJxVjDsOwjAQBe_iGln-4Q8lfc5grXdtHEC2FCcV4u4QKQW0b2bei0XY1hq3kZc4E7swpSQ7_a4J8JHbjugO7dY59rYuc-K7wg86-NQpP6-H-3dQYdRvjcW5TO6sC2XhIAQ0knwRCgVqE9Bma4RUQms0lpQx3nsLlDCRVjJZ9v4ANQ04Mw:1v3d0g:qbVvVi44tSDGHW_4zTTlZnQyJcDiH7ctv2kMVGxpz-Q	2025-10-14 16:15:26.384205+00
4iaz2ifqyqpvnanrsxpqx8nzj8et07ny	.eJxVjDsOwjAQBe_iGll2HH-Wkp4zWJtdLwmgWIqTCnF3iJQC2jcz76UybuuYt1aWPLE6q-iiOv2uA9KjzDviO863qqnO6zINelf0QZu-Vi7Py-H-HYzYxm_dO_IEia0kLIHtEJ1jQwzoA_UdCadkhAGiBYAgIILWiO8dOOs7VO8PRIs4Yg:1wQtA9:HaWUDa_hVi9eWkl-3r37wUzDpFPkWJlpnXPY-rryElk	2026-06-06 20:41:37.974262+00
w8rkuxantwghqwu7gjun79udy6mg419i	.eJxVjEEOwiAQRe_C2hBkCrQu3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFWn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX9rwC6JoWDYQiAgIYcDJXBkHBpDvUMrIbAzCfoYkeQMPpFPg3eQOlbvD_8wOK8:1v95Qs:i6h2vMlMUXH3vWh_zGp8UYhNUm8OdUi7wg0adqTA84c	2025-10-29 17:37:02.034091+00
0y5wjhcebdk3xf7pze2in33u4wa3d85i	.eJxVjDsOwjAQBe_iGln2Zv2jpOcM1vqHA8iW4qRC3B0ipYD2zcx7MU_bWv028uLnxM4MQLLT7xooPnLbUbpTu3Uee1uXOfBd4Qcd_NpTfl4O9--g0qjfWpNBgpIBDUqjhJZFRD0VQlAhBJuMcyHb4qy2GsFElQQYcjhZzJQce38AF3o3wQ:1vKJjD:ugVNYodnMVhlWCkKlxVBhqexAZEdtazrf5KkE7NkRnA	2025-11-29 17:06:23.046268+00
p9g7zcvvvr13ssfd1t81luiz6teccyyc	.eJxVjs0OwiAQhN-FsyGEn2Xx6N1nIOyCUjWQlPZkfHfbpAe9zvfNZN4ipnWpcR1ljlMWZ-HQidNvSomfpe0oP1K7d8m9LfNEclfkQYe89lxel8P9G6hp1K1NVqPWbNkEcnjzxSAjOI0enMmJgK1nxcFq8kjBkMFioICyACpvrz5fGrY3bw:1vbkk9:Va_bxiF5etWTSMJkt7ANCtG94FCva9BTJSnHrcSwSMQ	2026-01-16 19:23:25.22736+00
h0ap9u7a4osy8lg7fdpzcyyhqkb7nsb5	.eJxVjDsOwjAQBe_iGln2Zv2jpOcM1vqHA8iW4qRC3B0ipYD2zcx7MU_bWv028uLnxM4MQLLT7xooPnLbUbpTu3Uee1uXOfBd4Qcd_NpTfl4O9--g0qjfWpNBgpIBDUqjhJZFRD0VQlAhBJuMcyHb4qy2GsFElQQYcjhZzJQce38AF3o3wQ:1vnLnI:C9ykmZPtbTacENt8riZ-EMysX39en-i_U0IXzS25rWw	2026-02-17 19:10:36.121339+00
1suty45e7cay3bozq0kkqar0pomhgyqg	.eJxVjEEOwiAQRe_C2pDiMBRcuu8ZCMxMpGogKe3KeHdt0oVu_3vvv1RM21ri1mWJM6uLcsar0--aEz2k7ojvqd6aplbXZc56V_RBu54ay_N6uH8HJfXyrUGQRkbDYs3oBofWZ2EPJJglwEDkw0DJngMDsgOAMYtHA4gCwTv1_gAuhzfF:1vsEej:ri3TvpB43j3p-26Y7uUnXxHKEW5kXRfprbTSmUY3mLU	2026-03-03 06:33:57.018105+00
dhnha5vo5rtfojn2z7lf1o356hsqkpbm	.eJxVjEEOwiAQRe_C2hBkCrQu3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFWn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX9rwC6JoWDYQiAgIYcDJXBkHBpDvUMrIbAzCfoYkeQMPpFPg3eQOlbvD_8wOK8:1vuwij:_JyYpCfD0sga7Q5oRjECqM4z-6HXMnY68pA6AXrLxOk	2026-03-10 18:01:17.068559+00
qo1bzsofxwprh941bv2j1b7p5s1is37s	.eJxVjEEOwiAQRe_C2hBkCrQu3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFWn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX9rwC6JoWDYQiAgIYcDJXBkHBpDvUMrIbAzCfoYkeQMPpFPg3eQOlbvD_8wOK8:1wCBoV:Uelw13DmarvZ0xBwZ3mz7MVuN4VVoUSBctzmKp0n574	2026-04-27 07:34:31.687145+00
t4fs22qcs2dyznlk51kozju8y8nloawt	.eJxVjEEOwiAQRe_C2hBkCrQu3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFWn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX9rwC6JoWDYQiAgIYcDJXBkHBpDvUMrIbAzCfoYkeQMPpFPg3eQOlbvD_8wOK8:1wDmph:SSXufHr8EfEeT6Gzd9YywLykzzu-bjDsrlsQ0K7MfN0	2026-05-01 17:18:21.316665+00
cjuwd0je5w1c5dyc4uilyiihgldfiyw4	.eJxVjDsOwjAQRO_iGlnrxGvHlPQ5Q7TxrnEA2VI-FeLuJFIKKKaZ92beaqBtzcO2yDxMrK7Kt426_LYjxaeUA_GDyr3qWMs6T6M-FH3SRfeV5XU73b-DTEve14i2hcBWuAMvxqBtCBJ5w5gSEjuwwVMgcgIc2xSlcxBwD_kIBtXnCyNCOAg:1wQtAG:o7e6P9uZmDlMvInWbw40CZJAmzRjofOQBJROpdyQYPk	2026-06-06 20:41:44.808711+00
5d0wsb5y5mb0yn6eq1ksq7yf7xt867jj	.eJxVjEEOwiAQRe_C2hBkCrQu3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFWn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX9rwC6JoWDYQiAgIYcDJXBkHBpDvUMrIbAzCfoYkeQMPpFPg3eQOlbvD_8wOK8:1wP0mH:jH3UojMutbG-SYUtJCX2W76rUJyoaANLy9n-bPerqfo	2026-06-01 16:25:13.263695+00
0qbvka2i4rw8j7gf8h7ysen52v81qhjh	.eJxVjMsOwiAURP-FtSE8L-jSvd9A7gUqVQNJaVfGf5cmXehqkjNn5s0CbmsJW89LmBO7MMdOv4wwPnPdi_TAem88trouM_Fd4Ufb-a2l_Loe7t9BwV7GWhBO5A14T2C8UkqiHcRpDxosSKeFtyKrCOZMIw0SOEkpgVBTVIJ9vsXJNwY:1wR65n:ecv6AjHmmRBGnrCJBus8pHgU2O7kOGQvikVsof4bU2s	2026-06-07 10:29:59.088333+00
bhh0yjtkm65zfkisk95dwdrdqvb75mhv	.eJxVjE0OwiAYRO_C2pBCAcGle89A-H6QqoGktCvj3W2TLnQ3mfdm3iKmdSlx7TzHicRFWKvF6beFhE-uO6JHqvcmsdVlnkDuijxol7dG_Loe7t9BSb1sa0xBKUCTACgromELzoNGN7LDnC0xasMayNoBGMxImQKePXpLgVh8vocOOqI:1wQt6x:jn6iBUdiFsK8q327grfeABj9MTo1jYdyQLFJ84qCZmg	2026-06-06 20:38:19.667058+00
xf68gb72m1scel61oxhs6494z7ykhr8q	.eJxVjMsOwiAQRf-FtSFQHoMu3fcbCMMMUjUlKe3K-O_apAvd3nPOfYmYtrXGrfMSJxIXAc6K0--KKT943hHd03xrMrd5XSaUuyIP2uXYiJ_Xw_07qKnXbz0EGFCrkJlYuxACAJOh4LTX7szJew_FcrZZazRoIJNTyMkWLArKIN4fJN44eg:1wQt7V:GOsBXEAdDHJwhckp9wRV0ueABcy5Lbx5MnEqVfs6E24	2026-06-06 20:38:53.84377+00
o7w9gksbkbpys2j0gsysloxxqx3z1ojm	.eJxVjEEOwiAQRe_C2hCgTCku3XsGAjODVA0kpV0Z765NutDtf-_9lwhxW0vYOi9hJnEWDrQ4_a4p4oPrjuge661JbHVd5iR3RR60y2sjfl4O9--gxF6-tWci5axmyJqMRRzYkyPOHlAr5dCaGB2PQxqyGidvUeNEjKC9N-BAvD9JoTh8:1wQt81:yvV9ehbRDWIVfkzRwy9qXHyCCAGrvma0ecsDLkeqDrg	2026-06-06 20:39:25.002346+00
t6oghj3rdj65zsv131qd6xk3drrv9v37	.eJxVjEEOwiAQRe_C2pChlAIu3XsGMsOAVA1NSrsy3l1JutDtf-_9lwi4byXsLa1hZnEW2oI4_a6E8ZFqR3zHeltkXOq2ziS7Ig_a5HXh9Lwc7t9BwVa-tfeGnRv86C1l9qCISE95hKzJYYqowXplqHvIoICHyTg2lhywslq8Pyf2N-o:1wQt83:P_g48k-B9wkhSGb8hTmbRaBfxr5M5_Uks7RS48pavAA	2026-06-06 20:39:27.179529+00
90l2razq1llrgvsq7jayb3c7df5vnc0s	.eJxVjMsOwiAQRf-FtSEyvF267zeQAQapGkhKuzL-uzbpQrf3nHNfLOC21rANWsKc2YVZDez0u0ZMD2o7yndst85Tb-syR74r_KCDTz3T83q4fwcVR_3WxqFyBIi-JCGQIIPXxqXkpTw75xSIaMkYC4qoIPhcrDI-Fm0xScjs_QEu1zhY:1wQt8F:Cmtn_Zt5cpSGcSbt7SR6hbKNNy20zrTXQ8rRmdlJJHw	2026-06-06 20:39:39.120176+00
w4kimwqox4yp1qa64g7izzhif1sckru5	.eJxVjMsOwiAQRf-FtSFQHoMu3fcbCMMMUjUlKe3K-O_apAvd3nPOfYmYtrXGrfMSJxIXAc6K0--KKT943hHd03xrMrd5XSaUuyIP2uXYiJ_Xw_07qKnXbz0EGFCrkJlYuxACAJOh4LTX7szJew_FcrZZazRoIJNTyMkWLArKIN4fJN44eg:1wQsCS:NkN_EnQKOiOVKdxO8tDCfWSEx15YjICMLBZl5j-0sT0	2026-06-06 19:39:56.922049+00
n7erc5mx86332rdzphxxzxonoq4otxx6	.eJxVjDsOwjAQBe_iGlle_01JzxmiXXuNA8iR8qkQd4dIKaB9M_NeYsBtbcO28DyMRZyFiSBOvythfnDfUbljv00yT32dR5K7Ig-6yOtU-Hk53L-Dhkv71sGSCRZVBRUIDbO3pFWtAMRUEudQU_JAkKwmH7HGSgCctLPGeefE-wM7_Tg-:1uVYRa:fQpz-grNgjYfVT74Yprhxba4muBMjdBNBqzw9o-wP_U	2025-07-12 16:30:22.564782+00
1wdl3uiol36rmxvm21ri8jm6cv1s9lq4	.eJxVjEEOwiAQRe_C2hBkCrQu3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFWn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX9rwC6JoWDYQiAgIYcDJXBkHBpDvUMrIbAzCfoYkeQMPpFPg3eQOlbvD_8wOK8:1uufb6:dDnR_uLtd3YhCPY6i2Z456xiVnuUJAYH8nkEHzOphJQ	2025-09-19 23:12:00.774453+00
x76jvdp209ebx1u7rnl9sftvfm5t0pfv	.eJxVjDsOwjAQBe_iGln-4Q8lfc5grXdtHEC2FCcV4u4QKQW0b2bei0XY1hq3kZc4E7swpSQ7_a4J8JHbjugO7dY59rYuc-K7wg86-NQpP6-H-3dQYdRvjcW5TO6sC2XhIAQ0knwRCgVqE9Bma4RUQms0lpQx3nsLlDCRVjJZ9v4ANQ04Mw:1v0jgF:Li4byltZ1v0QzOYHGaRsiVhMP8rVquc2RmfEGGmdcUY	2025-10-06 16:46:23.502631+00
2b2e1x6wp2ihvuqg1qhk1ge8m13747db	.eJxVjEEOwiAQRe_C2hAYYKAu3fcMBIbRVg0kpV0Z765NutDtf-_9l4hpW6e4dV7iXMRZGAji9LvmRA-uOyr3VG9NUqvrMme5K_KgXY6t8PNyuH8HU-rTt3bkmDRam92AFLwCBKWZwViG4rQFj05rQgc-ZCa8DggGvYWissJBvD8A3ja_:1wP4Pd:xYgDsk3SgdsyEl6gDwZW6ioVHC7ZNxbWSEKwG5xWK1Q	2026-06-01 20:18:05.253623+00
gtvn2e6boic8s83vqgnua3e5awdl1lfp	.eJxVjDsOwjAQBe_iGllesf6Ekp4zWPbuGgeQI8VJFXF3iJQC2jczb1MxrUuNa5c5jqwuCkCdfsec6CltJ_xI7T5pmtoyj1nvij5o17eJ5XU93L-Dmnr91oTBZ4ECIGcvBdhkEnAlEPmMxTiwwTowDEZCMgnRDohkgcmWQZx6fwAWGzgs:1uIlj3:rfSVBs3LgATSAJ2rWW_W7bYEdFgmpYyPOH1Z1OfILDM	2025-06-07 10:03:33.437226+00
6hwgkfqbmxaorqhq5d6ef4acjwwmnww9	.eJxVjEEOwiAQAP_C2RBYaCkevfcNZGEXqRpISnsy_t006UGvM5N5i4D7VsLeeQ0Liasw4vLLIqYn10PQA-u9ydTqti5RHok8bZdzI37dzvZvULCXY8sARN64yDwC6KxyNsNgTZo04JC8tpY8O28ILY3MoHKCyDip6FLO4vMF5_04kw:1uVXvW:digNuRdDcjcvF-35P03WTjpEwAYPbNsJM6oQ4qDpusQ	2025-07-12 15:57:14.412587+00
ouyizzy9dcs9q3ev18z2br4df3c3xiip	.eJxVjDsOwjAUBO_iGln-8WxT0ucM0dp-wgFkS_lUiLtDpBTQ7szsS4zY1jpuC8_jVMRFWE_i9Lsm5Ae3HZU72q3L3Ns6T0nuijzoIode-Hk93L-DiqV-a-V9MInPUQPMycIRrEMuYGMjPFmCioEtmRBZUQklEgy80tnp4MX7Azm_OBE:1wQtAA:60NA08H3dkKTGZwS3Ppwb-qSkLP9XOf8Rk_6fAKjhA0	2026-06-06 20:41:38.807171+00
0t8rhtim4jitd2w7sburf389b3pqh0a0	.eJxVjEEOwiAQAP_C2RBYaCkevfcNZGEXqRpISnsy_t006UGvM5N5i4D7VsLeeQ0Liasw4vLLIqYn10PQA-u9ydTqti5RHok8bZdzI37dzvZvULCXY8sARN64yDwC6KxyNsNgTZo04JC8tpY8O28ILY3MoHKCyDip6FLO4vMF5_04kw:1v4mNq:5louK8kH_BdyByC2ssLgtjmxADMfHZg33nfcBdUufP0	2025-10-17 20:28:06.245601+00
a70gml2xdkf8077yd637vfnakp90dwa3	.eJxVjEEOwiAQRe_C2hCGlpnWpXvP0AAzSNVAUtqV8e7apAvd_vfef6nJb2uetibLNLM6K-qNOv2uwceHlB3x3Zdb1bGWdZmD3hV90KavleV5Ody_g-xb_tZ99GgQEcBQDN5adAaQUoq2E-aUuCPjogCMo2VM4gA6HJwQy0A0qvcHH-Y35w:1wQo1T:89y9xg4WnWSGz0L9LQQgP3W4udv8m6Wt8BIDoS6FfKs	2026-06-06 15:12:19.478309+00
ecvkzadp8citp853u9rgd586byif0apa	.eJxVjEEOwiAQRe_C2hCGMhRcuu8ZyABTqRqalHZlvLtt0oVu_3vvv0WgbS1ha7yEKYur6LETl981UnpyPVB-UL3PMs11XaYoD0WetMlhzvy6ne7fQaFW9toTYM5gETI7VA6jVkb3ZL3SjKMl0OwYVAKT7C6TcdobFTuIGuPoxecLEX83aw:1wQqVt:XW_GMygGgWhMAdnVO9mSgF1tDQXic2WY3AD0xZpmruU	2026-06-06 17:51:53.723445+00
nrdgbpcj2tk2r3lboufr3t5iyyk2vlqs	.eJxVjEEOwiAQRe_C2pAODQO4dO8ZyEwHpGogKe3KeHdt0oVu_3vvv1SkbS1x62mJs6izMgbU6Xdlmh6p7kjuVG9NT62uy8x6V_RBu742Sc_L4f4dFOrlW4PLjkcnZEPw4BPagFYIITnvU3bgMyNjFrQw2DGDQQR2AwYWYQb1_gAbGDf3:1v95RZ:C8DFy3SzpTuUjG8JF1cuHbdEekal3u5V-LahBeoUt6w	2025-10-29 17:37:45.415789+00
i07xaybsa33yf15djll9v2x08bec9zbr	.eJxVjMsOwiAQRf-FtSHDYwRcuu83EB6DVA0kpV0Z_12bdKHbe865L-bDtla_DVr8nNmFGXb63WJID2o7yPfQbp2n3tZljnxX-EEHn3qm5_Vw_w5qGPVbKyChCCJKimiVzWgTCI2yuOyETkiFQCtDWKINqKM07gzZWh2E1ADs_QHSYzcR:1vN8Hn:vhmq3UPKNF8sNLftkmKvwvaBjvFCuxy69ozZzKOfknY	2025-12-07 11:29:43.954687+00
xqb84kao6zfq1ltaeepyxfdfesarnjku	.eJxVjDsOwjAQBe_iGln2Zv2jpOcM1vqHA8iW4qRC3B0ipYD2zcx7MU_bWv028uLnxM4MQLLT7xooPnLbUbpTu3Uee1uXOfBd4Qcd_NpTfl4O9--g0qjfWpNBgpIBDUqjhJZFRD0VQlAhBJuMcyHb4qy2GsFElQQYcjhZzJQce38AF3o3wQ:1vhD5I:89lJd1g-On_8bhb4NUTgVhEW0AJOLtu6tdHJzl83epY	2026-01-31 20:39:48.764667+00
wbfh5223837mlbjefq4zp1r1erpcu8ag	.eJxVjDsOwjAQBe_iGln2Zv2jpOcM1vqHA8iW4qRC3B0ipYD2zcx7MU_bWv028uLnxM4MQLLT7xooPnLbUbpTu3Uee1uXOfBd4Qcd_NpTfl4O9--g0qjfWpNBgpIBDUqjhJZFRD0VQlAhBJuMcyHb4qy2GsFElQQYcjhZzJQce38AF3o3wQ:1vp78Q:Bxk9vFHZOyvELixk80GTDSTTRlJOL8JHhTJeVlbqri4	2026-02-22 15:55:42.5544+00
zsb5egp8j1klksj2kcrdbpbdxnp2uq8b	.eJxVjDsOwjAQBe_iGln2Zv2jpOcM1vqHA8iW4qRC3B0ipYD2zcx7MU_bWv028uLnxM4MQLLT7xooPnLbUbpTu3Uee1uXOfBd4Qcd_NpTfl4O9--g0qjfWpNBgpIBDUqjhJZFRD0VQlAhBJuMcyHb4qy2GsFElQQYcjhZzJQce38AF3o3wQ:1vt8Zg:Yt6-UP-8QYWeaJx9A3cDM8eBD3loY2qATnqWpjLSrdI	2026-03-05 18:16:28.911969+00
9dsb2ekhogutizjwubk6mn5ubcw0e0mc	.eJxVjMsOwiAQRf-FtSHDYwRcuu83EB6DVA0kpV0Z_12bdKHbe865L-bDtla_DVr8nNmFGXb63WJID2o7yPfQbp2n3tZljnxX-EEHn3qm5_Vw_w5qGPVbKyChCCJKimiVzWgTCI2yuOyETkiFQCtDWKINqKM07gzZWh2E1ADs_QHSYzcR:1vuyRT:I2cYFabzQBqsaLUg_Quf2RQEUqYL-loCnWakBcbZeQ8	2026-03-10 19:51:35.498172+00
c7lg4ffih72jzu57s1aai0d3r3ryzq64	.eJxVjE0OwiAYRO_C2pBCAcGle89A-H6QqoGktCvj3W2TLnQ3mfdm3iKmdSlx7TzHicRFWKvF6beFhE-uO6JHqvcmsdVlnkDuijxol7dG_Loe7t9BSb1sa0xBKUCTACgromELzoNGN7LDnC0xasMayNoBGMxImQKePXpLgVh8vocOOqI:1vxsUX:ych1I4PLVosauxk9i9lTd7akHfblxLGhhBR4qUUs4DI	2026-03-18 20:06:45.677291+00
qfow1tjybl7r9mtlnrewyshjocvmntnz	.eJxVjEEOwiAQRe_C2hBkCrQu3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFWn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX9rwC6JoWDYQiAgIYcDJXBkHBpDvUMrIbAzCfoYkeQMPpFPg3eQOlbvD_8wOK8:1wEkwk:eqSWoIFSkpgbeY01xUgLE8GuYKIvwROBttM2za4PPH4	2026-05-04 09:29:38.324593+00
q75k7zb0z90wvwjf7irjgpobvv3kxmqi	.eJxVjDsOwyAQRO9CHSGDMZ-U6X0GtLBLcBKBZOwqyt1tSy6cZop5b-bLPKxL9muj2U_I7kyz27ULEN9UDoAvKM_KYy3LPAV-KPykjY8V6fM43b-DDC3v656cNVLbTiezJ5JD6JSh3jqnE5CFIQ5CRhRaGZAoSCAFFaURNiQF7LcB1CI36g:1wRDNr:anUSXM1VPFXr-Q54Kiv60FeRSMoo6ISlgqKxUO2o8PA	2026-06-07 18:17:07.091473+00
lr40nuy87p55mz67goiw79wtk4yvemca	.eJxVjDEOwjAMRe-SGUV1auPAyM4ZKidOSAE1UtNOiLtDpQ6w_vfef5lB1qUMa0vzMKo5G3ZkDr9rkPhI04b0LtOt2linZR6D3RS702avVdPzsrt_B0Va-dYpYg8sUbHvCE8OwQfnBYUoAWRhzgysXj1HCAEzkSfRY4YuR2Rn3h8jaDgO:1wQt79:HfnTAfUOh21aH4QMItI0uBwFeW1I0XpwByY5sLuWtIo	2026-06-06 20:38:31.76075+00
eerqgku6a4y74hjdn5s1n9dt4p1d8ykq	.eJxVjEEOwiAQRe_C2hCGMhRcuu8ZyABTqRqalHZlvLtt0oVu_3vvv0WgbS1ha7yEKYur6LETl981UnpyPVB-UL3PMs11XaYoD0WetMlhzvy6ne7fQaFW9toTYM5gETI7VA6jVkb3ZL3SjKMl0OwYVAKT7C6TcdobFTuIGuPoxecLEX83aw:1wQt8G:_BhtziCp1iubuEgZjkLf-ACxPWIIU5P6WCZbogyaLg4	2026-06-06 20:39:40.159437+00
ybq7riai8y54k2g6q5317fr74hwrvx23	.eJxVjEsOwjAMBe-SNYrqNnYSluw5Q-XaDi2gVupnhbg7VOoCtm9m3su1vK19uy02t4O6s4sNuNPv2rE8bNyR3nm8TV6mcZ2Hzu-KP-jir5Pa83K4fwc9L_23zlHVFFFyCkEx5yCEFaXCkKCQsBplQ6wVgWqQmiuQTMYlEjcF3PsDMN44Uw:1wQt8e:CU8WaTrWCcFVFiC8Dqmy3SMEzE_kGijCtP6vRHNVPFo	2026-06-06 20:40:04.410896+00
1no3boejtkfwmwi9gg371zv6622p0bov	.eJxVjDEOwjAMRe-SGUUlxbhmZO8ZKsd2SAGlUtNOiLtDpQ6w_vfef7mB1yUPa7V5GNVdHAK6w-8aWR5WNqR3LrfJy1SWeYx-U_xOq-8nted1d_8OMtf8rSlFYZVAQckMqbNzYoEGOhYKIBGOGklabQBbohMhMlgKiZKqobj3B2UtOZE:1wQt9T:Wlh3AxqCB97Ot5MXUt0tdGKEoLfNyX4uMz6cQGwhgAE	2026-06-06 20:40:55.892527+00
elt1y2a5gdxc9do5v8iom7ahgxyzt3n0	.eJxVjEEOwiAQRe_C2pC2A1Nw6d4zkBkYbNVAUtqV8e7apAvd_vfef6lA2zqFrckS5qTOahh6dfpdmeJDyo7Sncqt6ljLusysd0UftOlrTfK8HO7fwURt-tbedUhu7NlgBO68F6GRe4Ic2RtBY9EZGD3laAETgDMpW4aM4oeMRr0_JFs4Jw:1tIA0S:uiiLyiTx76QBJTNbNXTp_QLIzmSSE7eVRf0fTljdkJE	2024-12-16 17:14:44.131642+00
y0rh3e2ip20hhqznbtogyusjwgezwciz	.eJxVjEEOwiAQRe_C2hAYYKAu3fcMBIbRVg0kpV0Z765NutDtf-_9l4hpW6e4dV7iXMRZGAji9LvmRA-uOyr3VG9NUqvrMme5K_KgXY6t8PNyuH8HU-rTt3bkmDRam92AFLwCBKWZwViG4rQFj05rQgc-ZCa8DggGvYWissJBvD8A3ja_:1uVYCj:fjy9vVNBYuuR3RbVZe8kZWMmaASDDAmEqfS1WBljkG4	2025-07-12 16:15:01.670358+00
zz098o6pq2k652zdtem96tycz8lfsf3t	.eJxVjEEOwiAQRe_C2hBkCrQu3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFWn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX9rwC6JoWDYQiAgIYcDJXBkHBpDvUMrIbAzCfoYkeQMPpFPg3eQOlbvD_8wOK8:1uufv9:luTvPHdSrXNdAFN9xMCs9f0svvVCk1bndYQpDkAy9YA	2025-09-19 23:32:43.858289+00
7r67kogdia4p061qtlmnpt4qer2kyl84	.eJxVjEEOwiAQRe_C2hBkCrQu3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFWn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX9rwC6JoWDYQiAgIYcDJXBkHBpDvUMrIbAzCfoYkeQMPpFPg3eQOlbvD_8wOK8:1v0kyy:Klj1QWQislG3-RfsfWDAXeX62YgwqIZ2TUmrDNRcZW4	2025-10-06 18:09:48.03242+00
en4eq333v7eoma0tz3tuu2qnsm4uji06	.eJxVjMsOwiAQRf-FtSHDYwRcuu83EB6DVA0kpV0Z_12bdKHbe865L-bDtla_DVr8nNmFGXb63WJID2o7yPfQbp2n3tZljnxX-EEHn3qm5_Vw_w5qGPVbKyChCCJKimiVzWgTCI2yuOyETkiFQCtDWKINqKM07gzZWh2E1ADs_QHSYzcR:1v4mKm:bPAaS6hFn2LJdiLnhz8ec5bfrqKM8sUTDU5HZIO3s8A	2025-10-17 20:24:56.935729+00
fiw52ld4sjm6ms2jjwmcigc9t9elsfip	.eJxVjEEOwiAQRe_C2hBkCrQu3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFWn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX9rwC6JoWDYQiAgIYcDJXBkHBpDvUMrIbAzCfoYkeQMPpFPg3eQOlbvD_8wOK8:1vBbL3:kLjbVo-F3lFW_KgDVgPPIN4P1_OiqbnRHmgoHbNtMSI	2025-11-05 16:05:25.749254+00
hbqi59lw18983enq525vcoilks8doiz9	.eJxVjEEOwiAQRe_C2hBkCrQu3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFWn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX9rwC6JoWDYQiAgIYcDJXBkHBpDvUMrIbAzCfoYkeQMPpFPg3eQOlbvD_8wOK8:1vNY06:29Dr3UXyCemhpYAZ5Lg_eMaqfxv0_2Uc4iUIV-vSKzM	2025-12-08 14:57:10.695641+00
0i45ef9s83z7s95se10xyfyk03jgj8hn	.eJxVjMsOwiAURP-FtSGgcAsu3fcbyH2AVE2blHZl_HfbpAvdTeacmbdKuC41rS3PaRB1VUGdfjtCfuZxB_LA8T5pnsZlHkjvij5o0_0k-XU73L-Diq1ua0BbiNFFsBYvXkgIvYTsgEyMVFxGD-wMewcF4Nwh-sidbDkgm6w-XwoCOMk:1vyCvu:iC_iaHdckYC6KC7vHmeWXNsnF7Q2iN0NnChGevyC63c	2026-03-19 17:56:22.845308+00
c4w0rwt2l4vnmr7a1vcl9jceb3zh0dvy	.eJxVjDsOwjAQBe_iGln2Zv2jpOcM1vqHA8iW4qRC3B0ipYD2zcx7MU_bWv028uLnxM4MQLLT7xooPnLbUbpTu3Uee1uXOfBd4Qcd_NpTfl4O9--g0qjfWpNBgpIBDUqjhJZFRD0VQlAhBJuMcyHb4qy2GsFElQQYcjhZzJQce38AF3o3wQ:1wFaMU:jMnNBnIWo1DlIkN6O36xNxAl0BlvnBe9oStmGNyhBDw	2026-05-06 16:23:38.39827+00
5cxbz3nn6jelt909c5rcoc8ocnibucbl	.eJxVjMsOwiAQRf-FtSFQHoMu3fcbCMMMUjUlKe3K-O_apAvd3nPOfYmYtrXGrfMSJxIXAc6K0--KKT943hHd03xrMrd5XSaUuyIP2uXYiJ_Xw_07qKnXbz0EGFCrkJlYuxACAJOh4LTX7szJew_FcrZZazRoIJNTyMkWLArKIN4fJN44eg:1wQrLk:cERJ3hfp2XjdmSMWAbBfrKdSiAMBwJ-Ggvdzs8PuOCk	2026-06-06 18:45:28.64839+00
90r72jkgstlahsgclny3320vlfyzmwsw	.eJxVjEEOwiAQRe_C2hAoUIpL956BDDODVA0kpV0Z765NutDtf-_9l4iwrSVunZc4kzgLb4w4_a4J8MF1R3SHemsSW12XOcldkQft8tqIn5fD_Tso0Mu3RiRORmWFwQf2LnnDSYdRa2eHME7Jaqud8kSkgQEngJwzGzUEzEqheH8AQak48Q:1wQt7x:2zfuZe1qfSGUqNr4F2v3f_JaEtX-W_nPwPWydUfTaJA	2026-06-06 20:39:21.720621+00
0aik7hif1xfel13l6v2wud0rwi42fa6z	.eJxVjcsOwiAQRf-FtSECHR4u3fcbyDCAVA0kpV0Z_11JutDtPSfnvpjHfSt-72n1S2QXZhSw0-8akB6pDhTvWG-NU6vbugQ-FH7QzucW0_N6uH-Bgr2MMIgAEaWxxsYpODIGLJKDbL-fDlNWYpKZgtIqK6kRwQotNRAQhjOy9wclPDgd:1wQt81:iG6K_CiSpzIe7gIpCwGJbk_V2QoGXMWMqbS1PZLRcvk	2026-06-06 20:39:25.087054+00
81qu27iqex9bxzv2gi0ioshsv1nvastp	.eJxVjDEOwyAQBP9CHSEw2EDK9H4DuuOO4CTCkrGrKH-PLblImi12ZvctImxriVvjJU4krsI4Ky6_LUJ6cj0QPaDeZ5nmui4TykORJ21ynIlft9P9OyjQyr4GY7TuEZHIo_UWSTkCb7oEIQSDaVB7BuDsTO60IgUDeNczpqzZs_h8AUeAOSU:1wQt87:Fm0-sv10xXFo93wPZnAKX69Z1gVonVZmfo6chpYiJBY	2026-06-06 20:39:31.685312+00
wehw67dw4umn5j9xqv0xn40izxz9tch9	.eJxVjMsOwiAQRf-FtSE8OkBduvcbyDADUjU0Ke3K-O_apAvd3nPOfYmI21rj1vMSJxZn4Y0Tp981IT1y2xHfsd1mSXNblynJXZEH7fI6c35eDvfvoGKv35o8ObB2tMUigB5ccoF8VrkwF2uSAjAaPehS2CscirHEgY1xYQRgEO8PLAE4Fg:1wQt8o:eJgAK4Hm-sEelciZnKOjHjsSsJHE4zXUs3Htwd1_ERw	2026-06-06 20:40:14.197492+00
ga3cld3znln0h4gr5vp3xzg7qyadr9tq	.eJxVjEsOwiAUAO_C2hDg8Qp16b5nII9PpWogKe3KeHdL0oVuZybzZo72Lbu9pdUtkV2ZQWSXX-opPFPpKj6o3CsPtWzr4nlP-Gkbn2pMr9vZ_g0ytdzHUnhjETxIstIIqSl6HJVCBQhGqHm02swJD6OPYLAheg0ShhCkSsQ-X-yUNrA:1wQt8r:qNfxvN2AxCU-GTTpmb1FHtbKhbNhBcstpZi6MHQPGpc	2026-06-06 20:40:17.336854+00
1qhpaajioipjhwp1l8lsvy3fsfbtthxt	.eJxVjMEOwiAQRP-FsyG0LCx49N5vIAtLbdVAUtqT8d9tkx70OPPezFsE2tYpbC0vYWZxFWisuPy2kdIzlwPxg8q9ylTLusxRHoo8aZND5fy6ne7fwURt2tcAqPusPRjFPIK3EIk7a7VRewLH5LoU-3F0AAo9AziFRne4a4jM4vMFEAo3lQ:1wQt9P:XStB40_ZAIm6guEYzRL96oi49LAT-LZ720G2D0XzjgA	2026-06-06 20:40:51.014134+00
hnnymbogzog39ndmp5c22dz1mi1az1st	.eJxVjDsOwjAQRO_iGlnrxGvHlPQ5Q7TxrnEA2VI-FeLuJFIKKKaZ92beaqBtzcO2yDxMrK7Kt426_LYjxaeUA_GDyr3qWMs6T6M-FH3SRfeV5XU73b-DTEve14i2hcBWuAMvxqBtCBJ5w5gSEjuwwVMgcgIc2xSlcxBwD_kIBtXnCyNCOAg:1wQqfi:9KIqX0pBflmMOesObZ5MBzJFyYUXlB3w9HUq0g5t06Y	2026-06-06 18:02:02.116572+00
mbfbjf1xwo4pfh4ojd6ghdllazt6a5wf	.eJxVjMsOwiAQRf-FtSHQKY9x6d5vIEOZStVAUtqV8d-VpAvdnnPufYlA-5bD3ngNSxJnMWgUp18aaXpw6SrdqdyqnGrZ1iXKnsjDNnmtiZ-Xo_07yNTydw2z92rQzAgmObKgUbEi5gjgE6FFNGSNARxHoA60d6TZ2RmcZxbvDxrLN8w:1uVYoK:xbPiBVMbd2qvJeJ_cf1SBWEER16uF4jl0uPfhavRT6I	2025-07-12 16:53:52.059751+00
eksdjjfzx236u0oiv5s35j3658ra4y2u	.eJxVjEEOwiAQRe_C2hAowoBL9z0DGYZBqoYmpV0Z765NutDtf-_9l4i4rTVunZc4ZXERgzj9bgnpwW0H-Y7tNkua27pMSe6KPGiX45z5eT3cv4OKvX7rhDloygm5KAVnIAiqgFVe22CDJ0gWtTdKOSC0DpxmTqaw8UAmhEG8P-jfN4Y:1tIAVY:6BVEB-IVpP8ODtmrMsGg81GY9MW_vkg2aSh0xPzk6PY	2024-12-16 17:46:52.51246+00
jjkc0utlsdxpfcnz5wvq1xydl75pi053	.eJxVjEEOwiAQRe_C2hAUyoBL956BzMCMVA1NSrsy3l2bdKHb_977L5VwXWpaO89pLOqswB3V4XclzA9uGyp3bLdJ56kt80h6U_ROu75OhZ-X3f07qNjrt7ZsPeSTD1wGjtl6KdlYAZIgGa0BhwDERpApGvEMEQEHGwN5RwLq_QFS1zlL:1wQt8O:3klWNamgwcj6RAcDLnogDbWze_BVpM-j6gjgfx1T4dI	2026-06-06 20:39:48.47443+00
z7dx40uevtazdksnoubqxc6ox3vmlsmq	.eJxVjEEOwiAQRe_C2hBkCrQu3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFWn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX9rwC6JoWDYQiAgIYcDJXBkHBpDvUMrIbAzCfoYkeQMPpFPg3eQOlbvD_8wOK8:1uIlhw:Zi5XpUho-aizfgaUh14TO5r_VgvXC2NH3BXbHIMa19I	2025-06-07 10:02:24.692951+00
bhu9xlwmr4osnu54enfv1kj1olfgn0t6	.eJxVjDsOwjAQBe_iGlnxh7WhpOcM1q53jQPIkeKkQtwdIqWA9s3Me6mE61LT2mVOI6uzchDU4XclzA9pG-I7ttuk89SWeSS9KXqnXV8nludld_8OKvb6rYONEExgIA_OonUikSFY4HA65izgHZXiYOABjM0cI5Ehj75gyeJBvT8dATh5:1uVYtp:lr6reps9m7NrAtVDMAjoZ7yZN-itBUT2SiKyfqnWu0U	2025-07-12 16:59:33.228579+00
17lflk29gtjszwnmgkmtji34hu9mbwtn	.eJxVjMsOwiAQRf-FtSEUOjxcuvcbmmEGpGogKe3K-O_apAvd3nPOfYkJt7VMW0_LNLM4C-tBnH7XiPRIdUd8x3prklpdlznKXZEH7fLaOD0vh_t3ULCXb52VM9qnHDFbBkIYPA6gFIRhVAkiGWXZcwiOxqCJSVtSZHwEZznrIN4fNu04Rw:1wPdHX:pq6CnerXCndc5nWkoKmtumEcSF9cbuwKodMzpzvNm_8	2026-06-03 09:32:03.840289+00
97wmutvkg6n2ea0zboa5njmdyewf2fdj	.eJxVjDsOwjAQBe_iGlm2s_5R0nMGa9cfHEC2FCcV4u4QKQW0b2beiwXc1hq2kZcwJ3Zm0yTZ6XcljI_cdpTu2G6dx97WZSa-K_ygg197ys_L4f4dVBz1W3vrQCptMihrCIvRxaEVHiRGzEkDEEXvnSi26GS8AC2tJEVZJoIpsvcHGO04Eg:1uVYtx:2qyXEG2naixw15M6rAKO-arPN-YgOSIJ59pkoRP2gXM	2025-07-12 16:59:41.153485+00
00bng0ew28lt3ww71sifx5xewvmrg1kh	.eJxVjMsOwiAQRf-FtSHDYwRcuu83EB6DVA0kpV0Z_12bdKHbe865L-bDtla_DVr8nNmFGXb63WJID2o7yPfQbp2n3tZljnxX-EEHn3qm5_Vw_w5qGPVbKyChCCJKimiVzWgTCI2yuOyETkiFQCtDWKINqKM07gzZWh2E1ADs_QHSYzcR:1uIljn:cu7DZNUXqbLC8-kt-FfsNRun-deu_Z_nXvDKw-SEH0c	2025-06-07 10:04:19.559879+00
jid5rxs3ylfsakqb1do4ebaf08iuei4j	.eJxVjDsOwjAUBO_iGlmx4y8lPWewXp7XOIASKU4qxN0hUgpod2b2JRJta01bw5LGLM6i91acfteB-IFpR_lO022WPE_rMg5yV-RBm7zOGc_L4f4dVGr1WxuChmLPNsLEoDTgezCV7Lw20QWoogbPkRkudy6WYGAQqLDqrHPi_QFNNDjw:1uVYv2:pK9BBlRD_Bw28usoSz1pB_8QKYl05d4GKQ4BQdUJv4c	2025-07-12 17:00:48.690158+00
zyvdl1g2gsd6n9alm6bnx136n9q53q02	.eJxVjEEOwiAQRe_C2hBggFKX7j0DmWFAqqYkpV0Z765NutDtf-_9l4i4rTVuPS9xYnEWEECcflfC9MjzjviO863J1OZ1mUjuijxol9fG-Xk53L-Dir1-a6sNZ6PUmNTg2RF4DalkMKSzx6AKeUIMgdipRM5q68ZgGIAsjqkM4v0BKuc4WQ:1uVYv7:AVRfwvukrKClW1jM2cm0RRMBtiK2KQ7Y2RQFBP_YvMI	2025-07-12 17:00:53.839225+00
so7f89jc12um20zus0z77rja51njhftc	.eJxVjEEOwiAQRe_C2hBkCrQu3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFWn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX9rwC6JoWDYQiAgIYcDJXBkHBpDvUMrIbAzCfoYkeQMPpFPg3eQOlbvD_8wOK8:1uuzVU:XQAto8Jf9SB06he4ZCGakc_p4fJxOAhHXltBHiDwVks	2025-09-20 20:27:32.9019+00
uzpb0cgla3o0jbd22x91do2p2ds6qon6	.eJxVjMsOwiAURP-FtSGgcAsu3fcbyH2AVE2blHZl_HfbpAvdTeacmbdKuC41rS3PaRB1VUGdfjtCfuZxB_LA8T5pnsZlHkjvij5o0_0k-XU73L-Diq1ua0BbiNFFsBYvXkgIvYTsgEyMVFxGD-wMewcF4Nwh-sidbDkgm6w-XwoCOMk:1v0o3e:HURpadyOkfBhD-aFKw3sgYhsTOk2ydgJtghvSQxUlLE	2025-10-06 21:26:50.42432+00
7uj9kjyjpync88co9pml8sbjmih9y3vm	.eJxVjMsOwiAQRf-FtSFIpwy4dO83NAMzSNVA0sfK-O-2SRe6vefc81YDrUsZ1lmmYWR1UeBBnX7XSOkpdUf8oHpvOrW6TGPUu6IPOutbY3ldD_cvUGgu2xsNsrN9sCGQ-E6kI5Fsz2iMoy3jPIc-AjBGEMLk2Ur2wCAuI1pRny85Tjjs:1v6MSl:AaxoIjOrao56CnMalmifPA-KOhe6hNa0nHxKW0-4sWQ	2025-10-22 05:11:43.821584+00
behvdfgg1mxljc5q27yh1zlz7o6a5hqx	.eJxVjEEOwiAQRe_C2hBkCrQu3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFWn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX9rwC6JoWDYQiAgIYcDJXBkHBpDvUMrIbAzCfoYkeQMPpFPg3eQOlbvD_8wOK8:1vDp0U:kG9Bl0qRJO2o7RRFifoVqZRixKZykLr_GD1FBP2YzsM	2025-11-11 19:05:22.307972+00
g1iegkl7zj1ygphemwt2r82pyr3j0suu	.eJxVjEEOwiAQRe_C2hBkCrQu3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFWn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX9rwC6JoWDYQiAgIYcDJXBkHBpDvUMrIbAzCfoYkeQMPpFPg3eQOlbvD_8wOK8:1vOamt:p9hNRD7cJT8tdNSUxwBrGiuzpRR9GOhs01gc1WxKfgk	2025-12-11 12:07:51.85872+00
3dmm5d47zvq9o0urvs79ewcb6y1h3og9	.eJxVjEEOwiAQRe_C2hBkCrQu3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFWn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX9rwC6JoWDYQiAgIYcDJXBkHBpDvUMrIbAzCfoYkeQMPpFPg3eQOlbvD_8wOK8:1vyD3b:nRZVZZJ1jX5jNHKwEVZbB6wtOcdAAeLECqf9XmBsTFM	2026-03-19 18:04:19.152202+00
9nmji4qj578f2437r42qz3kna6601o4x	.eJxVjDsOwjAQBe_iGlnEXn-Wkp4zWP7s4gBypDipEHcnkVJAOzPvvUWI61LD2mkOYxEXYb0Rp1-aYn5S21V5xHafZJ7aMo9J7ok8bJe3qdDrerR_BzX2uq3BceGo0RZktmfkTBYRtAUyjIBK5Q0PZAcHkBwm7wmiNsYxO6W9-HwBObI38w:1wGd70:4RPGdHto09JOQXFeW8de6WklF6W2hQaajlUlh8oB9c4	2026-05-09 13:31:58.957891+00
p8dmq31ro4g9vsy0ivwycmlpwz7fums5	.eJxVjEEOwiAQRe_C2hAoUIpL956BDDODVA0kpV0Z765NutDtf-_9l4iwrSVunZc4kzgLb4w4_a4J8MF1R3SHemsSW12XOcldkQft8tqIn5fD_Tso0Mu3RiRORmWFwQf2LnnDSYdRa2eHME7Jaqud8kSkgQEngJwzGzUEzEqheH8AQak48Q:1wPkiE:0r5ujSso-2y3fhjN3ghTh96iU1er595qpIJmDx14gNg	2026-06-03 17:28:06.825804+00
06tjvizt656v6flx8ciimphotndwisun	.eJxVjDsOwjAQBe_iGln-bWxT0nMGa73e4ABypDipEHeHSCmgfTPzXiLhtta0dV7SVMRZDOL0u2WkB7cdlDu22yxpbusyZbkr8qBdXufCz8vh_h1U7PVbgyXrcAyYjTPAwRcVnXVZW00lasoDsfMKMGplgmZjIDtlEAg8cxnF-wPSxDeP:1tIAYJ:wCQh1QJY5nAf9EcC3CWg8Jsmmn_lq_7HJ_e2vadabYw	2024-12-16 17:49:43.471498+00
abpdbvjihxdoli5x9cidnpycigy4y0dw	.eJxVjEsOAiEQBe_C2pCGBgSX7j0DoaGVUQPJfFbGuyvJLHT7quq9REzbWuO28BynIk5CgTj8jpTyg9sg5Z7arcvc2zpPJIcid7rISy_8PO_u30FNSx31NXuD4BBdMjqTRdCOvFVoWYE1xjtDBkBl69ARw5EDcgjfTAPlIN4f1Lc22Q:1wRHPS:68Q0NoxTMM38TZNBrm5_45RcKHIksuxAxp2opOLjqag	2026-06-07 22:35:02.317987+00
nojvaq9uk9dcewhraeo4kutv6oe5eocc	.eJxVjDsOwyAQRO9CHSGDMZ-U6X0GtLBLcBKBZOwqyt1tSy6cZop5b-bLPKxL9muj2U_I7kyz27ULEN9UDoAvKM_KYy3LPAV-KPykjY8V6fM43b-DDC3v656cNVLbTiezJ5JD6JSh3jqnE5CFIQ5CRhRaGZAoSCAFFaURNiQF7LcB1CI36g:1uIlq2:-SP1wJnlkMLuUSMeJjp1MXsVy0ZyiVLhHw5LxDT8dZA	2025-06-07 10:10:46.791446+00
fc8keyquvpfgklc11zmz7is4xnfwir8v	.eJxVjEEOwiAQRe_C2pAyUwq6dN8zkIEZpGpoUtqV8e7apAvd_vfef6lA21rC1mQJE6uLQg_q9LtGSg-pO-I71dus01zXZYp6V_RBmx5nluf1cP8OCrXyrcFyTEh9tl02nlxmYnaQshsSmEhndBAFsMPeoE3GDYAeSSQ6tgCg3h9ICThT:1uVYu6:9fJ_pp1HtULj-ojl3-kjJ5qVFN0PBWoktvVG9X2k7L0	2025-07-12 16:59:50.309547+00
3t1ofs97wwtzt7p2bgkh5mxhbhrotrxw	.eJxVjTsOwjAYg--SGUVJyOtnZOcMkfMoKaBWatoJcXcaqQN4tD_bbxawrTVsrSxhzOzCtDTs9OtGpGeZepQfmO4zT_O0LmPkHeFH2vhtzuV1Pdi_gYpW97YlaWC6HAntlACRSQBSdhBR0UAoPu__lLT2djjHCO1JWEXCeck-Xw5BN10:1uyocu:5b-aFv3v4gV4lGsRKydHOTlgjF48K8z6gTWRh72SNi8	2025-10-01 09:39:00.160619+00
yezuirb3knnqfmcjxo1yywaq6c2qvpix	.eJxVjDsOwjAQBe_iGlm2418o6TmDtetd4wBypDipEHeHSCmgfTPzXiLBtta0dV7SROIsrFPi9Lsi5Ae3HdEd2m2WeW7rMqHcFXnQLq8z8fNyuH8HFXr91rqAp8hGDTjQSCE6E4i1KaY4mznE0RqrVVYEkcBhKWicJ_SWLBYM4v0BOdU4-g:1v16aT:Dnefs3Cx8JwUCIMlhkIDN5QpbH3t0us2OvuXnNPEqp4	2025-10-07 17:13:57.865651+00
5e2rb2spyhjwmblot6hxe9n178ehke32	.eJxVjMsOwiAQRf-FtSHDYwRcuu83EB6DVA0kpV0Z_12bdKHbe865L-bDtla_DVr8nNmFGXb63WJID2o7yPfQbp2n3tZljnxX-EEHn3qm5_Vw_w5qGPVbKyChCCJKimiVzWgTCI2yuOyETkiFQCtDWKINqKM07gzZWh2E1ADs_QHSYzcR:1v6suJ:ET6VV3-vwyIdXl6Ll9ZSSwzoz72MLQdXX2QhSTyifrk	2025-10-23 15:50:19.800734+00
c0jeiifs86fxttlegasdutd6sysie9ac	.eJxVjEEOwiAQAP_C2RBYaCkevfcNZGEXqRpISnsy_t006UGvM5N5i4D7VsLeeQ0Liasw4vLLIqYn10PQA-u9ydTqti5RHok8bZdzI37dzvZvULCXY8sARN64yDwC6KxyNsNgTZo04JC8tpY8O28ILY3MoHKCyDip6FLO4vMF5_04kw:1vR7DB:9vVUFrG_QyiOM5PAaw61pNs5oaB0PpHmzqNbg1GgxTQ	2025-12-18 11:09:25.798652+00
78n4rlcdp00b27htsmha7di6e076ujg3	.eJxVjDsOwjAQBe_iGln2Zv2jpOcM1vqHA8iW4qRC3B0ipYD2zcx7MU_bWv028uLnxM4MQLLT7xooPnLbUbpTu3Uee1uXOfBd4Qcd_NpTfl4O9--g0qjfWpNBgpIBDUqjhJZFRD0VQlAhBJuMcyHb4qy2GsFElQQYcjhZzJQce38AF3o3wQ:1vyb6P:IdG0dmnTJCZSX2Z96QLoJScR83SFK62RM9NI4u-4hzw	2026-03-20 19:44:49.924193+00
o8nvxlm9m9s820p3o8akd8ksh38elnw8	.eJxVjE0OwiAYRO_C2pBCAcGle89A-H6QqoGktCvj3W2TLnQ3mfdm3iKmdSlx7TzHicRFWKvF6beFhE-uO6JHqvcmsdVlnkDuijxol7dG_Loe7t9BSb1sa0xBKUCTACgromELzoNGN7LDnC0xasMayNoBGMxImQKePXpLgVh8vocOOqI:1wGg7b:uTNhk7IT0a1XKuwSHkUXVD8CCxJnR15Sysg55u8-qto	2026-05-09 16:44:47.504443+00
7p2z77jr08j2sqv8x11zp7ccnbc7cplx	.eJxVjDsOgzAQRO_iOrLAsPY6ZXrOYO36E5NEtoShinL3gESRlDPvzbyFo23NbmtxcXMQVzEMnbj8tkz-GcuBwoPKvUpfy7rMLA9FnrTJqYb4up3u30Gmlvd1QlQDkB6NisgEjOgJORjwQGyj0WC16ZJlg8l7C0SMvepHoGT2KD5fNP04jg:1wQt88:0bSYgjn6u-_dlD9mKfGKaYRVVWMQxg0RQiYPvz2yjcY	2026-06-06 20:39:32.243855+00
yqzxtllu66p2z9xdqd464n6mz4am8foo	.eJxVjDsOwjAQBe_iGlnxd9eU9DlD5M1uSADZUj4V4u4kUgpo38y8t-ryto7dtsjcTayuCrxVl9-Vcv-UciB-5HKvuq9lnSfSh6JPuui2srxup_t3MOZl3GuXUFgawBCTGShEis47SThYtkQOogMWQN80SGIYQQKnAHuFwZigPl8fRDet:1wQt96:LndC8JgTVzfNZ3_Yu4TPGI8E6MiEaTD8pV51ZJcDuNc	2026-06-06 20:40:32.522549+00
6kfq5q9vjy2buecj4j38fms0c320g6ui	.eJxVjEEOwiAQRe_C2pCBAlKX7nsGMjCDVA0kpV0Z765NutDtf-_9lwi4rSVsnZcwk7gIra04_a4R04PrjuiO9dZkanVd5ih3RR60y6kRP6-H-3dQsJdvPfqk0aFyNIKzA6QYmRiQHXrgM0XlrfYqZ88xA2UDmIwbDLM1MHgQ7w9GPDi8:1tJUpO:n4zgfWfGscfAjbGomnB2gN0CeeBR1NQkjjH3vmMVsWg	2024-12-20 09:40:50.113046+00
y3t2vi62nrh6uiu4cfiardn0gkbdqr9h	.eJxVjEsOAiEQBe_C2hCGbgRcup8zEJoGGTWQzGdlvLtOMgvdvqp6LxHittawLXkOE4uLAO3F6XelmB657Yjvsd26TL2t80RyV-RBFzl2zs_r4f4d1LjUb63BcMFInhHL4EwEQOvOjAkNE2tjyVsk43XSpVBxw5ChgCLI2hqlxPsDLlc4Dg:1uVYzM:8T6caDS9_VzeYA33yjl71P0sXX0xVaTi_iMwgrlgF3I	2025-07-12 17:05:16.574015+00
n95tnv8wp7lkpzn7d4rdhd9t8es2z2gh	.eJxVjDsOwjAQBe_iGlk28W8p6XOGyLvrxQHkSPlUiLtDpBTQvpl5LzXkba3DtpR5GFldlLNBnX5XzPQobUd8z-02aZraOo-od0UfdNH9xOV5Pdy_g5qX-q0BPYSChSMHKAmjBUogBMaTd3IWNkaCWBBrAQldiNJlit6k0Flh9f4ASSk4ww:1uysFU:VQQT7MAErw_vWFUT-hk7k5SeoYhpDpwdsK4Hdim1Okc	2025-10-01 13:31:04.10374+00
v33thpzux73aoy6kfxhowdizu2quwme9	.eJxVjMEOwiAQRP-FsyFLKQgevfsNZBcWqRpISnsy_rtt0oPOcd6beYuA61LC2nkOUxIXMRolTr8tYXxy3VF6YL03GVtd5onkrsiDdnlriV_Xw_07KNjLtiZLyOwtaeVARUxZO1akDSkPfnRbYrTaOoiYh5yz90Ybk2AAOKMF8fkCPXo4Dg:1v1Xu7:xZO8EYlx_14ZDZ40PgX5oPMLJsMI1M0-zSxXRNZeIro	2025-10-08 22:24:03.804354+00
drq9kr088dd5kxswtvtl3kpwsr12ibbk	.eJxVjMsOwiAQRf-FtSG8YVy67zcQBkapGkhKuzL-uzbpQrf3nHNfLKZtrXEbtMS5sDPz2rDT74opP6jtqNxTu3Wee1uXGfmu8IMOPvVCz8vh_h3UNOq3DqAgGyBbTHBXkFpIRHQghSATLHrlCIzJWngpnKKUldIehaRC0mpi7w8HATdJ:1wPmcT:-iUb91PiQKjvNJ7GDYLqVQj05S3ASBCbzt3POne1K-8	2026-06-03 19:30:17.712535+00
q1rqo7b5c2wt58nzidd6hdm1tfmngd3p	.eJxVjEEOwiAQRe_C2hBkCrQu3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFWn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX9rwC6JoWDYQiAgIYcDJXBkHBpDvUMrIbAzCfoYkeQMPpFPg3eQOlbvD_8wOK8:1vEX7h:SnfqZGgW5jCKn1GuXIxQI3PlyvYscF6gbEKh0Nn2GDI	2025-11-13 18:11:45.229575+00
83w3v5ls042j5enwcua8wesq6sv3gq0p	.eJxVjMsOwiAQRf-FtSEMHSjj0r3f0MAM2KqBpI-V8d-1SRe6veec-1JD3NZx2JY8D5Oos3LOqNPvmiI_ct2R3GO9Nc2trvOU9K7ogy762iQ_L4f7dzDGZfzWaG0hAA7cmexCFwU7hL7PqTdMVpDIM4FPFMC7BEYwcGFbHCMEQvX-AAr_N1s:1vR8Nq:iU4tYnSXEN_w1WhsgaUCqfuPNFsJ8W-nNi8jQfa4Q3Y	2025-12-18 12:24:30.515329+00
5kltyndg1091nzaw4olmksi8sglt9cio	.eJxVjDsOwjAQRO_iGln-rrOU9JzBsr0LDiBHipMKcXcSKQV0o3lv5i1iWpca185zHEmcBXgtTr9tTuXJbUf0SO0-yTK1ZR6z3BV50C6vE_Hrcrh_BzX1uq1NQJ2AEEzhwkl7Y5RHLFvynOlmPLhiB2sdBQByPtgMHIJCxEE7JT5fHOE3Mw:1vzGOB:FZWMfiwQwge0aSvOkSDhFqSTGo6g3n_XI_5tD0OKaAU	2026-03-22 15:49:55.597889+00
ytpgktcc5z11c3skh54j6c7njiru4co0	.eJxVjEEOwiAQRe_C2hBkCrQu3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFWn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX9rwC6JoWDYQiAgIYcDJXBkHBpDvUMrIbAzCfoYkeQMPpFPg3eQOlbvD_8wOK8:1wHIjp:9TFlhyrXLQjwGZw1xqsaswRUUa177_Qz0IZNdU5YQW8	2026-05-11 09:58:49.366471+00
cvtoagcg5h62vv42j2c2okqdumjq31wo	.eJxVjMEOwiAQRP-FsyHAghWP3vsNZFkWqRpISnsy_rtt0oPeJvPezFsEXJcS1s5zmJK4igGUOP22EenJdUfpgfXeJLW6zFOUuyIP2uXYEr9uh_t3ULCXbc3oorM6gzkT2y1oRO8VXaIjgmyMyegygAO0YBnBg_JmIJ8VWdZefL42Wzgs:1wQt8h:qdrRH6Q-r52EeLnS-JqzQXQG70IZXUTBiVajtW_KCtU	2026-06-06 20:40:07.666198+00
p7by08g6tlmzs5r6n9fjw8ks3wbvere7	.eJxVjMsOwiAQRf-FtSE8KgMu3fcbyHQYpGogKe3K-O_apAvd3nPOfYmI21ri1nmJcxIXATqI0-86IT247ijdsd6apFbXZZ7krsiDdjm2xM_r4f4dFOzlW5vgdfCIjgmTRs0OEihPgzcqWxcgOAw45ME5OOtMwKCYFGSLlE224v0BK7I4WQ:1wQt8q:m4CtZuk1X-8h9wxIlq7P6-lXvHfqVIwKdejLeCSUrLQ	2026-06-06 20:40:16.197741+00
0dk0vqp91r5zwvyzx9c5prk779rc7ls4	.eJxVjEEOgjAQRe_StWla2gbq0r1nINP5M4IaSCisjHdXEha6_e-9_zI9bevQb1WWfoQ5mzYGc_pdC_FDph3hTtNttjxP6zIWuyv2oNVeZ8jzcrh_BwPV4Vt3npg1sRCSss8N1EkS6mIGc3GK1IUITYocvOPiG8QAAdhl5da8P35zOks:1wQp62:1IbsvkQjRMibJZY9Vy2aNvqbPGvn9SoAuyol_vXkks0	2026-06-06 16:21:06.790151+00
zgmoqhuhkv127dsqjggj30tujux1dv6f	.eJxVjEEOwiAQRe_C2hBkCrQu3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFWn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX9rwC6JoWDYQiAgIYcDJXBkHBpDvUMrIbAzCfoYkeQMPpFPg3eQOlbvD_8wOK8:1wQp8A:LllsAFUHG2n-Dv64R4zgYFZd0_Pp-mJFms_jF7QUCzU	2026-06-06 16:23:18.867543+00
vpjdm0yodspqt8ilh7avbh4w0db6g2nd	.eJxVjEEOwiAQRe_C2pDC0AIu3XsGMgODVA0kpV0Z765NutDtf-_9lwi4rSVsnZcwJ3EWIE6_G2F8cN1BumO9NRlbXZeZ5K7Ig3Z5bYmfl8P9OyjYy7e2AwETZM5RjY7UgNGD1Tp6k3zMSJNXVgM4TZNjNEReZz8qSAzOAIn3B_N_OAU:1tJyl2:RVodmkZM6FoiDbyKr8VnOr7J4zeDfruBmXraJzgvNdM	2024-12-21 17:38:20.131912+00
w9i12nnf3tth87qw0ka101noh3gtfrzy	.eJxVjEEOwiAQRe_C2hBkCrQu3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFWn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX9rwC6JoWDYQiAgIYcDJXBkHBpDvUMrIbAzCfoYkeQMPpFPg3eQOlbvD_8wOK8:1uVZgG:yjMKRspoSsGkuKSBohLfDtwi2Jd_9VuE85R1hNed4To	2025-07-12 17:49:36.154679+00
sztaxe5ydz30fnwldorogt2bwdapn0hd	.eJxVjEEOwiAQRe_C2hBkCrQu3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFWn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX9rwC6JoWDYQiAgIYcDJXBkHBpDvUMrIbAzCfoYkeQMPpFPg3eQOlbvD_8wOK8:1uzhJx:nUI4FCjY7ZnyDXek9Bpum8ygwFf8FuODrJF7u4Dptq8	2025-10-03 20:03:05.154572+00
1ovml0r9hkbijseicmnhqakqoyrtca3p	.eJxVjDsOwjAQBe_iGln-4Q8lfc5grXdtHEC2FCcV4u4QKQW0b2bei0XY1hq3kZc4E7swpSQ7_a4J8JHbjugO7dY59rYuc-K7wg86-NQpP6-H-3dQYdRvjcW5TO6sC2XhIAQ0knwRCgVqE9Bma4RUQms0lpQx3nsLlDCRVjJZ9v4ANQ04Mw:1v2Bkn:I-b4Z0xScEviRE0sO97BBUBZFZ1-q8N_GQvz8efi--U	2025-10-10 16:57:05.983337+00
xn3h4b800eweh0msdy63hu8bhowzc0p1	.eJxVjDsOwjAQBe_iGln2Zv2jpOcM1vqHA8iW4qRC3B0ipYD2zcx7MU_bWv028uLnxM4MQLLT7xooPnLbUbpTu3Uee1uXOfBd4Qcd_NpTfl4O9--g0qjfWpNBgpIBDUqjhJZFRD0VQlAhBJuMcyHb4qy2GsFElQQYcjhZzJQce38AF3o3wQ:1vEX8B:Ycx3SghQb5wa4X9IOS_kyV-ChVd8m7vT7S6wvtKZ5f0	2025-11-13 18:12:15.819064+00
i4p4s04l90qfekeqjbso9i4q79c4ucl4	.eJxVjMsOwiAURP-FtSG8ygWX7vsN5PKSqoGktCvjv0uTLnQ3mXNm3sThvhW397S6JZIrmSZOLr-tx_BM9UDxgfXeaGh1WxdPD4WetNO5xfS6ne7fQcFextrrgNxmkSFyiCCAjehTTkYa1ArAchWGI7QXILlmwioWJRcmqwwhkM8XLyM35Q:1vR9lk:kehXWRBUBjJteUPOYs50l6q11CdZ_CkzRE1LmI86gRA	2025-12-18 13:53:16.475039+00
x8wx0atccp5u18eu1kbe7t099fqnj2rn	.eJxVjDsOwjAQBe_iGln2Zv2jpOcM1vqHA8iW4qRC3B0ipYD2zcx7MU_bWv028uLnxM4MQLLT7xooPnLbUbpTu3Uee1uXOfBd4Qcd_NpTfl4O9--g0qjfWpNBgpIBDUqjhJZFRD0VQlAhBJuMcyHb4qy2GsFElQQYcjhZzJQce38AF3o3wQ:1w4NBn:twZebPY1EyY3EBan_VNSTA95MRIK0lQjUMdzFeAAS4c	2026-04-05 18:06:15.668925+00
3yy4mn6kot0cfidtqm0drnckz9euc2gp	.eJxVjEEOwiAQRe_C2hBkCrQu3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFWn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX9rwC6JoWDYQiAgIYcDJXBkHBpDvUMrIbAzCfoYkeQMPpFPg3eQOlbvD_8wOK8:1wHhXa:HmSaDwiiwibls_DMbS6umhcdPyNATk9TestDGyLujho	2026-05-12 12:27:50.694936+00
7789lzjgakub81buqc185j4f885f8cj6	.eJxVjEEOwiAQRe_C2hCcQmFcuu8ZyDADUjVtUtqV8e7apAvd_vfef6lI21rj1vISR1EX1XWgTr9rIn7kaUdyp-k2a56ndRmT3hV90KaHWfLzerh_B5Va_dacrRNPyTnfnz1bQiohMPbWgC0WEJzFEhwjIzoOEETQlA6MQMoU1PsDJEQ3_w:1wRrzk:6CZFUV0LHn7GVf-j-iHApit99Ijd_jfLSdk5JY1lOWQ	2026-06-09 13:38:56.342938+00
jeizgsd0i5iz9yw5olp2oseji5p386ew	.eJxVjEEKwyAQAP_iuYisrok99t43iOtuatpiICan0L8XIYf2OjPMoWLatxL3JmucWV0VgFeXX0opv6R2xc9UH4vOS93WmXRP9Gmbvi8s79vZ_g1KaqWPPRC7ZBEBIfMkxBkhBPEoNpGYDI49ZmscD4GNA4EwjUDjgOAF1ecLOYQ4PQ:1tL0tm:n07pbcS0Vw703H9sexNyjKmn6iQsi3XcC55UQf2fE8E	2024-12-24 14:07:38.076797+00
y18zhynrhfco5smkgvc7n08ytfr6cp8d	.eJxVjEEOwiAQRe_C2hAGBrAu3fcMZICJVA0kpV0Z764kXej2vff_SwTatxL2zmtYsrgIC16cfmmk9OA6VL5TvTWZWt3WJcqRyMN2ObfMz-vR_h0U6mWskRShQuM9JQ2QFEH6QquiJWBEMDo7R-RStGczcSZGbQwyGDs5L94fKf433w:1vFJ7l:cM8sFeB1b9nK8dh3ZW5xPYMF3XbLZ8-XNNnQlVitByE	2025-11-15 21:27:01.381372+00
5412ry5frxbjf7udde0eojh2iprkpfi3	.eJxVjE0OwiAYRO_C2pBCAcGle89A-H6QqoGktCvj3W2TLnQ3mfdm3iKmdSlx7TzHicRFWKvF6beFhE-uO6JHqvcmsdVlnkDuijxol7dG_Loe7t9BSb1sa0xBKUCTACgromELzoNGN7LDnC0xasMayNoBGMxImQKePXpLgVh8vocOOqI:1vRdiL:6vQve01ulpmYrqTvPSMj7cB7OUqa-ZgmfKP29hElUJQ	2025-12-19 21:51:45.251479+00
xc85m0wxn38uqsjg7maamep9b6djo60d	.eJxVjMsOwiAQRf-FtSHDYwRcuu83EB6DVA0kpV0Z_12bdKHbe865L-bDtla_DVr8nNmFGXb63WJID2o7yPfQbp2n3tZljnxX-EEHn3qm5_Vw_w5qGPVbKyChCCJKimiVzWgTCI2yuOyETkiFQCtDWKINqKM07gzZWh2E1ADs_QHSYzcR:1w4ged:EhLWbCjCDo8xnvs90Cclvy3Qwi3wePiYre71AT0krNA	2026-04-06 14:53:19.202854+00
cf1kr448v6efty8y2y8454kvat0hqsys	.eJxVjEEOwiAQRe_C2hBkCrQu3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFWn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX9rwC6JoWDYQiAgIYcDJXBkHBpDvUMrIbAzCfoYkeQMPpFPg3eQOlbvD_8wOK8:1wHzhy:C5HHwHsxhU0GGi30HeXvofFBajEvQybW534X5DcTOqA	2026-05-13 07:51:46.693628+00
b9od2u8vo48wsxsausu6w7mel2rnxwab	.eJxVjEEOwiAQRe_C2hBkCrQu3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFWn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX9rwC6JoWDYQiAgIYcDJXBkHBpDvUMrIbAzCfoYkeQMPpFPg3eQOlbvD_8wOK8:1wT2Cr:PAfdH7QYtAIBI6usSDdexJ4lyApvamWozV3Kmk7YHWU	2026-06-12 18:45:17.051948+00
9mq0p37s1qjqcexs7vztvfnxhtyv52q2	.eJxVjE0OwiAYRO_C2pBCAcGle89A-H6QqoGktCvj3W2TLnQ3mfdm3iKmdSlx7TzHicRFWKvF6beFhE-uO6JHqvcmsdVlnkDuijxol7dG_Loe7t9BSb1sa0xBKUCTACgromELzoNGN7LDnC0xasMayNoBGMxImQKePXpLgVh8vocOOqI:1wQ8RB:cxLji8WZ2jaa8g9XW6xgylAe0JOSKwDyKg7cYGr-ddU	2026-06-04 18:48:05.923717+00
2fezg2yuyli8uc2ryphw5ya9y32hjrnb	.eJxVjMsOwiAQRf-FtSHQKY9x6d5vIEOZStVAUtqV8d-VpAvdnnPufYlA-5bD3ngNSxJnMWgUp18aaXpw6SrdqdyqnGrZ1iXKnsjDNnmtiZ-Xo_07yNTydw2z92rQzAgmObKgUbEi5gjgE6FFNGSNARxHoA60d6TZ2RmcZxbvDxrLN8w:1wQt8Z:lmuuLv0EqokLf_yvx0d4nxBU5ahYPj6iak33JN52NvY	2026-06-06 20:39:59.44038+00
fkfqup93cx79x6ncg0di6vmouai6sxrc	.eJxVzE0OwiAUBOC7sDakQOkDl-57hub9EFs1kJR2Zby7NOlCt_PNzFtNuG_ztNe0TouoqwLbqctvSsjPlA-SB-Z70Vzyti6kj4o-teqxSHrdzu7fwYx1bmsCH1MfLDvqDIAAhc6gRAfGMg_ILjDF6AMKDNIg2OSpYd8bcgzq8wUmLzgS:1wQt95:awlAHB0nwbU2lIq-gOdcT-rh3fyVO0IBj3Km99zi9n4	2026-06-06 20:40:31.525452+00
61wd2iitb8kr3nshmg5zq7h16ux5p4th	.eJxVjLsKwzAMAP_FczGxka24Y_d-Q5AluU5bHMhjCv33EsjQrnfH7Wagba3Dtug8jGKuBgHM5Zdm4pe2Q8mT2mOyPLV1HrM9Envaxd4n0fftbP8GlZZ6jBk7cur7IlCcl5ICx8RZimLI3scIAhiRUuLU9Q6w00ASijoGzGg-X0E7OIo:1wQt95:Rsxpy7DtOtiYmacc8I8kR0NoeH1poPegz3lEjhy8zNQ	2026-06-06 20:40:31.854135+00
chewdrim64wt5afd0d5j7bj9un9ui7b6	.eJxVjEEOwiAQRe_C2pAhDDB16d4zEBhAqoYmpV013t026UK3_733N-HDulS_9jz7MYmrQHH53WLgV24HSM_QHpPkqS3zGOWhyJN2eZ9Sft9O9--ghl73OkRnnFWEBU0GS6oUAq3RwMCESA4jsdstZQcCV4hBI4LhmIFLSuLzBbe5Nyc:1tLNGU:TQl-LHTMH3Kls4EfxiqZgkzXC0lVESApYPz6NwZNtXs	2024-12-25 14:00:34.236816+00
veggkqqgebjdqaz6ztscskunt8mhjqhb	.eJxVjEEOwiAQRe_C2hBkCrQu3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFWn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX9rwC6JoWDYQiAgIYcDJXBkHBpDvUMrIbAzCfoYkeQMPpFPg3eQOlbvD_8wOK8:1vGzKO:IUc8_wLcInMOJUkq2GZZjYacONq2HEUlv1gTym20A4U	2025-11-20 12:43:00.408157+00
70qsfxfpjaupkxjp3u7qg6kesl1mv02n	.eJxVjMsOwiAURP-FtSGgcAsu3fcbyH2AVE2blHZl_HfbpAvdTeacmbdKuC41rS3PaRB1VUGdfjtCfuZxB_LA8T5pnsZlHkjvij5o0_0k-XU73L-Diq1ua0BbiNFFsBYvXkgIvYTsgEyMVFxGD-wMewcF4Nwh-sidbDkgm6w-XwoCOMk:1uIoBz:XZObV-8R4LAmlDj-9wPtM0VJLpoNiliWSob0OW6Yu1c	2025-06-07 12:41:35.599852+00
edfymjq4yk77cij8ro1vbcecggdkscxz	.eJxVjEEOwiAQRe_C2hBkCrQu3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFWn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX9rwC6JoWDYQiAgIYcDJXBkHBpDvUMrIbAzCfoYkeQMPpFPg3eQOlbvD_8wOK8:1vSh4G:-_p9jRT_gtpL7tXVkmCNAmhpEO9SGKcVCPWthJUZZ2A	2025-12-22 19:38:44.543328+00
3nztr6lim1n7n4o12ova96e937jsbhze	.eJxVjEEOwiAQRe_C2hBkCrQu3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFWn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX9rwC6JoWDYQiAgIYcDJXBkHBpDvUMrIbAzCfoYkeQMPpFPg3eQOlbvD_8wOK8:1w5Lis:Kg-jvVc2DpEa9pumLUcZLDsu52FiyAPkGWb_ZC5q7UU	2026-04-08 10:44:26.37765+00
ouuofycywkiusdatjhuwu63wp4ba1s3r	.eJxVjMEOwiAQRP-FsyFroKXr0bvfQHZZkKqBpLQn479Lkx70NMm8N_NWnrY1-63Fxc-iLmpUp9-OKTxj2YE8qNyrDrWsy8x6V_RBm75Via_r4f4dZGq5rxE54QiBLDAQnx0GSEnYSbB2IEQzOQedxiRxAoskyQ7R9ARxJqjPF_0nOJ4:1wT2H0:W6ry74cd2ms7TgtfzPnOfaXkYIPFV1LhzwDyPDlnTDo	2026-06-12 18:49:34.240816+00
rqcilkb490q9fifoi8pwj3dwkeqfsgui	.eJxVjEEOwiAQRe_C2hBkCrQu3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFWn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX9rwC6JoWDYQiAgIYcDJXBkHBpDvUMrIbAzCfoYkeQMPpFPg3eQOlbvD_8wOK8:1wQ8qP:WdFGUJJw2pQI3m8spxJKcq6X2TIf6vF8fMmTjf1FbDc	2026-06-04 19:14:09.17702+00
r6o2tdtzlwtx4yza9mngfvd0v04bd3ei	.eJxVjMsOwiAQRf-FtSEUOjxcuvcbmmEGpGogKe3K-O_apAvd3nPOfYkJt7VMW0_LNLM4C-tBnH7XiPRIdUd8x3prklpdlznKXZEH7fLaOD0vh_t3ULCXb52VM9qnHDFbBkIYPA6gFIRhVAkiGWXZcwiOxqCJSVtSZHwEZznrIN4fNu04Rw:1wQt87:YwA0fqaZege2DCV68loUelNLWvAWDE3R82qC4ttrQtk	2026-06-06 20:39:31.479864+00
tc4tqssnq33c8iwra5txqh7dcip9l4k7	.eJxVjcEOwiAQRP-FsyG72C7g0Xu_gSwsStXQpLQn47_bJj3odd6bmbcKvC4lrC3PYRR1UdagOv2mkdMz1x3Jg-t90mmqyzxGvSv6oE0Pk-TX9XD_Bgq3srV74_xNnPMdIcF2Q9ZlQRICPNtkUk9AGJlFACWxQe-RxUGM2XcW1OcL_tc3dQ:1wQt87:r-H1aSCbaHzWrAOAePeZNJiMTgjOXACH3J3-dOiooM4	2026-06-06 20:39:31.58256+00
99koyzaiyxuhx1txi6l3mtq5e7n5nhvc	.eJxVjDsOwjAQBe_iGln-bWxT0nMGa727kABKpDipEHcnkVJAOzPvvVXBdenL2mQuA6uz8tGr0y-tSE8Zd8UPHO-Tpmlc5qHqPdGHbfo6sbwuR_t30GPrt3UGx0KWna8GOhNd7SqDAfRuo4EMIaVIFrqcmSPnAD6bIEluFlIQ9fkCKXM4DQ:1wQt8p:3IXVOqqJfUV04a0Q3S9UA5Kufw3WpH0W7HYWBgT4kv0	2026-06-06 20:40:15.239482+00
9suz0c49i9dtb3a05wa7dlikahc6ta76	.eJxVjEEOwiAQRe_C2pDC0AIu3XsGMgODVA0kpV0Z765NutDtf-_9lwi4rSVsnZcwJ3EWIE6_G2F8cN1BumO9NRlbXZeZ5K7Ig3Z5bYmfl8P9OyjYy7e2AwETZM5RjY7UgNGD1Tp6k3zMSJNXVgM4TZNjNEReZz8qSAzOAIn3B_N_OAU:1tO0Sn:0Vg6HFF25uFXeiOAivuAMQw4OsRB_zO-9Hb1MaFnJyc	2025-01-01 20:16:09.693918+00
wxc3e0zhii2dzb63ppszcc11wq1xf9wf	.eJxVjDsOwyAQBe9CHSHAfFOm9xnQsgvBSYQlY1dR7h5bcpG0b2bem0XY1hq3npc4EbsyaxS7_K4J8JnbgegB7T5znNu6TIkfCj9p5-NM-XU73b-DCr3utVHeee2T1MIMUAJSKSKQUSVJcg5xyNoJLTJaSYDWQHFhN0Qy4BUp9vkCLGU4cQ:1w5pmM:8AMNvRwuXQeVho5AlZNI_rxrjy5RKnHODvLa-qcYYmo	2026-04-09 18:50:02.187235+00
5tgxn2e08fo4fhcjnw857qkjr5kwrxgk	.eJxVjEsOwiAUAO_C2hB-5ePSfc9A3uOBVA1NSrsy3t2QdKHbmcm8WYRjr_HoeYsLsSsL7PLLENIztyHoAe2-8rS2fVuQj4SftvN5pfy6ne3foEKvY2uFwiKUnaxOZARCBvCaSjAlSVe0dDYJ8pOVgCZA0koaUwqhEOCsZ58v6MA3-A:1uIptZ:FPFCY17U4luuvbjrDRlA05KENHafXN1qDVrRkg3BWLU	2025-06-07 14:30:41.681943+00
opemgnycl6hwxt5pe17g6ib1ziitdc7m	.eJxVjEEOwiAQRe_C2hBkCrQu3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFWn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX9rwC6JoWDYQiAgIYcDJXBkHBpDvUMrIbAzCfoYkeQMPpFPg3eQOlbvD_8wOK8:1wINWM:s-f-h-xWq-nb5MkJtdHAjOfOgKLynL1G9UgozTp9Ia0	2026-05-14 09:17:22.091979+00
l76xmgznl5iocxwn2qp9m4qn2guxta3a	.eJxVjEEOwiAQRe_C2hBkCrQu3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFWn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX9rwC6JoWDYQiAgIYcDJXBkHBpDvUMrIbAzCfoYkeQMPpFPg3eQOlbvD_8wOK8:1wVWqw:iuLHCsEix77gYnEfqzoAOAQN19r3wPpnfyZ8e5G4i04	2026-06-19 15:52:58.17428+00
4fiikmvkxo1zd1hb6vgo9kfb3fzcf8ud	.eJxVjEsOwjAMBe-SNYpcu0kMS_Y9Q5Q4Li2gVOpnhbg7VOoCtm9m3svEtK1D3Bad41jMxZB35vS75iQPrTsq91Rvk5WprvOY7a7Ygy62m4o-r4f7dzCkZfjW0gTyikTcEDYg0qsguiJSgCAISetd3zOwJnbnNiBLRuCMBOwhmPcHHZ03bw:1wQrMG:oNh-Q4fY7M6fvfJWNLVq3qUXk5Kc3hVdbInAPV-eO5E	2026-06-06 18:46:00.320589+00
0mqjh2nb252k6u0hri632a4xz5q0dz45	.eJxVjEEOwiAQRe_C2hCgAzIu3fcMhGFAqoYmpV0Z765NutDtf-_9lwhxW2vYel7CxOIitBan35FieuS2E77Hdptlmtu6TCR3RR60y3Hm_Lwe7t9Bjb1-awsGbFIlKoOYCgxFswFvyXswOmJyXp09EiZy2StLzJYGwMKZWDsU7w_tpDfo:1wVWtZ:Pe97bHWkvi7YBfEUonFX-EcqRHYlfERdTE5WYrTL3Dw	2026-06-19 15:55:41.556068+00
i8du13x49nry29fh53nq39wed642o3tz	.eJxVjEEOgjAQRe_StWlKO-2IS_eeoRlmBosaSCisjHcXEha6_e-9_zaZ1qXkteqcBzEXg_5sTr9rR_zUcUfyoPE-WZ7GZR46uyv2oNXeJtHX9XD_DgrVstUJmlYjCyAjsweHkVjFddo7hTYpEqIIBok9gFJC2TTvQgxBsWnM5wtJsDii:1wQt7T:IMKPBonWqYdUtg1xy6Yu1nsLhwV3RlJB7DbQo5uHqFg	2026-06-06 20:38:51.347848+00
wp55ajr7irh4wns6bf2oltcrcl65hgyq	.eJxVjDsOwjAQBe_iGllrO_5ASZ8zROvdNQ6gRIqTCnF3iJQC2jcz76UG3NY6bE2WYWR1UdYEdfpdM9JDph3xHafbrGme1mXMelf0QZvuZ5bn9XD_Diq2-q07ooIhJ1cIIIQk5JL3BMQQgcHkzrtz9BlFLBsslp2QIc_WoSkQ1fsDRBw42Q:1wQt8W:RkHJrANH5QhWiexbBunroA4jPzzfu5H6s8MUvl9NEcU	2026-06-06 20:39:56.357008+00
o4akss12skdnxk69qc2mzaimym9r5yvk	.eJxVjLsOAiEQAP-F2pDltaClvd9AWFjk1HDJPSrjvxuSK7SdmcxbxLRvLe4rL3Eq4iIMojj9Ukr5yX2o8kj9Pss8922ZSI5EHnaVt7nw63q0f4OW1jbGFUB7ZBWUrcYjGuQAtiY23hcg7QBcBuOJqAZDihUVnZNzGcPZevH5AgvKN6M:1wQt8c:NAmBN4POPeX-5D3NQF8tE54tdIA4MWViKVh4aGYPaas	2026-06-06 20:40:02.122982+00
tfg70180n6updvfw97evyto3rcp5xpbz	.eJxVjEEOwiAQRe_C2pC2A1Nw6d4zkBkYbNVAUtqV8e7apAvd_vfef6lA2zqFrckS5qTOahh6dfpdmeJDyo7Sncqt6ljLusysd0UftOlrTfK8HO7fwURt-tbedUhu7NlgBO68F6GRe4Ic2RtBY9EZGD3laAETgDMpW4aM4oeMRr0_JFs4Jw:1tQ6S8:kTO8kY0praiLyCUCLvF4oJWUJawgTxVRIPE_CHSMwO8	2025-01-07 15:04:08.73568+00
pt9qd3a0qv5hej3wmmp74sswr4fm8qtw	.eJxVjEEKwyAQAP_iuYisrok99t43iOtuatpiICan0L8XIYf2OjPMoWLatxL3JmucWV0VgFeXX0opv6R2xc9UH4vOS93WmXRP9Gmbvi8s79vZ_g1KaqWPPRC7ZBEBIfMkxBkhBPEoNpGYDI49ZmscD4GNA4EwjUDjgOAF1ecLOYQ4PQ:1w61nI:EgOOhvKjx9rlXqOQfzdkUMT8Q8ym_OuTbvu657liE_I	2026-04-10 07:39:48.600965+00
jom3u4a27h5x1st1gcvuxcayls6gdelg	.eJxVjEEOwiAQRe_C2hBkCrQu3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFWn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX9rwC6JoWDYQiAgIYcDJXBkHBpDvUMrIbAzCfoYkeQMPpFPg3eQOlbvD_8wOK8:1uIqKQ:nOmx2Pg8tEYYrm9sPChYz9jHk50vb9t8mKeEwpYxsl0	2025-06-07 14:58:26.223355+00
cm532ox252dlu99bq142wkm3fo3uj6z0	.eJxVjMsOwiAQRf-FtSEC5TEu3fsNZGCmUjWQlHZl_HfbpAvdnnPufYuI61Li2nmOE4mLMA7E6ZcmzE-uu6IH1nuTudVlnpLcE3nYLm-N-HU92r-Dgr1sa6UUqxQwZ8OjZ2DN2nl0YMkO5DO4UVnU9pxgMKSsd7gRRwHRgA9WfL48Xjgk:1wQt8W:DNcCEW33PLZSv6PtV63zl-YBiELqxVG3JPcvSoo3x_I	2026-06-06 20:39:56.95782+00
u20c7wil9fqzh9i33z8g7lj0uliuybrx	.eJxVjDsOwjAQBe_iGllkvY5tSvqcIbL3QwLIkfKpEHeHSCmgfTPzXqbP2zr02yJzP7K5mADOnH7XkukhdUd8z_U2WZrqOo_F7oo96GK7ieV5Pdy_gyEvw7dunQcXU4ttQwIauTjnNXgMcGalrCkCCghl7zChEjWeCwdRQJWo5v0BHaQ4tg:1wNwMM:jP6Tk1ns-5ZfJeL6oW0m2FgKs9uWXexmxjTCqQKLrak	2026-05-29 17:30:02.576001+00
h6bfb9qtxx4l2lfypdon9dryl0wvybru	.eJxVjEEOgjAQRe_StWlKO-2IS_eeoRlmBosaSCisjHcXEha6_e-9_zaZ1qXkteqcBzEXg_5sTr9rR_zUcUfyoPE-WZ7GZR46uyv2oNXeJtHX9XD_DgrVstUJmlYjCyAjsweHkVjFddo7hTYpEqIIBok9gFJC2TTvQgxBsWnM5wtJsDii:1wQMuf:kGAeYxIt-vroXzsAitKgSRYZj79aEICna_OHKsmyj-Y	2026-06-05 10:15:29.02698+00
27k5oz31ao7j3mrk19ootsfhntxi67is	.eJxVjDsOwjAQBe_iGln-rNcrSnrOYPmzxgHkSHFSIe4OkVJA-2bmvUSI29rCNngJUxFn4Q2I0--aYn5w31G5x36bZZ77ukxJ7oo86JDXufDzcrh_By2O9q2BHFfOhqLyDkGDI2VqwmoZY0loNRA5SCpbRGML-1wIXfKkwTtm8f4AHb43wQ:1wNwOR:a67SjMsfJNkjjkNIBbil5P26HQl1ldSRxqszb_667Sw	2026-05-29 17:32:11.15157+00
h7fo74lh97c9hxa4jh4c280tb7n6lvvq	.eJxVjLsOAiEQAP-F2pDltaClvd9AWFjk1HDJPSrjvxuSK7SdmcxbxLRvLe4rL3Eq4iIMojj9Ukr5yX2o8kj9Pss8922ZSI5EHnaVt7nw63q0f4OW1jbGFUB7ZBWUrcYjGuQAtiY23hcg7QBcBuOJqAZDihUVnZNzGcPZevH5AgvKN6M:1wNwVu:LpuPB7IwKpx5-bpl37z6SzmmvEmd_bk_86cDtBzce4E	2026-05-29 17:39:54.040631+00
s5048bfmrcc9w7bujsrch9gqgp9itq55	.eJxVjDsOwjAQBe_iGln-bWxT0nMGa727kABKpDipEHcnkVJAOzPvvVXBdenL2mQuA6uz8tGr0y-tSE8Zd8UPHO-Tpmlc5qHqPdGHbfo6sbwuR_t30GPrt3UGx0KWna8GOhNd7SqDAfRuo4EMIaVIFrqcmSPnAD6bIEluFlIQ9fkCKXM4DQ:1wOeyp:IBiwTiIeKDY8ypVgjchOku0SepNNW7_j6UiyjKN9cMk	2026-05-31 17:08:43.721639+00
jgty4g8gkfxr6yeils3lzx1et1791ga7	.eJxVjEEOwiAQRe_C2pDC0AIu3XsGMgODVA0kpV0Z765NutDtf-_9lwi4rSVsnZcwJ3EWIE6_G2F8cN1BumO9NRlbXZeZ5K7Ig3Z5bYmfl8P9OyjYy7e2AwETZM5RjY7UgNGD1Tp6k3zMSJNXVgM4TZNjNEReZz8qSAzOAIn3B_N_OAU:1tU4Gd:DtoUzdGZODtGqfj8C6pJ5rBYocKJs7TVXVfuwnZYP7E	2025-01-18 13:32:39.512947+00
henuygmt23kqdp9snxgiahw4x6dr0bat	.eJxVjEEOwiAQRe_C2hBkCrQu3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFWn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX9rwC6JoWDYQiAgIYcDJXBkHBpDvUMrIbAzCfoYkeQMPpFPg3eQOlbvD_8wOK8:1w7omp:7IJRQ2kgdQ8kkZbs5nYRwNlz0zaAVf9-Lt1ONqs7cG4	2026-04-15 06:10:43.442431+00
rfwtuobmdsvnfxlp09amlldfujo9muqy	.eJxVjEEOwiAQRe_C2hDpDAVduvcMZGAGqRpISrsy3l2bdKHb_977LxVoXUpYu8xhYnVWVh1-t0jpIXUDfKd6azq1usxT1Juid9r1tbE8L7v7d1Col29NAOxH9JwzJsvxRAKOI3hLGY8DepdRjM_khAENEjkTnR0FOA9gRb0__v04cQ:1uIqXG:04zi4z4zc1SzfMwQcMIA3Vabay-RwvWq_VxgcOSfZcE	2025-06-07 15:11:42.183585+00
efm2t7gmyb8z5kg6hx1tbaenli86yyq8	.eJxVjEEOwiAQRe_C2hBkCrQu3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFWn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX9rwC6JoWDYQiAgIYcDJXBkHBpDvUMrIbAzCfoYkeQMPpFPg3eQOlbvD_8wOK8:1wJnKu:OPZiMf8Twiu7HRJCniRQiyO6MahN2_1xAvG6h8QfOLs	2026-05-18 07:03:24.958683+00
ma7hhcgxhztikidn2bh224wx6s8say4g	.eJxVjEEOwiAQRe_C2hBkCrQu3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFWn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX9rwC6JoWDYQiAgIYcDJXBkHBpDvUMrIbAzCfoYkeQMPpFPg3eQOlbvD_8wOK8:1wNwXh:aB7Mo8YCuNjX7-a7BmsBPUVcPd9O6K62BHfy2UxZLb4	2026-05-29 17:41:45.133027+00
86hboyn3pr8ms4pobj0ny7f9r6gqkdj5	.eJxVjEsOAiEQBe_C2pBI03xcuvcMBOhGRg0k81lNvLuSzEK3r6reLkLc1hq2hecwkbgIpaw4_a4p5ie3gegR273L3Ns6T0kORR50kbdO_Loe7t9BjUv91rFYB5idB1c0gD4r7bRR4B2RZ4_JMBKRsWhBFcLClP3gULRDLOL9ARGyN7o:1tUtIY:sQPcSrN_Mh78E9pocIQ5TVfAVuA7mA8BJ5Ro0UrDF54	2025-01-20 20:02:02.023021+00
mtxmmz7pnmtgm2uzn6qxnlrsz2diyiaw	.eJxVjEEOwiAQRe_C2hBkCrQu3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFWn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX9rwC6JoWDYQiAgIYcDJXBkHBpDvUMrIbAzCfoYkeQMPpFPg3eQOlbvD_8wOK8:1w7pOJ:TAKLbfrHOrrlJ6l_0u3hoMw25b1eQ2QSdz7dd9MlXG0	2026-04-15 06:49:27.694088+00
2d17mdv2abb588msqvq2d72tp1mcg84g	.eJxVjEEOwiAQRe_C2hBkCrQu3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFWn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX9rwC6JoWDYQiAgIYcDJXBkHBpDvUMrIbAzCfoYkeQMPpFPg3eQOlbvD_8wOK8:1wKCBA:N1jnyywpNMFEnjKNOue_cInsEgZyWxzdIE9RMKm2p7g	2026-05-19 09:35:00.454573+00
ebrjx4oy2bo458osu4iaxw0wmg7g3p2j	.eJxVjEsOwiAUAO_C2hAoj59L9z0DefBAqoYmpV0Z7641Xeh2ZjJPFnBba9h6XsJE7MysMuz0SyOme267ohu268zT3NZlinxP-GE7H2fKj8vR_g0q9vodK-0xgx2E8laikUAxi-ichlKKt1kQGYpJAXyuhGbQkhARoDiZiL3eLG449w:1wQTbz:biM2Gf3ENkSLMS0KwuJ7T3Brz3KSpJ8EcOKZBxa44KI	2026-06-05 17:24:39.798375+00
jqoiaha0nk9ausyz9q3r8eolatb84dmz	.eJxVjDEOwjAMRe-SGUV1auPAyM4ZKidOSAE1UtNOiLtDpQ6w_vfef5lB1qUMa0vzMKo5G3ZkDr9rkPhI04b0LtOt2linZR6D3RS702avVdPzsrt_B0Va-dYpYg8sUbHvCE8OwQfnBYUoAWRhzgysXj1HCAEzkSfRY4YuR2Rn3h8jaDgO:1wNwis:8hC1z0y9vcB7kzmhfhCnRPC7QNeXulYHkLHx-KIRooI	2026-05-29 17:53:18.568391+00
aam9drnsv1qedxvfqq84c61upb3k5sv8	.eJxVjEsOwiAUAO_C2hAoj59L9z0DefBAqoYmpV0Z7641Xeh2ZjJPFnBba9h6XsJE7MysMuz0SyOme267ohu268zT3NZlinxP-GE7H2fKj8vR_g0q9vodK-0xgx2E8laikUAxi-ichlKKt1kQGYpJAXyuhGbQkhARoDiZiL3eLG449w:1wQt8r:E4klKLZ3ftPxjfXDxb-Eg1GfTKJS4t7dwp_EYpRCrCw	2026-06-06 20:40:17.403542+00
elourvhi4hlpixmo9h73uazsrv803lxu	.eJxVjDsOwjAQRO_iGlm2iX-U9JzBWu-ucQA5Uj4V4u44Ugpoppj3Zt4iwbbWtC08p5HERZx9EKffNgM-ue2IHtDuk8SprfOY5a7Igy7yNhG_rof7d1BhqX1dvAnOWW_KECkixgADqGJJRR1K7gGguEsFGC2h0SoiUGAi1sFF8fkCOHs48A:1wQt94:wkHl-agLiyJuVRnMoyuTcz_JI7xmcRPm7m8aWNueEQs	2026-06-06 20:40:30.436567+00
dxv1rjpxaw04nu5g8b5psdganypon90s	.eJxVjEEOwiAQRe_C2hAowoBL9z0DGYZBqoYmpV0Z765NutDtf-_9l4i4rTVunZc4ZXERgzj9bgnpwW0H-Y7tNkua27pMSe6KPGiX45z5eT3cv4OKvX7rhDloygm5KAVnIAiqgFVe22CDJ0gWtTdKOSC0DpxmTqaw8UAmhEG8P-jfN4Y:1tY8T1:Lj9uE5_tVfTQ34eerveoKA1CuM13XIgwFuEudAmdJwk	2025-01-29 18:50:15.642825+00
zkpkzpbp60v0ydphud90uhm1c5tqt4md	.eJxVjEEOwiAQRe_C2hBkCrQu3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFWn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX9rwC6JoWDYQiAgIYcDJXBkHBpDvUMrIbAzCfoYkeQMPpFPg3eQOlbvD_8wOK8:1w8COC:bToJgbDzW3KGKd8AJ8YXQ_RnZoZre_cGBjKy17ybvU4	2026-04-16 07:22:52.661381+00
7mq4b5oeqn3hz81s2j1n0k9afu6nazb7	.eJxVjDsOwjAQBe_iGll2HH-Wkp4zWJtdLwmgWIqTCnF3iJQC2jcz76UybuuYt1aWPLE6q-iiOv2uA9KjzDviO863qqnO6zINelf0QZu-Vi7Py-H-HYzYxm_dO_IEia0kLIHtEJ1jQwzoA_UdCadkhAGiBYAgIILWiO8dOOs7VO8PRIs4Yg:1wQTpi:jH9E45cw4aUTL__OpvN3dC_uJAhvL_ZNOpww8sUiyf8	2026-06-05 17:38:50.603408+00
q98imkqizqe0koc12zw8cfousx0noma3	.eJxVjMsOwiAQRf-FtSE8OkBduvcbyDADUjU0Ke3K-O_apAvd3nPOfYmI21rj1vMSJxZn4Y0Tp981IT1y2xHfsd1mSXNblynJXZEH7fI6c35eDvfvoGKv35o8ObB2tMUigB5ccoF8VrkwF2uSAjAaPehS2CscirHEgY1xYQRgEO8PLAE4Fg:1wNxE4:oFiGbfj-x9FfaznTvrSDnLmiHQH7_wlxckzzOwfIt04	2026-05-29 18:25:32.951293+00
tm3ktomww7ohd2ybz9bg0cgywvhqm3w6	.eJxVjMsOwiAQRf-FtSEDw9Ole7-BwABSNTQp7cr479qkC93ec859sRC3tYVtlCVMmZ0ZOmCn3zVFepS-o3yP_TZzmvu6TInvCj_o4Nc5l-flcP8OWhztWwtPBozwoEHn6jNZ58EAkTRGOpRCa41oE6qaraEqvHXFKQRRndeK2PsD8gM2pg:1wQpXv:G1Bp2-qIOjd-VWUQpfBjHPhAOF9B1erI_86bjdk3-qg	2026-06-06 16:49:55.837217+00
1rfuwkj8cn4mj69cramhg034j1m28jz2	.eJxVjEEOwiAQRe_C2hBkCrQu3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFWn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX9rwC6JoWDYQiAgIYcDJXBkHBpDvUMrIbAzCfoYkeQMPpFPg3eQOlbvD_8wOK8:1w8Lga:cXQUSgLxEEl374shDD1uzB48QDPggJXMWIJQBBH08cA	2026-04-16 17:18:28.190922+00
o7hmskqgr6g2o7aoltwoulm76krugzhf	.eJxVjEEOwiAQRe_C2hAECoNL956BDMMgVUOT0q6Md7dNutDte-__t4i4LjWunec4ZnER3oA4_dKE9OS2q_zAdp8kTW2ZxyT3RB62y9uU-XU92r-Dir1ua8CinNZQsDAZrRyBQ-sKMCu14SEki8ZlQKuyIRM8OY1BD95YW9RZfL43vDfk:1wQVty:eOu4arpFgVXcL7idZzP1cWI4EDEbILWQuYL-UH0wons	2026-06-05 19:51:22.175196+00
3kjbmlreq02256kub3r136a6fqhi2p4x	.eJxVjMsOwiAUBf-FtSE82gIu3fsN5D5AqgaS0q6M_65NutDtmZnzEhG2tcStpyXOLM7CGC9OvysCPVLdEd-h3pqkVtdlRrkr8qBdXhun5-Vw_w4K9PKtE07WKWKXMpMeUWXQSECckBQah9M4BGeYAXTwGCyGbB1aqzBbP2Tx_gBz5Tmu:1tb24v:89OjE-mgQZYrZRpR7l55t0j3KmrZPw5pTjWx17g3zO4	2025-02-06 18:37:21.877237+00
0at7kfdgk3i1o5k956os7jhdfti6b8xw	.eJxVjDsOwjAQBe_iGln2Zv2jpOcM1vqHA8iW4qRC3B0ipYD2zcx7MU_bWv028uLnxM4MQLLT7xooPnLbUbpTu3Uee1uXOfBd4Qcd_NpTfl4O9--g0qjfWpNBgpIBDUqjhJZFRD0VQlAhBJuMcyHb4qy2GsFElQQYcjhZzJQce38AF3o3wQ:1wAAEH:6tJOvpky6ITpYLAac7R-NFStjJJE5WPoP6U21LyqNv4	2026-04-21 17:28:45.102958+00
ynjofj24olaj3sviqjs5kn64zpakanww	.eJxVjMsOwiAURP-FtSE8L-jSvd9A7gUqVQNJaVfGf5cmXehqkjNn5s0CbmsJW89LmBO7MMdOv4wwPnPdi_TAem88trouM_Fd4Ufb-a2l_Loe7t9BwV7GWhBO5A14T2C8UkqiHcRpDxosSKeFtyKrCOZMIw0SOEkpgVBTVIJ9vsXJNwY:1wLhor:hESzUZ7LdZ2FTwyqkKPHNfWSXMMKeA227O6_s8gcNIk	2026-05-23 13:34:13.827347+00
27r5mradx1l6lns6p2gvxosdnyeq9ldd	.eJxVjDsOwjAQBe_iGln2Zv2jpOcM1vqHA8iW4qRC3B0ipYD2zcx7MU_bWv028uLnxM4MQLLT7xooPnLbUbpTu3Uee1uXOfBd4Qcd_NpTfl4O9--g0qjfWpNBgpIBDUqjhJZFRD0VQlAhBJuMcyHb4qy2GsFElQQYcjhZzJQce38AF3o3wQ:1wNy1V:thAyJgqY6UyNimvtWNEhH3OLBMOMuBagPIk8kGWa34c	2026-05-29 19:16:37.778446+00
ae0knqo9l2cjbgtc298z1tfrq8ukvo2q	.eJxVjMsOwiAUBf-FtSGU1wWX7vsNhMtDqgaS0q6M_y5NutDtzJzzJs7vW3F7T6tbIrkSkIpcfin68Ez1UPHh673R0Oq2LkiPhJ6207nF9Lqd7d9B8b2MNRNJYgaVrDXWcilVZii5yArYBFqhYYyPADID0FMcEK1OwYjAMRpFPl8FZTc3:1wQt96:flkf46UvOAYrXjVOo7psqIkt096D0V0J4naGk5kGd9Y	2026-06-06 20:40:32.297774+00
6yftlgh5s8wuv7c8xxq4ezbprdbbropk	.eJxVjEEOwiAQRe_C2hBGwQGX7nsGMgyDVA1NSrsy3l2bdKHb_977LxVpXWpcu8xxzOqi0Hp1-F0T8UPahvKd2m3SPLVlHpPeFL3Trocpy_O6u38HlXr91swgmMupnNkbwWQkJOchSELwSM6AOWIQBjIenUBhEkMOc2JriYN6fwBNGjkA:1wQt9I:HqQC4b1yiAVGGa2IgUicaMACBUTpsl9Kap_uhsoPFsk	2026-06-06 20:40:44.918272+00
3w13t3qcbizb14px5dpl14uot5ldsyiw	.eJxVjMsOwiAUBf-FtSEIlIdL9_0GcrmA1JqSFFgZ_12adKHbmXPmTRz0ll2vcXdLIDeihSGXX-oB17gdKjxhexSKZWv74ukxoaetdC4hvu7n9i-QoebxNpCY4twkSBEFZwqNAqmSiZGxgSfrJQgVDEgWBAqrUXGwfNJCysSuI1obtF5Hq6zk8wVl3zxQ:1wQt9J:3L0kap4ZMYpPugbcxDWCggwq0IRp3DKu05beMRFzfKQ	2026-06-06 20:40:45.475435+00
2znw7wzycgovgw2wy4q2q39m3zrtwrb4	.eJxVjMsOgjAQRf-la9N0KDjg0j3f0MyrghpIKKyM_64kLHR7zzn35RJt65C2Yksa1V0c1uhOvyuTPGzakd5pus1e5mldRva74g9afD-rPa-H-3cwUBm-dYsQhCMYCwMCVLlqOLZqooBn1tgJMmNQpsbqLmfLHHIFUrNhEHLvD05jOac:1wQpr4:aeGvVKuLJ42yVRUjCUv8CThX5oWw_lGzu-kpX_nkduo	2026-06-06 17:09:42.516153+00
o51zklifxy9g742ipb1e5myu7422qqp3	.eJxVjEEOwiAQRe_C2pC2A1Nw6d4zkBkYbNVAUtqV8e7apAvd_vfef6lA2zqFrckS5qTOahh6dfpdmeJDyo7Sncqt6ljLusysd0UftOlrTfK8HO7fwURt-tbedUhu7NlgBO68F6GRe4Ic2RtBY9EZGD3laAETgDMpW4aM4oeMRr0_JFs4Jw:1tbf3I:6RLPwJefayPihtpU4pe243dxB1ssk338fYGP3-ne4wU	2025-02-08 12:14:16.217324+00
lp73244fh2ccgz68yrlqx1v3tisarf0n	.eJxVjEEOwiAQRe_C2hBkCrQu3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFWn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX9rwC6JoWDYQiAgIYcDJXBkHBpDvUMrIbAzCfoYkeQMPpFPg3eQOlbvD_8wOK8:1wARAe:qJkq_7B3FVcJ-Pp9CT6f8bbaLiftIPDyWgw90Inr0x0	2026-04-22 11:34:08.952752+00
ng4jkxfbbal8x91wurwgec3u1xmdjsvz	.eJxVjDsOgzAQRO_iOrLAsPY6ZXrOYO36E5NEtoShinL3gESRlDPvzbyFo23NbmtxcXMQVzEMnbj8tkz-GcuBwoPKvUpfy7rMLA9FnrTJqYb4up3u30Gmlvd1QlQDkB6NisgEjOgJORjwQGyj0WC16ZJlg8l7C0SMvepHoGT2KD5fNP04jg:1uLmTH:K02oZn1dBwToOFfAT3AzrGX3-lit8IjKA5n-fStj8y4	2025-06-15 17:27:43.961065+00
m6fry36sus4kd2q4islkn9e5aptzuru6	.eJxVjEEOwiAQRe_C2hCGlpnWpXvP0AAzSNVAUtqV8e7apAvd_vfef6nJb2uetibLNLM6K-qNOv2uwceHlB3x3Zdb1bGWdZmD3hV90KavleV5Ody_g-xb_tZ99GgQEcBQDN5adAaQUoq2E-aUuCPjogCMo2VM4gA6HJwQy0A0qvcHH-Y35w:1wQt9V:pKnZIYz1DpBRhD3qJrzhFLFMSVcA2ubsgcj7N_lH1Lc	2026-06-06 20:40:57.241273+00
mnsd2dall0kbkmh1gegtqrrjx94flp02	.eJxVjDsOwjAQBe_iGln2Zv2jpOcM1vqHA8iW4qRC3B0ipYD2zcx7MU_bWv028uLnxM4MQLLT7xooPnLbUbpTu3Uee1uXOfBd4Qcd_NpTfl4O9--g0qjfWpNBgpIBDUqjhJZFRD0VQlAhBJuMcyHb4qy2GsFElQQYcjhZzJQce38AF3o3wQ:1wNy1c:2gEC3lN-Y2pOuY_iFmE-bkA9Hu8ls-RvsIw4cEJ7baQ	2026-05-29 19:16:44.271573+00
vcqi5ubc3o44gx91p5ilutzcrrbt0ntm	.eJxVjMsOwiAQRf-FtSEDw9Ole7-BwABSNTQp7cr479qkC93ec859sRC3tYVtlCVMmZ0ZOmCn3zVFepS-o3yP_TZzmvu6TInvCj_o4Nc5l-flcP8OWhztWwtPBozwoEHn6jNZ58EAkTRGOpRCa41oE6qaraEqvHXFKQRRndeK2PsD8gM2pg:1wQpsG:uY_bCdJZon9j6h0zN1APcH4onu29RfebIVwZYZIP5tI	2026-06-06 17:10:56.836319+00
9b41w7cb72pafqambuo2b3eyd6yytt3d	.eJxVjMsOwiAQRf-FtSE8OgVcuvcbyDAMUjU0Ke3K-O_apAvd3nPOfYmI21rj1nmJUxZn4cTpd0tID247yHdst1nS3NZlSnJX5EG7vM6Zn5fD_Tuo2Ou3Lsr6bKxBCJathQBIwas0Dno0iTQl47QquqigPZniuAC7QuiMBhhAvD_KAzdC:1tbktw:gaRhaxj9G0ddRM69NYfbqRBuIpPEy4goanr0k1qomR0	2025-02-08 18:29:00.458158+00
vo56ffudezoxybz8rnmbsg9i0ufikznu	.eJxVjMsOwiAURP-FtSGgcAsu3fcbyH2AVE2blHZl_HfbpAvdTeacmbdKuC41rS3PaRB1VUGdfjtCfuZxB_LA8T5pnsZlHkjvij5o0_0k-XU73L-Diq1ua0BbiNFFsBYvXkgIvYTsgEyMVFxGD-wMewcF4Nwh-sidbDkgm6w-XwoCOMk:1wAXGB:-mIY0XoOk4VrL_np7D2wJC7NLsr5wIvKxAy3A2LQ600	2026-04-22 18:04:15.836449+00
9tycagyinb5rz05ukuih89m6qz89ctvb	.eJxVjEEOwiAQRe_C2hBkCrQu3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFWn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX9rwC6JoWDYQiAgIYcDJXBkHBpDvUMrIbAzCfoYkeQMPpFPg3eQOlbvD_8wOK8:1uLmim:1DhLyv_9AvXfaWMQ1o0nh65PfM4rHwVaFeLYKzHZdpI	2025-06-15 17:43:44.215751+00
0f1xif9dn3rznxtq12p2bkalmcbynw5c	.eJxVjEEOwiAQRe_C2hBkCrQu3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFWn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX9rwC6JoWDYQiAgIYcDJXBkHBpDvUMrIbAzCfoYkeQMPpFPg3eQOlbvD_8wOK8:1wMlzZ:eC5wDnZWzyX_gnskrXM2mx5NL6dnSnuVylzuMPW6pow	2026-05-26 12:13:41.460504+00
guuunperkzk751y1fpr0x5o9wz811npc	.eJxVjEEOwiAQRe_C2hBkCrQu3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFWn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX9rwC6JoWDYQiAgIYcDJXBkHBpDvUMrIbAzCfoYkeQMPpFPg3eQOlbvD_8wOK8:1wQiun:l6EL1SvxqkRRAbcfydJpsURuo60NxTxnkHu4bUiMF78	2026-06-06 09:45:05.783804+00
mtakv3r8djcv47ueyl7ir9dm7ixhn246	.eJxVjMsOwiAQRf-FtSG8p7h07zeQgQGpGkhKuzL-uzbpQrf3nHNfLOC21rCNvISZ2JmB9uz0u0ZMj9x2RHdst85Tb-syR74r_KCDXzvl5-Vw_w4qjvqtCxVDJCLq7AoUDwZh0sqA91kgJRltsZiUdE5ICb7kqORkrdLGKSBi7w9P9DhM:1wQt8a:53f5s7Zi6f_J8sNd_QK_tOFqFKDAqdJnH2Nkg2UkH4o	2026-06-06 20:40:00.146437+00
3d72xqi9vrimrn020ms5stpd73a5fdc6	.eJxVjEEOwiAQRe_C2hAqMDAu3XsGMnRGqRpISrsy3l2bdKHb_977L5VoXUpau8xpYnVSwaE6_K6ZxofUDfGd6q3psdVlnrLeFL3Tri-N5Xne3b-DQr1862hzjmSJzTAcwVydN9l4CRQlOEBEAxA9I5BFRgdWIBBaD9YFcUDq_QERzzcR:1wQt9e:9iEOiKGgqXRWyWIDO2Fzr_umB_lLfLr41jghUK-tPEY	2026-06-06 20:41:06.198696+00
krf30pgbblnwh9pnhd0qws5qxo5gm4eh	.eJxVjEEOwiAQRe_C2hAowoBL9z0DGYZBqoYmpV0Z765NutDtf-_9l4i4rTVunZc4ZXERgzj9bgnpwW0H-Y7tNkua27pMSe6KPGiX45z5eT3cv4OKvX7rhDloygm5KAVnIAiqgFVe22CDJ0gWtTdKOSC0DpxmTqaw8UAmhEG8P-jfN4Y:1tdybT:APbJwLX7X9VVWJjTcfmuk92FEUe3BwYZROsMQS8k8aI	2025-02-14 21:31:07.396972+00
ygmcgb2678dij8gr3mmyd4rc68h6bfj5	.eJxVjMsOwiAQRf-FtSHACHRcuu83EB6DVA0kpV0Z_11JutDtPefcF3N-34rbO61uSezCACQ7_a7BxwfVgdLd11vjsdVtXQIfCj9o53NL9Lwe7t9B8b2MWijxtWU-Z-MnHSeTNNpsJcmQMmIi8hYtBqlAG4zKoBEEEC0YsFqz9wc-Djf3:1uM5GW:gAaI1evcDjlKArgUZvfCymu2soBjm2mDuWJCqa_myo4	2025-06-16 13:31:48.724438+00
tnt8vvjx7628nunqxo1l0m4bt235tngs	.eJxVjDsOwjAQBe_iGlnxh7WhpOcM1q53jQPIkeKkQtwdIqWA9s3Me6mE61LT2mVOI6uzchDU4XclzA9pG-I7ttuk89SWeSS9KXqnXV8nludld_8OKvb6rYONEExgIA_OonUikSFY4HA65izgHZXiYOABjM0cI5Ehj75gyeJBvT8dATh5:1wQt8H:Uy9OIPQA97WAL4cx8TgngBwTQBrxfWJi1kOX7_GCvHs	2026-06-06 20:39:41.717217+00
zxczyjoqapvpo1m89wl8brcc6jofog2z	.eJxVjDsOwjAQBe_iGllkvY5tSvqcIbL3QwLIkfKpEHeHSCmgfTPzXqbP2zr02yJzP7K5mADOnH7XkukhdUd8z_U2WZrqOo_F7oo96GK7ieV5Pdy_gyEvw7dunQcXU4ttQwIauTjnNXgMcGalrCkCCghl7zChEjWeCwdRQJWo5v0BHaQ4tg:1wQt8Z:6gPvsyXcBUgsPRlCbh2DeH7Gl0csmlHDK_mvxVrNEb4	2026-06-06 20:39:59.982536+00
akc8z28zocny8nglm58pdeqp8ztapno9	.eJxVjMsOgjAQRf-la9N0KDjg0j3f0MyrghpIKKyM_64kLHR7zzn35RJt65C2Yksa1V0c1uhOvyuTPGzakd5pus1e5mldRva74g9afD-rPa-H-3cwUBm-dYsQhCMYCwMCVLlqOLZqooBn1tgJMmNQpsbqLmfLHHIFUrNhEHLvD05jOac:1wQt9O:LjbQc07jizrXGvi_YF7jggg8PhyqRaBCrmQRhU3sIPo	2026-06-06 20:40:50.540053+00
dmknfwjnn385hrlg3w5o50jihwvdlmzj	.eJxVjLsOwjAMAP8lM4oSm7gNIzvfUDm1QwoolfqYEP-OInWA9e50bzPwvpVhX3UZJjEXgxDN6ZcmHp9am5IH1_tsx7luy5RsS-xhV3ubRV_Xo_0bFF5LG8egFDvMysCQnYPgQcVx1-OZhELugXnMgoieUCiqemBKyaccxJnPFyYdOF4:1wQt9P:8LEL0S-eZ_pMb3NGExW7wCeaY3WWTtu_MbS2K7Bwtv0	2026-06-06 20:40:51.400966+00
9bxaw7u8v5yscws5b9dllqm986w4zcr8	.eJxVjEEOwiAQRe_C2hAowoBL9z0DGYZBqoYmpV0Z765NutDtf-_9l4i4rTVunZc4ZXERgzj9bgnpwW0H-Y7tNkua27pMSe6KPGiX45z5eT3cv4OKvX7rhDloygm5KAVnIAiqgFVe22CDJ0gWtTdKOSC0DpxmTqaw8UAmhEG8P-jfN4Y:1tgQnI:QYzejmTCFjpAYZwSdUZTi0-N2h8gW9LkGm8y-HYyCM8	2025-02-21 16:01:28.493852+00
v1l7gi5733ob8vryxsw9podm6alnlk03	.eJxVjEEOwiAQRe_C2hCcQmFcuu8ZyDADUjVtUtqV8e7apAvd_vfef6lI21rj1vISR1EX1XWgTr9rIn7kaUdyp-k2a56ndRmT3hV90KaHWfLzerh_B5Va_dacrRNPyTnfnz1bQiohMPbWgC0WEJzFEhwjIzoOEETQlA6MQMoU1PsDJEQ3_w:1uM5O2:Ab7PVvbPRXAtzQNlUfesQ_-10nFn3LqMCfImD605GPI	2025-06-16 13:39:34.304843+00
crydxpbw86700xd7nd1qbfph8hhen8u4	.eJxVjEEOgjAQRe_StWlKO-2IS_eeoRlmBosaSCisjHcXEha6_e-9_zaZ1qXkteqcBzEXg_5sTr9rR_zUcUfyoPE-WZ7GZR46uyv2oNXeJtHX9XD_DgrVstUJmlYjCyAjsweHkVjFddo7hTYpEqIIBok9gFJC2TTvQgxBsWnM5wtJsDii:1wNz0q:UeSGQ-s1m2tXeIl1u7CZtZUp0zpzeYMnbjollcdWIck	2026-05-29 20:20:00.480185+00
oupesfj830np1lnphpdxnvejv5hkzwn1	.eJxVjDsOwjAQBe_iGlmW7fWHkp4zWOvdBQdQLOVTRdwdIqWA9s3M21TBdWllnWUqA6uzimDU6XetSE8Zd8QPHO9dUx-Xaah6V_RBZ33tLK_L4f4dNJzbtyYXjASfjUekYGwATNFFkJTdDbimSoaEq2UgSmDZsdSUyXLw0QVQ7w8uYDh3:1wQtA3:uZ7bDiViih-AnltwBY83JARqt25l0Zy4vrnPPTdUNgc	2026-06-06 20:41:31.680919+00
gbe18k5rd4hvd8zz3v950i84w0t656qu	.eJxVjEEOwiAQRe_C2pC2A1Nw6d4zkBkYbNVAUtqV8e7apAvd_vfef6lA2zqFrckS5qTOahh6dfpdmeJDyo7Sncqt6ljLusysd0UftOlrTfK8HO7fwURt-tbedUhu7NlgBO68F6GRe4Ic2RtBY9EZGD3laAETgDMpW4aM4oeMRr0_JFs4Jw:1tgnvn:r66SqZLlRdYFNvYPWVOrFgRxVF77cAo0P1A2_utSWg4	2025-02-22 16:43:47.058308+00
0abtjrdm5azrlgupxe2yd7ztq5bl04mu	.eJxVjEEOwiAQAP_C2RBYaCkevfcNZGEXqRpISnsy_t006UGvM5N5i4D7VsLeeQ0Liasw4vLLIqYn10PQA-u9ydTqti5RHok8bZdzI37dzvZvULCXY8sARN64yDwC6KxyNsNgTZo04JC8tpY8O28ILY3MoHKCyDip6FLO4vMF5_04kw:1uM5Ud:iz2LXf-RmJiI8czvf0m5mcQ031Jx9jRvQQDmF81xhrY	2025-06-16 13:46:23.597658+00
f0hoyi6kcw945xsg5y0mjq8q6seh55pq	.eJxVjMsOwiAQRf-FtSG8YVy67zcQBkapGkhKuzL-uzbpQrf3nHNfLKZtrXEbtMS5sDPz2rDT74opP6jtqNxTu3Wee1uXGfmu8IMOPvVCz8vh_h3UNOq3DqAgGyBbTHBXkFpIRHQghSATLHrlCIzJWngpnKKUldIehaRC0mpi7w8HATdJ:1wQt7y:eSPSF5-vuDy9s0vyKp1fxIa5d7WHWaalsbw_r3JdcpQ	2026-06-06 20:39:22.601539+00
81psxrq416ywin5efth7smx1mggrh4u2	.eJxVjEEOwiAQRe_C2hBkCrQu3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFWn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX9rwC6JoWDYQiAgIYcDJXBkHBpDvUMrIbAzCfoYkeQMPpFPg3eQOlbvD_8wOK8:1wOAq9:ka38aB_KFuFG-S2zjLkNOqnNVgKzBtb6Q9QVMrJ2bhw	2026-05-30 08:57:45.050252+00
ewbb9uycst2anlbvy61djd5m816g8xqy	.eJxVjEEOwiAQRe_C2pC2A1Nw6d4zkBkYbNVAUtqV8e7apAvd_vfef6lA2zqFrckS5qTOahh6dfpdmeJDyo7Sncqt6ljLusysd0UftOlrTfK8HO7fwURt-tbedUhu7NlgBO68F6GRe4Ic2RtBY9EZGD3laAETgDMpW4aM4oeMRr0_JFs4Jw:1tluGd:_XnpT1E0JnMJNjlGENQr5O39cc_GPFqkB-3-fnIzboY	2025-03-08 18:30:23.675047+00
8a6rmimpiuc54n3rwimduf8789h7u4cu	.eJxVjEEOwiAQRe_C2hCcQmFcuu8ZyDADUjVtUtqV8e7apAvd_vfef6lI21rj1vISR1EX1XWgTr9rIn7kaUdyp-k2a56ndRmT3hV90KaHWfLzerh_B5Va_dacrRNPyTnfnz1bQiohMPbWgC0WEJzFEhwjIzoOEETQlA6MQMoU1PsDJEQ3_w:1wMmw7:X2lcuH9gAADmPP1eY6-6RXsvjqo2U18ateOwV3hAlGY	2026-05-26 13:14:11.984799+00
7dcylqqm8bndo4dy0zis2ctf1gbcbjad	.eJxVjEEOwiAQRe_C2pDCMBRcuvcMhGFAqoYmpV0Z765NutDtf-_9lwhxW2vYel7CxOIstLLi9LtSTI_cdsT32G6zTHNbl4nkrsiDdnmdOT8vh_t3UGOv3xpBW0BUrMroExuHKpLzkAwxFzDJsWdrx2FgAxltImtc0dE7w4oQxPsDGvo36g:1uM5X2:KXrQ6WC2-PCkA3ysiyIOdWkMTtQCFb5yEoIhrabgcpU	2025-06-16 13:48:52.400951+00
dooymc86my2y0v8ov53b7rkg4hut4r0d	.eJxVjDEOwjAMRe-SGUVOXJLAyM4ZIqe2SQG1UtNOiLtDpQ6w_vfef5lM61Lz2mTOA5uzwXgyh9-1UP-QcUN8p_E22X4al3kodlPsTpu9TizPy-7-HVRq9Vt7VVYEFxIEleIjiKBiSBJKiuIdRkYPkDgysAtQoFdU6LojkSKZ9wc2TThf:1wQlUx:ByR2-PymiZI8mCvXhgoH8E2br9tJbwi8sM816Isi2Vk	2026-06-06 12:30:35.839327+00
x9j56q3sa0x4en4gs4hx44u712xxqbo9	.eJxVjEsOwjAMBe-SNYpcu0kMS_Y9Q5Q4Li2gVOpnhbg7VOoCtm9m3svEtK1D3Bad41jMxZB35vS75iQPrTsq91Rvk5WprvOY7a7Ygy62m4o-r4f7dzCkZfjW0gTyikTcEDYg0qsguiJSgCAISetd3zOwJnbnNiBLRuCMBOwhmPcHHZ03bw:1wQqL5:OZ-bCzqL9Cl0ZahqvTGeGfCpVTO0SFce7_HCUFsrqDM	2026-06-06 17:40:43.911517+00
a8t1hm7buwciwhbhkky1stpmujx72ivu	.eJxVjDEOwjAMRe-SGUWQ2KnDyM4ZKjtxSAG1UtNOiLtDpQ6w_vfef5me16X2a9O5H7I5m0DBHH5X4fTQcUP5zuNtsmkal3kQuyl2p81ep6zPy-7-HVRu9Vsj5QKx-E4yoZLzQQFRErIgQCRxJSBq4kyhAz5GV9R7Yt-BnsCxeX8ANt04Lg:1wMp1w:hWZma3DQggWbNn2rKYjI1o3x8U97yN4eNPkAlkAA6zg	2026-05-26 15:28:20.023457+00
1zwggkac0lqjf0h4hbgw0iwhpacupc3d	.eJxVjMsOwiAQRf-FtSHQKY9x6d5vIEOZStVAUtqV8d-VpAvdnnPufYlA-5bD3ngNSxJnMWgUp18aaXpw6SrdqdyqnGrZ1iXKnsjDNnmtiZ-Xo_07yNTydw2z92rQzAgmObKgUbEi5gjgE6FFNGSNARxHoA60d6TZ2RmcZxbvDxrLN8w:1wOE29:BZOHgGyrM946-27F-KXdJBSwSxYjvEIyLd-Bf7HsT9s	2026-05-30 12:22:21.1642+00
l3x6dt7x7ufd6ttzgsx5pgsov3pxnd23	.eJxVjDsOwjAQBe_iGlm2s_5R0nMGa9cfHEC2FCcV4u4QKQW0b2beiwXc1hq2kZcwJ3Zm0yTZ6XcljI_cdpTu2G6dx97WZSa-K_ygg197ys_L4f4dVBz1W3vrQCptMihrCIvRxaEVHiRGzEkDEEXvnSi26GS8AC2tJEVZJoIpsvcHGO04Eg:1wOE5Y:XL9dM5OLH9ibZXcQUrnQoWp1Hfh2a0vygLCByO7EwqI	2026-05-30 12:25:52.942724+00
z60r5sixmqq3umkr3gsif8u4szqgamrg	.eJxVjEEOwiAQRe_C2hAowoBL9z0DGYZBqoYmpV0Z765NutDtf-_9l4i4rTVunZc4ZXERgzj9bgnpwW0H-Y7tNkua27pMSe6KPGiX45z5eT3cv4OKvX7rhDloygm5KAVnIAiqgFVe22CDJ0gWtTdKOSC0DpxmTqaw8UAmhEG8P-jfN4Y:1tmCn6:1MJSJV2yt_Tmkauv9Yh8ht6qWsndHVyF2lVBX_3IQBE	2025-03-09 14:17:08.931774+00
e2tqdxav18yela7l6k2ae1rmfnlcr9c6	.eJxVjEEOwiAQRe_C2hCZQiku3XsGMsxMbdVAUtqV8e6WpAvd_bz38t8q4rZOcauyxJnVRYHx6vRLE9JTclP8wHwvmkpelznplujDVn0rLK_r0f4dTFindmwlAAw9EcIwUNt2ZwhnQRc4GDeyUEAae-9TxyC2M2CcBWd3y-rzBSGMN-A:1uM5rk:KzJ8zCZpsG5Yu7MFilV8KfPAIPKgXQr9mY-QOmec3JU	2025-06-16 14:10:16.366738+00
lxfqh1eywxnz38idm4q7n16iy8phbkm3	.eJxVjEEOwiAQRe_C2hBkCrQu3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFWn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX9rwC6JoWDYQiAgIYcDJXBkHBpDvUMrIbAzCfoYkeQMPpFPg3eQOlbvD_8wOK8:1wMnhk:IkZkeclQLpFVOQw-aCdfIkGIH6K1xRn1zrbEiBvLAXM	2026-05-26 14:03:24.511164+00
j2e2dhuw1day3nlwhx65x8lxjegjbbn8	.eJxVjMsOwiAQRf-FtSE8KgMu3fcbyHQYpGogKe3K-O_apAvd3nPOfYmI21ri1nmJcxIXATqI0-86IT247ijdsd6apFbXZZ7krsiDdjm2xM_r4f4dFOzlW5vgdfCIjgmTRs0OEihPgzcqWxcgOAw45ME5OOtMwKCYFGSLlE224v0BK7I4WQ:1wOJO8:tBAO8eNRHi5MNvztowm_czCHaMWnC5JualFmTRnc2XE	2026-05-30 18:05:24.23163+00
d1e2tp7f4irjc55a8dcvwuvx7hqgixr5	.eJxVjEEOwiAQRe_C2hBkCrQu3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFWn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX9rwC6JoWDYQiAgIYcDJXBkHBpDvUMrIbAzCfoYkeQMPpFPg3eQOlbvD_8wOK8:1wQlVw:04p9hbmwEB1K0HjDayY1DH3JudkGSTitJe_Syn52wUA	2026-06-06 12:31:36.981946+00
kkvh2s4fug8uiabulpgn324bfc68t32d	.eJxVjEEOwiAQRe_C2hCmQAsu3XsGMjCDVA0kpV0Z765NutDtf-_9lwi4rSVsnZcwkzgLJ06_W8T04LoDumO9NZlaXZc5yl2RB-3y2oifl8P9OyjYy7cGqxwhDGyBnfVEk_dkM1DGBKN24AZlfNbZ6Jj85BMyRlajsUwEMYv3B-PEOHM:1tmyIQ:pDmYQr0DrF7My-Me7AgC8Q5Va81QjFQG9CbqrRjNXKw	2025-03-11 17:00:38.03064+00
e3nfi2lw8ubwic4xbxq2ddqv8f69wbbb	.eJxVjMsOwiAQRf-FtSE8OgVcuvcbyDAMUjU0Ke3K-O_apAvd3nPOfYmI21rj1nmJUxZn4cTpd0tID247yHdst1nS3NZlSnJX5EG7vM6Zn5fD_Tuo2Ou3Lsr6bKxBCJathQBIwas0Dno0iTQl47QquqigPZniuAC7QuiMBhhAvD_KAzdC:1top4P:4h1xQHXXVw2os-5uHTfeAVaVtuWFtKipZ4IVzvE1PxY	2025-03-16 19:33:49.553983+00
glztgw213krlft67sp5fqqt9u0dxki3e	.eJxVjDEOwjAMRe-SGUVxnKTAyM4ZKttxSAG1UtNOiLtDpQ6w_vfef5me1qX2a9O5H7I5G5_AHH5XJnnouKF8p_E2WZnGZR7YbordabPXKevzsrt_B5Va_dbFOwdB6MgsMXXcJfSOscTAnpkyYMnAEIM_SQYIJYiiFNQUlRDVvD82nTjR:1tqDBs:OVfeUe1TC36d-uqtxzfe_WU48RIQUB1DRoHzP4IyMYc	2025-03-20 15:31:16.30582+00
am510695v4j52o2nt9nncbmy0iffd24g	.eJxVjEEOwiAQRe_C2pC2A1Nw6d4zkBkYbNVAUtqV8e7apAvd_vfef6lA2zqFrckS5qTOahh6dfpdmeJDyo7Sncqt6ljLusysd0UftOlrTfK8HO7fwURt-tbedUhu7NlgBO68F6GRe4Ic2RtBY9EZGD3laAETgDMpW4aM4oeMRr0_JFs4Jw:1trESZ:BM-0SWgTQ9f6NAv9A8MKBn67Zv7bdThPWNAtEp-qC_s	2025-03-23 11:04:43.600574+00
asj50u2exyf2h681vj3g6bslnyk9anxt	.eJxVjMsOwiAQRf-FtSEDw9Ole7-BwABSNTQp7cr479qkC93ec859sRC3tYVtlCVMmZ0ZOmCn3zVFepS-o3yP_TZzmvu6TInvCj_o4Nc5l-flcP8OWhztWwtPBozwoEHn6jNZ58EAkTRGOpRCa41oE6qaraEqvHXFKQRRndeK2PsD8gM2pg:1wQlZr:CQwJZtYukjT7mGWRD5ksHVblZ86RmtJZQU7YWIeIYUU	2026-06-06 12:35:39.216215+00
17ccbei5mrvycxfrz4qzy9jjzwlfko9p	.eJxVjEEOwiAQRe_C2hAowoBL9z0DGYZBqoYmpV0Z765NutDtf-_9l4i4rTVunZc4ZXERgzj9bgnpwW0H-Y7tNkua27pMSe6KPGiX45z5eT3cv4OKvX7rhDloygm5KAVnIAiqgFVe22CDJ0gWtTdKOSC0DpxmTqaw8UAmhEG8P-jfN4Y:1tuEjK:RKf05w1GdQu842B8A96-kEdTc7nE05xyZxj-y50k9e0	2025-03-31 17:58:26.600577+00
rnw7mit4kwthywuevl5h7mox4y3kpehg	.eJxVjEEOwiAQRe_C2pCBoRVcuu8ZyAxMbdVAUtqV8e7apAvd_vfef6lI2zrFrckS56wuylh1-h2Z0kPKTvKdyq3qVMu6zKx3RR-06aFmeV4P9-9gojZ9awhsbNd740JvPXZjRgZGwd6PyITOgZhR6BzAhdQheRHPOQuAMzaAen8A4no3aw:1tx7ZV:k7UaE06M3hi4jZOErgO76P9csYpNKShYzJazeldZplE	2025-04-08 16:56:13.650186+00
isl3358ybvf64fy6fwujgo1u74kw4ptz	.eJxVjDsOwyAQRO9CHaEF802Z3mdACyzBSYQlY1dR7h5bcpGUM-_NvFnAba1h67SEKbMrs9Kzy28bMT2pHSg_sN1nnua2LlPkh8JP2vk4Z3rdTvfvoGKv-5pKLmQkOlGkTuAolewBQIMdskZApZV3ZJMAioNxypo9SVuUlUlExz5fRIQ4HA:1wQt8R:XM3CM84WyqnBZvCqc6Xd5DgsVj2N55ZBNXmj1IRWGmg	2026-06-06 20:39:51.638086+00
o74rh0hq376fuzkbudrwpd9bd4fqp1kw	.eJxVjEEOwiAQRe_C2pC2A1Nw6d4zkBkYbNVAUtqV8e7apAvd_vfef6lA2zqFrckS5qTOahh6dfpdmeJDyo7Sncqt6ljLusysd0UftOlrTfK8HO7fwURt-tbedUhu7NlgBO68F6GRe4Ic2RtBY9EZGD3laAETgDMpW4aM4oeMRr0_JFs4Jw:1u0KAo:-BIwQNCiDg005vtOhjK9ZM7yT46BQG5iKCFH8dMSwvI	2025-04-17 12:59:58.760156+00
9cl8g9jn7poc716i2ylockuqrgqglbe6	.eJxVjEEOwiAQRe_C2pCBoRVcuu8ZyAxMbdVAUtqV8e7apAvd_vfef6lI2zrFrckS56wuylh1-h2Z0kPKTvKdyq3qVMu6zKx3RR-06aFmeV4P9-9gojZ9awhsbNd740JvPXZjRgZGwd6PyITOgZhR6BzAhdQheRHPOQuAMzaAen8A4no3aw:1u0ksq:5pKIOHlUi8AaggNt-cvBz7uE2vWAVD3UVwHkDaVPa-k	2025-04-18 17:31:12.679179+00
fu465o22c29zbfmuqxouxtco04n7innj	.eJxVjDsOwyAQRO9CHSGw-aZM7zOgXViCkwgkY1dR7h5bcpFUI817M28WYFtL2DotYU7sygav2OW3RYhPqgdKD6j3xmOr6zIjPxR-0s6nluh1O92_gwK97Gt0wiUjkFQWbg-traFoo48ZR4mDBaulImUIpE9ZjOglanBKJxVBA_t8AT_zOMg:1u2ax9:9Ej_RKrvChR2v6JMV5xUmbl-hLuDiB0NivE1fgFxLQA	2025-04-23 19:19:15.634572+00
orhpwjkko0a8jkx804ytkoekk2k83rn1	.eJxVjMsOwiAQRf-FtSE8OgVcuvcbyDAMUjU0Ke3K-O_apAvd3nPOfYmI21rj1nmJUxZn4cTpd0tID247yHdst1nS3NZlSnJX5EG7vM6Zn5fD_Tuo2Ou3Lsr6bKxBCJathQBIwas0Dno0iTQl47QquqigPZniuAC7QuiMBhhAvD_KAzdC:1u4R8h:wTO3M3ptRPkHx4mo-f1u0xs1Yz1AZ1k6WsWKU-D8iY8	2025-04-28 21:14:47.304461+00
zuaohtcls78ft0kq6vnejjdmt4kzbb64	.eJxVjEEOwiAQRe_C2pDC0AIu3XsGMgODVA0kpV0Z765NutDtf-_9lwi4rSVsnZcwJ3EWIE6_G2F8cN1BumO9NRlbXZeZ5K7Ig3Z5bYmfl8P9OyjYy7e2AwETZM5RjY7UgNGD1Tp6k3zMSJNXVgM4TZNjNEReZz8qSAzOAIn3B_N_OAU:1u4oHG:pia97F38DqpWwDnunqEjxwKKv0r3b_e2pNO-bg-UP-4	2025-04-29 21:57:10.803638+00
3v5iczvf5b4ovok0r83ofwq5c9fvk3pv	.eJxVjEEOwiAQRe_C2pC2A1Nw6d4zkBkYbNVAUtqV8e7apAvd_vfef6lA2zqFrckS5qTOahh6dfpdmeJDyo7Sncqt6ljLusysd0UftOlrTfK8HO7fwURt-tbedUhu7NlgBO68F6GRe4Ic2RtBY9EZGD3laAETgDMpW4aM4oeMRr0_JFs4Jw:1u6EwO:J64b9fkvCcJZxn8HIZAPTL-54kXAxK-tKEJ_fEhg_yc	2025-05-03 20:37:32.412951+00
xktuiva6pif9aew0pmhmubo659yb2rzm	.eJxVjEEOwiAQRe_C2hAowoBL9z0DGYZBqoYmpV0Z765NutDtf-_9l4i4rTVunZc4ZXERgzj9bgnpwW0H-Y7tNkua27pMSe6KPGiX45z5eT3cv4OKvX7rhDloygm5KAVnIAiqgFVe22CDJ0gWtTdKOSC0DpxmTqaw8UAmhEG8P-jfN4Y:1u99ZW:rRa05y-hSOL0iK-xbeiU_yAiPKxCw2lao9HNowRA8UU	2025-05-11 21:29:58.263431+00
l6sckl5mww7zsw2ttk8twqcotie58x8n	.eJxVjDsOwjAQRO_iGln-fyjpOYPl9S44gBwpTirE3XGkFFDOvDfzZilva01bpyVNyM5MK89Ovy3k8qS2I3zkdp95mdu6TMB3hR-08-uM9Loc7t9Bzb2OtUcbgnEy60glaB-9EQUQYxAazCCEEpX2eWRrg4u3aGR0SABSGCXY5wsOSzc1:1u9np8:SLb9Swy8dC-ACUra5lKiKTSu6msA94ItWEP3t0TXGI0	2025-05-13 16:28:46.133725+00
0ko6ui9tmxmq0xij718g747xvcj7qpdo	.eJxVjMsOwiAQRf-FtSE8OgVcuvcbyDAMUjU0Ke3K-O_apAvd3nPOfYmI21rj1nmJUxZn4cTpd0tID247yHdst1nS3NZlSnJX5EG7vM6Zn5fD_Tuo2Ou3Lsr6bKxBCJathQBIwas0Dno0iTQl47QquqigPZniuAC7QuiMBhhAvD_KAzdC:1uA4L5:ol55fB9SVBLRQfds7I9dZV75S9nu_VIq53b9ICC-oJE	2025-05-14 10:06:51.485905+00
crnt9znweu831cuupe4jr9hi043fvy6l	.eJxVjEEOwiAQRe_C2hAYYKAu3fcMBIbRVg0kpV0Z765NutDtf-_9l4hpW6e4dV7iXMRZGAji9LvmRA-uOyr3VG9NUqvrMme5K_KgXY6t8PNyuH8HU-rTt3bkmDRam92AFLwCBKWZwViG4rQFj05rQgc-ZCa8DggGvYWissJBvD8A3ja_:1uA6cz:PwAs25ici1nnW4-Hn_oPjD0S6WVXXA-IU2GsYLM4DcA	2025-05-14 12:33:29.795446+00
p4mlq12fegvtytutohsg757t2lm2kjnk	.eJxVjEEOwiAQRe_C2pC2A1Nw6d4zkBkYbNVAUtqV8e7apAvd_vfef6lA2zqFrckS5qTOahh6dfpdmeJDyo7Sncqt6ljLusysd0UftOlrTfK8HO7fwURt-tbedUhu7NlgBO68F6GRe4Ic2RtBY9EZGD3laAETgDMpW4aM4oeMRr0_JFs4Jw:1uBqsL:0nT2Rlk2cxx45FTkPlLS1yfiNqDSJ53m3pgSMrWXvDI	2025-05-19 08:08:33.069227+00
zve23808367djumy9d6jlrqd1wqy46kw	.eJxVjDkOwjAUBe_iGllegm0o6TmD9f0XHECOFCcV4u4QKQW0b2beS2VYl5rXznMeSZ1VUoffrQA-uG2A7tBuk8apLfNY9KbonXZ9nYifl939O6jQ67dmoMF7SykWcBiMFB4knoJ3FsNR0HNkQhZgRIjGeuGQ2JHxIGJI1PsDGDA5sA:1uED0S:f6hHF-HELEdMbbGGmmT4x2Wl_Vwkzs08u3xtU_jrNoA	2025-05-25 20:10:40.573471+00
ul6s0xpvrz3z69tph6y2nb479f4z16ay	.eJxVjEEOwiAQRe_C2hAowoBL9z0DGYZBqoYmpV0Z765NutDtf-_9l4i4rTVunZc4ZXERgzj9bgnpwW0H-Y7tNkua27pMSe6KPGiX45z5eT3cv4OKvX7rhDloygm5KAVnIAiqgFVe22CDJ0gWtTdKOSC0DpxmTqaw8UAmhEG8P-jfN4Y:1uEpHt:rJui-VWWVfyygG-4Qv0eicZPyt3EQBrOl8wezjV1Kt8	2025-05-27 13:03:13.68037+00
qm38b1qvjzxqkfn5ath7zdlkoch0t13n	.eJxVjEEOwiAQRe_C2hAowoBL9z0DGYZBqoYmpV0Z765NutDtf-_9l4i4rTVunZc4ZXERgzj9bgnpwW0H-Y7tNkua27pMSe6KPGiX45z5eT3cv4OKvX7rhDloygm5KAVnIAiqgFVe22CDJ0gWtTdKOSC0DpxmTqaw8UAmhEG8P-jfN4Y:1uEqG3:sPf8MKEDlgSB8C---ak_YRXr3Xr4ms1RYIT5Iz7mpUM	2025-05-27 14:05:23.625262+00
wo9ibobwt8s0z5lukoqgy72dp1r9gp0m	.eJxVjDsOwjAQBe_iGln-4Q8lfc5grXdtHEC2FCcV4u4QKQW0b2bei0XY1hq3kZc4E7swpSQ7_a4J8JHbjugO7dY59rYuc-K7wg86-NQpP6-H-3dQYdRvjcW5TO6sC2XhIAQ0knwRCgVqE9Bma4RUQms0lpQx3nsLlDCRVjJZ9v4ANQ04Mw:1uFeaL:Ag30SUrhXrLE-o7iiy7UdMsPDE5vFDmwZLxWoUswaWY	2025-05-29 19:49:41.885445+00
js26qu60xcutnclyyz3i20js6i0rlgw9	.eJxVjEEOwiAQRe_C2hAowoBL9z0DGYZBqoYmpV0Z765NutDtf-_9l4i4rTVunZc4ZXERgzj9bgnpwW0H-Y7tNkua27pMSe6KPGiX45z5eT3cv4OKvX7rhDloygm5KAVnIAiqgFVe22CDJ0gWtTdKOSC0DpxmTqaw8UAmhEG8P-jfN4Y:1uGPzf:tZYFsl8iQFvbCV7LX1Y5pyuP4JMip-KKIft_JsQcBfU	2025-05-31 22:26:59.97866+00
t0aawvp171d9sgl8tjtr4eejty5h26fe	.eJxVjMEOwiAQRP-FsyHAghWP3vsNZFkWqRpISnsy_rtt0oPeJvPezFsEXJcS1s5zmJK4igGUOP22EenJdUfpgfXeJLW6zFOUuyIP2uXYEr9uh_t3ULCXbc3oorM6gzkT2y1oRO8VXaIjgmyMyegygAO0YBnBg_JmIJ8VWdZefL42Wzgs:1wOzuK:4AjVqsBGT947oqqYxUvRM5bV15TAdWl7DKHkG79fwZY	2026-06-01 15:29:28.874909+00
egzxxndi2579troqcb3k676xe2br9zmn	.eJxVjEEOwiAQRe_C2hCcQmFcuu8ZyDADUjVtUtqV8e7apAvd_vfef6lI21rj1vISR1EX1XWgTr9rIn7kaUdyp-k2a56ndRmT3hV90KaHWfLzerh_B5Va_dacrRNPyTnfnz1bQiohMPbWgC0WEJzFEhwjIzoOEETQlA6MQMoU1PsDJEQ3_w:1wQlkG:rSLayejvMchda6li3veCt_vkYpAmIN3PAqlIgUme6yY	2026-06-06 12:46:24.892111+00
jtczy4udpfsd1b4xr3ww7la60qedhx2i	.eJxVjEEOwiAQAP_C2RBYaCkevfcNZGEXqRpISnsy_t006UGvM5N5i4D7VsLeeQ0Liasw4vLLIqYn10PQA-u9ydTqti5RHok8bZdzI37dzvZvULCXY8sARN64yDwC6KxyNsNgTZo04JC8tpY8O28ILY3MoHKCyDip6FLO4vMF5_04kw:1umIPs:JaAp43UP_0nfB1wEW1y2mOLQw_9snNtuR5EPbyj2Xrc	2025-08-27 20:49:48.46682+00
771b0ru6fhzsjodx4ulm6u58ioo7hm4q	.eJxVjEEOwiAQAP_C2RBYaCkevfcNZGEXqRpISnsy_t006UGvM5N5i4D7VsLeeQ0Liasw4vLLIqYn10PQA-u9ydTqti5RHok8bZdzI37dzvZvULCXY8sARN64yDwC6KxyNsNgTZo04JC8tpY8O28ILY3MoHKCyDip6FLO4vMF5_04kw:1uLmCU:YyycR5bJSBJYWNzHeX2t9k_BOqKPRLpT2yRZq-1apjU	2025-06-15 17:10:22.045758+00
71e18go5s797n5b1fnxq7rsppflpunnw	.eJxVjEEOwiAQRe_C2hBkCrQu3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFWn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX9rwC6JoWDYQiAgIYcDJXBkHBpDvUMrIbAzCfoYkeQMPpFPg3eQOlbvD_8wOK8:1up1BA:3wrSwwsf0alCxmzunl3BFKGI_Dm0TYBInJ6SByqxTZU	2025-09-04 09:01:52.157531+00
8l1yd155838h9ggmkwg2bxvvhigxa8e3	.eJxVjMsOwiAURP-FtSGgcAsu3fcbyH2AVE2blHZl_HfbpAvdTeacmbdKuC41rS3PaRB1VUGdfjtCfuZxB_LA8T5pnsZlHkjvij5o0_0k-XU73L-Diq1ua0BbiNFFsBYvXkgIvYTsgEyMVFxGD-wMewcF4Nwh-sidbDkgm6w-XwoCOMk:1uQslp:EGfUofAjkiDxL_bqZnDI0ZVs0u9qZPFvpOOY3Zufz6w	2025-06-29 19:11:57.188415+00
raevxx5mivulflg23ayvuzjfe20250vl	.eJxVjEsOwjAMBe-SNYpcu0kMS_Y9Q5Q4Li2gVOpnhbg7VOoCtm9m3svEtK1D3Bad41jMxZB35vS75iQPrTsq91Rvk5WprvOY7a7Ygy62m4o-r4f7dzCkZfjW0gTyikTcEDYg0qsguiJSgCAISetd3zOwJnbnNiBLRuCMBOwhmPcHHZ03bw:1uQsmF:toYceQSGY2Xz8kHaTBHzCzT8fR1W_JswqoH9Uo7p3ok	2025-06-29 19:12:23.140526+00
q681evlcokcmyyas4qvcmkufia2i3sbe	.eJxVjDsOwjAQBe_iGln-4Q8lfc5grXdtHEC2FCcV4u4QKQW0b2bei0XY1hq3kZc4E7swpSQ7_a4J8JHbjugO7dY59rYuc-K7wg86-NQpP6-H-3dQYdRvjcW5TO6sC2XhIAQ0knwRCgVqE9Bma4RUQms0lpQx3nsLlDCRVjJZ9v4ANQ04Mw:1uQsmM:qdu1vRpR5wmUDLufHPv0xWOYoOdELX2i7ZKKu1GXDN8	2025-06-29 19:12:30.955048+00
ichykcnaxy34fyuozj2yi1hq2b7eb7rq	.eJxVjLsOAiEQAP-F2pDltaClvd9AWFjk1HDJPSrjvxuSK7SdmcxbxLRvLe4rL3Eq4iIMojj9Ukr5yX2o8kj9Pss8922ZSI5EHnaVt7nw63q0f4OW1jbGFUB7ZBWUrcYjGuQAtiY23hcg7QBcBuOJqAZDihUVnZNzGcPZevH5AgvKN6M:1uQsmO:IG6b1Mz6Zw40t6pxuftyTVYRsedPxZlp4Jk6NLh0Hv4	2025-06-29 19:12:32.017006+00
fmfnogzj2sdv9tdp6gx6ru5c19jjfdtj	.eJxVjEEOwiAQRe_C2hBkCrQu3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFWn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX9rwC6JoWDYQiAgIYcDJXBkHBpDvUMrIbAzCfoYkeQMPpFPg3eQOlbvD_8wOK8:1uRtkH:u9qdjnGnVVKfuD7EbqSLvmG_TxbF4PiEiMwo4a9jZkY	2025-07-02 14:26:33.132253+00
7psnso4vnx83s40ynof75s9j34n26j0p	.eJxVjEEOwiAQRe_C2hBkCrQu3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFWn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX9rwC6JoWDYQiAgIYcDJXBkHBpDvUMrIbAzCfoYkeQMPpFPg3eQOlbvD_8wOK8:1uSH7s:c2yRdbAi59wVfniumWpygztQsY9FCful0jYbTP0ayp4	2025-07-03 15:24:28.691753+00
rrkuy5ossjie6l8tqbvdpcclq0hnh9g3	.eJxVjEEOwiAQRe_C2hBkCrQu3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFWn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX9rwC6JoWDYQiAgIYcDJXBkHBpDvUMrIbAzCfoYkeQMPpFPg3eQOlbvD_8wOK8:1uSbxZ:EiLyrSxvq-TdeRwihjOUnnK0PV_9YiTA6R5UXXaTFVc	2025-07-04 13:39:13.961008+00
tqvt6m7z6nqqc4kcyfwz5m9r0pt4geue	.eJxVjEEOwiAQRe_C2hBkCrQu3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFWn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX9rwC6JoWDYQiAgIYcDJXBkHBpDvUMrIbAzCfoYkeQMPpFPg3eQOlbvD_8wOK8:1uU86r:PmytwEp90CHD4Krdzymiugs9FCxAbFfpK_hqWEY9Sps	2025-07-08 18:11:05.509306+00
p0t0xqo7ah4w8wnh970j3kl6hjgiulyz	.eJxVjDsOwjAQBe_iGln-4Q8lfc5grXdtHEC2FCcV4u4QKQW0b2bei0XY1hq3kZc4E7swpSQ7_a4J8JHbjugO7dY59rYuc-K7wg86-NQpP6-H-3dQYdRvjcW5TO6sC2XhIAQ0knwRCgVqE9Bma4RUQms0lpQx3nsLlDCRVjJZ9v4ANQ04Mw:1uU8CS:JAaqRboID_xkdEg0krdKcXMJcCj4mBH3vW8D0CMgvxg	2025-07-08 18:16:52.521311+00
3kjmy9mwejwpkedry1u3n0jun6ns8pap	.eJxVjDsOwjAQBe_iGlnZ9Z-SnjNY6x8OIFuKkwpxd4iUAto3M-_FPG1r9dvIi58TOzMEzU6_a6D4yG1H6U7t1nnsbV3mwHeFH3Twa0_5eTncv4NKo37rqJUURU8GUzYBIpWJDMZAGpMCFM4BOrDB5eKskgoJQNqglaAUpRLs_QEjOzek:1uUBpo:EX-jtTVtGuCOSyWwwb4EKRnvDHYDejPHzsP4TN9DFeg	2025-07-08 22:09:44.32548+00
vv31xff0dps0m5aaqj97ttopdykx4qwn	.eJxVjEEOwiAQRe_C2hBkCrQu3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFWn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX9rwC6JoWDYQiAgIYcDJXBkHBpDvUMrIbAzCfoYkeQMPpFPg3eQOlbvD_8wOK8:1uUMbI:kS2T7lJFAmYq35XyJpUFH_UD7Aj8cU2hHMWXVilCyAg	2025-07-09 09:39:28.316112+00
pi09j9n78yn6kkp8d94c0sn2u9qcw534	.eJxVjMEOwiAQRP-FsyGAFIpH734DWZZdqRpISnsy_rtt0oPeJvPezFtEWJcS105znLK4iLMbxem3TYBPqjvKD6j3JrHVZZ6S3BV50C5vLdPrerh_BwV62dbeWJ2SYYXBekOJ0GgekYNDndmRcoNHZ7aMatABDHC2QJitZW0Vi88XR7Q5Iw:1uV8P8:elqCIcxZ_zFA8vnNz0HO_FgmDXnSnC9Pjv5ZnhlTc0g	2025-07-11 12:42:06.781854+00
lbeknrw957voh01xouu4z3ap8mpkbrs0	.eJxVjEEOwiAQRe_C2hBkCrQu3fcMzQwzSNVAUtqV8e7apAvd_vfef6kJtzVPW5NlmlldlFWn340wPqTsgO9YblXHWtZlJr0r-qBNj5XleT3cv4OMLX9rwC6JoWDYQiAgIYcDJXBkHBpDvUMrIbAzCfoYkeQMPpFPg3eQOlbvD_8wOK8:1uVWQP:_C2UxlxP77wRA5zo8_qGj2uC4NAf0aNpNA0z2ils3DU	2025-07-12 14:21:01.929893+00
bif01lv11d1vdwgnazkij29qke0xn9pn	.eJxVjMsOwiAQRf-FtSEC5TEu3fsNZGCmUjWQlHZl_HfbpAvdnnPufYuI61Li2nmOE4mLMA7E6ZcmzE-uu6IH1nuTudVlnpLcE3nYLm-N-HU92r-Dgr1sa6UUqxQwZ8OjZ2DN2nl0YMkO5DO4UVnU9pxgMKSsd7gRRwHRgA9WfL48Xjgk:1uVWY7:Fcn-w6hIWNO7I64mGhxJh9I-c1E5CxM6uXAwCjuYM5g	2025-07-12 14:28:59.334003+00
4arv1knnwxx4esxafpkix9yn7fmv4tef	.eJxVjEEOwiAQRe_C2pChlAIu3XsGMsOAVA1NSrsy3l1JutDtf-_9lwi4byXsLa1hZnEW2oI4_a6E8ZFqR3zHeltkXOq2ziS7Ig_a5HXh9Lwc7t9BwVa-tfeGnRv86C1l9qCISE95hKzJYYqowXplqHvIoICHyTg2lhywslq8Pyf2N-o:1uVWYx:NAA_zda0s7OUST8OM0pi5POSCO1apRIv2kxlJaoO3No	2025-07-12 14:29:51.434719+00
qshf6qwou09zfkdig6g0saldn5z7visx	.eJxVjDkOwjAUBe_iGlnxblPS5wyW_wIOIEeKkwpxd4iUAto3M-8lctnWmrfOS55InIUJSpx-Vyj44LYjupd2myXObV0mkLsiD9rlOBM_L4f7d1BLr99aYSLtrimSLpCCSgm1Th5hCAaIAgNEBM-GLAwaybJ3iM5GdMqaQOL9AUMiONU:1uVWZJ:T2DfSqrXF8M09RNl_rSiu1XJ6celo-rv6HWDTwxSKxU	2025-07-12 14:30:13.349354+00
4190t6t458weus2dnbfn95i3sib4fxw1	.eJxVjEsOwjAMBe-SNYpiO5CEJXvOUNmpQwsokfpZIe4OlbqA7ZuZ9zIdr8vQrbNO3dibs6GA5vC7CueH1g31d663ZnOryzSK3RS709leW6_Py-7-HQw8D986FkavHFggYHYACTwoayTni8uY6FgUThRyBhYUKkJBU4qI6nwk8_4ALkg39w:1uVWaC:n6RdqhT6J2vQUqMFd_1QDTaidDYGTGZMOobap8WY0GU	2025-07-12 14:31:08.416985+00
l4abc9yhqw5eafccury8yb9ahtz8uhx4	.eJxVjMsOwiAQRf-FtSHDYwRcuu83EB6DVA0kpV0Z_12bdKHbe865L-bDtla_DVr8nNmFGXb63WJID2o7yPfQbp2n3tZljnxX-EEHn3qm5_Vw_w5qGPVbKyChCCJKimiVzWgTCI2yuOyETkiFQCtDWKINqKM07gzZWh2E1ADs_QHSYzcR:1uVWb9:_bxgY8tqVZTOEHuN-rrEe7G-Hyr3i3dm3YSac0CodQk	2025-07-12 14:32:07.256123+00
wxvcsgt9g6r0s1efnk5p7luy3y3mln8i	.eJxVjDsOgzAQRO_iOrLAsPY6ZXrOYO36E5NEtoShinL3gESRlDPvzbyFo23NbmtxcXMQVzEMnbj8tkz-GcuBwoPKvUpfy7rMLA9FnrTJqYb4up3u30Gmlvd1QlQDkB6NisgEjOgJORjwQGyj0WC16ZJlg8l7C0SMvepHoGT2KD5fNP04jg:1uVWpg:sS5-ErO7tiqktSzNr7vAsq7jQWKw05AF4nKdcSOBYh8	2025-07-12 14:47:08.294563+00
7pyor3lm2q6jv5azlfsnjfzd1vlk9xin	.eJxVjDsOwjAQBe_iGln-bWxT0nMGa727kABKpDipEHcnkVJAOzPvvVXBdenL2mQuA6uz8tGr0y-tSE8Zd8UPHO-Tpmlc5qHqPdGHbfo6sbwuR_t30GPrt3UGx0KWna8GOhNd7SqDAfRuo4EMIaVIFrqcmSPnAD6bIEluFlIQ9fkCKXM4DQ:1uVWxC:aXnFxH05tIdwSFwMhNszQyRxeCm_70oSn3izbu4faJo	2025-07-12 14:54:54.964614+00
6gn962fqaep7017efhl0jn4sliczr93o	.eJxVjDEOwyAQBP9CHSEw2EDK9H4DuuOO4CTCkrGrKH-PLblImi12ZvctImxriVvjJU4krsI4Ky6_LUJ6cj0QPaDeZ5nmui4TykORJ21ynIlft9P9OyjQyr4GY7TuEZHIo_UWSTkCb7oEIQSDaVB7BuDsTO60IgUDeNczpqzZs_h8AUeAOSU:1uVX6v:DZNMt647MeWg_kvGk2bRpxehrC7mSRHhTWTeGT6uYBk	2025-07-12 15:04:57.209077+00
bg7mx6y1c184yb71hqz1ujukarod4t93	.eJxVjEsOwjAMBe-SNYpiJc6HJXvOENm1SwuolZp2hbg7VOoCtm9m3stU2tahbk2XOoo5G5-SOf2uTN1Dpx3JnabbbLt5WpeR7a7YgzZ7nUWfl8P9OxioDd86cfaAHDSScxGiqIcOuc85xIyeggChQE6M1BdlJ4JeSwaA4EpfzPsDI8835A:1uVY1V:TANy5gDbaUk2FT4tp9f92yQVLWQruV295RzpGvc-kPU	2025-07-12 16:03:25.306175+00
\.


--
-- Name: Backend_choice_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jormungandr
--

SELECT pg_catalog.setval('public."Backend_choice_id_seq"', 138, true);


--
-- Name: Backend_cms_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jormungandr
--

SELECT pg_catalog.setval('public."Backend_cms_id_seq"', 99, true);


--
-- Name: Backend_election_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jormungandr
--

SELECT pg_catalog.setval('public."Backend_election_id_seq"', 102, true);


--
-- Name: Backend_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jormungandr
--

SELECT pg_catalog.setval('public."Backend_event_id_seq"', 764, true);


--
-- Name: Backend_eventgenre_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jormungandr
--

SELECT pg_catalog.setval('public."Backend_eventgenre_id_seq"', 67, true);


--
-- Name: Backend_footerpage_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jormungandr
--

SELECT pg_catalog.setval('public."Backend_footerpage_id_seq"', 33, true);


--
-- Name: Backend_graphnode_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jormungandr
--

SELECT pg_catalog.setval('public."Backend_graphnode_id_seq"', 1, false);


--
-- Name: Backend_navsubitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jormungandr
--

SELECT pg_catalog.setval('public."Backend_navsubitem_id_seq"', 39, true);


--
-- Name: Backend_navtopitem_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jormungandr
--

SELECT pg_catalog.setval('public."Backend_navtopitem_id_seq"', 66, true);


--
-- Name: Backend_photoalbum_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jormungandr
--

SELECT pg_catalog.setval('public."Backend_photoalbum_id_seq"', 257, true);


--
-- Name: Backend_picture_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jormungandr
--

SELECT pg_catalog.setval('public."Backend_picture_id_seq"', 1170, true);


--
-- Name: Backend_praesidiumfunction_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jormungandr
--

SELECT pg_catalog.setval('public."Backend_praesidiumfunction_id_seq"', 80, true);


--
-- Name: Backend_praesidiumfunctionyearmember_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jormungandr
--

SELECT pg_catalog.setval('public."Backend_praesidiumfunctionyearmember_id_seq"', 357, true);


--
-- Name: Backend_praesidiummember_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jormungandr
--

SELECT pg_catalog.setval('public."Backend_praesidiummember_id_seq"', 223, true);


--
-- Name: Backend_praesidiumyear_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jormungandr
--

SELECT pg_catalog.setval('public."Backend_praesidiumyear_id_seq"', 140, true);


--
-- Name: Backend_profile_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jormungandr
--

SELECT pg_catalog.setval('public."Backend_profile_id_seq"', 757, true);


--
-- Name: Backend_round_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jormungandr
--

SELECT pg_catalog.setval('public."Backend_round_id_seq"', 112, true);


--
-- Name: Backend_sponsor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jormungandr
--

SELECT pg_catalog.setval('public."Backend_sponsor_id_seq"', 178, true);


--
-- Name: Backend_uservotes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jormungandr
--

SELECT pg_catalog.setval('public."Backend_uservotes_id_seq"', 682, true);


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jormungandr
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 36, true);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jormungandr
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 111, true);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jormungandr
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 132, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jormungandr
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 209, true);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jormungandr
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 757, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jormungandr
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 147, true);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jormungandr
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 3466, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jormungandr
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 33, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: jormungandr
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 87, true);


--
-- Name: Backend_choice Backend_choice_pkey; Type: CONSTRAINT; Schema: public; Owner: jormungandr
--

ALTER TABLE ONLY public."Backend_choice"
    ADD CONSTRAINT "Backend_choice_pkey" PRIMARY KEY (id);


--
-- Name: Backend_cms Backend_cms_pkey; Type: CONSTRAINT; Schema: public; Owner: jormungandr
--

ALTER TABLE ONLY public."Backend_cms"
    ADD CONSTRAINT "Backend_cms_pkey" PRIMARY KEY (id);


--
-- Name: Backend_election Backend_election_pkey; Type: CONSTRAINT; Schema: public; Owner: jormungandr
--

ALTER TABLE ONLY public."Backend_election"
    ADD CONSTRAINT "Backend_election_pkey" PRIMARY KEY (id);


--
-- Name: Backend_event Backend_event_pkey; Type: CONSTRAINT; Schema: public; Owner: jormungandr
--

ALTER TABLE ONLY public."Backend_event"
    ADD CONSTRAINT "Backend_event_pkey" PRIMARY KEY (id);


--
-- Name: Backend_eventgenre Backend_eventgenre_name_key; Type: CONSTRAINT; Schema: public; Owner: jormungandr
--

ALTER TABLE ONLY public."Backend_eventgenre"
    ADD CONSTRAINT "Backend_eventgenre_name_key" UNIQUE (name);


--
-- Name: Backend_eventgenre Backend_eventgenre_pkey; Type: CONSTRAINT; Schema: public; Owner: jormungandr
--

ALTER TABLE ONLY public."Backend_eventgenre"
    ADD CONSTRAINT "Backend_eventgenre_pkey" PRIMARY KEY (id);


--
-- Name: Backend_footerpage Backend_footerpage_pkey; Type: CONSTRAINT; Schema: public; Owner: jormungandr
--

ALTER TABLE ONLY public."Backend_footerpage"
    ADD CONSTRAINT "Backend_footerpage_pkey" PRIMARY KEY (id);


--
-- Name: Backend_graphnode Backend_graphnode_pkey; Type: CONSTRAINT; Schema: public; Owner: jormungandr
--

ALTER TABLE ONLY public."Backend_graphnode"
    ADD CONSTRAINT "Backend_graphnode_pkey" PRIMARY KEY (id);


--
-- Name: Backend_navsubitem Backend_navsubitem_pkey; Type: CONSTRAINT; Schema: public; Owner: jormungandr
--

ALTER TABLE ONLY public."Backend_navsubitem"
    ADD CONSTRAINT "Backend_navsubitem_pkey" PRIMARY KEY (id);


--
-- Name: Backend_navtopitem Backend_navtopitem_pkey; Type: CONSTRAINT; Schema: public; Owner: jormungandr
--

ALTER TABLE ONLY public."Backend_navtopitem"
    ADD CONSTRAINT "Backend_navtopitem_pkey" PRIMARY KEY (id);


--
-- Name: Backend_photoalbum Backend_photoalbum_pkey; Type: CONSTRAINT; Schema: public; Owner: jormungandr
--

ALTER TABLE ONLY public."Backend_photoalbum"
    ADD CONSTRAINT "Backend_photoalbum_pkey" PRIMARY KEY (id);


--
-- Name: Backend_picture Backend_picture_link_key; Type: CONSTRAINT; Schema: public; Owner: jormungandr
--

ALTER TABLE ONLY public."Backend_picture"
    ADD CONSTRAINT "Backend_picture_link_key" UNIQUE (link);


--
-- Name: Backend_picture Backend_picture_pkey; Type: CONSTRAINT; Schema: public; Owner: jormungandr
--

ALTER TABLE ONLY public."Backend_picture"
    ADD CONSTRAINT "Backend_picture_pkey" PRIMARY KEY (id);


--
-- Name: Backend_praesidiumfunction Backend_praesidiumfunction_pkey; Type: CONSTRAINT; Schema: public; Owner: jormungandr
--

ALTER TABLE ONLY public."Backend_praesidiumfunction"
    ADD CONSTRAINT "Backend_praesidiumfunction_pkey" PRIMARY KEY (id);


--
-- Name: Backend_praesidiumfunctionyearmember Backend_praesidiumfunctionyearmember_pkey; Type: CONSTRAINT; Schema: public; Owner: jormungandr
--

ALTER TABLE ONLY public."Backend_praesidiumfunctionyearmember"
    ADD CONSTRAINT "Backend_praesidiumfunctionyearmember_pkey" PRIMARY KEY (id);


--
-- Name: Backend_praesidiummember Backend_praesidiummember_pkey; Type: CONSTRAINT; Schema: public; Owner: jormungandr
--

ALTER TABLE ONLY public."Backend_praesidiummember"
    ADD CONSTRAINT "Backend_praesidiummember_pkey" PRIMARY KEY (id);


--
-- Name: Backend_praesidiumyear Backend_praesidiumyear_pkey; Type: CONSTRAINT; Schema: public; Owner: jormungandr
--

ALTER TABLE ONLY public."Backend_praesidiumyear"
    ADD CONSTRAINT "Backend_praesidiumyear_pkey" PRIMARY KEY (id);


--
-- Name: Backend_profile Backend_profile_pkey; Type: CONSTRAINT; Schema: public; Owner: jormungandr
--

ALTER TABLE ONLY public."Backend_profile"
    ADD CONSTRAINT "Backend_profile_pkey" PRIMARY KEY (id);


--
-- Name: Backend_profile Backend_profile_user_id_key; Type: CONSTRAINT; Schema: public; Owner: jormungandr
--

ALTER TABLE ONLY public."Backend_profile"
    ADD CONSTRAINT "Backend_profile_user_id_key" UNIQUE (user_id);


--
-- Name: Backend_round Backend_round_pkey; Type: CONSTRAINT; Schema: public; Owner: jormungandr
--

ALTER TABLE ONLY public."Backend_round"
    ADD CONSTRAINT "Backend_round_pkey" PRIMARY KEY (id);


--
-- Name: Backend_sponsor Backend_sponsor_name_key; Type: CONSTRAINT; Schema: public; Owner: jormungandr
--

ALTER TABLE ONLY public."Backend_sponsor"
    ADD CONSTRAINT "Backend_sponsor_name_key" UNIQUE (name);


--
-- Name: Backend_sponsor Backend_sponsor_pkey; Type: CONSTRAINT; Schema: public; Owner: jormungandr
--

ALTER TABLE ONLY public."Backend_sponsor"
    ADD CONSTRAINT "Backend_sponsor_pkey" PRIMARY KEY (id);


--
-- Name: Backend_uservotes Backend_uservotes_pkey; Type: CONSTRAINT; Schema: public; Owner: jormungandr
--

ALTER TABLE ONLY public."Backend_uservotes"
    ADD CONSTRAINT "Backend_uservotes_pkey" PRIMARY KEY (id);


--
-- Name: Backend_uservotes Backend_uservotes_user_id_round_id_b2449179_uniq; Type: CONSTRAINT; Schema: public; Owner: jormungandr
--

ALTER TABLE ONLY public."Backend_uservotes"
    ADD CONSTRAINT "Backend_uservotes_user_id_round_id_b2449179_uniq" UNIQUE (user_id, round_id);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: jormungandr
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: jormungandr
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: jormungandr
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: jormungandr
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: jormungandr
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: jormungandr
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: jormungandr
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: jormungandr
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: jormungandr
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: jormungandr
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: jormungandr
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: jormungandr
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: jormungandr
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: jormungandr
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: jormungandr
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: jormungandr
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: jormungandr
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: Backend_choice_round_id_fd079106; Type: INDEX; Schema: public; Owner: jormungandr
--

CREATE INDEX "Backend_choice_round_id_fd079106" ON public."Backend_choice" USING btree (round_id);


--
-- Name: Backend_event_genre_id_f0baf530; Type: INDEX; Schema: public; Owner: jormungandr
--

CREATE INDEX "Backend_event_genre_id_f0baf530" ON public."Backend_event" USING btree (genre_id);


--
-- Name: Backend_eventgenre_name_7fa8d0f0_like; Type: INDEX; Schema: public; Owner: jormungandr
--

CREATE INDEX "Backend_eventgenre_name_7fa8d0f0_like" ON public."Backend_eventgenre" USING btree (name varchar_pattern_ops);


--
-- Name: Backend_graphnode_parent_id_9653d90a; Type: INDEX; Schema: public; Owner: jormungandr
--

CREATE INDEX "Backend_graphnode_parent_id_9653d90a" ON public."Backend_graphnode" USING btree (parent_id);


--
-- Name: Backend_navsubitem_parent_id_8ae7c99e; Type: INDEX; Schema: public; Owner: jormungandr
--

CREATE INDEX "Backend_navsubitem_parent_id_8ae7c99e" ON public."Backend_navsubitem" USING btree (parent_id);


--
-- Name: Backend_picture_album_id_80eb1842; Type: INDEX; Schema: public; Owner: jormungandr
--

CREATE INDEX "Backend_picture_album_id_80eb1842" ON public."Backend_picture" USING btree (album_id);


--
-- Name: Backend_picture_link_5864bc8e_like; Type: INDEX; Schema: public; Owner: jormungandr
--

CREATE INDEX "Backend_picture_link_5864bc8e_like" ON public."Backend_picture" USING btree (link varchar_pattern_ops);


--
-- Name: Backend_praesidiumfunction_praesidium_function_id_1ffe2682; Type: INDEX; Schema: public; Owner: jormungandr
--

CREATE INDEX "Backend_praesidiumfunction_praesidium_function_id_1ffe2682" ON public."Backend_praesidiumfunctionyearmember" USING btree (praesidium_function_id);


--
-- Name: Backend_praesidiumfunction_praesidium_member_id_dc5506f7; Type: INDEX; Schema: public; Owner: jormungandr
--

CREATE INDEX "Backend_praesidiumfunction_praesidium_member_id_dc5506f7" ON public."Backend_praesidiumfunctionyearmember" USING btree (praesidium_member_id);


--
-- Name: Backend_praesidiumfunction_praesidium_year_id_33e4da0f; Type: INDEX; Schema: public; Owner: jormungandr
--

CREATE INDEX "Backend_praesidiumfunction_praesidium_year_id_33e4da0f" ON public."Backend_praesidiumfunctionyearmember" USING btree (praesidium_year_id);


--
-- Name: Backend_round_election_id_d8be2970; Type: INDEX; Schema: public; Owner: jormungandr
--

CREATE INDEX "Backend_round_election_id_d8be2970" ON public."Backend_round" USING btree (election_id);


--
-- Name: Backend_sponsor_name_d673fa94_like; Type: INDEX; Schema: public; Owner: jormungandr
--

CREATE INDEX "Backend_sponsor_name_d673fa94_like" ON public."Backend_sponsor" USING btree (name varchar_pattern_ops);


--
-- Name: Backend_uservotes_round_id_2204627c; Type: INDEX; Schema: public; Owner: jormungandr
--

CREATE INDEX "Backend_uservotes_round_id_2204627c" ON public."Backend_uservotes" USING btree (round_id);


--
-- Name: Backend_uservotes_user_id_e7e515dd; Type: INDEX; Schema: public; Owner: jormungandr
--

CREATE INDEX "Backend_uservotes_user_id_e7e515dd" ON public."Backend_uservotes" USING btree (user_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: jormungandr
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: jormungandr
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: jormungandr
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: jormungandr
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: jormungandr
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: jormungandr
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: jormungandr
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: jormungandr
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: jormungandr
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: jormungandr
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: jormungandr
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: jormungandr
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: jormungandr
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: Backend_choice Backend_choice_round_id_fd079106_fk_Backend_round_id; Type: FK CONSTRAINT; Schema: public; Owner: jormungandr
--

ALTER TABLE ONLY public."Backend_choice"
    ADD CONSTRAINT "Backend_choice_round_id_fd079106_fk_Backend_round_id" FOREIGN KEY (round_id) REFERENCES public."Backend_round"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Backend_event Backend_event_genre_id_f0baf530_fk_Backend_eventgenre_id; Type: FK CONSTRAINT; Schema: public; Owner: jormungandr
--

ALTER TABLE ONLY public."Backend_event"
    ADD CONSTRAINT "Backend_event_genre_id_f0baf530_fk_Backend_eventgenre_id" FOREIGN KEY (genre_id) REFERENCES public."Backend_eventgenre"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Backend_graphnode Backend_graphnode_parent_id_9653d90a_fk_Backend_graphnode_id; Type: FK CONSTRAINT; Schema: public; Owner: jormungandr
--

ALTER TABLE ONLY public."Backend_graphnode"
    ADD CONSTRAINT "Backend_graphnode_parent_id_9653d90a_fk_Backend_graphnode_id" FOREIGN KEY (parent_id) REFERENCES public."Backend_graphnode"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Backend_navsubitem Backend_navsubitem_parent_id_8ae7c99e_fk_Backend_navtopitem_id; Type: FK CONSTRAINT; Schema: public; Owner: jormungandr
--

ALTER TABLE ONLY public."Backend_navsubitem"
    ADD CONSTRAINT "Backend_navsubitem_parent_id_8ae7c99e_fk_Backend_navtopitem_id" FOREIGN KEY (parent_id) REFERENCES public."Backend_navtopitem"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Backend_picture Backend_picture_album_id_80eb1842_fk_Backend_photoalbum_id; Type: FK CONSTRAINT; Schema: public; Owner: jormungandr
--

ALTER TABLE ONLY public."Backend_picture"
    ADD CONSTRAINT "Backend_picture_album_id_80eb1842_fk_Backend_photoalbum_id" FOREIGN KEY (album_id) REFERENCES public."Backend_photoalbum"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Backend_praesidiumfunctionyearmember Backend_praesidiumfu_praesidium_function__1ffe2682_fk_Backend_p; Type: FK CONSTRAINT; Schema: public; Owner: jormungandr
--

ALTER TABLE ONLY public."Backend_praesidiumfunctionyearmember"
    ADD CONSTRAINT "Backend_praesidiumfu_praesidium_function__1ffe2682_fk_Backend_p" FOREIGN KEY (praesidium_function_id) REFERENCES public."Backend_praesidiumfunction"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Backend_praesidiumfunctionyearmember Backend_praesidiumfu_praesidium_member_id_dc5506f7_fk_Backend_p; Type: FK CONSTRAINT; Schema: public; Owner: jormungandr
--

ALTER TABLE ONLY public."Backend_praesidiumfunctionyearmember"
    ADD CONSTRAINT "Backend_praesidiumfu_praesidium_member_id_dc5506f7_fk_Backend_p" FOREIGN KEY (praesidium_member_id) REFERENCES public."Backend_praesidiummember"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Backend_praesidiumfunctionyearmember Backend_praesidiumfu_praesidium_year_id_33e4da0f_fk_Backend_p; Type: FK CONSTRAINT; Schema: public; Owner: jormungandr
--

ALTER TABLE ONLY public."Backend_praesidiumfunctionyearmember"
    ADD CONSTRAINT "Backend_praesidiumfu_praesidium_year_id_33e4da0f_fk_Backend_p" FOREIGN KEY (praesidium_year_id) REFERENCES public."Backend_praesidiumyear"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Backend_profile Backend_profile_user_id_ba6dc2f7_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: jormungandr
--

ALTER TABLE ONLY public."Backend_profile"
    ADD CONSTRAINT "Backend_profile_user_id_ba6dc2f7_fk_auth_user_id" FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Backend_round Backend_round_election_id_d8be2970_fk_Backend_election_id; Type: FK CONSTRAINT; Schema: public; Owner: jormungandr
--

ALTER TABLE ONLY public."Backend_round"
    ADD CONSTRAINT "Backend_round_election_id_d8be2970_fk_Backend_election_id" FOREIGN KEY (election_id) REFERENCES public."Backend_election"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Backend_uservotes Backend_uservotes_round_id_2204627c_fk_Backend_round_id; Type: FK CONSTRAINT; Schema: public; Owner: jormungandr
--

ALTER TABLE ONLY public."Backend_uservotes"
    ADD CONSTRAINT "Backend_uservotes_round_id_2204627c_fk_Backend_round_id" FOREIGN KEY (round_id) REFERENCES public."Backend_round"(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: Backend_uservotes Backend_uservotes_user_id_e7e515dd_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: jormungandr
--

ALTER TABLE ONLY public."Backend_uservotes"
    ADD CONSTRAINT "Backend_uservotes_user_id_e7e515dd_fk_auth_user_id" FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: jormungandr
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: jormungandr
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: jormungandr
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: jormungandr
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: jormungandr
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: jormungandr
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: jormungandr
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: jormungandr
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: jormungandr
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

