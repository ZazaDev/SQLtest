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
CREATE TABLE public.demo (
    id integer NOT NULL,
    name character varying(200) DEFAULT ''::character varying NOT NULL,
    hint text DEFAULT ''::text NOT NULL
);
CREATE SEQUENCE public.demo_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.demo_id_seq OWNED BY public.demo.id;
CREATE TABLE public.departamentos (
    id integer NOT NULL,
    nomedepto character varying(50)
);
CREATE SEQUENCE public.departamentos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.departamentos_id_seq OWNED BY public.departamentos.id;
CREATE TABLE public.funcionarios (
    id integer NOT NULL,
    nomefunc character varying(50),
    departamento_id integer,
    datanasc date,
    cpf character varying(11),
    salario numeric(12,2)
);
CREATE SEQUENCE public.funcionarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.funcionarios_id_seq OWNED BY public.funcionarios.id;
CREATE TABLE public.pessoas (
    id integer NOT NULL,
    nomepessoa character varying(50),
    datanascimento date
);
CREATE SEQUENCE public.pessoas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
ALTER SEQUENCE public.pessoas_id_seq OWNED BY public.pessoas.id;
ALTER TABLE ONLY public.demo ALTER COLUMN id SET DEFAULT nextval('public.demo_id_seq'::regclass);
ALTER TABLE ONLY public.departamentos ALTER COLUMN id SET DEFAULT nextval('public.departamentos_id_seq'::regclass);
ALTER TABLE ONLY public.funcionarios ALTER COLUMN id SET DEFAULT nextval('public.funcionarios_id_seq'::regclass);
ALTER TABLE ONLY public.pessoas ALTER COLUMN id SET DEFAULT nextval('public.pessoas_id_seq'::regclass);
ALTER TABLE ONLY public.demo
    ADD CONSTRAINT demo_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.departamentos
    ADD CONSTRAINT departamentos_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_cpf_key UNIQUE (cpf);
ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.pessoas
    ADD CONSTRAINT pessoas_pkey PRIMARY KEY (id);
ALTER TABLE ONLY public.funcionarios
    ADD CONSTRAINT funcionarios_departamento_id_fkey FOREIGN KEY (departamento_id) REFERENCES public.departamentos(id);