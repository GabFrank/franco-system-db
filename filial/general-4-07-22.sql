--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.25
-- Dumped by pg_dump version 9.5.25

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: administrativo; Type: SCHEMA; Schema: -; Owner: franco
--

CREATE SCHEMA administrativo;


ALTER SCHEMA administrativo OWNER TO franco;

--
-- Name: configuraciones; Type: SCHEMA; Schema: -; Owner: franco
--

CREATE SCHEMA configuraciones;


ALTER SCHEMA configuraciones OWNER TO franco;

--
-- Name: empresarial; Type: SCHEMA; Schema: -; Owner: franco
--

CREATE SCHEMA empresarial;


ALTER SCHEMA empresarial OWNER TO franco;

--
-- Name: equipos; Type: SCHEMA; Schema: -; Owner: franco
--

CREATE SCHEMA equipos;


ALTER SCHEMA equipos OWNER TO franco;

--
-- Name: financiero; Type: SCHEMA; Schema: -; Owner: franco
--

CREATE SCHEMA financiero;


ALTER SCHEMA financiero OWNER TO franco;

--
-- Name: general; Type: SCHEMA; Schema: -; Owner: franco
--

CREATE SCHEMA general;


ALTER SCHEMA general OWNER TO franco;

--
-- Name: operaciones; Type: SCHEMA; Schema: -; Owner: franco
--

CREATE SCHEMA operaciones;


ALTER SCHEMA operaciones OWNER TO franco;

--
-- Name: personas; Type: SCHEMA; Schema: -; Owner: franco
--

CREATE SCHEMA personas;


ALTER SCHEMA personas OWNER TO franco;

--
-- Name: productos; Type: SCHEMA; Schema: -; Owner: franco
--

CREATE SCHEMA productos;


ALTER SCHEMA productos OWNER TO franco;

--
-- Name: vehiculos; Type: SCHEMA; Schema: -; Owner: franco
--

CREATE SCHEMA vehiculos;


ALTER SCHEMA vehiculos OWNER TO franco;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: estado_autorizacion; Type: TYPE; Schema: administrativo; Owner: franco
--

CREATE TYPE administrativo.estado_autorizacion AS ENUM (
    'EN ESPERA',
    'CANCELADO',
    'AUTORIZADO',
    'NO_AUTORIZADO'
);


ALTER TYPE administrativo.estado_autorizacion OWNER TO franco;

--
-- Name: tipo_autorizacion; Type: TYPE; Schema: administrativo; Owner: franco
--

CREATE TYPE administrativo.tipo_autorizacion AS ENUM (
    'MARCACION'
);


ALTER TYPE administrativo.tipo_autorizacion OWNER TO franco;

--
-- Name: tipo_marcacion; Type: TYPE; Schema: administrativo; Owner: franco
--

CREATE TYPE administrativo.tipo_marcacion AS ENUM (
    'ENTRADA',
    'SALIDA'
);


ALTER TYPE administrativo.tipo_marcacion OWNER TO franco;

--
-- Name: estado_retiro; Type: TYPE; Schema: financiero; Owner: franco
--

CREATE TYPE financiero.estado_retiro AS ENUM (
    'EN_PROCESO',
    'CONCLUIDO',
    'NECESITA_VERIFICACION',
    'EN_VERIFICACION',
    'VERIFICADO_CONCLUIDO_SIN_PROBLEMA',
    'VERIFICADO_CONCLUIDO_CON_PROBLEMA'
);


ALTER TYPE financiero.estado_retiro OWNER TO franco;

--
-- Name: pdv_caja_estado; Type: TYPE; Schema: financiero; Owner: franco
--

CREATE TYPE financiero.pdv_caja_estado AS ENUM (
    'EN_PROCESO',
    'CONCLUIDO',
    'NECESITA_VERIFICACION',
    'EN_VERIFICACION',
    'VERIFICADO_CONCLUIDO_SIN_PROBLEMA',
    'VERIFICADO_CONCLUIDO_CON_PROBLEMA'
);


ALTER TYPE financiero.pdv_caja_estado OWNER TO franco;

--
-- Name: pdv_caja_tipo_movimiento; Type: TYPE; Schema: financiero; Owner: franco
--

CREATE TYPE financiero.pdv_caja_tipo_movimiento AS ENUM (
    'CAJA_INICIAL',
    'VENTA',
    'GASTO',
    'VALE',
    'RETIRO',
    'DEVOLUCION',
    'SALIDA_SENCILLO',
    'CAMBIO',
    'AJUSTE',
    'ENTRADA_SENCILLO'
);


ALTER TYPE financiero.pdv_caja_tipo_movimiento OWNER TO franco;

--
-- Name: tipo_cuenta; Type: TYPE; Schema: financiero; Owner: franco
--

CREATE TYPE financiero.tipo_cuenta AS ENUM (
    'CUENTA_CORRIENTE',
    'CAJA_DE_AHORRO'
);


ALTER TYPE financiero.tipo_cuenta OWNER TO franco;

--
-- Name: dias_semana; Type: TYPE; Schema: general; Owner: franco
--

CREATE TYPE general.dias_semana AS ENUM (
    'LUNES',
    'MARTES',
    'MIERCOLES',
    'JEUVES',
    'VIERNES',
    'SABADO',
    'DOMINGO'
);


ALTER TYPE general.dias_semana OWNER TO franco;

--
-- Name: meses; Type: TYPE; Schema: general; Owner: franco
--

CREATE TYPE general.meses AS ENUM (
    'ENERO',
    'FEBRERO',
    'MARZO',
    'ABRIL',
    'MAYO',
    'JUNIO',
    'JULIO',
    'AGOSTO',
    'SEMPTIEMBRE',
    'OCTUBRE',
    'NOVIEMBRE',
    'DICIEMBRE'
);


ALTER TYPE general.meses OWNER TO franco;

--
-- Name: cambio_precio_momento; Type: TYPE; Schema: operaciones; Owner: franco
--

CREATE TYPE operaciones.cambio_precio_momento AS ENUM (
    'INMEDIATO',
    'EN_FECHA_INDICADA',
    'AL_RECIBIR_COMPRA',
    'AL_AUTORIZAR',
    'AL_ALCANZAR_CANTIDAD'
);


ALTER TYPE operaciones.cambio_precio_momento OWNER TO franco;

--
-- Name: compra_estado; Type: TYPE; Schema: operaciones; Owner: franco
--

CREATE TYPE operaciones.compra_estado AS ENUM (
    'ACTIVO',
    'CANCELADO',
    'DEVILVIDO',
    'EN_OBSERVACION',
    'IRREGULAR',
    'PRE_COMPRA'
);


ALTER TYPE operaciones.compra_estado OWNER TO franco;

--
-- Name: compra_item_estado; Type: TYPE; Schema: operaciones; Owner: franco
--

CREATE TYPE operaciones.compra_item_estado AS ENUM (
    'SIN_MODIFICACION',
    'MODIFICADO'
);


ALTER TYPE operaciones.compra_item_estado OWNER TO franco;

--
-- Name: compra_tipo_boleta; Type: TYPE; Schema: operaciones; Owner: franco
--

CREATE TYPE operaciones.compra_tipo_boleta AS ENUM (
    'LEGAL',
    'COMUN'
);


ALTER TYPE operaciones.compra_tipo_boleta OWNER TO franco;

--
-- Name: delivery_estado; Type: TYPE; Schema: operaciones; Owner: franco
--

CREATE TYPE operaciones.delivery_estado AS ENUM (
    'ABIERTO',
    'EN_CAMINO',
    'ENTREGADO',
    'CANCELADO',
    'DEVOLVIDO'
);


ALTER TYPE operaciones.delivery_estado OWNER TO franco;

--
-- Name: etapa_transferencia; Type: TYPE; Schema: operaciones; Owner: franco
--

CREATE TYPE operaciones.etapa_transferencia AS ENUM (
    'PRE_TRANSFERENCIA_CREACION',
    'PRE_TRANSFERENCIA_ORIGEN',
    'PREPARACION_MERCADERIA',
    'PREPARACION_MERCADERIA_CONCLUIDA',
    'TRANSPORTE_VERIFICACION',
    'TRANSPORTE_EN_CAMINO',
    'TRANSPORTE_EN_DESTINO',
    'RECEPCION_EN_VERIFICACION',
    'RECEPCION_CONCLUIDA'
);


ALTER TYPE operaciones.etapa_transferencia OWNER TO franco;

--
-- Name: inventario_estado; Type: TYPE; Schema: operaciones; Owner: franco
--

CREATE TYPE operaciones.inventario_estado AS ENUM (
    'ABIERTO',
    'CANCELADO',
    'CONCLUIDO'
);


ALTER TYPE operaciones.inventario_estado OWNER TO franco;

--
-- Name: inventario_producto_estado; Type: TYPE; Schema: operaciones; Owner: franco
--

CREATE TYPE operaciones.inventario_producto_estado AS ENUM (
    'BUENO',
    'AVERIADO',
    'VENCIDO'
);


ALTER TYPE operaciones.inventario_producto_estado OWNER TO franco;

--
-- Name: necesidad_estado; Type: TYPE; Schema: operaciones; Owner: franco
--

CREATE TYPE operaciones.necesidad_estado AS ENUM (
    'ACTIVO',
    'MODIFICADO',
    'CANCELADO',
    'EN_VERIFICACION',
    'EN_VERIFICACION_SOLICITUD_AUTORIZACION',
    'VERFICADO_SIN_MODIFICACION',
    'VERFICADO_CON_MODIFICACION',
    'CONCLUIDO'
);


ALTER TYPE operaciones.necesidad_estado OWNER TO franco;

--
-- Name: necesidad_item_estado; Type: TYPE; Schema: operaciones; Owner: franco
--

CREATE TYPE operaciones.necesidad_item_estado AS ENUM (
    'ACTIVO',
    'CANCELADO',
    'DEVOLUCION',
    'CONCLUIDO',
    'EN_FALTA'
);


ALTER TYPE operaciones.necesidad_item_estado OWNER TO franco;

--
-- Name: pedido_estado; Type: TYPE; Schema: operaciones; Owner: franco
--

CREATE TYPE operaciones.pedido_estado AS ENUM (
    'ABIERTO',
    'ACTIVO',
    'MODIFICADO',
    'CANCELADO',
    'REPROGRAMADO',
    'EN_VERIFICACION',
    'EN_VERIFICACION_SOLICITUD_AUTORIZACION',
    'VERFICADO_SIN_MODIFICACION',
    'VERFICADO_CON_MODIFICACION',
    'CONCLUIDO',
    'EN_RECEPCION_NOTA',
    'EN_RECEPCION_MERCADERIA'
);


ALTER TYPE operaciones.pedido_estado OWNER TO franco;

--
-- Name: pedido_forma_pago; Type: TYPE; Schema: operaciones; Owner: franco
--

CREATE TYPE operaciones.pedido_forma_pago AS ENUM (
    'EFECTIVO',
    'TRANSFERENCIA',
    'CHEQUE',
    'CREDITO'
);


ALTER TYPE operaciones.pedido_forma_pago OWNER TO franco;

--
-- Name: pedido_item_estado; Type: TYPE; Schema: operaciones; Owner: franco
--

CREATE TYPE operaciones.pedido_item_estado AS ENUM (
    'ACTIVO',
    'CANCELADO',
    'DEVOLUCION',
    'CONCLUIDO',
    'EN_FALTA'
);


ALTER TYPE operaciones.pedido_item_estado OWNER TO franco;

--
-- Name: tipo_entrada; Type: TYPE; Schema: operaciones; Owner: franco
--

CREATE TYPE operaciones.tipo_entrada AS ENUM (
    'COMPRA',
    'SUCURSAL',
    'AJUSTE'
);


ALTER TYPE operaciones.tipo_entrada OWNER TO franco;

--
-- Name: tipo_inventario; Type: TYPE; Schema: operaciones; Owner: franco
--

CREATE TYPE operaciones.tipo_inventario AS ENUM (
    'ABC',
    'ZONA',
    'PRODUCTO',
    'CATEGORIA'
);


ALTER TYPE operaciones.tipo_inventario OWNER TO franco;

--
-- Name: tipo_movimiento; Type: TYPE; Schema: operaciones; Owner: franco
--

CREATE TYPE operaciones.tipo_movimiento AS ENUM (
    'COMPRA',
    'VENTA',
    'DEVOLUCION',
    'DESCARTE',
    'AJUSTE',
    'TRANSFERENCIA',
    'CALCULO',
    'ENTRADA',
    'SALIDA'
);


ALTER TYPE operaciones.tipo_movimiento OWNER TO franco;

--
-- Name: tipo_salida; Type: TYPE; Schema: operaciones; Owner: franco
--

CREATE TYPE operaciones.tipo_salida AS ENUM (
    'SUCURSAL',
    'VENCIDO',
    'DETERIORADO',
    'AJUSTE'
);


ALTER TYPE operaciones.tipo_salida OWNER TO franco;

--
-- Name: tipo_transferencia; Type: TYPE; Schema: operaciones; Owner: franco
--

CREATE TYPE operaciones.tipo_transferencia AS ENUM (
    'MANUAL',
    'AUTOMATICA',
    'MIXTA'
);


ALTER TYPE operaciones.tipo_transferencia OWNER TO franco;

--
-- Name: tipo_venta; Type: TYPE; Schema: operaciones; Owner: franco
--

CREATE TYPE operaciones.tipo_venta AS ENUM (
    'EFECTIVO',
    'CREDITO',
    'TARJETA',
    'TRANSFERENCIA',
    'CONSIGNACION',
    'CORTESIA'
);


ALTER TYPE operaciones.tipo_venta OWNER TO franco;

--
-- Name: transferencia_estado; Type: TYPE; Schema: operaciones; Owner: franco
--

CREATE TYPE operaciones.transferencia_estado AS ENUM (
    'ABIERTA',
    'EN_ORIGEN',
    'EN_TRANSITO',
    'EN_DESTINO',
    'FALTA_REVISION_EN_ORIGEN',
    'FALTA_REVISION_EN_DESTINO',
    'CONLCUIDA',
    'CANCELADA'
);


ALTER TYPE operaciones.transferencia_estado OWNER TO franco;

--
-- Name: transferencia_item_motivo_modificacion; Type: TYPE; Schema: operaciones; Owner: franco
--

CREATE TYPE operaciones.transferencia_item_motivo_modificacion AS ENUM (
    'CANTIDAD_INCORRECTA',
    'VENCIMIENTO_INCORRECTO',
    'PRESENTACION_INCORRECTA'
);


ALTER TYPE operaciones.transferencia_item_motivo_modificacion OWNER TO franco;

--
-- Name: transferencia_item_motivo_rechazo; Type: TYPE; Schema: operaciones; Owner: franco
--

CREATE TYPE operaciones.transferencia_item_motivo_rechazo AS ENUM (
    'FALTA_PRODUCTO',
    'PRODUCTO_AVERIADO',
    'PRODUCTO_VENCIDO',
    'PRODUCTO_EQUIVOCADO'
);


ALTER TYPE operaciones.transferencia_item_motivo_rechazo OWNER TO franco;

--
-- Name: venta_estado; Type: TYPE; Schema: operaciones; Owner: franco
--

CREATE TYPE operaciones.venta_estado AS ENUM (
    'ABIERTA',
    'CONCLUIDA',
    'CANCELADA',
    'EN_VERIFICACION'
);


ALTER TYPE operaciones.venta_estado OWNER TO franco;

--
-- Name: tipo_conservacion; Type: TYPE; Schema: productos; Owner: franco
--

CREATE TYPE productos.tipo_conservacion AS ENUM (
    'ENFRIABLE',
    'NO_ENFRIABLE',
    'REFRIGERABLE',
    'CONGELABLE'
);


ALTER TYPE productos.tipo_conservacion OWNER TO franco;

--
-- Name: unidad_medida; Type: TYPE; Schema: productos; Owner: franco
--

CREATE TYPE productos.unidad_medida AS ENUM (
    'UNIDAD',
    'CAJA',
    'KILO',
    'LITROS'
);


ALTER TYPE productos.unidad_medida OWNER TO franco;

--
-- Name: estado_vehiculo; Type: TYPE; Schema: vehiculos; Owner: franco
--

CREATE TYPE vehiculos.estado_vehiculo AS ENUM (
    'FUNCIONANDO',
    'AVERIADO',
    'EN_REPARACION',
    'AGUARDANDO_REPARACION'
);


ALTER TYPE vehiculos.estado_vehiculo OWNER TO franco;

--
-- Name: eliminartablasporschema(character varying); Type: FUNCTION; Schema: public; Owner: franco
--

CREATE FUNCTION public.eliminartablasporschema(schmname character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
    statements CURSOR FOR
        SELECT tablename FROM pg_tables
        WHERE schemaname = schmname;
BEGIN
    FOR stmt IN statements LOOP
        EXECUTE 'TRUNCATE TABLE ' || quote_ident(stmt.tablename) || ' CASCADE;';
    END LOOP;
END;
$$;


ALTER FUNCTION public.eliminartablasporschema(schmname character varying) OWNER TO franco;

--
-- Name: getallsequences(); Type: FUNCTION; Schema: public; Owner: franco
--

CREATE FUNCTION public.getallsequences() RETURNS void
    LANGUAGE plpgsql
    AS $$
begin
   execute (
select
	pg_get_serial_sequence(t.schemaname || '.' || t.tablename,
	c.column_name)
from
	pg_tables t
join information_schema.columns c on
	c.table_schema = t.schemaname
	and c.table_name = t.tablename
where
	t.schemaname <> 'pg_catalog'
	and t.schemaname <> 'information_schema'
	and pg_get_serial_sequence(t.schemaname || '.' || t.tablename,
	c.column_name) is not null

);
end
$$;


ALTER FUNCTION public.getallsequences() OWNER TO franco;

--
-- Name: reiniciardb(); Type: FUNCTION; Schema: public; Owner: franco
--

CREATE FUNCTION public.reiniciardb() RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
   execute (select *
   FROM   pg_tables
   WHERE  tableowner = _username
   );
END
$$;


ALTER FUNCTION public.reiniciardb() OWNER TO franco;

--
-- Name: reiniciardb(text); Type: FUNCTION; Schema: public; Owner: franco
--

CREATE FUNCTION public.reiniciardb(_username text) RETURNS void
    LANGUAGE plpgsql
    AS $$
begin
   execute (select 'reiniciarDB(franco,' || quote_ident(schemaname) || ');'
from
	pg_tables
where
	tableowner = _username
   );
end
$$;


ALTER FUNCTION public.reiniciardb(_username text) OWNER TO franco;

--
-- Name: reiniciarsecuencias(text, text); Type: FUNCTION; Schema: public; Owner: franco
--

CREATE FUNCTION public.reiniciarsecuencias(_username text, _schemaname text) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
   EXECUTE 'SELECT setval('|| string_agg(quote_ident(_schemaname) || '.' || quote_ident(tablename), ', ')
       ||  '_id_seq ,1, true);'
   FROM   pg_tables
   WHERE  tableowner = _username
   AND    schemaname = _schemaname
   ;
END
$$;


ALTER FUNCTION public.reiniciarsecuencias(_username text, _schemaname text) OWNER TO franco;

--
-- Name: reiniciartablas(text, text); Type: FUNCTION; Schema: public; Owner: franco
--

CREATE FUNCTION public.reiniciartablas(_username text, _schemaname text) RETURNS void
    LANGUAGE plpgsql
    AS $$
BEGIN
   execute (SELECT 'TRUNCATE '
       || string_agg(quote_ident(schemaname) || '.' || quote_ident(tablename), ', ')
       || ' RESTART IDENTITY CASCADE ;'
   FROM   pg_tables
   WHERE  tableowner = _username
   AND    schemaname = _schemaname
   );
END
$$;


ALTER FUNCTION public.reiniciartablas(_username text, _schemaname text) OWNER TO franco;

--
-- Name: truncate_tables(character varying); Type: FUNCTION; Schema: public; Owner: franco
--

CREATE FUNCTION public.truncate_tables(username character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
    statements CURSOR FOR
        SELECT tablename FROM pg_tables
        WHERE tableowner = username AND schemaname = 'public';
BEGIN
    FOR stmt IN statements LOOP
        EXECUTE 'TRUNCATE TABLE ' || quote_ident(stmt.tablename) || ' CASCADE;';
    END LOOP;
END;
$$;


ALTER FUNCTION public.truncate_tables(username character varying) OWNER TO franco;

--
-- Name: truncate_tables(character varying, character varying); Type: FUNCTION; Schema: public; Owner: franco
--

CREATE FUNCTION public.truncate_tables(username character varying, schemaname character varying) RETURNS void
    LANGUAGE plpgsql
    AS $$
DECLARE
    statements CURSOR FOR
        SELECT tablename FROM pg_tables
        WHERE tableowner = username AND schemaname = schemaname;
BEGIN
    FOR stmt IN statements LOOP
        EXECUTE 'TRUNCATE TABLE ' || quote_ident(stmt.tablename) || ' CASCADE;';
    END LOOP;
END;
$$;


ALTER FUNCTION public.truncate_tables(username character varying, schemaname character varying) OWNER TO franco;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: autorizacion; Type: TABLE; Schema: administrativo; Owner: franco
--

CREATE TABLE administrativo.autorizacion (
    id bigint NOT NULL,
    funcionario_id bigint,
    autorizador_id bigint,
    tipo_autorizacion administrativo.tipo_autorizacion,
    estado_autorizacion administrativo.estado_autorizacion,
    observacion character varying,
    usuario_id bigint,
    creado_en timestamp with time zone DEFAULT now()
);


ALTER TABLE administrativo.autorizacion OWNER TO franco;

--
-- Name: autorizacion_id_seq; Type: SEQUENCE; Schema: administrativo; Owner: franco
--

CREATE SEQUENCE administrativo.autorizacion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE administrativo.autorizacion_id_seq OWNER TO franco;

--
-- Name: autorizacion_id_seq; Type: SEQUENCE OWNED BY; Schema: administrativo; Owner: franco
--

ALTER SEQUENCE administrativo.autorizacion_id_seq OWNED BY administrativo.autorizacion.id;


--
-- Name: marcacion; Type: TABLE; Schema: administrativo; Owner: franco
--

CREATE TABLE administrativo.marcacion (
    id bigint NOT NULL,
    tipo_marcacion administrativo.tipo_marcacion,
    presencial boolean,
    autorizacion bigint,
    sucursal_id bigint,
    codigo character varying,
    usuario_id bigint,
    creado_en timestamp with time zone DEFAULT now()
);


ALTER TABLE administrativo.marcacion OWNER TO franco;

--
-- Name: marcacion_id_seq; Type: SEQUENCE; Schema: administrativo; Owner: franco
--

CREATE SEQUENCE administrativo.marcacion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE administrativo.marcacion_id_seq OWNER TO franco;

--
-- Name: marcacion_id_seq; Type: SEQUENCE OWNED BY; Schema: administrativo; Owner: franco
--

ALTER SEQUENCE administrativo.marcacion_id_seq OWNED BY administrativo.marcacion.id;


--
-- Name: inicio_sesion; Type: TABLE; Schema: configuraciones; Owner: franco
--

CREATE TABLE configuraciones.inicio_sesion (
    id bigint NOT NULL,
    usuario_id bigint,
    dispositivo bigint,
    hora_inicio timestamp with time zone DEFAULT now(),
    hora_fin timestamp without time zone,
    creado_en timestamp with time zone DEFAULT now(),
    sucursal_id bigint
);


ALTER TABLE configuraciones.inicio_sesion OWNER TO franco;

--
-- Name: inicio_sesion_id_seq; Type: SEQUENCE; Schema: configuraciones; Owner: franco
--

CREATE SEQUENCE configuraciones.inicio_sesion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE configuraciones.inicio_sesion_id_seq OWNER TO franco;

--
-- Name: inicio_sesion_id_seq; Type: SEQUENCE OWNED BY; Schema: configuraciones; Owner: franco
--

ALTER SEQUENCE configuraciones.inicio_sesion_id_seq OWNED BY configuraciones.inicio_sesion.id;


--
-- Name: local; Type: TABLE; Schema: configuraciones; Owner: franco
--

CREATE TABLE configuraciones.local (
    id bigint NOT NULL,
    sucursal_id bigint,
    creado_en timestamp with time zone DEFAULT now(),
    usuario_id bigint,
    equipo_id bigint,
    is_servidor boolean
);


ALTER TABLE configuraciones.local OWNER TO franco;

--
-- Name: local_id_seq; Type: SEQUENCE; Schema: configuraciones; Owner: franco
--

CREATE SEQUENCE configuraciones.local_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE configuraciones.local_id_seq OWNER TO franco;

--
-- Name: local_id_seq; Type: SEQUENCE OWNED BY; Schema: configuraciones; Owner: franco
--

ALTER SEQUENCE configuraciones.local_id_seq OWNED BY configuraciones.local.id;


--
-- Name: cargo; Type: TABLE; Schema: empresarial; Owner: franco
--

CREATE TABLE empresarial.cargo (
    id bigint NOT NULL,
    nombre character varying,
    descripcion character varying,
    supervisado_por_id bigint,
    sueldo_base numeric,
    usuario_id bigint,
    creado_en timestamp with time zone DEFAULT now(),
    id_central bigint
);


ALTER TABLE empresarial.cargo OWNER TO franco;

--
-- Name: cargo_id_seq; Type: SEQUENCE; Schema: empresarial; Owner: franco
--

CREATE SEQUENCE empresarial.cargo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE empresarial.cargo_id_seq OWNER TO franco;

--
-- Name: cargo_id_seq; Type: SEQUENCE OWNED BY; Schema: empresarial; Owner: franco
--

ALTER SEQUENCE empresarial.cargo_id_seq OWNED BY empresarial.cargo.id;


--
-- Name: sector; Type: TABLE; Schema: empresarial; Owner: franco
--

CREATE TABLE empresarial.sector (
    id bigint NOT NULL,
    sucursal_id bigint,
    descripcion character varying,
    activo boolean,
    usuario_id bigint,
    creado_en timestamp without time zone
);


ALTER TABLE empresarial.sector OWNER TO franco;

--
-- Name: sector_id_seq; Type: SEQUENCE; Schema: empresarial; Owner: franco
--

CREATE SEQUENCE empresarial.sector_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE empresarial.sector_id_seq OWNER TO franco;

--
-- Name: sector_id_seq; Type: SEQUENCE OWNED BY; Schema: empresarial; Owner: franco
--

ALTER SEQUENCE empresarial.sector_id_seq OWNED BY empresarial.sector.id;


--
-- Name: sucursal; Type: TABLE; Schema: empresarial; Owner: franco
--

CREATE TABLE empresarial.sucursal (
    id bigint NOT NULL,
    nombre character varying,
    localizacion character varying,
    ciudad_id bigint,
    usuario_id bigint,
    creado_en timestamp with time zone DEFAULT now(),
    deposito boolean DEFAULT true,
    deposito_predeterminado boolean DEFAULT false,
    direccion character varying,
    nro_delivery character varying,
    is_configured boolean DEFAULT true
);


ALTER TABLE empresarial.sucursal OWNER TO franco;

--
-- Name: COLUMN sucursal.direccion; Type: COMMENT; Schema: empresarial; Owner: franco
--

COMMENT ON COLUMN empresarial.sucursal.direccion IS 'direccion referencial';


--
-- Name: sucursal_id_seq; Type: SEQUENCE; Schema: empresarial; Owner: franco
--

CREATE SEQUENCE empresarial.sucursal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE empresarial.sucursal_id_seq OWNER TO franco;

--
-- Name: sucursal_id_seq; Type: SEQUENCE OWNED BY; Schema: empresarial; Owner: franco
--

ALTER SEQUENCE empresarial.sucursal_id_seq OWNED BY empresarial.sucursal.id;


--
-- Name: zona; Type: TABLE; Schema: empresarial; Owner: franco
--

CREATE TABLE empresarial.zona (
    id bigint NOT NULL,
    sector_id bigint,
    descripcion character varying,
    activo boolean,
    usuario_id bigint,
    creado_en timestamp without time zone
);


ALTER TABLE empresarial.zona OWNER TO franco;

--
-- Name: zona_id_seq; Type: SEQUENCE; Schema: empresarial; Owner: franco
--

CREATE SEQUENCE empresarial.zona_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE empresarial.zona_id_seq OWNER TO franco;

--
-- Name: zona_id_seq; Type: SEQUENCE OWNED BY; Schema: empresarial; Owner: franco
--

ALTER SEQUENCE empresarial.zona_id_seq OWNED BY empresarial.zona.id;


--
-- Name: equipo; Type: TABLE; Schema: equipos; Owner: franco
--

CREATE TABLE equipos.equipo (
    id bigint NOT NULL,
    marca character varying,
    modelo character varying,
    costo numeric,
    descripcion character varying,
    imagenes character varying,
    usuario_id bigint,
    creado_en timestamp with time zone DEFAULT now(),
    tipo_equipo_id bigint
);


ALTER TABLE equipos.equipo OWNER TO franco;

--
-- Name: equipo_id_seq; Type: SEQUENCE; Schema: equipos; Owner: franco
--

CREATE SEQUENCE equipos.equipo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE equipos.equipo_id_seq OWNER TO franco;

--
-- Name: equipo_id_seq; Type: SEQUENCE OWNED BY; Schema: equipos; Owner: franco
--

ALTER SEQUENCE equipos.equipo_id_seq OWNED BY equipos.equipo.id;


--
-- Name: tipo_equipo; Type: TABLE; Schema: equipos; Owner: franco
--

CREATE TABLE equipos.tipo_equipo (
    id bigint NOT NULL,
    descripcion character varying,
    usuario_id bigint,
    creado_en timestamp with time zone DEFAULT now()
);


ALTER TABLE equipos.tipo_equipo OWNER TO franco;

--
-- Name: tipo_equipo_id_seq; Type: SEQUENCE; Schema: equipos; Owner: franco
--

CREATE SEQUENCE equipos.tipo_equipo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE equipos.tipo_equipo_id_seq OWNER TO franco;

--
-- Name: tipo_equipo_id_seq; Type: SEQUENCE OWNED BY; Schema: equipos; Owner: franco
--

ALTER SEQUENCE equipos.tipo_equipo_id_seq OWNED BY equipos.tipo_equipo.id;


--
-- Name: banco; Type: TABLE; Schema: financiero; Owner: franco
--

CREATE TABLE financiero.banco (
    id bigint NOT NULL,
    nombre character varying,
    codigo character varying,
    usuario_id bigint,
    creado_en timestamp with time zone DEFAULT now()
);


ALTER TABLE financiero.banco OWNER TO franco;

--
-- Name: banco_id_seq; Type: SEQUENCE; Schema: financiero; Owner: franco
--

CREATE SEQUENCE financiero.banco_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE financiero.banco_id_seq OWNER TO franco;

--
-- Name: banco_id_seq; Type: SEQUENCE OWNED BY; Schema: financiero; Owner: franco
--

ALTER SEQUENCE financiero.banco_id_seq OWNED BY financiero.banco.id;


--
-- Name: cambio; Type: TABLE; Schema: financiero; Owner: franco
--

CREATE TABLE financiero.cambio (
    id bigint NOT NULL,
    moneda_id bigint,
    valor_en_gs numeric,
    activo boolean,
    usuario_id bigint,
    creado_en timestamp with time zone DEFAULT now(),
    id_central bigint,
    valor_en_gs_cambio numeric
);


ALTER TABLE financiero.cambio OWNER TO franco;

--
-- Name: cambio_caja; Type: TABLE; Schema: financiero; Owner: franco
--

CREATE TABLE financiero.cambio_caja (
    id bigint NOT NULL,
    cliente_id bigint,
    autorizado_por_id bigint,
    moneda_venta_id bigint,
    moneda_compra_id bigint,
    cotizacion numeric,
    observacion character varying,
    creado_en timestamp with time zone DEFAULT now(),
    usuario_id bigint
);


ALTER TABLE financiero.cambio_caja OWNER TO franco;

--
-- Name: cambio_caja_id_seq; Type: SEQUENCE; Schema: financiero; Owner: franco
--

CREATE SEQUENCE financiero.cambio_caja_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE financiero.cambio_caja_id_seq OWNER TO franco;

--
-- Name: cambio_caja_id_seq; Type: SEQUENCE OWNED BY; Schema: financiero; Owner: franco
--

ALTER SEQUENCE financiero.cambio_caja_id_seq OWNED BY financiero.cambio_caja.id;


--
-- Name: cambio_id_seq; Type: SEQUENCE; Schema: financiero; Owner: franco
--

CREATE SEQUENCE financiero.cambio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE financiero.cambio_id_seq OWNER TO franco;

--
-- Name: cambio_id_seq; Type: SEQUENCE OWNED BY; Schema: financiero; Owner: franco
--

ALTER SEQUENCE financiero.cambio_id_seq OWNED BY financiero.cambio.id;


--
-- Name: conteo; Type: TABLE; Schema: financiero; Owner: franco
--

CREATE TABLE financiero.conteo (
    id bigint NOT NULL,
    observacion character varying,
    creado_en timestamp with time zone DEFAULT now(),
    usuario_id bigint
);


ALTER TABLE financiero.conteo OWNER TO franco;

--
-- Name: conteo_id_seq; Type: SEQUENCE; Schema: financiero; Owner: franco
--

CREATE SEQUENCE financiero.conteo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE financiero.conteo_id_seq OWNER TO franco;

--
-- Name: conteo_id_seq; Type: SEQUENCE OWNED BY; Schema: financiero; Owner: franco
--

ALTER SEQUENCE financiero.conteo_id_seq OWNED BY financiero.conteo.id;


--
-- Name: conteo_moneda; Type: TABLE; Schema: financiero; Owner: franco
--

CREATE TABLE financiero.conteo_moneda (
    id bigint NOT NULL,
    conteo_id bigint,
    moneda_billetes_id bigint,
    cantidad numeric,
    observacion character varying,
    creado_en timestamp with time zone DEFAULT now(),
    usuario_id bigint
);


ALTER TABLE financiero.conteo_moneda OWNER TO franco;

--
-- Name: conteo_moneda_id_seq; Type: SEQUENCE; Schema: financiero; Owner: franco
--

CREATE SEQUENCE financiero.conteo_moneda_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE financiero.conteo_moneda_id_seq OWNER TO franco;

--
-- Name: conteo_moneda_id_seq; Type: SEQUENCE OWNED BY; Schema: financiero; Owner: franco
--

ALTER SEQUENCE financiero.conteo_moneda_id_seq OWNED BY financiero.conteo_moneda.id;


--
-- Name: cuenta_bancaria; Type: TABLE; Schema: financiero; Owner: franco
--

CREATE TABLE financiero.cuenta_bancaria (
    id bigint NOT NULL,
    persona_id bigint,
    banco_id bigint,
    moneda_id bigint,
    numero character varying,
    usuario_id bigint,
    creado_en timestamp with time zone DEFAULT now(),
    tipo_cuenta financiero.tipo_cuenta,
    id_central bigint
);


ALTER TABLE financiero.cuenta_bancaria OWNER TO franco;

--
-- Name: cuenta_bancaria_id_seq; Type: SEQUENCE; Schema: financiero; Owner: franco
--

CREATE SEQUENCE financiero.cuenta_bancaria_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE financiero.cuenta_bancaria_id_seq OWNER TO franco;

--
-- Name: cuenta_bancaria_id_seq; Type: SEQUENCE OWNED BY; Schema: financiero; Owner: franco
--

ALTER SEQUENCE financiero.cuenta_bancaria_id_seq OWNED BY financiero.cuenta_bancaria.id;


--
-- Name: documento; Type: TABLE; Schema: financiero; Owner: franco
--

CREATE TABLE financiero.documento (
    id bigint NOT NULL,
    descripcion character varying,
    activo boolean DEFAULT true,
    creado_en timestamp without time zone,
    usuario_id bigint
);


ALTER TABLE financiero.documento OWNER TO franco;

--
-- Name: documento_id_seq; Type: SEQUENCE; Schema: financiero; Owner: franco
--

CREATE SEQUENCE financiero.documento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE financiero.documento_id_seq OWNER TO franco;

--
-- Name: documento_id_seq; Type: SEQUENCE OWNED BY; Schema: financiero; Owner: franco
--

ALTER SEQUENCE financiero.documento_id_seq OWNED BY financiero.documento.id;


--
-- Name: forma_pago; Type: TABLE; Schema: financiero; Owner: franco
--

CREATE TABLE financiero.forma_pago (
    id bigint NOT NULL,
    descripcion character varying NOT NULL,
    activo boolean DEFAULT true,
    movimiento_caja boolean DEFAULT false,
    cuenta_bancaria_id bigint,
    autorizacion boolean DEFAULT false,
    creado_en timestamp with time zone DEFAULT now(),
    usuario_id bigint,
    id_central bigint
);


ALTER TABLE financiero.forma_pago OWNER TO franco;

--
-- Name: forma_pago_id_seq; Type: SEQUENCE; Schema: financiero; Owner: franco
--

CREATE SEQUENCE financiero.forma_pago_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE financiero.forma_pago_id_seq OWNER TO franco;

--
-- Name: forma_pago_id_seq; Type: SEQUENCE OWNED BY; Schema: financiero; Owner: franco
--

ALTER SEQUENCE financiero.forma_pago_id_seq OWNED BY financiero.forma_pago.id;


--
-- Name: gasto; Type: TABLE; Schema: financiero; Owner: franco
--

CREATE TABLE financiero.gasto (
    id bigint NOT NULL,
    responsable_id bigint,
    tipo_gasto_id bigint,
    autorizado_por_id bigint,
    observacion character varying,
    creado_en timestamp with time zone DEFAULT now(),
    usuario_id bigint,
    caja_id bigint,
    activo boolean DEFAULT true,
    finalizado boolean DEFAULT false,
    retiro_gs numeric DEFAULT 0,
    retiro_rs numeric DEFAULT 0,
    retiro_ds numeric DEFAULT 0,
    vuelto_gs numeric DEFAULT 0,
    vuelto_rs numeric DEFAULT 0,
    vuelto_ds numeric DEFAULT 0
);


ALTER TABLE financiero.gasto OWNER TO franco;

--
-- Name: gasto_detalle; Type: TABLE; Schema: financiero; Owner: franco
--

CREATE TABLE financiero.gasto_detalle (
    id bigint NOT NULL,
    gasto_id bigint,
    moneda_id bigint NOT NULL,
    cambio numeric(19,0),
    cantidad numeric NOT NULL,
    creado_en timestamp with time zone DEFAULT now(),
    usuario_id bigint,
    vuelto boolean DEFAULT false
);


ALTER TABLE financiero.gasto_detalle OWNER TO franco;

--
-- Name: gasto_detalle_id_seq; Type: SEQUENCE; Schema: financiero; Owner: franco
--

CREATE SEQUENCE financiero.gasto_detalle_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE financiero.gasto_detalle_id_seq OWNER TO franco;

--
-- Name: gasto_detalle_id_seq; Type: SEQUENCE OWNED BY; Schema: financiero; Owner: franco
--

ALTER SEQUENCE financiero.gasto_detalle_id_seq OWNED BY financiero.gasto_detalle.id;


--
-- Name: gasto_id_seq; Type: SEQUENCE; Schema: financiero; Owner: franco
--

CREATE SEQUENCE financiero.gasto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE financiero.gasto_id_seq OWNER TO franco;

--
-- Name: gasto_id_seq; Type: SEQUENCE OWNED BY; Schema: financiero; Owner: franco
--

ALTER SEQUENCE financiero.gasto_id_seq OWNED BY financiero.gasto.id;


--
-- Name: maletin_id_seq; Type: SEQUENCE; Schema: financiero; Owner: franco
--

CREATE SEQUENCE financiero.maletin_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE financiero.maletin_id_seq OWNER TO franco;

--
-- Name: maletin; Type: TABLE; Schema: financiero; Owner: franco
--

CREATE TABLE financiero.maletin (
    id bigint DEFAULT nextval('financiero.maletin_id_seq'::regclass) NOT NULL,
    descripcion character varying,
    activo boolean DEFAULT true,
    creado_en timestamp with time zone DEFAULT now(),
    usuario_id bigint,
    abierto boolean DEFAULT false
);


ALTER TABLE financiero.maletin OWNER TO franco;

--
-- Name: moneda; Type: TABLE; Schema: financiero; Owner: franco
--

CREATE TABLE financiero.moneda (
    id bigint NOT NULL,
    denominacion character varying,
    simbolo character varying,
    pais_id bigint,
    usuario_id bigint,
    creado_en timestamp with time zone DEFAULT now(),
    id_central bigint
);


ALTER TABLE financiero.moneda OWNER TO franco;

--
-- Name: moneda_billetes; Type: TABLE; Schema: financiero; Owner: franco
--

CREATE TABLE financiero.moneda_billetes (
    id bigint NOT NULL,
    moneda_id bigint NOT NULL,
    flotante boolean DEFAULT false,
    papel boolean DEFAULT true,
    valor numeric,
    activo boolean DEFAULT true,
    creado_en timestamp with time zone DEFAULT now(),
    usuario_id bigint,
    id_central bigint
);


ALTER TABLE financiero.moneda_billetes OWNER TO franco;

--
-- Name: moneda_billetes_id_seq; Type: SEQUENCE; Schema: financiero; Owner: franco
--

CREATE SEQUENCE financiero.moneda_billetes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE financiero.moneda_billetes_id_seq OWNER TO franco;

--
-- Name: moneda_billetes_id_seq; Type: SEQUENCE OWNED BY; Schema: financiero; Owner: franco
--

ALTER SEQUENCE financiero.moneda_billetes_id_seq OWNED BY financiero.moneda_billetes.id;


--
-- Name: moneda_id_seq; Type: SEQUENCE; Schema: financiero; Owner: franco
--

CREATE SEQUENCE financiero.moneda_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE financiero.moneda_id_seq OWNER TO franco;

--
-- Name: moneda_id_seq; Type: SEQUENCE OWNED BY; Schema: financiero; Owner: franco
--

ALTER SEQUENCE financiero.moneda_id_seq OWNED BY financiero.moneda.id;


--
-- Name: movimiento_caja; Type: TABLE; Schema: financiero; Owner: franco
--

CREATE TABLE financiero.movimiento_caja (
    id bigint NOT NULL,
    caja_id bigint NOT NULL,
    moneda_id bigint NOT NULL,
    referencia_id bigint NOT NULL,
    cambio_id bigint,
    cantidad numeric NOT NULL,
    tipo_movimiento financiero.pdv_caja_tipo_movimiento NOT NULL,
    creado_en timestamp with time zone DEFAULT now(),
    usuario_id bigint,
    activo boolean DEFAULT true
);


ALTER TABLE financiero.movimiento_caja OWNER TO franco;

--
-- Name: movimiento_caja_id_seq; Type: SEQUENCE; Schema: financiero; Owner: franco
--

CREATE SEQUENCE financiero.movimiento_caja_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE financiero.movimiento_caja_id_seq OWNER TO franco;

--
-- Name: movimiento_caja_id_seq; Type: SEQUENCE OWNED BY; Schema: financiero; Owner: franco
--

ALTER SEQUENCE financiero.movimiento_caja_id_seq OWNED BY financiero.movimiento_caja.id;


--
-- Name: pdv_caja; Type: TABLE; Schema: financiero; Owner: franco
--

CREATE TABLE financiero.pdv_caja (
    id bigint NOT NULL,
    descripcion character varying,
    activo boolean DEFAULT true,
    estado financiero.pdv_caja_estado,
    tuvo_problema boolean DEFAULT false,
    fecha_apertura timestamp with time zone DEFAULT now(),
    fecha_cierre timestamp with time zone,
    observacion character varying,
    creado_en timestamp with time zone,
    maletin_id bigint,
    usuario_id bigint,
    conteo_apertura_id bigint,
    conteo_cierre_id bigint
);


ALTER TABLE financiero.pdv_caja OWNER TO franco;

--
-- Name: pdv_caja_id_seq; Type: SEQUENCE; Schema: financiero; Owner: franco
--

CREATE SEQUENCE financiero.pdv_caja_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE financiero.pdv_caja_id_seq OWNER TO franco;

--
-- Name: pdv_caja_id_seq; Type: SEQUENCE OWNED BY; Schema: financiero; Owner: franco
--

ALTER SEQUENCE financiero.pdv_caja_id_seq OWNED BY financiero.pdv_caja.id;


--
-- Name: retiro; Type: TABLE; Schema: financiero; Owner: franco
--

CREATE TABLE financiero.retiro (
    id bigint NOT NULL,
    responsable_id bigint,
    estado financiero.estado_retiro,
    observacion character varying,
    creado_en timestamp with time zone DEFAULT now(),
    usuario_id bigint,
    caja_salida_id bigint,
    caja_entrada_id bigint
);


ALTER TABLE financiero.retiro OWNER TO franco;

--
-- Name: retiro_detalle; Type: TABLE; Schema: financiero; Owner: franco
--

CREATE TABLE financiero.retiro_detalle (
    id bigint NOT NULL,
    retiro_id bigint NOT NULL,
    moneda_id bigint NOT NULL,
    cambio numeric(19,0),
    cantidad numeric NOT NULL,
    creado_en timestamp with time zone DEFAULT now(),
    usuario_id bigint
);


ALTER TABLE financiero.retiro_detalle OWNER TO franco;

--
-- Name: retiro_detalle_id_seq; Type: SEQUENCE; Schema: financiero; Owner: franco
--

CREATE SEQUENCE financiero.retiro_detalle_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE financiero.retiro_detalle_id_seq OWNER TO franco;

--
-- Name: retiro_detalle_id_seq; Type: SEQUENCE OWNED BY; Schema: financiero; Owner: franco
--

ALTER SEQUENCE financiero.retiro_detalle_id_seq OWNED BY financiero.retiro_detalle.id;


--
-- Name: retiro_id_seq; Type: SEQUENCE; Schema: financiero; Owner: franco
--

CREATE SEQUENCE financiero.retiro_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE financiero.retiro_id_seq OWNER TO franco;

--
-- Name: retiro_id_seq; Type: SEQUENCE OWNED BY; Schema: financiero; Owner: franco
--

ALTER SEQUENCE financiero.retiro_id_seq OWNED BY financiero.retiro.id;


--
-- Name: sencillo; Type: TABLE; Schema: financiero; Owner: franco
--

CREATE TABLE financiero.sencillo (
    id bigint NOT NULL,
    responsable_id bigint,
    entrada boolean,
    autorizado_por_id bigint,
    observacion character varying,
    creado_en timestamp with time zone DEFAULT now(),
    usuario_id bigint
);


ALTER TABLE financiero.sencillo OWNER TO franco;

--
-- Name: sencillo_detalle; Type: TABLE; Schema: financiero; Owner: franco
--

CREATE TABLE financiero.sencillo_detalle (
    id bigint NOT NULL,
    sencillo_id bigint,
    moneda_id bigint NOT NULL,
    cambio_id bigint,
    cantidad numeric NOT NULL,
    creado_en timestamp with time zone DEFAULT now(),
    usuario_id bigint
);


ALTER TABLE financiero.sencillo_detalle OWNER TO franco;

--
-- Name: sencillo_detalle_id_seq; Type: SEQUENCE; Schema: financiero; Owner: franco
--

CREATE SEQUENCE financiero.sencillo_detalle_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE financiero.sencillo_detalle_id_seq OWNER TO franco;

--
-- Name: sencillo_detalle_id_seq; Type: SEQUENCE OWNED BY; Schema: financiero; Owner: franco
--

ALTER SEQUENCE financiero.sencillo_detalle_id_seq OWNED BY financiero.sencillo_detalle.id;


--
-- Name: sencillo_id_seq; Type: SEQUENCE; Schema: financiero; Owner: franco
--

CREATE SEQUENCE financiero.sencillo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE financiero.sencillo_id_seq OWNER TO franco;

--
-- Name: sencillo_id_seq; Type: SEQUENCE OWNED BY; Schema: financiero; Owner: franco
--

ALTER SEQUENCE financiero.sencillo_id_seq OWNED BY financiero.sencillo.id;


--
-- Name: tipo_gasto; Type: TABLE; Schema: financiero; Owner: franco
--

CREATE TABLE financiero.tipo_gasto (
    id bigint NOT NULL,
    is_clasificacion boolean,
    clasificacion_gasto_id bigint,
    descripcion character varying,
    activo boolean DEFAULT true,
    autorizacion boolean,
    cargo_id bigint,
    creado_en timestamp with time zone DEFAULT now(),
    usuario_id bigint,
    id_central bigint
);


ALTER TABLE financiero.tipo_gasto OWNER TO franco;

--
-- Name: tipo_gasto_id_seq; Type: SEQUENCE; Schema: financiero; Owner: franco
--

CREATE SEQUENCE financiero.tipo_gasto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE financiero.tipo_gasto_id_seq OWNER TO franco;

--
-- Name: tipo_gasto_id_seq; Type: SEQUENCE OWNED BY; Schema: financiero; Owner: franco
--

ALTER SEQUENCE financiero.tipo_gasto_id_seq OWNED BY financiero.tipo_gasto.id;


--
-- Name: barrio; Type: TABLE; Schema: general; Owner: franco
--

CREATE TABLE general.barrio (
    id bigint NOT NULL,
    descripcion character varying,
    ciudad_id bigint,
    precio_delivery_id bigint,
    usuario_id bigint,
    creado_en timestamp with time zone DEFAULT now(),
    id_central bigint
);


ALTER TABLE general.barrio OWNER TO franco;

--
-- Name: barrio_id_seq; Type: SEQUENCE; Schema: general; Owner: franco
--

CREATE SEQUENCE general.barrio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE general.barrio_id_seq OWNER TO franco;

--
-- Name: barrio_id_seq; Type: SEQUENCE OWNED BY; Schema: general; Owner: franco
--

ALTER SEQUENCE general.barrio_id_seq OWNED BY general.barrio.id;


--
-- Name: ciudad; Type: TABLE; Schema: general; Owner: franco
--

CREATE TABLE general.ciudad (
    id bigint NOT NULL,
    descripcion character varying,
    pais_id bigint,
    codigo character varying,
    usuario_id bigint,
    creado_en timestamp with time zone DEFAULT now()
);


ALTER TABLE general.ciudad OWNER TO franco;

--
-- Name: ciudad_id_seq; Type: SEQUENCE; Schema: general; Owner: franco
--

CREATE SEQUENCE general.ciudad_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE general.ciudad_id_seq OWNER TO franco;

--
-- Name: ciudad_id_seq; Type: SEQUENCE OWNED BY; Schema: general; Owner: franco
--

ALTER SEQUENCE general.ciudad_id_seq OWNED BY general.ciudad.id;


--
-- Name: contacto; Type: TABLE; Schema: general; Owner: franco
--

CREATE TABLE general.contacto (
    id bigint NOT NULL,
    email character varying,
    telefono character varying,
    persona_id bigint,
    usuario_id bigint,
    creado_en timestamp with time zone DEFAULT now()
);


ALTER TABLE general.contacto OWNER TO franco;

--
-- Name: contacto_id_seq; Type: SEQUENCE; Schema: general; Owner: franco
--

CREATE SEQUENCE general.contacto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE general.contacto_id_seq OWNER TO franco;

--
-- Name: contacto_id_seq; Type: SEQUENCE OWNED BY; Schema: general; Owner: franco
--

ALTER SEQUENCE general.contacto_id_seq OWNED BY general.contacto.id;


--
-- Name: pais; Type: TABLE; Schema: general; Owner: franco
--

CREATE TABLE general.pais (
    id bigint NOT NULL,
    descripcion character varying,
    codigo character varying,
    usuario_id bigint,
    creado_en timestamp with time zone DEFAULT now()
);


ALTER TABLE general.pais OWNER TO franco;

--
-- Name: pais_id_seq; Type: SEQUENCE; Schema: general; Owner: franco
--

CREATE SEQUENCE general.pais_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE general.pais_id_seq OWNER TO franco;

--
-- Name: pais_id_seq; Type: SEQUENCE OWNED BY; Schema: general; Owner: franco
--

ALTER SEQUENCE general.pais_id_seq OWNED BY general.pais.id;


--
-- Name: cobro; Type: TABLE; Schema: operaciones; Owner: franco
--

CREATE TABLE operaciones.cobro (
    id bigint NOT NULL,
    creado_en timestamp with time zone DEFAULT now(),
    usuario_id bigint,
    total_gs numeric
);


ALTER TABLE operaciones.cobro OWNER TO franco;

--
-- Name: cobro_detalle; Type: TABLE; Schema: operaciones; Owner: franco
--

CREATE TABLE operaciones.cobro_detalle (
    id bigint NOT NULL,
    cobro_id bigint,
    creado_en timestamp with time zone DEFAULT now(),
    usuario_id bigint,
    moneda_id bigint,
    forma_pago_id bigint,
    valor numeric,
    cambio numeric(19,0),
    vuelto boolean DEFAULT false,
    descuento boolean DEFAULT false,
    pago boolean DEFAULT true,
    aumento boolean DEFAULT false
);


ALTER TABLE operaciones.cobro_detalle OWNER TO franco;

--
-- Name: cobro_detalle_id_seq; Type: SEQUENCE; Schema: operaciones; Owner: franco
--

CREATE SEQUENCE operaciones.cobro_detalle_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE operaciones.cobro_detalle_id_seq OWNER TO franco;

--
-- Name: cobro_detalle_id_seq; Type: SEQUENCE OWNED BY; Schema: operaciones; Owner: franco
--

ALTER SEQUENCE operaciones.cobro_detalle_id_seq OWNED BY operaciones.cobro_detalle.id;


--
-- Name: cobro_id_seq; Type: SEQUENCE; Schema: operaciones; Owner: franco
--

CREATE SEQUENCE operaciones.cobro_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE operaciones.cobro_id_seq OWNER TO franco;

--
-- Name: cobro_id_seq; Type: SEQUENCE OWNED BY; Schema: operaciones; Owner: franco
--

ALTER SEQUENCE operaciones.cobro_id_seq OWNED BY operaciones.cobro.id;


--
-- Name: compra; Type: TABLE; Schema: operaciones; Owner: franco
--

CREATE TABLE operaciones.compra (
    id bigint NOT NULL,
    pedido_id bigint,
    sucursal_id bigint,
    proveedor_id bigint,
    contacto_proveedor_id bigint,
    fecha timestamp with time zone DEFAULT now(),
    nro_nota character varying,
    fecha_de_entrega timestamp without time zone,
    moneda_id bigint,
    descuento numeric DEFAULT 0,
    estado operaciones.compra_estado,
    creado_en timestamp with time zone DEFAULT now(),
    usuario_id bigint,
    forma_pago_id bigint
);


ALTER TABLE operaciones.compra OWNER TO franco;

--
-- Name: compra_id_seq; Type: SEQUENCE; Schema: operaciones; Owner: franco
--

CREATE SEQUENCE operaciones.compra_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE operaciones.compra_id_seq OWNER TO franco;

--
-- Name: compra_id_seq; Type: SEQUENCE OWNED BY; Schema: operaciones; Owner: franco
--

ALTER SEQUENCE operaciones.compra_id_seq OWNED BY operaciones.compra.id;


--
-- Name: compra_item; Type: TABLE; Schema: operaciones; Owner: franco
--

CREATE TABLE operaciones.compra_item (
    id bigint NOT NULL,
    compra_id bigint,
    producto_id bigint,
    cantidad numeric,
    precio_unitario numeric,
    descuento_unitario numeric,
    bonificacion boolean,
    frio boolean,
    observacion character varying,
    creado_en timestamp with time zone DEFAULT now(),
    usuario_id bigint,
    lote character varying,
    valor_total numeric,
    vencimiento timestamp(0) with time zone,
    presentacion_id bigint,
    pedido_item_id bigint,
    estado operaciones.compra_item_estado,
    verificado boolean DEFAULT false,
    programar_precio_id bigint
);


ALTER TABLE operaciones.compra_item OWNER TO franco;

--
-- Name: compra_item_id_seq; Type: SEQUENCE; Schema: operaciones; Owner: franco
--

CREATE SEQUENCE operaciones.compra_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE operaciones.compra_item_id_seq OWNER TO franco;

--
-- Name: compra_item_id_seq; Type: SEQUENCE OWNED BY; Schema: operaciones; Owner: franco
--

ALTER SEQUENCE operaciones.compra_item_id_seq OWNED BY operaciones.compra_item.id;


--
-- Name: delivery; Type: TABLE; Schema: operaciones; Owner: franco
--

CREATE TABLE operaciones.delivery (
    id bigint NOT NULL,
    venta_id bigint,
    valor_en_gs numeric,
    precio_delivery_id bigint,
    entregador_id bigint,
    telefono character varying,
    direccion character varying,
    cliente_id bigint,
    forma_pago_id bigint,
    creado_en timestamp with time zone DEFAULT now(),
    usuario_id bigint,
    estado operaciones.delivery_estado,
    barrio_id bigint,
    vehiculo_id bigint,
    vuelto_id bigint
);


ALTER TABLE operaciones.delivery OWNER TO franco;

--
-- Name: delivery_id_seq; Type: SEQUENCE; Schema: operaciones; Owner: franco
--

CREATE SEQUENCE operaciones.delivery_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE operaciones.delivery_id_seq OWNER TO franco;

--
-- Name: delivery_id_seq; Type: SEQUENCE OWNED BY; Schema: operaciones; Owner: franco
--

ALTER SEQUENCE operaciones.delivery_id_seq OWNED BY operaciones.delivery.id;


--
-- Name: entrada; Type: TABLE; Schema: operaciones; Owner: franco
--

CREATE TABLE operaciones.entrada (
    id bigint NOT NULL,
    responsable_carga_id bigint,
    tipo_entrada operaciones.tipo_entrada,
    observacion character varying,
    creado_en timestamp with time zone DEFAULT now(),
    usuario_id bigint,
    sucursal_id bigint,
    activo boolean DEFAULT false NOT NULL
);


ALTER TABLE operaciones.entrada OWNER TO franco;

--
-- Name: entrada_id_seq; Type: SEQUENCE; Schema: operaciones; Owner: franco
--

CREATE SEQUENCE operaciones.entrada_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE operaciones.entrada_id_seq OWNER TO franco;

--
-- Name: entrada_id_seq; Type: SEQUENCE OWNED BY; Schema: operaciones; Owner: franco
--

ALTER SEQUENCE operaciones.entrada_id_seq OWNED BY operaciones.entrada.id;


--
-- Name: entrada_item; Type: TABLE; Schema: operaciones; Owner: franco
--

CREATE TABLE operaciones.entrada_item (
    id bigint NOT NULL,
    producto_id bigint NOT NULL,
    presentacion_id bigint NOT NULL,
    cantidad numeric NOT NULL,
    observacion character varying,
    creado_en timestamp with time zone DEFAULT now() NOT NULL,
    usuario_id bigint,
    entrada_id bigint NOT NULL
);


ALTER TABLE operaciones.entrada_item OWNER TO franco;

--
-- Name: entrada_item_id_seq; Type: SEQUENCE; Schema: operaciones; Owner: franco
--

CREATE SEQUENCE operaciones.entrada_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE operaciones.entrada_item_id_seq OWNER TO franco;

--
-- Name: entrada_item_id_seq; Type: SEQUENCE OWNED BY; Schema: operaciones; Owner: franco
--

ALTER SEQUENCE operaciones.entrada_item_id_seq OWNED BY operaciones.entrada_item.id;


--
-- Name: inventario; Type: TABLE; Schema: operaciones; Owner: franco
--

CREATE TABLE operaciones.inventario (
    id bigint NOT NULL,
    id_central bigint,
    id_origen bigint,
    sucursal_id bigint,
    fecha_inicio timestamp without time zone,
    fecha_fin timestamp without time zone,
    abierto boolean,
    tipo operaciones.tipo_inventario,
    estado operaciones.inventario_estado,
    usuario_id bigint,
    observacion character varying
);


ALTER TABLE operaciones.inventario OWNER TO franco;

--
-- Name: inventario_id_seq; Type: SEQUENCE; Schema: operaciones; Owner: franco
--

CREATE SEQUENCE operaciones.inventario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE operaciones.inventario_id_seq OWNER TO franco;

--
-- Name: inventario_id_seq; Type: SEQUENCE OWNED BY; Schema: operaciones; Owner: franco
--

ALTER SEQUENCE operaciones.inventario_id_seq OWNED BY operaciones.inventario.id;


--
-- Name: inventario_producto; Type: TABLE; Schema: operaciones; Owner: franco
--

CREATE TABLE operaciones.inventario_producto (
    id bigint NOT NULL,
    id_central bigint,
    id_origen bigint,
    inventario_id bigint NOT NULL,
    producto_id bigint,
    zona_id bigint,
    concluido boolean,
    usuario_id bigint,
    creado_en timestamp without time zone
);


ALTER TABLE operaciones.inventario_producto OWNER TO franco;

--
-- Name: inventario_producto_id_seq; Type: SEQUENCE; Schema: operaciones; Owner: franco
--

CREATE SEQUENCE operaciones.inventario_producto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE operaciones.inventario_producto_id_seq OWNER TO franco;

--
-- Name: inventario_producto_id_seq; Type: SEQUENCE OWNED BY; Schema: operaciones; Owner: franco
--

ALTER SEQUENCE operaciones.inventario_producto_id_seq OWNED BY operaciones.inventario_producto.id;


--
-- Name: inventario_producto_item; Type: TABLE; Schema: operaciones; Owner: franco
--

CREATE TABLE operaciones.inventario_producto_item (
    id bigint NOT NULL,
    id_central bigint,
    id_origen bigint,
    inventario_producto_id bigint NOT NULL,
    presentacion_id bigint NOT NULL,
    zona_id bigint,
    cantidad numeric,
    vencimiento timestamp without time zone,
    estado operaciones.inventario_producto_estado,
    usuario_id bigint,
    creado_en timestamp without time zone,
    cantidad_fisica numeric
);


ALTER TABLE operaciones.inventario_producto_item OWNER TO franco;

--
-- Name: inventario_producto_item_id_seq; Type: SEQUENCE; Schema: operaciones; Owner: franco
--

CREATE SEQUENCE operaciones.inventario_producto_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE operaciones.inventario_producto_item_id_seq OWNER TO franco;

--
-- Name: inventario_producto_item_id_seq; Type: SEQUENCE OWNED BY; Schema: operaciones; Owner: franco
--

ALTER SEQUENCE operaciones.inventario_producto_item_id_seq OWNED BY operaciones.inventario_producto_item.id;


--
-- Name: motivo_diferencia_pedido; Type: TABLE; Schema: operaciones; Owner: franco
--

CREATE TABLE operaciones.motivo_diferencia_pedido (
    id bigint NOT NULL,
    tipo character varying,
    descripcion character varying,
    creado_en timestamp with time zone DEFAULT now(),
    usuario_id bigint
);


ALTER TABLE operaciones.motivo_diferencia_pedido OWNER TO franco;

--
-- Name: motivo_diferencia_pedido_id_seq; Type: SEQUENCE; Schema: operaciones; Owner: franco
--

CREATE SEQUENCE operaciones.motivo_diferencia_pedido_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE operaciones.motivo_diferencia_pedido_id_seq OWNER TO franco;

--
-- Name: motivo_diferencia_pedido_id_seq; Type: SEQUENCE OWNED BY; Schema: operaciones; Owner: franco
--

ALTER SEQUENCE operaciones.motivo_diferencia_pedido_id_seq OWNED BY operaciones.motivo_diferencia_pedido.id;


--
-- Name: movimiento_stock; Type: TABLE; Schema: operaciones; Owner: franco
--

CREATE TABLE operaciones.movimiento_stock (
    id bigint NOT NULL,
    producto_id bigint NOT NULL,
    tipo_movimiento operaciones.tipo_movimiento NOT NULL,
    referencia bigint NOT NULL,
    cantidad numeric DEFAULT 0 NOT NULL,
    creado_en timestamp with time zone DEFAULT now(),
    usuario_id bigint,
    estado boolean DEFAULT true,
    sucursal_id bigint
);


ALTER TABLE operaciones.movimiento_stock OWNER TO franco;

--
-- Name: movimiento_stock_id_seq; Type: SEQUENCE; Schema: operaciones; Owner: franco
--

CREATE SEQUENCE operaciones.movimiento_stock_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE operaciones.movimiento_stock_id_seq OWNER TO franco;

--
-- Name: movimiento_stock_id_seq; Type: SEQUENCE OWNED BY; Schema: operaciones; Owner: franco
--

ALTER SEQUENCE operaciones.movimiento_stock_id_seq OWNED BY operaciones.movimiento_stock.id;


--
-- Name: necesidad; Type: TABLE; Schema: operaciones; Owner: franco
--

CREATE TABLE operaciones.necesidad (
    id bigint NOT NULL,
    sucursal_id bigint,
    fecha timestamp with time zone DEFAULT now(),
    estado operaciones.necesidad_estado,
    creado_en timestamp with time zone DEFAULT now(),
    usuario_id bigint
);


ALTER TABLE operaciones.necesidad OWNER TO franco;

--
-- Name: necesidad_id_seq; Type: SEQUENCE; Schema: operaciones; Owner: franco
--

CREATE SEQUENCE operaciones.necesidad_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE operaciones.necesidad_id_seq OWNER TO franco;

--
-- Name: necesidad_id_seq; Type: SEQUENCE OWNED BY; Schema: operaciones; Owner: franco
--

ALTER SEQUENCE operaciones.necesidad_id_seq OWNED BY operaciones.necesidad.id;


--
-- Name: necesidad_item; Type: TABLE; Schema: operaciones; Owner: franco
--

CREATE TABLE operaciones.necesidad_item (
    id bigint NOT NULL,
    autogenerado boolean DEFAULT true,
    cantidad_sugerida numeric DEFAULT 0,
    modificado boolean DEFAULT false,
    necesidad_id bigint,
    producto_id bigint,
    cantidad numeric DEFAULT 0,
    observacion character varying,
    estado operaciones.necesidad_item_estado,
    creado_en timestamp with time zone DEFAULT now(),
    usuario_id bigint,
    frio boolean DEFAULT false
);


ALTER TABLE operaciones.necesidad_item OWNER TO franco;

--
-- Name: necesidad_item_id_seq; Type: SEQUENCE; Schema: operaciones; Owner: franco
--

CREATE SEQUENCE operaciones.necesidad_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE operaciones.necesidad_item_id_seq OWNER TO franco;

--
-- Name: necesidad_item_id_seq; Type: SEQUENCE OWNED BY; Schema: operaciones; Owner: franco
--

ALTER SEQUENCE operaciones.necesidad_item_id_seq OWNED BY operaciones.necesidad_item.id;


--
-- Name: nota_pedido; Type: TABLE; Schema: operaciones; Owner: franco
--

CREATE TABLE operaciones.nota_pedido (
    id bigint NOT NULL,
    pedido_id bigint,
    nro_nota character varying,
    creado_en timestamp with time zone DEFAULT now(),
    usuario_id bigint
);


ALTER TABLE operaciones.nota_pedido OWNER TO franco;

--
-- Name: nota_pedido_id_seq; Type: SEQUENCE; Schema: operaciones; Owner: franco
--

CREATE SEQUENCE operaciones.nota_pedido_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE operaciones.nota_pedido_id_seq OWNER TO franco;

--
-- Name: nota_pedido_id_seq; Type: SEQUENCE OWNED BY; Schema: operaciones; Owner: franco
--

ALTER SEQUENCE operaciones.nota_pedido_id_seq OWNED BY operaciones.nota_pedido.id;


--
-- Name: nota_recepcion; Type: TABLE; Schema: operaciones; Owner: franco
--

CREATE TABLE operaciones.nota_recepcion (
    id bigint NOT NULL,
    pedido_id bigint,
    compra_id bigint,
    documento_id bigint,
    valor numeric,
    descuento numeric,
    pagado boolean,
    numero numeric,
    timbrado numeric,
    creado_en timestamp without time zone,
    usuario_id bigint
);


ALTER TABLE operaciones.nota_recepcion OWNER TO franco;

--
-- Name: nota_recepcion_id_seq; Type: SEQUENCE; Schema: operaciones; Owner: franco
--

CREATE SEQUENCE operaciones.nota_recepcion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE operaciones.nota_recepcion_id_seq OWNER TO franco;

--
-- Name: nota_recepcion_id_seq; Type: SEQUENCE OWNED BY; Schema: operaciones; Owner: franco
--

ALTER SEQUENCE operaciones.nota_recepcion_id_seq OWNED BY operaciones.nota_recepcion.id;


--
-- Name: nota_recepcion_item; Type: TABLE; Schema: operaciones; Owner: franco
--

CREATE TABLE operaciones.nota_recepcion_item (
    id bigint NOT NULL,
    nota_recepcion_id bigint,
    pedido_item_id bigint,
    creado_en timestamp without time zone,
    usuario_id bigint
);


ALTER TABLE operaciones.nota_recepcion_item OWNER TO franco;

--
-- Name: nota_recepcion_item_id_seq; Type: SEQUENCE; Schema: operaciones; Owner: franco
--

CREATE SEQUENCE operaciones.nota_recepcion_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE operaciones.nota_recepcion_item_id_seq OWNER TO franco;

--
-- Name: nota_recepcion_item_id_seq; Type: SEQUENCE OWNED BY; Schema: operaciones; Owner: franco
--

ALTER SEQUENCE operaciones.nota_recepcion_item_id_seq OWNED BY operaciones.nota_recepcion_item.id;


--
-- Name: pedido; Type: TABLE; Schema: operaciones; Owner: franco
--

CREATE TABLE operaciones.pedido (
    id bigint NOT NULL,
    necesidad_id bigint,
    proveedor_id bigint,
    vendedor_id bigint,
    fecha_de_entrega timestamp without time zone,
    plazo_credito integer,
    moneda_id bigint,
    descuento numeric DEFAULT 0,
    estado operaciones.pedido_estado,
    creado_en timestamp with time zone DEFAULT now(),
    usuario_id bigint,
    cantidad_notas integer,
    cod_interno_proveedor character varying,
    forma_pago_id bigint
);


ALTER TABLE operaciones.pedido OWNER TO franco;

--
-- Name: pedido_id_seq; Type: SEQUENCE; Schema: operaciones; Owner: franco
--

CREATE SEQUENCE operaciones.pedido_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE operaciones.pedido_id_seq OWNER TO franco;

--
-- Name: pedido_id_seq; Type: SEQUENCE OWNED BY; Schema: operaciones; Owner: franco
--

ALTER SEQUENCE operaciones.pedido_id_seq OWNED BY operaciones.pedido.id;


--
-- Name: pedido_item; Type: TABLE; Schema: operaciones; Owner: franco
--

CREATE TABLE operaciones.pedido_item (
    id bigint NOT NULL,
    pedido_id bigint,
    producto_id bigint,
    precio_unitario numeric DEFAULT 0,
    descuento_unitario numeric DEFAULT 0,
    bonificacion boolean DEFAULT false,
    frio boolean DEFAULT false,
    observacion character varying,
    estado operaciones.pedido_item_estado,
    creado_en timestamp with time zone DEFAULT now(),
    usuario_id bigint,
    nota_pedido_id bigint,
    bonificacion_detalle character varying,
    vencimiento timestamp(0) without time zone,
    presentacion_id bigint,
    cantidad numeric,
    nota_recepcion_id bigint
);


ALTER TABLE operaciones.pedido_item OWNER TO franco;

--
-- Name: pedido_item_id_seq; Type: SEQUENCE; Schema: operaciones; Owner: franco
--

CREATE SEQUENCE operaciones.pedido_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE operaciones.pedido_item_id_seq OWNER TO franco;

--
-- Name: pedido_item_id_seq; Type: SEQUENCE OWNED BY; Schema: operaciones; Owner: franco
--

ALTER SEQUENCE operaciones.pedido_item_id_seq OWNED BY operaciones.pedido_item.id;


--
-- Name: pedido_item_sucursal; Type: TABLE; Schema: operaciones; Owner: franco
--

CREATE TABLE operaciones.pedido_item_sucursal (
    id bigint NOT NULL,
    pedido_item_id bigint,
    sucursal_id bigint,
    sucursal_entrega_id bigint,
    cantidad numeric DEFAULT 0,
    creado_en timestamp with time zone DEFAULT now(),
    usuario_id bigint
);


ALTER TABLE operaciones.pedido_item_sucursal OWNER TO franco;

--
-- Name: pedido_item_sucursal_id_seq; Type: SEQUENCE; Schema: operaciones; Owner: franco
--

CREATE SEQUENCE operaciones.pedido_item_sucursal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE operaciones.pedido_item_sucursal_id_seq OWNER TO franco;

--
-- Name: pedido_item_sucursal_id_seq; Type: SEQUENCE OWNED BY; Schema: operaciones; Owner: franco
--

ALTER SEQUENCE operaciones.pedido_item_sucursal_id_seq OWNED BY operaciones.pedido_item_sucursal.id;


--
-- Name: precio_delivery; Type: TABLE; Schema: operaciones; Owner: franco
--

CREATE TABLE operaciones.precio_delivery (
    id bigint NOT NULL,
    descripcion character varying,
    valor numeric,
    activo boolean DEFAULT true,
    creado_en timestamp with time zone DEFAULT now(),
    usuario_id bigint
);


ALTER TABLE operaciones.precio_delivery OWNER TO franco;

--
-- Name: precio_delivery_id_seq; Type: SEQUENCE; Schema: operaciones; Owner: franco
--

CREATE SEQUENCE operaciones.precio_delivery_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE operaciones.precio_delivery_id_seq OWNER TO franco;

--
-- Name: precio_delivery_id_seq; Type: SEQUENCE OWNED BY; Schema: operaciones; Owner: franco
--

ALTER SEQUENCE operaciones.precio_delivery_id_seq OWNED BY operaciones.precio_delivery.id;


--
-- Name: programar_precio; Type: TABLE; Schema: operaciones; Owner: franco
--

CREATE TABLE operaciones.programar_precio (
    id bigint NOT NULL,
    precio_id bigint NOT NULL,
    momento_cambio operaciones.cambio_precio_momento DEFAULT 'INMEDIATO'::operaciones.cambio_precio_momento,
    nuevo_precio numeric NOT NULL,
    fecha_cambio timestamp without time zone NOT NULL,
    cantidad numeric,
    creado_en timestamp with time zone DEFAULT now(),
    usuario_id bigint
);


ALTER TABLE operaciones.programar_precio OWNER TO franco;

--
-- Name: programar_precio_id_seq; Type: SEQUENCE; Schema: operaciones; Owner: franco
--

CREATE SEQUENCE operaciones.programar_precio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE operaciones.programar_precio_id_seq OWNER TO franco;

--
-- Name: programar_precio_id_seq; Type: SEQUENCE OWNED BY; Schema: operaciones; Owner: franco
--

ALTER SEQUENCE operaciones.programar_precio_id_seq OWNED BY operaciones.programar_precio.id;


--
-- Name: salida; Type: TABLE; Schema: operaciones; Owner: franco
--

CREATE TABLE operaciones.salida (
    id bigint NOT NULL,
    responsable_carga_id bigint,
    tipo_salida operaciones.tipo_salida,
    sucursal_id bigint,
    observacion character varying,
    creado_en timestamp with time zone DEFAULT now() NOT NULL,
    usuario_id bigint,
    activo boolean DEFAULT false NOT NULL
);


ALTER TABLE operaciones.salida OWNER TO franco;

--
-- Name: salida_id_seq; Type: SEQUENCE; Schema: operaciones; Owner: franco
--

CREATE SEQUENCE operaciones.salida_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE operaciones.salida_id_seq OWNER TO franco;

--
-- Name: salida_id_seq; Type: SEQUENCE OWNED BY; Schema: operaciones; Owner: franco
--

ALTER SEQUENCE operaciones.salida_id_seq OWNED BY operaciones.salida.id;


--
-- Name: salida_item; Type: TABLE; Schema: operaciones; Owner: franco
--

CREATE TABLE operaciones.salida_item (
    id bigint NOT NULL,
    producto_id bigint NOT NULL,
    presentacion_id bigint NOT NULL,
    cantidad numeric NOT NULL,
    observacion character varying,
    creado_en timestamp with time zone DEFAULT now() NOT NULL,
    usuario_id bigint,
    salida_id bigint NOT NULL
);


ALTER TABLE operaciones.salida_item OWNER TO franco;

--
-- Name: salida_item_id_seq; Type: SEQUENCE; Schema: operaciones; Owner: franco
--

CREATE SEQUENCE operaciones.salida_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE operaciones.salida_item_id_seq OWNER TO franco;

--
-- Name: salida_item_id_seq; Type: SEQUENCE OWNED BY; Schema: operaciones; Owner: franco
--

ALTER SEQUENCE operaciones.salida_item_id_seq OWNED BY operaciones.salida_item.id;


--
-- Name: transferencia; Type: TABLE; Schema: operaciones; Owner: franco
--

CREATE TABLE operaciones.transferencia (
    id bigint NOT NULL,
    sucursal_origen_id bigint NOT NULL,
    sucursal_destino_id bigint NOT NULL,
    estado operaciones.transferencia_estado,
    tipo operaciones.tipo_transferencia,
    etapa operaciones.etapa_transferencia,
    observacion text,
    is_origen boolean,
    is_destino boolean,
    usuario_pre_transferencia_id bigint NOT NULL,
    usuario_preparacion_id bigint,
    usuario_transporte_id bigint,
    usuario_recepcion_id bigint,
    creado_en timestamp without time zone
);


ALTER TABLE operaciones.transferencia OWNER TO franco;

--
-- Name: transferencia_id_seq; Type: SEQUENCE; Schema: operaciones; Owner: franco
--

CREATE SEQUENCE operaciones.transferencia_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE operaciones.transferencia_id_seq OWNER TO franco;

--
-- Name: transferencia_id_seq; Type: SEQUENCE OWNED BY; Schema: operaciones; Owner: franco
--

ALTER SEQUENCE operaciones.transferencia_id_seq OWNED BY operaciones.transferencia.id;


--
-- Name: transferencia_item; Type: TABLE; Schema: operaciones; Owner: franco
--

CREATE TABLE operaciones.transferencia_item (
    id bigint NOT NULL,
    transferencia_id bigint NOT NULL,
    presentacion_pre_transferencia_id bigint NOT NULL,
    presentacion_preparacion_id bigint,
    presentacion_transporte_id bigint,
    presentacion_recepcion_id bigint,
    cantidad_pre_transferencia numeric,
    cantidad_preparacion numeric,
    cantidad_transporte numeric,
    cantidad_recepcion numeric,
    observacion_pre_transferencia character varying,
    observacion_preparacion character varying,
    observacion_transporte character varying,
    observacion_recepcion character varying,
    vencimiento_pre_transferencia timestamp without time zone,
    vencimiento_preparacion timestamp without time zone,
    vencimiento_transporte timestamp without time zone,
    vencimiento_recepcion timestamp without time zone,
    motivo_modificacion_pre_transferencia operaciones.transferencia_item_motivo_modificacion,
    motivo_modificacion_preparacion operaciones.transferencia_item_motivo_modificacion,
    motivo_modificacion_transporte operaciones.transferencia_item_motivo_modificacion,
    motivo_modificacion_recepcion operaciones.transferencia_item_motivo_modificacion,
    motivo_rechazo_pre_transferencia operaciones.transferencia_item_motivo_rechazo,
    motivo_rechazo_preparacion operaciones.transferencia_item_motivo_rechazo,
    motivo_rechazo_transporte operaciones.transferencia_item_motivo_rechazo,
    motivo_rechazo_recepcion operaciones.transferencia_item_motivo_rechazo,
    activo boolean DEFAULT true,
    posee_vencimiento boolean DEFAULT true NOT NULL,
    usuario_id bigint NOT NULL,
    creado_en timestamp without time zone
);


ALTER TABLE operaciones.transferencia_item OWNER TO franco;

--
-- Name: transferencia_item_id_seq; Type: SEQUENCE; Schema: operaciones; Owner: franco
--

CREATE SEQUENCE operaciones.transferencia_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE operaciones.transferencia_item_id_seq OWNER TO franco;

--
-- Name: transferencia_item_id_seq; Type: SEQUENCE OWNED BY; Schema: operaciones; Owner: franco
--

ALTER SEQUENCE operaciones.transferencia_item_id_seq OWNED BY operaciones.transferencia_item.id;


--
-- Name: venta; Type: TABLE; Schema: operaciones; Owner: franco
--

CREATE TABLE operaciones.venta (
    id bigint NOT NULL,
    cliente_id bigint,
    creado_en timestamp with time zone DEFAULT now(),
    usuario_id bigint,
    estado operaciones.venta_estado,
    total_gs numeric,
    total_rs numeric,
    total_ds numeric,
    forma_pago_id bigint,
    cobro_id bigint,
    caja_id bigint
);


ALTER TABLE operaciones.venta OWNER TO franco;

--
-- Name: venta_id_seq; Type: SEQUENCE; Schema: operaciones; Owner: franco
--

CREATE SEQUENCE operaciones.venta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE operaciones.venta_id_seq OWNER TO franco;

--
-- Name: venta_id_seq; Type: SEQUENCE OWNED BY; Schema: operaciones; Owner: franco
--

ALTER SEQUENCE operaciones.venta_id_seq OWNED BY operaciones.venta.id;


--
-- Name: venta_item; Type: TABLE; Schema: operaciones; Owner: franco
--

CREATE TABLE operaciones.venta_item (
    id bigint NOT NULL,
    venta_id bigint,
    unidad_medida productos.unidad_medida,
    precio_id bigint,
    costo_unitario numeric,
    existencia numeric,
    producto_id bigint,
    cantidad numeric,
    creado_en timestamp with time zone DEFAULT now(),
    usuario_id bigint,
    descuento_unitario numeric DEFAULT 0,
    presentacion_id bigint,
    activo boolean DEFAULT true
);


ALTER TABLE operaciones.venta_item OWNER TO franco;

--
-- Name: venta_item_id_seq; Type: SEQUENCE; Schema: operaciones; Owner: franco
--

CREATE SEQUENCE operaciones.venta_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE operaciones.venta_item_id_seq OWNER TO franco;

--
-- Name: venta_item_id_seq; Type: SEQUENCE OWNED BY; Schema: operaciones; Owner: franco
--

ALTER SEQUENCE operaciones.venta_item_id_seq OWNED BY operaciones.venta_item.id;


--
-- Name: vuelto; Type: TABLE; Schema: operaciones; Owner: franco
--

CREATE TABLE operaciones.vuelto (
    id bigint NOT NULL,
    autorizado_por_id bigint,
    responsable_id bigint,
    creado_en timestamp with time zone DEFAULT now(),
    usuario_id bigint,
    activo boolean DEFAULT true
);


ALTER TABLE operaciones.vuelto OWNER TO franco;

--
-- Name: vuelto_id_seq; Type: SEQUENCE; Schema: operaciones; Owner: franco
--

CREATE SEQUENCE operaciones.vuelto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE operaciones.vuelto_id_seq OWNER TO franco;

--
-- Name: vuelto_id_seq; Type: SEQUENCE OWNED BY; Schema: operaciones; Owner: franco
--

ALTER SEQUENCE operaciones.vuelto_id_seq OWNED BY operaciones.vuelto.id;


--
-- Name: vuelto_item; Type: TABLE; Schema: operaciones; Owner: franco
--

CREATE TABLE operaciones.vuelto_item (
    id bigint NOT NULL,
    vuelto_id bigint,
    valor numeric,
    moneda_id bigint,
    creado_en timestamp with time zone DEFAULT now(),
    usuario_id bigint
);


ALTER TABLE operaciones.vuelto_item OWNER TO franco;

--
-- Name: vuelto_item_id_seq; Type: SEQUENCE; Schema: operaciones; Owner: franco
--

CREATE SEQUENCE operaciones.vuelto_item_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE operaciones.vuelto_item_id_seq OWNER TO franco;

--
-- Name: vuelto_item_id_seq; Type: SEQUENCE OWNED BY; Schema: operaciones; Owner: franco
--

ALTER SEQUENCE operaciones.vuelto_item_id_seq OWNED BY operaciones.vuelto_item.id;


--
-- Name: cliente; Type: TABLE; Schema: personas; Owner: franco
--

CREATE TABLE personas.cliente (
    id bigint NOT NULL,
    persona_id bigint,
    credito numeric DEFAULT 0,
    usuario_id bigint,
    creado_en timestamp with time zone DEFAULT now(),
    id_central bigint
);


ALTER TABLE personas.cliente OWNER TO franco;

--
-- Name: cliente_id_seq; Type: SEQUENCE; Schema: personas; Owner: franco
--

CREATE SEQUENCE personas.cliente_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE personas.cliente_id_seq OWNER TO franco;

--
-- Name: cliente_id_seq; Type: SEQUENCE OWNED BY; Schema: personas; Owner: franco
--

ALTER SEQUENCE personas.cliente_id_seq OWNED BY personas.cliente.id;


--
-- Name: funcionario; Type: TABLE; Schema: personas; Owner: franco
--

CREATE TABLE personas.funcionario (
    id bigint NOT NULL,
    persona_id bigint,
    cargo_id bigint,
    credito numeric DEFAULT 0,
    fecha_ingreso timestamp without time zone DEFAULT now(),
    sueldo numeric DEFAULT 0,
    sector bigint,
    supervisado_por_id bigint,
    sucursal_id bigint,
    fase_prueba boolean DEFAULT true,
    diarista boolean DEFAULT false,
    usuario_id bigint,
    creado_en timestamp with time zone DEFAULT now(),
    activo boolean DEFAULT true NOT NULL,
    id_central bigint
);


ALTER TABLE personas.funcionario OWNER TO franco;

--
-- Name: funcionario_id_seq; Type: SEQUENCE; Schema: personas; Owner: franco
--

CREATE SEQUENCE personas.funcionario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE personas.funcionario_id_seq OWNER TO franco;

--
-- Name: funcionario_id_seq; Type: SEQUENCE OWNED BY; Schema: personas; Owner: franco
--

ALTER SEQUENCE personas.funcionario_id_seq OWNED BY personas.funcionario.id;


--
-- Name: grupo_privilegio; Type: TABLE; Schema: personas; Owner: franco
--

CREATE TABLE personas.grupo_privilegio (
    id bigint NOT NULL,
    descripcion character varying NOT NULL,
    usuario_id bigint,
    creado_en timestamp with time zone DEFAULT now()
);


ALTER TABLE personas.grupo_privilegio OWNER TO franco;

--
-- Name: grupo_privilegio_id_seq; Type: SEQUENCE; Schema: personas; Owner: franco
--

CREATE SEQUENCE personas.grupo_privilegio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE personas.grupo_privilegio_id_seq OWNER TO franco;

--
-- Name: grupo_privilegio_id_seq; Type: SEQUENCE OWNED BY; Schema: personas; Owner: franco
--

ALTER SEQUENCE personas.grupo_privilegio_id_seq OWNED BY personas.grupo_privilegio.id;


--
-- Name: persona; Type: TABLE; Schema: personas; Owner: franco
--

CREATE TABLE personas.persona (
    id bigint NOT NULL,
    nombre character varying,
    apodo character varying,
    documento character varying,
    nacimiento timestamp with time zone,
    sexo character varying,
    direccion character varying,
    ciudad_id bigint,
    telefono character varying,
    social_media character varying,
    imagenes character varying,
    creado_en timestamp with time zone DEFAULT now(),
    usuario_id bigint,
    email character varying,
    id_central bigint
);


ALTER TABLE personas.persona OWNER TO franco;

--
-- Name: persona_id_seq; Type: SEQUENCE; Schema: personas; Owner: franco
--

CREATE SEQUENCE personas.persona_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE personas.persona_id_seq OWNER TO franco;

--
-- Name: persona_id_seq; Type: SEQUENCE OWNED BY; Schema: personas; Owner: franco
--

ALTER SEQUENCE personas.persona_id_seq OWNED BY personas.persona.id;


--
-- Name: proveedor; Type: TABLE; Schema: personas; Owner: franco
--

CREATE TABLE personas.proveedor (
    id bigint NOT NULL,
    persona_id bigint,
    credito boolean DEFAULT false,
    tipo_credito character varying,
    cheque_dias numeric,
    datos_bancarios_id bigint,
    usuario_id bigint,
    creado_en timestamp with time zone DEFAULT now(),
    funcionario_encargado_id bigint
);


ALTER TABLE personas.proveedor OWNER TO franco;

--
-- Name: proveedor_dias_visita; Type: TABLE; Schema: personas; Owner: franco
--

CREATE TABLE personas.proveedor_dias_visita (
    id bigint NOT NULL,
    proveedor_id bigint,
    dia general.dias_semana,
    hora integer,
    observacion character varying,
    usuario_id bigint,
    creado_en timestamp with time zone DEFAULT now()
);


ALTER TABLE personas.proveedor_dias_visita OWNER TO franco;

--
-- Name: proveedor_dias_visita_id_seq; Type: SEQUENCE; Schema: personas; Owner: franco
--

CREATE SEQUENCE personas.proveedor_dias_visita_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE personas.proveedor_dias_visita_id_seq OWNER TO franco;

--
-- Name: proveedor_dias_visita_id_seq; Type: SEQUENCE OWNED BY; Schema: personas; Owner: franco
--

ALTER SEQUENCE personas.proveedor_dias_visita_id_seq OWNED BY personas.proveedor_dias_visita.id;


--
-- Name: proveedor_id_seq; Type: SEQUENCE; Schema: personas; Owner: franco
--

CREATE SEQUENCE personas.proveedor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE personas.proveedor_id_seq OWNER TO franco;

--
-- Name: proveedor_id_seq; Type: SEQUENCE OWNED BY; Schema: personas; Owner: franco
--

ALTER SEQUENCE personas.proveedor_id_seq OWNED BY personas.proveedor.id;


--
-- Name: role; Type: TABLE; Schema: personas; Owner: franco
--

CREATE TABLE personas.role (
    id bigint NOT NULL,
    nombre character varying,
    usuario_id bigint,
    creado_en timestamp with time zone DEFAULT now()
);


ALTER TABLE personas.role OWNER TO franco;

--
-- Name: role_id_seq; Type: SEQUENCE; Schema: personas; Owner: franco
--

CREATE SEQUENCE personas.role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE personas.role_id_seq OWNER TO franco;

--
-- Name: role_id_seq; Type: SEQUENCE OWNED BY; Schema: personas; Owner: franco
--

ALTER SEQUENCE personas.role_id_seq OWNED BY personas.role.id;


--
-- Name: usuario; Type: TABLE; Schema: personas; Owner: franco
--

CREATE TABLE personas.usuario (
    id bigint NOT NULL,
    persona_id bigint,
    password character varying,
    usuario_id bigint,
    creado_en timestamp with time zone DEFAULT now(),
    nickname character varying,
    email character varying,
    activo boolean DEFAULT true
);


ALTER TABLE personas.usuario OWNER TO franco;

--
-- Name: usuario_grupo; Type: TABLE; Schema: personas; Owner: franco
--

CREATE TABLE personas.usuario_grupo (
    id bigint NOT NULL,
    usuario_id bigint NOT NULL,
    grupo_privilegio_id bigint NOT NULL,
    modificado boolean DEFAULT false,
    creado_en timestamp with time zone DEFAULT now()
);


ALTER TABLE personas.usuario_grupo OWNER TO franco;

--
-- Name: usuario_grupo_id_seq; Type: SEQUENCE; Schema: personas; Owner: franco
--

CREATE SEQUENCE personas.usuario_grupo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE personas.usuario_grupo_id_seq OWNER TO franco;

--
-- Name: usuario_grupo_id_seq; Type: SEQUENCE OWNED BY; Schema: personas; Owner: franco
--

ALTER SEQUENCE personas.usuario_grupo_id_seq OWNED BY personas.usuario_grupo.id;


--
-- Name: usuario_id_seq; Type: SEQUENCE; Schema: personas; Owner: franco
--

CREATE SEQUENCE personas.usuario_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE personas.usuario_id_seq OWNER TO franco;

--
-- Name: usuario_id_seq; Type: SEQUENCE OWNED BY; Schema: personas; Owner: franco
--

ALTER SEQUENCE personas.usuario_id_seq OWNED BY personas.usuario.id;


--
-- Name: usuario_role; Type: TABLE; Schema: personas; Owner: franco
--

CREATE TABLE personas.usuario_role (
    id bigint NOT NULL,
    role_id bigint,
    user_id bigint,
    usuario_id bigint,
    creado_en timestamp with time zone DEFAULT now(),
    id_central bigint
);


ALTER TABLE personas.usuario_role OWNER TO franco;

--
-- Name: usuario_role_id_seq; Type: SEQUENCE; Schema: personas; Owner: franco
--

CREATE SEQUENCE personas.usuario_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE personas.usuario_role_id_seq OWNER TO franco;

--
-- Name: usuario_role_id_seq; Type: SEQUENCE OWNED BY; Schema: personas; Owner: franco
--

ALTER SEQUENCE personas.usuario_role_id_seq OWNED BY personas.usuario_role.id;


--
-- Name: vendedor; Type: TABLE; Schema: personas; Owner: franco
--

CREATE TABLE personas.vendedor (
    id bigint NOT NULL,
    persona_id bigint,
    activo boolean DEFAULT true,
    observacion character varying,
    usuario_id bigint,
    creado_en timestamp with time zone DEFAULT now(),
    id_central bigint
);


ALTER TABLE personas.vendedor OWNER TO franco;

--
-- Name: vendedor_id_seq; Type: SEQUENCE; Schema: personas; Owner: franco
--

CREATE SEQUENCE personas.vendedor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE personas.vendedor_id_seq OWNER TO franco;

--
-- Name: vendedor_id_seq; Type: SEQUENCE OWNED BY; Schema: personas; Owner: franco
--

ALTER SEQUENCE personas.vendedor_id_seq OWNED BY personas.vendedor.id;


--
-- Name: vendedor_proveedor; Type: TABLE; Schema: personas; Owner: franco
--

CREATE TABLE personas.vendedor_proveedor (
    id bigint NOT NULL,
    vendedor_id bigint,
    proveedor_id bigint,
    activo boolean DEFAULT true,
    usuario_id bigint,
    creado_en timestamp with time zone DEFAULT now(),
    id_central bigint
);


ALTER TABLE personas.vendedor_proveedor OWNER TO franco;

--
-- Name: vendedor_proveedor_id_seq; Type: SEQUENCE; Schema: personas; Owner: franco
--

CREATE SEQUENCE personas.vendedor_proveedor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE personas.vendedor_proveedor_id_seq OWNER TO franco;

--
-- Name: vendedor_proveedor_id_seq; Type: SEQUENCE OWNED BY; Schema: personas; Owner: franco
--

ALTER SEQUENCE personas.vendedor_proveedor_id_seq OWNED BY personas.vendedor_proveedor.id;


--
-- Name: codigo; Type: TABLE; Schema: productos; Owner: franco
--

CREATE TABLE productos.codigo (
    id bigint NOT NULL,
    codigo character varying,
    principal boolean,
    usuario_id bigint,
    creado_en timestamp with time zone DEFAULT now(),
    activo boolean,
    presentacion_id bigint NOT NULL,
    id_central bigint
);


ALTER TABLE productos.codigo OWNER TO franco;

--
-- Name: codigo_id_seq; Type: SEQUENCE; Schema: productos; Owner: franco
--

CREATE SEQUENCE productos.codigo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE productos.codigo_id_seq OWNER TO franco;

--
-- Name: codigo_id_seq; Type: SEQUENCE OWNED BY; Schema: productos; Owner: franco
--

ALTER SEQUENCE productos.codigo_id_seq OWNED BY productos.codigo.id;


--
-- Name: codigo_tipo_precio; Type: TABLE; Schema: productos; Owner: franco
--

CREATE TABLE productos.codigo_tipo_precio (
    id bigint NOT NULL,
    codigo_id bigint NOT NULL,
    tipo_precio_id bigint NOT NULL,
    creado_en timestamp with time zone DEFAULT now(),
    usuario_id bigint NOT NULL,
    id_central bigint
);


ALTER TABLE productos.codigo_tipo_precio OWNER TO franco;

--
-- Name: codigo_tipo_precio_id_seq; Type: SEQUENCE; Schema: productos; Owner: franco
--

CREATE SEQUENCE productos.codigo_tipo_precio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE productos.codigo_tipo_precio_id_seq OWNER TO franco;

--
-- Name: codigo_tipo_precio_id_seq; Type: SEQUENCE OWNED BY; Schema: productos; Owner: franco
--

ALTER SEQUENCE productos.codigo_tipo_precio_id_seq OWNED BY productos.codigo_tipo_precio.id;


--
-- Name: costo_por_producto; Type: TABLE; Schema: productos; Owner: franco
--

CREATE TABLE productos.costo_por_producto (
    id bigint NOT NULL,
    producto_id bigint,
    sucursal_id bigint,
    ultimo_precio_compra numeric,
    ultimo_precio_venta numeric,
    costo_medio numeric,
    usuario_id bigint,
    creado_en timestamp with time zone DEFAULT now(),
    existencia numeric,
    movimiento_stock_id bigint,
    moneda_id bigint,
    cotizacion numeric,
    id_central bigint
);


ALTER TABLE productos.costo_por_producto OWNER TO franco;

--
-- Name: costos_por_sucursal_id_seq; Type: SEQUENCE; Schema: productos; Owner: franco
--

CREATE SEQUENCE productos.costos_por_sucursal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE productos.costos_por_sucursal_id_seq OWNER TO franco;

--
-- Name: costos_por_sucursal_id_seq; Type: SEQUENCE OWNED BY; Schema: productos; Owner: franco
--

ALTER SEQUENCE productos.costos_por_sucursal_id_seq OWNED BY productos.costo_por_producto.id;


--
-- Name: familia; Type: TABLE; Schema: productos; Owner: franco
--

CREATE TABLE productos.familia (
    id bigint NOT NULL,
    descripcion character varying,
    activo boolean DEFAULT true,
    usuario_id bigint,
    creado_en timestamp with time zone DEFAULT now(),
    icono character varying,
    nombre character varying,
    posicion numeric,
    id_central bigint
);


ALTER TABLE productos.familia OWNER TO franco;

--
-- Name: familia_id_seq; Type: SEQUENCE; Schema: productos; Owner: franco
--

CREATE SEQUENCE productos.familia_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE productos.familia_id_seq OWNER TO franco;

--
-- Name: familia_id_seq; Type: SEQUENCE OWNED BY; Schema: productos; Owner: franco
--

ALTER SEQUENCE productos.familia_id_seq OWNED BY productos.familia.id;


--
-- Name: producto_imagen; Type: TABLE; Schema: productos; Owner: franco
--

CREATE TABLE productos.producto_imagen (
    id bigint NOT NULL,
    producto_id bigint,
    ruta character varying,
    principal boolean,
    usuario_id bigint,
    creado_en timestamp with time zone DEFAULT now()
);


ALTER TABLE productos.producto_imagen OWNER TO franco;

--
-- Name: imagenes_id_seq; Type: SEQUENCE; Schema: productos; Owner: franco
--

CREATE SEQUENCE productos.imagenes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE productos.imagenes_id_seq OWNER TO franco;

--
-- Name: imagenes_id_seq; Type: SEQUENCE OWNED BY; Schema: productos; Owner: franco
--

ALTER SEQUENCE productos.imagenes_id_seq OWNED BY productos.producto_imagen.id;


--
-- Name: pdv_categoria; Type: TABLE; Schema: productos; Owner: franco
--

CREATE TABLE productos.pdv_categoria (
    id bigint NOT NULL,
    descripcion character varying,
    activo boolean DEFAULT true,
    usuario_id bigint,
    creado_en timestamp with time zone DEFAULT now(),
    posicion numeric,
    id_central bigint
);


ALTER TABLE productos.pdv_categoria OWNER TO franco;

--
-- Name: pdv_categoria_id_seq; Type: SEQUENCE; Schema: productos; Owner: franco
--

CREATE SEQUENCE productos.pdv_categoria_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE productos.pdv_categoria_id_seq OWNER TO franco;

--
-- Name: pdv_categoria_id_seq; Type: SEQUENCE OWNED BY; Schema: productos; Owner: franco
--

ALTER SEQUENCE productos.pdv_categoria_id_seq OWNED BY productos.pdv_categoria.id;


--
-- Name: pdv_grupo; Type: TABLE; Schema: productos; Owner: franco
--

CREATE TABLE productos.pdv_grupo (
    id bigint NOT NULL,
    descripcion character varying,
    activo boolean DEFAULT true,
    usuario_id bigint,
    creado_en timestamp with time zone DEFAULT now(),
    categoria_id bigint,
    id_central bigint
);


ALTER TABLE productos.pdv_grupo OWNER TO franco;

--
-- Name: pdv_grupo_id_seq; Type: SEQUENCE; Schema: productos; Owner: franco
--

CREATE SEQUENCE productos.pdv_grupo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE productos.pdv_grupo_id_seq OWNER TO franco;

--
-- Name: pdv_grupo_id_seq; Type: SEQUENCE OWNED BY; Schema: productos; Owner: franco
--

ALTER SEQUENCE productos.pdv_grupo_id_seq OWNED BY productos.pdv_grupo.id;


--
-- Name: pdv_grupos_productos; Type: TABLE; Schema: productos; Owner: franco
--

CREATE TABLE productos.pdv_grupos_productos (
    id bigint NOT NULL,
    producto_id bigint,
    grupo_id bigint,
    activo boolean DEFAULT true,
    usuario_id bigint,
    creado_en timestamp(0) without time zone DEFAULT now(),
    id_central bigint
);


ALTER TABLE productos.pdv_grupos_productos OWNER TO franco;

--
-- Name: pdv_grupos_productos_id_seq; Type: SEQUENCE; Schema: productos; Owner: franco
--

CREATE SEQUENCE productos.pdv_grupos_productos_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE productos.pdv_grupos_productos_id_seq OWNER TO franco;

--
-- Name: pdv_grupos_productos_id_seq; Type: SEQUENCE OWNED BY; Schema: productos; Owner: franco
--

ALTER SEQUENCE productos.pdv_grupos_productos_id_seq OWNED BY productos.pdv_grupos_productos.id;


--
-- Name: precio_por_sucursal; Type: TABLE; Schema: productos; Owner: franco
--

CREATE TABLE productos.precio_por_sucursal (
    id bigint NOT NULL,
    sucursal_id bigint,
    precio numeric,
    usuario_id bigint,
    creado_en timestamp with time zone DEFAULT now(),
    presentacion_id bigint NOT NULL,
    tipo_precio_id bigint,
    principal boolean DEFAULT false,
    activo boolean DEFAULT true,
    id_central bigint
);


ALTER TABLE productos.precio_por_sucursal OWNER TO franco;

--
-- Name: precio_por_sucursal_id_seq; Type: SEQUENCE; Schema: productos; Owner: franco
--

CREATE SEQUENCE productos.precio_por_sucursal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE productos.precio_por_sucursal_id_seq OWNER TO franco;

--
-- Name: precio_por_sucursal_id_seq; Type: SEQUENCE OWNED BY; Schema: productos; Owner: franco
--

ALTER SEQUENCE productos.precio_por_sucursal_id_seq OWNED BY productos.precio_por_sucursal.id;


--
-- Name: presentacion; Type: TABLE; Schema: productos; Owner: franco
--

CREATE TABLE productos.presentacion (
    id bigint NOT NULL,
    producto_id bigint NOT NULL,
    cantidad numeric NOT NULL,
    descripcion character varying,
    principal boolean DEFAULT false,
    activo boolean DEFAULT true,
    tipo_presentacion_id bigint,
    usuario_id bigint,
    creado_en timestamp with time zone DEFAULT now(),
    id_central bigint
);


ALTER TABLE productos.presentacion OWNER TO franco;

--
-- Name: presentacion_id_seq; Type: SEQUENCE; Schema: productos; Owner: franco
--

CREATE SEQUENCE productos.presentacion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE productos.presentacion_id_seq OWNER TO franco;

--
-- Name: presentacion_id_seq; Type: SEQUENCE OWNED BY; Schema: productos; Owner: franco
--

ALTER SEQUENCE productos.presentacion_id_seq OWNED BY productos.presentacion.id;


--
-- Name: producto; Type: TABLE; Schema: productos; Owner: franco
--

CREATE TABLE productos.producto (
    id bigint NOT NULL,
    id_central bigint,
    propagado boolean DEFAULT false,
    descripcion character varying,
    descripcion_factura character varying,
    iva character varying,
    unidad_por_caja numeric DEFAULT 1,
    balanza boolean DEFAULT false,
    combo boolean DEFAULT false,
    garantia boolean DEFAULT false,
    ingrediente boolean DEFAULT false,
    promocion boolean DEFAULT false,
    vencimiento boolean DEFAULT true,
    stock boolean DEFAULT true,
    usuario_id bigint,
    tipo_conservacion productos.tipo_conservacion DEFAULT 'ENFRIABLE'::productos.tipo_conservacion,
    creado_en timestamp with time zone DEFAULT now(),
    sub_familia_id bigint,
    observacion character varying,
    cambiable boolean DEFAULT false,
    es_alcoholico boolean DEFAULT false,
    unidad_por_caja_secundaria numeric DEFAULT 2,
    imagenes character varying,
    tiempo_garantia numeric,
    dias_vencimiento numeric,
    id_sucursal_origen bigint,
    activo boolean DEFAULT true,
    is_envase boolean DEFAULT false,
    envase_id bigint
);


ALTER TABLE productos.producto OWNER TO franco;

--
-- Name: COLUMN producto.descripcion; Type: COMMENT; Schema: productos; Owner: franco
--

COMMENT ON COLUMN productos.producto.descripcion IS 'Descripcion del producto';


--
-- Name: producto_id_seq; Type: SEQUENCE; Schema: productos; Owner: franco
--

CREATE SEQUENCE productos.producto_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE productos.producto_id_seq OWNER TO franco;

--
-- Name: producto_id_seq; Type: SEQUENCE OWNED BY; Schema: productos; Owner: franco
--

ALTER SEQUENCE productos.producto_id_seq OWNED BY productos.producto.id;


--
-- Name: producto_por_sucursal; Type: TABLE; Schema: productos; Owner: franco
--

CREATE TABLE productos.producto_por_sucursal (
    id bigint NOT NULL,
    producto_id bigint,
    sucursal_id bigint,
    cant_minima numeric,
    cant_media numeric,
    cant_maxima numeric,
    usuario_id bigint,
    creado_en timestamp with time zone DEFAULT now()
);


ALTER TABLE productos.producto_por_sucursal OWNER TO franco;

--
-- Name: producto_proveedor; Type: TABLE; Schema: productos; Owner: franco
--

CREATE TABLE productos.producto_proveedor (
    id bigint NOT NULL,
    producto_id bigint,
    proveedor_id bigint,
    pedido_id bigint,
    usuario_id bigint,
    creado_en timestamp with time zone DEFAULT now()
);


ALTER TABLE productos.producto_proveedor OWNER TO franco;

--
-- Name: producto_proveedor_id_seq; Type: SEQUENCE; Schema: productos; Owner: franco
--

CREATE SEQUENCE productos.producto_proveedor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE productos.producto_proveedor_id_seq OWNER TO franco;

--
-- Name: producto_proveedor_id_seq; Type: SEQUENCE OWNED BY; Schema: productos; Owner: franco
--

ALTER SEQUENCE productos.producto_proveedor_id_seq OWNED BY productos.producto_proveedor.id;


--
-- Name: productos_por_sucursal_id_seq; Type: SEQUENCE; Schema: productos; Owner: franco
--

CREATE SEQUENCE productos.productos_por_sucursal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE productos.productos_por_sucursal_id_seq OWNER TO franco;

--
-- Name: productos_por_sucursal_id_seq; Type: SEQUENCE OWNED BY; Schema: productos; Owner: franco
--

ALTER SEQUENCE productos.productos_por_sucursal_id_seq OWNED BY productos.producto_por_sucursal.id;


--
-- Name: subfamilia; Type: TABLE; Schema: productos; Owner: franco
--

CREATE TABLE productos.subfamilia (
    id bigint NOT NULL,
    familia_id bigint,
    descripcion character varying,
    activo boolean DEFAULT true,
    usuario_id bigint,
    creado_en timestamp with time zone DEFAULT now(),
    sub_familia_id bigint,
    icono character varying,
    nombre character varying,
    posicion numeric,
    id_central bigint
);


ALTER TABLE productos.subfamilia OWNER TO franco;

--
-- Name: subfamilia_id_seq; Type: SEQUENCE; Schema: productos; Owner: franco
--

CREATE SEQUENCE productos.subfamilia_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE productos.subfamilia_id_seq OWNER TO franco;

--
-- Name: subfamilia_id_seq; Type: SEQUENCE OWNED BY; Schema: productos; Owner: franco
--

ALTER SEQUENCE productos.subfamilia_id_seq OWNED BY productos.subfamilia.id;


--
-- Name: tipo_precio; Type: TABLE; Schema: productos; Owner: franco
--

CREATE TABLE productos.tipo_precio (
    id bigint NOT NULL,
    descripcion character varying,
    autorizacion boolean,
    usuario_id bigint,
    creado_en timestamp with time zone DEFAULT now(),
    activo boolean DEFAULT true,
    id_central bigint
);


ALTER TABLE productos.tipo_precio OWNER TO franco;

--
-- Name: tipo_precio_id_seq; Type: SEQUENCE; Schema: productos; Owner: franco
--

CREATE SEQUENCE productos.tipo_precio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE productos.tipo_precio_id_seq OWNER TO franco;

--
-- Name: tipo_precio_id_seq; Type: SEQUENCE OWNED BY; Schema: productos; Owner: franco
--

ALTER SEQUENCE productos.tipo_precio_id_seq OWNED BY productos.tipo_precio.id;


--
-- Name: tipo_presentacion; Type: TABLE; Schema: productos; Owner: franco
--

CREATE TABLE productos.tipo_presentacion (
    id bigint NOT NULL,
    descripcion character varying NOT NULL,
    unico boolean DEFAULT false,
    usuario_id bigint,
    creado_en timestamp with time zone DEFAULT now(),
    id_central bigint
);


ALTER TABLE productos.tipo_presentacion OWNER TO franco;

--
-- Name: tipo_presentacion_id_seq; Type: SEQUENCE; Schema: productos; Owner: franco
--

CREATE SEQUENCE productos.tipo_presentacion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE productos.tipo_presentacion_id_seq OWNER TO franco;

--
-- Name: tipo_presentacion_id_seq; Type: SEQUENCE OWNED BY; Schema: productos; Owner: franco
--

ALTER SEQUENCE productos.tipo_presentacion_id_seq OWNED BY productos.tipo_presentacion.id;


--
-- Name: databasechangelog; Type: TABLE; Schema: public; Owner: franco
--

CREATE TABLE public.databasechangelog (
    id character varying(255) NOT NULL,
    author character varying(255) NOT NULL,
    filename character varying(255) NOT NULL,
    dateexecuted timestamp without time zone NOT NULL,
    orderexecuted integer NOT NULL,
    exectype character varying(10) NOT NULL,
    md5sum character varying(35),
    description character varying(255),
    comments character varying(255),
    tag character varying(255),
    liquibase character varying(20),
    contexts character varying(255),
    labels character varying(255),
    deployment_id character varying(10)
);


ALTER TABLE public.databasechangelog OWNER TO franco;

--
-- Name: databasechangeloglock; Type: TABLE; Schema: public; Owner: franco
--

CREATE TABLE public.databasechangeloglock (
    id integer NOT NULL,
    locked boolean NOT NULL,
    lockgranted timestamp without time zone,
    lockedby character varying(255)
);


ALTER TABLE public.databasechangeloglock OWNER TO franco;

--
-- Name: producto_proveedor; Type: TABLE; Schema: public; Owner: franco
--

CREATE TABLE public.producto_proveedor (
    id bigint NOT NULL,
    producto_id bigint,
    proveedor_id bigint,
    pedido_id bigint,
    usuario_id bigint,
    creado_en timestamp with time zone DEFAULT now()
);


ALTER TABLE public.producto_proveedor OWNER TO franco;

--
-- Name: producto_proveedor_id_seq; Type: SEQUENCE; Schema: public; Owner: franco
--

CREATE SEQUENCE public.producto_proveedor_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.producto_proveedor_id_seq OWNER TO franco;

--
-- Name: producto_proveedor_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: franco
--

ALTER SEQUENCE public.producto_proveedor_id_seq OWNED BY public.producto_proveedor.id;


--
-- Name: test; Type: TABLE; Schema: public; Owner: franco
--

CREATE TABLE public.test (
    id bigint NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.test OWNER TO franco;

--
-- Name: test_id_seq; Type: SEQUENCE; Schema: public; Owner: franco
--

CREATE SEQUENCE public.test_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.test_id_seq OWNER TO franco;

--
-- Name: test_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: franco
--

ALTER SEQUENCE public.test_id_seq OWNED BY public.test.id;


--
-- Name: marca; Type: TABLE; Schema: vehiculos; Owner: franco
--

CREATE TABLE vehiculos.marca (
    id bigint NOT NULL,
    descripcion character varying,
    usuario_id bigint,
    creado_en timestamp with time zone DEFAULT now()
);


ALTER TABLE vehiculos.marca OWNER TO franco;

--
-- Name: marca_id_seq; Type: SEQUENCE; Schema: vehiculos; Owner: franco
--

CREATE SEQUENCE vehiculos.marca_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE vehiculos.marca_id_seq OWNER TO franco;

--
-- Name: marca_id_seq; Type: SEQUENCE OWNED BY; Schema: vehiculos; Owner: franco
--

ALTER SEQUENCE vehiculos.marca_id_seq OWNED BY vehiculos.marca.id;


--
-- Name: modelo; Type: TABLE; Schema: vehiculos; Owner: franco
--

CREATE TABLE vehiculos.modelo (
    id bigint NOT NULL,
    descripcion character varying,
    marca_id bigint,
    usuario_id bigint,
    creado_en timestamp with time zone DEFAULT now()
);


ALTER TABLE vehiculos.modelo OWNER TO franco;

--
-- Name: modelo_id_seq; Type: SEQUENCE; Schema: vehiculos; Owner: franco
--

CREATE SEQUENCE vehiculos.modelo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE vehiculos.modelo_id_seq OWNER TO franco;

--
-- Name: modelo_id_seq; Type: SEQUENCE OWNED BY; Schema: vehiculos; Owner: franco
--

ALTER SEQUENCE vehiculos.modelo_id_seq OWNED BY vehiculos.modelo.id;


--
-- Name: tipo_vehiculo; Type: TABLE; Schema: vehiculos; Owner: franco
--

CREATE TABLE vehiculos.tipo_vehiculo (
    id bigint NOT NULL,
    descripcion character varying,
    usuario_id bigint,
    creado_en timestamp with time zone DEFAULT now()
);


ALTER TABLE vehiculos.tipo_vehiculo OWNER TO franco;

--
-- Name: tipo_vehiculo_id_seq; Type: SEQUENCE; Schema: vehiculos; Owner: franco
--

CREATE SEQUENCE vehiculos.tipo_vehiculo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE vehiculos.tipo_vehiculo_id_seq OWNER TO franco;

--
-- Name: tipo_vehiculo_id_seq; Type: SEQUENCE OWNED BY; Schema: vehiculos; Owner: franco
--

ALTER SEQUENCE vehiculos.tipo_vehiculo_id_seq OWNED BY vehiculos.tipo_vehiculo.id;


--
-- Name: vehiculo; Type: TABLE; Schema: vehiculos; Owner: franco
--

CREATE TABLE vehiculos.vehiculo (
    id bigint NOT NULL,
    color character varying,
    chapa character varying,
    documentacion boolean DEFAULT false,
    refrigerado boolean DEFAULT false,
    nuevo boolean DEFAULT true,
    fecha_adquisicion timestamp without time zone,
    primer_kilometraje numeric DEFAULT 0,
    tipo_vehiculo bigint,
    imagenes_documentos character varying,
    imagenes_vehiculo character varying,
    usuario_id bigint,
    creado_en timestamp with time zone DEFAULT now(),
    anho numeric,
    capacidad_kg numeric,
    capacidad_pasajeros numeric,
    modelo_id bigint
);


ALTER TABLE vehiculos.vehiculo OWNER TO franco;

--
-- Name: vehiculo_id_seq; Type: SEQUENCE; Schema: vehiculos; Owner: franco
--

CREATE SEQUENCE vehiculos.vehiculo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE vehiculos.vehiculo_id_seq OWNER TO franco;

--
-- Name: vehiculo_id_seq; Type: SEQUENCE OWNED BY; Schema: vehiculos; Owner: franco
--

ALTER SEQUENCE vehiculos.vehiculo_id_seq OWNED BY vehiculos.vehiculo.id;


--
-- Name: vehiculo_sucursal; Type: TABLE; Schema: vehiculos; Owner: franco
--

CREATE TABLE vehiculos.vehiculo_sucursal (
    id bigint NOT NULL,
    sucursal_id bigint,
    vehiculo_id bigint,
    responsable_id bigint,
    usuario_id bigint,
    creado_en timestamp with time zone DEFAULT now()
);


ALTER TABLE vehiculos.vehiculo_sucursal OWNER TO franco;

--
-- Name: vehiculo_sucursal_id_seq; Type: SEQUENCE; Schema: vehiculos; Owner: franco
--

CREATE SEQUENCE vehiculos.vehiculo_sucursal_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE vehiculos.vehiculo_sucursal_id_seq OWNER TO franco;

--
-- Name: vehiculo_sucursal_id_seq; Type: SEQUENCE OWNED BY; Schema: vehiculos; Owner: franco
--

ALTER SEQUENCE vehiculos.vehiculo_sucursal_id_seq OWNED BY vehiculos.vehiculo_sucursal.id;


--
-- Name: id; Type: DEFAULT; Schema: administrativo; Owner: franco
--

ALTER TABLE ONLY administrativo.autorizacion ALTER COLUMN id SET DEFAULT nextval('administrativo.autorizacion_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: administrativo; Owner: franco
--

ALTER TABLE ONLY administrativo.marcacion ALTER COLUMN id SET DEFAULT nextval('administrativo.marcacion_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: configuraciones; Owner: franco
--

ALTER TABLE ONLY configuraciones.inicio_sesion ALTER COLUMN id SET DEFAULT nextval('configuraciones.inicio_sesion_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: configuraciones; Owner: franco
--

ALTER TABLE ONLY configuraciones.local ALTER COLUMN id SET DEFAULT nextval('configuraciones.local_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: empresarial; Owner: franco
--

ALTER TABLE ONLY empresarial.cargo ALTER COLUMN id SET DEFAULT nextval('empresarial.cargo_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: empresarial; Owner: franco
--

ALTER TABLE ONLY empresarial.sector ALTER COLUMN id SET DEFAULT nextval('empresarial.sector_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: empresarial; Owner: franco
--

ALTER TABLE ONLY empresarial.sucursal ALTER COLUMN id SET DEFAULT nextval('empresarial.sucursal_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: empresarial; Owner: franco
--

ALTER TABLE ONLY empresarial.zona ALTER COLUMN id SET DEFAULT nextval('empresarial.zona_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: equipos; Owner: franco
--

ALTER TABLE ONLY equipos.equipo ALTER COLUMN id SET DEFAULT nextval('equipos.equipo_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: equipos; Owner: franco
--

ALTER TABLE ONLY equipos.tipo_equipo ALTER COLUMN id SET DEFAULT nextval('equipos.tipo_equipo_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.banco ALTER COLUMN id SET DEFAULT nextval('financiero.banco_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.cambio ALTER COLUMN id SET DEFAULT nextval('financiero.cambio_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.cambio_caja ALTER COLUMN id SET DEFAULT nextval('financiero.cambio_caja_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.conteo ALTER COLUMN id SET DEFAULT nextval('financiero.conteo_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.conteo_moneda ALTER COLUMN id SET DEFAULT nextval('financiero.conteo_moneda_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.cuenta_bancaria ALTER COLUMN id SET DEFAULT nextval('financiero.cuenta_bancaria_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.documento ALTER COLUMN id SET DEFAULT nextval('financiero.documento_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.forma_pago ALTER COLUMN id SET DEFAULT nextval('financiero.forma_pago_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.gasto ALTER COLUMN id SET DEFAULT nextval('financiero.gasto_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.gasto_detalle ALTER COLUMN id SET DEFAULT nextval('financiero.gasto_detalle_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.moneda ALTER COLUMN id SET DEFAULT nextval('financiero.moneda_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.moneda_billetes ALTER COLUMN id SET DEFAULT nextval('financiero.moneda_billetes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.movimiento_caja ALTER COLUMN id SET DEFAULT nextval('financiero.movimiento_caja_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.pdv_caja ALTER COLUMN id SET DEFAULT nextval('financiero.pdv_caja_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.retiro ALTER COLUMN id SET DEFAULT nextval('financiero.retiro_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.retiro_detalle ALTER COLUMN id SET DEFAULT nextval('financiero.retiro_detalle_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.sencillo ALTER COLUMN id SET DEFAULT nextval('financiero.sencillo_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.sencillo_detalle ALTER COLUMN id SET DEFAULT nextval('financiero.sencillo_detalle_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.tipo_gasto ALTER COLUMN id SET DEFAULT nextval('financiero.tipo_gasto_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: general; Owner: franco
--

ALTER TABLE ONLY general.barrio ALTER COLUMN id SET DEFAULT nextval('general.barrio_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: general; Owner: franco
--

ALTER TABLE ONLY general.ciudad ALTER COLUMN id SET DEFAULT nextval('general.ciudad_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: general; Owner: franco
--

ALTER TABLE ONLY general.contacto ALTER COLUMN id SET DEFAULT nextval('general.contacto_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: general; Owner: franco
--

ALTER TABLE ONLY general.pais ALTER COLUMN id SET DEFAULT nextval('general.pais_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.cobro ALTER COLUMN id SET DEFAULT nextval('operaciones.cobro_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.cobro_detalle ALTER COLUMN id SET DEFAULT nextval('operaciones.cobro_detalle_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.compra ALTER COLUMN id SET DEFAULT nextval('operaciones.compra_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.compra_item ALTER COLUMN id SET DEFAULT nextval('operaciones.compra_item_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.delivery ALTER COLUMN id SET DEFAULT nextval('operaciones.delivery_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.entrada ALTER COLUMN id SET DEFAULT nextval('operaciones.entrada_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.entrada_item ALTER COLUMN id SET DEFAULT nextval('operaciones.entrada_item_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.inventario ALTER COLUMN id SET DEFAULT nextval('operaciones.inventario_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.inventario_producto ALTER COLUMN id SET DEFAULT nextval('operaciones.inventario_producto_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.inventario_producto_item ALTER COLUMN id SET DEFAULT nextval('operaciones.inventario_producto_item_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.motivo_diferencia_pedido ALTER COLUMN id SET DEFAULT nextval('operaciones.motivo_diferencia_pedido_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.movimiento_stock ALTER COLUMN id SET DEFAULT nextval('operaciones.movimiento_stock_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.necesidad ALTER COLUMN id SET DEFAULT nextval('operaciones.necesidad_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.necesidad_item ALTER COLUMN id SET DEFAULT nextval('operaciones.necesidad_item_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.nota_pedido ALTER COLUMN id SET DEFAULT nextval('operaciones.nota_pedido_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.nota_recepcion ALTER COLUMN id SET DEFAULT nextval('operaciones.nota_recepcion_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.nota_recepcion_item ALTER COLUMN id SET DEFAULT nextval('operaciones.nota_recepcion_item_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.pedido ALTER COLUMN id SET DEFAULT nextval('operaciones.pedido_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.pedido_item ALTER COLUMN id SET DEFAULT nextval('operaciones.pedido_item_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.pedido_item_sucursal ALTER COLUMN id SET DEFAULT nextval('operaciones.pedido_item_sucursal_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.precio_delivery ALTER COLUMN id SET DEFAULT nextval('operaciones.precio_delivery_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.programar_precio ALTER COLUMN id SET DEFAULT nextval('operaciones.programar_precio_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.salida ALTER COLUMN id SET DEFAULT nextval('operaciones.salida_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.salida_item ALTER COLUMN id SET DEFAULT nextval('operaciones.salida_item_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.transferencia ALTER COLUMN id SET DEFAULT nextval('operaciones.transferencia_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.transferencia_item ALTER COLUMN id SET DEFAULT nextval('operaciones.transferencia_item_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.venta ALTER COLUMN id SET DEFAULT nextval('operaciones.venta_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.venta_item ALTER COLUMN id SET DEFAULT nextval('operaciones.venta_item_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.vuelto ALTER COLUMN id SET DEFAULT nextval('operaciones.vuelto_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.vuelto_item ALTER COLUMN id SET DEFAULT nextval('operaciones.vuelto_item_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: personas; Owner: franco
--

ALTER TABLE ONLY personas.cliente ALTER COLUMN id SET DEFAULT nextval('personas.cliente_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: personas; Owner: franco
--

ALTER TABLE ONLY personas.funcionario ALTER COLUMN id SET DEFAULT nextval('personas.funcionario_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: personas; Owner: franco
--

ALTER TABLE ONLY personas.grupo_privilegio ALTER COLUMN id SET DEFAULT nextval('personas.grupo_privilegio_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: personas; Owner: franco
--

ALTER TABLE ONLY personas.persona ALTER COLUMN id SET DEFAULT nextval('personas.persona_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: personas; Owner: franco
--

ALTER TABLE ONLY personas.proveedor ALTER COLUMN id SET DEFAULT nextval('personas.proveedor_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: personas; Owner: franco
--

ALTER TABLE ONLY personas.proveedor_dias_visita ALTER COLUMN id SET DEFAULT nextval('personas.proveedor_dias_visita_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: personas; Owner: franco
--

ALTER TABLE ONLY personas.role ALTER COLUMN id SET DEFAULT nextval('personas.role_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: personas; Owner: franco
--

ALTER TABLE ONLY personas.usuario ALTER COLUMN id SET DEFAULT nextval('personas.usuario_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: personas; Owner: franco
--

ALTER TABLE ONLY personas.usuario_grupo ALTER COLUMN id SET DEFAULT nextval('personas.usuario_grupo_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: personas; Owner: franco
--

ALTER TABLE ONLY personas.usuario_role ALTER COLUMN id SET DEFAULT nextval('personas.usuario_role_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: personas; Owner: franco
--

ALTER TABLE ONLY personas.vendedor ALTER COLUMN id SET DEFAULT nextval('personas.vendedor_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: personas; Owner: franco
--

ALTER TABLE ONLY personas.vendedor_proveedor ALTER COLUMN id SET DEFAULT nextval('personas.vendedor_proveedor_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: productos; Owner: franco
--

ALTER TABLE ONLY productos.codigo ALTER COLUMN id SET DEFAULT nextval('productos.codigo_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: productos; Owner: franco
--

ALTER TABLE ONLY productos.codigo_tipo_precio ALTER COLUMN id SET DEFAULT nextval('productos.codigo_tipo_precio_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: productos; Owner: franco
--

ALTER TABLE ONLY productos.costo_por_producto ALTER COLUMN id SET DEFAULT nextval('productos.costos_por_sucursal_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: productos; Owner: franco
--

ALTER TABLE ONLY productos.familia ALTER COLUMN id SET DEFAULT nextval('productos.familia_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: productos; Owner: franco
--

ALTER TABLE ONLY productos.pdv_categoria ALTER COLUMN id SET DEFAULT nextval('productos.pdv_categoria_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: productos; Owner: franco
--

ALTER TABLE ONLY productos.pdv_grupo ALTER COLUMN id SET DEFAULT nextval('productos.pdv_grupo_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: productos; Owner: franco
--

ALTER TABLE ONLY productos.pdv_grupos_productos ALTER COLUMN id SET DEFAULT nextval('productos.pdv_grupos_productos_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: productos; Owner: franco
--

ALTER TABLE ONLY productos.precio_por_sucursal ALTER COLUMN id SET DEFAULT nextval('productos.precio_por_sucursal_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: productos; Owner: franco
--

ALTER TABLE ONLY productos.presentacion ALTER COLUMN id SET DEFAULT nextval('productos.presentacion_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: productos; Owner: franco
--

ALTER TABLE ONLY productos.producto ALTER COLUMN id SET DEFAULT nextval('productos.producto_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: productos; Owner: franco
--

ALTER TABLE ONLY productos.producto_imagen ALTER COLUMN id SET DEFAULT nextval('productos.imagenes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: productos; Owner: franco
--

ALTER TABLE ONLY productos.producto_por_sucursal ALTER COLUMN id SET DEFAULT nextval('productos.productos_por_sucursal_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: productos; Owner: franco
--

ALTER TABLE ONLY productos.producto_proveedor ALTER COLUMN id SET DEFAULT nextval('productos.producto_proveedor_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: productos; Owner: franco
--

ALTER TABLE ONLY productos.subfamilia ALTER COLUMN id SET DEFAULT nextval('productos.subfamilia_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: productos; Owner: franco
--

ALTER TABLE ONLY productos.tipo_precio ALTER COLUMN id SET DEFAULT nextval('productos.tipo_precio_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: productos; Owner: franco
--

ALTER TABLE ONLY productos.tipo_presentacion ALTER COLUMN id SET DEFAULT nextval('productos.tipo_presentacion_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: franco
--

ALTER TABLE ONLY public.producto_proveedor ALTER COLUMN id SET DEFAULT nextval('public.producto_proveedor_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: franco
--

ALTER TABLE ONLY public.test ALTER COLUMN id SET DEFAULT nextval('public.test_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: vehiculos; Owner: franco
--

ALTER TABLE ONLY vehiculos.marca ALTER COLUMN id SET DEFAULT nextval('vehiculos.marca_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: vehiculos; Owner: franco
--

ALTER TABLE ONLY vehiculos.modelo ALTER COLUMN id SET DEFAULT nextval('vehiculos.modelo_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: vehiculos; Owner: franco
--

ALTER TABLE ONLY vehiculos.tipo_vehiculo ALTER COLUMN id SET DEFAULT nextval('vehiculos.tipo_vehiculo_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: vehiculos; Owner: franco
--

ALTER TABLE ONLY vehiculos.vehiculo ALTER COLUMN id SET DEFAULT nextval('vehiculos.vehiculo_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: vehiculos; Owner: franco
--

ALTER TABLE ONLY vehiculos.vehiculo_sucursal ALTER COLUMN id SET DEFAULT nextval('vehiculos.vehiculo_sucursal_id_seq'::regclass);


--
-- Data for Name: autorizacion; Type: TABLE DATA; Schema: administrativo; Owner: franco
--

COPY administrativo.autorizacion (id, funcionario_id, autorizador_id, tipo_autorizacion, estado_autorizacion, observacion, usuario_id, creado_en) FROM stdin;
\.


--
-- Name: autorizacion_id_seq; Type: SEQUENCE SET; Schema: administrativo; Owner: franco
--

SELECT pg_catalog.setval('administrativo.autorizacion_id_seq', 1, false);


--
-- Data for Name: marcacion; Type: TABLE DATA; Schema: administrativo; Owner: franco
--

COPY administrativo.marcacion (id, tipo_marcacion, presencial, autorizacion, sucursal_id, codigo, usuario_id, creado_en) FROM stdin;
\.


--
-- Name: marcacion_id_seq; Type: SEQUENCE SET; Schema: administrativo; Owner: franco
--

SELECT pg_catalog.setval('administrativo.marcacion_id_seq', 1, false);


--
-- Data for Name: inicio_sesion; Type: TABLE DATA; Schema: configuraciones; Owner: franco
--

COPY configuraciones.inicio_sesion (id, usuario_id, dispositivo, hora_inicio, hora_fin, creado_en, sucursal_id) FROM stdin;
\.


--
-- Name: inicio_sesion_id_seq; Type: SEQUENCE SET; Schema: configuraciones; Owner: franco
--

SELECT pg_catalog.setval('configuraciones.inicio_sesion_id_seq', 1, false);


--
-- Data for Name: local; Type: TABLE DATA; Schema: configuraciones; Owner: franco
--

COPY configuraciones.local (id, sucursal_id, creado_en, usuario_id, equipo_id, is_servidor) FROM stdin;
2	1	2022-04-14 18:54:41.776+00	\N	\N	\N
\.


--
-- Name: local_id_seq; Type: SEQUENCE SET; Schema: configuraciones; Owner: franco
--

SELECT pg_catalog.setval('configuraciones.local_id_seq', 2, true);


--
-- Data for Name: cargo; Type: TABLE DATA; Schema: empresarial; Owner: franco
--

COPY empresarial.cargo (id, nombre, descripcion, supervisado_por_id, sueldo_base, usuario_id, creado_en, id_central) FROM stdin;
1	Gerente Sucursal	Gerente de una o mas sucursales	\N	2500000	1	2021-02-13 19:01:47.622029+00	\N
2	Cajero	Cajero	1	2400000	1	2021-02-13 19:02:13.69069+00	\N
\.


--
-- Name: cargo_id_seq; Type: SEQUENCE SET; Schema: empresarial; Owner: franco
--

SELECT pg_catalog.setval('empresarial.cargo_id_seq', 1, false);


--
-- Data for Name: sector; Type: TABLE DATA; Schema: empresarial; Owner: franco
--

COPY empresarial.sector (id, sucursal_id, descripcion, activo, usuario_id, creado_en) FROM stdin;
1	1	SALON PRINCIPAL	t	1	\N
2	1	CAMARA FRIA 1	t	1	\N
3	1	DEPOSITO 1	t	1	\N
4	1	CAMARIA FRIA 2	t	1	\N
6	1	DEPOSITO 2	t	1	\N
5	1	CAMARIA FRIA 3	t	1	\N
7	1	CARNICERIA	t	1	\N
\.


--
-- Name: sector_id_seq; Type: SEQUENCE SET; Schema: empresarial; Owner: franco
--

SELECT pg_catalog.setval('empresarial.sector_id_seq', 7, true);


--
-- Data for Name: sucursal; Type: TABLE DATA; Schema: empresarial; Owner: franco
--

COPY empresarial.sucursal (id, nombre, localizacion, ciudad_id, usuario_id, creado_en, deposito, deposito_predeterminado, direccion, nro_delivery, is_configured) FROM stdin;
3	ROTONDA	\N	1	1	2021-04-19 18:55:04.097784+00	t	f	\N	\N	t
4	INDUSTRIAL	\N	1	1	2021-05-04 18:42:27.039705+00	t	f	\N	\N	t
5	KM5	\N	1	1	2021-05-04 18:42:27.05715+00	t	f	\N	\N	t
7	KATUETE 1	\N	3	1	2021-05-04 18:45:01.995622+00	t	f	\N	\N	f
8	PALOMA 1	\N	2	1	2021-05-04 18:45:02.000441+00	t	f	\N	\N	t
2	ITAIPU	-24.051567, -54.305898	1	1	2021-02-13 19:37:47.164158+00	t	f	\N	\N	t
9	NUEVA ESPERANZA 1	\N	4	1	2021-05-04 18:45:02.004932+00	t	f	\N	\N	t
1	CENTRAL	-24.072157, -54.308287	1	1	2021-02-13 19:28:37.4107+00	t	t	Av. Paraguay c/ 30 de julio	0986128000	t
10	KATUETE 2	\N	3	1	2022-02-08 23:41:08.876976+00	t	f	\N	\N	t
0	SERVIDOR	\N	\N	\N	2022-04-02 19:17:30.462175+00	f	f	\N	\N	t
6	CALLE 10	\N	1	1	2021-05-04 18:42:27.061562+00	t	f	\N	\N	f
11	PUENTE KYJHA 2	\N	\N	1	2022-04-27 18:20:11.781451+00	t	f	\N	\N	t
\.


--
-- Name: sucursal_id_seq; Type: SEQUENCE SET; Schema: empresarial; Owner: franco
--

SELECT pg_catalog.setval('empresarial.sucursal_id_seq', 1, false);


--
-- Data for Name: zona; Type: TABLE DATA; Schema: empresarial; Owner: franco
--

COPY empresarial.zona (id, sector_id, descripcion, activo, usuario_id, creado_en) FROM stdin;
1	1	EST. VINOS	t	1	\N
2	1	EST. WHISKYS	t	1	\N
3	1	VISICOOLERS A	t	1	\N
4	1	VISICOOLERS B	t	1	\N
5	1	VISICOOLERS C	t	1	\N
6	1	GONDOLA A	t	1	\N
7	1	GONDOLA B	t	1	\N
8	2	PRINCIPAL	t	1	\N
9	2	SUBSUELO	t	1	\N
10	3	EST. A	t	1	\N
11	3	EST. B	t	1	\N
12	3	EST. C	t	1	\N
13	3	EST. D	t	1	\N
14	4	PRINCIPAL	t	1	\N
15	6	EST. A	t	1	\N
16	6	EST. B	t	1	\N
17	7	FREEZER A	t	1	\N
18	7	FREEZER B	t	1	\N
19	7	FREEZER C	t	1	\N
\.


--
-- Name: zona_id_seq; Type: SEQUENCE SET; Schema: empresarial; Owner: franco
--

SELECT pg_catalog.setval('empresarial.zona_id_seq', 19, true);


--
-- Data for Name: equipo; Type: TABLE DATA; Schema: equipos; Owner: franco
--

COPY equipos.equipo (id, marca, modelo, costo, descripcion, imagenes, usuario_id, creado_en, tipo_equipo_id) FROM stdin;
\.


--
-- Name: equipo_id_seq; Type: SEQUENCE SET; Schema: equipos; Owner: franco
--

SELECT pg_catalog.setval('equipos.equipo_id_seq', 1, false);


--
-- Data for Name: tipo_equipo; Type: TABLE DATA; Schema: equipos; Owner: franco
--

COPY equipos.tipo_equipo (id, descripcion, usuario_id, creado_en) FROM stdin;
\.


--
-- Name: tipo_equipo_id_seq; Type: SEQUENCE SET; Schema: equipos; Owner: franco
--

SELECT pg_catalog.setval('equipos.tipo_equipo_id_seq', 1, false);


--
-- Data for Name: banco; Type: TABLE DATA; Schema: financiero; Owner: franco
--

COPY financiero.banco (id, nombre, codigo, usuario_id, creado_en) FROM stdin;
1	VISION BANCO	001	1	2021-10-25 17:45:18.240634+00
\.


--
-- Name: banco_id_seq; Type: SEQUENCE SET; Schema: financiero; Owner: franco
--

SELECT pg_catalog.setval('financiero.banco_id_seq', 1, false);


--
-- Data for Name: cambio; Type: TABLE DATA; Schema: financiero; Owner: franco
--

COPY financiero.cambio (id, moneda_id, valor_en_gs, activo, usuario_id, creado_en, id_central, valor_en_gs_cambio) FROM stdin;
1	1	1	t	1	2021-05-31 19:33:15.871604+00	\N	\N
3	3	6800	t	1	2021-05-31 19:33:15.871604+00	\N	\N
4	4	200	t	1	2021-05-31 19:33:15.871604+00	\N	\N
5	2	1100	\N	1	2021-05-31 19:34:22.887556+00	\N	\N
2	2	1000	t	1	2021-05-31 19:33:15.871604+00	\N	\N
6	2	1050	\N	1	2021-10-25 17:31:48.600205+00	\N	\N
7	2	1200	\N	1	2022-02-04 21:17:15.632952+00	\N	\N
8	3	6850	t	1	2022-02-04 21:17:29.76313+00	\N	\N
10	3	6800	t	1	2022-02-22 18:42:15.82582+00	\N	\N
9	2	1250	t	1	2022-02-22 18:42:15.825+00	\N	\N
14	4	50	\N	2	2022-05-04 22:37:15.23+00	\N	50
\.


--
-- Data for Name: cambio_caja; Type: TABLE DATA; Schema: financiero; Owner: franco
--

COPY financiero.cambio_caja (id, cliente_id, autorizado_por_id, moneda_venta_id, moneda_compra_id, cotizacion, observacion, creado_en, usuario_id) FROM stdin;
\.


--
-- Name: cambio_caja_id_seq; Type: SEQUENCE SET; Schema: financiero; Owner: franco
--

SELECT pg_catalog.setval('financiero.cambio_caja_id_seq', 1, false);


--
-- Name: cambio_id_seq; Type: SEQUENCE SET; Schema: financiero; Owner: franco
--

SELECT pg_catalog.setval('financiero.cambio_id_seq', 1, false);


--
-- Data for Name: conteo; Type: TABLE DATA; Schema: financiero; Owner: franco
--

COPY financiero.conteo (id, observacion, creado_en, usuario_id) FROM stdin;
1	\N	2022-03-23 21:48:49.174+00	\N
2	\N	2022-03-28 19:11:41.166+00	\N
3	\N	2022-03-28 19:36:40.63+00	\N
4	\N	2022-03-28 19:53:50.082+00	\N
5	\N	2022-03-28 19:53:58.833+00	\N
6	\N	2022-03-28 19:55:57.958+00	\N
8	\N	2022-03-29 00:26:35.725+00	\N
9	\N	2022-03-29 00:31:11.521+00	\N
10	\N	2022-03-29 00:34:35.108+00	\N
11	\N	2022-03-29 00:35:44.313+00	\N
12	\N	2022-03-29 00:38:57.578+00	\N
13	\N	2022-03-29 00:40:30.286+00	\N
14	\N	2022-03-29 00:46:36.95+00	\N
15	\N	2022-03-29 00:56:32.828+00	\N
16	\N	2022-03-29 00:57:43.263+00	\N
17	\N	2022-03-29 01:00:29.484+00	\N
18	\N	2022-03-29 01:04:01.781+00	\N
19	\N	2022-03-29 01:17:19.911+00	\N
20	\N	2022-03-29 01:20:03.986+00	\N
21	\N	2022-03-29 01:21:17.172+00	\N
22	\N	2022-03-29 01:32:34.354+00	\N
23	\N	2022-03-29 01:34:56.031+00	\N
24	\N	2022-03-29 01:39:32.822+00	\N
25	\N	2022-03-29 01:43:02.239+00	\N
26	\N	2022-03-29 01:45:45.807+00	\N
27	\N	2022-03-29 01:49:42.349+00	\N
28	\N	2022-03-29 01:52:00.529+00	\N
29	\N	2022-03-29 01:54:02.91+00	\N
30	\N	2022-03-29 01:55:33.079+00	\N
31	\N	2022-03-29 02:02:22.75+00	\N
32	\N	2022-03-29 02:26:58.098+00	\N
33	\N	2022-03-29 02:29:26.848+00	\N
34	\N	2022-03-29 02:35:01.793+00	\N
35	\N	2022-03-29 12:45:33.489+00	\N
36	\N	2022-03-29 13:14:09.257+00	\N
37	\N	2022-03-29 13:22:45.571+00	\N
38	\N	2022-03-29 13:23:53.927+00	\N
39	\N	2022-03-29 14:12:34.209+00	\N
40	\N	2022-03-29 14:13:22.693+00	\N
41	\N	2022-03-29 14:15:09.666+00	\N
42	\N	2022-03-29 14:15:42.415+00	\N
43	\N	2022-06-04 17:27:55.834+00	\N
44	\N	2022-06-04 17:38:07.603+00	\N
45	\N	2022-06-04 17:40:36.735+00	\N
46	\N	2022-06-04 17:44:47.863+00	\N
47	\N	2022-06-04 17:56:38.242+00	\N
48	\N	2022-06-04 17:59:55.568+00	\N
49	\N	2022-06-04 18:22:41.052+00	\N
50	\N	2022-06-04 18:32:07.177+00	\N
51	\N	2022-06-04 18:40:58.227+00	\N
52	\N	2022-06-04 18:46:55.513+00	\N
53	\N	2022-06-04 18:59:27.714+00	\N
54	\N	2022-06-04 19:02:27.967+00	\N
55	\N	2022-06-04 19:25:02.537+00	\N
56	\N	2022-06-04 19:26:13.509+00	\N
57	\N	2022-06-04 19:29:15.277+00	\N
58	\N	2022-06-04 19:30:32.503+00	\N
59	\N	2022-06-16 17:08:03.285+00	\N
\.


--
-- Name: conteo_id_seq; Type: SEQUENCE SET; Schema: financiero; Owner: franco
--

SELECT pg_catalog.setval('financiero.conteo_id_seq', 59, true);


--
-- Data for Name: conteo_moneda; Type: TABLE DATA; Schema: financiero; Owner: franco
--

COPY financiero.conteo_moneda (id, conteo_id, moneda_billetes_id, cantidad, observacion, creado_en, usuario_id) FROM stdin;
1	1	1	1	\N	2022-03-23 21:48:49.431+00	\N
2	1	2	1	\N	2022-03-23 21:48:49.501+00	\N
3	1	3	1	\N	2022-03-23 21:48:49.544+00	\N
4	1	4	1	\N	2022-03-23 21:48:49.582+00	\N
5	1	5	1	\N	2022-03-23 21:48:49.626+00	\N
6	1	6	1	\N	2022-03-23 21:48:49.669+00	\N
7	1	7	1	\N	2022-03-23 21:48:49.716+00	\N
8	1	8	1	\N	2022-03-23 21:48:49.754+00	\N
9	1	9	1	\N	2022-03-23 21:48:49.802+00	\N
10	1	11	11	\N	2022-03-23 21:48:49.841+00	\N
11	1	12	1	\N	2022-03-23 21:48:49.884+00	\N
12	1	13	1	\N	2022-03-23 21:48:49.923+00	\N
13	1	14	1	\N	2022-03-23 21:48:49.965+00	\N
14	1	15	1	\N	2022-03-23 21:48:50.002+00	\N
15	1	16	1	\N	2022-03-23 21:48:50.04+00	\N
16	1	17	1	\N	2022-03-23 21:48:50.075+00	\N
17	1	18	1	\N	2022-03-23 21:48:50.109+00	\N
18	2	1	1	\N	2022-03-28 19:11:41.286+00	\N
19	2	2	1	\N	2022-03-28 19:11:41.341+00	\N
20	2	3	2	\N	2022-03-28 19:11:41.389+00	\N
21	2	4	3	\N	2022-03-28 19:11:41.429+00	\N
22	2	5	20	\N	2022-03-28 19:11:41.469+00	\N
23	2	6	10	\N	2022-03-28 19:11:41.515+00	\N
24	2	7	2	\N	2022-03-28 19:11:41.555+00	\N
25	2	8	6	\N	2022-03-28 19:11:41.596+00	\N
26	3	1	1	\N	2022-03-28 19:36:40.85+00	\N
27	3	2	1	\N	2022-03-28 19:36:40.896+00	\N
28	3	3	1	\N	2022-03-28 19:36:40.936+00	\N
29	3	4	1	\N	2022-03-28 19:36:40.979+00	\N
30	3	5	1	\N	2022-03-28 19:36:41.015+00	\N
31	3	6	1	\N	2022-03-28 19:36:41.048+00	\N
32	3	7	1	\N	2022-03-28 19:36:41.082+00	\N
33	3	8	1	\N	2022-03-28 19:36:41.112+00	\N
34	3	9	1	\N	2022-03-28 19:36:41.145+00	\N
35	3	11	1	\N	2022-03-28 19:36:41.176+00	\N
36	3	12	1	\N	2022-03-28 19:36:41.209+00	\N
37	3	13	1	\N	2022-03-28 19:36:41.24+00	\N
38	3	14	1	\N	2022-03-28 19:36:41.272+00	\N
39	3	15	1	\N	2022-03-28 19:36:41.308+00	\N
40	3	16	1	\N	2022-03-28 19:36:41.342+00	\N
41	3	17	1	\N	2022-03-28 19:36:41.377+00	\N
42	3	18	1	\N	2022-03-28 19:36:41.409+00	\N
43	3	19	1	\N	2022-03-28 19:36:41.442+00	\N
44	3	20	1	\N	2022-03-28 19:36:41.473+00	\N
45	3	21	1	\N	2022-03-28 19:36:41.505+00	\N
46	3	22	1	\N	2022-03-28 19:36:41.536+00	\N
47	3	23	1	\N	2022-03-28 19:36:41.571+00	\N
48	3	24	1	\N	2022-03-28 19:36:41.605+00	\N
49	3	25	1	\N	2022-03-28 19:36:41.638+00	\N
50	3	26	1	\N	2022-03-28 19:36:41.671+00	\N
51	4	1	1	\N	2022-03-28 19:53:50.293+00	\N
52	4	2	1	\N	2022-03-28 19:53:50.332+00	\N
53	4	3	1	\N	2022-03-28 19:53:50.371+00	\N
54	4	4	1	\N	2022-03-28 19:53:50.408+00	\N
55	4	5	1	\N	2022-03-28 19:53:50.445+00	\N
56	4	6	1	\N	2022-03-28 19:53:50.48+00	\N
57	4	7	1	\N	2022-03-28 19:53:50.518+00	\N
58	4	8	1	\N	2022-03-28 19:53:50.549+00	\N
59	4	9	1	\N	2022-03-28 19:53:50.588+00	\N
60	4	11	1	\N	2022-03-28 19:53:50.622+00	\N
61	4	12	1	\N	2022-03-28 19:53:50.659+00	\N
62	4	13	1	\N	2022-03-28 19:53:50.692+00	\N
63	4	14	1	\N	2022-03-28 19:53:50.725+00	\N
64	4	15	1	\N	2022-03-28 19:53:50.756+00	\N
65	4	16	1	\N	2022-03-28 19:53:50.79+00	\N
66	4	17	1	\N	2022-03-28 19:53:50.85+00	\N
67	4	18	1	\N	2022-03-28 19:53:50.884+00	\N
68	4	19	1	\N	2022-03-28 19:53:50.919+00	\N
69	4	20	1	\N	2022-03-28 19:53:50.951+00	\N
70	4	21	1	\N	2022-03-28 19:53:50.984+00	\N
71	4	22	1	\N	2022-03-28 19:53:51.017+00	\N
72	4	23	1	\N	2022-03-28 19:53:51.051+00	\N
73	4	24	1	\N	2022-03-28 19:53:51.083+00	\N
74	4	25	1	\N	2022-03-28 19:53:51.114+00	\N
75	4	26	1	\N	2022-03-28 19:53:51.147+00	\N
76	5	1	1	\N	2022-03-28 19:53:59.02+00	\N
77	5	2	1	\N	2022-03-28 19:53:59.056+00	\N
78	5	3	1	\N	2022-03-28 19:53:59.091+00	\N
79	5	4	1	\N	2022-03-28 19:53:59.124+00	\N
80	5	5	1	\N	2022-03-28 19:53:59.158+00	\N
81	5	6	1	\N	2022-03-28 19:53:59.193+00	\N
82	5	7	1	\N	2022-03-28 19:53:59.227+00	\N
83	5	8	1	\N	2022-03-28 19:53:59.26+00	\N
84	5	9	1	\N	2022-03-28 19:53:59.295+00	\N
85	5	11	1	\N	2022-03-28 19:53:59.325+00	\N
86	5	12	1	\N	2022-03-28 19:53:59.359+00	\N
87	5	13	1	\N	2022-03-28 19:53:59.391+00	\N
88	5	14	1	\N	2022-03-28 19:53:59.423+00	\N
89	5	15	1	\N	2022-03-28 19:53:59.454+00	\N
90	5	16	1	\N	2022-03-28 19:53:59.488+00	\N
91	5	17	1	\N	2022-03-28 19:53:59.522+00	\N
92	5	18	1	\N	2022-03-28 19:53:59.558+00	\N
93	5	19	1	\N	2022-03-28 19:53:59.593+00	\N
94	5	20	1	\N	2022-03-28 19:53:59.622+00	\N
95	5	21	1	\N	2022-03-28 19:53:59.655+00	\N
96	5	22	1	\N	2022-03-28 19:53:59.688+00	\N
97	5	23	1	\N	2022-03-28 19:53:59.722+00	\N
98	5	24	1	\N	2022-03-28 19:53:59.755+00	\N
99	5	25	1	\N	2022-03-28 19:53:59.791+00	\N
100	5	26	1	\N	2022-03-28 19:53:59.827+00	\N
101	6	1	1	\N	2022-03-28 19:55:58.045+00	\N
102	6	2	1	\N	2022-03-28 19:55:58.085+00	\N
103	6	3	1	\N	2022-03-28 19:55:58.132+00	\N
104	6	4	1	\N	2022-03-28 19:55:58.174+00	\N
105	6	5	1	\N	2022-03-28 19:55:58.214+00	\N
106	6	6	1	\N	2022-03-28 19:55:58.254+00	\N
107	6	7	1	\N	2022-03-28 19:55:58.288+00	\N
108	6	8	1	\N	2022-03-28 19:55:58.323+00	\N
109	6	9	1	\N	2022-03-28 19:55:58.353+00	\N
110	6	11	1	\N	2022-03-28 19:55:58.389+00	\N
111	6	12	1	\N	2022-03-28 19:55:58.42+00	\N
112	6	13	1	\N	2022-03-28 19:55:58.457+00	\N
113	6	14	1	\N	2022-03-28 19:55:58.49+00	\N
114	6	15	1	\N	2022-03-28 19:55:58.522+00	\N
115	6	16	1	\N	2022-03-28 19:55:58.558+00	\N
116	6	17	1	\N	2022-03-28 19:55:58.591+00	\N
117	6	18	1	\N	2022-03-28 19:55:58.622+00	\N
118	6	19	1	\N	2022-03-28 19:55:58.659+00	\N
119	6	20	1	\N	2022-03-28 19:55:58.689+00	\N
120	6	21	1	\N	2022-03-28 19:55:58.719+00	\N
121	6	22	1	\N	2022-03-28 19:55:58.751+00	\N
122	6	23	1	\N	2022-03-28 19:55:58.788+00	\N
123	6	24	1	\N	2022-03-28 19:55:58.824+00	\N
124	6	25	1	\N	2022-03-28 19:55:58.855+00	\N
125	6	26	1	\N	2022-03-28 19:55:58.889+00	\N
126	8	1	1	\N	2022-03-29 00:26:35.95+00	\N
127	8	2	1	\N	2022-03-29 00:26:35.999+00	\N
128	8	3	1	\N	2022-03-29 00:26:36.049+00	\N
129	8	6	1	\N	2022-03-29 00:26:36.099+00	\N
130	8	7	1	\N	2022-03-29 00:26:36.141+00	\N
131	8	8	1	\N	2022-03-29 00:26:36.174+00	\N
132	8	9	1	\N	2022-03-29 00:26:36.209+00	\N
133	8	10	1	\N	2022-03-29 00:26:36.239+00	\N
134	8	11	1	\N	2022-03-29 00:26:36.273+00	\N
135	8	12	1	\N	2022-03-29 00:26:36.315+00	\N
136	8	13	1	\N	2022-03-29 00:26:36.347+00	\N
137	8	17	1	\N	2022-03-29 00:26:36.379+00	\N
138	8	18	1	\N	2022-03-29 00:26:36.411+00	\N
139	8	23	1	\N	2022-03-29 00:26:36.443+00	\N
140	8	24	1	\N	2022-03-29 00:26:36.476+00	\N
141	9	1	1	\N	2022-03-29 00:31:11.811+00	\N
142	9	3	11	\N	2022-03-29 00:31:11.863+00	\N
143	9	5	1	\N	2022-03-29 00:31:11.898+00	\N
144	9	7	1	\N	2022-03-29 00:31:11.944+00	\N
145	9	9	1	\N	2022-03-29 00:31:11.986+00	\N
146	9	11	1	\N	2022-03-29 00:31:12.028+00	\N
147	9	13	11	\N	2022-03-29 00:31:12.067+00	\N
148	9	15	1	\N	2022-03-29 00:31:12.097+00	\N
149	9	17	1	\N	2022-03-29 00:31:12.132+00	\N
150	9	18	1	\N	2022-03-29 00:31:12.164+00	\N
151	9	20	1	\N	2022-03-29 00:31:12.198+00	\N
152	10	1	1	\N	2022-03-29 00:34:35.344+00	\N
153	10	3	1	\N	2022-03-29 00:34:35.398+00	\N
154	10	5	1	\N	2022-03-29 00:34:35.436+00	\N
155	10	7	1	\N	2022-03-29 00:34:35.472+00	\N
156	10	9	1	\N	2022-03-29 00:34:35.519+00	\N
157	10	11	1	\N	2022-03-29 00:34:35.56+00	\N
158	10	13	1	\N	2022-03-29 00:34:35.601+00	\N
159	10	15	1	\N	2022-03-29 00:34:35.636+00	\N
160	10	17	1	\N	2022-03-29 00:34:35.672+00	\N
161	11	1	1	\N	2022-03-29 00:35:44.56+00	\N
162	11	3	1	\N	2022-03-29 00:35:44.598+00	\N
163	11	5	1	\N	2022-03-29 00:35:44.637+00	\N
164	11	7	1	\N	2022-03-29 00:35:44.671+00	\N
165	11	9	1	\N	2022-03-29 00:35:44.702+00	\N
166	11	11	1	\N	2022-03-29 00:35:44.736+00	\N
167	11	13	1	\N	2022-03-29 00:35:44.77+00	\N
168	11	15	1	\N	2022-03-29 00:35:44.806+00	\N
169	12	1	1	\N	2022-03-29 00:38:57.829+00	\N
170	12	3	1	\N	2022-03-29 00:38:57.863+00	\N
171	12	5	1	\N	2022-03-29 00:38:57.91+00	\N
172	12	7	1	\N	2022-03-29 00:38:58.255+00	\N
173	12	10	11	\N	2022-03-29 00:38:58.308+00	\N
174	12	12	1	\N	2022-03-29 00:38:58.37+00	\N
175	12	14	1	\N	2022-03-29 00:38:58.486+00	\N
176	13	1	1	\N	2022-03-29 00:40:30.493+00	\N
177	13	3	1	\N	2022-03-29 00:40:30.533+00	\N
178	13	5	1	\N	2022-03-29 00:40:30.582+00	\N
179	13	7	1	\N	2022-03-29 00:40:30.632+00	\N
180	13	9	1	\N	2022-03-29 00:40:30.672+00	\N
181	13	11	1	\N	2022-03-29 00:40:30.718+00	\N
182	13	13	1	\N	2022-03-29 00:40:30.752+00	\N
183	13	15	1	\N	2022-03-29 00:40:30.786+00	\N
184	13	17	1	\N	2022-03-29 00:40:30.826+00	\N
185	14	1	1	\N	2022-03-29 00:46:37.292+00	\N
186	14	3	1	\N	2022-03-29 00:46:37.343+00	\N
187	14	5	1	\N	2022-03-29 00:46:37.545+00	\N
188	14	7	1	\N	2022-03-29 00:46:37.619+00	\N
189	14	9	1	\N	2022-03-29 00:46:37.67+00	\N
190	14	11	1	\N	2022-03-29 00:46:37.74+00	\N
191	14	13	1	\N	2022-03-29 00:46:37.794+00	\N
192	15	1	1	\N	2022-03-29 00:56:33.143+00	\N
193	15	3	1	\N	2022-03-29 00:56:33.182+00	\N
194	15	5	1	\N	2022-03-29 00:56:33.223+00	\N
195	15	7	1	\N	2022-03-29 00:56:33.266+00	\N
196	15	9	1	\N	2022-03-29 00:56:33.322+00	\N
197	15	11	1	\N	2022-03-29 00:56:33.363+00	\N
198	15	13	1	\N	2022-03-29 00:56:33.412+00	\N
199	15	15	1	\N	2022-03-29 00:56:33.46+00	\N
200	16	1	1	\N	2022-03-29 00:57:43.538+00	\N
201	16	3	1	\N	2022-03-29 00:57:43.582+00	\N
202	16	5	1	\N	2022-03-29 00:57:43.617+00	\N
203	16	7	1	\N	2022-03-29 00:57:43.659+00	\N
204	16	9	1	\N	2022-03-29 00:57:43.708+00	\N
205	16	11	1	\N	2022-03-29 00:57:43.752+00	\N
206	16	13	1	\N	2022-03-29 00:57:43.79+00	\N
207	16	15	1	\N	2022-03-29 00:57:43.827+00	\N
208	17	1	1	\N	2022-03-29 01:00:29.733+00	\N
209	17	3	1	\N	2022-03-29 01:00:29.774+00	\N
210	17	5	1	\N	2022-03-29 01:00:29.818+00	\N
211	17	7	1	\N	2022-03-29 01:00:29.866+00	\N
212	17	9	1	\N	2022-03-29 01:00:29.906+00	\N
213	17	11	1	\N	2022-03-29 01:00:29.946+00	\N
214	17	13	1	\N	2022-03-29 01:00:29.986+00	\N
215	17	15	1	\N	2022-03-29 01:00:30.021+00	\N
216	17	17	1	\N	2022-03-29 01:00:30.057+00	\N
217	18	1	1	\N	2022-03-29 01:04:02.065+00	\N
218	18	3	1	\N	2022-03-29 01:04:02.131+00	\N
219	18	5	1	\N	2022-03-29 01:04:02.172+00	\N
220	18	7	1	\N	2022-03-29 01:04:02.212+00	\N
221	18	9	1	\N	2022-03-29 01:04:02.25+00	\N
222	18	11	1	\N	2022-03-29 01:04:02.284+00	\N
223	18	13	1	\N	2022-03-29 01:04:02.315+00	\N
224	18	15	1	\N	2022-03-29 01:04:02.348+00	\N
225	19	1	1	\N	2022-03-29 01:17:20.172+00	\N
226	19	3	1	\N	2022-03-29 01:17:20.235+00	\N
227	19	5	1	\N	2022-03-29 01:17:20.281+00	\N
228	19	7	1	\N	2022-03-29 01:17:20.317+00	\N
229	19	9	1	\N	2022-03-29 01:17:20.364+00	\N
230	19	11	1	\N	2022-03-29 01:17:20.398+00	\N
231	19	13	1	\N	2022-03-29 01:17:20.434+00	\N
232	19	15	1	\N	2022-03-29 01:17:20.471+00	\N
233	19	17	1	\N	2022-03-29 01:17:20.507+00	\N
234	19	19	1	\N	2022-03-29 01:17:20.54+00	\N
235	19	21	1	\N	2022-03-29 01:17:20.576+00	\N
236	19	23	1	\N	2022-03-29 01:17:20.607+00	\N
237	20	1	1	\N	2022-03-29 01:20:04.306+00	\N
238	20	3	1	\N	2022-03-29 01:20:04.35+00	\N
239	20	5	11	\N	2022-03-29 01:20:04.396+00	\N
240	20	6	1	\N	2022-03-29 01:20:04.437+00	\N
241	20	7	1	\N	2022-03-29 01:20:04.477+00	\N
242	20	9	1	\N	2022-03-29 01:20:04.517+00	\N
243	20	10	1	\N	2022-03-29 01:20:04.56+00	\N
244	20	12	11	\N	2022-03-29 01:20:04.601+00	\N
245	20	13	1	\N	2022-03-29 01:20:04.633+00	\N
246	20	14	11	\N	2022-03-29 01:20:04.667+00	\N
247	20	16	1	\N	2022-03-29 01:20:04.702+00	\N
248	20	17	1	\N	2022-03-29 01:20:04.736+00	\N
249	20	21	1	\N	2022-03-29 01:20:04.764+00	\N
250	20	23	1	\N	2022-03-29 01:20:04.803+00	\N
251	21	1	1	\N	2022-03-29 01:21:17.28+00	\N
252	21	2	1	\N	2022-03-29 01:21:17.332+00	\N
253	21	4	1	\N	2022-03-29 01:21:17.378+00	\N
254	21	6	1	\N	2022-03-29 01:21:17.423+00	\N
255	21	7	1	\N	2022-03-29 01:21:17.461+00	\N
256	21	8	11	\N	2022-03-29 01:21:17.5+00	\N
257	21	9	1	\N	2022-03-29 01:21:17.539+00	\N
258	21	10	1	\N	2022-03-29 01:21:17.576+00	\N
259	21	12	1	\N	2022-03-29 01:21:17.615+00	\N
260	21	14	1	\N	2022-03-29 01:21:17.654+00	\N
261	21	15	1	\N	2022-03-29 01:21:17.695+00	\N
262	21	17	1	\N	2022-03-29 01:21:17.734+00	\N
263	21	18	1	\N	2022-03-29 01:21:17.77+00	\N
264	22	1	1	\N	2022-03-29 01:32:34.664+00	\N
265	22	3	1	\N	2022-03-29 01:32:34.71+00	\N
266	22	5	1	\N	2022-03-29 01:32:34.744+00	\N
267	22	7	1	\N	2022-03-29 01:32:34.784+00	\N
268	22	9	1	\N	2022-03-29 01:32:34.825+00	\N
269	22	12	1	\N	2022-03-29 01:32:34.867+00	\N
270	22	14	1	\N	2022-03-29 01:32:34.9+00	\N
271	22	16	1	\N	2022-03-29 01:32:34.936+00	\N
272	22	17	1	\N	2022-03-29 01:32:34.971+00	\N
273	22	19	1	\N	2022-03-29 01:32:35.008+00	\N
274	23	1	1	\N	2022-03-29 01:34:56.353+00	\N
275	23	3	1	\N	2022-03-29 01:34:56.396+00	\N
276	23	5	1	\N	2022-03-29 01:34:56.429+00	\N
277	23	6	1	\N	2022-03-29 01:34:56.461+00	\N
278	23	8	1	\N	2022-03-29 01:34:56.503+00	\N
279	23	9	1	\N	2022-03-29 01:34:56.535+00	\N
280	23	11	1	\N	2022-03-29 01:34:56.565+00	\N
281	23	13	1	\N	2022-03-29 01:34:56.601+00	\N
282	23	16	1	\N	2022-03-29 01:34:56.632+00	\N
283	23	17	1	\N	2022-03-29 01:34:56.664+00	\N
284	24	1	1	\N	2022-03-29 01:39:33.105+00	\N
285	24	3	1	\N	2022-03-29 01:39:33.169+00	\N
286	24	5	1	\N	2022-03-29 01:39:33.217+00	\N
287	24	7	1	\N	2022-03-29 01:39:33.262+00	\N
288	24	9	1	\N	2022-03-29 01:39:33.301+00	\N
289	24	11	1	\N	2022-03-29 01:39:33.346+00	\N
290	24	13	1	\N	2022-03-29 01:39:33.381+00	\N
291	24	15	1	\N	2022-03-29 01:39:33.419+00	\N
292	24	18	1	\N	2022-03-29 01:39:33.454+00	\N
293	25	1	1	\N	2022-03-29 01:43:02.415+00	\N
294	25	2	1	\N	2022-03-29 01:43:02.448+00	\N
295	25	4	1	\N	2022-03-29 01:43:02.478+00	\N
296	25	6	1	\N	2022-03-29 01:43:02.512+00	\N
297	25	7	1	\N	2022-03-29 01:43:02.55+00	\N
298	25	9	1	\N	2022-03-29 01:43:02.59+00	\N
299	25	11	1	\N	2022-03-29 01:43:02.632+00	\N
300	25	13	1	\N	2022-03-29 01:43:02.666+00	\N
301	25	14	1	\N	2022-03-29 01:43:02.698+00	\N
302	25	16	1	\N	2022-03-29 01:43:02.734+00	\N
303	25	18	1	\N	2022-03-29 01:43:02.767+00	\N
304	26	1	1	\N	2022-03-29 01:45:46.024+00	\N
305	26	3	1	\N	2022-03-29 01:45:46.067+00	\N
306	26	5	1	\N	2022-03-29 01:45:46.105+00	\N
307	26	6	1	\N	2022-03-29 01:45:46.138+00	\N
308	26	9	1	\N	2022-03-29 01:45:46.178+00	\N
309	26	11	1	\N	2022-03-29 01:45:46.216+00	\N
310	26	13	1	\N	2022-03-29 01:45:46.25+00	\N
311	27	1	1	\N	2022-03-29 01:49:42.436+00	\N
312	27	3	1	\N	2022-03-29 01:49:42.473+00	\N
313	27	5	11	\N	2022-03-29 01:49:42.508+00	\N
314	27	6	1	\N	2022-03-29 01:49:42.543+00	\N
315	27	7	1	\N	2022-03-29 01:49:42.58+00	\N
316	27	8	1	\N	2022-03-29 01:49:42.614+00	\N
317	27	10	1	\N	2022-03-29 01:49:42.659+00	\N
318	27	12	1	\N	2022-03-29 01:49:42.695+00	\N
319	27	14	1	\N	2022-03-29 01:49:42.739+00	\N
320	27	17	1	\N	2022-03-29 01:49:42.774+00	\N
321	27	18	1	\N	2022-03-29 01:49:42.804+00	\N
322	27	19	1	\N	2022-03-29 01:49:42.838+00	\N
323	27	21	1	\N	2022-03-29 01:49:42.867+00	\N
324	27	23	1	\N	2022-03-29 01:49:42.899+00	\N
325	28	1	1	\N	2022-03-29 01:52:00.688+00	\N
326	28	3	1	\N	2022-03-29 01:52:00.74+00	\N
327	28	4	11	\N	2022-03-29 01:52:00.783+00	\N
328	28	6	1	\N	2022-03-29 01:52:00.834+00	\N
329	28	7	1	\N	2022-03-29 01:52:00.879+00	\N
330	28	8	1	\N	2022-03-29 01:52:00.925+00	\N
331	28	10	1	\N	2022-03-29 01:52:00.965+00	\N
332	28	11	1	\N	2022-03-29 01:52:00.999+00	\N
333	28	13	1	\N	2022-03-29 01:52:01.034+00	\N
334	28	14	1	\N	2022-03-29 01:52:01.068+00	\N
335	28	16	1	\N	2022-03-29 01:52:01.102+00	\N
336	28	17	1	\N	2022-03-29 01:52:01.133+00	\N
337	28	19	1	\N	2022-03-29 01:52:01.17+00	\N
338	28	21	1	\N	2022-03-29 01:52:01.205+00	\N
339	28	23	1	\N	2022-03-29 01:52:01.238+00	\N
340	29	1	1	\N	2022-03-29 01:54:02.991+00	\N
341	29	3	1	\N	2022-03-29 01:54:03.031+00	\N
342	29	4	1	\N	2022-03-29 01:54:03.071+00	\N
343	29	6	1	\N	2022-03-29 01:54:03.112+00	\N
344	29	7	1	\N	2022-03-29 01:54:03.147+00	\N
345	29	9	1	\N	2022-03-29 01:54:03.193+00	\N
346	29	10	1	\N	2022-03-29 01:54:03.233+00	\N
347	29	11	1	\N	2022-03-29 01:54:03.264+00	\N
348	29	13	1	\N	2022-03-29 01:54:03.305+00	\N
349	29	14	1	\N	2022-03-29 01:54:03.34+00	\N
350	29	16	1	\N	2022-03-29 01:54:03.373+00	\N
351	29	17	1	\N	2022-03-29 01:54:03.406+00	\N
352	29	19	1	\N	2022-03-29 01:54:03.438+00	\N
353	29	21	1	\N	2022-03-29 01:54:03.472+00	\N
354	29	23	1	\N	2022-03-29 01:54:03.512+00	\N
355	29	24	1	\N	2022-03-29 01:54:03.549+00	\N
356	30	1	1	\N	2022-03-29 01:55:33.235+00	\N
357	30	3	1	\N	2022-03-29 01:55:33.287+00	\N
358	30	4	1	\N	2022-03-29 01:55:33.333+00	\N
359	30	6	1	\N	2022-03-29 01:55:33.384+00	\N
360	30	7	1	\N	2022-03-29 01:55:33.431+00	\N
361	30	9	1	\N	2022-03-29 01:55:33.474+00	\N
362	30	11	1	\N	2022-03-29 01:55:33.519+00	\N
363	30	12	1	\N	2022-03-29 01:55:33.561+00	\N
364	30	14	1	\N	2022-03-29 01:55:33.597+00	\N
365	30	15	1	\N	2022-03-29 01:55:33.634+00	\N
366	30	17	1	\N	2022-03-29 01:55:33.666+00	\N
367	30	18	1	\N	2022-03-29 01:55:33.699+00	\N
368	30	19	1	\N	2022-03-29 01:55:33.733+00	\N
369	30	21	1	\N	2022-03-29 01:55:33.766+00	\N
370	30	23	1	\N	2022-03-29 01:55:33.801+00	\N
371	31	1	1	\N	2022-03-29 02:02:22.829+00	\N
372	31	2	1	\N	2022-03-29 02:02:22.866+00	\N
373	31	4	11	\N	2022-03-29 02:02:22.903+00	\N
374	31	5	11	\N	2022-03-29 02:02:22.944+00	\N
375	31	6	1	\N	2022-03-29 02:02:22.977+00	\N
376	31	7	1	\N	2022-03-29 02:02:23.011+00	\N
377	31	8	1	\N	2022-03-29 02:02:23.045+00	\N
378	31	9	1	\N	2022-03-29 02:02:23.079+00	\N
379	31	11	1	\N	2022-03-29 02:02:23.111+00	\N
380	31	12	1	\N	2022-03-29 02:02:23.143+00	\N
381	31	15	1	\N	2022-03-29 02:02:23.174+00	\N
382	31	16	1	\N	2022-03-29 02:02:23.206+00	\N
383	31	19	1	\N	2022-03-29 02:02:23.24+00	\N
384	32	1	1	\N	2022-03-29 02:26:58.182+00	\N
385	32	2	11	\N	2022-03-29 02:26:58.221+00	\N
386	32	3	1	\N	2022-03-29 02:26:58.256+00	\N
387	32	4	1	\N	2022-03-29 02:26:58.294+00	\N
388	32	6	1	\N	2022-03-29 02:26:58.33+00	\N
389	32	7	11	\N	2022-03-29 02:26:58.367+00	\N
390	32	8	1	\N	2022-03-29 02:26:58.397+00	\N
391	32	9	1	\N	2022-03-29 02:26:58.438+00	\N
392	32	11	1	\N	2022-03-29 02:26:58.471+00	\N
393	32	14	1	\N	2022-03-29 02:26:58.505+00	\N
394	32	15	1	\N	2022-03-29 02:26:58.539+00	\N
395	32	17	1	\N	2022-03-29 02:26:58.572+00	\N
396	32	18	1	\N	2022-03-29 02:26:58.608+00	\N
397	33	1	1	\N	2022-03-29 02:29:26.937+00	\N
398	33	3	1	\N	2022-03-29 02:29:26.975+00	\N
399	33	4	1	\N	2022-03-29 02:29:27.013+00	\N
400	33	5	11	\N	2022-03-29 02:29:27.048+00	\N
401	33	6	1	\N	2022-03-29 02:29:27.086+00	\N
402	33	7	1	\N	2022-03-29 02:29:27.122+00	\N
403	33	9	1	\N	2022-03-29 02:29:27.153+00	\N
404	33	12	1	\N	2022-03-29 02:29:27.187+00	\N
405	33	14	1	\N	2022-03-29 02:29:27.224+00	\N
406	33	15	1	\N	2022-03-29 02:29:27.257+00	\N
407	33	17	11	\N	2022-03-29 02:29:27.292+00	\N
408	33	18	1	\N	2022-03-29 02:29:27.326+00	\N
409	33	19	1	\N	2022-03-29 02:29:27.366+00	\N
410	33	22	1	\N	2022-03-29 02:29:27.401+00	\N
411	33	24	1	\N	2022-03-29 02:29:27.435+00	\N
412	34	1	1	\N	2022-03-29 02:35:01.882+00	\N
413	34	3	1	\N	2022-03-29 02:35:01.934+00	\N
414	34	4	1	\N	2022-03-29 02:35:01.976+00	\N
415	34	5	1	\N	2022-03-29 02:35:02.016+00	\N
416	34	7	11	\N	2022-03-29 02:35:02.052+00	\N
417	34	8	1	\N	2022-03-29 02:35:02.087+00	\N
418	34	10	1	\N	2022-03-29 02:35:02.118+00	\N
419	34	11	1	\N	2022-03-29 02:35:02.156+00	\N
420	34	12	1	\N	2022-03-29 02:35:02.194+00	\N
421	34	14	1	\N	2022-03-29 02:35:02.226+00	\N
422	34	15	1	\N	2022-03-29 02:35:02.26+00	\N
423	34	17	1	\N	2022-03-29 02:35:02.294+00	\N
424	34	18	1	\N	2022-03-29 02:35:02.324+00	\N
425	34	19	11	\N	2022-03-29 02:35:02.358+00	\N
426	35	1	1	\N	2022-03-29 12:45:33.752+00	\N
427	35	3	1	\N	2022-03-29 12:45:33.801+00	\N
428	35	4	1	\N	2022-03-29 12:45:33.838+00	\N
429	35	6	1	\N	2022-03-29 12:45:33.883+00	\N
430	35	7	1	\N	2022-03-29 12:45:33.921+00	\N
431	35	8	1	\N	2022-03-29 12:45:33.953+00	\N
432	35	10	1	\N	2022-03-29 12:45:33.99+00	\N
433	35	11	1	\N	2022-03-29 12:45:34.025+00	\N
434	35	13	1	\N	2022-03-29 12:45:34.056+00	\N
435	35	14	1	\N	2022-03-29 12:45:34.087+00	\N
436	35	16	1	\N	2022-03-29 12:45:34.118+00	\N
437	35	17	1	\N	2022-03-29 12:45:34.146+00	\N
438	35	19	1	\N	2022-03-29 12:45:34.181+00	\N
439	36	1	1	\N	2022-03-29 13:14:09.353+00	\N
440	36	3	1	\N	2022-03-29 13:14:09.393+00	\N
441	36	4	1	\N	2022-03-29 13:14:09.419+00	\N
442	36	5	1	\N	2022-03-29 13:14:09.456+00	\N
443	36	6	11	\N	2022-03-29 13:14:09.489+00	\N
444	36	7	11	\N	2022-03-29 13:14:09.523+00	\N
445	36	8	1	\N	2022-03-29 13:14:09.568+00	\N
446	36	9	1	\N	2022-03-29 13:14:09.598+00	\N
447	36	11	1	\N	2022-03-29 13:14:09.623+00	\N
448	36	12	1	\N	2022-03-29 13:14:09.653+00	\N
449	36	15	1	\N	2022-03-29 13:14:09.677+00	\N
450	36	16	1	\N	2022-03-29 13:14:09.701+00	\N
451	36	18	11	\N	2022-03-29 13:14:09.725+00	\N
452	36	19	1	\N	2022-03-29 13:14:09.75+00	\N
453	36	20	1	\N	2022-03-29 13:14:09.776+00	\N
454	37	1	1	\N	2022-03-29 13:22:45.742+00	\N
455	37	2	1	\N	2022-03-29 13:22:45.773+00	\N
456	37	3	1	\N	2022-03-29 13:22:45.8+00	\N
457	38	1	1	\N	2022-03-29 13:23:54.077+00	\N
458	38	2	1	\N	2022-03-29 13:23:54.11+00	\N
459	38	3	1	\N	2022-03-29 13:23:54.135+00	\N
460	38	5	1	\N	2022-03-29 13:23:54.162+00	\N
461	39	1	1	\N	2022-03-29 14:12:34.28+00	\N
462	39	3	1	\N	2022-03-29 14:12:34.313+00	\N
463	39	5	11	\N	2022-03-29 14:12:34.346+00	\N
464	39	6	1	\N	2022-03-29 14:12:34.371+00	\N
465	39	7	1	\N	2022-03-29 14:12:34.397+00	\N
466	39	10	1	\N	2022-03-29 14:12:34.424+00	\N
467	39	12	1	\N	2022-03-29 14:12:34.452+00	\N
468	39	14	1	\N	2022-03-29 14:12:34.479+00	\N
469	39	16	1	\N	2022-03-29 14:12:34.506+00	\N
470	39	17	1	\N	2022-03-29 14:12:34.532+00	\N
471	39	19	11	\N	2022-03-29 14:12:34.557+00	\N
472	40	1	1	\N	2022-03-29 14:13:22.846+00	\N
473	40	3	1	\N	2022-03-29 14:13:22.876+00	\N
474	40	4	1	\N	2022-03-29 14:13:22.903+00	\N
475	40	6	1	\N	2022-03-29 14:13:22.935+00	\N
476	40	7	1	\N	2022-03-29 14:13:22.963+00	\N
477	40	9	1	\N	2022-03-29 14:13:22.994+00	\N
478	40	11	1	\N	2022-03-29 14:13:23.02+00	\N
479	40	12	1	\N	2022-03-29 14:13:23.042+00	\N
480	40	14	1	\N	2022-03-29 14:13:23.066+00	\N
481	40	15	1	\N	2022-03-29 14:13:23.096+00	\N
482	40	17	1	\N	2022-03-29 14:13:23.123+00	\N
483	40	18	1	\N	2022-03-29 14:13:23.149+00	\N
484	40	19	1	\N	2022-03-29 14:13:23.174+00	\N
485	41	1	1	\N	2022-03-29 14:15:09.738+00	\N
486	41	3	1	\N	2022-03-29 14:15:09.764+00	\N
487	41	4	1	\N	2022-03-29 14:15:09.788+00	\N
488	41	6	1	\N	2022-03-29 14:15:09.815+00	\N
489	41	7	1	\N	2022-03-29 14:15:09.839+00	\N
490	41	9	1	\N	2022-03-29 14:15:09.861+00	\N
491	41	11	1	\N	2022-03-29 14:15:09.884+00	\N
492	41	12	1	\N	2022-03-29 14:15:09.911+00	\N
493	41	14	1	\N	2022-03-29 14:15:09.937+00	\N
494	41	15	1	\N	2022-03-29 14:15:09.965+00	\N
495	41	17	1	\N	2022-03-29 14:15:09.99+00	\N
496	41	18	1	\N	2022-03-29 14:15:10.016+00	\N
497	41	19	1	\N	2022-03-29 14:15:10.042+00	\N
498	42	1	1	\N	2022-03-29 14:15:42.559+00	\N
499	42	3	1	\N	2022-03-29 14:15:42.588+00	\N
500	42	5	1	\N	2022-03-29 14:15:42.613+00	\N
501	42	7	1	\N	2022-03-29 14:15:42.641+00	\N
502	42	9	1	\N	2022-03-29 14:15:42.668+00	\N
503	42	11	1	\N	2022-03-29 14:15:42.693+00	\N
504	42	13	1	\N	2022-03-29 14:15:42.717+00	\N
505	42	15	1	\N	2022-03-29 14:15:42.744+00	\N
506	42	17	1	\N	2022-03-29 14:15:42.769+00	\N
507	42	19	1	\N	2022-03-29 14:15:42.794+00	\N
508	43	1	1	\N	2022-06-04 17:27:56.137+00	\N
509	43	2	1	\N	2022-06-04 17:27:56.192+00	\N
510	43	3	1	\N	2022-06-04 17:27:56.241+00	\N
511	43	4	1	\N	2022-06-04 17:27:56.301+00	\N
512	43	6	1	\N	2022-06-04 17:27:56.349+00	\N
513	43	7	1	\N	2022-06-04 17:27:56.402+00	\N
514	43	11	1	\N	2022-06-04 17:27:56.438+00	\N
515	43	12	1	\N	2022-06-04 17:27:56.472+00	\N
516	43	14	1	\N	2022-06-04 17:27:56.506+00	\N
517	43	15	1	\N	2022-06-04 17:27:56.541+00	\N
518	43	17	1	\N	2022-06-04 17:27:56.583+00	\N
519	43	18	1	\N	2022-06-04 17:27:56.619+00	\N
520	43	22	1	\N	2022-06-04 17:27:56.659+00	\N
521	43	23	1	\N	2022-06-04 17:27:56.697+00	\N
522	43	24	1	\N	2022-06-04 17:27:56.734+00	\N
523	48	1	1	\N	2022-06-04 18:00:22.512+00	\N
524	48	2	1	\N	2022-06-04 18:00:22.592+00	\N
525	48	3	1	\N	2022-06-04 18:00:22.718+00	\N
526	48	4	1	\N	2022-06-04 18:00:22.787+00	\N
527	48	5	1	\N	2022-06-04 18:00:22.884+00	\N
528	48	6	1	\N	2022-06-04 18:00:22.938+00	\N
529	48	7	1	\N	2022-06-04 18:00:22.993+00	\N
530	48	8	1	\N	2022-06-04 18:00:23.042+00	\N
531	48	9	1	\N	2022-06-04 18:00:23.178+00	\N
532	48	10	1	\N	2022-06-04 18:00:23.247+00	\N
533	48	11	1	\N	2022-06-04 18:00:23.284+00	\N
534	48	12	1	\N	2022-06-04 18:00:23.323+00	\N
535	48	13	1	\N	2022-06-04 18:00:23.361+00	\N
536	48	14	1	\N	2022-06-04 18:00:23.401+00	\N
537	49	1	1	\N	2022-06-04 18:23:24.148+00	\N
538	49	2	1	\N	2022-06-04 18:23:24.203+00	\N
539	49	3	1	\N	2022-06-04 18:23:24.255+00	\N
540	49	4	1	\N	2022-06-04 18:23:24.302+00	\N
541	49	5	1	\N	2022-06-04 18:23:24.347+00	\N
542	49	7	1	\N	2022-06-04 18:23:24.385+00	\N
543	49	9	1	\N	2022-06-04 18:23:24.439+00	\N
544	49	10	1	\N	2022-06-04 18:23:24.487+00	\N
545	49	11	1	\N	2022-06-04 18:23:24.533+00	\N
546	49	13	1	\N	2022-06-04 18:23:24.583+00	\N
547	49	14	1	\N	2022-06-04 18:23:24.628+00	\N
548	49	15	1	\N	2022-06-04 18:23:24.675+00	\N
549	49	17	1	\N	2022-06-04 18:23:24.714+00	\N
550	50	1	1	\N	2022-06-04 18:32:11+00	\N
551	50	2	1	\N	2022-06-04 18:32:11.049+00	\N
552	50	3	1	\N	2022-06-04 18:32:11.095+00	\N
553	50	4	1	\N	2022-06-04 18:32:11.136+00	\N
554	50	5	1	\N	2022-06-04 18:32:11.184+00	\N
555	50	9	11	\N	2022-06-04 18:32:11.228+00	\N
556	50	11	1	\N	2022-06-04 18:32:11.283+00	\N
557	50	12	1	\N	2022-06-04 18:32:11.328+00	\N
558	50	13	1	\N	2022-06-04 18:32:11.373+00	\N
559	50	14	1	\N	2022-06-04 18:32:11.415+00	\N
560	50	15	1	\N	2022-06-04 18:32:11.451+00	\N
561	50	16	1	\N	2022-06-04 18:32:11.493+00	\N
562	50	18	1	\N	2022-06-04 18:32:11.53+00	\N
563	51	1	1	\N	2022-06-04 18:40:58.425+00	\N
564	51	2	1	\N	2022-06-04 18:40:58.46+00	\N
565	51	3	1	\N	2022-06-04 18:40:58.494+00	\N
566	51	5	1	\N	2022-06-04 18:40:58.53+00	\N
567	51	6	1	\N	2022-06-04 18:40:58.568+00	\N
568	51	7	1	\N	2022-06-04 18:40:58.603+00	\N
569	51	10	1	\N	2022-06-04 18:40:58.636+00	\N
570	51	11	1	\N	2022-06-04 18:40:58.674+00	\N
571	51	12	1	\N	2022-06-04 18:40:58.707+00	\N
572	51	14	1	\N	2022-06-04 18:40:58.738+00	\N
573	51	15	1	\N	2022-06-04 18:40:58.773+00	\N
574	52	1	1	\N	2022-06-04 18:46:55.606+00	\N
575	52	3	1	\N	2022-06-04 18:46:55.658+00	\N
576	52	4	1	\N	2022-06-04 18:46:55.709+00	\N
577	52	5	1	\N	2022-06-04 18:46:55.751+00	\N
578	52	7	1	\N	2022-06-04 18:46:55.788+00	\N
579	52	8	1	\N	2022-06-04 18:46:55.829+00	\N
580	52	10	1	\N	2022-06-04 18:46:55.867+00	\N
581	52	14	1	\N	2022-06-04 18:46:55.905+00	\N
582	52	16	1	\N	2022-06-04 18:46:55.937+00	\N
583	52	17	1	\N	2022-06-04 18:46:55.969+00	\N
584	52	19	1	\N	2022-06-04 18:46:56.005+00	\N
585	52	20	1	\N	2022-06-04 18:46:56.037+00	\N
586	53	1	2	\N	2022-06-04 18:59:27.925+00	\N
587	53	2	1	\N	2022-06-04 18:59:27.968+00	\N
588	53	3	1	\N	2022-06-04 18:59:28.007+00	\N
589	53	5	1	\N	2022-06-04 18:59:28.043+00	\N
590	53	6	1	\N	2022-06-04 18:59:28.075+00	\N
591	53	8	1	\N	2022-06-04 18:59:28.109+00	\N
592	53	10	1	\N	2022-06-04 18:59:28.146+00	\N
593	53	11	1	\N	2022-06-04 18:59:28.185+00	\N
594	53	13	1	\N	2022-06-04 18:59:28.221+00	\N
595	53	14	1	\N	2022-06-04 18:59:28.252+00	\N
596	53	16	1	\N	2022-06-04 18:59:28.283+00	\N
597	53	17	1	\N	2022-06-04 18:59:28.319+00	\N
598	53	19	1	\N	2022-06-04 18:59:28.355+00	\N
599	54	1	1	\N	2022-06-04 19:02:28.054+00	\N
600	54	3	1	\N	2022-06-04 19:02:28.096+00	\N
601	54	4	1	\N	2022-06-04 19:02:28.13+00	\N
602	54	5	1	\N	2022-06-04 19:02:28.164+00	\N
603	54	7	1	\N	2022-06-04 19:02:28.201+00	\N
604	54	8	1	\N	2022-06-04 19:02:28.236+00	\N
605	54	10	1	\N	2022-06-04 19:02:28.273+00	\N
606	54	11	1	\N	2022-06-04 19:02:28.308+00	\N
607	54	12	1	\N	2022-06-04 19:02:28.344+00	\N
608	54	14	1	\N	2022-06-04 19:02:28.377+00	\N
609	54	15	1	\N	2022-06-04 19:02:28.407+00	\N
610	54	16	1	\N	2022-06-04 19:02:28.442+00	\N
611	54	18	1	\N	2022-06-04 19:02:28.475+00	\N
612	54	19	1	\N	2022-06-04 19:02:28.514+00	\N
613	55	1	1	\N	2022-06-04 19:25:02.767+00	\N
614	55	2	1	\N	2022-06-04 19:25:02.807+00	\N
615	55	5	1	\N	2022-06-04 19:25:02.849+00	\N
616	55	6	1	\N	2022-06-04 19:25:02.884+00	\N
617	55	8	1	\N	2022-06-04 19:25:02.925+00	\N
618	55	10	1	\N	2022-06-04 19:25:02.963+00	\N
619	55	11	1	\N	2022-06-04 19:25:02.996+00	\N
620	55	13	1	\N	2022-06-04 19:25:03.03+00	\N
621	55	14	1	\N	2022-06-04 19:25:03.07+00	\N
622	55	17	1	\N	2022-06-04 19:25:03.108+00	\N
623	55	18	1	\N	2022-06-04 19:25:03.143+00	\N
624	56	1	1	\N	2022-06-04 19:26:13.604+00	\N
625	56	4	1	\N	2022-06-04 19:26:13.648+00	\N
626	56	5	1	\N	2022-06-04 19:26:13.684+00	\N
627	56	6	1	\N	2022-06-04 19:26:13.727+00	\N
628	56	8	11	\N	2022-06-04 19:26:13.764+00	\N
629	56	9	1	\N	2022-06-04 19:26:13.804+00	\N
630	56	10	1	\N	2022-06-04 19:26:13.837+00	\N
631	56	12	1	\N	2022-06-04 19:26:13.869+00	\N
632	56	13	1	\N	2022-06-04 19:26:13.902+00	\N
633	56	16	1	\N	2022-06-04 19:26:13.935+00	\N
634	56	17	1	\N	2022-06-04 19:26:13.969+00	\N
635	57	1	1	\N	2022-06-04 19:29:15.47+00	\N
636	57	2	1	\N	2022-06-04 19:29:15.507+00	\N
637	57	3	1	\N	2022-06-04 19:29:15.546+00	\N
638	57	5	1	\N	2022-06-04 19:29:15.582+00	\N
639	57	6	1	\N	2022-06-04 19:29:15.622+00	\N
640	57	8	1	\N	2022-06-04 19:29:15.658+00	\N
641	57	10	1	\N	2022-06-04 19:29:15.693+00	\N
642	57	11	1	\N	2022-06-04 19:29:15.731+00	\N
643	57	14	1	\N	2022-06-04 19:29:15.766+00	\N
644	57	15	1	\N	2022-06-04 19:29:15.802+00	\N
645	57	18	1	\N	2022-06-04 19:29:15.832+00	\N
646	57	19	1	\N	2022-06-04 19:29:15.866+00	\N
647	58	7	1	\N	2022-06-04 19:30:32.588+00	\N
648	58	8	1	\N	2022-06-04 19:30:32.631+00	\N
649	58	9	1	\N	2022-06-04 19:30:32.664+00	\N
650	58	10	1	\N	2022-06-04 19:30:32.698+00	\N
651	58	18	1	\N	2022-06-04 19:30:32.737+00	\N
652	58	19	1	\N	2022-06-04 19:30:32.77+00	\N
653	59	1	1	\N	2022-06-16 17:08:03.482+00	\N
654	59	2	1	\N	2022-06-16 17:08:03.519+00	\N
655	59	4	1	\N	2022-06-16 17:08:03.561+00	\N
656	59	5	1	\N	2022-06-16 17:08:03.593+00	\N
657	59	7	1	\N	2022-06-16 17:08:03.632+00	\N
658	59	8	1	\N	2022-06-16 17:08:03.666+00	\N
659	59	10	1	\N	2022-06-16 17:08:03.699+00	\N
660	59	11	1	\N	2022-06-16 17:08:03.737+00	\N
661	59	14	1	\N	2022-06-16 17:08:03.768+00	\N
662	59	15	1	\N	2022-06-16 17:08:03.799+00	\N
663	59	16	1	\N	2022-06-16 17:08:03.834+00	\N
664	59	19	1	\N	2022-06-16 17:08:03.864+00	\N
665	59	20	1	\N	2022-06-16 17:08:03.894+00	\N
\.


--
-- Name: conteo_moneda_id_seq; Type: SEQUENCE SET; Schema: financiero; Owner: franco
--

SELECT pg_catalog.setval('financiero.conteo_moneda_id_seq', 665, true);


--
-- Data for Name: cuenta_bancaria; Type: TABLE DATA; Schema: financiero; Owner: franco
--

COPY financiero.cuenta_bancaria (id, persona_id, banco_id, moneda_id, numero, usuario_id, creado_en, tipo_cuenta, id_central) FROM stdin;
1	1	1	1	800379872	1	2021-10-25 17:45:49.547412+00	CUENTA_CORRIENTE	\N
\.


--
-- Name: cuenta_bancaria_id_seq; Type: SEQUENCE SET; Schema: financiero; Owner: franco
--

SELECT pg_catalog.setval('financiero.cuenta_bancaria_id_seq', 1, false);


--
-- Data for Name: documento; Type: TABLE DATA; Schema: financiero; Owner: franco
--

COPY financiero.documento (id, descripcion, activo, creado_en, usuario_id) FROM stdin;
1	COMUN	t	\N	1
2	LEGAL	t	\N	1
\.


--
-- Name: documento_id_seq; Type: SEQUENCE SET; Schema: financiero; Owner: franco
--

SELECT pg_catalog.setval('financiero.documento_id_seq', 1, false);


--
-- Data for Name: forma_pago; Type: TABLE DATA; Schema: financiero; Owner: franco
--

COPY financiero.forma_pago (id, descripcion, activo, movimiento_caja, cuenta_bancaria_id, autorizacion, creado_en, usuario_id, id_central) FROM stdin;
1	EFECTIVO	t	t	\N	f	2021-10-25 17:46:50.327752+00	1	\N
2	TARJETA	t	f	1	f	2021-10-25 17:47:27.783142+00	1	\N
3	CONVENIO	t	f	\N	t	2021-10-25 17:48:46.447436+00	1	\N
4	TRANSFERENCIA	t	f	1	t	2021-10-25 17:49:29.495563+00	1	\N
5	CHEQUE	t	f	1	t	2022-01-05 19:05:37.906336+00	1	\N
\.


--
-- Name: forma_pago_id_seq; Type: SEQUENCE SET; Schema: financiero; Owner: franco
--

SELECT pg_catalog.setval('financiero.forma_pago_id_seq', 1, false);


--
-- Data for Name: gasto; Type: TABLE DATA; Schema: financiero; Owner: franco
--

COPY financiero.gasto (id, responsable_id, tipo_gasto_id, autorizado_por_id, observacion, creado_en, usuario_id, caja_id, activo, finalizado, retiro_gs, retiro_rs, retiro_ds, vuelto_gs, vuelto_rs, vuelto_ds) FROM stdin;
1	1	41	\N	\N	2022-06-18 13:23:40.749+00	1	16	t	f	50000	0	0	0	0	0
2	1	41	\N	\N	2022-06-18 14:59:24.298+00	1	16	t	f	50000	0	0	0	0	0
\.


--
-- Data for Name: gasto_detalle; Type: TABLE DATA; Schema: financiero; Owner: franco
--

COPY financiero.gasto_detalle (id, gasto_id, moneda_id, cambio, cantidad, creado_en, usuario_id, vuelto) FROM stdin;
\.


--
-- Name: gasto_detalle_id_seq; Type: SEQUENCE SET; Schema: financiero; Owner: franco
--

SELECT pg_catalog.setval('financiero.gasto_detalle_id_seq', 1, false);


--
-- Name: gasto_id_seq; Type: SEQUENCE SET; Schema: financiero; Owner: franco
--

SELECT pg_catalog.setval('financiero.gasto_id_seq', 2, true);


--
-- Data for Name: maletin; Type: TABLE DATA; Schema: financiero; Owner: franco
--

COPY financiero.maletin (id, descripcion, activo, creado_en, usuario_id, abierto) FROM stdin;
8	m6	t	2021-12-02 20:10:46.038+00	1	f
9	123	t	2022-02-06 11:23:31.688+00	7	f
10	igor	t	2022-02-10 19:18:13.226+00	4	f
4	M4	t	2021-11-24 16:49:41.78656+00	1	f
3	M3	t	2021-11-24 16:49:41.78656+00	1	f
2	M2	t	2021-11-24 16:49:41.78656+00	1	f
1	M1	t	2021-11-24 16:49:41.78656+00	1	t
\.


--
-- Name: maletin_id_seq; Type: SEQUENCE SET; Schema: financiero; Owner: franco
--

SELECT pg_catalog.setval('financiero.maletin_id_seq', 8, true);


--
-- Data for Name: moneda; Type: TABLE DATA; Schema: financiero; Owner: franco
--

COPY financiero.moneda (id, denominacion, simbolo, pais_id, usuario_id, creado_en, id_central) FROM stdin;
1	GUARANI	Gs.	1	1	2021-04-06 17:53:28.063734+00	\N
2	REAL	R$	2	1	2021-04-06 17:58:07.307344+00	\N
3	DOLAR	US$	4	1	2021-04-06 17:58:07.312393+00	\N
4	PESO ARG	AR$	3	1	2021-04-06 17:58:07.317816+00	\N
\.


--
-- Data for Name: moneda_billetes; Type: TABLE DATA; Schema: financiero; Owner: franco
--

COPY financiero.moneda_billetes (id, moneda_id, flotante, papel, valor, activo, creado_en, usuario_id, id_central) FROM stdin;
3	1	f	t	2000	t	2021-11-29 17:24:07.866627+00	1	\N
1	1	f	f	500	t	2021-11-29 17:24:07.866627+00	1	\N
2	1	f	f	1000	t	2021-11-29 17:24:07.866627+00	1	\N
4	1	f	t	5000	t	2021-11-29 17:24:07.866627+00	1	\N
5	1	f	t	10000	t	2021-11-29 17:24:07.866627+00	1	\N
6	1	f	t	20000	t	2021-11-29 17:24:07.866627+00	1	\N
7	1	f	t	50000	t	2021-11-29 17:24:07.866627+00	1	\N
8	1	f	t	100000	t	2021-11-29 17:24:07.866627+00	1	\N
12	2	t	f	0.5	t	2021-11-29 17:25:35.045612+00	1	\N
13	2	t	f	1	t	2021-11-29 17:26:31.092831+00	1	\N
9	2	t	f	0.05	t	2021-11-29 17:24:07.866627+00	1	\N
10	2	t	f	0.1	t	2021-11-29 17:25:35.045612+00	1	\N
11	2	t	f	0.25	t	2021-11-29 17:25:35.045612+00	1	\N
14	2	t	t	2	t	2021-11-29 17:26:31.092831+00	1	\N
15	2	t	t	5	t	2021-11-29 17:27:33.740995+00	1	\N
16	2	t	t	10	t	2021-11-29 17:27:33.740995+00	1	\N
17	2	t	t	20	t	2021-11-29 17:27:33.740995+00	1	\N
18	2	t	t	50	t	2021-11-29 17:27:33.740995+00	1	\N
19	2	t	t	100	t	2021-11-29 17:27:33.740995+00	1	\N
20	2	t	t	200	t	2021-11-29 17:27:33.740995+00	1	\N
21	3	t	t	1	t	2021-11-29 17:27:33.740995+00	1	\N
22	3	t	t	5	t	2021-11-29 17:27:33.740995+00	1	\N
23	3	t	t	10	t	2021-11-29 17:27:33.740995+00	1	\N
24	3	t	t	20	t	2021-11-29 17:27:33.740995+00	1	\N
25	3	t	t	50	t	2021-11-29 17:27:33.740995+00	1	\N
26	3	t	t	100	t	2021-11-29 17:27:33.740995+00	1	\N
\.


--
-- Name: moneda_billetes_id_seq; Type: SEQUENCE SET; Schema: financiero; Owner: franco
--

SELECT pg_catalog.setval('financiero.moneda_billetes_id_seq', 1, false);


--
-- Name: moneda_id_seq; Type: SEQUENCE SET; Schema: financiero; Owner: franco
--

SELECT pg_catalog.setval('financiero.moneda_id_seq', 1, false);


--
-- Data for Name: movimiento_caja; Type: TABLE DATA; Schema: financiero; Owner: franco
--

COPY financiero.movimiento_caja (id, caja_id, moneda_id, referencia_id, cambio_id, cantidad, tipo_movimiento, creado_en, usuario_id, activo) FROM stdin;
1	1	1	1	1	188500	CAJA_INICIAL	2022-03-23 21:48:49.272+00	\N	\N
2	1	2	1	9	91.3	CAJA_INICIAL	2022-03-23 21:48:49.325+00	\N	\N
3	1	3	1	10	0	CAJA_INICIAL	2022-03-23 21:48:49.366+00	\N	\N
4	1	1	1	1	46000	VENTA	2022-03-23 21:49:32.796+00	8	t
5	1	1	2	1	40000	VENTA	2022-03-23 21:54:41.577+00	8	t
6	1	1	3	1	30000	VENTA	2022-03-23 21:57:13.17+00	8	t
7	1	1	4	1	152000	VENTA	2022-03-26 17:20:50.381+00	8	t
8	1	1	5	1	152000	VENTA	2022-03-26 17:20:54.727+00	8	t
9	1	1	6	1	38000	VENTA	2022-03-26 17:21:35.756+00	8	t
10	1	1	7	1	114000	VENTA	2022-03-26 17:24:43.542+00	8	t
11	1	1	8	1	10000	VENTA	2022-03-28 14:34:35.558+00	8	t
12	1	1	9	1	10000	VENTA	2022-03-28 14:34:43.576+00	8	t
13	1	1	10	1	241000	VENTA	2022-03-28 14:34:58.049+00	8	t
14	1	1	11	1	6000	VENTA	2022-03-28 18:10:36.715+00	8	t
15	1	1	12	1	11000	VENTA	2022-03-28 18:27:17.165+00	8	t
16	1	1	13	1	11000	VENTA	2022-03-28 18:29:18.279+00	8	t
17	1	1	14	1	173000	VENTA	2022-03-28 18:32:23.219+00	8	t
18	1	1	15	1	30000	VENTA	2022-03-28 18:33:30.357+00	8	t
19	1	1	16	1	30000	VENTA	2022-03-28 18:34:08.488+00	8	t
20	2	1	3	1	188500	CAJA_INICIAL	2022-03-28 19:36:40.731+00	\N	\N
21	2	2	3	9	388.8	CAJA_INICIAL	2022-03-28 19:36:40.774+00	\N	\N
22	2	3	3	10	186	CAJA_INICIAL	2022-03-28 19:36:40.81+00	\N	\N
23	2	1	4	1	188500	CAJA_INICIAL	2022-03-28 19:53:50.172+00	\N	\N
24	2	2	4	9	388.8	CAJA_INICIAL	2022-03-28 19:53:50.214+00	\N	\N
25	2	3	4	10	186	CAJA_INICIAL	2022-03-28 19:53:50.254+00	\N	\N
26	2	1	5	1	188500	CAJA_INICIAL	2022-03-28 19:53:58.914+00	\N	\N
27	2	2	5	9	388.8	CAJA_INICIAL	2022-03-28 19:53:58.947+00	\N	\N
28	2	3	5	10	186	CAJA_INICIAL	2022-03-28 19:53:58.983+00	\N	\N
32	4	1	8	1	173500	CAJA_INICIAL	2022-03-29 00:26:35.809+00	\N	\N
33	4	2	8	9	71.9	CAJA_INICIAL	2022-03-29 00:26:35.855+00	\N	\N
34	4	3	8	10	30	CAJA_INICIAL	2022-03-29 00:26:35.894+00	\N	\N
35	4	1	9	1	82500	CAJA_INICIAL	2022-03-29 00:31:11.636+00	\N	\N
36	4	2	9	9	286.3	CAJA_INICIAL	2022-03-29 00:31:11.691+00	\N	\N
37	4	3	9	10	0	CAJA_INICIAL	2022-03-29 00:31:11.75+00	\N	\N
38	4	1	10	1	62500	CAJA_INICIAL	2022-03-29 00:34:35.216+00	\N	\N
39	4	2	10	9	26.3	CAJA_INICIAL	2022-03-29 00:34:35.262+00	\N	\N
40	4	3	10	10	0	CAJA_INICIAL	2022-03-29 00:34:35.299+00	\N	\N
41	4	1	11	1	62500	CAJA_INICIAL	2022-03-29 00:35:44.425+00	\N	\N
42	4	2	11	9	6.3	CAJA_INICIAL	2022-03-29 00:35:44.467+00	\N	\N
43	4	3	11	10	0	CAJA_INICIAL	2022-03-29 00:35:44.516+00	\N	\N
44	4	1	12	1	62500	CAJA_INICIAL	2022-03-29 00:38:57.692+00	\N	\N
45	4	2	12	9	3.6	CAJA_INICIAL	2022-03-29 00:38:57.738+00	\N	\N
46	4	3	12	10	0	CAJA_INICIAL	2022-03-29 00:38:57.788+00	\N	\N
47	4	1	13	1	62500	CAJA_INICIAL	2022-03-29 00:40:30.37+00	\N	\N
48	4	2	13	9	26.3	CAJA_INICIAL	2022-03-29 00:40:30.412+00	\N	\N
49	4	3	13	10	0	CAJA_INICIAL	2022-03-29 00:40:30.451+00	\N	\N
50	4	1	14	1	62500	CAJA_INICIAL	2022-03-29 00:46:37.124+00	\N	\N
51	4	2	14	9	1.3	CAJA_INICIAL	2022-03-29 00:46:37.169+00	\N	\N
52	4	3	14	10	0	CAJA_INICIAL	2022-03-29 00:46:37.21+00	\N	\N
53	4	1	15	1	62500	CAJA_INICIAL	2022-03-29 00:56:32.991+00	\N	\N
54	4	2	15	9	6.3	CAJA_INICIAL	2022-03-29 00:56:33.051+00	\N	\N
55	4	3	15	10	0	CAJA_INICIAL	2022-03-29 00:56:33.091+00	\N	\N
56	4	1	16	1	62500	CAJA_INICIAL	2022-03-29 00:57:43.402+00	\N	\N
57	4	2	16	9	6.3	CAJA_INICIAL	2022-03-29 00:57:43.45+00	\N	\N
58	4	3	16	10	0	CAJA_INICIAL	2022-03-29 00:57:43.49+00	\N	\N
59	4	1	17	1	62500	CAJA_INICIAL	2022-03-29 01:00:29.59+00	\N	\N
60	4	2	17	9	26.3	CAJA_INICIAL	2022-03-29 01:00:29.639+00	\N	\N
61	4	3	17	10	0	CAJA_INICIAL	2022-03-29 01:00:29.687+00	\N	\N
62	4	1	18	1	62500	CAJA_INICIAL	2022-03-29 01:04:01.877+00	\N	\N
63	4	2	18	9	6.3	CAJA_INICIAL	2022-03-29 01:04:01.925+00	\N	\N
64	4	3	18	10	0	CAJA_INICIAL	2022-03-29 01:04:01.989+00	\N	\N
65	4	1	19	1	62500	CAJA_INICIAL	2022-03-29 01:17:20.021+00	\N	\N
66	4	2	19	9	126.3	CAJA_INICIAL	2022-03-29 01:17:20.074+00	\N	\N
67	4	3	19	10	11	CAJA_INICIAL	2022-03-29 01:17:20.11+00	\N	\N
68	4	1	20	1	182500	CAJA_INICIAL	2022-03-29 01:20:04.114+00	\N	\N
69	4	2	20	9	58.65	CAJA_INICIAL	2022-03-29 01:20:04.174+00	\N	\N
70	4	3	20	10	11	CAJA_INICIAL	2022-03-29 01:20:04.246+00	\N	\N
71	4	1	22	1	62500	CAJA_INICIAL	2022-03-29 01:32:34.5+00	\N	\N
72	4	2	22	9	132.55	CAJA_INICIAL	2022-03-29 01:32:34.574+00	\N	\N
73	4	3	22	10	0	CAJA_INICIAL	2022-03-29 01:32:34.613+00	\N	\N
74	4	1	23	1	132500	CAJA_INICIAL	2022-03-29 01:34:56.133+00	\N	\N
75	4	2	23	9	31.3	CAJA_INICIAL	2022-03-29 01:34:56.197+00	\N	\N
76	4	3	23	10	0	CAJA_INICIAL	2022-03-29 01:34:56.293+00	\N	\N
77	4	1	24	1	62500	CAJA_INICIAL	2022-03-29 01:39:32.927+00	\N	\N
78	4	2	24	9	56.3	CAJA_INICIAL	2022-03-29 01:39:32.977+00	\N	\N
79	4	3	24	10	0	CAJA_INICIAL	2022-03-29 01:39:33.042+00	\N	\N
80	4	1	25	1	76500	CAJA_INICIAL	2022-03-29 01:43:02.309+00	\N	\N
81	4	2	25	9	63.3	CAJA_INICIAL	2022-03-29 01:43:02.335+00	\N	\N
82	4	3	25	10	0	CAJA_INICIAL	2022-03-29 01:43:02.365+00	\N	\N
83	4	1	26	1	32500	CAJA_INICIAL	2022-03-29 01:45:45.894+00	\N	\N
84	4	2	26	9	1.3	CAJA_INICIAL	2022-03-29 01:45:45.93+00	\N	\N
85	4	3	26	10	0	CAJA_INICIAL	2022-03-29 01:45:45.975+00	\N	\N
86	5	1	35	1	177500	CAJA_INICIAL	2022-03-29 12:45:33.634+00	\N	\N
87	5	2	35	9	133.35	CAJA_INICIAL	2022-03-29 12:45:33.669+00	\N	\N
88	5	3	35	10	0	CAJA_INICIAL	2022-03-29 12:45:33.708+00	\N	\N
89	5	1	17	1	80000	VENTA	2022-03-29 12:46:55.196+00	8	t
90	5	1	18	1	30000	VENTA	2022-03-29 12:50:18.812+00	8	t
91	5	1	19	1	40000	VENTA	2022-03-29 12:51:36.696+00	8	t
92	5	1	20	1	33000	VENTA	2022-03-29 12:52:32.127+00	8	t
93	5	1	21	1	30000	VENTA	2022-03-29 12:54:05.841+00	8	t
94	5	2	22	9	5	VENTA	2022-03-29 12:55:54.147+00	8	t
95	5	1	22	1	2000	VENTA	2022-03-29 12:55:54.28+00	8	t
96	5	1	22	1	-1000	VENTA	2022-03-29 12:55:54.386+00	8	t
97	5	1	22	1	250	VENTA	2022-03-29 12:55:54.476+00	8	t
98	5	1	23	1	38000	VENTA	2022-03-29 13:11:25.678+00	8	t
99	5	1	24	1	40000	VENTA	2022-03-29 13:11:39.404+00	8	t
100	5	1	25	1	275000	VENTA	2022-03-29 13:12:55.109+00	8	t
101	5	1	1	1	-50000	RETIRO	2022-03-29 13:13:20.405+00	8	\N
102	5	2	2	9	-20	RETIRO	2022-03-29 13:13:20.511+00	8	\N
103	5	3	3	10	0	RETIRO	2022-03-29 13:13:20.623+00	8	\N
104	6	1	37	1	3500	CAJA_INICIAL	2022-03-29 13:22:45.645+00	\N	\N
105	6	2	37	9	0	CAJA_INICIAL	2022-03-29 13:22:45.668+00	\N	\N
106	6	3	37	10	0	CAJA_INICIAL	2022-03-29 13:22:45.697+00	\N	\N
107	7	1	38	1	13500	CAJA_INICIAL	2022-03-29 13:23:53.997+00	\N	\N
108	7	2	38	9	0	CAJA_INICIAL	2022-03-29 13:23:54.026+00	\N	\N
109	7	3	38	10	0	CAJA_INICIAL	2022-03-29 13:23:54.05+00	\N	\N
110	8	1	40	1	77500	CAJA_INICIAL	2022-03-29 14:13:22.761+00	\N	\N
111	8	2	40	9	177.8	CAJA_INICIAL	2022-03-29 14:13:22.789+00	\N	\N
112	8	3	40	10	0	CAJA_INICIAL	2022-03-29 14:13:22.818+00	\N	\N
113	9	1	42	1	62500	CAJA_INICIAL	2022-03-29 14:15:42.483+00	\N	\N
114	9	2	42	9	126.3	CAJA_INICIAL	2022-03-29 14:15:42.508+00	\N	\N
115	9	3	42	10	0	CAJA_INICIAL	2022-03-29 14:15:42.53+00	\N	\N
116	6	1	26	1	35000	VENTA	2022-03-29 15:58:36.845+00	2	t
117	9	1	27	1	271000	VENTA	2022-04-01 01:38:44.554+00	8	t
118	9	1	28	1	47000	VENTA	2022-04-01 01:39:16.55+00	8	t
119	9	1	29	1	112000	VENTA	2022-04-01 01:39:45.139+00	8	t
120	9	1	30	1	14500	VENTA	2022-04-01 01:40:52.455+00	8	t
121	9	1	31	1	10500	VENTA	2022-04-01 01:42:13.317+00	8	t
122	10	1	43	1	78500	CAJA_INICIAL	2022-06-04 17:27:55.985+00	\N	\N
123	10	2	43	9	77.75	CAJA_INICIAL	2022-06-04 17:27:56.039+00	\N	\N
124	10	3	43	10	35	CAJA_INICIAL	2022-06-04 17:27:56.074+00	\N	\N
125	11	1	49	1	68500	CAJA_INICIAL	2022-06-04 18:23:24.006+00	\N	\N
126	11	2	49	9	28.4	CAJA_INICIAL	2022-06-04 18:23:24.051+00	\N	\N
127	11	3	49	10	0	CAJA_INICIAL	2022-06-04 18:23:24.085+00	\N	\N
128	12	1	51	1	83500	CAJA_INICIAL	2022-06-04 18:40:58.315+00	\N	\N
129	12	2	51	9	7.85	CAJA_INICIAL	2022-06-04 18:40:58.352+00	\N	\N
130	12	3	51	10	0	CAJA_INICIAL	2022-06-04 18:40:58.39+00	\N	\N
131	13	1	53	1	134000	CAJA_INICIAL	2022-06-04 18:59:27.801+00	\N	\N
132	13	2	53	9	133.35	CAJA_INICIAL	2022-06-04 18:59:27.841+00	\N	\N
133	13	3	53	10	0	CAJA_INICIAL	2022-06-04 18:59:27.882+00	\N	\N
134	14	1	55	1	131500	CAJA_INICIAL	2022-06-04 19:25:02.65+00	\N	\N
135	14	2	55	9	73.35	CAJA_INICIAL	2022-06-04 19:25:02.691+00	\N	\N
136	14	3	55	10	0	CAJA_INICIAL	2022-06-04 19:25:02.725+00	\N	\N
137	15	1	57	1	133500	CAJA_INICIAL	2022-06-04 19:29:15.365+00	\N	\N
138	15	2	57	9	157.35	CAJA_INICIAL	2022-06-04 19:29:15.4+00	\N	\N
139	15	3	57	10	0	CAJA_INICIAL	2022-06-04 19:29:15.43+00	\N	\N
140	16	1	59	1	166500	CAJA_INICIAL	2022-06-16 17:08:03.367+00	\N	\N
141	16	2	59	9	317.35	CAJA_INICIAL	2022-06-16 17:08:03.399+00	\N	\N
142	16	3	59	10	0	CAJA_INICIAL	2022-06-16 17:08:03.424+00	\N	\N
143	16	1	32	1	460000	VENTA	2022-06-18 13:19:49.671+00	1	t
144	16	1	4	1	-100000	RETIRO	2022-06-18 13:23:04.127+00	1	\N
145	16	2	5	9	0	RETIRO	2022-06-18 13:23:04.242+00	1	\N
146	16	3	6	10	0	RETIRO	2022-06-18 13:23:04.365+00	1	\N
\.


--
-- Name: movimiento_caja_id_seq; Type: SEQUENCE SET; Schema: financiero; Owner: franco
--

SELECT pg_catalog.setval('financiero.movimiento_caja_id_seq', 146, true);


--
-- Data for Name: pdv_caja; Type: TABLE DATA; Schema: financiero; Owner: franco
--

COPY financiero.pdv_caja (id, descripcion, activo, estado, tuvo_problema, fecha_apertura, fecha_cierre, observacion, creado_en, maletin_id, usuario_id, conteo_apertura_id, conteo_cierre_id) FROM stdin;
1	\N	f	\N	\N	2022-03-23 21:48:00+00	2022-03-28 19:11:41.209+00	\N	2022-03-23 21:48:00+00	1	8	1	2
2	\N	f	\N	\N	2022-03-28 19:53:00+00	2022-03-28 19:55:57.994+00	\N	2022-03-28 19:36:00+00	1	8	5	6
4	\N	f	\N	\N	2022-03-29 01:45:45.844+00	2022-03-29 02:35:01.831+00	\N	2022-03-29 01:20:04.025+00	2	8	26	34
5	\N	f	\N	\N	2022-03-29 12:45:33.557+00	2022-03-29 13:14:09.288+00	\N	2022-03-29 02:42:17.274+00	2	8	35	36
7	\N	f	\N	\N	2022-03-29 13:23:53.952+00	2022-03-29 14:12:34.235+00	\N	2022-03-29 13:23:41.151+00	3	8	38	39
8	\N	f	\N	\N	2022-03-29 14:13:22.719+00	2022-03-29 14:15:09.691+00	\N	2022-03-29 14:12:58.94+00	3	8	40	41
10	\N	f	\N	\N	2022-06-04 17:27:55.882+00	2022-06-04 17:59:55.615+00	\N	2022-06-04 15:52:56.536+00	1	1	43	48
11	\N	f	\N	\N	2022-06-04 18:22:41.096+00	2022-06-04 18:32:07.215+00	\N	2022-06-04 18:21:51.334+00	1	1	49	50
9	\N	f	\N	\N	2022-03-29 14:15:42.444+00	\N	\N	2022-03-29 14:15:30.912+00	3	8	42	\N
6	\N	f	\N	\N	2022-03-29 13:22:45.599+00	\N	\N	2022-03-29 13:22:40.255+00	2	2	37	\N
12	\N	f	\N	\N	2022-06-04 18:40:58.264+00	2022-06-04 18:46:55.548+00	\N	2022-06-04 18:40:45.797+00	1	1	51	52
13	\N	f	\N	\N	2022-06-04 18:59:27.744+00	2022-06-04 19:02:28.002+00	\N	2022-06-04 18:59:12.514+00	1	1	53	54
14	\N	f	\N	\N	2022-06-04 19:25:02.578+00	2022-06-04 19:26:13.542+00	\N	2022-06-04 19:09:56.66+00	1	1	55	56
15	\N	f	\N	\N	2022-06-04 19:29:15.313+00	2022-06-04 19:30:32.535+00	\N	2022-06-04 19:29:05.914+00	1	1	57	58
16	\N	t	\N	\N	2022-06-16 17:08:03.312+00	\N	\N	2022-06-16 17:07:44.584+00	1	1	59	\N
\.


--
-- Name: pdv_caja_id_seq; Type: SEQUENCE SET; Schema: financiero; Owner: franco
--

SELECT pg_catalog.setval('financiero.pdv_caja_id_seq', 16, true);


--
-- Data for Name: retiro; Type: TABLE DATA; Schema: financiero; Owner: franco
--

COPY financiero.retiro (id, responsable_id, estado, observacion, creado_en, usuario_id, caja_salida_id, caja_entrada_id) FROM stdin;
1	1	\N	\N	2022-03-29 13:13:20.261+00	8	5	\N
2	1	\N	\N	2022-06-18 13:23:03.918+00	1	16	\N
\.


--
-- Data for Name: retiro_detalle; Type: TABLE DATA; Schema: financiero; Owner: franco
--

COPY financiero.retiro_detalle (id, retiro_id, moneda_id, cambio, cantidad, creado_en, usuario_id) FROM stdin;
1	1	1	1	50000	2022-03-29 13:13:20.369+00	8
2	1	2	1250	20	2022-03-29 13:13:20.486+00	8
3	1	3	6800	0	2022-03-29 13:13:20.597+00	8
4	2	1	1	100000	2022-06-18 13:23:04.083+00	1
5	2	2	1250	0	2022-06-18 13:23:04.207+00	1
6	2	3	6800	0	2022-06-18 13:23:04.324+00	1
\.


--
-- Name: retiro_detalle_id_seq; Type: SEQUENCE SET; Schema: financiero; Owner: franco
--

SELECT pg_catalog.setval('financiero.retiro_detalle_id_seq', 6, true);


--
-- Name: retiro_id_seq; Type: SEQUENCE SET; Schema: financiero; Owner: franco
--

SELECT pg_catalog.setval('financiero.retiro_id_seq', 2, true);


--
-- Data for Name: sencillo; Type: TABLE DATA; Schema: financiero; Owner: franco
--

COPY financiero.sencillo (id, responsable_id, entrada, autorizado_por_id, observacion, creado_en, usuario_id) FROM stdin;
\.


--
-- Data for Name: sencillo_detalle; Type: TABLE DATA; Schema: financiero; Owner: franco
--

COPY financiero.sencillo_detalle (id, sencillo_id, moneda_id, cambio_id, cantidad, creado_en, usuario_id) FROM stdin;
\.


--
-- Name: sencillo_detalle_id_seq; Type: SEQUENCE SET; Schema: financiero; Owner: franco
--

SELECT pg_catalog.setval('financiero.sencillo_detalle_id_seq', 1, false);


--
-- Name: sencillo_id_seq; Type: SEQUENCE SET; Schema: financiero; Owner: franco
--

SELECT pg_catalog.setval('financiero.sencillo_id_seq', 1, false);


--
-- Data for Name: tipo_gasto; Type: TABLE DATA; Schema: financiero; Owner: franco
--

COPY financiero.tipo_gasto (id, is_clasificacion, clasificacion_gasto_id, descripcion, activo, autorizacion, cargo_id, creado_en, usuario_id, id_central) FROM stdin;
2	\N	1	SALARIOS	t	t	\N	2021-11-26 03:46:17.868+00	1	\N
37	\N	2	ANTICIPO	t	t	\N	2021-11-26 03:46:44.221+00	1	\N
8	t	\N	SERVICIOS	t	\N	\N	2021-11-25 15:17:04.100235+00	1	\N
10	t	8	INTERNET	t	\N	\N	2021-11-25 15:17:04.100235+00	1	\N
11	t	8	ENERGIA	t	\N	\N	2021-11-25 15:17:04.100235+00	1	\N
13	\N	12	PRODUCTOS	t	\N	\N	2021-11-25 18:43:17.813928+00	\N	\N
14	\N	12	SERVICIOS	t	\N	\N	2021-11-25 18:43:17.834002+00	\N	\N
12	t	\N	LIMPIEZA	t	\N	\N	2021-11-25 15:17:04.100235+00	1	\N
15	\N	\N	BIENES MATERIALES	t	\N	\N	2021-11-25 18:43:17.834002+00	\N	\N
16	\N	15	EQUIPOS INFORMATICOS	t	\N	\N	2021-11-25 18:43:17.834002+00	\N	\N
17	\N	15	MUEBLES	t	\N	\N	2021-11-25 18:43:17.834002+00	\N	\N
18	\N	15	VEHICULOS	t	\N	\N	2021-11-25 18:43:17.834002+00	\N	\N
19	\N	18	MANTENIMIENTO	t	\N	\N	2021-11-25 18:43:17.834002+00	\N	\N
20	\N	18	COMBUSTIBLE	t	\N	\N	2021-11-25 18:43:17.834002+00	\N	\N
21	\N	19	MANO DE OBRA	t	\N	\N	2021-11-25 18:43:17.834002+00	\N	\N
22	\N	19	COMPRA PIEZAS	t	\N	\N	2021-11-25 18:43:17.834002+00	\N	\N
23	\N	\N	MARKETING	t	\N	\N	2021-11-25 20:39:08.918+00	1	\N
25	\N	23	PUBLICIDAD	t	\N	\N	2021-11-25 20:45:13.823+00	1	\N
27	\N	2	AGUINALDO	t	\N	\N	2021-11-26 01:40:22.185+00	1	\N
28	\N	\N	INSUMOS	t	\N	\N	2021-11-26 01:53:32.496+00	1	\N
29	\N	28	DIRECTOS	t	\N	\N	2021-11-26 01:53:46.562+00	1	\N
30	\N	28	INDIRECTOS	t	\N	\N	2021-11-26 01:56:25.698+00	1	\N
31	\N	30	PRUEBA 1	t	\N	\N	2021-11-26 02:04:34.46+00	1	\N
32	\N	30	PRUEBA 2	t	\N	\N	2021-11-26 02:05:47.394+00	1	\N
1	\N	\N	RRHHS	t	\N	\N	2021-11-26 03:32:57.264+00	1	\N
6	\N	5	MATERIALES	t	\N	\N	2021-11-26 03:42:00.185+00	1	\N
3	t	2	VALE	t	t	\N	2021-11-25 14:55:44.546529+00	1	\N
26	\N	23	AUSPICIO	t	t	\N	2021-11-26 01:35:36.103+00	1	\N
4	t	2	COMISION	t	t	\N	2021-11-25 14:58:20.017877+00	1	\N
7	t	5	CONTABLES	t	t	\N	2021-11-25 15:17:04.100235+00	1	\N
9	t	8	TELEFONIA	t	t	\N	2021-11-25 15:17:04.100235+00	1	\N
5	\N	\N	ADMINISTRATIVO	t	t	\N	2021-11-26 03:42:06.897+00	1	\N
24	\N	23	MATERIAL PUBLICITARIO	t	t	\N	2021-11-26 03:43:30.315+00	1	\N
42	\N	\N	COMPRAS AUTORIZADAS	t	\N	\N	2022-02-10 13:01:54.546512+00	1	\N
41	t	\N	ALIMENTACION	t	\N	\N	2022-02-05 16:01:33.218188+00	1	\N
\.


--
-- Name: tipo_gasto_id_seq; Type: SEQUENCE SET; Schema: financiero; Owner: franco
--

SELECT pg_catalog.setval('financiero.tipo_gasto_id_seq', 1, false);


--
-- Data for Name: barrio; Type: TABLE DATA; Schema: general; Owner: franco
--

COPY general.barrio (id, descripcion, ciudad_id, precio_delivery_id, usuario_id, creado_en, id_central) FROM stdin;
\.


--
-- Name: barrio_id_seq; Type: SEQUENCE SET; Schema: general; Owner: franco
--

SELECT pg_catalog.setval('general.barrio_id_seq', 1, false);


--
-- Data for Name: ciudad; Type: TABLE DATA; Schema: general; Owner: franco
--

COPY general.ciudad (id, descripcion, pais_id, codigo, usuario_id, creado_en) FROM stdin;
2	PALOMA	1	PES	1	2021-05-04 18:43:32.631414+00
3	KATUETE	1	KTT	1	2021-05-04 18:43:32.646834+00
4	NUEVA ESPERANZA	1	NE	1	2021-05-04 18:43:32.651566+00
1	SALTO DEL GUAIRA	1	SDG	1	2021-02-12 18:07:38.423277+00
\.


--
-- Name: ciudad_id_seq; Type: SEQUENCE SET; Schema: general; Owner: franco
--

SELECT pg_catalog.setval('general.ciudad_id_seq', 1, false);


--
-- Data for Name: contacto; Type: TABLE DATA; Schema: general; Owner: franco
--

COPY general.contacto (id, email, telefono, persona_id, usuario_id, creado_en) FROM stdin;
\.


--
-- Name: contacto_id_seq; Type: SEQUENCE SET; Schema: general; Owner: franco
--

SELECT pg_catalog.setval('general.contacto_id_seq', 1, false);


--
-- Data for Name: pais; Type: TABLE DATA; Schema: general; Owner: franco
--

COPY general.pais (id, descripcion, codigo, usuario_id, creado_en) FROM stdin;
1	Paraguay	PY	1	2021-02-11 02:32:00.421945+00
2	Brasil	BR	1	2021-02-11 02:32:17.712255+00
3	Argentina	ARG	1	2021-02-11 02:32:32.883486+00
4	ESTADOS UNIDOS	US	1	2021-04-06 17:54:00.999685+00
\.


--
-- Name: pais_id_seq; Type: SEQUENCE SET; Schema: general; Owner: franco
--

SELECT pg_catalog.setval('general.pais_id_seq', 1, false);


--
-- Data for Name: cobro; Type: TABLE DATA; Schema: operaciones; Owner: franco
--

COPY operaciones.cobro (id, creado_en, usuario_id, total_gs) FROM stdin;
1	2022-03-23 21:49:32.565+00	8	46000
2	2022-03-23 21:54:41.44+00	8	40000
3	2022-03-23 21:57:12.672+00	8	30000
4	2022-03-26 17:20:50.074+00	8	152000
5	2022-03-26 17:20:54.576+00	8	152000
6	2022-03-26 17:21:35.613+00	8	38000
7	2022-03-26 17:24:43.365+00	8	114000
8	2022-03-28 14:34:35.17+00	8	10000
9	2022-03-28 14:34:43.389+00	8	10000
10	2022-03-28 14:34:57.902+00	8	241000
11	2022-03-28 18:10:36.374+00	8	6000
12	2022-03-28 18:27:16.873+00	8	11000
13	2022-03-28 18:29:18.137+00	8	11000
14	2022-03-28 18:32:23.02+00	8	173000
15	2022-03-28 18:33:30.234+00	8	30000
16	2022-03-28 18:34:08.097+00	8	30000
17	2022-03-29 12:46:55.004+00	8	80000
18	2022-03-29 12:50:18.466+00	8	30000
19	2022-03-29 12:51:36.565+00	8	40000
20	2022-03-29 12:52:32.006+00	8	33000
21	2022-03-29 12:54:05.693+00	8	30000
22	2022-03-29 12:55:53.983+00	8	7000
23	2022-03-29 13:11:25.354+00	8	38000
24	2022-03-29 13:11:39.254+00	8	40000
25	2022-03-29 13:12:54.994+00	8	275000
26	2022-03-29 15:58:36.698+00	2	35000
27	2022-04-01 01:38:44.096+00	8	271000
28	2022-04-01 01:39:16.393+00	8	47000
29	2022-04-01 01:39:44.917+00	8	112000
30	2022-04-01 01:40:52.308+00	8	14500
31	2022-04-01 01:42:13.136+00	8	10500
32	2022-06-18 13:19:49.244+00	1	460000
\.


--
-- Data for Name: cobro_detalle; Type: TABLE DATA; Schema: operaciones; Owner: franco
--

COPY operaciones.cobro_detalle (id, cobro_id, creado_en, usuario_id, moneda_id, forma_pago_id, valor, cambio, vuelto, descuento, pago, aumento) FROM stdin;
1	1	2022-03-23 21:49:32.672+00	\N	1	1	46000	1	f	f	t	f
2	2	2022-03-23 21:54:41.524+00	\N	1	1	40000	1	f	f	t	f
3	3	2022-03-23 21:57:12.985+00	\N	1	1	30000	1	f	f	t	f
4	4	2022-03-26 17:20:50.282+00	\N	1	1	152000	1	f	f	t	f
5	5	2022-03-26 17:20:54.668+00	\N	1	1	152000	1	f	f	t	f
6	6	2022-03-26 17:21:35.703+00	\N	1	1	38000	1	f	f	t	f
7	7	2022-03-26 17:24:43.483+00	\N	1	1	114000	1	f	f	t	f
8	8	2022-03-28 14:34:35.451+00	\N	1	1	10000	1	f	f	t	f
9	9	2022-03-28 14:34:43.472+00	\N	1	1	10000	1	f	f	t	f
10	10	2022-03-28 14:34:57.992+00	\N	1	1	241000	1	f	f	t	f
11	11	2022-03-28 18:10:36.593+00	\N	1	1	6000	1	f	f	t	f
12	12	2022-03-28 18:27:17.057+00	\N	1	1	11000	1	f	f	t	f
13	13	2022-03-28 18:29:18.227+00	\N	1	1	11000	1	f	f	t	f
14	14	2022-03-28 18:32:23.164+00	\N	1	1	173000	1	f	f	t	f
15	15	2022-03-28 18:33:30.308+00	\N	1	1	30000	1	f	f	t	f
16	16	2022-03-28 18:34:08.29+00	\N	1	1	30000	1	f	f	t	f
17	17	2022-03-29 12:46:55.114+00	\N	1	1	80000	1	f	f	t	f
18	18	2022-03-29 12:50:18.716+00	\N	1	1	30000	1	f	f	t	f
19	19	2022-03-29 12:51:36.645+00	\N	1	1	40000	1	f	f	t	f
20	20	2022-03-29 12:52:32.078+00	\N	1	1	33000	1	f	f	t	f
21	21	2022-03-29 12:54:05.772+00	\N	1	1	30000	1	f	f	t	f
22	22	2022-03-29 12:55:54.081+00	\N	2	1	5	1250	f	f	t	f
23	22	2022-03-29 12:55:54.234+00	\N	1	1	2000	1	f	f	t	f
24	22	2022-03-29 12:55:54.33+00	\N	1	1	-1000	1	t	f	f	f
25	22	2022-03-29 12:55:54.431+00	\N	1	1	250	1	t	f	f	t
26	23	2022-03-29 13:11:25.585+00	\N	1	1	38000	1	f	f	t	f
27	24	2022-03-29 13:11:39.345+00	\N	1	1	40000	1	f	f	t	f
28	25	2022-03-29 13:12:55.064+00	\N	1	1	275000	1	f	f	t	f
29	26	2022-03-29 15:58:36.785+00	\N	1	1	35000	1	f	f	t	f
30	27	2022-04-01 01:38:44.412+00	\N	1	1	271000	1	f	f	t	f
31	28	2022-04-01 01:39:16.486+00	\N	1	1	47000	1	f	f	t	f
32	29	2022-04-01 01:39:45.067+00	\N	1	1	112000	1	f	f	t	f
33	30	2022-04-01 01:40:52.403+00	\N	1	1	14500	1	f	f	t	f
34	31	2022-04-01 01:42:13.241+00	\N	1	1	10500	1	f	f	t	f
35	32	2022-06-18 13:19:49.504+00	\N	1	1	460000	1	f	f	t	f
\.


--
-- Name: cobro_detalle_id_seq; Type: SEQUENCE SET; Schema: operaciones; Owner: franco
--

SELECT pg_catalog.setval('operaciones.cobro_detalle_id_seq', 35, true);


--
-- Name: cobro_id_seq; Type: SEQUENCE SET; Schema: operaciones; Owner: franco
--

SELECT pg_catalog.setval('operaciones.cobro_id_seq', 32, true);


--
-- Data for Name: compra; Type: TABLE DATA; Schema: operaciones; Owner: franco
--

COPY operaciones.compra (id, pedido_id, sucursal_id, proveedor_id, contacto_proveedor_id, fecha, nro_nota, fecha_de_entrega, moneda_id, descuento, estado, creado_en, usuario_id, forma_pago_id) FROM stdin;
\.


--
-- Name: compra_id_seq; Type: SEQUENCE SET; Schema: operaciones; Owner: franco
--

SELECT pg_catalog.setval('operaciones.compra_id_seq', 1, false);


--
-- Data for Name: compra_item; Type: TABLE DATA; Schema: operaciones; Owner: franco
--

COPY operaciones.compra_item (id, compra_id, producto_id, cantidad, precio_unitario, descuento_unitario, bonificacion, frio, observacion, creado_en, usuario_id, lote, valor_total, vencimiento, presentacion_id, pedido_item_id, estado, verificado, programar_precio_id) FROM stdin;
\.


--
-- Name: compra_item_id_seq; Type: SEQUENCE SET; Schema: operaciones; Owner: franco
--

SELECT pg_catalog.setval('operaciones.compra_item_id_seq', 1, false);


--
-- Data for Name: delivery; Type: TABLE DATA; Schema: operaciones; Owner: franco
--

COPY operaciones.delivery (id, venta_id, valor_en_gs, precio_delivery_id, entregador_id, telefono, direccion, cliente_id, forma_pago_id, creado_en, usuario_id, estado, barrio_id, vehiculo_id, vuelto_id) FROM stdin;
\.


--
-- Name: delivery_id_seq; Type: SEQUENCE SET; Schema: operaciones; Owner: franco
--

SELECT pg_catalog.setval('operaciones.delivery_id_seq', 1, false);


--
-- Data for Name: entrada; Type: TABLE DATA; Schema: operaciones; Owner: franco
--

COPY operaciones.entrada (id, responsable_carga_id, tipo_entrada, observacion, creado_en, usuario_id, sucursal_id, activo) FROM stdin;
\.


--
-- Name: entrada_id_seq; Type: SEQUENCE SET; Schema: operaciones; Owner: franco
--

SELECT pg_catalog.setval('operaciones.entrada_id_seq', 1, false);


--
-- Data for Name: entrada_item; Type: TABLE DATA; Schema: operaciones; Owner: franco
--

COPY operaciones.entrada_item (id, producto_id, presentacion_id, cantidad, observacion, creado_en, usuario_id, entrada_id) FROM stdin;
\.


--
-- Name: entrada_item_id_seq; Type: SEQUENCE SET; Schema: operaciones; Owner: franco
--

SELECT pg_catalog.setval('operaciones.entrada_item_id_seq', 1, false);


--
-- Data for Name: inventario; Type: TABLE DATA; Schema: operaciones; Owner: franco
--

COPY operaciones.inventario (id, id_central, id_origen, sucursal_id, fecha_inicio, fecha_fin, abierto, tipo, estado, usuario_id, observacion) FROM stdin;
7	\N	\N	1	2022-06-06 15:01:27.907	\N	t	ZONA	ABIERTO	1	\N
9	\N	\N	1	2022-07-03 15:20:48.141396	\N	t	ZONA	ABIERTO	1	\N
\.


--
-- Name: inventario_id_seq; Type: SEQUENCE SET; Schema: operaciones; Owner: franco
--

SELECT pg_catalog.setval('operaciones.inventario_id_seq', 20, true);


--
-- Data for Name: inventario_producto; Type: TABLE DATA; Schema: operaciones; Owner: franco
--

COPY operaciones.inventario_producto (id, id_central, id_origen, inventario_id, producto_id, zona_id, concluido, usuario_id, creado_en) FROM stdin;
30	\N	\N	9	\N	4	f	2	\N
28	\N	\N	9	\N	1	t	1	\N
31	\N	\N	9	\N	6	t	1	\N
32	\N	\N	9	\N	2	f	1	\N
\.


--
-- Name: inventario_producto_id_seq; Type: SEQUENCE SET; Schema: operaciones; Owner: franco
--

SELECT pg_catalog.setval('operaciones.inventario_producto_id_seq', 297575, true);


--
-- Data for Name: inventario_producto_item; Type: TABLE DATA; Schema: operaciones; Owner: franco
--

COPY operaciones.inventario_producto_item (id, id_central, id_origen, inventario_producto_id, presentacion_id, zona_id, cantidad, vencimiento, estado, usuario_id, creado_en, cantidad_fisica) FROM stdin;
25	\N	\N	28	143	\N	7	2022-12-01 00:00:00	BUENO	1	2022-07-03 15:49:57.387004	\N
26	\N	\N	30	109	\N	31	2022-09-15 00:00:00	BUENO	2	2022-07-03 15:50:56.798862	\N
27	\N	\N	28	648	\N	3	2024-12-01 00:00:00	BUENO	1	2022-07-03 15:52:18.565034	\N
28	\N	\N	28	1163	\N	4	2025-07-03 00:00:00	BUENO	1	2022-07-03 16:02:06.780313	\N
29	\N	\N	28	1162	\N	4	2025-07-03 00:00:00	BUENO	1	2022-07-03 16:02:48.556176	\N
30	\N	\N	31	748	\N	10	2022-07-22 00:00:00	BUENO	1	2022-07-03 16:05:05.32769	\N
31	\N	\N	31	440	\N	6	2023-03-11 00:00:00	BUENO	1	2022-07-03 16:06:51.734365	\N
\.


--
-- Name: inventario_producto_item_id_seq; Type: SEQUENCE SET; Schema: operaciones; Owner: franco
--

SELECT pg_catalog.setval('operaciones.inventario_producto_item_id_seq', 644857, true);


--
-- Data for Name: motivo_diferencia_pedido; Type: TABLE DATA; Schema: operaciones; Owner: franco
--

COPY operaciones.motivo_diferencia_pedido (id, tipo, descripcion, creado_en, usuario_id) FROM stdin;
\.


--
-- Name: motivo_diferencia_pedido_id_seq; Type: SEQUENCE SET; Schema: operaciones; Owner: franco
--

SELECT pg_catalog.setval('operaciones.motivo_diferencia_pedido_id_seq', 1, false);


--
-- Data for Name: movimiento_stock; Type: TABLE DATA; Schema: operaciones; Owner: franco
--

COPY operaciones.movimiento_stock (id, producto_id, tipo_movimiento, referencia, cantidad, creado_en, usuario_id, estado, sucursal_id) FROM stdin;
395	29	TRANSFERENCIA	11	-480	2022-05-17 20:02:45.739+00	\N	t	\N
396	24	TRANSFERENCIA	11	-11	2022-05-17 20:02:45.833+00	\N	t	\N
397	685	TRANSFERENCIA	11	-20	2022-05-17 20:02:45.874+00	\N	t	\N
398	684	TRANSFERENCIA	11	-20	2022-05-17 20:02:45.981+00	\N	t	\N
399	29	TRANSFERENCIA	11	480	2022-05-24 15:42:07.28+00	\N	t	\N
400	24	TRANSFERENCIA	11	11	2022-05-24 15:42:07.457+00	\N	t	\N
401	685	TRANSFERENCIA	11	20	2022-05-24 15:42:07.5+00	\N	t	\N
402	684	TRANSFERENCIA	11	20	2022-05-24 15:42:07.549+00	\N	t	\N
403	802	AJUSTE	8	14	2022-06-06 20:35:10.796+00	\N	t	\N
404	821	AJUSTE	8	7	2022-06-06 20:35:11.037+00	\N	t	\N
405	832	AJUSTE	8	17	2022-06-06 20:35:11.083+00	\N	t	\N
406	29	AJUSTE	8	480	2022-06-06 20:35:11.121+00	\N	t	\N
407	451	AJUSTE	8	240	2022-06-06 20:35:11.149+00	\N	t	\N
408	285	AJUSTE	8	20	2022-06-06 20:35:11.183+00	\N	t	\N
409	54	VENTA	48	-120	2022-06-18 13:19:50.477+00	\N	t	\N
77	29	TRANSFERENCIA	11	-480	2022-05-17 19:55:25.534+00	\N	t	\N
\.


--
-- Name: movimiento_stock_id_seq; Type: SEQUENCE SET; Schema: operaciones; Owner: franco
--

SELECT pg_catalog.setval('operaciones.movimiento_stock_id_seq', 409, true);


--
-- Data for Name: necesidad; Type: TABLE DATA; Schema: operaciones; Owner: franco
--

COPY operaciones.necesidad (id, sucursal_id, fecha, estado, creado_en, usuario_id) FROM stdin;
\.


--
-- Name: necesidad_id_seq; Type: SEQUENCE SET; Schema: operaciones; Owner: franco
--

SELECT pg_catalog.setval('operaciones.necesidad_id_seq', 1, false);


--
-- Data for Name: necesidad_item; Type: TABLE DATA; Schema: operaciones; Owner: franco
--

COPY operaciones.necesidad_item (id, autogenerado, cantidad_sugerida, modificado, necesidad_id, producto_id, cantidad, observacion, estado, creado_en, usuario_id, frio) FROM stdin;
\.


--
-- Name: necesidad_item_id_seq; Type: SEQUENCE SET; Schema: operaciones; Owner: franco
--

SELECT pg_catalog.setval('operaciones.necesidad_item_id_seq', 1, false);


--
-- Data for Name: nota_pedido; Type: TABLE DATA; Schema: operaciones; Owner: franco
--

COPY operaciones.nota_pedido (id, pedido_id, nro_nota, creado_en, usuario_id) FROM stdin;
\.


--
-- Name: nota_pedido_id_seq; Type: SEQUENCE SET; Schema: operaciones; Owner: franco
--

SELECT pg_catalog.setval('operaciones.nota_pedido_id_seq', 1, false);


--
-- Data for Name: nota_recepcion; Type: TABLE DATA; Schema: operaciones; Owner: franco
--

COPY operaciones.nota_recepcion (id, pedido_id, compra_id, documento_id, valor, descuento, pagado, numero, timbrado, creado_en, usuario_id) FROM stdin;
\.


--
-- Name: nota_recepcion_id_seq; Type: SEQUENCE SET; Schema: operaciones; Owner: franco
--

SELECT pg_catalog.setval('operaciones.nota_recepcion_id_seq', 1, false);


--
-- Data for Name: nota_recepcion_item; Type: TABLE DATA; Schema: operaciones; Owner: franco
--

COPY operaciones.nota_recepcion_item (id, nota_recepcion_id, pedido_item_id, creado_en, usuario_id) FROM stdin;
\.


--
-- Name: nota_recepcion_item_id_seq; Type: SEQUENCE SET; Schema: operaciones; Owner: franco
--

SELECT pg_catalog.setval('operaciones.nota_recepcion_item_id_seq', 1, false);


--
-- Data for Name: pedido; Type: TABLE DATA; Schema: operaciones; Owner: franco
--

COPY operaciones.pedido (id, necesidad_id, proveedor_id, vendedor_id, fecha_de_entrega, plazo_credito, moneda_id, descuento, estado, creado_en, usuario_id, cantidad_notas, cod_interno_proveedor, forma_pago_id) FROM stdin;
\.


--
-- Name: pedido_id_seq; Type: SEQUENCE SET; Schema: operaciones; Owner: franco
--

SELECT pg_catalog.setval('operaciones.pedido_id_seq', 1, false);


--
-- Data for Name: pedido_item; Type: TABLE DATA; Schema: operaciones; Owner: franco
--

COPY operaciones.pedido_item (id, pedido_id, producto_id, precio_unitario, descuento_unitario, bonificacion, frio, observacion, estado, creado_en, usuario_id, nota_pedido_id, bonificacion_detalle, vencimiento, presentacion_id, cantidad, nota_recepcion_id) FROM stdin;
\.


--
-- Name: pedido_item_id_seq; Type: SEQUENCE SET; Schema: operaciones; Owner: franco
--

SELECT pg_catalog.setval('operaciones.pedido_item_id_seq', 1, false);


--
-- Data for Name: pedido_item_sucursal; Type: TABLE DATA; Schema: operaciones; Owner: franco
--

COPY operaciones.pedido_item_sucursal (id, pedido_item_id, sucursal_id, sucursal_entrega_id, cantidad, creado_en, usuario_id) FROM stdin;
\.


--
-- Name: pedido_item_sucursal_id_seq; Type: SEQUENCE SET; Schema: operaciones; Owner: franco
--

SELECT pg_catalog.setval('operaciones.pedido_item_sucursal_id_seq', 1, false);


--
-- Data for Name: precio_delivery; Type: TABLE DATA; Schema: operaciones; Owner: franco
--

COPY operaciones.precio_delivery (id, descripcion, valor, activo, creado_en, usuario_id) FROM stdin;
\.


--
-- Name: precio_delivery_id_seq; Type: SEQUENCE SET; Schema: operaciones; Owner: franco
--

SELECT pg_catalog.setval('operaciones.precio_delivery_id_seq', 1, false);


--
-- Data for Name: programar_precio; Type: TABLE DATA; Schema: operaciones; Owner: franco
--

COPY operaciones.programar_precio (id, precio_id, momento_cambio, nuevo_precio, fecha_cambio, cantidad, creado_en, usuario_id) FROM stdin;
\.


--
-- Name: programar_precio_id_seq; Type: SEQUENCE SET; Schema: operaciones; Owner: franco
--

SELECT pg_catalog.setval('operaciones.programar_precio_id_seq', 1, false);


--
-- Data for Name: salida; Type: TABLE DATA; Schema: operaciones; Owner: franco
--

COPY operaciones.salida (id, responsable_carga_id, tipo_salida, sucursal_id, observacion, creado_en, usuario_id, activo) FROM stdin;
\.


--
-- Name: salida_id_seq; Type: SEQUENCE SET; Schema: operaciones; Owner: franco
--

SELECT pg_catalog.setval('operaciones.salida_id_seq', 1, false);


--
-- Data for Name: salida_item; Type: TABLE DATA; Schema: operaciones; Owner: franco
--

COPY operaciones.salida_item (id, producto_id, presentacion_id, cantidad, observacion, creado_en, usuario_id, salida_id) FROM stdin;
\.


--
-- Name: salida_item_id_seq; Type: SEQUENCE SET; Schema: operaciones; Owner: franco
--

SELECT pg_catalog.setval('operaciones.salida_item_id_seq', 1, false);


--
-- Data for Name: transferencia; Type: TABLE DATA; Schema: operaciones; Owner: franco
--

COPY operaciones.transferencia (id, sucursal_origen_id, sucursal_destino_id, estado, tipo, etapa, observacion, is_origen, is_destino, usuario_pre_transferencia_id, usuario_preparacion_id, usuario_transporte_id, usuario_recepcion_id, creado_en) FROM stdin;
11	1	4	CONLCUIDA	MANUAL	RECEPCION_CONCLUIDA	\N	\N	\N	3	1	2	2	2022-05-17 08:53:19.638
\.


--
-- Name: transferencia_id_seq; Type: SEQUENCE SET; Schema: operaciones; Owner: franco
--

SELECT pg_catalog.setval('operaciones.transferencia_id_seq', 1, false);


--
-- Data for Name: transferencia_item; Type: TABLE DATA; Schema: operaciones; Owner: franco
--

COPY operaciones.transferencia_item (id, transferencia_id, presentacion_pre_transferencia_id, presentacion_preparacion_id, presentacion_transporte_id, presentacion_recepcion_id, cantidad_pre_transferencia, cantidad_preparacion, cantidad_transporte, cantidad_recepcion, observacion_pre_transferencia, observacion_preparacion, observacion_transporte, observacion_recepcion, vencimiento_pre_transferencia, vencimiento_preparacion, vencimiento_transporte, vencimiento_recepcion, motivo_modificacion_pre_transferencia, motivo_modificacion_preparacion, motivo_modificacion_transporte, motivo_modificacion_recepcion, motivo_rechazo_pre_transferencia, motivo_rechazo_preparacion, motivo_rechazo_transporte, motivo_rechazo_recepcion, activo, posee_vencimiento, usuario_id, creado_en) FROM stdin;
33	11	128	\N	\N	\N	10	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	FALTA_PRODUCTO	\N	\N	t	f	1	\N
31	11	208	208	208	208	20	20	20	20	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	\N	t	f	2	\N
32	11	129	129	129	129	12	11	11	11	\N	\N	\N	\N	\N	\N	\N	\N	\N	CANTIDAD_INCORRECTA	\N	\N	\N	\N	\N	\N	t	f	2	\N
34	11	926	926	926	926	1	1	1	1	\N	\N	\N	\N	2022-12-31 00:00:00	2022-12-31 00:00:00	2022-12-31 00:00:00	2022-12-31 00:00:00	\N	\N	\N	\N	\N	\N	\N	\N	t	t	2	\N
35	11	924	924	924	924	1	1	1	1	\N	\N	\N	\N	2022-12-31 00:00:00	2022-12-31 00:00:00	2022-12-31 00:00:00	2022-12-31 00:00:00	\N	\N	\N	\N	\N	\N	\N	\N	t	t	2	\N
\.


--
-- Name: transferencia_item_id_seq; Type: SEQUENCE SET; Schema: operaciones; Owner: franco
--

SELECT pg_catalog.setval('operaciones.transferencia_item_id_seq', 1, false);


--
-- Data for Name: venta; Type: TABLE DATA; Schema: operaciones; Owner: franco
--

COPY operaciones.venta (id, cliente_id, creado_en, usuario_id, estado, total_gs, total_rs, total_ds, forma_pago_id, cobro_id, caja_id) FROM stdin;
1	\N	2022-03-23 21:49:32.935+00	8	CONCLUIDA	46000	36.8	6.76470588235294	1	1	1
2	\N	2022-03-23 21:54:41.642+00	8	CONCLUIDA	40000	32	5.88235294117647	1	2	1
3	\N	2022-03-23 21:57:13.277+00	8	CONCLUIDA	30000	24	4.41176470588235	1	3	1
4	\N	2022-03-26 17:20:50.49+00	8	CONCLUIDA	152000	121.6	22.3529411764706	1	4	1
5	\N	2022-03-26 17:20:54.815+00	8	CONCLUIDA	152000	121.6	22.3529411764706	1	5	1
6	\N	2022-03-26 17:21:35.829+00	8	CONCLUIDA	38000	30.4	5.58823529411765	1	6	1
7	\N	2022-03-26 17:24:43.628+00	8	CONCLUIDA	114000	91.2	16.7647058823529	1	7	1
8	\N	2022-03-28 14:34:35.661+00	8	CONCLUIDA	10000	8	1.47058823529412	1	8	1
9	\N	2022-03-28 14:34:43.674+00	8	CONCLUIDA	10000	8	1.47058823529412	1	9	1
10	\N	2022-03-28 14:34:58.127+00	8	CONCLUIDA	241000	192.8	35.4411764705882	1	10	1
11	\N	2022-03-28 18:10:36.808+00	8	CONCLUIDA	6000	4.8	0.882352941176471	1	11	1
12	\N	2022-03-28 18:27:17.28+00	8	CONCLUIDA	11000	8.8	1.61764705882353	1	12	1
13	\N	2022-03-28 18:29:18.36+00	8	CONCLUIDA	11000	8.8	1.61764705882353	1	13	1
14	\N	2022-03-28 18:32:23.309+00	8	CONCLUIDA	173000	138.4	25.4411764705882	1	14	1
15	\N	2022-03-28 18:33:30.429+00	8	CONCLUIDA	30000	24	4.41176470588235	1	15	1
16	\N	2022-03-28 18:34:08.609+00	8	CONCLUIDA	30000	24	4.41176470588235	1	16	1
17	\N	2022-03-29 12:46:55.299+00	8	CONCLUIDA	80000	64	11.7647058823529	1	17	5
18	\N	2022-03-29 12:50:18.943+00	8	CONCLUIDA	30000	24	4.41176470588235	1	18	5
19	\N	2022-03-29 12:51:36.783+00	8	CONCLUIDA	40000	32	5.88235294117647	1	19	5
20	\N	2022-03-29 12:52:32.192+00	8	CONCLUIDA	33000	26.4	4.85294117647059	1	20	5
21	\N	2022-03-29 12:54:05.93+00	8	CONCLUIDA	30000	24	4.41176470588235	1	21	5
22	\N	2022-03-29 12:55:54.543+00	8	CONCLUIDA	7000	5.6	1.02941176470588	\N	22	5
23	\N	2022-03-29 13:11:25.783+00	8	CONCLUIDA	38000	30.4	5.58823529411765	1	23	5
24	\N	2022-03-29 13:11:39.489+00	8	CONCLUIDA	40000	32	5.88235294117647	1	24	5
25	\N	2022-03-29 13:12:55.195+00	8	CONCLUIDA	275000	220	40.4411764705882	1	25	5
26	\N	2022-03-29 15:58:36.9+00	2	CONCLUIDA	35000	28	5.14705882352941	1	26	6
27	\N	2022-04-01 01:38:44.688+00	8	CONCLUIDA	271000	216.8	39.8529411764706	1	27	9
28	\N	2022-04-01 01:39:16.648+00	8	CONCLUIDA	47000	37.6	6.91176470588235	1	28	9
29	\N	2022-04-01 01:39:45.241+00	8	CONCLUIDA	112000	89.6	16.4705882352941	1	29	9
30	\N	2022-04-01 01:40:52.554+00	8	CONCLUIDA	14500	11.6	2.13235294117647	1	30	9
31	\N	2022-04-01 01:42:13.469+00	8	CONCLUIDA	10500	8.4	1.54411764705882	1	31	9
32	\N	2022-06-18 13:19:49.973+00	1	CONCLUIDA	460000	368	67.6470588235294	1	32	16
\.


--
-- Name: venta_id_seq; Type: SEQUENCE SET; Schema: operaciones; Owner: franco
--

SELECT pg_catalog.setval('operaciones.venta_id_seq', 32, true);


--
-- Data for Name: venta_item; Type: TABLE DATA; Schema: operaciones; Owner: franco
--

COPY operaciones.venta_item (id, venta_id, unidad_medida, precio_id, costo_unitario, existencia, producto_id, cantidad, creado_en, usuario_id, descuento_unitario, presentacion_id, activo) FROM stdin;
1	1	\N	533	\N	\N	54	1	\N	\N	\N	239	t
2	2	\N	528	\N	\N	52	1	\N	\N	\N	233	t
3	3	\N	394	\N	\N	11	1	\N	\N	\N	110	t
4	4	\N	1898	\N	\N	1041	4	\N	\N	\N	1557	t
5	5	\N	1898	\N	\N	1041	4	\N	\N	\N	1557	t
6	6	\N	1898	\N	\N	1041	1	\N	\N	\N	1557	t
7	7	\N	1898	\N	\N	1041	3	\N	\N	\N	1557	t
8	8	\N	530	\N	\N	53	1	\N	\N	\N	235	t
9	9	\N	530	\N	\N	53	1	\N	\N	\N	235	t
10	10	\N	533	\N	\N	54	1	\N	\N	\N	239	t
11	10	\N	529	\N	\N	52	1	\N	\N	\N	234	t
12	10	\N	540	\N	\N	63	1	\N	\N	\N	245	t
13	11	\N	524	\N	\N	230	1	\N	\N	\N	230	t
14	12	\N	527	\N	\N	52	1	\N	\N	\N	232	t
15	12	\N	532	\N	\N	54	1	\N	\N	\N	238	t
16	13	\N	527	\N	\N	52	1	\N	\N	\N	232	t
17	13	\N	532	\N	\N	54	1	\N	\N	\N	238	t
18	14	\N	1011	\N	\N	32	1	\N	\N	\N	1129	t
19	14	\N	515	\N	\N	226	1	\N	\N	\N	223	t
20	15	\N	384	\N	\N	7	1	\N	\N	\N	102	t
21	16	\N	394	\N	\N	11	1	\N	\N	\N	110	t
22	17	\N	528	\N	\N	52	2	\N	\N	\N	233	t
23	18	\N	394	\N	\N	11	1	\N	\N	\N	110	t
24	19	\N	528	\N	\N	52	1	\N	\N	\N	233	t
25	20	\N	515	\N	\N	226	1	\N	\N	\N	223	t
26	21	\N	394	\N	\N	11	1	\N	\N	\N	110	t
27	22	\N	527	\N	\N	52	1	\N	\N	\N	232	t
28	23	\N	1898	\N	\N	1041	1	\N	\N	\N	1557	t
29	24	\N	896	\N	\N	451	1	\N	\N	\N	634	t
30	24	\N	1898	\N	\N	1041	1	\N	\N	\N	1557	t
31	25	\N	448	\N	\N	120	5	\N	\N	\N	158	t
32	26	\N	540	\N	\N	63	1	\N	\N	\N	245	t
33	27	\N	527	\N	\N	52	1	\N	\N	\N	232	t
34	27	\N	389	\N	\N	153	1	\N	\N	\N	106	t
35	27	\N	437	\N	\N	90	1	\N	\N	\N	149	t
36	28	\N	383	\N	\N	7	1	\N	\N	\N	101	t
37	28	\N	528	\N	\N	52	1	\N	\N	\N	233	t
38	28	\N	495	\N	\N	28	1	\N	\N	\N	204	t
39	29	\N	533	\N	\N	54	1	\N	\N	\N	239	t
40	29	\N	392	\N	\N	12	1	\N	\N	\N	108	t
41	29	\N	1009	\N	\N	32	1	\N	\N	\N	1127	t
42	30	\N	781	\N	\N	359	1	\N	\N	\N	521	t
43	30	\N	527	\N	\N	52	1	\N	\N	\N	232	t
44	30	\N	391	\N	\N	12	1	\N	\N	\N	107	t
45	31	\N	514	\N	\N	226	1	\N	\N	\N	222	t
46	31	\N	520	\N	\N	228	1	\N	\N	\N	226	t
47	31	\N	867	\N	\N	431	1	\N	\N	\N	604	t
48	32	\N	533	\N	\N	54	10	\N	\N	\N	239	t
\.


--
-- Name: venta_item_id_seq; Type: SEQUENCE SET; Schema: operaciones; Owner: franco
--

SELECT pg_catalog.setval('operaciones.venta_item_id_seq', 48, true);


--
-- Data for Name: vuelto; Type: TABLE DATA; Schema: operaciones; Owner: franco
--

COPY operaciones.vuelto (id, autorizado_por_id, responsable_id, creado_en, usuario_id, activo) FROM stdin;
\.


--
-- Name: vuelto_id_seq; Type: SEQUENCE SET; Schema: operaciones; Owner: franco
--

SELECT pg_catalog.setval('operaciones.vuelto_id_seq', 1, false);


--
-- Data for Name: vuelto_item; Type: TABLE DATA; Schema: operaciones; Owner: franco
--

COPY operaciones.vuelto_item (id, vuelto_id, valor, moneda_id, creado_en, usuario_id) FROM stdin;
\.


--
-- Name: vuelto_item_id_seq; Type: SEQUENCE SET; Schema: operaciones; Owner: franco
--

SELECT pg_catalog.setval('operaciones.vuelto_item_id_seq', 1, false);


--
-- Data for Name: cliente; Type: TABLE DATA; Schema: personas; Owner: franco
--

COPY personas.cliente (id, persona_id, credito, usuario_id, creado_en, id_central) FROM stdin;
1	3	2000000	1	2021-06-09 18:42:22.816949+00	\N
\.


--
-- Name: cliente_id_seq; Type: SEQUENCE SET; Schema: personas; Owner: franco
--

SELECT pg_catalog.setval('personas.cliente_id_seq', 1, false);


--
-- Data for Name: funcionario; Type: TABLE DATA; Schema: personas; Owner: franco
--

COPY personas.funcionario (id, persona_id, cargo_id, credito, fecha_ingreso, sueldo, sector, supervisado_por_id, sucursal_id, fase_prueba, diarista, usuario_id, creado_en, activo, id_central) FROM stdin;
1	1	1	1000000	2019-02-11 00:00:00	2250000	\N	1	1	t	f	1	2021-02-17 15:20:29+00	t	\N
3	7	\N	\N	\N	2500000	\N	\N	\N	t	f	6	2021-11-19 17:16:22.913+00	t	\N
2	8	\N	2000000	\N	\N	\N	\N	\N	t	f	\N	2021-11-19 17:11:00+00	t	\N
4	10	\N	2000000	2022-02-05 14:35:06.912585	0	\N	\N	\N	t	f	\N	2021-11-19 17:11:00+00	t	\N
5	11	\N	\N	\N	\N	\N	\N	\N	t	f	1	2022-02-15 13:51:41.912+00	t	\N
6	12	\N	\N	\N	\N	\N	\N	\N	t	f	4	2022-02-15 13:53:36.87+00	t	\N
7	13	\N	\N	\N	\N	\N	\N	\N	t	f	4	2022-02-23 11:26:18.37+00	t	\N
8	15	\N	0	2022-03-05 14:07:10.284614	0	\N	\N	\N	t	f	1	2022-03-05 17:07:10.284614+00	t	\N
9	17	\N	500000	2022-01-01 00:00:00	3	\N	\N	\N	\N	\N	2	2022-06-09 19:47:03.982+00	t	\N
10	18	\N	200000	2022-04-01 00:00:00	4	\N	\N	\N	\N	\N	2	2022-06-09 19:55:33.331+00	t	\N
11	19	\N	200000	2022-04-01 00:00:00	4	\N	\N	\N	\N	\N	2	2022-06-09 19:58:25.516+00	t	\N
12	20	\N	300000	2022-03-02 00:00:00	2	\N	\N	\N	\N	\N	2	2022-06-09 20:22:57.662+00	t	\N
13	21	\N	300000	2022-03-02 00:00:00	2	\N	\N	\N	\N	\N	2	2022-06-09 20:27:35.002+00	t	\N
14	22	\N	20000	2022-03-02 00:00:00	2	\N	\N	\N	\N	\N	2	2022-06-09 20:33:50.059+00	t	\N
15	23	\N	300000	2021-01-21 00:00:00	1	\N	\N	\N	\N	\N	1	2022-06-14 15:21:39.564+00	t	\N
16	24	\N	1	2021-01-21 00:00:00	1	\N	\N	\N	\N	\N	1	2022-06-14 15:28:31.843+00	t	\N
17	25	\N	1	2022-03-02 00:00:00	2	\N	\N	\N	\N	\N	1	2022-06-14 17:10:33.474+00	t	\N
\.


--
-- Name: funcionario_id_seq; Type: SEQUENCE SET; Schema: personas; Owner: franco
--

SELECT pg_catalog.setval('personas.funcionario_id_seq', 1, false);


--
-- Data for Name: grupo_privilegio; Type: TABLE DATA; Schema: personas; Owner: franco
--

COPY personas.grupo_privilegio (id, descripcion, usuario_id, creado_en) FROM stdin;
\.


--
-- Name: grupo_privilegio_id_seq; Type: SEQUENCE SET; Schema: personas; Owner: franco
--

SELECT pg_catalog.setval('personas.grupo_privilegio_id_seq', 1, false);


--
-- Data for Name: persona; Type: TABLE DATA; Schema: personas; Owner: franco
--

COPY personas.persona (id, nombre, apodo, documento, nacimiento, sexo, direccion, ciudad_id, telefono, social_media, imagenes, creado_en, usuario_id, email, id_central) FROM stdin;
3	CAMPOS S.A.	\N	800345-4	\N	\N	\N	\N	\N	\N	\N	2021-03-10 03:18:03.86199+00	1	\N	\N
4	ANTONIO NUNES	\N	423423	\N	\N	\N	\N	\N	\N	\N	2021-03-10 03:18:27.730262+00	1	\N	\N
5	LA CAOBA	\N	80025323	\N	\N	\N	\N	\N	\N	\N	2021-04-08 23:42:32.711355+00	1	\N	\N
1	GABRIEL FRANCISCO FRANCO AREVALOS	GABRIEL	4043581	1992-04-10 04:00:00+00	M	\N	1	0982187492	\N	\N	2021-02-05 03:33:37.702804+00	1	francogabrielpy@outlook.com	\N
6	ARTHUR ANDRES ACUÑA FRANCO	ARTHUR	\N	\N	\N	\N	\N	\N	\N	\N	2021-09-02 15:27:38.693365+00	1	\N	\N
7	IGOR VERA	IGOR	\N	\N	\N	\N	\N	\N	\N	\N	2021-09-02 15:27:57.389437+00	1	\N	\N
8	GILBERTO FRANCO	\N	423432	\N	\N	\N	\N	0987432473	\N	\N	2021-11-18 01:14:49.391+00	2	\N	\N
9	RODOLFO ALEJANDRO FRANCO AREVALOS	oku	2314234	\N	\N	\N	\N	0981130269	\N	\N	2021-11-18 15:35:22.64+00	2	\N	\N
2	CAMILA GREGORIO VUJANSKI	cami	2343	\N	\N	\N	\N	\N	\N	\N	\N	1	\N	\N
10	JULIO PEREZ	JULIO	6843244	\N	\N	\N	\N	0985535258	\N	\N	2022-02-05 17:34:46.412486+00	1	\N	\N
11	GUSTAVO SOSA	GUSTAVO 	6.952.108	\N	\N	\N	\N	0994414445	\N	\N	2022-02-05 17:34:46.412486+00	1	\N	\N
12	JUAN BRITEZ	\N	8145935	\N	\N	\N	\N	0985155549	\N	\N	2022-02-10 13:06:43.610339+00	\N	\N	\N
13	EDUARDO LOPEZ	\N	6644036	\N	\N	\N	\N	0982596417	\N	\N	2022-02-10 13:08:04.15303+00	\N	\N	\N
14	VICTOR SOSA	\N	8273155	\N	\N	\N	\N	0983322554	\N	\N	2022-02-10 13:10:06.446227+00	\N	\N	\N
15	ESTEBAN ARISTIDES FERNANDES ESTECHE	\N	7168390	\N	\N	\N	\N	0985124180	\N	\N	2022-03-05 17:05:36.339335+00	1	\N	\N
16	JOSE PEREZ	JOSE	449382	1995-07-09 04:00:00+00	\N	PORAI	\N	0985225332	\N	\N	2022-06-09 19:08:06.125+00	2	JOSEPEZ@GMAIL.COM	\N
17	JOSE PEREZ	JOSE	3423432	1998-10-03 04:00:00+00	\N	AV 123	\N	0982234432	\N	\N	2022-06-09 19:47:03.566+00	2	JOSEPEZ@GMAIL.COM	\N
18	JOSE ARNALDO PEREZ LOPEZ	JOSE	3443242	1998-08-03 04:00:00+00	\N	AV Q34	\N	0983443234	\N	\N	2022-06-09 19:55:33.043+00	2	JOSEPELO@GMAIL.COM	\N
19	JOSE ARNALDO PEREZ LOPEZ	JOSE	3443242	1998-08-03 04:00:00+00	\N	AV Q34	\N	0983443234	\N	\N	2022-06-09 19:58:25.161+00	2	JOSEPELO@GMAIL.COM	\N
20	JAVIER ANTONIO PEREZ 	JAVI	443243	1998-03-04 04:00:00+00	\N	AV PARAGUAY 	\N	098332234	\N	\N	2022-06-09 20:22:57.339+00	2	JAVIERANT3@GMAIL.COM	\N
21	JAVIER ANTONIO PEREZ 	JAVI	443243	1998-03-04 04:00:00+00	\N	AV PARAGUAY 	\N	098332234	\N	\N	2022-06-09 20:27:34.712+00	2	JAVIERANT3@GMAIL.COM	\N
22	JAVIER ANTONIO PEREZ 	JAVI	443243	1998-03-04 04:00:00+00	\N	AV PARAGUAY 	\N	098332234	\N	\N	2022-06-09 20:33:49.791+00	2	JAVIERANT3@GMAIL.COM	\N
23	PRUEBA	PRUEBA	12341234	1998-02-21 03:00:00+00	\N	PRUEBA	\N	0981123123	\N	\N	2022-06-14 15:21:39.045+00	1	PRUEBA@PRUEBA	\N
24	PRUEBA	PRUEBA	12341234	1998-02-21 03:00:00+00	\N	PRUEBA	\N	0981123123	\N	\N	2022-06-14 15:28:31.542+00	1	PRUEBA@PRUEBA	\N
25	JAVIER ANTONIO PEREZ 	JAVI	443243	1998-03-04 04:00:00+00	\N	AV PARAGUAY 	\N	098332234	\N	\N	2022-06-14 17:10:33.042+00	1	JAVIERANT3@GMAIL.COM	\N
\.


--
-- Name: persona_id_seq; Type: SEQUENCE SET; Schema: personas; Owner: franco
--

SELECT pg_catalog.setval('personas.persona_id_seq', 1, false);


--
-- Data for Name: proveedor; Type: TABLE DATA; Schema: personas; Owner: franco
--

COPY personas.proveedor (id, persona_id, credito, tipo_credito, cheque_dias, datos_bancarios_id, usuario_id, creado_en, funcionario_encargado_id) FROM stdin;
1	3	t	\N	7	\N	1	2021-03-10 03:19:37.645568+00	1
2	5	t	\N	30	\N	1	2021-04-08 23:43:43.015789+00	\N
\.


--
-- Data for Name: proveedor_dias_visita; Type: TABLE DATA; Schema: personas; Owner: franco
--

COPY personas.proveedor_dias_visita (id, proveedor_id, dia, hora, observacion, usuario_id, creado_en) FROM stdin;
\.


--
-- Name: proveedor_dias_visita_id_seq; Type: SEQUENCE SET; Schema: personas; Owner: franco
--

SELECT pg_catalog.setval('personas.proveedor_dias_visita_id_seq', 1, false);


--
-- Name: proveedor_id_seq; Type: SEQUENCE SET; Schema: personas; Owner: franco
--

SELECT pg_catalog.setval('personas.proveedor_id_seq', 1, false);


--
-- Data for Name: role; Type: TABLE DATA; Schema: personas; Owner: franco
--

COPY personas.role (id, nombre, usuario_id, creado_en) FROM stdin;
1	VENTA TOUCH	1	2022-03-23 18:36:47.307632+00
2	CANCELACION DE VENTA	1	2022-03-23 18:36:47.307632+00
3	ANALISIS DE CAJA	1	2022-03-23 18:36:47.307632+00
4	ANALISIS DE VENTA	1	2022-03-23 18:36:47.307632+00
5	PRODUCTOS	1	2022-03-23 18:36:47.307632+00
\.


--
-- Name: role_id_seq; Type: SEQUENCE SET; Schema: personas; Owner: franco
--

SELECT pg_catalog.setval('personas.role_id_seq', 1, false);


--
-- Data for Name: usuario; Type: TABLE DATA; Schema: personas; Owner: franco
--

COPY personas.usuario (id, persona_id, password, usuario_id, creado_en, nickname, email, activo) FROM stdin;
20	23	123	1	2022-06-14 15:21:39.335+00	PRUEBA	\N	t
21	24	123	1	2022-06-14 15:28:31.697+00	PRUEBA2	\N	t
22	25	123	1	2022-06-14 17:10:33.271+00	JAPE	\N	t
2	2	1208	\N	\N	CAMI	\N	t
4	7	010203	\N	\N	IGOR	\N	t
5	8	123	1000	2021-11-18 15:03:28.979+00	GILBER	\N	t
1	1	GI123	1000	2021-10-04 14:20:00+00	GABRIEL	\N	t
7	10	123	1000	2021-10-04 14:20:00+00	JULIO	\N	t
9	12	123	1000	2022-02-10 13:07:16.46354+00	JUAN BRITEZ	\N	t
8	11	123	1000	2022-02-10 13:05:53.222059+00	GUSTAVO SOSA	\N	t
10	13	123	1000	2022-02-10 13:08:58.272842+00	EDUARDO LOPEZ	\N	t
11	14	123	1000	2022-02-10 13:10:26.134547+00	VICTOR SOSA	\N	t
12	15	123	1000	2022-02-10 13:10:26.134547+00	ESTEBAN FERNANDEZ	\N	t
6	9	OKU123	1000	2021-11-18 15:35:31.341+00	OKU	\N	t
3	6	123	1000	2021-09-02 15:28:54.942723+00	arthur	\N	t
1000	\N	admin	1000	2022-03-10 21:01:41.102878+00	admin	\N	t
14	17	123	2	2022-06-09 19:47:03.785+00	JOSE PEREZ	\N	t
16	19	123	2	2022-06-09 19:58:25.27+00	JOSE PEREZI	\N	t
17	20	123	2	2022-06-09 20:22:57.528+00	JAVIER ANTONIO	\N	t
18	21	123	2	2022-06-09 20:27:34.869+00	JAVIER PEREZ	\N	t
19	22	123	2	2022-06-09 20:33:49.92+00	JAVIER PEREZA	\N	t
\.


--
-- Data for Name: usuario_grupo; Type: TABLE DATA; Schema: personas; Owner: franco
--

COPY personas.usuario_grupo (id, usuario_id, grupo_privilegio_id, modificado, creado_en) FROM stdin;
\.


--
-- Name: usuario_grupo_id_seq; Type: SEQUENCE SET; Schema: personas; Owner: franco
--

SELECT pg_catalog.setval('personas.usuario_grupo_id_seq', 1, false);


--
-- Name: usuario_id_seq; Type: SEQUENCE SET; Schema: personas; Owner: franco
--

SELECT pg_catalog.setval('personas.usuario_id_seq', 1, false);


--
-- Data for Name: usuario_role; Type: TABLE DATA; Schema: personas; Owner: franco
--

COPY personas.usuario_role (id, role_id, user_id, usuario_id, creado_en, id_central) FROM stdin;
1	1	2	\N	2022-03-23 18:39:47.61473+00	\N
2	2	2	\N	2022-03-23 18:39:47.61473+00	\N
3	3	2	\N	2022-03-23 18:39:47.61473+00	\N
4	4	2	\N	2022-03-23 18:39:47.61473+00	\N
5	1	8	\N	2022-03-23 18:39:47.61473+00	\N
\.


--
-- Name: usuario_role_id_seq; Type: SEQUENCE SET; Schema: personas; Owner: franco
--

SELECT pg_catalog.setval('personas.usuario_role_id_seq', 1, false);


--
-- Data for Name: vendedor; Type: TABLE DATA; Schema: personas; Owner: franco
--

COPY personas.vendedor (id, persona_id, activo, observacion, usuario_id, creado_en, id_central) FROM stdin;
1	4	t	\N	1	2021-03-10 15:07:33.49465+00	\N
2	2	t	\N	1	2021-04-08 23:43:13.583188+00	\N
\.


--
-- Name: vendedor_id_seq; Type: SEQUENCE SET; Schema: personas; Owner: franco
--

SELECT pg_catalog.setval('personas.vendedor_id_seq', 1, false);


--
-- Data for Name: vendedor_proveedor; Type: TABLE DATA; Schema: personas; Owner: franco
--

COPY personas.vendedor_proveedor (id, vendedor_id, proveedor_id, activo, usuario_id, creado_en, id_central) FROM stdin;
\.


--
-- Name: vendedor_proveedor_id_seq; Type: SEQUENCE SET; Schema: personas; Owner: franco
--

SELECT pg_catalog.setval('personas.vendedor_proveedor_id_seq', 1, false);


--
-- Data for Name: codigo; Type: TABLE DATA; Schema: productos; Owner: franco
--

COPY productos.codigo (id, codigo, principal, usuario_id, creado_en, activo, presentacion_id, id_central) FROM stdin;
392	702345702938759345	t	1	2021-12-28 18:47:22.602241+00	t	31	\N
393	543523464563456	\N	1	2021-12-28 18:47:22.602241+00	t	32	\N
394	3423453244534	t	1	2021-12-28 18:47:22.602241+00	t	32	\N
428	8712000030582	t	4	2021-12-28 18:47:22.602241+00	t	72	\N
429	8712000030810	t	4	2021-12-28 18:47:22.602241+00	t	73	\N
430	8712000030599	t	4	2021-12-28 18:47:22.602241+00	t	78	\N
432	8712000033545	t	4	2021-12-28 18:47:22.602241+00	t	79	\N
433	8712000033583	t	4	2021-12-28 18:47:22.602241+00	t	81	\N
434	072890000224	t	4	2021-12-28 18:47:22.602241+00	t	83	\N
435	8712000030605	t	4	2021-12-28 18:47:22.602241+00	t	84	\N
436	8712000030728	t	4	2021-12-28 18:47:22.602241+00	t	85	\N
437	7804300120276	t	3	2021-12-28 18:47:22.602241+00	t	68	\N
438	7804300003227	\N	3	2021-12-28 18:47:22.602241+00	t	68	\N
441	7896045506040	t	4	2021-12-28 18:47:22.602241+00	t	86	\N
442	7896045506057	t	4	2021-12-28 18:47:22.602241+00	t	87	\N
443	7804300149314	t	3	2021-12-28 18:47:22.602241+00	t	88	\N
444	7804300149307	t	3	2021-12-28 18:47:22.602241+00	t	91	\N
445	7804300149994	t	3	2021-12-28 18:47:22.602241+00	t	93	\N
446	7804300003234	t	3	2021-12-28 18:47:22.602241+00	t	94	\N
447	7804300123512	t	3	2021-12-28 18:47:22.602241+00	t	95	\N
448	7804300121846	t	3	2021-12-28 18:47:22.602241+00	t	98	\N
449	7891149104932	t	4	2021-12-28 18:47:22.602241+00	t	99	\N
490	03402119	t	4	2021-12-28 18:47:22.602241+00	t	162	\N
450	7891149104949	\N	4	2021-12-28 18:47:22.602241+00	t	100	\N
451	7840050002561	t	4	2021-12-28 18:47:22.602241+00	t	101	\N
453	6543634563463546	t	2	2021-12-28 18:47:22.602241+00	t	33	\N
454	7840050003735	t	4	2021-12-28 18:47:22.602241+00	t	103	\N
457	78400030	t	4	2021-12-28 18:47:22.602241+00	t	105	\N
458	78410848	t	4	2021-12-28 18:47:22.602241+00	t	107	\N
459	7840050002493	t	4	2021-12-28 18:47:22.602241+00	t	109	\N
460	7891149000142	t	4	2021-12-28 18:47:22.602241+00	t	111	\N
461	7891991295314	t	4	2021-12-28 18:47:22.602241+00	t	113	\N
462	87120103	t	4	2021-12-28 18:47:22.602241+00	t	121	\N
463	8712000033538	t	4	2021-12-28 18:47:22.602241+00	t	122	\N
465	8712000025649	t	4	2021-12-28 18:47:22.602241+00	t	125	\N
466	7840050007399	t	4	2021-12-28 18:47:22.602241+00	t	82	\N
467	7840050002783	t	4	2021-12-28 18:47:22.602241+00	t	70	\N
468	7804300120559	t	3	2021-12-28 18:47:22.602241+00	t	128	\N
469	7804300120252	t	3	2021-12-28 18:47:22.602241+00	t	129	\N
471	7804300010263	t	3	2021-12-28 18:47:22.602241+00	t	132	\N
472	7804300011512	\N	3	2021-12-28 18:47:22.602241+00	t	132	\N
470	78409613	t	4	2021-12-28 18:47:22.602241+00	t	130	\N
473	7840050007511	t	4	2021-12-28 18:47:22.602241+00	t	133	\N
474	7840050006385	t	4	2021-12-28 18:47:22.602241+00	t	135	\N
475	7840025110857	t	4	2021-12-28 18:47:22.602241+00	t	137	\N
476	7840025110871	t	4	2021-12-28 18:47:22.602241+00	t	138	\N
477	7898295301437	t	4	2021-12-28 18:47:22.602241+00	t	139	\N
480	7804300120566	t	3	2021-12-28 18:47:22.602241+00	t	143	\N
481	7804300120467	t	3	2021-12-28 18:47:22.602241+00	t	146	\N
482	03456217	t	4	2021-12-28 18:47:22.602241+00	t	145	\N
483	034100175054	t	4	2021-12-28 18:47:22.602241+00	t	148	\N
484	034100001568	t	4	2021-12-28 18:47:22.602241+00	t	150	\N
485	034100005528	t	4	2021-12-28 18:47:22.602241+00	t	153	\N
486	7804300127312	t	3	2021-12-28 18:47:22.602241+00	t	156	\N
487	7804300127305	\N	3	2021-12-28 18:47:22.602241+00	t	156	\N
488	034100005542	t	4	2021-12-28 18:47:22.602241+00	t	157	\N
489	03402313	t	4	2021-12-28 18:47:22.602241+00	t	159	\N
491	7986045504879	t	4	2021-12-28 18:47:22.602241+00	t	177	\N
492	7986045505098	t	4	2021-12-28 18:47:22.602241+00	t	178	\N
493	7896045506255	t	4	2021-12-28 18:47:22.602241+00	t	179	\N
495	7840050002769	t	4	2021-12-28 18:47:22.602241+00	t	183	\N
496	8712000056445	t	4	2021-12-28 18:47:22.602241+00	t	184	\N
497	8712000055264	t	4	2021-12-28 18:47:22.602241+00	t	186	\N
498	8712000055400	t	4	2021-12-28 18:47:22.602241+00	t	189	\N
499	7896045504831	t	4	2021-12-28 18:47:22.602241+00	t	192	\N
500	7896045504848	t	4	2021-12-28 18:47:22.602241+00	t	193	\N
501	7792798006045	t	4	2021-12-28 18:47:22.602241+00	t	194	\N
502	5410228143376	t	4	2021-12-28 18:47:22.602241+00	t	197	\N
503	5410228240945	t	4	2021-12-28 18:47:22.602241+00	t	199	\N
504	7840050006644	t	4	2021-12-28 18:47:22.602241+00	t	202	\N
505	7891149103102	t	4	2021-12-28 18:47:22.602241+00	t	204	\N
506	7891149103119	t	4	2021-12-28 18:47:22.602241+00	t	205	\N
507	7891149107704	t	4	2021-12-28 18:47:22.602241+00	t	206	\N
508	7891149108923	t	4	2021-12-28 18:47:22.602241+00	t	209	\N
509	7891149104468	t	4	2021-12-28 18:47:22.602241+00	t	213	\N
510	78906709	t	4	2021-12-28 18:47:22.602241+00	t	215	\N
511	7897395040246	t	4	2021-12-28 18:47:22.602241+00	t	217	\N
512	7897395040307	t	4	2021-12-28 18:47:22.602241+00	t	220	\N
513	7898295300935	t	4	2021-12-28 18:47:22.602241+00	t	222	\N
514	7898295301475	t	4	2021-12-28 18:47:22.602241+00	t	223	\N
515	7898295300867	t	4	2021-12-28 18:47:22.602241+00	t	224	\N
516	7898295301338	t	4	2021-12-28 18:47:22.602241+00	t	225	\N
517	7898295300843	t	4	2021-12-28 18:47:22.602241+00	t	226	\N
518	7898295300409	t	4	2021-12-28 18:47:22.602241+00	t	228	\N
519	7898295300119	t	4	2021-12-28 18:47:22.602241+00	t	230	\N
520	7840050002523	t	4	2021-12-28 18:47:22.602241+00	t	232	\N
521	7840050002530	t	4	2021-12-28 18:47:22.602241+00	t	233	\N
522	7840050006200	t	4	2021-12-28 18:47:22.602241+00	t	235	\N
523	7840050003700	t	4	2021-12-28 18:47:22.602241+00	t	238	\N
524	7840050003087	t	4	2021-12-28 18:47:22.602241+00	t	240	\N
525	7891991014786	t	4	2021-12-28 18:47:22.602241+00	t	242	\N
526	7840050003803	t	4	2021-12-28 18:47:22.602241+00	t	244	\N
527	7840050003827	t	4	2021-12-28 18:47:22.602241+00	t	245	\N
528	78404533	t	4	2021-12-28 18:47:22.602241+00	t	246	\N
529	7840050002639	t	4	2021-12-28 18:47:22.602241+00	t	248	\N
478	034100005696	t	4	\N	t	141	\N
530	78409736	t	4	2021-12-28 18:47:22.602241+00	t	250	\N
531	7898367983790	t	4	2021-12-28 18:47:22.602241+00	t	252	\N
532	7898367984018	t	4	2021-12-28 18:47:22.602241+00	t	253	\N
533	7898367890010	t	4	2021-12-28 18:47:22.602241+00	t	254	\N
534	7898367980058	t	4	2021-12-28 18:47:22.602241+00	t	255	\N
535	7898637983615	t	4	2021-12-28 18:47:22.602241+00	t	257	\N
536	789836798070	t	4	2021-12-28 18:47:22.602241+00	t	259	\N
538	7840025110864	t	4	2021-12-28 18:47:22.602241+00	t	263	\N
540	7840025110710	t	4	2021-12-28 18:47:22.602241+00	t	267	\N
541	7840025110734	t	4	2021-12-28 18:47:22.602241+00	t	268	\N
542	7840025110796	t	4	2021-12-28 18:47:22.602241+00	t	269	\N
543	8412598002304	t	4	2021-12-28 18:47:22.602241+00	t	341	\N
545	8412598005398	t	4	2021-12-28 18:47:22.602241+00	t	343	\N
546	8412598001659	t	4	2021-12-28 18:47:22.602241+00	t	345	\N
547	7898953990140	t	4	2021-12-28 18:47:22.602241+00	t	347	\N
548	8412598074219	t	4	2021-12-28 18:47:22.602241+00	t	349	\N
549	7897736409800	t	4	2021-12-28 18:47:22.602241+00	t	351	\N
550	7897736409817	t	4	2021-12-28 18:47:22.602241+00	t	354	\N
551	7897736409824	t	4	2021-12-28 18:47:22.602241+00	t	357	\N
552	7897736409831	t	4	2021-12-28 18:47:22.602241+00	t	363	\N
553	7897736409848	t	4	2021-12-28 18:47:22.602241+00	t	364	\N
559	9002490214166	t	4	2021-12-28 18:47:22.602241+00	t	372	\N
560	9002490240875	t	4	2021-12-28 18:47:22.602241+00	t	374	\N
561	9002490241179	t	4	2021-12-28 18:47:22.602241+00	t	375	\N
562	9002490229160	t	4	2021-12-28 18:47:22.602241+00	t	377	\N
563	9002490248949	\N	4	2021-12-28 18:47:22.602241+00	t	377	\N
564	9002490235192	t	4	2021-12-28 18:47:22.602241+00	t	380	\N
565	9002490235208	t	4	2021-12-28 18:47:22.602241+00	t	381	\N
566	9002490247379	t	4	2021-12-28 18:47:22.602241+00	t	383	\N
567	7898295300652	t	4	2021-12-28 18:47:22.602241+00	t	386	\N
568	7840027010001	t	4	2021-12-28 18:47:22.602241+00	t	388	\N
569	7840027040008	\N	4	2021-12-28 18:47:22.602241+00	t	390	\N
570	7840027100009	t	4	2021-12-28 18:47:22.602241+00	t	390	\N
571	7790240072150	t	4	2021-12-28 18:47:22.602241+00	t	392	\N
572	7896209603202	t	4	2021-12-28 18:47:22.602241+00	t	393	\N
573	7792716000261	t	4	2021-12-28 18:47:22.602241+00	t	394	\N
574	7792716000230	t	4	2021-12-28 18:47:22.602241+00	t	396	\N
576	7798141877379	t	4	2021-12-28 18:47:22.602241+00	t	400	\N
575	7790717152019	t	4	2021-12-28 18:47:22.602241+00	t	398	\N
577	779717152002	t	4	2021-12-28 18:47:22.602241+00	t	399	\N
578	7809579801222	t	4	2021-12-28 18:47:22.602241+00	t	401	\N
579	7809579801215	t	4	2021-12-28 18:47:22.602241+00	t	402	\N
580	7791843008294	t	4	2021-12-28 18:47:22.602241+00	t	403	\N
581	7840779002972	t	4	2021-12-28 18:47:22.602241+00	t	405	\N
582	7840779002996	t	4	2021-12-28 18:47:22.602241+00	t	407	\N
583	7790314004995	t	4	2021-12-28 18:47:22.602241+00	t	409	\N
584	7891962032306	t	4	2021-12-28 18:47:22.602241+00	t	410	\N
585	7891962032283	t	4	2021-12-28 18:47:22.602241+00	t	411	\N
587	7891962037004	\N	4	2021-12-28 18:47:22.602241+00	t	411	\N
588	7891000325131	t	4	2021-12-28 18:47:22.602241+00	t	412	\N
589	7840118216367	t	4	2021-12-28 18:47:22.602241+00	t	413	\N
590	7896451900029	t	4	2021-12-28 18:47:22.602241+00	t	414	\N
592	7892840818913	t	4	2021-12-28 18:47:22.602241+00	t	422	\N
593	7892840817497	t	4	2021-12-28 18:47:22.602241+00	t	423	\N
594	789840817473	t	4	2021-12-28 18:47:22.602241+00	t	424	\N
596	7892840817763	t	4	2021-12-28 18:47:22.602241+00	t	426	\N
597	7892840255442	t	4	2021-12-28 18:47:22.602241+00	t	427	\N
598	7892840817480	t	4	2021-12-28 18:47:22.602241+00	t	428	\N
599	7840127002005	t	4	2021-12-28 18:47:22.602241+00	t	429	\N
600	7840127001121	t	4	2021-12-28 18:47:22.602241+00	t	430	\N
601	7840127000124	t	4	2021-12-28 18:47:22.602241+00	t	431	\N
602	784012700230	t	4	2021-12-28 18:47:22.602241+00	t	432	\N
603	784012700000391	t	4	2021-12-28 18:47:22.602241+00	t	433	\N
604	7840127000216	t	4	2021-12-28 18:47:22.602241+00	t	434	\N
605	7840127001992	t	4	2021-12-28 18:47:22.602241+00	t	435	\N
606	7790580169312	t	4	2021-12-28 18:47:22.602241+00	t	436	\N
607	7790580169305	t	4	2021-12-28 18:47:22.602241+00	t	437	\N
608	7790580230111	t	4	2021-12-28 18:47:22.602241+00	t	438	\N
609	7790580230104	t	4	2021-12-28 18:47:22.602241+00	t	439	\N
610	7794000003590	t	4	2021-12-28 18:47:22.602241+00	t	440	\N
612	02289902	t	4	2021-12-28 18:47:22.602241+00	t	443	\N
613	7897115103091	t	4	2021-12-28 18:47:22.602241+00	t	445	\N
614	7840188000101	t	4	2021-12-28 18:47:22.602241+00	t	446	\N
615	7840188000088	t	4	2021-12-28 18:47:22.602241+00	t	448	\N
616	7790580697303	t	4	2021-12-28 18:47:22.602241+00	t	450	\N
618	7897115103107	t	4	2021-12-28 18:47:22.602241+00	t	452	\N
619	7897115107488	t	4	2021-12-28 18:47:22.602241+00	t	453	\N
620	7897115103084	t	4	2021-12-28 18:47:22.602241+00	t	454	\N
621	7840118217067	t	4	2021-12-28 18:47:22.602241+00	t	455	\N
622	7896098900208	t	4	2021-12-28 18:47:22.602241+00	t	456	\N
623	7896098900215	t	4	2021-12-28 18:47:22.602241+00	t	457	\N
624	7840255000096	t	4	2021-12-28 18:47:22.602241+00	t	458	\N
625	7501009222729	t	4	2021-12-28 18:47:22.602241+00	t	459	\N
626	7794000960435	t	4	2021-12-28 18:47:22.602241+00	t	462	\N
627	7891962032290	t	4	2021-12-28 18:47:22.602241+00	t	463	\N
591	77958648	t	4	\N	t	420	\N
537	7898367984056	t	4	\N	t	261	\N
557	9002490100070	t	4	\N	t	370	\N
558	611269991000	\N	4	\N	t	370	\N
595	7892840817503	t	4	\N	t	425	\N
556	7893218003603	\N	4	\N	t	367	\N
554	7893218000107	t	4	\N	t	367	\N
555	7893218000251	t	4	\N	t	368	\N
539	7840025110994	t	4	\N	t	265	\N
628	7891962036984	\N	4	2021-12-28 18:47:22.602241+00	t	463	\N
629	7840779001050	t	4	2021-12-28 18:47:22.602241+00	t	464	\N
630	7840779002057	t	4	2021-12-28 18:47:22.602241+00	t	466	\N
631	7840028202146	t	4	2021-12-28 18:47:22.602241+00	t	468	\N
632	7840981000049	t	4	2021-12-28 18:47:22.602241+00	t	470	\N
633	7896547501406	t	4	2021-12-28 18:47:22.602241+00	t	472	\N
634	7896547501154	t	4	2021-12-28 18:47:22.602241+00	t	473	\N
635	7896547501277	t	4	2021-12-28 18:47:22.602241+00	t	474	\N
636	7840138000281	t	4	2021-12-28 18:47:22.602241+00	t	475	\N
637	7896186300163	t	3	2021-12-28 18:47:22.602241+00	t	476	\N
638	7840138000199	t	4	2021-12-28 18:47:22.602241+00	t	478	\N
639	7840138001059	t	4	2021-12-28 18:47:22.602241+00	t	479	\N
640	7896186302884	t	3	2021-12-28 18:47:22.602241+00	t	480	\N
641	7896741692986	t	3	2021-12-28 18:47:22.602241+00	t	482	\N
642	7840138000144	t	4	2021-12-28 18:47:22.602241+00	t	484	\N
644	7842283000024	t	4	2021-12-28 18:47:22.602241+00	t	486	\N
645	7897274100085	t	3	2021-12-28 18:47:22.602241+00	t	488	\N
646	7896514700801	t	3	2021-12-28 18:47:22.602241+00	t	490	\N
647	7896514700436	t	3	2021-12-28 18:47:22.602241+00	t	492	\N
648	7840009650072	t	3	2021-12-28 18:47:22.602241+00	t	494	\N
649	7840009650652	t	3	2021-12-28 18:47:22.602241+00	t	495	\N
654	7840138000038	t	4	2021-12-28 18:47:22.602241+00	t	496	\N
655	7840009650096	t	3	2021-12-28 18:47:22.602241+00	t	497	\N
656	7840013000023	t	3	2021-12-28 18:47:22.602241+00	t	498	\N
657	7840127001848	t	3	2021-12-28 18:47:22.602241+00	t	499	\N
658	7840037000580	t	3	2021-12-28 18:47:22.602241+00	t	500	\N
659	7840037000757	t	3	2021-12-28 18:47:22.602241+00	t	501	\N
660	7891155032458	t	4	2021-12-28 18:47:22.602241+00	t	502	\N
661	7891155003229	t	4	2021-12-28 18:47:22.602241+00	t	503	\N
662	7840127000766	t	3	2021-12-28 18:47:22.602241+00	t	504	\N
663	7840127000773	t	3	2021-12-28 18:47:22.602241+00	t	505	\N
664	7840009650089	t	3	2021-12-28 18:47:22.602241+00	t	506	\N
665	7896741702111	t	3	2021-12-28 18:47:22.602241+00	t	507	\N
666	7840127001138	t	3	2021-12-28 18:47:22.602241+00	t	509	\N
667	7891155013150	t	4	2021-12-28 18:47:22.602241+00	t	510	\N
668	7891155003731	t	4	2021-12-28 18:47:22.602241+00	t	511	\N
669	7891155043829	t	4	2021-12-28 18:47:22.602241+00	t	512	\N
670	7891155050087	t	4	2021-12-28 18:47:22.602241+00	t	513	\N
671	7891155056584	t	4	2021-12-28 18:47:22.602241+00	t	514	\N
672	7891155017264	t	4	2021-12-28 18:47:22.602241+00	t	516	\N
673	8411134000989	t	3	2021-12-28 18:47:22.602241+00	t	515	\N
674	8411134000965	t	3	2021-12-28 18:47:22.602241+00	t	517	\N
675	8411134000996	t	3	2021-12-28 18:47:22.602241+00	t	518	\N
676	7840595008660	t	4	2021-12-28 18:47:22.602241+00	t	519	\N
677	7891155008200	t	3	2021-12-28 18:47:22.602241+00	t	520	\N
678	7898326370067	t	4	2021-12-28 18:47:22.602241+00	t	521	\N
679	7840013000337	t	3	2021-12-28 18:47:22.602241+00	t	522	\N
680	7840037014624	t	3	2021-12-28 18:47:22.602241+00	t	523	\N
681	7840037014198	t	3	2021-12-28 18:47:22.602241+00	t	524	\N
682	7840595013039	t	4	2021-12-28 18:47:22.602241+00	t	526	\N
683	7840009650904	t	3	2021-12-28 18:47:22.602241+00	t	525	\N
684	7840009650355	t	3	2021-12-28 18:47:22.602241+00	t	527	\N
685	7840037000986	t	3	2021-12-28 18:47:22.602241+00	t	528	\N
686	7898326370081	t	4	2021-12-28 18:47:22.602241+00	t	529	\N
687	7840009650942	t	3	2021-12-28 18:47:22.602241+00	t	530	\N
688	7840595000428	t	4	2021-12-28 18:47:22.602241+00	t	531	\N
689	7840037014099	t	3	2021-12-28 18:47:22.602241+00	t	532	\N
690	7840037000740	t	3	2021-12-28 18:47:22.602241+00	t	533	\N
691	7840595000374	t	4	2021-12-28 18:47:22.602241+00	t	535	\N
692	7840595006284	t	4	2021-12-28 18:47:22.602241+00	t	536	\N
693	7840595015514	t	4	2021-12-28 18:47:22.602241+00	t	537	\N
694	27894	t	3	2021-12-28 18:47:22.602241+00	t	538	\N
695	080432402856	t	3	2021-12-28 18:47:22.602241+00	t	539	\N
696	7898172660909	t	3	2021-12-28 18:47:22.602241+00	t	540	\N
697	7840595008677	t	4	2021-12-28 18:47:22.602241+00	t	541	\N
698	7840595015507	t	4	2021-12-28 18:47:22.602241+00	t	542	\N
699	7840595015521	t	4	2021-12-28 18:47:22.602241+00	t	543	\N
700	7898326370074	t	4	2021-12-28 18:47:22.602241+00	t	544	\N
701	5010327903101	t	3	2021-12-28 18:47:22.602241+00	t	545	\N
702	7896244138851	t	4	2021-12-28 18:47:22.602241+00	t	546	\N
703	7896931611346	t	3	2021-12-28 18:47:22.602241+00	t	547	\N
704	5000267015200	t	3	2021-12-28 18:47:22.602241+00	t	548	\N
705	1110	t	4	2021-12-28 18:47:22.602241+00	t	549	\N
706	5000267025209	t	3	2021-12-28 18:47:22.602241+00	t	550	\N
707	5010327208107	t	3	2021-12-28 18:47:22.602241+00	t	551	\N
708	5000267024608	t	3	2021-12-28 18:47:22.602241+00	t	552	\N
709	5000291020706	t	3	2021-12-28 18:47:22.602241+00	t	553	\N
710	7840028200258	t	3	2021-12-28 18:47:22.602241+00	t	554	\N
711	7052201912074	t	4	2021-12-28 18:47:22.602241+00	t	555	\N
712	7893218000473	t	3	2021-12-28 18:47:22.602241+00	t	556	\N
713	5010327926513	t	3	2021-12-28 18:47:22.602241+00	t	557	\N
714	44	t	4	2021-12-28 18:47:22.602241+00	t	558	\N
715	7802110001143	t	3	2021-12-28 18:47:22.602241+00	t	559	\N
716	5013967003996	t	3	2021-12-28 18:47:22.602241+00	t	560	\N
717	7501035010109	t	3	2021-12-28 18:47:22.602241+00	t	561	\N
718	4750021000164	t	3	2021-12-28 18:47:22.602241+00	t	562	\N
719	7640175740047	t	3	2021-12-28 18:47:22.602241+00	t	563	\N
720	6001495062508	t	3	2021-12-28 18:47:22.602241+00	t	564	\N
721	7840027006158	t	3	2021-12-28 18:47:22.602241+00	t	565	\N
722	7809623800478	t	3	2021-12-28 18:47:22.602241+00	t	566	\N
723	3500610034442	t	4	2021-12-28 18:47:22.602241+00	t	567	\N
724	7809623800485	t	3	2021-12-28 18:47:22.602241+00	t	568	\N
725	7809623800591	t	3	2021-12-28 18:47:22.602241+00	t	569	\N
726	7896780902466	t	4	2021-12-28 18:47:22.602241+00	t	570	\N
727	7840138000960	t	3	2021-12-28 18:47:22.602241+00	t	571	\N
728	7790290001193	t	4	2021-12-28 18:47:22.602241+00	t	572	\N
729	7840118219535	t	3	2021-12-28 18:47:22.602241+00	t	573	\N
730	5601142192636	t	4	2021-12-28 18:47:22.602241+00	t	574	\N
731	3280110270006	t	4	2021-12-28 18:47:22.602241+00	t	575	\N
732	7891031116920	t	3	2021-12-28 18:47:22.602241+00	t	576	\N
733	7891031116951	t	3	2021-12-28 18:47:22.602241+00	t	577	\N
734	7891031116944	t	3	2021-12-28 18:47:22.602241+00	t	578	\N
735	7896931611537	t	4	2021-12-28 18:47:22.602241+00	t	579	\N
737	7804350596335	t	4	2021-12-28 18:47:22.602241+00	t	581	\N
738	7891031116906	t	3	2021-12-28 18:47:22.602241+00	t	582	\N
739	7804350000337	t	4	2021-12-28 18:47:22.602241+00	t	583	\N
740	7804350600353	t	4	2021-12-28 18:47:22.602241+00	t	584	\N
741	7798081660437	t	4	2021-12-28 18:47:22.602241+00	t	585	\N
742	78407466	t	4	2021-12-28 18:47:22.602241+00	t	586	\N
743	7840595005331	t	3	2021-12-28 18:47:22.602241+00	t	588	\N
744	7840595000510	t	3	2021-12-28 18:47:22.602241+00	t	589	\N
745	7840595008554	t	3	2021-12-28 18:47:22.602241+00	t	590	\N
746	7840595002415	t	3	2021-12-28 18:47:22.602241+00	t	591	\N
747	78408562	t	4	2021-12-28 18:47:22.602241+00	t	592	\N
748	78401266	t	4	2021-12-28 18:47:22.602241+00	t	594	\N
749	6253345302283	t	4	2021-12-28 18:47:22.602241+00	t	596	\N
750	7840595001562	t	3	2021-12-28 18:47:22.602241+00	t	598	\N
751	7840595000565	t	3	2021-12-28 18:47:22.602241+00	t	599	\N
753	7840595001111	t	3	2021-12-28 18:47:22.602241+00	t	602	\N
754	7840624000023	t	4	2021-12-28 18:47:22.602241+00	t	604	\N
755	7840595007571	t	3	2021-12-28 18:47:22.602241+00	t	603	\N
756	7840595002859	t	3	2021-12-28 18:47:22.602241+00	t	606	\N
757	7841414000025	t	3	2021-12-28 18:47:22.602241+00	t	608	\N
758	78412231	t	4	2021-12-28 18:47:22.602241+00	t	607	\N
761	7791560001158	t	3	2021-12-28 18:47:22.602241+00	t	613	\N
762	78412248	t	4	2021-12-28 18:47:22.602241+00	t	614	\N
763	7896037918592	t	3	2021-12-28 18:47:22.602241+00	t	616	\N
759	7841414000032	t	3	2021-12-28 18:47:22.602241+00	t	610	\N
760	7840595001012	t	3	2021-12-28 18:47:22.602241+00	t	612	\N
764	78410190	t	4	2021-12-28 18:47:22.602241+00	t	617	\N
769	78412033	t	4	2021-12-28 18:47:22.602241+00	t	619	\N
770	5060116320589	t	3	2021-12-28 18:47:22.602241+00	t	621	\N
771	7896037916338	t	3	2021-12-28 18:47:22.602241+00	t	622	\N
772	78419339	t	4	2021-12-28 18:47:22.602241+00	t	623	\N
773	7840255000089	t	3	2021-12-28 18:47:22.602241+00	t	625	\N
774	78420991	t	4	2021-12-28 18:47:22.602241+00	t	626	\N
775	7896279600538	t	3	2021-12-28 18:47:22.602241+00	t	628	\N
776	78403178	t	4	2021-12-28 18:47:22.602241+00	t	629	\N
777	78421783	t	4	2021-12-28 18:47:22.602241+00	t	631	\N
778	7842283000017	t	4	2021-12-28 18:47:22.602241+00	t	634	\N
779	7840029000383	t	4	2021-12-28 18:47:22.602241+00	t	636	\N
780	7898186823512	t	3	2021-12-28 18:47:22.602241+00	t	633	\N
781	7792070000938	t	3	2021-12-28 18:47:22.602241+00	t	637	\N
782	7790314005305	t	4	2021-12-28 18:47:22.602241+00	t	638	\N
783	7802110001051	t	3	2021-12-28 18:47:22.602241+00	t	639	\N
784	082184000328	t	3	2021-12-28 18:47:22.602241+00	t	640	\N
785	088076177406	t	3	2021-12-28 18:47:22.602241+00	t	641	\N
786	7842283000031	t	4	2021-12-28 18:47:22.602241+00	t	642	\N
787	088076175051	t	3	2021-12-28 18:47:22.602241+00	t	645	\N
788	088076161863	t	3	2021-12-28 18:47:22.602241+00	t	646	\N
790	7896037913849	t	4	2021-12-28 18:47:22.602241+00	t	648	\N
792	7896037913603	t	4	2021-12-28 18:47:22.602241+00	t	649	\N
793	7840027160003	t	4	2021-12-28 18:47:22.602241+00	t	650	\N
794	7840050006491	t	4	2021-12-28 18:47:22.602241+00	t	652	\N
795	5000267024400	t	3	2021-12-28 18:47:22.602241+00	t	654	\N
796	5000267014401	t	3	2021-12-28 18:47:22.602241+00	t	655	\N
797	5000267014609	t	3	2021-12-28 18:47:22.602241+00	t	656	\N
798	4823021801304	t	3	2021-12-28 18:47:22.602241+00	t	659	\N
799	7898295300300	t	4	2021-12-28 18:47:22.602241+00	t	657	\N
800	7897736407066	t	3	2021-12-28 18:47:22.602241+00	t	660	\N
801	7897736407059	t	3	2021-12-28 18:47:22.602241+00	t	661	\N
802	7897736407325	t	3	2021-12-28 18:47:22.602241+00	t	662	\N
803	7896072911114	t	3	2021-12-28 18:47:22.602241+00	t	663	\N
804	7840028205024	t	3	2021-12-28 18:47:22.602241+00	t	664	\N
805	7840028205031	t	3	2021-12-28 18:47:22.602241+00	t	665	\N
806	7894900010015	t	4	2021-12-28 18:47:22.602241+00	t	666	\N
807	7840029867818	t	3	2021-12-28 18:47:22.602241+00	t	668	\N
809	7896072901313	t	3	2021-12-28 18:47:22.602241+00	t	671	\N
810	7891991012867	t	4	2021-12-28 18:47:22.602241+00	t	672	\N
811	5000265090056	t	3	2021-12-28 18:47:22.602241+00	t	673	\N
813	5010106111956	t	3	2021-12-28 18:47:22.602241+00	t	677	\N
815	7790480001613	t	3	2021-12-28 18:47:22.602241+00	t	680	\N
816	7840138000137	t	3	2021-12-28 18:47:22.602241+00	t	681	\N
817	7840027340009	t	3	2021-12-28 18:47:22.602241+00	t	683	\N
818	7840002010019	t	3	2021-12-28 18:47:22.602241+00	t	685	\N
819	7840002030284	t	3	2021-12-28 18:47:22.602241+00	t	686	\N
820	7897736407004	t	3	2021-12-28 18:47:22.602241+00	t	687	\N
821	7897736406014	t	3	2021-12-28 18:47:22.602241+00	t	688	\N
822	8437004142351	t	3	2021-12-28 18:47:22.602241+00	t	689	\N
823	7896023080487	t	3	2021-12-28 18:47:22.602241+00	t	690	\N
824	5010327000091	t	3	2021-12-28 18:47:22.602241+00	t	691	\N
825	5010327207117	t	3	2021-12-28 18:47:22.602241+00	t	692	\N
826	7898080663771	t	3	2021-12-28 18:47:22.602241+00	t	693	\N
828	7896050200742	t	3	2021-12-28 18:47:22.602241+00	t	697	\N
829	5000267134338	t	3	2021-12-28 18:47:22.602241+00	t	699	\N
830	5000267107776	t	3	2021-12-28 18:47:22.602241+00	t	700	\N
831	5000267023625	t	3	2021-12-28 18:47:22.602241+00	t	701	\N
752	6253345302276	t	4	\N	t	600	\N
808	7894900681017	t	4	\N	t	669	\N
812	7894900050011	t	4	\N	t	675	\N
814	794900030013	t	4	\N	t	678	\N
827	7898080662330	t	4	\N	t	695	\N
832	5000267013602	t	3	2021-12-28 18:47:22.602241+00	t	702	\N
833	5000267098418	t	3	2021-12-28 18:47:22.602241+00	t	703	\N
834	080432400432	t	3	2021-12-28 18:47:22.602241+00	t	704	\N
835	50196364	t	3	2021-12-28 18:47:22.602241+00	t	705	\N
836	5000196001695	t	3	2021-12-28 18:47:22.602241+00	t	706	\N
837	7896023013157	t	3	2021-12-28 18:47:22.602241+00	t	707	\N
838	7613287377470	t	4	\N	t	717	\N
839	7793253004316	t	4	\N	t	708	\N
840	7793253004262	t	4	\N	t	709	\N
841	7793253004248	t	4	\N	t	710	\N
842	7793253004323	t	4	\N	t	712	\N
843	7840024005222	t	4	\N	t	714	\N
844	7840024005338	t	4	\N	t	715	\N
846	7613287379993	t	4	\N	t	718	\N
847	7613287377234	t	4	\N	t	719	\N
848	7613034416889	t	4	\N	t	720	\N
849	7896183902261	t	4	\N	t	721	\N
850	7730116103281	t	4	\N	t	722	\N
851	7730116103304	t	4	\N	t	723	\N
852	7896058256246	t	4	\N	t	724	\N
853	7896058256215	t	4	\N	t	725	\N
854	7896058256222	t	4	\N	t	726	\N
855	7896058256239	t	4	\N	t	727	\N
856	7891962054483	t	4	\N	t	728	\N
857	7897115103114	t	4	\N	t	729	\N
858	7897115103077	t	4	\N	t	730	\N
859	7897115103954	t	4	\N	t	731	\N
860	7841846000013	t	4	\N	t	732	\N
861	7792070000907	t	4	\N	t	733	\N
862	7792070000877	t	4	\N	t	734	\N
863	7840029182003	t	4	\N	t	735	\N
864	7794000003439	t	4	\N	t	736	\N
865	7891031409053	t	4	\N	t	737	\N
866	7840029200004	t	4	\N	t	738	\N
867	7794000999954	t	4	\N	t	740	\N
868	7891031409404	t	4	\N	t	741	\N
870	7794000004818	t	4	\N	t	743	\N
871	7790920008707	t	4	\N	t	744	\N
872	7790989003248	t	4	\N	t	745	\N
873	7896292300460	t	4	\N	t	746	\N
874	7896292301412	t	4	\N	t	747	\N
875	7794000003613	t	4	\N	t	748	\N
876	7794000005068	t	4	\N	t	749	\N
877	7891031403044	t	4	\N	t	750	\N
878	77317186	t	4	\N	t	751	\N
879	7793100120275	t	4	\N	t	752	\N
880	7891024132906	t	4	\N	t	753	\N
881	7891024037973	t	4	\N	t	754	\N
882	7896273900122	t	4	\N	t	755	\N
883	7896422000017	t	4	\N	t	756	\N
884	7790040711105	t	4	\N	t	757	\N
885	7896111426227	t	4	\N	t	758	\N
886	7896111426005	t	4	\N	t	759	\N
887	7896111426210	t	4	\N	t	760	\N
888	7896111426029	t	4	\N	t	761	\N
889	7896111426234	t	4	\N	t	762	\N
891	7896111421536	t	4	\N	t	764	\N
892	7896111421550	t	4	\N	t	765	\N
893	7896111421543	t	4	\N	t	766	\N
895	7790040136113	t	4	\N	t	768	\N
896	7790040669109	t	4	\N	t	769	\N
897	7790040110748	t	4	\N	t	770	\N
899	7891000284483	t	4	\N	t	772	\N
900	088169004978	t	4	\N	t	773	\N
901	7790040614000	t	4	\N	t	774	\N
902	7790040613607	t	4	\N	t	775	\N
903	7790040613706	t	4	\N	t	776	\N
904	7790040405301	t	4	\N	t	777	\N
905	7790040405608	t	4	\N	t	778	\N
906	7790040298903	t	4	\N	t	779	\N
907	7790040298804	t	4	\N	t	780	\N
908	7790040298705	t	4	\N	t	781	\N
909	7840029401500	t	4	\N	t	783	\N
910	7840029401005	t	4	\N	t	784	\N
911	7891031112281	t	4	\N	t	785	\N
912	7891031112403	t	4	\N	t	786	\N
913	7898562801622	t	4	\N	t	787	\N
914	7891040128082	t	4	\N	t	788	\N
915	7891079011775	t	4	\N	t	789	\N
916	7891079000250	t	4	\N	t	790	\N
918	7891079000229	t	4	\N	t	792	\N
919	7891079001028	t	4	\N	t	793	\N
920	7891079000205	t	4	\N	t	791	\N
921	7891079001004	t	4	\N	t	794	\N
922	7896058503784	t	4	\N	t	795	\N
923	7891962058405	t	4	\N	t	796	\N
924	7891962058399	t	4	\N	t	797	\N
925	7790580199913	t	4	\N	t	799	\N
927	7790580199906	t	4	\N	t	800	\N
928	7790580617813	t	4	\N	t	802	\N
929	7790580617806	t	4	\N	t	803	\N
930	7790580200114	t	4	\N	t	804	\N
931	7790580200107	t	4	\N	t	805	\N
932	77975737	t	4	\N	t	806	\N
934	7840037000832	t	4	\N	t	808	\N
935	7840037000863	t	4	\N	t	809	\N
936	7840037000856	t	4	\N	t	810	\N
937	7840009650935	t	4	\N	t	811	\N
938	7840013000030	t	4	\N	t	812	\N
939	7840013000016	t	4	\N	t	813	\N
869	6927825550753	\N	4	\N	t	742	\N
845	7840024005239	t	4	\N	t	716	\N
894	7790040136120	t	4	\N	t	767	\N
890	7896111425992	t	4	\N	t	763	\N
898	789100030519	t	4	\N	t	771	\N
941	78740127000735	t	4	\N	t	815	\N
942	7840127002036	t	4	\N	t	816	\N
943	7840127001107	t	4	\N	t	817	\N
944	7840127001114	t	4	\N	t	818	\N
945	7896252205095	t	4	\N	t	819	\N
946	7898945882163	t	4	\N	t	820	\N
947	7840127000384	t	4	\N	t	821	\N
948	7790580418564	t	4	\N	t	822	\N
949	7790580409739	t	4	\N	t	823	\N
950	7793940328008	t	4	\N	t	824	\N
951	7891150070967	t	4	\N	t	825	\N
952	7891150070981	t	4	\N	t	826	\N
953	7896362700015	t	4	\N	t	827	\N
954	7840118218422	t	4	\N	t	828	\N
955	7840118218439	t	4	\N	t	829	\N
956	7840833000173	t	4	\N	t	830	\N
957	7896098900253	t	4	\N	t	831	\N
958	7896098900239	t	4	\N	t	832	\N
959	7896098900222	t	4	\N	t	833	\N
960	7896098902042	t	4	\N	t	834	\N
961	7896098900277	t	4	\N	t	835	\N
962	7840118220074	t	4	\N	t	836	\N
963	7840118216350	t	4	\N	t	837	\N
964	7891150064928	t	4	\N	t	839	\N
965	7891150064317	t	4	\N	t	840	\N
966	7891000260500	t	4	\N	t	841	\N
967	7894321711478	t	4	\N	t	842	\N
968	7894321711263	t	4	\N	t	843	\N
969	7891021006934	t	4	\N	t	844	\N
970	7891021005517	t	4	\N	t	845	\N
971	78916975	t	4	\N	t	846	\N
972	7896451903013	t	4	\N	t	847	\N
973	78928978	t	4	\N	t	848	\N
974	7896451906946	t	4	\N	t	849	\N
975	78916968	t	4	\N	t	850	\N
976	7896451902306	t	4	\N	t	851	\N
977	78916982	t	4	\N	t	852	\N
978	7896451901965	t	4	\N	t	853	\N
979	78917286	t	4	\N	t	854	\N
980	7896451901989	t	4	\N	t	855	\N
981	7896451901361	t	4	\N	t	856	\N
982	7896451902887	t	4	\N	t	857	\N
983	7896451901408	t	4	\N	t	858	\N
984	7896451902863	t	4	\N	t	859	\N
985	7896451908377	t	4	\N	t	860	\N
986	7896451908384	t	4	\N	t	861	\N
987	7896451902382	t	4	\N	t	862	\N
988	7896451902870	t	4	\N	t	863	\N
989	7896451902856	t	4	\N	t	415	\N
990	7896451901385	t	4	\N	t	865	\N
991	7896451902894	t	4	\N	t	866	\N
992	78600027	t	4	\N	t	867	\N
993	7861002910321	t	4	\N	t	868	\N
994	78605831	t	4	\N	t	869	\N
995	7861002901817	t	4	\N	t	870	\N
996	78600010	t	4	\N	t	871	\N
997	7861002910314	t	4	\N	t	872	\N
998	77903501	t	4	\N	t	873	\N
999	7790580716806	t	4	\N	t	874	\N
1000	7790580716707	t	4	\N	t	875	\N
1001	7033202105313	t	4	\N	t	876	\N
1002	6804061534245	t	4	\N	t	877	\N
1003	7840450000266	t	4	\N	t	878	\N
1004	7840450000211	t	4	\N	t	879	\N
1005	7840450000204	t	4	\N	t	880	\N
1006	7840450000242	t	4	\N	t	881	\N
1007	7840450000259	t	4	\N	t	882	\N
1008	6915121211140	t	4	\N	t	883	\N
1010	7896275960575	t	4	\N	t	885	\N
1011	7792860011212	t	4	\N	t	886	\N
1012	7792860001213	t	4	\N	t	887	\N
1013	7790580106409	t	4	\N	t	888	\N
1014	022000159526	t	4	\N	t	442	\N
1015	022000159540	t	4	\N	t	444	\N
1016	7802200809215	t	4	\N	t	889	\N
1017	7802200809208	t	4	\N	t	890	\N
1018	7790580327613	t	4	\N	t	891	\N
1019	7790580327606	t	4	\N	t	892	\N
1020	7898142853706	t	4	\N	t	893	\N
1021	7898142853713	t	4	\N	t	894	\N
1022	7802200132696	t	4	\N	t	895	\N
1023	7896306623158	t	4	\N	t	897	\N
1024	7896306623165	t	4	\N	t	898	\N
1025	7896306618291	t	4	\N	t	899	\N
1026	7896306618307	t	4	\N	t	900	\N
1027	7802000013607	t	4	\N	t	901	\N
1028	7790310005606	t	4	\N	t	902	\N
1029	7892840255541	t	4	\N	t	903	\N
1030	7892840818487	t	4	\N	t	904	\N
1031	7892840817787	t	4	\N	t	905	\N
1032	7798186032771	t	4	\N	t	906	\N
1033	7798186032726	t	4	\N	t	907	\N
1034	7891151039796	t	4	\N	t	908	\N
1035	7891151039802	t	4	\N	t	909	\N
1036	7891151039772	t	4	\N	t	910	\N
1037	7891151039789	t	4	\N	t	911	\N
1038	7790580116934	t	4	\N	t	421	\N
1039	77958624	t	4	\N	t	912	\N
1040	7790580101282	t	4	\N	t	913	\N
1041	77958655	t	4	\N	t	914	\N
1042	7790580101312	t	4	\N	t	915	\N
1043	78938823	t	4	\N	t	916	\N
1044	7622210857293	t	4	\N	t	917	\N
1045	78938793	t	4	\N	t	918	\N
1046	7622210812636	t	4	\N	t	919	\N
611	0228910	t	4	\N	t	441	\N
1047	78938830	t	4	\N	t	920	\N
1048	7622210857255	t	4	\N	t	921	\N
1049	77959515	t	4	\N	t	418	\N
1050	7790580595104	t	4	\N	t	419	\N
1051	78026056	t	4	\N	t	923	\N
1052	7802225170901	t	4	\N	t	924	\N
1053	78024922	t	4	\N	t	925	\N
1054	7802225152884	t	4	\N	t	926	\N
1055	77921246	t	4	\N	t	927	\N
1056	7790580212407	t	4	\N	t	928	\N
1057	78024458	t	4	\N	t	929	\N
1058	7802225152471	t	4	\N	t	930	\N
1059	78024472	t	4	\N	t	931	\N
1060	7802225152464	t	4	\N	t	932	\N
1061	78024465	t	4	\N	t	933	\N
1062	7802225152501	t	4	\N	t	934	\N
1063	7790580121013	t	4	\N	t	935	\N
1064	7790580120115	t	4	\N	t	936	\N
1065	7790580120702	t	4	\N	t	937	\N
1066	7790580121006	t	4	\N	t	938	\N
1067	77969101	t	4	\N	t	939	\N
1068	7622201148874	t	4	\N	t	940	\N
1069	77969118	t	4	\N	t	941	\N
1070	7622201149185	t	4	\N	t	942	\N
1071	77969088	t	4	\N	t	943	\N
1072	7622201149208	t	4	\N	t	944	\N
1073	7622300874018	t	4	\N	t	945	\N
1074	7622300874001	t	4	\N	t	946	\N
1075	7622201457396	t	4	\N	t	947	\N
1076	7622201457389	t	4	\N	t	948	\N
1077	7895800304211	t	4	\N	t	949	\N
1078	7895800400159	t	4	\N	t	950	\N
1079	7895800304228	t	4	\N	t	951	\N
1080	7895800400142	\N	4	\N	t	952	\N
1081	7895800201503	t	4	\N	t	953	\N
1082	7895800400180	\N	4	\N	t	954	\N
1083	7895800304235	t	4	\N	t	955	\N
1084	7895800400173	t	4	\N	t	956	\N
1085	7895800309780	t	4	\N	t	957	\N
1086	7895800400227	t	4	\N	t	958	\N
1087	7895800430002	t	4	\N	t	960	\N
1088	7895800400166	t	4	\N	t	961	\N
1120	7891991010900	t	4	\N	t	994	\N
1121	7840050002820	t	4	\N	t	996	\N
1122	7840050002837	t	4	\N	t	997	\N
1123	034100176020	t	4	\N	t	158	\N
1124	7841431000435	t	4	\N	t	998	\N
1125	5000267112077	t	4	\N	t	999	\N
1126	5010327907246	t	4	\N	t	1000	\N
1127	5010327908243	t	4	\N	t	1001	\N
1128	5010327000039	t	4	\N	t	1002	\N
1129	5000281004020	t	4	\N	t	1003	\N
1130	5010106112250	t	4	\N	t	1004	\N
1131	5010106134493	t	4	\N	t	1005	\N
1132	4067700014559	t	4	\N	t	1006	\N
1133	3012997686201	t	4	\N	t	1007	\N
1134	3012993006492	t	4	\N	t	1008	\N
1135	7891172660909	t	4	\N	t	1009	\N
1136	5000299228685	t	4	\N	t	1010	\N
1138	8437004142863	t	4	\N	t	1012	\N
1139	8437004142122	t	4	\N	t	1013	\N
1140	8437004142115	t	4	\N	t	1014	\N
1141	897076002003	t	4	\N	t	1015	\N
1142	7501035011250	t	4	\N	t	1016	\N
1143	7896037916123	t	4	\N	t	1017	\N
1144	7896037918646	t	4	\N	t	1018	\N
1145	7893218002576	t	4	\N	t	1019	\N
1146	7896002111430	t	4	\N	t	1020	\N
1147	77906106	t	4	\N	t	1021	\N
1148	7791200000213	t	4	\N	t	1022	\N
1149	7898080660916	t	4	\N	t	1023	\N
1150	7791203000517	t	4	\N	t	1024	\N
1151	7791250001680	t	4	\N	t	1025	\N
1152	7791250001673	t	4	\N	t	1026	\N
1153	7790649000136	t	4	\N	t	1027	\N
1154	7790649000167	t	4	\N	t	1028	\N
1155	7791250001260	t	4	\N	t	1029	\N
1156	7791250000904	t	4	\N	t	1030	\N
1157	7791250000942	t	4	\N	t	1031	\N
1158	7791250000935	t	4	\N	t	1032	\N
1159	7804320116846	t	4	\N	t	1033	\N
1160	7804320148397	t	4	\N	t	1034	\N
1161	7804320116815	t	4	\N	t	1035	\N
1162	7804320626734	t	4	\N	t	1036	\N
1163	7804320626741	t	4	\N	t	1037	\N
1164	7804320116921	t	4	\N	t	1038	\N
1165	780435007329	t	4	\N	t	1039	\N
1166	7804350596243	t	4	\N	t	1040	\N
1167	7790240017045	t	4	\N	t	1041	\N
1168	7790240025415	t	4	\N	t	1042	\N
1169	7790314000133	t	4	\N	t	1043	\N
1170	7804315000280	t	4	\N	t	1044	\N
1171	7790703100321	t	4	\N	t	1045	\N
1172	7896780902046	t	4	\N	t	1046	\N
1173	7896780900196	t	4	\N	t	1047	\N
1174	7792410000581	t	4	\N	t	1048	\N
1175	7840027320001	t	4	\N	t	1049	\N
1176	7840027130006	t	4	\N	t	1050	\N
1177	7891141026973	t	4	\N	t	1051	\N
1178	7790314006760	t	4	\N	t	1052	\N
1179	7790314055522	t	4	\N	t	1053	\N
1180	7898172660107	t	4	\N	t	1054	\N
1181	7896620901390	t	4	\N	t	1055	\N
1182	7896620901406	t	4	\N	t	1056	\N
1183	7840138000021	t	4	\N	t	1057	\N
1184	78400528	t	4	\N	t	1058	\N
1185	78400498	t	4	\N	t	1059	\N
1186	7840029867801	t	4	\N	t	1060	\N
1187	7840029868495	t	4	\N	t	1061	\N
1188	7790314000966	t	4	\N	t	1062	\N
1189	7896741649041	t	4	\N	t	1063	\N
1190	7840029867825	t	4	\N	t	1064	\N
1191	7840028200289	t	4	\N	t	1065	\N
1192	7840027050007	t	4	\N	t	1066	\N
1194	7840002020049	t	4	\N	t	1068	\N
1195	7840002030116	t	4	\N	t	1069	\N
1196	7897736407479	t	4	\N	t	1070	\N
1197	7897736410110	t	4	\N	t	1071	\N
1198	7897736407486	t	4	\N	t	1072	\N
1199	7791540053184	t	4	\N	t	1073	\N
1200	7898080663566	t	4	\N	t	1074	\N
1201	7896547501383	t	4	\N	t	1075	\N
1202	7896547501390	t	4	\N	t	1076	\N
1203	7896016608766	t	4	\N	t	1077	\N
1204	7898080664778	t	4	\N	t	1078	\N
1205	78400924	t	4	\N	t	1079	\N
1206	7840371000451	t	4	\N	t	1080	\N
1207	78413948	t	4	\N	t	1081	\N
1208	7840371007320	t	4	\N	t	1082	\N
1209	78401082	t	4	\N	t	1083	\N
1210	7840371000239	t	4	\N	t	1084	\N
1211	78403819	t	4	\N	t	1085	\N
1212	7840371000673	t	4	\N	t	1086	\N
1213	78421509	t	4	\N	t	1087	\N
1214	7840371007375	t	4	\N	t	1088	\N
1215	7840371001014	t	4	\N	t	587	\N
1216	78411081	t	4	\N	t	1089	\N
1217	7840371007290	t	4	\N	t	1090	\N
1218	78409743	t	4	\N	t	1091	\N
1219	78402034	t	4	\N	t	1092	\N
1220	7840371000475290	t	4	\N	t	1093	\N
1221	78403192	t	4	\N	t	1094	\N
1222	7840371000611	t	4	\N	t	1095	\N
1223	7840371001274	t	4	\N	t	593	\N
1224	6253345302337	t	4	\N	t	601	\N
1225	6253345302344	t	4	\N	t	597	\N
1226	8998989121200	t	4	\N	t	1096	\N
1227	8998989123204	t	4	\N	t	1097	\N
1228	78421776	t	4	\N	t	1098	\N
1229	78413610	t	4	\N	t	1099	\N
1230	7840925000180	t	4	\N	t	1100	\N
1231	78412408	t	4	\N	t	1101	\N
1232	78406827	t	4	\N	t	1103	\N
1233	78419803	t	4	\N	t	1104	\N
1234	78413658	t	4	\N	t	1105	\N
1235	78409989	t	4	\N	t	1106	\N
1236	78409651	t	4	\N	t	1107	\N
1237	78421561	t	4	\N	t	1108	\N
1238	78421547	t	4	\N	t	1109	\N
1239	78420847	t	4	\N	t	1110	\N
1240	78407251	t	4	\N	t	1111	\N
1241	78406834	t	4	\N	t	1112	\N
1242	78406841	t	4	\N	t	1113	\N
1243	78421004	t	4	\N	t	1114	\N
1245	78409620	t	4	\N	t	1116	\N
1246	8411134001009	t	4	\N	t	1117	\N
1247	8411134102799	t	4	\N	t	1118	\N
1248	8411134102850	t	4	\N	t	1119	\N
1249	78927032	t	4	\N	t	1120	\N
1250	7898032918393	t	4	\N	t	1121	\N
1251	7891991255277	t	4	\N	t	1122	\N
1252	75032715	t	4	\N	t	1123	\N
1253	7501064191398	t	4	\N	t	1124	\N
1254	080660956411	t	4	\N	t	1125	\N
1255	08066844	t	4	\N	t	1127	\N
1256	080660954011	t	4	\N	t	1128	\N
1257	7891991294942	t	4	\N	t	1130	\N
1258	7840050002455	t	4	\N	t	1132	\N
1259	78410138	t	4	\N	t	1135	\N
1260	0798190119809	t	4	\N	t	1140	\N
1261	0798190119823	t	4	\N	t	1142	\N
1262	7896514701426	t	4	\N	t	1144	\N
1263	7840029874052	t	4	\N	t	1146	\N
1264	7804320272252	t	4	\N	t	1147	\N
1265	7804320303178	t	4	\N	t	1148	\N
1266	7804320559001	t	4	\N	t	1149	\N
1267	7804320556000	t	4	\N	t	1150	\N
1268	7804320383859	t	4	\N	t	1151	\N
1269	7804320384382	t	4	\N	t	1152	\N
1270	7792798008377	t	4	\N	t	1153	\N
1271	7891141018541	t	4	\N	t	1155	\N
1272	7891141028830	t	4	\N	t	1156	\N
1273	7891141025631	t	4	\N	t	1157	\N
1274	7891141024221	t	4	\N	t	1158	\N
1275	7891141019838	t	4	\N	t	1159	\N
1276	7804350000061	t	4	\N	t	1160	\N
1277	7804350004854	t	4	\N	t	1161	\N
1278	7804350000054	t	4	\N	t	1162	\N
1279	7804350006896	t	4	\N	t	1163	\N
1280	7804350599756	t	4	\N	t	1164	\N
1281	7804350596359	t	4	\N	t	1165	\N
1282	7804350596366	t	4	\N	t	1166	\N
1283	7804350003321	t	4	\N	t	1167	\N
1284	7804350596632	t	4	\N	t	1168	\N
1285	7896037913856	t	4	\N	t	647	\N
1286	7804350596236	t	4	\N	t	1169	\N
1287	7804350002157	t	4	\N	t	1170	\N
1288	7896037913122	t	4	\N	t	1171	\N
1289	7896037913252	t	4	\N	t	1172	\N
1290	7896037917120	t	4	\N	t	1173	\N
1291	7896037913900	t	4	\N	t	1174	\N
1292	7896037913245	t	4	\N	t	1175	\N
1293	7896037917243	t	4	\N	t	1176	\N
1294	7896037913030	t	4	\N	t	1178	\N
1295	7896037913719	t	4	\N	t	1179	\N
1296	7896037913672	t	4	\N	t	1180	\N
1297	7896037913177	t	4	\N	t	1181	\N
1298	7896037913146	t	4	\N	t	1182	\N
1299	7896037917175	t	4	\N	t	1183	\N
1300	7804300001638	t	4	\N	t	1184	\N
1301	7791203001248	t	4	\N	t	1185	\N
736	7791203000647	t	4	\N	t	580	\N
1302	7791203001231	t	4	\N	t	1186	\N
1303	7790975017495	t	4	\N	t	1187	\N
1304	7790975017518	t	4	\N	t	1188	\N
1305	7791203000852	t	4	\N	t	1189	\N
1306	7896620901383	t	4	\N	t	1190	\N
1307	7790036001111	t	4	\N	t	1191	\N
1308	7790036001098	t	4	\N	t	1192	\N
1309	7790036948171	t	4	\N	t	1193	\N
1310	7790314005961	t	4	\N	t	1194	\N
1311	7891991009584	t	4	\N	t	1195	\N
1312	7790314010439	t	4	\N	t	1197	\N
1313	7790314055539	t	4	\N	t	1199	\N
1314	7790314000973	t	4	\N	t	1201	\N
1315	7790314000980	t	4	\N	t	1204	\N
1316	7790314005947	t	4	\N	t	1205	\N
1317	78905351	t	4	\N	t	1207	\N
1318	7840058001887	t	4	\N	t	1209	\N
1319	7840058000019	t	4	\N	t	1211	\N
1320	7840058006509	t	4	\N	t	1213	\N
1321	7840058000675	t	4	\N	t	1215	\N
1322	7840058000316	t	4	\N	t	1217	\N
1323	7840058000361	t	4	\N	t	1219	\N
1325	7840058000026	\N	4	\N	t	1221	\N
1326	7840058008084	\N	4	\N	t	1221	\N
1327	7894900027013	\N	4	\N	t	1221	\N
1324	7840058000750	t	4	\N	t	1221	\N
1328	7840058000477	t	4	\N	t	1223	\N
1329	7840058004055	t	4	\N	t	1225	\N
1330	7840058002532	t	4	\N	t	1227	\N
1331	7840058002549	t	4	\N	t	1229	\N
1332	7840058004086	t	4	\N	t	1231	\N
1333	7840058002440	t	4	\N	t	1233	\N
1334	7840058000040	t	4	\N	t	1235	\N
1335	7840058000057	t	4	\N	t	1237	\N
1336	7840058000330	t	4	\N	t	1239	\N
1337	7840058000392	t	4	\N	t	1241	\N
1338	7840058005472	t	4	\N	t	1243	\N
1339	7840058008015	t	4	\N	t	1245	\N
1340	7840058008503	t	4	\N	t	1247	\N
1341	7840058003089	t	4	\N	t	1249	\N
1342	7840058004673	t	4	\N	t	1251	\N
1343	7840058005489	t	4	\N	t	1253	\N
1344	7840058003140	t	4	\N	t	1255	\N
1345	7840058003720	t	4	\N	t	1257	\N
1346	7840058003737	t	4	\N	t	1259	\N
1347	7840058003690	t	4	\N	t	1261	\N
1348	7840058004697	t	4	\N	t	1263	\N
1349	7840058003744	t	4	\N	t	1265	\N
1350	7840058003751	t	4	\N	t	1267	\N
1351	7840058008022	t	4	\N	t	1269	\N
1354	7840058000088	t	4	\N	t	1273	\N
1355	7840058006615	\N	4	\N	t	1273	\N
1356	7840058005496	t	4	\N	t	1275	\N
1357	7840058006622	\N	4	\N	t	1275	\N
1358	7840058000323	t	4	\N	t	1277	\N
1359	7840058000378	t	4	\N	t	1279	\N
1360	7840058002457	t	4	\N	t	1281	\N
1361	7840058003584	t	4	\N	t	1283	\N
1362	7840058006646	\N	4	\N	t	1283	\N
1363	7840058003553	t	4	\N	t	1285	\N
1364	7840058006639	\N	4	\N	t	1285	\N
1365	7840058005786	t	4	\N	t	1287	\N
1366	7840058006653	\N	4	\N	t	1287	\N
1367	7840058003577	t	4	\N	t	1289	\N
1368	7840058006707	\N	4	\N	t	1289	\N
1369	7840058003546	t	4	\N	t	1291	\N
1370	7840058006691	\N	4	\N	t	1291	\N
1371	7840058005410	t	4	\N	t	1293	\N
1372	7840058006714	\N	4	\N	t	1293	\N
1373	7840058003591	t	4	\N	t	1295	\N
1374	7840058006677	\N	4	\N	t	1295	\N
1375	7840058003560	t	4	\N	t	1297	\N
1376	7840058006660	\N	4	\N	t	1297	\N
1377	7840058003010	t	4	\N	t	1299	\N
1378	7840058002938	t	4	\N	t	1301	\N
1379	7840058002945	t	4	\N	t	1303	\N
1380	7840058002952	t	4	\N	t	1305	\N
1381	7794000792555	t	4	\N	t	1307	\N
1382	7790895643743	\N	4	\N	t	1307	\N
1383	7794000792517	t	4	\N	t	1310	\N
1384	7790895643835	\N	4	\N	t	1310	\N
1385	7794000792562	t	4	\N	t	1312	\N
1386	7790895643750	\N	4	\N	t	1312	\N
1387	7794000792494	t	4	\N	t	1314	\N
1388	7790895643842	\N	4	\N	t	1314	\N
1389	7794000792579	t	4	\N	t	1316	\N
1390	7790895643729	\N	4	\N	t	1316	\N
1391	7794000792500	t	4	\N	t	1318	\N
1392	7790895643828	\N	4	\N	t	1318	\N
1393	7794000792586	t	4	\N	t	1320	\N
1394	7790895643767	\N	4	\N	t	1320	\N
1395	7794000792487	t	4	\N	t	1322	\N
1396	7790895643866	\N	4	\N	t	1322	\N
1397	7840058003874	t	4	\N	t	1324	\N
1398	7840058002105	t	4	\N	t	1326	\N
1352	7840058000071	f	4	\N	t	1271	\N
1399	7840058003898	t	4	\N	t	1328	\N
1400	7840058002082	t	4	\N	t	1330	\N
1401	7840058006400	t	4	\N	t	1332	\N
1402	7840058004215	t	4	\N	t	1334	\N
1403	7840058007520	t	4	\N	t	1336	\N
1404	7840058006561	t	4	\N	t	1338	\N
1405	7840058007582	t	4	\N	t	1340	\N
1406	7840058001443	t	4	\N	t	1342	\N
1407	7840058001061	t	4	\N	t	1344	\N
1408	7840058001436	t	4	\N	t	1346	\N
1409	7840058006127	t	4	\N	t	1348	\N
1410	7840058006110	t	4	\N	t	1350	\N
1411	7840058007483	t	4	\N	t	1352	\N
1412	7840058002877	t	4	\N	t	1354	\N
1413	7840058002815	t	4	\N	t	1356	\N
1414	7840058004000	t	4	\N	t	1358	\N
1415	7894900504002	t	4	\N	t	1360	\N
1416	7840058003416	t	4	\N	t	1362	\N
1417	7840058003386	t	4	\N	t	1364	\N
1418	7840058003812	t	4	\N	t	1366	\N
1419	7840058003829	t	4	\N	t	1368	\N
1420	7840058005229	t	4	\N	t	1370	\N
1421	7840058005212	t	4	\N	t	1372	\N
1422	7840058007704	\N	4	\N	t	1372	\N
1423	7797394001265	t	4	\N	t	1374	\N
1424	7797394001319	\N	4	\N	t	1375	\N
1425	8411134127402	t	4	\N	t	1376	\N
1426	8411134114716	t	4	\N	t	1377	\N
1427	7622201457334	t	4	\N	t	1378	\N
1428	7790580120573	t	4	\N	t	1379	\N
1429	7622210564290	t	4	\N	t	1380	\N
1430	77959508	t	4	\N	t	1381	\N
1432	77940131	t	4	\N	t	807	\N
1433	78938847	t	4	\N	t	1382	\N
1434	78938816	t	4	\N	t	1383	\N
1435	77969071	t	4	\N	t	1384	\N
1436	77958662	t	4	\N	t	1385	\N
1437	77958631	t	4	\N	t	1386	\N
1438	7891151040969	t	4	\N	t	416	\N
1439	7891151039635	t	4	\N	t	1387	\N
1440	7891151039536	t	4	\N	t	1388	\N
1441	7891151039734	t	4	\N	t	1389	\N
1442	7891151040549	t	4	\N	t	1390	\N
1443	7891151039598	t	4	\N	t	1391	\N
1444	250	t	4	\N	t	1392	\N
1445	7790580106003	t	4	\N	t	1393	\N
1447	7790040374607	t	4	\N	t	1394	\N
1448	7840013000702	t	4	\N	t	1395	\N
1449	7840127000735	t	4	\N	t	1396	\N
1451	7898562803688	t	4	\N	t	1398	\N
1452	7790580650100	t	4	\N	t	739	\N
1454	6927825550555	t	4	\N	t	742	\N
1455	7896017414304	t	4	\N	t	1399	\N
1456	7896080820255	t	4	\N	t	1400	\N
1457	7896080820286	t	4	\N	t	1401	\N
1458	7896080820293	t	4	\N	t	1402	\N
1459	5000267165806	t	4	\N	t	1403	\N
1460	7790975198675	t	4	\N	t	1404	\N
1461	5000267096285	t	4	\N	t	1405	\N
1462	7896050200131	t	4	\N	t	1406	\N
1137	7840300151485	t	4	\N	t	1011	\N
1463	7792798002351	t	4	\N	t	1407	\N
1464	7792798002375	t	4	\N	t	1409	\N
1009	7896275960896	t	4	\N	t	884	\N
1465	7891000257135	t	4	\N	t	1410	\N
1466	77961815	t	4	\N	t	460	\N
1467	7790580119058	t	4	\N	t	461	\N
1468	77958921	t	4	\N	t	1411	\N
1469	7790580119133	t	4	\N	t	1412	\N
1470	450	t	4	\N	t	1413	\N
1471	102	t	4	\N	t	1414	\N
1472	105	t	4	\N	t	1415	\N
1473	110	t	4	\N	t	1416	\N
1474	206	t	4	\N	t	1417	\N
1475	210	t	4	\N	t	1418	\N
1476	25000	t	4	\N	t	1419	\N
1477	20000	t	4	\N	t	1420	\N
1478	6699	t	4	\N	t	1421	\N
1479	011	t	4	\N	t	1422	\N
1480	7896100900011	t	4	\N	t	1423	\N
1481	7793253002145	t	4	\N	t	711	\N
1482	7891962058412	t	4	\N	t	798	\N
1483	7840050005968	t	4	\N	t	1424	\N
1484	7840042100503	t	4	\N	t	1426	\N
1485	7840042102507	t	4	\N	t	1427	\N
1486	7840042103535	t	4	\N	t	1428	\N
1487	7840042102538	t	4	\N	t	1429	\N
1488	7840042101531	t	4	\N	t	1430	\N
1489	7840042103511	t	4	\N	t	1431	\N
1490	7840042100510	t	4	\N	t	1432	\N
1491	7840042101517	t	4	\N	t	1433	\N
1492	7840042104518	t	4	\N	t	1434	\N
1493	7840042102514	t	4	\N	t	1435	\N
1494	7840042103542	t	4	\N	t	1436	\N
1495	7840042101548	t	4	\N	t	1437	\N
1496	7840042102545	t	4	\N	t	1438	\N
1497	7840042101692	t	4	\N	t	1439	\N
1498	7840042102682	t	4	\N	t	1440	\N
1499	7840042103689	t	4	\N	t	1441	\N
1500	7840042101685	t	4	\N	t	1442	\N
1501	7840042100688	t	4	\N	t	1443	\N
1502	7840042103702	t	4	\N	t	1444	\N
1503	7840042100756	t	4	\N	t	1445	\N
1504	7840042109759	t	4	\N	t	1446	\N
1505	7840042107755	t	4	\N	t	1447	\N
1506	7840042100763	t	4	\N	t	1448	\N
1507	7840042102767	t	4	\N	t	1449	\N
1508	7840042000841	t	4	\N	t	1450	\N
1509	7840042100527	t	4	\N	t	1451	\N
1510	7840042103528	t	4	\N	t	1452	\N
1511	7840042000780	t	4	\N	t	1453	\N
1512	7840042000810	t	4	\N	t	1454	\N
1513	7840042000797	t	4	\N	t	1455	\N
1514	7840042006010	t	4	\N	t	1456	\N
1515	7840042006027	t	4	\N	t	1457	\N
1516	7840042002517	t	4	\N	t	1458	\N
1517	7840042002548	t	4	\N	t	1459	\N
1518	7840042002500	t	4	\N	t	1460	\N
1519	7840042000162	t	4	\N	t	1461	\N
1520	7840042000117	t	4	\N	t	1462	\N
1521	7840042000414	t	4	\N	t	1463	\N
1522	7840042000384	t	4	\N	t	1464	\N
1523	7840042000124	t	4	\N	t	1465	\N
1524	7840042005136	t	4	\N	t	1466	\N
1525	7840042005013	t	4	\N	t	1467	\N
1526	7840042000179	t	4	\N	t	1471	\N
1527	7840042000131	t	4	\N	t	1473	\N
1529	7840005012379	t	4	\N	t	1475	\N
1530	7840005011174	t	4	\N	t	1477	\N
1531	7840005012409	t	4	\N	t	1479	\N
1532	7898422676544	t	4	\N	t	1481	\N
1533	7898628530435	t	4	\N	t	1482	\N
1534	7898628530374	t	4	\N	t	1483	\N
1535	7898422678845	t	4	\N	t	1484	\N
1536	7898422670054	t	4	\N	t	1485	\N
1537	7898080662668	t	4	\N	t	1486	\N
1538	7898080664389	t	4	\N	t	1487	\N
1539	1007084701235	t	4	\N	t	1488	\N
1540	070847033301	t	4	\N	t	1489	\N
1541	070847022305	t	4	\N	t	1490	\N
1542	070847033929	t	4	\N	t	1491	\N
1543	7898080662262	t	4	\N	t	1492	\N
1544	7898080664037	t	4	\N	t	1493	\N
1545	7898080664358	t	4	\N	t	1494	\N
1546	7896186302693	t	4	\N	t	1495	\N
1547	7896186302914	t	4	\N	t	1496	\N
1548	7898080664044	t	4	\N	t	1497	\N
1549	7898080664112	t	4	\N	t	1498	\N
1550	7898080664426	t	4	\N	t	1499	\N
1551	7898080664365	t	4	\N	t	1500	\N
1552	7898080660565	t	4	\N	t	1501	\N
1553	9005465133080	t	4	\N	t	1502	\N
1554	9005465101058	t	4	\N	t	1503	\N
1556	9005465288056	\N	4	\N	t	1503	\N
1557	7840017108121	t	4	\N	t	1505	\N
1558	7840017202126	t	4	\N	t	1507	\N
1559	7840017109227	t	4	\N	t	1509	\N
1560	7840017108152	t	4	\N	t	1511	\N
1561	7840017021123	t	4	\N	t	1513	\N
1562	7840017230150	t	4	\N	t	1515	\N
1563	7848000560024	t	4	\N	t	1517	\N
1564	7848000560307	t	4	\N	t	1518	\N
1565	7848000560291	t	4	\N	t	1519	\N
1566	7848000560031	t	4	\N	t	1520	\N
1567	7848000560017	t	4	\N	t	1521	\N
1568	7848000560048	t	4	\N	t	1522	\N
1569	449812	t	4	\N	t	1523	\N
1570	449800	\N	4	\N	t	1523	\N
1571	449807	\N	4	\N	t	1523	\N
1572	449805	\N	4	\N	t	1523	\N
1353	7840058006608	t	4	\N	t	1271	\N
1573	098	t	4	\N	t	1524	\N
1574	0987	\N	4	\N	t	1524	\N
1575	1000	t	7	\N	t	1525	\N
1576	070330913431	t	4	\N	t	1526	\N
1577	070330631328	\N	4	\N	t	1526	\N
1578	070330909229	t	4	\N	t	1527	\N
1580	070330631335	\N	4	\N	t	1527	\N
1581	7892840815912	t	4	\N	t	1528	\N
1582	799953122241	t	4	\N	t	1529	\N
1583	799953110231	t	4	\N	t	1530	\N
1584	7892840818326	t	4	\N	t	1531	\N
1585	7892840816261	t	4	\N	t	1532	\N
1586	17186	t	4	\N	t	1533	\N
1587	7898927097837	t	4	\N	t	1534	\N
1588	7892840818104	t	4	\N	t	1535	\N
1589	7892840818043	t	4	\N	t	1536	\N
1590	7790040132962	\N	4	\N	t	769	\N
1591	7891021006125	t	4	\N	t	1537	\N
1592	7891000460207	t	4	\N	t	1538	\N
1593	9216623804098	t	4	\N	t	1539	\N
1594	9900000972783	t	4	\N	t	1540	\N
1595	9910001058867	t	4	\N	t	1541	\N
1596	7056202006237	t	4	\N	t	1542	\N
1597	1232020112015	t	4	\N	t	1543	\N
1598	7793253004231	t	4	\N	t	1544	\N
1599	8410179100050	t	4	\N	t	782	\N
1244	78414198	t	4	\N	t	1115	\N
1600	7840118216374	t	4	\N	t	1545	\N
1601	78930650	t	4	\N	t	1546	\N
1602	78421608	\N	4	\N	t	1098	\N
1603	038000184956	t	4	\N	t	1547	\N
1604	038000184932	t	4	\N	t	1548	\N
1605	038000184949	t	4	\N	t	1549	\N
1606	7070202005052	t	4	\N	t	1550	\N
1607	7891000277072	t	4	\N	t	1551	\N
1608	7891000276792	t	4	\N	t	1552	\N
1609	7622210936707	t	4	\N	t	1553	\N
1610	7622300991418	t	4	\N	t	1554	\N
1611	7622210961716	t	4	\N	t	1555	\N
1612	7622300991500	t	4	\N	t	1556	\N
1613	7840024005314	t	4	\N	t	713	\N
1614	7840127001701	t	4	\N	t	1557	\N
1615	13375	t	4	\N	t	1559	\N
1616	7840779007007	t	4	\N	t	1561	\N
1617	7898295302861	t	4	\N	t	1564	\N
1618	7898295302786	t	4	\N	t	1566	\N
1619	7898295302373	t	4	\N	t	1568	\N
1621	8412598005893	\N	4	\N	t	341	\N
1622	7840894000495	t	4	\N	t	1570	\N
1623	8681511386771	t	4	\N	t	1572	\N
1624	78421745	t	4	\N	t	1573	\N
1625	78412590	t	4	\N	t	1574	\N
1626	UNIDAD	t	4	\N	t	1575	\N
1627	1114	t	4	\N	t	1576	\N
1628	7892840816803	t	4	\N	t	1577	\N
1629	4000	t	4	\N	t	1578	\N
1630	6949235700894	t	4	\N	t	1580	\N
1631	84196590	t	4	\N	t	1581	\N
1632	0742832250481	t	4	\N	t	1582	\N
1633	850730000296	t	4	\N	t	1583	\N
1634	8400000079273	t	4	\N	t	1584	\N
1635	6901683211582	t	4	\N	t	1585	\N
1450	13	t	4	\N	t	1397	\N
1636	7891031112304	t	4	\N	t	1587	\N
1637	7897736407462	t	4	\N	t	1588	\N
1638	7840058007506	t	4	\N	t	1589	\N
1639	034100009908	t	4	\N	t	1591	\N
1640	7891000305232	t	4	\N	t	1594	\N
1641	7891000305270	t	4	\N	t	1595	\N
1642	7891000305195	t	4	\N	t	1596	\N
1643	78411098	t	4	\N	t	1597	\N
1644	7840371007306	t	4	\N	t	1598	\N
1646	7790290101602	\N	4	\N	t	572	\N
1647	7312040017034	t	4	\N	t	1600	\N
1648	07084703323	\N	4	\N	t	1488	\N
1650	7841431000343	t	4	\N	t	1602	\N
1651	7891079013106	t	4	\N	t	1603	\N
1652	7891079013038	t	4	\N	t	1604	\N
1653	7896058503777	t	4	\N	t	1605	\N
1654	7891079013052	t	4	\N	t	1606	\N
1655	799953110460	t	4	\N	t	1607	\N
1656	7896072900415	t	4	\N	t	1608	\N
643	7897274100160	t	4	\N	t	485	\N
1657	7897274101051	\N	4	\N	t	485	\N
1658	7896072900491	t	4	\N	t	1609	\N
1659	7501035011243	t	4	\N	t	1610	\N
1661	3280111580005	\N	4	\N	t	575	\N
1662	78409637	t	4	\N	t	1611	\N
1663	7840050007429	t	4	\N	t	1612	\N
1664	7840050007535	t	4	\N	t	1613	\N
1665	7896058503845	t	4	\N	t	1614	\N
1666	7896058503760	t	4	\N	t	1615	\N
1667	7891000089231	t	4	\N	t	1616	\N
1668	6972464297064	t	4	\N	t	1617	\N
1669	6972464297033	t	4	\N	t	1618	\N
1670	6972464297088	t	4	\N	t	1620	\N
1671	6972464297040	t	4	\N	t	1621	\N
1672	6972464297637	t	4	\N	t	1622	\N
1673	6972464297644	t	4	\N	t	1623	\N
1674	6972464297682	t	4	\N	t	1624	\N
1675	6972464297613	t	4	\N	t	1625	\N
1676	6972464283098	t	4	\N	t	1626	\N
1677	6972464282619	\N	4	\N	t	1627	\N
1678	6972464282633	t	4	\N	t	1628	\N
1679	6972464282671	t	4	\N	t	1629	\N
1680	6972464282657	t	4	\N	t	1630	\N
1681	6972464281858	t	4	\N	t	1631	\N
1682	6972464281803	t	4	\N	t	1632	\N
1683	7792798004652	t	8	\N	t	1634	\N
1684	7891000089279	t	4	\N	t	1636	\N
1685	75001629	t	4	\N	t	1637	\N
1686	8712000035549	t	4	\N	t	1639	\N
1688	7622300807399	t	12	\N	t	1641	\N
1689	8005829466107	t	9	\N	t	1643	\N
1690	7622300862282	t	9	\N	t	1644	\N
1691	7622300862367	t	9	\N	t	1645	\N
1692	7798094228976	t	9	\N	t	1646	\N
1693	7798094228969	t	9	\N	t	1647	\N
1694	7790040930407	t	9	\N	t	1648	\N
1695	7730116460117	t	9	\N	t	1649	\N
1696	78939394	t	9	\N	t	1650	\N
1697	78411326	t	9	\N	t	1651	\N
1698	78411470	t	9	\N	t	1652	\N
1699	78421059	t	9	\N	t	1653	\N
1700	31195768	t	9	\N	t	1654	\N
1717	7791293040059	t	4	\N	t	1681	\N
1718	7891000405703	t	4	\N	t	1682	\N
1719	6932773980583	t	4	\N	t	1683	\N
1721	78413771	t	4	\N	t	1684	\N
1722	78420274	t	4	\N	t	1685	\N
1723	30107014	t	4	\N	t	1686	\N
1724	7840010202475	t	4	\N	t	1687	\N
1725	7840010202499	t	4	\N	t	1688	\N
1726	8803663962317	t	4	\N	t	1689	\N
1727	8803663964578	t	4	\N	t	1690	\N
1728	8803663256987	t	4	\N	t	1691	\N
1729	7502221791659	t	4	\N	t	1692	\N
1730	7790520009494	t	4	\N	t	1693	\N
1731	7791293012063	t	4	\N	t	1694	\N
1732	7793100120282	t	4	\N	t	1695	\N
1733	7891024134702	t	4	\N	t	1696	\N
1734	7896492400670	t	4	\N	t	1697	\N
1735	7891962054490	t	4	\N	t	1698	\N
1736	7891962054506	t	4	\N	t	1699	\N
1737	00123	t	1	\N	t	1700	\N
1738	16406	t	1	\N	t	1701	\N
\.


--
-- Name: codigo_id_seq; Type: SEQUENCE SET; Schema: productos; Owner: franco
--

SELECT pg_catalog.setval('productos.codigo_id_seq', 1, false);


--
-- Data for Name: codigo_tipo_precio; Type: TABLE DATA; Schema: productos; Owner: franco
--

COPY productos.codigo_tipo_precio (id, codigo_id, tipo_precio_id, creado_en, usuario_id, id_central) FROM stdin;
\.


--
-- Name: codigo_tipo_precio_id_seq; Type: SEQUENCE SET; Schema: productos; Owner: franco
--

SELECT pg_catalog.setval('productos.codigo_tipo_precio_id_seq', 1, false);


--
-- Data for Name: costo_por_producto; Type: TABLE DATA; Schema: productos; Owner: franco
--

COPY productos.costo_por_producto (id, producto_id, sucursal_id, ultimo_precio_compra, ultimo_precio_venta, costo_medio, usuario_id, creado_en, existencia, movimiento_stock_id, moneda_id, cotizacion, id_central) FROM stdin;
7	79	\N	2666	4000	2666	1	2022-01-10 18:32:00.130881+00	\N	\N	1	1	\N
\.


--
-- Name: costos_por_sucursal_id_seq; Type: SEQUENCE SET; Schema: productos; Owner: franco
--

SELECT pg_catalog.setval('productos.costos_por_sucursal_id_seq', 1, false);


--
-- Data for Name: familia; Type: TABLE DATA; Schema: productos; Owner: franco
--

COPY productos.familia (id, descripcion, activo, usuario_id, creado_en, icono, nombre, posicion, id_central) FROM stdin;
1	Cervezas, gaseosas, lacteos, jugos, aguas, energizantes, vinos, espumantes, whiskys, vodkas, cachaÃ§as, licores.	t	1	2021-03-10 00:48:20+00	liquor	BEBIDAS	1	\N
6	PRODUCTOS QUE SON ELABORADOS A PARTIR DE INSUMOS U OTROS PRODUCTOS. EJEMPLO: UNA PIZZA.	t	\N	2021-12-28 18:23:17.103016+00	add_circle_outline	ELABORADOS	6	\N
7	CIGARRILLOS TRADICIONALES, ELECTRICOS, NARGUILE, ESCENCIAS, CARBON PARA NARGUILE.	t	\N	2021-12-28 18:23:17.103016+00	album	CIGARRILLOS	5	\N
2	PRODUCTOS DE LIMPIEZA, MEDICAMENTOS, ROPAS Y ACCESORIOS, ELECTRONICOS, FERRETERIA, CASA Y CAMPING.\n	t	\N	2021-12-28 18:23:17.103016+00	liquor	GENERAL	2	\N
5	ALGUNA DESCRIPCION LO QUE SEA COMESTIBLE TIPO PAN JAMON QUESO CARNICOS ERE EREA	t	\N	2021-12-28 18:23:17.103016+00	block	COMESTIBLES	3	\N
10	YERBAS - TÉ - ESPECIAS - CONDIMENTOS - REMEDIOS P/ MATE	t	4	2021-12-28 18:23:17.103016+00	block	COSUMIBLES	7	\N
\.


--
-- Name: familia_id_seq; Type: SEQUENCE SET; Schema: productos; Owner: franco
--

SELECT pg_catalog.setval('productos.familia_id_seq', 1, false);


--
-- Name: imagenes_id_seq; Type: SEQUENCE SET; Schema: productos; Owner: franco
--

SELECT pg_catalog.setval('productos.imagenes_id_seq', 1, false);


--
-- Data for Name: pdv_categoria; Type: TABLE DATA; Schema: productos; Owner: franco
--

COPY productos.pdv_categoria (id, descripcion, activo, usuario_id, creado_en, posicion, id_central) FROM stdin;
1	GENERAL	t	1	\N	\N	\N
2	CERVEZAS	t	1	\N	\N	\N
3	GASEOSAS	t	1	\N	\N	\N
\.


--
-- Name: pdv_categoria_id_seq; Type: SEQUENCE SET; Schema: productos; Owner: franco
--

SELECT pg_catalog.setval('productos.pdv_categoria_id_seq', 1, false);


--
-- Data for Name: pdv_grupo; Type: TABLE DATA; Schema: productos; Owner: franco
--

COPY productos.pdv_grupo (id, descripcion, activo, usuario_id, creado_en, categoria_id, id_central) FROM stdin;
38	BUDWEISER	t	1	2021-10-07 00:55:18.733732+00	1	\N
7	BRAHMA	t	1	2021-10-07 00:55:18.733732+00	1	\N
39	MILLER	t	1	2021-10-07 00:55:18.733732+00	1	\N
40	CONTI	t	1	2021-10-07 00:55:18.733732+00	1	\N
41	SKOL	t	1	2021-10-07 00:55:18.733732+00	1	\N
42	HEINEKEN	t	1	2021-10-07 00:55:18.733732+00	1	\N
43	CORONA	t	1	2021-10-07 00:55:18.733732+00	1	\N
44	ANTARTICA	t	1	2021-10-07 00:55:18.733732+00	1	\N
45	MUNICH	t	1	2021-10-07 00:55:18.733732+00	1	\N
\.


--
-- Name: pdv_grupo_id_seq; Type: SEQUENCE SET; Schema: productos; Owner: franco
--

SELECT pg_catalog.setval('productos.pdv_grupo_id_seq', 1, false);


--
-- Data for Name: pdv_grupos_productos; Type: TABLE DATA; Schema: productos; Owner: franco
--

COPY productos.pdv_grupos_productos (id, producto_id, grupo_id, activo, usuario_id, creado_en, id_central) FROM stdin;
12	12	7	t	\N	2022-01-25 16:51:01	\N
13	11	7	t	\N	2022-01-25 16:51:01	\N
14	153	7	t	\N	2022-01-25 16:51:01	\N
15	7	7	t	\N	2022-01-25 16:51:01	\N
16	9	7	t	\N	2022-01-25 16:51:01	\N
17	52	38	t	\N	2022-01-25 16:51:01	\N
18	53	38	t	\N	2022-01-25 16:51:01	\N
19	54	38	t	\N	2022-01-25 16:51:01	\N
20	63	38	t	\N	2022-01-25 16:51:01	\N
21	799	38	t	\N	2022-01-25 16:51:01	\N
22	70	42	t	\N	2022-01-25 16:51:01	\N
24	83	42	t	\N	2022-01-25 16:51:01	\N
25	205	42	t	\N	2022-01-25 16:51:01	\N
26	204	42	t	\N	2022-01-25 16:51:01	\N
27	87	42	t	\N	2022-01-25 16:51:01	\N
23	79	42	t	\N	2022-01-25 16:51:01	\N
28	90	39	t	\N	2022-01-26 15:16:50	\N
29	89	39	t	\N	2022-01-26 15:16:50	\N
30	797	7	t	\N	2022-01-26 15:16:50	\N
31	798	7	t	\N	2022-01-26 15:16:50	\N
32	207	39	t	\N	2022-01-26 15:16:50	\N
33	130	39	t	\N	2022-01-26 15:16:50	\N
34	91	39	t	\N	2022-01-26 15:16:50	\N
35	119	39	t	\N	2022-01-26 15:16:50	\N
36	120	39	t	\N	2022-01-26 15:16:50	\N
37	704	38	t	\N	2022-01-26 15:16:50	\N
38	57	38	t	\N	2022-01-26 15:16:50	\N
39	17	7	t	\N	2022-01-26 15:16:50	\N
40	21	7	t	\N	2022-01-26 15:16:50	\N
41	14	7	t	\N	2022-01-26 15:16:50	\N
42	226	40	t	\N	2022-01-26 15:16:50	\N
43	227	40	t	\N	2022-01-26 15:16:50	\N
44	228	40	t	\N	2022-01-26 15:16:50	\N
45	229	40	t	\N	2022-01-26 15:16:50	\N
46	230	40	t	\N	2022-01-26 15:16:50	\N
47	28	41	t	\N	2022-01-26 15:16:50	\N
48	225	41	t	\N	2022-01-26 15:16:50	\N
49	5	41	t	\N	2022-01-26 15:16:50	\N
50	29	41	t	\N	2022-01-26 15:16:50	\N
51	30	41	t	\N	2022-01-26 15:16:50	\N
52	32	43	t	\N	2022-01-26 15:16:50	\N
53	34	43	t	\N	2022-01-26 15:16:50	\N
\.


--
-- Name: pdv_grupos_productos_id_seq; Type: SEQUENCE SET; Schema: productos; Owner: franco
--

SELECT pg_catalog.setval('productos.pdv_grupos_productos_id_seq', 1, false);


--
-- Data for Name: precio_por_sucursal; Type: TABLE DATA; Schema: productos; Owner: franco
--

COPY productos.precio_por_sucursal (id, sucursal_id, precio, usuario_id, creado_en, presentacion_id, tipo_precio_id, principal, activo, id_central) FROM stdin;
422	1	2000	4	2021-12-28 18:46:38.398145+00	137	1	t	t	\N
313	1	5000	1	2021-12-28 18:46:38.398145+00	31	1	t	t	\N
314	1	50000	1	2021-12-28 18:46:38.398145+00	32	2	t	t	\N
315	1	4500	1	2021-12-28 18:46:38.398145+00	31	4	f	t	\N
316	1	5000	1	2021-12-28 18:46:38.398145+00	34	1	t	t	\N
350	1	13000	4	2021-12-28 18:46:38.398145+00	72	1	t	t	\N
351	1	145000	4	2021-12-28 18:46:38.398145+00	73	2	t	t	\N
352	1	6000	4	2021-12-28 18:46:38.398145+00	78	1	t	t	\N
356	1	7000	4	2021-12-28 18:46:38.398145+00	83	1	t	t	\N
366	1	23000	3	2021-12-28 18:46:38.398145+00	68	1	t	t	\N
370	1	45000	3	2021-12-28 18:46:38.398145+00	88	1	t	t	\N
372	1	240000	3	2021-12-28 18:46:38.398145+00	89	3	t	t	\N
373	1	22000	3	2021-12-28 18:46:38.398145+00	91	1	t	t	\N
374	1	250000	3	2021-12-28 18:46:38.398145+00	92	3	t	t	\N
375	1	25000	3	2021-12-28 18:46:38.398145+00	93	1	t	t	\N
376	1	25000	3	2021-12-28 18:46:38.398145+00	94	1	t	t	\N
377	1	25000	3	2021-12-28 18:46:38.398145+00	95	1	t	t	\N
378	1	24000	3	2021-12-28 18:46:38.398145+00	98	1	t	t	\N
379	1	140000	2	2021-12-28 18:46:38.398145+00	73	3	f	t	\N
380	1	5000	4	2021-12-28 18:46:38.398145+00	99	1	t	t	\N
385	1	250000	2	2021-12-28 18:46:38.398145+00	33	2	t	t	\N
391	1	2500	4	2021-12-28 18:46:38.398145+00	107	1	t	t	\N
392	1	60000	4	2021-12-28 18:46:38.398145+00	108	2	t	t	\N
395	1	95000	4	2021-12-28 18:46:38.398145+00	112	2	t	t	\N
397	1	5000	4	2021-12-28 18:46:38.398145+00	113	1	t	t	\N
398	1	28000	4	2021-12-28 18:46:38.398145+00	116	2	t	t	\N
399	1	112000	4	2021-12-28 18:46:38.398145+00	117	2	t	t	\N
407	1	4000	4	2021-12-28 18:46:38.398145+00	82	1	t	t	\N
408	1	48000	4	2021-12-28 18:46:38.398145+00	127	2	t	t	\N
411	1	48000	3	2021-12-28 18:46:38.398145+00	128	1	t	t	\N
412	1	23000	3	2021-12-28 18:46:38.398145+00	129	1	t	t	\N
414	1	60000	3	2021-12-28 18:46:38.398145+00	132	1	t	t	\N
416	1	7500	4	2021-12-28 18:46:38.398145+00	133	1	t	t	\N
417	1	88000	4	2021-12-28 18:46:38.398145+00	134	2	t	t	\N
418	1	86000	4	2021-12-28 18:46:38.398145+00	134	3	t	t	\N
423	1	24000	4	2021-12-28 18:46:38.398145+00	138	2	t	t	\N
425	1	3000	4	2021-12-28 18:46:38.398145+00	139	1	t	t	\N
427	1	30000	4	2021-12-28 18:46:38.398145+00	140	3	f	t	\N
428	1	12000	4	2021-12-28 18:46:38.398145+00	141	1	t	t	\N
429	1	170000	4	2021-12-28 18:46:38.398145+00	142	2	t	t	\N
430	1	168000	4	2021-12-28 18:46:38.398145+00	142	3	f	t	\N
431	1	45000	3	2021-12-28 18:46:38.398145+00	143	1	t	t	\N
432	1	240000	3	2021-12-28 18:46:38.398145+00	144	3	t	t	\N
433	1	23000	3	2021-12-28 18:46:38.398145+00	146	1	t	t	\N
436	1	48000	4	2021-12-28 18:46:38.398145+00	148	2	t	t	\N
435	1	8000	4	2021-12-28 18:46:38.398145+00	145	1	t	t	\N
437	1	192000	4	2021-12-28 18:46:38.398145+00	149	2	t	t	\N
438	1	4000	4	2021-12-28 18:46:38.398145+00	150	1	t	t	\N
439	1	20000	4	2021-12-28 18:46:38.398145+00	151	2	t	t	\N
440	1	19000	4	2021-12-28 18:46:38.398145+00	151	3	t	t	\N
441	1	80000	4	2021-12-28 18:46:38.398145+00	152	2	t	t	\N
393	1	3000	4	\N	109	1	t	t	\N
394	1	30000	4	\N	110	2	t	t	\N
354	1	35000	4	\N	79	2	t	t	\N
405	1	125000	4	\N	125	1	t	t	\N
355	1	140000	4	\N	81	2	t	t	\N
386	1	2500	4	\N	103	1	t	t	\N
406	1	245000	4	\N	126	2	t	t	\N
387	1	60000	4	\N	104	2	t	t	\N
381	1	55000	4	\N	100	2	t	t	\N
382	1	54000	4	\N	100	3	t	t	\N
426	1	30000	4	\N	140	2	t	t	\N
396	1	9000	4	\N	111	1	t	t	\N
409	1	3000	4	\N	70	2	t	t	\N
410	1	60000	4	\N	71	2	t	t	\N
413	1	7500	4	\N	130	1	t	t	\N
415	1	88000	4	\N	131	2	t	t	\N
434	1	260000	4	\N	147	3	t	t	\N
357	1	42000	4	\N	84	2	t	t	\N
358	1	40000	4	\N	84	3	t	t	\N
359	1	168000	4	\N	85	2	t	t	\N
360	1	160000	4	\N	85	3	t	t	\N
367	1	7500	4	\N	86	1	t	t	\N
368	1	42000	4	\N	87	2	t	t	\N
369	1	168000	4	\N	90	2	t	t	\N
419	1	2000	4	\N	135	1	t	t	\N
420	1	24000	4	\N	136	2	t	t	\N
388	0	7000	2	\N	105	1	t	t	\N
389	0	82000	2	\N	106	2	t	t	\N
390	0	80000	2	\N	106	3	t	t	\N
384	0	33000	2	\N	102	2	t	t	\N
421	1	24000	4	\N	136	3	t	t	\N
442	1	76000	4	2021-12-28 18:46:38.398145+00	152	3	t	t	\N
443	1	90000	3	2021-12-28 18:46:38.398145+00	156	1	t	t	\N
444	1	5000	4	2021-12-28 18:46:38.398145+00	153	1	t	t	\N
447	1	5000	4	2021-12-28 18:46:38.398145+00	157	1	t	t	\N
449	1	13000	4	2021-12-28 18:46:38.398145+00	159	1	t	t	\N
451	1	7500	4	2021-12-28 18:46:38.398145+00	162	\N	f	t	\N
452	1	7500	4	2021-12-28 18:46:38.398145+00	162	\N	t	t	\N
453	1	45000	4	2021-12-28 18:46:38.398145+00	175	2	t	t	\N
454	1	44000	4	2021-12-28 18:46:38.398145+00	175	3	t	t	\N
455	1	180000	4	2021-12-28 18:46:38.398145+00	176	2	t	t	\N
456	1	176000	4	2021-12-28 18:46:38.398145+00	176	3	t	t	\N
457	1	2500	4	2021-12-28 18:46:38.398145+00	177	1	t	t	\N
458	1	26000	4	2021-12-28 18:46:38.398145+00	178	2	t	t	\N
459	1	2000	4	2021-12-28 18:46:38.398145+00	179	1	t	t	\N
462	1	1500	4	2021-12-28 18:46:38.398145+00	183	1	t	t	\N
463	1	15000	4	2021-12-28 18:46:38.398145+00	182	2	t	t	\N
466	1	7000	4	2021-12-28 18:46:38.398145+00	186	1	t	t	\N
467	1	38000	4	2021-12-28 18:46:38.398145+00	187	2	t	t	\N
468	1	152000	4	2021-12-28 18:46:38.398145+00	188	2	t	t	\N
474	1	5000	4	2021-12-28 18:46:38.398145+00	192	1	t	t	\N
475	1	55000	4	2021-12-28 18:46:38.398145+00	193	2	t	t	\N
476	1	53000	4	2021-12-28 18:46:38.398145+00	193	3	t	t	\N
477	1	7000	4	2021-12-28 18:46:38.398145+00	194	1	t	t	\N
478	1	37000	4	2021-12-28 18:46:38.398145+00	195	2	t	t	\N
479	1	34000	4	2021-12-28 18:46:38.398145+00	195	3	t	t	\N
480	1	148000	4	2021-12-28 18:46:38.398145+00	196	2	t	t	\N
481	1	136000	4	2021-12-28 18:46:38.398145+00	196	3	t	t	\N
482	1	10000	4	2021-12-28 18:46:38.398145+00	197	1	t	t	\N
483	1	120000	4	2021-12-28 18:46:38.398145+00	198	2	t	t	\N
484	1	112000	4	2021-12-28 18:46:38.398145+00	198	3	t	t	\N
488	1	7500	4	2021-12-28 18:46:38.398145+00	202	\N	t	t	\N
493	1	88000	4	2021-12-28 18:46:38.398145+00	203	2	t	t	\N
494	1	86000	4	2021-12-28 18:46:38.398145+00	203	3	t	t	\N
495	1	4000	4	2021-12-28 18:46:38.398145+00	204	1	t	t	\N
496	1	50000	4	2021-12-28 18:46:38.398145+00	205	2	t	t	\N
500	1	5000	4	2021-12-28 18:46:38.398145+00	209	2	t	t	\N
501	1	28000	4	2021-12-28 18:46:38.398145+00	210	2	t	t	\N
502	1	26500	4	2021-12-28 18:46:38.398145+00	210	3	t	t	\N
503	1	112000	4	2021-12-28 18:46:38.398145+00	211	2	t	t	\N
504	1	106000	4	2021-12-28 18:46:38.398145+00	211	3	t	t	\N
505	1	4000	4	2021-12-28 18:46:38.398145+00	213	1	t	t	\N
506	1	48000	4	2021-12-28 18:46:38.398145+00	214	2	t	t	\N
507	1	6000	4	2021-12-28 18:46:38.398145+00	215	1	t	t	\N
508	1	140000	4	2021-12-28 18:46:38.398145+00	216	2	t	t	\N
509	1	3000	4	2021-12-28 18:46:38.398145+00	217	1	t	t	\N
510	1	17000	4	2021-12-28 18:46:38.398145+00	218	2	t	t	\N
511	1	68000	4	2021-12-28 18:46:38.398145+00	219	2	t	t	\N
512	1	30000	4	2021-12-28 18:46:38.398145+00	221	2	t	t	\N
513	1	3000	4	2021-12-28 18:46:38.398145+00	220	1	t	t	\N
514	1	3000	4	2021-12-28 18:46:38.398145+00	222	1	t	t	\N
515	1	33000	4	2021-12-28 18:46:38.398145+00	223	2	t	t	\N
516	1	3500	4	2021-12-28 18:46:38.398145+00	224	1	t	t	\N
520	1	5000	4	2021-12-28 18:46:38.398145+00	226	1	t	t	\N
521	1	115000	4	2021-12-28 18:46:38.398145+00	227	2	t	t	\N
522	1	2500	4	2021-12-28 18:46:38.398145+00	228	1	t	t	\N
524	1	6000	4	2021-12-28 18:46:38.398145+00	230	1	t	t	\N
525	1	130000	4	2021-12-28 18:46:38.398145+00	231	2	t	t	\N
526	1	125000	4	2021-12-28 18:46:38.398145+00	231	3	t	t	\N
527	1	7000	4	2021-12-28 18:46:38.398145+00	232	1	t	t	\N
528	1	40000	4	2021-12-28 18:46:38.398145+00	233	2	t	t	\N
529	1	160000	4	2021-12-28 18:46:38.398145+00	234	2	t	t	\N
530	1	10000	4	2021-12-28 18:46:38.398145+00	235	1	t	t	\N
531	1	60000	4	2021-12-28 18:46:38.398145+00	236	2	t	t	\N
532	1	4000	4	2021-12-28 18:46:38.398145+00	238	1	t	t	\N
533	1	46000	4	2021-12-28 18:46:38.398145+00	239	2	t	t	\N
461	1	24000	4	\N	180	3	t	t	\N
448	1	55000	4	\N	158	2	t	t	\N
445	1	30000	4	\N	154	2	t	t	\N
446	1	120000	4	\N	155	2	t	t	\N
464	1	8000	4	\N	184	1	t	t	\N
465	1	96000	4	\N	185	2	t	t	\N
517	1	40000	4	\N	225	2	t	t	\N
518	1	40000	4	\N	225	3	t	t	\N
497	1	6000	4	\N	206	1	t	t	\N
498	1	35000	4	\N	207	2	t	t	\N
469	0	5000	4	\N	189	1	t	t	\N
470	0	26000	4	\N	190	2	t	t	\N
471	0	25000	4	\N	190	3	t	t	\N
472	0	104000	4	\N	191	2	t	t	\N
473	0	100000	4	\N	191	3	t	t	\N
499	1	140000	4	\N	208	2	t	t	\N
534	1	3500	4	\N	240	1	t	t	\N
450	1	175000	4	\N	160	2	t	t	\N
485	1	4000	4	\N	199	1	t	t	\N
486	1	20000	4	\N	200	2	t	t	\N
523	1	30000	4	\N	229	2	t	t	\N
487	1	80000	4	\N	201	2	t	t	\N
536	1	6500	4	2021-12-28 18:46:38.398145+00	242	\N	t	t	\N
541	1	4000	4	2021-12-28 18:46:38.398145+00	246	1	t	t	\N
542	1	48000	4	2021-12-28 18:46:38.398145+00	247	2	t	t	\N
543	1	45000	4	2021-12-28 18:46:38.398145+00	247	3	t	t	\N
544	1	4000	4	2021-12-28 18:46:38.398145+00	248	1	t	t	\N
545	1	38000	4	2021-12-28 18:46:38.398145+00	249	2	t	t	\N
546	1	36000	4	2021-12-28 18:46:38.398145+00	249	3	t	t	\N
547	1	6000	4	2021-12-28 18:46:38.398145+00	250	1	t	t	\N
548	1	72000	4	2021-12-28 18:46:38.398145+00	251	2	t	t	\N
549	1	70000	4	2021-12-28 18:46:38.398145+00	251	3	t	t	\N
550	1	4000	4	2021-12-28 18:46:38.398145+00	252	1	t	t	\N
558	1	5000	4	2021-12-28 18:46:38.398145+00	259	1	t	t	\N
561	1	5000	4	2021-12-28 18:46:38.398145+00	261	1	t	t	\N
564	1	6000	4	2021-12-28 18:46:38.398145+00	263	1	t	t	\N
568	1	3000	4	2021-12-28 18:46:38.398145+00	267	1	t	t	\N
569	1	33000	4	2021-12-28 18:46:38.398145+00	268	2	t	t	\N
570	1	32000	4	2021-12-28 18:46:38.398145+00	268	3	f	t	\N
572	1	24000	4	2021-12-28 18:46:38.398145+00	270	2	t	t	\N
573	1	10000	4	2021-12-28 18:46:38.398145+00	341	1	t	t	\N
574	1	56000	4	2021-12-28 18:46:38.398145+00	342	2	t	t	\N
575	1	52000	4	2021-12-28 18:46:38.398145+00	342	3	f	t	\N
576	1	10000	4	2021-12-28 18:46:38.398145+00	343	1	t	t	\N
577	1	58000	4	2021-12-28 18:46:38.398145+00	344	2	t	t	\N
579	1	7000	4	2021-12-28 18:46:38.398145+00	345	1	t	t	\N
580	1	42000	4	2021-12-28 18:46:38.398145+00	346	2	t	t	\N
581	1	6000	4	2021-12-28 18:46:38.398145+00	347	1	t	t	\N
582	1	60000	4	2021-12-28 18:46:38.398145+00	348	2	t	t	\N
583	1	8000	4	2021-12-28 18:46:38.398145+00	349	1	t	t	\N
584	1	32000	4	2021-12-28 18:46:38.398145+00	350	2	t	t	\N
585	1	5000	4	2021-12-28 18:46:38.398145+00	351	1	t	t	\N
586	1	30000	4	2021-12-28 18:46:38.398145+00	352	2	t	t	\N
587	1	27000	4	2021-12-28 18:46:38.398145+00	352	3	f	t	\N
588	1	120000	4	2021-12-28 18:46:38.398145+00	353	2	t	t	\N
589	1	108000	4	2021-12-28 18:46:38.398145+00	353	3	f	t	\N
590	1	5000	4	2021-12-28 18:46:38.398145+00	354	1	t	t	\N
591	1	30000	4	2021-12-28 18:46:38.398145+00	355	2	t	t	\N
592	1	27000	4	2021-12-28 18:46:38.398145+00	355	3	f	t	\N
593	1	120000	4	2021-12-28 18:46:38.398145+00	356	2	t	t	\N
594	1	108000	4	2021-12-28 18:46:38.398145+00	356	3	f	t	\N
595	1	5000	4	2021-12-28 18:46:38.398145+00	357	1	t	t	\N
596	1	30000	4	2021-12-28 18:46:38.398145+00	358	2	t	t	\N
597	1	27000	4	2021-12-28 18:46:38.398145+00	358	3	f	t	\N
598	1	120000	4	2021-12-28 18:46:38.398145+00	359	2	t	t	\N
599	1	108000	4	2021-12-28 18:46:38.398145+00	359	3	f	t	\N
600	1	5000	4	2021-12-28 18:46:38.398145+00	363	1	t	t	\N
601	1	120000	4	2021-12-28 18:46:38.398145+00	362	2	t	t	\N
602	1	108000	4	2021-12-28 18:46:38.398145+00	362	3	f	t	\N
603	1	30000	4	2021-12-28 18:46:38.398145+00	361	2	t	t	\N
604	1	27000	4	2021-12-28 18:46:38.398145+00	361	3	f	t	\N
605	1	5000	4	2021-12-28 18:46:38.398145+00	364	1	t	t	\N
606	1	30000	4	2021-12-28 18:46:38.398145+00	365	2	t	t	\N
607	1	27000	4	2021-12-28 18:46:38.398145+00	365	3	f	t	\N
608	1	120000	4	2021-12-28 18:46:38.398145+00	366	2	t	t	\N
609	1	108000	4	2021-12-28 18:46:38.398145+00	366	3	f	t	\N
613	1	10000	4	2021-12-28 18:46:38.398145+00	370	1	t	t	\N
616	1	20000	4	2021-12-28 18:46:38.398145+00	372	1	t	t	\N
617	1	200000	4	2021-12-28 18:46:38.398145+00	373	2	t	t	\N
618	1	12000	4	2021-12-28 18:46:38.398145+00	374	1	t	t	\N
619	1	48000	4	2021-12-28 18:46:38.398145+00	375	2	t	t	\N
620	1	260000	4	2021-12-28 18:46:38.398145+00	376	2	t	t	\N
621	1	12000	4	2021-12-28 18:46:38.398145+00	377	1	t	t	\N
622	1	48000	4	2021-12-28 18:46:38.398145+00	378	2	t	t	\N
623	1	260000	4	2021-12-28 18:46:38.398145+00	379	2	t	t	\N
551	1	40000	4	\N	253	2	t	t	\N
565	1	70000	4	\N	264	2	t	t	\N
552	1	4500	4	\N	254	1	t	t	\N
553	1	25000	4	\N	255	2	t	t	\N
554	1	50000	4	\N	256	2	t	t	\N
539	1	3000	4	\N	244	1	t	t	\N
540	1	35000	4	\N	245	2	t	t	\N
537	1	96000	4	\N	243	2	t	t	\N
538	1	92000	4	\N	243	3	t	t	\N
535	1	80000	4	\N	241	2	t	t	\N
555	1	7500	4	\N	257	1	t	t	\N
556	1	45000	4	\N	258	2	t	t	\N
557	1	45000	4	\N	258	3	t	t	\N
559	1	50000	4	\N	260	2	t	t	\N
566	1	3000	4	\N	265	1	t	t	\N
560	1	50000	4	\N	260	3	t	t	\N
562	1	50000	4	\N	262	2	t	t	\N
563	1	50000	4	\N	262	3	t	t	\N
612	1	160000	4	\N	369	2	t	t	\N
614	1	225000	4	\N	371	2	t	t	\N
615	1	220000	4	\N	371	3	f	t	\N
611	1	40000	7	\N	368	2	t	t	\N
567	1	36000	4	\N	266	2	t	t	\N
624	1	12000	4	2021-12-28 18:46:38.398145+00	380	1	t	t	\N
625	1	48000	4	2021-12-28 18:46:38.398145+00	381	2	t	t	\N
626	1	260000	4	2021-12-28 18:46:38.398145+00	382	2	t	t	\N
627	1	12000	4	2021-12-28 18:46:38.398145+00	383	1	t	t	\N
628	1	48000	4	2021-12-28 18:46:38.398145+00	384	2	t	t	\N
629	1	260000	4	2021-12-28 18:46:38.398145+00	385	2	t	t	\N
630	1	7000	4	2021-12-28 18:46:38.398145+00	386	1	t	t	\N
631	1	40000	4	2021-12-28 18:46:38.398145+00	387	2	t	t	\N
632	1	7500	4	2021-12-28 18:46:38.398145+00	388	1	t	t	\N
633	1	75000	4	2021-12-28 18:46:38.398145+00	389	2	t	t	\N
634	1	4000	4	2021-12-28 18:46:38.398145+00	390	1	t	t	\N
635	1	87000	4	2021-12-28 18:46:38.398145+00	391	2	t	t	\N
636	1	33000	4	2021-12-28 18:46:38.398145+00	392	1	t	t	\N
637	1	20000	4	2021-12-28 18:46:38.398145+00	393	1	t	t	\N
638	1	11000	4	2021-12-28 18:46:38.398145+00	394	1	t	t	\N
639	1	58000	4	2021-12-28 18:46:38.398145+00	395	2	t	t	\N
640	1	54000	4	2021-12-28 18:46:38.398145+00	395	3	f	t	\N
641	1	15000	4	2021-12-28 18:46:38.398145+00	396	1	t	t	\N
642	1	82000	4	2021-12-28 18:46:38.398145+00	397	2	t	t	\N
643	1	25000	4	2021-12-28 18:46:38.398145+00	398	1	t	t	\N
644	1	40000	4	2021-12-28 18:46:38.398145+00	400	1	t	t	\N
645	1	25000	4	2021-12-28 18:46:38.398145+00	399	1	t	t	\N
646	1	30000	4	2021-12-28 18:46:38.398145+00	401	1	t	t	\N
647	1	30000	4	2021-12-28 18:46:38.398145+00	402	1	t	t	\N
649	1	13000	4	2021-12-28 18:46:38.398145+00	403	1	t	t	\N
650	1	75000	4	2021-12-28 18:46:38.398145+00	404	2	t	t	\N
651	1	6000	4	2021-12-28 18:46:38.398145+00	405	1	t	t	\N
652	1	35000	4	2021-12-28 18:46:38.398145+00	406	2	t	t	\N
653	1	33000	4	2021-12-28 18:46:38.398145+00	406	3	f	t	\N
654	1	6000	4	2021-12-28 18:46:38.398145+00	407	1	t	t	\N
655	1	36000	4	2021-12-28 18:46:38.398145+00	408	2	t	t	\N
656	1	33000	4	2021-12-28 18:46:38.398145+00	408	3	f	t	\N
657	1	20000	4	2021-12-28 18:46:38.398145+00	409	1	t	t	\N
658	1	5000	4	2021-12-28 18:46:38.398145+00	410	1	t	t	\N
659	1	5000	4	2021-12-28 18:46:38.398145+00	411	1	t	t	\N
667	1	11000	4	2021-12-28 18:46:38.398145+00	413	1	t	t	\N
668	1	500	4	2021-12-28 18:46:38.398145+00	414	1	t	t	\N
669	1	18000	4	2021-12-28 18:46:38.398145+00	415	1	t	t	\N
670	1	1000	4	2021-12-28 18:46:38.398145+00	416	1	t	t	\N
671	1	10000	4	2021-12-28 18:46:38.398145+00	417	1	t	t	\N
672	1	2000	4	2021-12-28 18:46:38.398145+00	418	1	t	t	\N
673	1	37000	4	2021-12-28 18:46:38.398145+00	419	1	t	t	\N
674	1	2000	4	2021-12-28 18:46:38.398145+00	420	1	t	t	\N
675	1	19000	4	2021-12-28 18:46:38.398145+00	421	1	t	t	\N
676	1	3000	4	2021-12-28 18:46:38.398145+00	422	1	t	t	\N
677	1	10000	4	2021-12-28 18:46:38.398145+00	423	1	t	t	\N
678	1	4000	4	2021-12-28 18:46:38.398145+00	424	1	t	t	\N
679	1	10000	4	2021-12-28 18:46:38.398145+00	425	1	t	t	\N
682	1	4000	4	2021-12-28 18:46:38.398145+00	428	1	t	t	\N
683	1	13000	4	2021-12-28 18:46:38.398145+00	429	1	t	t	\N
684	1	12000	4	2021-12-28 18:46:38.398145+00	430	1	t	t	\N
701	1	18500	4	2021-12-28 18:46:38.398145+00	447	2	t	t	\N
685	1	11000	4	2021-12-28 18:46:38.398145+00	431	1	t	t	\N
687	1	6500	4	2021-12-28 18:46:38.398145+00	433	1	t	t	\N
688	1	7000	4	2021-12-28 18:46:38.398145+00	434	1	t	t	\N
689	1	8000	4	2021-12-28 18:46:38.398145+00	435	1	t	t	\N
690	1	2000	4	2021-12-28 18:46:38.398145+00	436	1	t	t	\N
691	1	22000	4	2021-12-28 18:46:38.398145+00	437	1	t	t	\N
692	1	2000	4	2021-12-28 18:46:38.398145+00	438	1	t	t	\N
693	1	20000	4	2021-12-28 18:46:38.398145+00	439	1	t	t	\N
694	1	13000	4	2021-12-28 18:46:38.398145+00	440	1	t	t	\N
695	1	10000	4	2021-12-28 18:46:38.398145+00	441	1	t	t	\N
696	1	100000	4	2021-12-28 18:46:38.398145+00	442	1	t	t	\N
697	1	10000	4	2021-12-28 18:46:38.398145+00	443	1	t	t	\N
698	1	100000	4	2021-12-28 18:46:38.398145+00	444	1	t	t	\N
699	1	2000	4	2021-12-28 18:46:38.398145+00	445	1	t	t	\N
700	1	3500	4	2021-12-28 18:46:38.398145+00	446	1	t	t	\N
702	1	18500	4	2021-12-28 18:46:38.398145+00	449	2	t	t	\N
703	1	3500	4	2021-12-28 18:46:38.398145+00	448	1	t	t	\N
704	1	6000	4	2021-12-28 18:46:38.398145+00	450	1	t	t	\N
706	1	2000	4	2021-12-28 18:46:38.398145+00	452	1	t	t	\N
707	1	2000	4	2021-12-28 18:46:38.398145+00	453	1	t	t	\N
708	1	2000	4	2021-12-28 18:46:38.398145+00	454	1	t	t	\N
709	1	11000	4	2021-12-28 18:46:38.398145+00	455	1	t	t	\N
711	1	3000	4	2021-12-28 18:46:38.398145+00	456	1	t	t	\N
712	1	4000	4	2021-12-28 18:46:38.398145+00	457	1	t	t	\N
713	1	17000	4	2021-12-28 18:46:38.398145+00	458	1	t	t	\N
714	1	5000	4	2021-12-28 18:46:38.398145+00	459	1	t	t	\N
715	1	1000	4	2021-12-28 18:46:38.398145+00	460	1	t	t	\N
717	1	27000	4	2021-12-28 18:46:38.398145+00	461	1	f	t	\N
718	1	8000	4	2021-12-28 18:46:38.398145+00	462	1	t	t	\N
719	1	5000	4	2021-12-28 18:46:38.398145+00	463	1	t	t	\N
720	1	10000	4	2021-12-28 18:46:38.398145+00	464	1	t	t	\N
681	1	12000	4	\N	427	1	t	t	\N
686	1	10000	4	\N	432	1	t	t	\N
680	1	12000	4	\N	426	1	t	t	\N
721	1	38000	4	2021-12-28 18:46:38.398145+00	465	1	t	t	\N
722	1	10000	4	2021-12-28 18:46:38.398145+00	466	1	t	t	\N
723	1	38000	4	2021-12-28 18:46:38.398145+00	467	1	t	t	\N
726	1	13000	4	2021-12-28 18:46:38.398145+00	471	1	t	t	\N
727	1	2000	4	2021-12-28 18:46:38.398145+00	470	1	t	t	\N
728	1	6000	4	2021-12-28 18:46:38.398145+00	472	1	t	t	\N
729	1	6000	4	2021-12-28 18:46:38.398145+00	473	1	t	t	\N
730	1	6000	4	2021-12-28 18:46:38.398145+00	474	1	t	t	\N
731	1	18000	4	2021-12-28 18:46:38.398145+00	475	1	t	t	\N
732	1	5000	3	2021-12-28 18:46:38.398145+00	476	1	t	t	\N
733	1	26000	3	2021-12-28 18:46:38.398145+00	477	2	t	t	\N
734	1	18000	4	2021-12-28 18:46:38.398145+00	478	1	t	t	\N
735	1	25000	3	2021-12-28 18:46:38.398145+00	477	3	f	t	\N
736	1	18000	4	2021-12-28 18:46:38.398145+00	479	1	t	t	\N
737	1	5000	3	2021-12-28 18:46:38.398145+00	480	1	t	t	\N
738	1	26000	3	2021-12-28 18:46:38.398145+00	481	2	t	t	\N
739	1	25000	3	2021-12-28 18:46:38.398145+00	481	3	f	t	\N
740	1	8000	3	2021-12-28 18:46:38.398145+00	482	1	t	t	\N
741	1	90000	3	2021-12-28 18:46:38.398145+00	483	3	f	t	\N
742	1	18000	4	2021-12-28 18:46:38.398145+00	484	1	t	t	\N
743	1	13000	3	2021-12-28 18:46:38.398145+00	485	1	t	t	\N
744	1	3000	4	2021-12-28 18:46:38.398145+00	486	1	t	t	\N
745	1	15000	4	2021-12-28 18:46:38.398145+00	487	2	t	t	\N
746	1	14000	4	2021-12-28 18:46:38.398145+00	487	3	f	t	\N
747	1	12000	3	2021-12-28 18:46:38.398145+00	488	1	t	t	\N
748	1	110000	3	2021-12-28 18:46:38.398145+00	489	3	t	t	\N
749	1	15000	3	2021-12-28 18:46:38.398145+00	490	1	t	t	\N
750	1	85000	3	2021-12-28 18:46:38.398145+00	491	3	t	t	\N
751	1	6000	3	2021-12-28 18:46:38.398145+00	492	1	t	t	\N
752	1	62000	3	2021-12-28 18:46:38.398145+00	493	3	t	t	\N
753	1	10000	3	2021-12-28 18:46:38.398145+00	494	1	t	t	\N
754	1	12000	3	2021-12-28 18:46:38.398145+00	495	1	t	t	\N
755	1	18000	4	2021-12-28 18:46:38.398145+00	496	1	t	t	\N
756	1	10000	3	2021-12-28 18:46:38.398145+00	497	1	t	t	\N
757	1	9000	3	2021-12-28 18:46:38.398145+00	498	1	t	t	\N
758	1	12000	3	2021-12-28 18:46:38.398145+00	499	1	t	t	\N
759	1	10000	3	2021-12-28 18:46:38.398145+00	500	1	t	t	\N
760	1	9000	3	2021-12-28 18:46:38.398145+00	501	1	t	t	\N
762	1	10000	4	2021-12-28 18:46:38.398145+00	502	1	t	t	\N
763	1	7000	4	2021-12-28 18:46:38.398145+00	503	1	t	t	\N
764	1	5000	3	2021-12-28 18:46:38.398145+00	504	1	t	t	\N
765	1	8000	3	2021-12-28 18:46:38.398145+00	505	1	t	t	\N
766	1	6000	3	2021-12-28 18:46:38.398145+00	506	1	t	t	\N
767	1	156000	3	2021-12-28 18:46:38.398145+00	508	3	t	t	\N
768	1	16000	3	2021-12-28 18:46:38.398145+00	507	1	t	t	\N
769	1	7000	3	2021-12-28 18:46:38.398145+00	509	1	t	t	\N
770	1	7500	4	2021-12-28 18:46:38.398145+00	510	1	t	t	\N
771	1	5000	4	2021-12-28 18:46:38.398145+00	511	1	t	t	\N
772	1	6000	4	2021-12-28 18:46:38.398145+00	512	1	t	t	\N
773	1	9000	4	2021-12-28 18:46:38.398145+00	513	1	t	t	\N
774	1	12000	4	2021-12-28 18:46:38.398145+00	514	1	t	t	\N
775	1	10000	4	2021-12-28 18:46:38.398145+00	516	1	t	t	\N
776	1	8000	3	2021-12-28 18:46:38.398145+00	515	1	t	t	\N
777	1	8000	3	2021-12-28 18:46:38.398145+00	517	1	t	t	\N
778	1	12000	3	2021-12-28 18:46:38.398145+00	518	1	t	t	\N
779	1	4000	4	2021-12-28 18:46:38.398145+00	519	1	t	t	\N
780	1	7000	3	2021-12-28 18:46:38.398145+00	520	1	t	t	\N
781	1	5000	4	2021-12-28 18:46:38.398145+00	521	1	t	t	\N
782	1	10000	3	2021-12-28 18:46:38.398145+00	522	1	t	t	\N
783	1	12000	3	2021-12-28 18:46:38.398145+00	523	1	t	t	\N
784	1	5000	3	2021-12-28 18:46:38.398145+00	524	1	t	t	\N
786	1	8000	3	2021-12-28 18:46:38.398145+00	525	1	t	t	\N
788	1	9000	3	2021-12-28 18:46:38.398145+00	528	1	t	t	\N
789	1	5000	4	2021-12-28 18:46:38.398145+00	529	1	t	t	\N
790	1	12000	3	2021-12-28 18:46:38.398145+00	530	1	t	t	\N
791	1	3000	4	2021-12-28 18:46:38.398145+00	531	1	t	t	\N
792	1	9000	3	2021-12-28 18:46:38.398145+00	532	1	t	t	\N
793	1	5000	3	2021-12-28 18:46:38.398145+00	533	1	t	t	\N
794	1	3000	4	2021-12-28 18:46:38.398145+00	535	1	t	t	\N
795	1	4000	4	2021-12-28 18:46:38.398145+00	536	1	t	t	\N
796	1	5500	4	2021-12-28 18:46:38.398145+00	537	1	t	t	\N
797	1	320000	3	2021-12-28 18:46:38.398145+00	538	1	t	t	\N
798	1	68000	3	2021-12-28 18:46:38.398145+00	539	1	t	t	\N
799	1	38000	3	2021-12-28 18:46:38.398145+00	540	1	t	t	\N
800	1	3500	4	2021-12-28 18:46:38.398145+00	541	1	t	t	\N
801	1	5500	4	2021-12-28 18:46:38.398145+00	542	1	t	t	\N
803	1	5000	4	2021-12-28 18:46:38.398145+00	544	1	t	t	\N
804	1	48000	3	2021-12-28 18:46:38.398145+00	545	1	t	t	\N
805	1	3000	4	2021-12-28 18:46:38.398145+00	546	1	t	t	\N
806	1	15000	3	2021-12-28 18:46:38.398145+00	547	1	t	t	\N
807	1	25000	3	2021-12-28 18:46:38.398145+00	548	1	t	t	\N
808	1	2000	4	2021-12-28 18:46:38.398145+00	549	1	t	t	\N
809	1	50000	3	2021-12-28 18:46:38.398145+00	550	1	t	t	\N
725	1	30000	4	\N	469	1	t	t	\N
787	1	13000	4	\N	527	1	t	t	\N
802	1	5500	4	\N	543	1	t	t	\N
785	1	4500	4	\N	526	1	t	t	\N
810	1	22000	3	2021-12-28 18:46:38.398145+00	551	1	t	t	\N
811	1	95000	3	2021-12-28 18:46:38.398145+00	552	1	t	t	\N
812	1	115000	3	2021-12-28 18:46:38.398145+00	553	1	t	t	\N
813	1	12000	3	2021-12-28 18:46:38.398145+00	554	1	t	t	\N
819	1	20000	4	2021-12-28 18:46:38.398145+00	555	1	t	t	\N
820	1	43000	3	2021-12-28 18:46:38.398145+00	556	1	t	t	\N
821	1	60000	3	2021-12-28 18:46:38.398145+00	557	1	t	t	\N
822	1	2000	4	2021-12-28 18:46:38.398145+00	558	1	t	t	\N
823	1	53000	3	2021-12-28 18:46:38.398145+00	559	1	t	t	\N
824	1	55000	3	2021-12-28 18:46:38.398145+00	560	1	t	t	\N
825	1	80000	3	2021-12-28 18:46:38.398145+00	561	1	t	t	\N
826	1	72000	3	2021-12-28 18:46:38.398145+00	562	1	t	t	\N
827	1	115000	3	2021-12-28 18:46:38.398145+00	563	1	t	t	\N
828	1	85000	3	2021-12-28 18:46:38.398145+00	564	1	t	t	\N
829	1	35000	3	2021-12-28 18:46:38.398145+00	565	1	t	t	\N
830	1	25000	3	2021-12-28 18:46:38.398145+00	566	1	t	t	\N
831	1	60000	4	2021-12-28 18:46:38.398145+00	567	1	t	t	\N
832	1	25000	3	2021-12-28 18:46:38.398145+00	568	1	t	t	\N
833	1	25000	3	2021-12-28 18:46:38.398145+00	569	1	t	t	\N
834	1	23000	4	2021-12-28 18:46:38.398145+00	570	1	t	t	\N
835	1	7000	3	2021-12-28 18:46:38.398145+00	571	1	t	t	\N
836	1	60000	4	2021-12-28 18:46:38.398145+00	572	1	t	t	\N
837	1	2500	3	2021-12-28 18:46:38.398145+00	573	1	t	t	\N
838	1	38000	4	2021-12-28 18:46:38.398145+00	574	1	t	t	\N
839	1	65000	4	2021-12-28 18:46:38.398145+00	575	1	t	t	\N
840	1	9000	3	2021-12-28 18:46:38.398145+00	576	1	t	t	\N
841	1	10000	3	2021-12-28 18:46:38.398145+00	577	1	t	t	\N
842	1	10000	3	2021-12-28 18:46:38.398145+00	578	1	t	t	\N
843	1	15000	4	2021-12-28 18:46:38.398145+00	579	1	t	t	\N
845	1	46000	4	2021-12-28 18:46:38.398145+00	581	1	t	t	\N
846	1	40000	4	2021-12-28 18:46:38.398145+00	583	1	t	t	\N
847	1	7000	3	2021-12-28 18:46:38.398145+00	582	1	t	t	\N
848	1	46000	4	2021-12-28 18:46:38.398145+00	584	1	t	t	\N
849	1	85000	4	2021-12-28 18:46:38.398145+00	585	1	t	t	\N
850	1	4000	4	2021-12-28 18:46:38.398145+00	586	1	t	t	\N
851	1	38000	4	2021-12-28 18:46:38.398145+00	587	1	t	t	\N
852	1	3500	3	2021-12-28 18:46:38.398145+00	588	1	t	t	\N
853	1	2500	3	2021-12-28 18:46:38.398145+00	589	1	t	t	\N
854	1	3000	3	2021-12-28 18:46:38.398145+00	590	1	t	t	\N
855	1	2000	4	2021-12-28 18:46:38.398145+00	592	1	t	t	\N
856	1	38000	4	2021-12-28 18:46:38.398145+00	593	1	t	t	\N
857	1	3000	4	2021-12-28 18:46:38.398145+00	594	1	t	t	\N
858	1	25000	4	2021-12-28 18:46:38.398145+00	595	1	t	t	\N
859	1	5000	4	2021-12-28 18:46:38.398145+00	596	1	t	t	\N
860	1	35000	4	2021-12-28 18:46:38.398145+00	597	1	t	t	\N
861	1	3500	3	2021-12-28 18:46:38.398145+00	591	1	t	t	\N
862	1	2500	3	2021-12-28 18:46:38.398145+00	598	1	t	t	\N
863	1	3000	3	2021-12-28 18:46:38.398145+00	599	1	t	t	\N
864	1	5000	4	2021-12-28 18:46:38.398145+00	600	1	t	t	\N
865	1	35000	4	2021-12-28 18:46:38.398145+00	601	1	t	t	\N
866	1	2500	3	2021-12-28 18:46:38.398145+00	602	1	t	t	\N
867	1	2500	4	2021-12-28 18:46:38.398145+00	604	1	t	t	\N
868	1	24000	4	2021-12-28 18:46:38.398145+00	605	1	t	t	\N
869	1	2500	3	2021-12-28 18:46:38.398145+00	603	1	t	t	\N
870	1	6000	3	2021-12-28 18:46:38.398145+00	606	1	t	t	\N
871	1	3500	3	2021-12-28 18:46:38.398145+00	608	1	t	t	\N
872	1	10000	4	2021-12-28 18:46:38.398145+00	607	1	t	t	\N
873	1	95000	4	2021-12-28 18:46:38.398145+00	609	1	t	t	\N
874	1	5000	3	2021-12-28 18:46:38.398145+00	610	1	t	t	\N
875	1	2500	3	2021-12-28 18:46:38.398145+00	612	1	t	t	\N
876	1	26000	3	2021-12-28 18:46:38.398145+00	613	1	t	t	\N
877	1	6000	4	2021-12-28 18:46:38.398145+00	614	1	t	t	\N
878	1	58000	4	2021-12-28 18:46:38.398145+00	615	1	t	t	\N
879	1	30000	3	2021-12-28 18:46:38.398145+00	616	1	t	t	\N
880	1	10000	4	2021-12-28 18:46:38.398145+00	617	1	t	t	\N
881	1	86000	4	2021-12-28 18:46:38.398145+00	618	1	t	t	\N
882	1	6000	4	2021-12-28 18:46:38.398145+00	619	1	t	t	\N
883	1	96000	4	2021-12-28 18:46:38.398145+00	620	1	t	t	\N
884	1	45000	3	2021-12-28 18:46:38.398145+00	621	1	t	t	\N
885	1	28000	3	2021-12-28 18:46:38.398145+00	622	1	t	t	\N
886	1	4000	4	2021-12-28 18:46:38.398145+00	623	1	t	t	\N
887	1	35000	4	2021-12-28 18:46:38.398145+00	624	1	t	t	\N
888	1	15000	3	2021-12-28 18:46:38.398145+00	625	1	t	t	\N
889	1	11000	3	2021-12-28 18:46:38.398145+00	628	1	t	t	\N
890	1	8000	4	2021-12-28 18:46:38.398145+00	626	1	t	t	\N
891	1	78000	4	2021-12-28 18:46:38.398145+00	627	1	t	t	\N
892	1	2500	4	2021-12-28 18:46:38.398145+00	629	1	t	t	\N
893	1	24000	4	2021-12-28 18:46:38.398145+00	630	1	t	t	\N
894	1	11000	4	2021-12-28 18:46:38.398145+00	631	1	t	t	\N
895	1	94000	4	2021-12-28 18:46:38.398145+00	632	1	t	t	\N
896	1	2000	4	2021-12-28 18:46:38.398145+00	634	1	t	t	\N
897	1	15000	4	2021-12-28 18:46:38.398145+00	635	1	t	t	\N
898	1	75000	4	2021-12-28 18:46:38.398145+00	636	1	t	t	\N
931	1	38000	3	2021-12-28 18:46:38.398145+00	633	1	t	t	\N
932	1	12500	3	2021-12-28 18:46:38.398145+00	637	1	t	t	\N
933	1	13000	4	2021-12-28 18:46:38.398145+00	638	1	t	t	\N
934	1	53000	3	2021-12-28 18:46:38.398145+00	639	1	t	t	\N
935	1	140000	3	2021-12-28 18:46:38.398145+00	640	1	t	t	\N
936	1	165000	3	2021-12-28 18:46:38.398145+00	641	1	t	t	\N
937	1	15000	4	2021-12-28 18:46:38.398145+00	643	1	t	t	\N
938	1	3000	4	2021-12-28 18:46:38.398145+00	642	1	t	t	\N
939	1	165000	3	2021-12-28 18:46:38.398145+00	645	1	t	t	\N
940	1	150000	3	2021-12-28 18:46:38.398145+00	646	1	t	t	\N
941	1	30000	4	2021-12-28 18:46:38.398145+00	648	1	t	t	\N
942	1	55000	4	2021-12-28 18:46:38.398145+00	649	1	t	t	\N
943	1	7000	4	2021-12-28 18:46:38.398145+00	650	1	t	t	\N
944	1	80000	4	2021-12-28 18:46:38.398145+00	651	1	t	t	\N
945	1	4000	4	2021-12-28 18:46:38.398145+00	652	1	t	t	\N
946	1	42000	4	2021-12-28 18:46:38.398145+00	653	1	t	t	\N
947	1	125000	3	2021-12-28 18:46:38.398145+00	654	1	t	t	\N
948	1	67000	3	2021-12-28 18:46:38.398145+00	655	1	t	t	\N
949	1	50000	3	2021-12-28 18:46:38.398145+00	656	1	t	t	\N
950	1	7000	4	2021-12-28 18:46:38.398145+00	657	1	t	t	\N
951	1	30000	3	2021-12-28 18:46:38.398145+00	659	1	t	t	\N
952	1	40000	4	2021-12-28 18:46:38.398145+00	658	1	t	t	\N
953	1	50000	3	2021-12-28 18:46:38.398145+00	660	1	t	t	\N
954	1	48000	3	2021-12-28 18:46:38.398145+00	661	1	t	t	\N
955	1	14000	3	2021-12-28 18:46:38.398145+00	662	1	t	t	\N
956	1	17000	3	2021-12-28 18:46:38.398145+00	663	1	t	t	\N
957	1	20000	3	2021-12-28 18:46:38.398145+00	664	1	t	t	\N
958	1	15000	3	2021-12-28 18:46:38.398145+00	665	1	t	t	\N
959	1	4000	4	2021-12-28 18:46:38.398145+00	666	1	t	t	\N
960	1	45000	4	2021-12-28 18:46:38.398145+00	667	1	t	t	\N
961	1	14000	3	2021-12-28 18:46:38.398145+00	668	1	t	t	\N
962	1	4000	4	2021-12-28 18:46:38.398145+00	669	1	t	t	\N
963	1	22000	4	2021-12-28 18:46:38.398145+00	670	1	t	t	\N
964	1	22000	4	2021-12-28 18:46:38.398145+00	670	\N	t	t	\N
965	1	20000	3	2021-12-28 18:46:38.398145+00	671	1	t	t	\N
966	1	3000	4	2021-12-28 18:46:38.398145+00	672	1	t	t	\N
967	1	36000	4	2021-12-28 18:46:38.398145+00	674	1	t	t	\N
968	1	80000	3	2021-12-28 18:46:38.398145+00	673	1	t	t	\N
969	1	22000	4	2021-12-28 18:46:38.398145+00	676	1	t	t	\N
970	1	4000	4	2021-12-28 18:46:38.398145+00	675	1	t	t	\N
971	1	75000	3	2021-12-28 18:46:38.398145+00	677	1	t	t	\N
972	1	4000	4	2021-12-28 18:46:38.398145+00	678	1	t	t	\N
973	1	22000	4	2021-12-28 18:46:38.398145+00	679	1	t	t	\N
974	1	45000	3	2021-12-28 18:46:38.398145+00	680	1	t	t	\N
975	1	13000	3	2021-12-28 18:46:38.398145+00	681	1	t	t	\N
977	1	14000	3	2021-12-28 18:46:38.398145+00	683	1	t	t	\N
978	1	155000	3	2021-12-28 18:46:38.398145+00	684	3	t	t	\N
976	1	150000	3	2021-12-28 18:46:38.398145+00	682	3	t	t	\N
979	1	18000	3	2021-12-28 18:46:38.398145+00	685	1	t	t	\N
980	1	13000	3	2021-12-28 18:46:38.398145+00	686	1	t	t	\N
981	1	25000	3	2021-12-28 18:46:38.398145+00	687	1	t	t	\N
982	1	54000	3	2021-12-28 18:46:38.398145+00	688	1	t	t	\N
983	1	162000	3	2021-12-28 18:46:38.398145+00	689	1	t	t	\N
984	1	12000	3	2021-12-28 18:46:38.398145+00	690	1	t	t	\N
985	1	50000	3	2021-12-28 18:46:38.398145+00	691	1	t	t	\N
986	1	33000	3	2021-12-28 18:46:38.398145+00	692	1	t	t	\N
987	1	38000	3	2021-12-28 18:46:38.398145+00	693	1	t	t	\N
988	1	188000	3	2021-12-28 18:46:38.398145+00	694	3	t	t	\N
989	1	25000	3	2021-12-28 18:46:38.398145+00	695	1	t	t	\N
990	1	188000	3	2021-12-28 18:46:38.398145+00	696	3	t	t	\N
991	1	20000	3	2021-12-28 18:46:38.398145+00	697	1	t	t	\N
992	1	120000	3	2021-12-28 18:46:38.398145+00	698	1	t	t	\N
993	1	290000	3	2021-12-28 18:46:38.398145+00	699	1	t	t	\N
994	1	285000	3	2021-12-28 18:46:38.398145+00	700	1	t	t	\N
996	1	165000	3	2021-12-28 18:46:38.398145+00	701	1	t	t	\N
997	1	75000	3	2021-12-28 18:46:38.398145+00	702	1	t	t	\N
998	1	520000	3	2021-12-28 18:46:38.398145+00	703	1	t	t	\N
999	1	180000	3	2021-12-28 18:46:38.398145+00	704	1	t	t	\N
1000	1	175000	3	2021-12-28 18:46:38.398145+00	705	1	t	t	\N
1001	1	500000	3	2021-12-28 18:46:38.398145+00	706	1	t	t	\N
1002	1	12000	3	2021-12-28 18:46:38.398145+00	707	1	t	t	\N
383	1	3000	4	\N	101	1	t	t	\N
460	1	24000	4	\N	180	2	t	t	\N
571	1	2500	4	\N	269	1	t	t	\N
1003	1	2500	4	\N	1121	1	t	t	\N
1008	1	25000	4	\N	1126	2	t	t	\N
1006	1	3000	4	\N	994	1	t	t	\N
1007	1	40000	4	\N	995	2	t	t	\N
1009	1	6000	4	\N	1127	1	t	t	\N
1016	1	68000	4	\N	264	3	t	t	\N
1017	1	13000	4	\N	996	1	t	t	\N
1018	1	73000	4	\N	997	2	t	t	\N
1019	1	72000	4	\N	997	3	t	t	\N
1020	1	5000	4	\N	1130	1	t	t	\N
1021	1	50000	4	\N	1131	2	t	t	\N
1022	1	48000	4	\N	1131	3	t	t	\N
1023	1	5000	4	\N	1132	1	t	t	\N
1024	1	30000	4	\N	1133	2	t	t	\N
1025	1	8000	4	\N	1116	1	t	t	\N
1026	1	134000	4	\N	1134	3	t	t	\N
1027	1	8000	4	\N	1135	1	t	t	\N
1028	1	139000	4	\N	1136	\N	t	t	\N
1029	1	5000	4	\N	1120	1	t	t	\N
1030	1	50000	4	\N	1137	2	t	t	\N
1031	1	48000	4	\N	1137	3	t	t	\N
1032	1	8500	4	\N	242	\N	t	t	\N
1033	1	5000	4	\N	1122	1	t	t	\N
1034	1	55000	4	\N	1138	2	t	t	\N
1035	1	8000	4	\N	1123	\N	t	t	\N
1036	1	8000	4	\N	1123	1	t	t	\N
1037	1	45000	4	\N	1124	2	t	t	\N
1038	1	43000	4	\N	1124	3	t	t	\N
1039	1	13000	4	\N	1125	1	t	t	\N
1040	1	152000	4	\N	1139	2	t	t	\N
1041	1	150000	4	\N	1139	3	t	t	\N
1043	1	7000	4	\N	1140	1	t	t	\N
1044	1	42000	4	\N	1141	2	t	t	\N
1045	1	40000	4	\N	1141	3	t	t	\N
1046	1	10000	4	\N	1142	1	t	t	\N
1047	1	60000	4	\N	1143	2	t	t	\N
1048	1	50000	4	\N	1143	3	t	t	\N
1049	1	12000	4	\N	1144	1	t	t	\N
1050	1	65000	4	\N	1145	2	t	t	\N
1051	1	86000	4	\N	131	3	t	t	\N
1052	1	42000	4	\N	1146	1	t	t	\N
1053	1	110000	4	\N	1147	1	t	t	\N
1054	1	60000	4	\N	1148	1	t	t	\N
1055	1	24000	4	\N	1036	1	t	t	\N
1056	1	42000	4	\N	1037	1	t	t	\N
1057	1	31000	4	\N	1149	1	t	t	\N
1058	1	22000	4	\N	1150	1	t	t	\N
1059	1	55000	4	\N	1151	1	t	t	\N
1060	1	95000	4	\N	1152	1	t	t	\N
1061	1	24000	4	\N	1033	1	t	t	\N
1062	1	25000	4	\N	1034	1	t	t	\N
1063	1	24000	4	\N	1035	1	t	t	\N
1064	1	6000	4	\N	1153	\N	t	t	\N
1065	1	58000	4	\N	1154	1	t	t	\N
1066	1	120000	4	\N	237	3	t	t	\N
1067	1	30000	4	\N	1155	1	t	t	\N
1068	1	27000	4	\N	1156	1	t	t	\N
1069	1	13000	4	\N	1157	1	t	t	\N
1070	1	25000	4	\N	1158	1	t	t	\N
1071	1	28000	4	\N	1159	1	t	t	\N
1072	1	20000	4	\N	1160	1	t	t	\N
1073	1	43000	4	\N	1161	1	t	t	\N
1074	1	24000	4	\N	1162	1	t	t	\N
1075	1	22000	4	\N	1163	1	t	t	\N
1076	1	165000	4	\N	1164	1	t	t	\N
1077	1	58000	4	\N	1165	1	t	t	\N
1078	1	58000	4	\N	1166	1	t	t	\N
1079	1	25000	4	\N	1167	1	t	t	\N
1080	1	50000	4	\N	1168	1	t	t	\N
1081	1	28000	4	\N	647	1	t	t	\N
1082	1	24000	4	\N	1169	1	t	t	\N
1083	1	24000	4	\N	1170	1	t	t	\N
1084	1	20000	4	\N	1171	1	t	t	\N
1085	1	24000	4	\N	1172	1	t	t	\N
1086	1	34000	4	\N	1173	1	t	t	\N
1088	1	30000	4	\N	1173	3	t	t	\N
1089	1	30000	4	\N	1174	1	t	t	\N
1090	1	25000	4	\N	1175	1	t	t	\N
1091	1	6000	4	\N	1176	1	t	t	\N
1092	1	72000	4	\N	1177	2	t	t	\N
1093	1	70000	4	\N	1177	3	t	t	\N
1094	1	12000	4	\N	1178	1	t	t	\N
1095	1	24000	4	\N	1179	1	t	t	\N
1096	1	10000	4	\N	1180	1	t	t	\N
1097	1	12000	4	\N	1181	1	t	t	\N
1098	1	17000	4	\N	1182	1	t	t	\N
1099	1	17000	4	\N	1183	1	t	t	\N
1011	1	140000	4	\N	1129	2	t	t	\N
1100	1	35000	4	\N	1184	1	t	t	\N
1101	1	18000	4	\N	1047	1	t	t	\N
1102	1	26000	4	\N	1046	1	t	t	\N
1103	1	25000	4	\N	1046	3	t	t	\N
1104	1	90000	4	\N	1185	1	t	t	\N
844	1	115000	4	\N	580	1	t	t	\N
1105	1	65000	4	\N	1186	1	t	t	\N
1106	1	35000	4	\N	1187	1	t	t	\N
1107	1	38000	4	\N	1188	1	t	t	\N
1108	1	70000	4	\N	1027	1	t	t	\N
1109	1	65000	4	\N	1025	1	t	t	\N
1110	1	65000	4	\N	1026	1	t	t	\N
1111	1	55000	4	\N	1028	1	t	t	\N
1112	1	32000	4	\N	1029	1	t	t	\N
1113	1	35000	4	\N	1031	1	t	t	\N
1115	1	32000	4	\N	1030	1	t	t	\N
1116	1	35000	4	\N	1032	1	t	t	\N
1117	1	45000	4	\N	1189	1	t	t	\N
1118	1	45000	4	\N	1024	1	t	t	\N
1119	1	33000	4	\N	1041	1	t	t	\N
1120	1	24000	4	\N	1055	1	t	t	\N
1121	1	48000	4	\N	1056	1	t	t	\N
1122	1	18000	4	\N	1190	1	t	t	\N
1123	1	20000	4	\N	1191	1	t	t	\N
1124	1	23000	4	\N	1192	1	t	t	\N
1125	1	170000	4	\N	160	3	t	t	\N
1126	1	20000	4	\N	1194	1	t	t	\N
1127	1	15000	4	\N	1052	1	t	t	\N
1128	1	6000	4	\N	1195	1	t	t	\N
1129	1	60000	4	\N	1196	2	t	t	\N
1130	1	58000	4	\N	1196	3	t	t	\N
1131	1	16000	4	\N	1197	1	t	t	\N
1132	1	13000	4	\N	1053	1	t	t	\N
1133	1	75000	4	\N	1198	2	t	t	\N
1134	1	73000	4	\N	1198	3	t	t	\N
1135	1	12000	4	\N	1199	1	t	t	\N
1136	1	60000	4	\N	1199	2	t	t	\N
1137	1	72000	4	\N	1200	2	t	t	\N
1138	1	10000	4	\N	1201	1	t	t	\N
1139	1	45000	4	\N	1202	2	t	t	\N
1140	1	8500	4	\N	1062	1	t	t	\N
1141	1	50000	4	\N	1203	2	t	t	\N
1142	1	10000	4	\N	1204	1	t	t	\N
1143	1	18000	4	\N	1205	1	t	t	\N
1144	1	115000	4	\N	1206	\N	t	t	\N
1145	1	115000	4	\N	1206	2	t	t	\N
1146	1	12000	4	\N	1207	1	t	t	\N
1147	1	125000	4	\N	1208	2	t	t	\N
1148	1	29000	4	\N	229	3	t	t	\N
1149	1	58000	4	\N	348	3	t	t	\N
610	1	7000	4	\N	367	1	t	t	\N
1150	1	2500	4	\N	1209	1	t	t	\N
1151	1	13000	4	\N	1210	2	t	t	\N
1155	1	7500	4	\N	1213	1	t	t	\N
1156	1	7840058048512	4	\N	1214	\N	t	t	\N
1157	1	30000	4	\N	1214	2	t	t	\N
1158	1	28000	4	\N	1214	3	t	t	\N
1159	1	10000	4	\N	1215	1	t	t	\N
1160	1	58000	4	\N	1216	2	t	t	\N
1161	1	6000	4	\N	1217	1	t	t	\N
1162	1	68000	4	\N	1218	2	t	t	\N
1163	1	66000	4	\N	1218	3	t	t	\N
1164	1	8000	4	\N	1219	1	t	t	\N
1165	1	62000	4	\N	1220	2	t	t	\N
1166	1	60000	4	\N	1220	3	t	t	\N
1167	1	12000	4	\N	1221	1	t	t	\N
1168	1	48000	4	\N	1222	2	t	t	\N
1169	1	46000	4	\N	1222	3	t	t	\N
1170	1	9000	4	\N	1223	1	t	t	\N
1171	1	68000	4	\N	1224	2	t	t	\N
1172	1	66000	4	\N	1224	3	t	t	\N
1173	1	15000	4	\N	1225	1	t	t	\N
1174	1	60000	4	\N	1226	2	t	t	\N
1175	1	58000	4	\N	1226	3	t	t	\N
1179	1	10000	4	\N	1229	1	t	t	\N
1180	1	40000	4	\N	1230	2	t	t	\N
1181	1	38000	4	\N	1230	3	t	t	\N
1182	1	12000	4	\N	1231	1	t	t	\N
1183	1	48000	4	\N	1232	2	t	t	\N
1184	1	46000	4	\N	1232	3	t	t	\N
1185	1	2000	4	\N	1233	1	t	t	\N
1186	1	46000	4	\N	1234	2	t	t	\N
1153	1	32000	4	\N	1212	2	t	t	\N
1154	1	30000	4	\N	1212	3	t	t	\N
1176	1	6000	4	\N	1227	1	t	t	\N
1177	1	32000	4	\N	1228	2	t	t	\N
1178	1	30000	4	\N	1228	3	t	t	\N
1187	1	44000	4	\N	1234	3	t	t	\N
1191	1	12000	4	\N	1237	1	t	t	\N
1192	1	48000	4	\N	1238	2	t	t	\N
1193	1	46000	4	\N	1238	3	t	t	\N
1194	1	6000	4	\N	1239	1	t	t	\N
1195	1	68000	4	\N	1240	2	t	t	\N
1196	1	65000	4	\N	1240	3	t	t	\N
1197	1	8000	4	\N	1241	1	t	t	\N
1198	1	58000	4	\N	1242	2	t	t	\N
1199	1	55000	4	\N	1242	3	t	t	\N
1200	1	15000	4	\N	1243	2	t	t	\N
1201	1	60000	4	\N	1244	2	t	t	\N
1202	1	58000	4	\N	1244	3	t	t	\N
1203	1	2500	4	\N	1245	1	t	t	\N
1204	1	13000	4	\N	1246	2	t	t	\N
1205	1	2500	4	\N	1247	\N	f	t	\N
1206	1	2500	4	\N	1247	1	t	t	\N
1207	1	13000	4	\N	1248	2	t	t	\N
1211	1	12000	4	\N	1251	1	t	t	\N
1212	1	48000	4	\N	1252	2	t	t	\N
1213	1	46000	4	\N	1252	3	t	t	\N
1214	1	15000	4	\N	1253	1	t	t	\N
1215	1	60000	4	\N	1254	2	t	t	\N
1216	1	58000	4	\N	1254	3	t	t	\N
1217	1	2000	4	\N	1255	1	t	t	\N
1218	1	46000	4	\N	1256	2	t	t	\N
1219	1	44000	4	\N	1256	3	t	t	\N
1220	1	6000	4	\N	1257	1	t	t	\N
1221	1	68000	4	\N	1258	2	t	t	\N
1222	1	65000	4	\N	1258	3	t	t	\N
1223	1	8000	4	\N	1259	1	t	t	\N
1224	1	58000	4	\N	1260	2	t	t	\N
1225	1	56000	4	\N	1260	3	t	t	\N
1229	1	12000	4	\N	1263	1	t	t	\N
1230	1	48000	4	\N	1264	2	t	t	\N
1231	1	46000	4	\N	1264	3	t	t	\N
1232	1	6000	4	\N	1265	1	t	t	\N
1233	1	68000	4	\N	1266	2	t	t	\N
1234	1	66000	4	\N	1266	3	t	t	\N
1235	1	8000	4	\N	1267	1	t	t	\N
1236	1	58000	4	\N	1268	2	t	t	\N
1237	1	55000	4	\N	1268	3	t	t	\N
1238	1	2500	4	\N	1269	1	t	t	\N
1239	1	13000	4	\N	1270	2	t	t	\N
1240	1	5000	4	\N	1271	1	t	t	\N
1241	1	30000	4	\N	1272	2	t	t	\N
1242	1	28000	4	\N	1272	3	t	t	\N
1243	1	12000	4	\N	1273	1	t	t	\N
1244	1	48000	4	\N	1274	2	t	t	\N
1245	1	46000	4	\N	1274	3	t	t	\N
1246	1	15000	4	\N	1275	1	t	t	\N
1247	1	60000	4	\N	1276	2	t	t	\N
1248	1	58000	4	\N	1276	3	t	t	\N
1249	1	6000	4	\N	1277	1	t	t	\N
1250	1	68000	4	\N	1278	2	t	t	\N
1251	1	66000	4	\N	1278	3	t	t	\N
1252	1	8000	4	\N	1279	1	t	t	\N
1253	1	57000	4	\N	1280	2	t	t	\N
1254	1	55000	4	\N	1280	3	t	t	\N
1255	1	2000	4	\N	1281	1	t	t	\N
1256	1	46000	4	\N	1282	2	t	t	\N
1257	1	44000	4	\N	1282	3	t	t	\N
1258	1	3500	4	\N	1283	1	t	t	\N
1259	1	20000	4	\N	1284	2	t	t	\N
1260	1	19000	4	\N	1284	3	t	t	\N
1261	1	9000	4	\N	1285	1	t	t	\N
1262	1	50000	4	\N	1286	2	t	t	\N
1263	1	48000	4	\N	1286	3	t	t	\N
1264	1	12000	4	\N	1287	1	t	t	\N
1265	1	65000	4	\N	1288	2	t	t	\N
1266	1	64000	4	\N	1288	3	t	t	\N
1267	1	3500	4	\N	1289	1	t	t	\N
1268	1	20000	4	\N	1290	2	t	t	\N
1269	1	19000	4	\N	1290	3	t	t	\N
1270	1	9000	4	\N	1291	1	t	t	\N
1271	1	50000	4	\N	1292	2	t	t	\N
1272	1	48000	4	\N	1292	3	t	t	\N
1273	1	12000	4	\N	1293	1	t	t	\N
1274	1	65000	4	\N	1294	2	t	t	\N
1209	1	32000	4	\N	1250	2	t	t	\N
1210	1	30000	4	\N	1250	3	t	t	\N
1188	1	6000	4	\N	1235	1	t	t	\N
1189	1	32000	4	\N	1236	2	t	t	\N
1190	1	30000	4	\N	1236	3	t	t	\N
1226	1	6000	4	\N	1261	1	t	t	\N
1227	1	32000	4	\N	1262	2	t	t	\N
1228	1	30000	4	\N	1262	3	t	t	\N
1275	1	64000	4	\N	1294	3	t	t	\N
1276	1	3500	4	\N	1295	1	t	t	\N
1277	1	20000	4	\N	1296	2	t	t	\N
1278	1	19000	4	\N	1296	3	t	t	\N
1279	1	9000	4	\N	1297	1	t	t	\N
1280	1	50000	4	\N	1298	2	t	t	\N
1281	1	48000	4	\N	1298	3	t	t	\N
1294	1	4000	4	\N	1307	1	t	t	\N
1295	1	20000	4	\N	1308	\N	f	t	\N
1296	1	20000	4	\N	1308	2	t	t	\N
1297	1	74000	4	\N	1309	2	t	t	\N
1298	1	10000	4	\N	1310	1	t	t	\N
1299	1	74000	4	\N	1311	2	t	t	\N
1300	1	68000	4	\N	1311	3	t	t	\N
1301	1	4000	4	\N	1312	1	t	t	\N
1302	1	20000	4	\N	1313	2	t	t	\N
1303	1	10000	4	\N	1314	1	t	t	\N
1304	1	74000	4	\N	1315	2	t	t	\N
1305	1	68000	4	\N	1315	3	t	t	\N
1306	1	3000	4	\N	1316	1	t	t	\N
1307	1	18000	4	\N	1317	2	t	t	\N
1308	1	10000	4	\N	1318	1	t	t	\N
1309	1	74000	4	\N	1319	2	t	t	\N
1310	1	68000	4	\N	1319	3	t	t	\N
1311	1	4000	4	\N	1320	1	t	t	\N
1312	1	20000	4	\N	1321	2	t	t	\N
1313	1	10000	4	\N	1322	1	t	t	\N
1314	1	74000	4	\N	1323	2	t	t	\N
1315	1	68000	4	\N	1323	3	t	t	\N
1316	1	5000	4	\N	1324	1	t	t	\N
1317	1	20000	4	\N	1325	2	t	t	\N
1318	1	18000	4	\N	1325	3	t	t	\N
1319	1	3000	4	\N	1326	1	t	t	\N
1320	1	16000	4	\N	1327	2	t	t	\N
1322	1	5000	4	\N	1328	1	t	t	\N
1323	1	18000	4	\N	1329	2	t	t	\N
1324	1	16000	4	\N	1329	3	t	t	\N
1327	1	15000	4	\N	1327	3	t	t	\N
1328	1	3000	4	\N	1330	1	t	t	\N
1329	1	16000	4	\N	1331	2	t	t	\N
1331	1	15000	4	\N	1331	3	t	t	\N
1332	1	3500	4	\N	1332	1	t	t	\N
1333	1	20000	4	\N	1333	2	t	t	\N
1334	1	18000	4	\N	1333	3	t	t	\N
1335	1	4000	4	\N	1334	1	t	t	\N
1336	1	22000	4	\N	1335	2	f	t	\N
1337	1	21000	4	\N	1335	3	f	t	\N
1338	1	3000	4	\N	1336	1	t	t	\N
1339	1	17000	4	\N	1337	2	t	t	\N
1340	1	16000	4	\N	1337	3	t	t	\N
1341	1	5000	4	\N	1338	1	t	t	\N
1342	1	20000	4	\N	1339	2	t	t	\N
1343	1	12000	4	\N	1340	1	t	t	\N
1344	1	48000	4	\N	1341	2	t	t	\N
1345	1	46000	4	\N	1341	3	t	t	\N
1349	1	48000	4	\N	1345	2	t	t	\N
1350	1	46000	4	\N	1345	3	t	t	\N
1351	1	12000	4	\N	1344	1	t	t	\N
1355	1	12000	4	\N	1348	1	t	t	\N
1356	1	46000	4	\N	1349	2	t	t	\N
1357	1	45000	4	\N	1349	3	t	t	\N
1362	1	1500	4	\N	1352	1	t	t	\N
1363	1	15000	4	\N	1353	2	t	t	\N
1364	1	14000	4	\N	1353	3	t	t	\N
1292	0	32000	4	\N	1306	2	t	t	\N
1293	0	30000	4	\N	1306	3	t	t	\N
1282	0	6000	4	\N	1299	1	t	t	\N
1283	0	32000	4	\N	1300	2	t	t	\N
1284	0	30000	4	\N	1300	3	t	t	\N
1285	0	6000	4	\N	1301	1	t	t	\N
1286	0	32000	4	\N	1302	2	t	t	\N
1287	0	30000	4	\N	1302	3	t	t	\N
1288	0	6000	4	\N	1303	1	t	t	\N
1289	0	32000	4	\N	1304	2	t	t	\N
1290	0	30000	4	\N	1304	3	t	t	\N
1365	1	8000	4	\N	1354	1	t	t	\N
1366	1	48000	4	\N	1355	2	t	t	\N
1367	1	44000	4	\N	1355	3	t	t	\N
1347	1	32000	4	\N	1343	2	t	t	\N
1348	1	30000	4	\N	1343	3	t	t	\N
1352	1	6000	4	\N	1346	1	t	t	\N
1353	1	32000	4	\N	1347	2	t	t	\N
1354	1	30000	4	\N	1347	3	t	t	\N
1358	1	6000	4	\N	1350	1	t	t	\N
1360	1	32000	4	\N	1351	2	t	t	\N
1361	1	30000	4	\N	1351	3	t	t	\N
1368	1	9000	4	\N	1356	1	t	t	\N
1369	1	48000	4	\N	1357	2	t	t	\N
1370	1	44000	4	\N	1357	3	t	t	\N
1371	1	8000	4	\N	1358	1	t	t	\N
1372	1	48000	4	\N	1359	2	t	t	\N
1373	1	44000	4	\N	1359	3	t	t	\N
1374	1	7000	4	\N	1360	1	t	t	\N
1375	1	40000	4	\N	1361	2	t	t	\N
1376	1	10000	4	\N	1362	1	t	t	\N
1377	1	38000	4	\N	1363	2	t	t	\N
1378	1	36000	4	\N	1363	3	t	t	\N
1379	1	6000	4	\N	1364	1	t	t	\N
1380	1	32000	4	\N	1365	2	t	t	\N
1381	1	30000	4	\N	1365	3	t	t	\N
1382	1	10000	4	\N	1366	1	t	t	\N
1383	1	38000	4	\N	1367	2	t	t	\N
1384	1	36000	4	\N	1367	3	t	t	\N
1385	1	6000	4	\N	1368	1	t	t	\N
1386	1	32000	4	\N	1369	2	t	t	\N
1387	1	30000	4	\N	1369	3	t	t	\N
1388	1	10000	4	\N	1370	1	t	t	\N
1389	1	38000	4	\N	1371	2	t	t	\N
1390	1	36000	4	\N	1371	3	t	t	\N
1391	1	6000	4	\N	1372	1	t	t	\N
1392	1	32000	4	\N	1373	2	t	t	\N
1393	1	30000	4	\N	1373	3	t	t	\N
660	1	18000	4	\N	412	1	t	t	\N
1394	1	6000	4	\N	1394	1	t	t	\N
1395	1	500	4	\N	1413	1	t	t	\N
1396	1	2000	4	\N	1414	1	t	t	\N
1397	1	5000	4	\N	1415	1	t	t	\N
1398	1	8000	4	\N	1416	1	t	t	\N
1399	1	6000	4	\N	1417	1	t	t	\N
1400	1	13000	4	\N	1418	1	t	t	\N
1401	1	25000	4	\N	1419	1	t	t	\N
1402	1	20000	4	\N	1420	1	t	t	\N
1403	1	5000	4	\N	1421	1	t	t	\N
724	1	8000	4	\N	468	1	t	t	\N
1404	1	3000	4	\N	763	1	t	t	\N
1405	1	2500	4	\N	764	1	t	t	\N
1407	1	16000	4	\N	708	1	t	t	\N
1408	1	16000	4	\N	709	1	t	t	\N
1409	1	16000	4	\N	710	1	t	t	\N
1410	1	16000	4	\N	711	1	t	t	\N
1411	1	16000	4	\N	712	1	t	t	\N
1412	1	5000	4	\N	714	1	t	t	\N
1413	1	5000	4	\N	715	1	t	t	\N
1414	1	5000	4	\N	716	1	t	t	\N
1415	1	30000	4	\N	717	1	t	t	\N
1416	1	30000	4	\N	718	1	t	t	\N
1417	1	28000	4	\N	719	\N	f	t	\N
1418	1	28000	4	\N	719	1	t	t	\N
1419	1	28000	4	\N	720	1	t	t	\N
1420	1	4000	4	\N	721	1	t	t	\N
1421	1	6000	4	\N	722	1	t	t	\N
1422	1	11000	4	\N	723	1	t	t	\N
1423	1	2000	4	\N	726	1	t	t	\N
1424	1	2000	4	\N	727	1	t	t	\N
1425	1	2000	4	\N	724	1	t	t	\N
1426	1	2000	4	\N	725	1	t	t	\N
1427	1	6500	4	\N	728	1	t	t	\N
1428	1	2000	4	\N	729	1	t	t	\N
1429	1	2000	4	\N	730	1	t	t	\N
1430	1	2000	4	\N	731	1	t	t	\N
1431	1	2500	4	\N	732	1	t	t	\N
1432	1	10000	4	\N	733	1	t	t	\N
1433	1	13000	4	\N	734	1	t	t	\N
1434	1	16000	4	\N	735	1	t	t	\N
1435	1	15000	4	\N	736	1	t	t	\N
1436	1	10000	4	\N	737	1	t	t	\N
1437	1	16000	4	\N	738	1	t	t	\N
1438	1	15000	4	\N	739	1	t	t	\N
1439	1	20000	4	\N	740	1	t	t	\N
1440	1	10000	4	\N	741	1	t	t	\N
1441	1	5000	4	\N	742	1	t	t	\N
1442	1	3500	4	\N	743	1	t	t	\N
1443	1	4000	4	\N	744	1	t	t	\N
1444	1	4000	4	\N	745	1	t	t	\N
1445	1	7000	4	\N	746	1	t	t	\N
1446	1	3000	4	\N	747	1	t	t	\N
1447	1	4000	4	\N	748	1	t	t	\N
1448	1	9000	4	\N	749	1	t	t	\N
1449	1	15000	4	\N	750	1	t	t	\N
1450	1	8000	4	\N	751	1	t	t	\N
1451	1	6000	4	\N	752	1	t	t	\N
1452	1	4000	4	\N	753	1	t	t	\N
1453	1	9000	4	\N	754	1	t	t	\N
1454	1	6000	4	\N	755	1	t	t	\N
1455	1	7000	4	\N	756	1	t	t	\N
1456	1	10000	4	\N	757	1	t	t	\N
1457	1	3000	4	\N	758	\N	f	t	\N
1459	1	3000	4	\N	758	1	t	t	\N
1460	1	3000	4	\N	759	1	t	t	\N
1461	1	3000	4	\N	760	1	t	t	\N
1462	1	3000	4	\N	761	1	t	t	\N
1463	1	3000	4	\N	762	1	t	t	\N
1464	1	2500	4	\N	765	1	t	t	\N
1465	1	2500	4	\N	766	1	t	t	\N
1466	1	8000	4	\N	767	1	t	t	\N
1467	1	3000	4	\N	768	1	t	t	\N
1468	1	5500	4	\N	769	1	t	t	\N
1469	1	8000	4	\N	770	1	t	t	\N
1470	1	5000	4	\N	771	1	t	t	\N
1471	1	4000	4	\N	772	1	t	t	\N
1472	1	3000	4	\N	773	1	t	t	\N
1473	1	5000	4	\N	774	1	t	t	\N
1474	1	3000	4	\N	775	1	t	t	\N
1475	1	3000	4	\N	776	1	t	t	\N
1476	1	3500	4	\N	777	1	t	t	\N
1477	1	3500	4	\N	778	1	t	t	\N
1478	1	5000	4	\N	779	1	t	t	\N
1479	1	5000	4	\N	781	1	t	t	\N
1480	1	5000	4	\N	780	1	t	t	\N
1481	1	3500	4	\N	783	1	t	t	\N
1482	1	4000	4	\N	784	1	t	t	\N
1483	1	17000	4	\N	785	1	t	t	\N
1484	1	17000	4	\N	786	1	t	t	\N
1485	1	9000	4	\N	787	1	t	t	\N
1486	1	2000	4	\N	788	1	t	t	\N
1487	1	3000	4	\N	789	1	t	t	\N
1488	1	3000	4	\N	790	1	t	t	\N
1489	1	3000	4	\N	791	1	t	t	\N
1490	1	3000	4	\N	792	1	t	t	\N
1491	1	3000	4	\N	793	1	t	t	\N
1492	1	3000	4	\N	794	1	t	t	\N
1493	1	4000	4	\N	795	1	t	t	\N
1494	1	3000	4	\N	796	1	t	t	\N
1495	1	3000	4	\N	797	1	t	t	\N
1496	1	3000	4	\N	798	1	t	t	\N
1497	1	2000	4	\N	799	1	t	t	\N
1498	1	2000	4	\N	802	1	t	t	\N
1499	1	2000	4	\N	804	1	t	t	\N
1500	1	1000	4	\N	807	1	t	t	\N
1501	1	1000	4	\N	806	1	t	t	\N
1502	1	11000	4	\N	808	1	t	t	\N
1503	1	6000	4	\N	809	1	t	t	\N
1504	1	6000	4	\N	810	1	t	t	\N
1505	1	6500	4	\N	811	1	t	t	\N
1506	1	5000	4	\N	812	1	t	t	\N
1507	1	18000	4	\N	813	1	t	t	\N
1508	1	6500	4	\N	1396	1	t	t	\N
1509	1	15000	4	\N	816	1	t	t	\N
1510	1	13000	4	\N	817	1	t	t	\N
1511	1	8000	4	\N	818	1	t	t	\N
1512	1	5000	4	\N	819	1	t	t	\N
1513	1	6000	4	\N	820	1	t	t	\N
1514	1	13000	4	\N	821	1	t	t	\N
1515	1	1000	4	\N	822	1	t	t	\N
1516	1	1000	4	\N	823	1	t	t	\N
1517	1	6000	4	\N	824	1	t	t	\N
1518	1	24000	4	\N	825	1	t	t	\N
1519	1	24000	4	\N	826	1	t	t	\N
1520	1	6500	4	\N	827	1	t	t	\N
1521	1	4000	4	\N	828	1	t	t	\N
1522	1	4000	4	\N	829	1	t	t	\N
1523	1	6000	4	\N	830	1	t	t	\N
1524	1	4000	4	\N	831	1	t	t	\N
1525	1	4000	4	\N	834	1	t	t	\N
1526	1	4000	4	\N	835	1	t	t	\N
1527	1	4000	4	\N	832	1	t	t	\N
1528	1	4000	4	\N	833	1	t	t	\N
1529	1	11000	4	\N	836	1	t	t	\N
1530	1	11000	4	\N	837	\N	f	t	\N
1531	1	11000	4	\N	837	1	t	t	\N
1532	1	18000	4	\N	839	1	t	t	\N
1533	1	15000	4	\N	840	1	t	t	\N
1534	1	22000	4	\N	841	1	t	t	\N
1535	1	15000	4	\N	842	1	t	t	\N
1536	1	9000	4	\N	843	1	t	t	\N
1537	1	20000	4	\N	844	1	t	t	\N
1538	1	24000	4	\N	845	1	t	t	\N
1539	1	2000	4	\N	846	1	t	t	\N
1540	1	2000	4	\N	848	1	t	t	\N
1541	1	2000	4	\N	850	1	t	t	\N
1542	1	2000	4	\N	852	1	t	t	\N
1543	1	2000	4	\N	854	1	t	t	\N
1544	1	500	4	\N	865	1	t	t	\N
1545	1	500	4	\N	858	1	t	t	\N
1546	1	500	4	\N	860	1	t	t	\N
1547	1	500	4	\N	856	1	t	t	\N
1548	1	500	4	\N	862	1	t	t	\N
1549	1	3500	4	\N	869	1	t	t	\N
1550	1	3500	4	\N	871	1	t	t	\N
1551	1	3500	4	\N	1374	1	t	t	\N
1552	1	3500	4	\N	867	1	t	t	\N
1553	1	2500	4	\N	873	\N	f	t	\N
1554	1	2500	4	\N	873	1	t	t	\N
1555	1	6000	4	\N	874	1	t	t	\N
1556	1	6000	4	\N	875	1	t	t	\N
1557	1	18000	4	\N	876	1	t	t	\N
1558	1	25000	4	\N	877	1	t	t	\N
1559	1	14000	4	\N	879	1	t	t	\N
1560	1	14000	4	\N	880	\N	f	t	\N
1561	1	14000	4	\N	880	1	t	t	\N
1562	1	14000	4	\N	878	1	t	t	\N
1563	1	14000	4	\N	881	1	t	t	\N
1564	1	14000	4	\N	882	1	t	t	\N
1565	1	4000	4	\N	883	1	t	t	\N
1566	1	8000	4	\N	884	1	t	t	\N
1567	1	5000	4	\N	885	1	t	t	\N
1568	1	2000	4	\N	886	1	t	t	\N
1569	1	1500	4	\N	889	1	t	t	\N
1570	1	3000	4	\N	891	1	t	t	\N
1571	1	1500	4	\N	893	1	t	t	\N
1572	1	2000	4	\N	895	1	t	t	\N
1573	1	3000	4	\N	897	1	t	t	\N
1574	1	3000	4	\N	899	1	t	t	\N
1575	1	14000	4	\N	901	1	t	t	\N
1576	1	10000	4	\N	902	1	t	t	\N
1577	1	12000	4	\N	903	1	t	t	\N
1578	1	3000	4	\N	904	1	t	t	\N
1579	1	3000	4	\N	905	1	t	t	\N
1580	1	1000	4	\N	906	1	t	t	\N
1581	1	1000	4	\N	1389	1	t	t	\N
1582	1	1000	4	\N	910	1	t	t	\N
1583	1	1000	4	\N	1387	1	t	t	\N
1584	1	1000	4	\N	908	1	t	t	\N
1585	1	1000	4	\N	1388	1	t	t	\N
1586	1	1000	4	\N	1391	1	t	t	\N
1587	1	1000	4	\N	1390	1	t	t	\N
1588	1	2000	4	\N	1386	1	t	t	\N
1589	1	2000	4	\N	914	1	t	t	\N
1590	1	2000	4	\N	1385	1	t	t	\N
1591	1	2000	4	\N	912	1	t	t	\N
1621	1	2000	4	\N	918	1	t	t	\N
1622	1	2000	4	\N	920	1	t	t	\N
1623	1	2000	4	\N	1383	1	t	t	\N
1624	1	2000	4	\N	1382	1	t	t	\N
1625	1	2000	4	\N	916	1	t	t	\N
1626	1	2000	4	\N	925	1	t	t	\N
1627	1	2000	4	\N	923	1	t	t	\N
1628	1	2000	4	\N	1381	1	t	t	\N
1629	1	2000	4	\N	927	1	t	t	\N
1630	1	3000	4	\N	931	1	t	t	\N
1631	1	2000	4	\N	929	1	t	t	\N
1632	1	2000	4	\N	933	1	t	t	\N
1633	1	6000	4	\N	1379	1	t	t	\N
1634	1	6000	4	\N	937	1	t	t	\N
1635	1	6000	4	\N	935	1	t	t	\N
1636	1	3000	4	\N	941	1	t	t	\N
1637	1	3000	4	\N	939	1	t	t	\N
1638	1	3000	4	\N	1384	1	t	t	\N
1639	1	3000	4	\N	943	1	t	t	\N
1640	1	4000	4	\N	945	1	t	t	\N
1641	1	7000	4	\N	1378	1	t	t	\N
1642	1	7000	4	\N	947	1	t	t	\N
1643	1	2000	4	\N	955	1	t	t	\N
1644	1	2000	4	\N	1380	1	t	t	\N
1645	1	2000	4	\N	953	1	t	t	\N
1646	1	2000	4	\N	949	1	t	t	\N
1647	1	2000	4	\N	951	1	t	t	\N
1648	1	2000	4	\N	957	1	t	t	\N
1649	1	2000	4	\N	960	1	t	t	\N
1650	1	200000	4	\N	998	1	t	t	\N
1651	1	195000	4	\N	999	1	t	t	\N
1652	1	25000	4	\N	1000	1	t	t	\N
1653	1	15000	4	\N	1001	1	t	t	\N
1654	1	58000	4	\N	1002	1	t	t	\N
1655	1	150000	4	\N	1003	1	t	t	\N
1656	1	46000	4	\N	1004	1	t	t	\N
1657	1	30000	4	\N	1005	\N	f	t	\N
1658	1	30000	4	\N	1005	1	t	t	\N
1659	1	100000	4	\N	1006	1	t	t	\N
1660	1	26000	4	\N	1007	1	t	t	\N
1661	1	18000	4	\N	1008	1	t	t	\N
1662	1	38000	4	\N	1009	1	t	t	\N
1663	1	54000	4	\N	1010	1	t	t	\N
1664	1	42000	4	\N	1011	1	t	t	\N
1665	1	115000	4	\N	1013	1	t	t	\N
1666	1	145000	4	\N	1012	1	t	t	\N
1667	1	146000	4	\N	1014	1	t	t	\N
1668	1	95000	4	\N	1015	1	t	t	\N
1669	1	80000	4	\N	1016	1	t	t	\N
1670	1	36000	4	\N	1017	\N	t	t	\N
1671	1	42000	4	\N	1018	1	t	t	\N
1672	1	29000	4	\N	1019	1	t	t	\N
1673	1	17000	4	\N	1020	1	t	t	\N
1674	1	11000	4	\N	1021	1	t	t	\N
1675	1	50000	4	\N	1022	1	t	t	\N
1676	1	22000	4	\N	1023	4	t	t	\N
1677	1	22000	4	\N	1038	1	t	t	\N
1678	1	25000	4	\N	1039	1	t	t	\N
1679	1	24000	4	\N	1040	1	t	t	\N
1680	1	33000	4	\N	1042	1	t	t	\N
1681	1	35000	4	\N	1043	1	t	t	\N
1682	1	30000	4	\N	1044	1	t	t	\N
1683	1	20000	4	\N	1045	1	t	t	\N
1684	1	50000	4	\N	1048	1	t	t	\N
1685	1	16000	4	\N	1049	\N	f	t	\N
1686	1	16000	4	\N	1049	1	t	t	\N
1687	1	5000	4	\N	1050	1	t	t	\N
1688	1	20000	4	\N	1051	1	t	t	\N
1689	1	12000	4	\N	1054	1	t	t	\N
1690	1	4000	4	\N	1057	1	t	t	\N
1691	1	2500	4	\N	1058	1	t	t	\N
1692	1	5500	4	\N	1059	1	t	t	\N
1693	1	17000	4	\N	1060	1	t	t	\N
1694	1	17000	4	\N	1061	1	t	t	\N
1695	1	8000	4	\N	1063	1	t	t	\N
1696	1	6500	4	\N	1064	1	t	t	\N
1697	1	4000	4	\N	1065	1	t	t	\N
1698	1	2500	4	\N	1066	1	t	t	\N
1699	1	48000	4	\N	1068	1	t	t	\N
1700	1	14000	4	\N	1069	1	t	t	\N
1701	1	14000	4	\N	1070	1	t	t	\N
1702	1	14000	4	\N	1071	1	t	t	\N
1703	1	14000	4	\N	1072	1	t	t	\N
1704	1	15000	4	\N	1073	1	t	t	\N
1705	1	16000	4	\N	1074	1	t	t	\N
1706	1	7000	4	\N	1075	1	t	t	\N
1707	1	6000	4	\N	1076	1	t	t	\N
1708	1	14000	4	\N	1077	1	t	t	\N
1709	1	38000	4	\N	1078	1	t	t	\N
1710	1	2000	4	\N	1079	1	t	t	\N
1711	1	20000	4	\N	1080	2	t	t	\N
1712	1	2500	4	\N	1081	1	t	t	\N
1713	1	23000	4	\N	1082	2	t	t	\N
1714	1	3500	4	\N	1083	1	t	t	\N
1715	1	30000	4	\N	1084	2	t	t	\N
1716	1	2500	4	\N	1085	1	t	t	\N
1717	1	24000	4	\N	1086	2	t	t	\N
1718	1	7000	4	\N	1087	1	t	t	\N
1719	1	58000	4	\N	1088	2	t	t	\N
1720	1	7000	4	\N	1089	1	t	t	\N
1721	1	54000	4	\N	1090	2	t	t	\N
1722	1	6000	4	\N	1091	1	t	t	\N
1723	1	4000	4	\N	1092	1	t	t	\N
1724	1	35000	4	\N	1093	2	t	t	\N
1725	1	4000	4	\N	1094	1	t	t	\N
1726	1	38000	4	\N	1095	2	t	t	\N
1727	1	22000	4	\N	1096	1	t	t	\N
1728	1	22000	4	\N	1097	1	t	t	\N
1729	1	11000	4	\N	1098	1	t	t	\N
1730	1	2500	4	\N	1099	1	t	t	\N
1731	1	21000	4	\N	1100	1	t	t	\N
1732	1	6000	4	\N	1101	1	t	t	\N
1733	1	13000	4	\N	1103	1	t	t	\N
1734	1	10000	4	\N	1104	1	t	t	\N
1735	1	6000	4	\N	1105	1	t	t	\N
1736	1	15000	4	\N	1106	1	t	t	\N
1737	1	15000	4	\N	1107	1	t	t	\N
1738	1	11000	4	\N	1108	1	t	t	\N
1739	1	11000	4	\N	1109	1	t	t	\N
1740	1	9000	4	\N	1110	1	t	t	\N
1741	1	9000	4	\N	1111	1	t	t	\N
1742	1	7000	4	\N	1112	1	t	t	\N
1743	1	7000	4	\N	1113	1	t	t	\N
1744	1	6000	4	\N	1114	1	t	t	\N
1745	1	6000	4	\N	1115	1	t	t	\N
1746	1	8000	4	\N	1376	1	t	t	\N
1747	1	8000	4	\N	1119	1	t	t	\N
1748	1	8000	4	\N	1117	1	t	t	\N
1749	1	8000	4	\N	1377	1	t	t	\N
1750	1	8000	4	\N	1118	1	t	t	\N
1751	1	3500	4	\N	1424	1	t	t	\N
1752	1	40000	4	\N	1425	2	t	t	\N
1753	1	2500	4	\N	1426	1	t	t	\N
1754	1	2500	4	\N	1427	1	t	t	\N
1755	1	2500	4	\N	1428	1	t	t	\N
1756	1	2500	4	\N	1429	1	t	t	\N
1757	1	2500	4	\N	1430	1	t	t	\N
1758	1	4000	4	\N	1431	1	t	t	\N
1759	1	4000	4	\N	1432	1	t	t	\N
1760	1	4000	4	\N	1433	1	t	t	\N
1761	1	4000	4	\N	1434	1	t	t	\N
1762	1	4000	4	\N	1435	1	t	t	\N
1763	1	4000	4	\N	1436	1	t	t	\N
1764	1	4000	4	\N	1437	1	t	t	\N
1765	1	4000	4	\N	1438	1	t	t	\N
1766	1	4500	4	\N	1439	1	t	t	\N
1767	1	7000	4	\N	1440	1	t	t	\N
1768	1	7000	4	\N	1441	1	t	t	\N
1769	1	7000	4	\N	1442	1	t	t	\N
1770	1	7000	4	\N	1443	1	t	t	\N
1771	1	10000	4	\N	1445	1	t	t	\N
1772	1	10000	4	\N	1446	1	t	t	\N
1773	1	10000	4	\N	1447	1	t	t	\N
1774	1	3500	4	\N	1448	1	t	t	\N
1775	1	3500	4	\N	1449	1	t	t	\N
1776	1	3000	4	\N	1450	1	t	t	\N
1777	1	4000	4	\N	1451	1	t	t	\N
1778	1	4000	4	\N	1452	1	t	t	\N
1779	1	3000	4	\N	1453	1	t	t	\N
1780	1	3000	4	\N	1454	1	t	t	\N
1781	1	3000	4	\N	1455	1	t	t	\N
1782	1	3000	4	\N	1456	1	t	t	\N
1783	1	3000	4	\N	1457	1	t	t	\N
1784	1	2500	4	\N	1458	1	t	t	\N
1785	1	5000	4	\N	1459	1	t	t	\N
1786	1	8000	4	\N	1460	1	t	t	\N
1787	1	3500	4	\N	1461	1	t	t	\N
1788	1	6000	4	\N	1462	1	t	t	\N
1789	1	8000	4	\N	1463	1	t	t	\N
1790	1	7500	4	\N	1464	1	t	t	\N
1791	1	6000	4	\N	1465	1	t	t	\N
1792	1	23000	4	\N	1466	1	t	t	\N
1793	1	24000	4	\N	1467	1	t	t	\N
1794	1	80000	4	\N	1468	1	t	t	\N
1795	1	65000	4	\N	1469	1	t	t	\N
1796	1	50000	4	\N	1470	1	t	t	\N
1797	1	2500	4	\N	1471	1	t	t	\N
1798	1	36000	4	\N	1472	1	t	t	\N
1799	1	5000	4	\N	1473	1	t	t	\N
1800	1	55000	4	\N	1474	1	t	t	\N
1801	1	6000	4	\N	1475	1	t	t	\N
1802	1	65000	4	\N	1476	1	t	t	\N
1803	1	5000	4	\N	1477	1	t	t	\N
1804	1	58000	4	\N	1478	1	t	t	\N
1805	1	6000	4	\N	1479	1	t	t	\N
1806	1	70000	4	\N	1480	1	t	t	\N
1807	1	12000	4	\N	1481	1	t	t	\N
1808	1	12000	4	\N	1482	1	t	t	\N
1809	1	12000	4	\N	1483	1	t	t	\N
1810	1	12000	4	\N	1484	1	t	t	\N
1811	1	12000	4	\N	1485	1	t	t	\N
1812	1	16000	4	\N	1486	1	t	t	\N
1813	1	16000	4	\N	1487	1	t	t	\N
1815	1	12000	4	\N	1489	1	t	t	\N
1816	1	12000	4	\N	1490	1	t	t	\N
1817	1	12000	4	\N	1491	1	t	t	\N
1818	1	6000	4	\N	1492	1	t	t	\N
1819	1	6000	4	\N	1493	1	t	t	\N
1820	1	6000	4	\N	1494	1	t	t	\N
1821	1	3500	4	\N	1495	1	t	t	\N
1822	1	8000	4	\N	1496	1	t	t	\N
1823	1	11000	4	\N	1497	1	t	t	\N
1824	1	16000	4	\N	1498	1	t	t	\N
1825	1	16000	4	\N	1499	1	t	t	\N
1826	1	16000	4	\N	1500	1	t	t	\N
1827	1	11000	4	\N	1501	1	t	t	\N
1828	1	25000	4	\N	1502	1	t	t	\N
1829	1	12000	4	\N	1503	1	t	t	\N
1830	1	240000	4	\N	1504	1	t	t	\N
1831	1	2000	4	\N	1505	1	t	t	\N
1832	1	17000	4	\N	1506	1	t	t	\N
1833	1	2500	4	\N	1507	1	t	t	\N
1834	1	28000	4	\N	1508	1	t	t	\N
1835	1	2500	4	\N	1509	1	t	t	\N
1836	1	30000	4	\N	1510	1	t	t	\N
1837	1	4000	4	\N	1511	1	t	t	\N
1838	1	22000	4	\N	1512	1	t	t	\N
1839	1	6000	4	\N	1513	1	t	t	\N
1840	1	50000	4	\N	1514	1	t	t	\N
1841	1	10000	4	\N	1515	1	t	t	\N
1842	1	38000	4	\N	1516	1	t	t	\N
1843	1	40000	4	\N	1517	1	t	t	\N
1844	1	40000	4	\N	1518	1	t	t	\N
1845	1	40000	4	\N	1519	1	t	t	\N
1846	1	40000	4	\N	1520	1	t	t	\N
1847	1	40000	4	\N	1521	1	t	t	\N
1848	1	40000	4	\N	1522	1	t	t	\N
1849	1	38000	4	\N	1523	1	t	t	\N
1850	1	500	4	\N	1422	1	t	t	\N
1851	1	5000	4	\N	1423	1	t	t	\N
1852	1	5000	4	\N	1524	1	t	t	\N
1853	1	1000	7	\N	1525	1	t	t	\N
1854	1	15000	7	\N	1407	1	t	t	\N
1855	1	85000	7	\N	1408	2	t	t	\N
1856	1	22000	7	\N	1398	\N	t	t	\N
1857	1	250	4	\N	1392	1	t	t	\N
1858	1	31000	4	\N	1393	1	t	t	\N
1010	1	35000	4	\N	1128	2	t	t	\N
1859	1	4000	7	\N	1526	1	t	t	\N
1860	1	5000	4	\N	1527	1	t	t	\N
1861	1	10000	4	\N	1528	1	t	t	\N
1862	1	32000	4	\N	1529	1	t	t	\N
1863	1	32000	4	\N	1530	1	t	t	\N
1864	1	1000	4	\N	1411	1	t	t	\N
1865	1	27000	4	\N	1412	1	t	t	\N
1866	1	5000	4	\N	1531	1	t	t	\N
1867	1	12000	4	\N	1532	1	t	t	\N
1868	1	10000	4	\N	1533	1	t	t	\N
1869	1	15000	4	\N	1534	1	t	t	\N
1870	1	7000	4	\N	1535	1	t	t	\N
1871	1	7000	4	\N	1536	1	t	t	\N
1872	1	20000	4	\N	1537	1	t	t	\N
1873	1	22000	4	\N	1410	1	t	t	\N
1874	1	3000	4	\N	1538	1	t	t	\N
1875	1	4000	4	\N	1539	1	t	t	\N
1876	1	8000	4	\N	1540	1	t	t	\N
1877	1	15000	4	\N	1541	1	t	t	\N
1878	1	18000	4	\N	1542	1	t	t	\N
1879	1	16000	4	\N	1543	1	t	t	\N
1880	1	6000	4	\N	1399	1	t	t	\N
1881	1	16000	4	\N	1544	1	t	t	\N
1882	1	24000	4	\N	782	1	t	t	\N
1883	1	11000	4	\N	1545	1	t	t	\N
1884	1	2000	4	\N	1546	1	t	t	\N
1885	1	15000	4	\N	1547	1	t	t	\N
1886	1	15000	4	\N	1548	1	t	t	\N
1887	1	15000	4	\N	1549	1	t	t	\N
1888	1	18000	4	\N	1550	1	t	t	\N
1889	1	10000	4	\N	1551	1	t	t	\N
1890	1	10000	4	\N	1552	1	t	t	\N
1891	1	10000	4	\N	1553	1	t	t	\N
1892	1	10000	4	\N	1554	1	t	t	\N
1893	1	10000	4	\N	1555	1	t	t	\N
1894	1	10000	4	\N	1556	1	t	t	\N
1895	1	5000	4	\N	713	1	t	t	\N
1896	1	5000	4	\N	1402	1	t	t	\N
1897	1	5000	4	\N	1400	1	t	t	\N
1898	1	38000	4	\N	1557	1	t	t	\N
1899	1	228000	4	\N	1558	1	t	t	\N
1902	1	20000	4	\N	1559	1	t	t	\N
1903	1	200000	4	\N	1560	\N	t	t	\N
1904	1	9000	4	\N	1561	1	t	t	\N
1905	1	52000	4	\N	1562	2	t	t	\N
1906	1	3000	4	\N	1564	1	t	t	\N
1907	1	33000	4	\N	1565	1	t	t	\N
1908	1	3000	4	\N	1566	1	t	t	\N
1909	1	33000	4	\N	1567	2	t	t	\N
1910	1	3000	4	\N	1568	1	t	t	\N
1911	1	33000	4	\N	1569	2	t	t	\N
1912	1	2000	4	\N	1570	1	t	t	\N
1913	1	13000	4	\N	1571	2	t	t	\N
1914	1	16000	4	\N	1572	1	t	t	\N
1915	1	10000	4	\N	1573	1	t	t	\N
1916	1	10000	4	\N	1574	1	t	t	\N
1917	1	10000	4	\N	1575	1	t	t	\N
1918	1	1000	4	\N	1576	1	t	t	\N
1919	1	3000	4	\N	1577	1	t	t	\N
1920	1	5000	4	\N	1578	1	t	t	\N
1921	1	180000	4	\N	1579	2	t	t	\N
1922	1	172000	4	\N	1579	3	f	t	\N
1152	1	6000	4	\N	1211	1	t	t	\N
1208	1	6000	4	\N	1249	1	t	t	\N
1346	1	6000	4	\N	1342	1	t	t	\N
1923	1	5000	4	\N	1580	1	t	t	\N
1925	1	8000	4	\N	1581	1	t	t	\N
1926	1	8000	4	\N	1582	1	t	t	\N
1927	1	8000	4	\N	1583	1	t	t	\N
1928	1	13000	4	\N	1584	1	t	t	\N
1929	1	30000	4	\N	1585	1	t	t	\N
1930	1	17000	4	\N	1587	1	t	t	\N
1931	1	15000	4	\N	1588	1	t	t	\N
1932	1	3000	4	\N	1589	1	t	t	\N
1933	1	16000	4	\N	1590	2	t	t	\N
1934	1	7000	4	\N	1591	1	t	t	\N
1935	1	40000	4	\N	1592	2	t	t	\N
1936	1	160000	4	\N	1593	2	t	t	\N
1937	1	5000	4	\N	1594	1	t	t	\N
1938	1	5000	4	\N	1595	1	t	t	\N
1939	1	5000	4	\N	1596	1	t	t	\N
1940	1	4000	4	\N	1597	1	t	t	\N
1941	1	54000	4	\N	1598	1	t	t	\N
1942	1	13000	4	\N	1406	1	t	t	\N
1943	1	153000	4	\N	1599	1	t	t	\N
1944	1	95000	4	\N	1600	1	t	t	\N
1946	1	13000	4	\N	1602	1	t	t	\N
1947	1	6000	4	\N	1603	1	t	t	\N
1948	1	6000	4	\N	1604	1	t	t	\N
1949	1	6000	4	\N	1605	1	t	t	\N
1950	1	6000	4	\N	1606	1	t	t	\N
1951	1	32000	4	\N	1607	1	t	t	\N
1952	1	15000	4	\N	1608	1	t	t	\N
1953	1	20000	4	\N	1609	1	t	t	\N
1954	1	85000	4	\N	1610	1	t	t	\N
1814	1	12000	4	\N	1488	1	t	t	\N
1955	1	15000	4	\N	1611	1	t	t	\N
1956	1	6000	4	\N	1612	1	t	t	\N
1957	1	22000	4	\N	1613	1	t	t	\N
1959	1	17000	4	\N	1615	1	t	t	\N
1958	1	17000	4	\N	1614	1	t	t	\N
1960	1	5000	4	\N	1616	1	t	t	\N
1961	1	35000	4	\N	1617	1	t	t	\N
1962	1	35000	4	\N	1618	1	t	t	\N
1963	1	35000	4	\N	1620	1	t	t	\N
1964	1	35000	4	\N	1621	1	t	t	\N
1965	1	40000	4	\N	1622	1	t	t	\N
1966	1	40000	4	\N	1623	1	t	t	\N
1967	1	40000	4	\N	1624	1	t	t	\N
1968	1	40000	4	\N	1625	1	t	t	\N
1969	1	50000	4	\N	1626	1	t	t	\N
1970	1	85000	4	\N	1627	1	t	t	\N
1971	1	85000	4	\N	1628	1	t	t	\N
1972	1	85000	4	\N	1629	1	t	t	\N
1973	1	85000	4	\N	1630	1	t	t	\N
1975	1	90000	4	\N	1632	1	t	t	\N
1974	1	90000	4	\N	1631	1	t	t	\N
1976	1	15000	4	\N	1409	1	t	t	\N
1977	1	85000	4	\N	1633	2	t	t	\N
1981	1	6000	8	\N	1634	1	t	t	\N
1982	1	33000	8	\N	1635	2	t	t	\N
1983	1	5000	4	\N	1636	1	t	t	\N
1984	1	7500	4	\N	1637	1	t	t	\N
1985	1	42000	4	\N	1638	2	t	t	\N
1986	1	130000	4	\N	1640	2	t	t	\N
1987	1	11000	4	\N	1639	1	t	t	\N
1989	1	8000	12	\N	1641	1	t	t	\N
1990	1	53000	9	\N	1643	1	t	t	\N
1991	1	2500	9	\N	1644	1	t	t	\N
1992	1	2500	9	\N	1645	1	t	t	\N
1993	1	2000	9	\N	1646	1	t	t	\N
1994	1	2000	9	\N	1647	1	t	t	\N
1995	1	5000	9	\N	1648	1	t	t	\N
1996	1	10000	9	\N	1649	1	t	t	\N
1997	1	2000	9	\N	1650	1	t	t	\N
1998	1	10000	9	\N	1651	1	t	t	\N
1999	1	10000	9	\N	1652	1	t	t	\N
2000	1	10000	9	\N	1653	1	t	t	\N
2001	1	10000	9	\N	1654	1	t	t	\N
2002	1	20000	9	2022-04-01 15:09:18.621+00	1405	1	t	t	\N
2003	0	7000	2	2022-04-03 18:30:51.938+00	121	5	t	t	\N
401	0	5000	2	\N	121	1	t	f	\N
402	0	28000	2	\N	122	2	t	f	\N
1291	0	6000	4	\N	1305	1	t	t	\N
403	0	112000	4	\N	123	2	t	f	\N
2029	0	12000	4	2022-04-30 20:38:35.815+00	1681	1	t	t	\N
2030	0	3500	4	2022-04-30 21:18:43.922+00	1682	1	t	t	\N
2031	0	22000	4	2022-04-30 21:22:59.289+00	1683	1	t	t	\N
2032	0	5000	4	2022-04-30 21:25:29.943+00	1684	1	t	t	\N
2033	0	5000	4	2022-04-30 21:27:10.929+00	1685	1	t	t	\N
2034	0	10000	4	2022-04-30 21:29:03.865+00	1686	1	t	t	\N
2035	0	4000	4	2022-04-30 21:34:15.633+00	1687	1	t	t	\N
2036	0	4000	4	2022-04-30 21:38:45.968+00	1688	1	t	t	\N
2037	0	30000	4	2022-04-30 21:47:25.016+00	1689	1	t	t	\N
2038	0	30000	4	2022-04-30 21:49:35.819+00	1690	1	t	t	\N
2039	0	30000	4	2022-04-30 21:51:32.244+00	1691	1	t	t	\N
2040	0	5000	4	2022-04-30 21:53:44.498+00	1692	1	t	t	\N
2041	0	15000	4	2022-04-30 21:55:34.216+00	1693	1	t	t	\N
2042	0	12000	4	2022-04-30 21:57:29.756+00	1694	1	t	t	\N
2043	0	8000	4	2022-04-30 21:59:56.836+00	1695	1	t	t	\N
2044	0	6000	4	2022-04-30 22:01:35.458+00	1696	1	t	t	\N
2045	0	7000	4	2022-04-30 22:03:46.838+00	1697	1	t	t	\N
2046	0	6500	4	2022-04-30 22:05:28.531+00	1698	1	t	t	\N
2047	0	6500	4	2022-04-30 22:06:35.356+00	1699	1	t	t	\N
2048	0	27000	1	2022-06-15 23:34:14.887+00	1700	1	t	t	\N
2049	0	68000	1	2022-06-16 19:34:11.879+00	1701	1	t	t	\N
\.


--
-- Name: precio_por_sucursal_id_seq; Type: SEQUENCE SET; Schema: productos; Owner: franco
--

SELECT pg_catalog.setval('productos.precio_por_sucursal_id_seq', 1, true);


--
-- Data for Name: presentacion; Type: TABLE DATA; Schema: productos; Owner: franco
--

COPY productos.presentacion (id, producto_id, cantidad, descripcion, principal, activo, tipo_presentacion_id, usuario_id, creado_en, id_central) FROM stdin;
99	14	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
100	14	12	pack x 12 unidad	f	t	4	4	2021-12-28 18:31:32.214677+00	\N
101	7	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
102	7	12	pack x 12 unidad	f	t	4	4	2021-12-28 18:31:32.214677+00	\N
103	9	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
104	9	24	caja x 24 unidad	f	t	2	4	2021-12-28 18:31:32.214677+00	\N
105	153	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
106	153	12	CAJA X 12 UNIDAD	f	t	2	4	2021-12-28 18:31:32.214677+00	\N
107	12	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
108	12	24	caja x 24 unidad	f	t	2	4	2021-12-28 18:31:32.214677+00	\N
109	11	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
110	11	12	caja x 12 unidad	f	t	4	4	2021-12-28 18:31:32.214677+00	\N
111	21	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
112	21	12	caja x 12 unidad	f	t	2	4	2021-12-28 18:31:32.214677+00	\N
113	17	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
115	80	1	test presentacion	t	t	1	2	2021-12-28 18:31:32.214677+00	\N
116	17	6	pack x 6 unidad	f	t	4	4	2021-12-28 18:31:32.214677+00	\N
117	17	24	caja x 24 unidad	f	t	2	4	2021-12-28 18:31:32.214677+00	\N
118	80	12	test 2	f	t	2	2	2021-12-28 18:31:32.214677+00	\N
119	80	24	test 3	f	t	3	2	2021-12-28 18:31:32.214677+00	\N
31	160	1	unidad	t	t	1	1	2021-12-28 18:31:32.214677+00	\N
32	160	6	caja x 6	f	t	2	1	2021-12-28 18:31:32.214677+00	\N
33	160	24	CAJA X 24	f	t	2	1	2021-12-28 18:31:32.214677+00	\N
34	162	1	1	t	t	1	1	2021-12-28 18:31:32.214677+00	\N
68	13	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
70	26	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
71	26	24	caja x 24 unidad	f	t	2	4	2021-12-28 18:31:32.214677+00	\N
72	83	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
73	83	12	caja x 12 unidad	f	t	2	4	2021-12-28 18:31:32.214677+00	\N
78	70	1	unidad	t	t	1	1	2021-12-28 18:31:32.214677+00	\N
79	70	6	pack x 6 unidad	f	t	4	4	2021-12-28 18:31:32.214677+00	\N
81	70	24	caja x 24 unidad	f	t	2	4	2021-12-28 18:31:32.214677+00	\N
82	1	1	unidad	t	t	1	1	2021-12-28 18:31:32.214677+00	\N
83	79	1	unidAD	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
84	79	6	pack x 6 unidad	f	t	4	4	2021-12-28 18:31:32.214677+00	\N
85	79	24	caja x 24 unidad	f	t	2	4	2021-12-28 18:31:32.214677+00	\N
86	87	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
87	87	6	pack x 6 unidad	f	t	4	4	2021-12-28 18:31:32.214677+00	\N
88	15	1	unitario	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
89	15	6	caja x 6 unid	f	t	2	3	2021-12-28 18:31:32.214677+00	\N
90	87	24	CAJA X 24 UNIDAD	f	t	2	4	2021-12-28 18:31:32.214677+00	\N
91	16	1	unitario	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
92	16	12	caja x 12 unid	f	t	2	3	2021-12-28 18:31:32.214677+00	\N
93	18	1	unitario	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
94	198	1	unitario	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
95	199	1	unitario	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
98	201	1	unitario	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
120	80	10	test 4	f	t	4	2	2021-12-28 18:31:32.214677+00	\N
121	204	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
122	204	6	pack x 6 unidad	f	t	4	4	2021-12-28 18:31:32.214677+00	\N
123	204	24	caja x 24 unidad	f	t	2	4	2021-12-28 18:31:32.214677+00	\N
125	205	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
126	205	2	pack x 2 unidad	f	t	2	4	2021-12-28 18:31:32.214677+00	\N
127	1	12	pack x 12 unidad	f	t	4	4	2021-12-28 18:31:32.214677+00	\N
128	23	1	unitario	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
129	24	1	unitario	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
130	27	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
131	27	12	caja x 12 unidad	f	t	2	4	2021-12-28 18:31:32.214677+00	\N
132	25	1	unitario	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
133	206	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
134	206	12	caja x 12 unidad	f	t	2	4	2021-12-28 18:31:32.214677+00	\N
135	2	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
136	2	12	pack x 12 unidad	f	t	4	4	2021-12-28 18:31:32.214677+00	\N
137	155	1	unidad 	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
138	155	12	pack x 12 unidad	f	t	4	4	2021-12-28 18:31:32.214677+00	\N
139	156	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
140	156	12	pack x 12 unidad	f	t	4	4	2021-12-28 18:31:32.214677+00	\N
141	89	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
142	89	15	caja x 15 unidad	f	t	2	4	2021-12-28 18:31:32.214677+00	\N
143	31	1	UNIDAD	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
144	31	6	CAJA X 6 UNID	f	t	2	3	2021-12-28 18:31:32.214677+00	\N
145	90	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
146	33	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
147	33	12	caja x 12 unid	f	t	2	3	2021-12-28 18:31:32.214677+00	\N
148	90	6	pack x 6 unidad	f	t	4	4	2021-12-28 18:31:32.214677+00	\N
149	90	24	caja x 24 unidad	f	t	2	4	2021-12-28 18:31:32.214677+00	\N
150	91	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
151	91	6	pack x 6 unidad	f	t	4	4	2021-12-28 18:31:32.214677+00	\N
152	91	24	caja x 24 unidad	f	t	2	4	2021-12-28 18:31:32.214677+00	\N
153	119	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
154	119	6	pack x 6 unidad	f	t	4	4	2021-12-28 18:31:32.214677+00	\N
155	119	24	caja x 24 unidad	f	t	2	4	2021-12-28 18:31:32.214677+00	\N
156	35	1	UNIDAD	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
157	120	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
158	120	12	pack x 12 unidad	f	t	4	4	2021-12-28 18:31:32.214677+00	\N
159	130	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
160	130	15	caja x 15 unidad	f	t	2	4	2021-12-28 18:31:32.214677+00	\N
162	207	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
175	207	6	pack x 6	f	t	4	2	2021-12-28 18:31:32.214677+00	\N
176	207	24	caja x 24 unidad	f	t	2	4	2021-12-28 18:31:32.214677+00	\N
177	212	1	UNIDAD	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
178	212	12	PACK X 12 UNIDAD	f	t	4	4	2021-12-28 18:31:32.214677+00	\N
179	213	1	UNIDAD	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
180	213	12	PACK X 12 UNIDAD	f	t	4	4	2021-12-28 18:31:32.214677+00	\N
182	215	12	PACK X 12 UNIDAD	f	t	4	4	2021-12-28 18:31:32.214677+00	\N
183	215	1	UNIDAD	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
184	220	1	UNIDAD	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
185	220	12	CAJA X 12 UNIDAD	f	t	2	4	2021-12-28 18:31:32.214677+00	\N
186	221	1	UNIDAD	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
187	221	6	PACK X 6 UNIDAD	f	t	4	4	2021-12-28 18:31:32.214677+00	\N
188	221	24	CAJA X 24 UNIDAD	f	t	2	4	2021-12-28 18:31:32.214677+00	\N
189	222	1	UNIDAD	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
190	222	6	PACK X 6 UNIDAD	f	t	4	4	2021-12-28 18:31:32.214677+00	\N
191	222	24	CAJA X 24 UNIDAD	f	t	2	4	2021-12-28 18:31:32.214677+00	\N
192	224	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
193	224	12	pack x 12 unidad	f	t	4	4	2021-12-28 18:31:32.214677+00	\N
194	147	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
195	147	6	pack x 6 unidad	f	t	4	4	2021-12-28 18:31:32.214677+00	\N
196	147	24	caja x 24 unidad	f	t	2	4	2021-12-28 18:31:32.214677+00	\N
197	148	1	UNIDAD	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
198	148	12	CAJA X 12 UNIDAD	f	t	2	4	2021-12-28 18:31:32.214677+00	\N
199	149	1	UNIDAD	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
200	149	6	PACK X 6 UNIDAD	f	t	4	4	2021-12-28 18:31:32.214677+00	\N
201	149	24	CAJA X 24 UNIDAD	f	t	2	4	2021-12-28 18:31:32.214677+00	\N
202	5	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
203	5	12	caja x 12 unidad	f	t	2	4	2021-12-28 18:31:32.214677+00	\N
204	28	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
205	28	15	pack x 15 unidad	f	t	4	4	2021-12-28 18:31:32.214677+00	\N
206	29	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
207	29	6	pack x 6 unidad	f	t	4	4	2021-12-28 18:31:32.214677+00	\N
208	29	24	caja x 24 unidad	f	t	2	4	2021-12-28 18:31:32.214677+00	\N
209	30	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
210	30	6	pack x 6 unidad	f	t	4	4	2021-12-28 18:31:32.214677+00	\N
211	30	24	caja x 24 unidad	f	t	2	4	2021-12-28 18:31:32.214677+00	\N
213	225	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
214	225	12	caja x 12 unidad	f	t	2	4	2021-12-28 18:31:32.214677+00	\N
215	151	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
216	151	24	caja x 24 unidad	f	t	2	4	2021-12-28 18:31:32.214677+00	\N
217	152	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
218	152	6	pack x 6 unidad	f	t	4	4	2021-12-28 18:31:32.214677+00	\N
219	152	24	caja x 24 unidad	f	t	2	4	2021-12-28 18:31:32.214677+00	\N
220	154	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
221	154	12	pack x 12 unidad	f	t	4	4	2021-12-28 18:31:32.214677+00	\N
222	226	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
223	226	12	pack x 12 unidad	f	t	4	4	2021-12-28 18:31:32.214677+00	\N
224	227	1	unidad 	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
225	227	12	caja x 12 unidad	f	t	2	4	2021-12-28 18:31:32.214677+00	\N
226	228	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
227	228	24	caja x 24 unidad	f	t	2	4	2021-12-28 18:31:32.214677+00	\N
228	229	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
229	229	12	caja x 12 unidad	f	t	4	4	2021-12-28 18:31:32.214677+00	\N
230	230	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
231	230	24	caja x 24 unidad	f	t	2	4	2021-12-28 18:31:32.214677+00	\N
232	52	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
233	52	6	pack x 6 unidad	f	t	4	4	2021-12-28 18:31:32.214677+00	\N
234	52	24	caja x 24 unidad	f	t	2	4	2021-12-28 18:31:32.214677+00	\N
235	53	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
236	53	6	caja x 6 unidad	f	t	2	4	2021-12-28 18:31:32.214677+00	\N
237	53	12	caja x 12 unidad	f	t	3	4	2021-12-28 18:31:32.214677+00	\N
238	54	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
239	54	12	pack x 12 unidad	f	t	4	4	2021-12-28 18:31:32.214677+00	\N
240	57	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
241	57	24	caja x 24 unidad	f	t	2	4	2021-12-28 18:31:32.214677+00	\N
242	61	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
243	61	12	caja x 12 unidad	f	t	2	4	2021-12-28 18:31:32.214677+00	\N
244	63	1	unidad 	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
245	63	12	pack x 12 unidad	f	t	4	4	2021-12-28 18:31:32.214677+00	\N
246	145	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
247	145	12	pack x 12 unidad	f	t	4	4	2021-12-28 18:31:32.214677+00	\N
248	146	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
249	146	12	pack x 12 unidad	f	t	4	4	2021-12-28 18:31:32.214677+00	\N
250	150	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
251	150	12	CAJA X 12 UNIDAD	f	t	2	4	2021-12-28 18:31:32.214677+00	\N
252	231	1	unidad 	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
253	231	12	pack x 12 unidad	f	t	4	4	2021-12-28 18:31:32.214677+00	\N
254	232	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
255	232	6	pack x 6 unidad	f	t	4	4	2021-12-28 18:31:32.214677+00	\N
256	232	12	caja x 12 unidad	f	t	2	4	2021-12-28 18:31:32.214677+00	\N
257	235	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
258	235	6	caja x 6 unidad	f	t	2	4	2021-12-28 18:31:32.214677+00	\N
259	236	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
260	236	12	pack x 12 unidad	f	t	4	4	2021-12-28 18:31:32.214677+00	\N
261	238	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
262	238	11	pack x 12 unidad	f	t	4	4	2021-12-28 18:31:32.214677+00	\N
263	157	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
265	158	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
266	158	12	pack x 12 uniDAD	f	t	4	4	2021-12-28 18:31:32.214677+00	\N
267	159	1	unidad 	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
268	159	12	pack x 12 unidad	f	t	4	4	2021-12-28 18:31:32.214677+00	\N
269	239	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
270	239	12	pack x 12 unidad	f	t	4	4	2021-12-28 18:31:32.214677+00	\N
341	241	1	UNIDAD	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
342	241	6	PACK X 6 UNIDAD	f	t	4	4	2021-12-28 18:31:32.214677+00	\N
343	242	1	UNIDAD	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
344	242	6	PACK X 6 UNIDAD	f	t	4	4	2021-12-28 18:31:32.214677+00	\N
345	243	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
346	243	6	pack x 6 unidad	f	t	4	4	2021-12-28 18:31:32.214677+00	\N
347	244	1	unidad 	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
348	244	12	pack x 12 unidad	f	t	1	4	2021-12-28 18:31:32.214677+00	\N
349	245	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
350	245	4	pack x 4 unidad	f	t	4	4	2021-12-28 18:31:32.214677+00	\N
351	246	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
352	246	6	pack x 6 unidad	f	t	4	4	2021-12-28 18:31:32.214677+00	\N
353	246	24	caja x 24 unidad	f	t	2	4	2021-12-28 18:31:32.214677+00	\N
354	247	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
355	247	6	pack x 6 unidad	f	t	4	4	2021-12-28 18:31:32.214677+00	\N
356	247	24	caja x 24 unidad	f	t	2	4	2021-12-28 18:31:32.214677+00	\N
357	248	1	UNIDAD	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
358	248	6	PACK X 6 UNIDAD	f	t	4	4	2021-12-28 18:31:32.214677+00	\N
359	248	24	CAJA X 24 UNIDAD	f	t	2	4	2021-12-28 18:31:32.214677+00	\N
361	249	6	PACK X 6 UNIDAD	f	t	4	4	2021-12-28 18:31:32.214677+00	\N
362	249	24	CAJA X 24 UNIDAD	f	t	2	4	2021-12-28 18:31:32.214677+00	\N
363	249	1	UNIDAD 	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
364	250	1	UNIDAD	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
365	250	6	PACK X 6 UNIDAD	f	t	4	4	2021-12-28 18:31:32.214677+00	\N
366	250	24	CAJA X 24 UNIDAD	f	t	2	4	2021-12-28 18:31:32.214677+00	\N
367	251	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
368	251	6	pack x 6 unidad	f	t	4	4	2021-12-28 18:31:32.214677+00	\N
369	251	24	caja x 24 unidad	f	t	2	4	2021-12-28 18:31:32.214677+00	\N
370	252	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
371	252	24	caja x 24 unidad	f	t	2	4	2021-12-28 18:31:32.214677+00	\N
372	253	1	UNIDAD	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
373	253	12	PACK X 12 UNIDAD	f	t	4	4	2021-12-28 18:31:32.214677+00	\N
374	254	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
375	254	4	pack x 4 unidad	f	t	4	4	2021-12-28 18:31:32.214677+00	\N
376	254	24	caja x 24 unidad	f	t	2	4	2021-12-28 18:31:32.214677+00	\N
377	255	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
378	255	4	PACK X 4 UNIDAD	f	t	4	4	2021-12-28 18:31:32.214677+00	\N
379	255	24	CAJA X 24 UNIDAD	f	t	2	4	2021-12-28 18:31:32.214677+00	\N
380	256	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
381	256	4	pack x 4 unidad	f	t	4	4	2021-12-28 18:31:32.214677+00	\N
382	256	24	caja x 24 unidad	f	t	2	4	2021-12-28 18:31:32.214677+00	\N
383	257	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
384	257	4	pack x 4 unidad	f	t	4	4	2021-12-28 18:31:32.214677+00	\N
385	257	24	caja x 24 unidad	f	t	2	4	2021-12-28 18:31:32.214677+00	\N
386	258	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
387	258	6	pack x 6 unidad	f	t	4	4	2021-12-28 18:31:32.214677+00	\N
388	259	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
389	259	12	caja x 12 unidad	f	t	2	4	2021-12-28 18:31:32.214677+00	\N
390	261	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
391	261	24	caja x 24 unidad	f	t	2	4	2021-12-28 18:31:32.214677+00	\N
392	123	1	UNIDAD	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
393	262	1	UNIDAD	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
394	263	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
395	263	12	caja x 12 unidad	f	t	2	4	2021-12-28 18:31:32.214677+00	\N
396	264	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
397	264	6	caja x 6 unidad	f	t	2	4	2021-12-28 18:31:32.214677+00	\N
398	265	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
399	266	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
400	105	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
401	267	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
402	268	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
403	269	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
404	269	6	caja x 6 unidad	f	t	2	4	2021-12-28 18:31:32.214677+00	\N
405	270	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
406	270	6	pack x 6 unidad	f	t	4	4	2021-12-28 18:31:32.214677+00	\N
407	271	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
408	271	6	pack x 6 unidad	f	t	4	4	2021-12-28 18:31:32.214677+00	\N
409	272	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
410	273	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
411	274	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
425	284	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
412	275	1	unidad	t	t	2	4	2021-12-28 18:31:32.214677+00	\N
413	276	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
414	277	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
416	278	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
426	285	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
417	278	12	pack x 12 unidad	f	t	4	4	2021-12-28 18:31:32.214677+00	\N
418	279	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
419	279	20	pack x 20 unidad	f	t	1	4	2021-12-28 18:31:32.214677+00	\N
420	280	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
422	281	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
423	282	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
424	283	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
427	286	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
428	287	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
429	288	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
430	289	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
431	290	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
432	291	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
433	292	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
434	293	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
435	294	1	UNIDAD	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
436	295	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
437	295	12	caja x 12 unidad	f	t	2	4	2021-12-28 18:31:32.214677+00	\N
421	280	12	caja x 12	f	t	2	4	\N	\N
438	296	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
440	297	1	unidad	t	t	\N	4	2021-12-28 18:31:32.214677+00	\N
441	298	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
442	298	10	caja x 10 unidad	f	t	1	4	2021-12-28 18:31:32.214677+00	\N
443	299	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
444	299	10	caja x 10 unidad	f	t	1	4	2021-12-28 18:31:32.214677+00	\N
445	300	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
446	301	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
447	301	6	pack x 6 unidad	f	t	4	4	2021-12-28 18:31:32.214677+00	\N
448	302	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
449	302	6	pack x 6 unidad	f	t	4	4	2021-12-28 18:31:32.214677+00	\N
450	303	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
452	305	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
453	306	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
454	307	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
455	308	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
456	309	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
457	310	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
458	311	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
459	312	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
460	313	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
461	313	30	caja x 30 unidad	f	t	2	4	2021-12-28 18:31:32.214677+00	\N
462	314	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
463	315	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
464	316	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
465	316	4	pack x 4 unidad	f	t	4	4	2021-12-28 18:31:32.214677+00	\N
466	317	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
467	317	4	pack x 4 unidad	f	t	1	4	2021-12-28 18:31:32.214677+00	\N
468	318	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
469	318	4	pack x 4 unidad	f	t	1	4	2021-12-28 18:31:32.214677+00	\N
470	319	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
471	319	12	pack x 12 unidad	f	t	1	4	2021-12-28 18:31:32.214677+00	\N
472	320	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
473	321	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
474	322	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
475	323	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
476	324	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
477	324	6	pack x 6 unidad	f	t	4	3	2021-12-28 18:31:32.214677+00	\N
478	325	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
479	326	1	UNIDAD	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
480	328	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
481	328	6	pack x 6 unidad	f	t	4	3	2021-12-28 18:31:32.214677+00	\N
482	329	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
483	329	12	caja x 12unid	f	t	2	3	2021-12-28 18:31:32.214677+00	\N
484	327	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
485	330	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
486	331	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
487	331	6	pack x 6 unidad 	f	t	4	4	2021-12-28 18:31:32.214677+00	\N
488	332	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
489	332	12	caja x 12unidades	f	t	2	3	2021-12-28 18:31:32.214677+00	\N
490	6	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
491	6	6	caja x 6 unidades	f	t	2	3	2021-12-28 18:31:32.214677+00	\N
492	8	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
493	8	12	caja x 12 unidades	f	t	2	3	2021-12-28 18:31:32.214677+00	\N
494	333	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
495	335	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
496	334	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
497	336	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
498	337	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
499	338	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
500	339	1	UNIDAD	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
501	340	1	UNIDAD	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
502	341	1	UNIDAD	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
503	343	1	UNIDAD	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
504	342	1	UNIDAD	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
505	344	1	UNIDAD	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
506	345	1	UNIDAD	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
507	346	1	UNIDAD	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
508	346	12	CAJA X 12 UNIDADES	f	t	2	3	2021-12-28 18:31:32.214677+00	\N
509	347	1	UNIDAD	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
510	348	1	UNIDAD	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
511	349	1	UNIDAD	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
512	350	1	UNIDAD	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
513	351	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
514	352	1	UNIDAD	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
515	353	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
516	354	1	UNIDAD	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
517	355	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
518	356	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
519	357	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
520	358	1	UNIDAD	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
521	359	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
522	360	1	UNIDAD	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
523	361	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
524	362	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
525	363	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
526	364	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
527	365	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
528	366	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
529	367	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
530	368	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
531	369	1	UNIADAD 	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
532	370	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
533	371	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
535	372	1	UNIDAD	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
536	373	1	UNIDAD	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
537	374	1	UNIDAD	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
538	375	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
539	376	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
540	377	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
541	378	1	UNIDAD	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
542	379	1	UNIDAD	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
543	380	1	UNIDAD	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
544	381	1	UNIDAD	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
545	382	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
546	383	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
547	384	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
548	385	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
549	386	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
550	387	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
551	388	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
552	389	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
553	390	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
554	391	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
555	392	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
556	393	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
557	394	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
558	395	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
559	396	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
560	397	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
561	398	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
562	399	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
563	400	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
564	401	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
565	402	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
566	403	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
567	404	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
568	405	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
569	406	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
570	102	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
571	407	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
572	408	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
573	409	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
574	410	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
575	411	1	UNIDAD	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
576	412	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
577	413	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
578	414	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
579	415	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
580	107	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
581	59	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
582	416	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
583	60	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
584	417	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
585	104	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
586	418	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
587	418	10	breza x 10 unidad	f	t	2	4	2021-12-28 18:31:32.214677+00	\N
588	419	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
589	420	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
590	421	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
591	422	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
592	423	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
593	423	20	breza x 20 unidad	f	t	2	4	2021-12-28 18:31:32.214677+00	\N
594	424	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
595	424	1	breza x 10 unidad	f	t	2	4	2021-12-28 18:31:32.214677+00	\N
596	425	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
597	425	10	breza x 10 unidad	f	t	1	4	2021-12-28 18:31:32.214677+00	\N
598	426	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
599	427	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
600	428	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
601	428	10	breza x 10 unidad	f	t	1	4	2021-12-28 18:31:32.214677+00	\N
602	429	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
603	430	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
604	431	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
605	431	10	breza x 10 unidad	f	t	1	4	2021-12-28 18:31:32.214677+00	\N
606	432	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
607	433	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
608	434	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
609	433	1	breza x 10 unidad	f	t	1	4	2021-12-28 18:31:32.214677+00	\N
610	435	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
612	437	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
613	438	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
614	436	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
615	436	10	breza x 10 unidad	f	t	1	4	2021-12-28 18:31:32.214677+00	\N
616	439	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
617	440	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
618	440	10	breza x 10 unidad	f	t	1	4	2021-12-28 18:31:32.214677+00	\N
619	441	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
621	442	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
622	443	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
623	444	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
624	444	10	breza x 10 unidad	f	t	2	4	2021-12-28 18:31:32.214677+00	\N
625	445	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
626	446	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
627	446	10	breza x 10 unidad	f	t	1	4	2021-12-28 18:31:32.214677+00	\N
628	447	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
629	448	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
630	448	10	breza x 10 unidad	f	t	2	4	2021-12-28 18:31:32.214677+00	\N
631	449	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
632	449	10	breza x 10 unidad	f	t	1	4	2021-12-28 18:31:32.214677+00	\N
633	450	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
634	451	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
635	451	12	pack x 12 unidad	f	t	4	4	2021-12-28 18:31:32.214677+00	\N
636	452	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
637	453	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
638	139	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
639	454	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
640	455	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
641	456	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
642	457	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
643	457	6	pack x 6 unidad	f	t	4	4	2021-12-28 18:31:32.214677+00	\N
645	458	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
646	459	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
647	84	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
648	96	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
649	97	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
650	460	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
651	460	12	caja x 12 unidad	f	t	2	4	2021-12-28 18:31:32.214677+00	\N
652	133	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
653	133	12	pack x 12 unidad	f	t	4	4	2021-12-28 18:31:32.214677+00	\N
654	461	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
655	462	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
656	463	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
657	464	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
658	464	6	pack x 6 unidad	f	t	4	4	2021-12-28 18:31:32.214677+00	\N
659	465	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
660	466	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
661	467	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
662	468	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
663	469	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
664	470	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
665	471	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
666	472	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
667	472	12	Pack x 12 unidad	f	t	4	4	2021-12-28 18:31:32.214677+00	\N
668	473	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
669	474	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
670	474	6	pack x 6 unidad	f	t	4	4	2021-12-28 18:31:32.214677+00	\N
671	475	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
672	476	1	UNIDAD	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
673	477	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
674	476	15	PACK X 15 UNIDAD	f	t	4	4	2021-12-28 18:31:32.214677+00	\N
675	478	1	UNIDAD	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
676	478	6	PACK X 6 UNIDAD	f	t	4	4	2021-12-28 18:31:32.214677+00	\N
677	479	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
678	480	1	unidad	t	t	1	4	2021-12-28 18:31:32.214677+00	\N
679	480	6	pack x 6 unidad	f	t	4	4	2021-12-28 18:31:32.214677+00	\N
680	481	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
681	482	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
682	482	12	CAJA X 12 UNID	f	t	1	3	2021-12-28 18:31:32.214677+00	\N
683	483	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
684	483	12	CAJA X 12 UNIDADES	f	t	2	3	2021-12-28 18:31:32.214677+00	\N
685	484	1	UNIDAD	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
686	485	1	UNIDAD	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
687	486	1	UNIDAD	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
688	487	1	UNIDAD	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
689	488	1	UNIDAD	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
690	489	1	UNIDAD	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
691	490	1	UNIDAD	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
692	491	1	UNIDAD	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
693	492	1	UNIDAD	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
694	492	6	pack x 6 unidades	f	t	1	3	2021-12-28 18:31:32.214677+00	\N
695	493	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
696	493	6	pack x 6 unidades	f	t	1	3	2021-12-28 18:31:32.214677+00	\N
697	494	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
698	494	6	caja x 6 unidades	f	t	1	3	2021-12-28 18:31:32.214677+00	\N
699	495	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
700	496	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
701	497	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
702	498	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
703	499	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
704	500	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
705	501	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
706	502	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
707	503	1	unidad	t	t	1	3	2021-12-28 18:31:32.214677+00	\N
708	504	1	unidad	t	t	1	4	\N	\N
709	505	1	unidad	t	t	1	4	\N	\N
710	506	1	unidad	t	t	1	4	\N	\N
711	507	1	unidad	t	t	1	4	\N	\N
712	508	1	unidad	t	t	1	4	\N	\N
713	509	1	unidad	t	t	1	4	\N	\N
714	510	1	unidad	t	t	1	4	\N	\N
715	511	1	unidad	t	t	1	4	\N	\N
716	512	1	unidad	t	t	1	4	\N	\N
717	513	1	unidad	t	t	1	4	\N	\N
718	514	1	unidad	t	t	1	4	\N	\N
719	515	1	unidad	t	t	1	4	\N	\N
720	516	1	unidad	t	t	1	4	\N	\N
721	517	1	unidad	t	t	1	4	\N	\N
722	518	1	unidad	t	t	1	4	\N	\N
723	519	1	unidad	t	t	1	4	\N	\N
724	520	1	unidad	t	t	1	4	\N	\N
725	521	1	unidad	t	t	1	4	\N	\N
726	522	1	unidad	t	t	1	4	\N	\N
727	523	1	unidad	t	t	1	4	\N	\N
728	524	1	unidad	t	t	1	4	\N	\N
729	525	1	unidad	t	t	1	4	\N	\N
730	526	1	unidad	t	t	1	4	\N	\N
731	527	1	unidad	t	t	1	4	\N	\N
732	528	1	unidad	t	t	1	4	\N	\N
733	529	1	unidad	t	t	1	4	\N	\N
734	530	1	unidad	t	t	1	4	\N	\N
735	531	1	unidad	t	t	1	4	\N	\N
736	532	1	unidad	t	t	1	4	\N	\N
737	533	1	unidad	t	t	1	4	\N	\N
738	534	1	unidad	t	t	1	4	\N	\N
739	535	1	unidad	t	t	1	4	\N	\N
740	536	1	unidad	t	t	1	4	\N	\N
741	537	1	unidad	t	t	1	4	\N	\N
742	538	1	unidad	t	t	1	4	\N	\N
743	539	1	unidad	t	t	1	4	\N	\N
744	540	1	unidad	t	t	1	4	\N	\N
745	541	1	unidad	t	t	1	4	\N	\N
746	542	1	unidad	t	t	1	4	\N	\N
747	543	1	unidad	t	t	1	4	\N	\N
748	544	1	unidad	t	t	1	4	\N	\N
749	545	1	unidad	t	t	1	4	\N	\N
750	546	1	unidad	t	t	1	4	\N	\N
751	547	1	unidad	t	t	1	4	\N	\N
752	548	1	unidad	t	t	1	4	\N	\N
753	549	1	unidad	t	t	1	4	\N	\N
754	550	1	unidad	t	t	1	4	\N	\N
755	551	1	unidad	t	t	1	4	\N	\N
756	552	1	unidad	t	t	1	4	\N	\N
757	553	1	unidad	t	t	1	4	\N	\N
758	554	1	unidad	t	t	1	4	\N	\N
759	555	1	unidad	t	t	1	4	\N	\N
760	556	1	unidad	t	t	1	4	\N	\N
761	557	1	unidad	t	t	1	4	\N	\N
762	558	1	unidad	t	t	1	4	\N	\N
763	559	1	unidad	t	t	1	4	\N	\N
764	560	1	unidad	t	t	1	4	\N	\N
765	561	1	unidad	t	t	1	4	\N	\N
766	562	1	unidad	t	t	1	4	\N	\N
767	563	1	unidad	t	t	1	4	\N	\N
768	564	1	unidad	t	t	1	4	\N	\N
769	565	1	unidad	t	t	1	4	\N	\N
770	566	1	unidad	t	t	1	4	\N	\N
771	567	1	unidad	t	t	1	4	\N	\N
772	568	1	unidad	t	t	1	4	\N	\N
773	569	1	unidad	t	t	1	4	\N	\N
774	570	1	unidad	t	t	1	4	\N	\N
775	571	1	unidad	t	t	1	4	\N	\N
776	572	1	unidad	t	t	1	4	\N	\N
777	573	1	unidad	t	t	1	4	\N	\N
778	574	1	unidad	t	t	1	4	\N	\N
779	575	1	unidad	t	t	1	4	\N	\N
780	576	1	unidad	t	t	1	4	\N	\N
781	577	1	unidad	t	t	1	4	\N	\N
782	578	1	unidad	t	t	1	4	\N	\N
783	579	1	unidad	t	t	1	4	\N	\N
784	580	1	unidad	t	t	1	4	\N	\N
785	581	1	unidad	t	t	1	4	\N	\N
786	582	1	unidad	t	t	1	4	\N	\N
787	583	1	unidad	t	t	1	4	\N	\N
788	584	1	unidad	t	t	1	4	\N	\N
789	585	1	unidad	t	t	1	4	\N	\N
790	586	1	unidad	t	t	1	4	\N	\N
791	587	1	unidad	t	t	1	4	\N	\N
792	588	1	unidad	t	t	1	4	\N	\N
793	589	1	unidad	t	t	1	4	\N	\N
794	590	1	unidad	t	t	1	4	\N	\N
795	591	1	unidad	t	t	1	4	\N	\N
796	592	1	unidad	t	t	1	4	\N	\N
797	593	1	unidad	t	t	1	4	\N	\N
798	594	1	unidad	t	t	1	4	\N	\N
799	595	1	unidad	t	t	1	4	\N	\N
803	596	1	caja x 12 unidades	f	t	2	4	\N	\N
802	596	1	unidad	t	t	1	4	\N	\N
439	296	12	caja x 12 unidad	f	t	2	4	\N	\N
800	595	12	caja x 12 unidades	f	t	2	4	\N	\N
804	597	1	unidad	t	t	1	4	\N	\N
805	597	12	CAJA X 12 UNIDADES	f	t	2	4	\N	\N
806	598	1	UNIDAD	t	t	1	4	\N	\N
807	599	1	UNIDAD	t	t	1	4	\N	\N
808	600	1	UNIDAD	t	t	1	4	\N	\N
809	601	1	UNIDAD	t	t	1	4	\N	\N
810	602	1	UNIDAD	t	t	1	4	\N	\N
811	603	1	UNIDAD	t	t	1	4	\N	\N
812	604	1	UNIDAD	t	t	1	4	\N	\N
813	605	1	UNIDAD	t	t	1	4	\N	\N
815	606	1	UNIDAD	t	t	1	4	\N	\N
816	607	1	UNIDAD	t	t	1	4	\N	\N
817	608	1	UNIDAD	t	t	1	4	\N	\N
818	609	1	UNIDAD	t	t	1	4	\N	\N
819	610	1	UNIDAD	t	t	1	4	\N	\N
820	611	1	UNIDAD	t	t	1	4	\N	\N
821	612	1	UNIDAD	t	t	1	4	\N	\N
822	613	1	UNIDAD	t	t	1	4	\N	\N
823	614	1	UNIDAD	t	t	1	4	\N	\N
824	615	1	UNIDAD	t	t	1	4	\N	\N
825	616	1	UNIDAD	t	t	1	4	\N	\N
826	617	1	UNIDAD	t	t	1	4	\N	\N
827	618	1	UNIDAD	t	t	1	4	\N	\N
828	619	1	UNIDAD	t	t	1	4	\N	\N
829	620	1	UNIDAD	t	t	1	4	\N	\N
830	621	1	UNIDAD	t	t	1	4	\N	\N
831	622	1	UNIDAD	t	t	1	4	\N	\N
832	623	1	UNIDAD	t	t	1	4	\N	\N
833	624	1	UNIDAD	t	t	1	4	\N	\N
834	625	1	UNIDAD	t	t	1	4	\N	\N
835	626	1	UNIDAD	t	t	1	4	\N	\N
836	627	1	UNIDAD	t	t	1	4	\N	\N
837	628	1	UNIDAD	t	t	1	4	\N	\N
838	629	1	UNIDAD	t	t	1	4	\N	\N
839	630	1	UNIDAD	t	t	1	4	\N	\N
840	631	1	UNIDAD	t	t	1	4	\N	\N
841	632	1	UNIDAD	t	t	1	4	\N	\N
842	633	1	UNIDAD	t	t	1	4	\N	\N
843	634	1	UNIDAD	t	t	1	4	\N	\N
844	635	1	UNIDAD	t	t	1	4	\N	\N
845	636	1	UNIDAD	t	t	1	4	\N	\N
846	637	1	UNIDAD	t	t	1	4	\N	\N
847	637	12	CAJA X 12	f	t	2	4	\N	\N
848	638	1	UNIDAD	t	t	1	4	\N	\N
849	638	12	CAJA X 12	f	t	2	4	\N	\N
850	639	1	UNIDAD	t	t	1	4	\N	\N
851	639	1	CAJA X 12	f	t	2	4	\N	\N
852	640	1	UNIDAD	t	t	1	4	\N	\N
853	640	12	CAJA X 12	f	t	2	4	\N	\N
854	641	1	UNIDAD	t	t	1	4	\N	\N
855	641	12	CAJA X 12	f	t	2	4	\N	\N
856	642	1	UNIDAD	t	t	1	4	\N	\N
857	642	40	CAJA X 40	f	t	2	4	\N	\N
858	643	1	UNIDAD	t	t	1	4	\N	\N
859	643	40	CAJA X 40	f	t	2	4	\N	\N
860	644	1	unidad	t	t	1	4	\N	\N
861	644	40	caja x 40	f	t	2	4	\N	\N
862	645	1	unidad	t	t	1	4	\N	\N
863	645	40	caja x 40	f	t	2	4	\N	\N
415	277	40	caja x 40 unidad	f	t	4	4	\N	\N
865	646	1	unidad	t	t	1	4	\N	\N
866	646	40	caja x 40	f	t	2	4	\N	\N
867	647	1	unidad	t	t	1	4	\N	\N
868	647	12	caja x 12	f	t	2	4	\N	\N
869	648	1	unidad	t	t	1	4	\N	\N
870	648	12	caja x 12	f	t	2	4	\N	\N
871	649	1	UNIDAD	t	t	1	4	\N	\N
872	649	12	CAJA X 12	f	t	2	4	\N	\N
873	650	1	UNIDAD	t	t	1	4	\N	\N
874	651	1	UNIDAD	t	t	1	4	\N	\N
875	652	1	UNIDAD	t	t	1	4	\N	\N
876	653	1	UNIDAD	t	t	1	4	\N	\N
877	654	1	UNIDAD	t	t	1	4	\N	\N
878	655	1	UNIDAD	t	t	1	4	\N	\N
879	656	1	UNIDAD	t	t	1	4	\N	\N
880	657	1	UNIDAD	t	t	1	4	\N	\N
881	658	1	UNIDAD	t	t	1	4	\N	\N
882	659	1	UNIDAD	t	t	1	4	\N	\N
883	660	1	UNIDAD	t	t	1	4	\N	\N
884	661	1	UNIDAD	t	t	1	4	\N	\N
885	662	1	UNIDAD	t	t	1	4	\N	\N
886	663	1	UNIDAD	t	t	1	4	\N	\N
887	663	12	CAJA X 12	f	t	2	4	\N	\N
888	664	48	CAJA X 48	f	t	2	4	\N	\N
889	665	1	UNIDAD	t	t	1	4	\N	\N
890	665	24	CAJA X 24	f	t	2	4	\N	\N
891	666	1	UNIDAD	t	t	1	4	\N	\N
892	666	16	CAJA X 16	f	t	2	4	\N	\N
893	667	1	UNIDAD	t	t	1	4	\N	\N
894	667	24	CAJA X 24	f	t	2	4	\N	\N
895	668	1	UNIDAD	t	t	1	4	\N	\N
897	669	1	UNIDAD	t	t	1	4	\N	\N
898	669	16	CAJA X 16	f	t	2	4	\N	\N
899	670	1	UNIDAD	t	t	1	4	\N	\N
900	670	16	CAJA X 16	f	t	2	4	\N	\N
901	671	1	UNIDAD	t	t	1	4	\N	\N
902	672	1	UNIDAD	t	t	1	4	\N	\N
903	673	1	UNIDAD	t	t	1	4	\N	\N
904	674	1	UNIDAD	t	t	1	4	\N	\N
905	675	1	UNIDAD	t	t	1	4	\N	\N
906	676	1	UNIDAD	t	t	1	4	\N	\N
907	676	12	CAJA X 12	f	t	2	4	\N	\N
908	677	1	UNIDAD	t	t	1	4	\N	\N
909	677	12	CAJA X 12	f	t	2	4	\N	\N
910	678	1	UNIDAD	t	t	1	4	\N	\N
911	678	12	CAJA X 12	f	t	2	4	\N	\N
912	679	1	unidad	t	t	1	4	\N	\N
913	679	12	caja x 12	f	t	1	4	\N	\N
914	680	1	unidad	t	t	1	4	\N	\N
915	680	12	caja x 12	f	t	2	4	\N	\N
916	681	1	unidad	t	t	1	4	\N	\N
917	681	21	caja x 21	f	t	2	4	\N	\N
918	682	1	unidad	t	t	1	4	\N	\N
919	682	21	caja x 21	f	t	2	4	\N	\N
920	683	1	unidad	t	t	1	4	\N	\N
921	683	21	caja x 21	f	t	2	4	\N	\N
923	684	1	unidad	t	t	1	4	\N	\N
924	684	20	caja x 20	f	t	2	4	\N	\N
925	685	1	unidad	t	t	1	4	\N	\N
926	685	20	caja x 20	f	t	2	4	\N	\N
927	686	1	unidad	t	t	1	4	\N	\N
928	686	20	caja x 20	f	t	2	4	\N	\N
929	687	1	unidad	t	t	1	4	\N	\N
930	687	16	caja x 16	f	t	2	4	\N	\N
931	688	1	unidad	t	t	1	4	\N	\N
932	688	16	caja x 16	f	t	2	4	\N	\N
933	689	1	unidad	t	t	1	4	\N	\N
934	689	16	caja x 16	f	t	2	4	\N	\N
935	690	1	unidad	t	t	1	4	\N	\N
936	690	12	caja x 12	f	t	2	4	\N	\N
937	691	1	unidad	t	t	1	4	\N	\N
938	691	12	caja x 12	f	t	2	4	\N	\N
939	692	1	unidad	t	t	1	4	\N	\N
940	692	20	caja x 20	f	t	2	4	\N	\N
941	693	1	unidad	t	t	1	4	\N	\N
942	693	20	caja x 20	f	t	2	4	\N	\N
943	694	1	unidad	t	t	1	4	\N	\N
944	694	20	caja x 20	f	t	2	4	\N	\N
945	695	1	unidad	t	t	1	4	\N	\N
946	695	15	caja x 15	f	t	2	4	\N	\N
947	696	1	unidad	t	t	1	4	\N	\N
948	696	12	caja x 12	f	t	2	4	\N	\N
949	697	1	unidad	t	t	1	4	\N	\N
950	697	21	caja x 21	f	t	2	4	\N	\N
951	698	1	unidad	t	t	1	4	\N	\N
952	698	21	caja x 21	f	t	2	4	\N	\N
953	699	1	unidad	t	t	1	4	\N	\N
954	699	21	caja x 21	f	t	2	4	\N	\N
955	700	1	unidad	t	t	1	4	\N	\N
956	700	21	caja x 21	f	t	2	4	\N	\N
957	701	1	unidad	t	t	1	4	\N	\N
958	701	21	caja x 21	f	t	2	4	\N	\N
960	702	1	unidad	t	t	1	4	\N	\N
961	702	21	caja x 21	f	t	2	4	\N	\N
994	703	1	UNIDAD	t	t	1	4	\N	\N
995	703	15	CAJA X 15	f	t	2	4	\N	\N
996	704	1	UNIDAD	t	t	1	4	\N	\N
997	704	6	CAJA X 6	f	t	2	4	\N	\N
998	705	1	UNIDAD	t	t	1	4	\N	\N
999	706	1	UNIDAD	t	t	1	4	\N	\N
1000	707	1	UNIDAD	t	t	1	4	\N	\N
1001	708	1	UNIDAD	t	t	1	4	\N	\N
1002	709	1	UNIDAD	t	t	1	4	\N	\N
1003	710	1	unidad	t	t	1	4	\N	\N
1004	711	1	unidad	t	t	1	4	\N	\N
1005	712	1	unidad	t	t	1	4	\N	\N
1006	713	1	unidad	t	t	1	4	\N	\N
1007	714	1	unidad	t	t	1	4	\N	\N
1008	715	1	unidad	t	t	1	4	\N	\N
1009	716	1	unidad	t	t	1	4	\N	\N
1010	717	1	unidad	t	t	1	4	\N	\N
1011	718	1	unidad	t	t	1	4	\N	\N
1012	719	1	unidad	t	t	1	4	\N	\N
1013	720	1	unidad	t	t	1	4	\N	\N
1014	721	1	unidad	t	t	1	4	\N	\N
1015	722	1	unidad	t	t	1	4	\N	\N
1016	723	1	unidad	t	t	1	4	\N	\N
1017	724	1	unidad	t	t	1	4	\N	\N
1018	725	1	uinidad	t	t	1	4	\N	\N
1019	726	1	unidad	t	t	1	4	\N	\N
1020	727	1	unidad	t	t	1	4	\N	\N
1021	728	1	unidad	t	t	1	4	\N	\N
1022	729	1	unidad	t	t	1	4	\N	\N
1023	730	1	unidad	t	t	1	4	\N	\N
1024	122	1	unidad	t	t	1	4	\N	\N
1025	112	1	unidad	t	t	1	4	\N	\N
1026	113	1	unidad	t	t	1	4	\N	\N
1027	111	1	unidad	t	t	1	4	\N	\N
1028	114	1	unidad	t	t	1	4	\N	\N
1029	115	1	unidad	t	t	1	4	\N	\N
1030	117	1	unidad	t	t	1	4	\N	\N
1031	116	1	unidad	t	t	1	4	\N	\N
1032	118	1	unidad	t	t	1	4	\N	\N
1033	46	1	unidad	t	t	1	4	\N	\N
1034	47	1	unidad	t	t	1	4	\N	\N
1035	48	1	unidad	t	t	1	4	\N	\N
1036	40	1	unidad	t	t	1	4	\N	\N
1037	41	1	unidad	t	t	1	4	\N	\N
1038	731	1	unidad	t	t	1	4	\N	\N
1039	732	1	unidad	t	t	1	4	\N	\N
1040	733	1	unidad	t	t	1	4	\N	\N
1041	124	1	unidad	t	t	1	4	\N	\N
1042	734	1	unidad	t	t	1	4	\N	\N
1043	735	1	unidad	t	t	1	4	\N	\N
1044	736	1	unidad	t	t	1	4	\N	\N
1045	737	1	unidad	t	t	1	4	\N	\N
1046	103	1	unidad	t	t	1	4	\N	\N
1047	101	1	unidad	t	t	1	4	\N	\N
1048	738	1	unidad	t	t	1	4	\N	\N
1049	739	1	unidad	t	t	1	4	\N	\N
1050	740	1	unidad	t	t	1	4	\N	\N
1051	741	1	unidad	t	t	1	4	\N	\N
1052	134	1	unidad	t	t	1	4	\N	\N
1053	137	1	unidad	t	t	1	4	\N	\N
1054	742	1	unidad	t	t	1	4	\N	\N
1055	125	1	unidad	t	t	1	4	\N	\N
1056	126	1	unidad	t	t	1	4	\N	\N
1057	743	1	unidad	t	t	1	4	\N	\N
1058	744	1	unidad	t	t	1	4	\N	\N
1059	745	1	unidad	t	t	1	4	\N	\N
1060	746	1	unidad	t	t	1	4	\N	\N
1061	747	1	unidad	t	t	1	4	\N	\N
1062	141	1	unidad	t	t	1	4	\N	\N
1063	748	1	unidad	t	t	1	4	\N	\N
1064	749	1	unidad	t	t	1	4	\N	\N
1065	750	1	unidad	t	t	1	4	\N	\N
1066	751	1	unidad	t	t	1	4	\N	\N
1068	752	1	unidad	t	t	1	4	\N	\N
1069	753	1	unidad	t	t	1	4	\N	\N
1070	754	1	unidad	t	t	1	4	\N	\N
1071	755	1	unidad	t	t	1	4	\N	\N
1072	756	1	unidad	t	t	1	4	\N	\N
1073	757	1	unidad	t	t	1	4	\N	\N
1074	758	1	unidad	t	t	1	4	\N	\N
1075	759	1	unidad	t	t	1	4	\N	\N
1076	760	1	unidad	t	t	1	4	\N	\N
1077	761	1	unidad	t	t	1	4	\N	\N
1078	762	1	UNIDAD	t	t	1	4	\N	\N
1079	763	1	unidad	t	t	1	4	\N	\N
1080	763	10	caja x 10	f	t	2	4	\N	\N
1081	764	1	unidad	t	t	1	4	\N	\N
1082	764	10	caja x 10	f	t	2	4	\N	\N
1083	765	1	unidad	t	t	1	4	\N	\N
1084	765	10	caja x 10	f	t	2	4	\N	\N
1085	766	1	unidad	t	t	1	4	\N	\N
1086	766	10	caja x 10	f	t	2	4	\N	\N
1087	767	1	unidad	t	t	1	4	\N	\N
1088	767	10	caja x 10	f	t	2	4	\N	\N
1089	768	1	unidad	t	t	1	4	\N	\N
1090	768	10	caja x 10	f	t	2	4	\N	\N
1091	769	1	unidad	t	t	1	4	\N	\N
1092	770	1	unidad	t	t	1	4	\N	\N
1093	770	10	caja x 10	f	t	2	4	\N	\N
1094	771	1	UNIDAD	t	t	1	4	\N	\N
1095	771	10	CAJA X 10	f	t	2	4	\N	\N
1096	772	1	UNIDAD	t	t	1	4	\N	\N
1097	773	1	UNIDAD	t	t	1	4	\N	\N
1098	774	1	UNIDAD	t	t	1	4	\N	\N
1099	775	1	UNIDAD	t	t	1	4	\N	\N
1100	775	10	CAJA X 10	f	t	2	4	\N	\N
1101	776	1	unidad	t	t	1	4	\N	\N
1103	777	1	unidad	t	t	1	4	\N	\N
1104	778	1	unidad	t	t	1	4	\N	\N
1105	779	1	unidad	t	t	1	4	\N	\N
1106	780	1	unidad	t	t	1	4	\N	\N
1107	781	1	unidad	t	t	1	4	\N	\N
1108	782	1	unidad	t	t	1	4	\N	\N
1109	783	1	unidad	t	t	1	4	\N	\N
1110	784	1	unidad	t	t	1	4	\N	\N
1111	785	1	unidad	t	t	1	4	\N	\N
1112	786	1	unidad	t	t	1	4	\N	\N
1113	787	1	unidad	t	t	1	4	\N	\N
1114	788	1	unidad	t	t	1	4	\N	\N
1115	789	1	unidad	t	t	1	4	\N	\N
620	441	20	breza x 20 unidad	f	t	2	4	\N	\N
1116	790	1	unidad	t	t	1	4	\N	\N
1117	791	1	unidad	t	t	1	4	\N	\N
1118	792	1	unidad	t	t	1	4	\N	\N
1119	794	1	unidad	t	t	1	4	\N	\N
1120	795	1	UNIDAD	t	t	1	4	\N	\N
1121	796	1	UNIDAD	t	t	1	4	\N	\N
1122	797	1	UNIDAD	t	t	1	4	\N	\N
1123	34	1	UNIDAD	t	t	1	4	\N	\N
1125	36	1	UNIDAD	t	t	1	4	\N	\N
1126	796	12	caja x 12	f	t	4	4	\N	\N
1127	32	1	unidad	t	t	1	4	\N	\N
1128	32	6	caja x 6	f	t	2	4	\N	\N
1129	32	24	caja x 24	f	t	2	4	\N	\N
264	157	12	caja x 12 unidad	f	t	2	4	\N	\N
1130	798	1	unidad	t	t	1	4	\N	\N
1131	798	12	caja x 12	f	t	2	4	\N	\N
1124	34	6	pack X 6	f	t	4	4	\N	\N
1132	799	1	UNIDAD	t	t	1	4	\N	\N
1133	799	6	CAJA X 6	f	t	2	4	\N	\N
1134	790	20	CAJA X 20	f	t	2	4	\N	\N
1135	800	1	UNIDAD	t	t	1	4	\N	\N
1136	800	20	CAJA X 20	f	t	2	4	\N	\N
1137	795	12	CAJA X 12	f	t	2	4	\N	\N
1138	797	12	CAJA X 12	f	t	2	4	\N	\N
1139	36	12	caja x 12	f	t	2	4	\N	\N
1140	3	1	UNIDAD	t	t	1	4	\N	\N
1141	3	6	CAJA X 6	f	t	2	4	\N	\N
1142	4	1	UNIDAD	t	t	1	4	\N	\N
1143	4	6	CAJA X 6	f	t	2	4	\N	\N
1144	10	1	UNIDAD	t	t	1	4	\N	\N
1145	10	6	CAJA X 6	f	t	2	4	\N	\N
1146	37	1	UNIDAD	t	t	1	4	\N	\N
1147	38	1	UNIDAD	t	t	1	4	\N	\N
1148	39	1	UNIDAD	t	t	1	4	\N	\N
1149	42	1	UNIDAD	t	t	1	4	\N	\N
1150	43	1	UNIDAD	t	t	1	4	\N	\N
1151	44	1	UNIDAD	t	t	1	4	\N	\N
1152	45	1	UNIDAD	t	t	1	4	\N	\N
1153	49	1	UNIDAD	t	t	1	4	\N	\N
1154	49	12	CAJA X 12	f	t	2	4	\N	\N
1155	50	1	UNIDAD	t	t	1	4	\N	\N
1156	51	1	UNIDAD	t	t	1	4	\N	\N
1157	55	1	UNIDAD	t	t	1	4	\N	\N
1158	56	1	UNIDAD	t	t	1	4	\N	\N
1159	58	1	UNIDAD	t	t	1	4	\N	\N
1160	62	1	UNIDAD	t	t	1	4	\N	\N
1161	64	1	UNIDAD	t	t	1	4	\N	\N
1162	65	1	UNIDAD	t	t	1	4	\N	\N
1163	66	1	UNIDAD	t	t	1	4	\N	\N
1164	68	1	UNIDAD	t	t	1	4	\N	\N
1165	67	1	UNIDAD	t	t	1	4	\N	\N
1166	69	1	UNIDAD	t	t	1	4	\N	\N
1167	71	1	UNIDAD	t	t	1	4	\N	\N
1168	72	1	UNIDAD	t	t	1	4	\N	\N
1169	73	1	UNIDAD	t	t	1	4	\N	\N
1170	78	1	UNIDAD	t	t	1	4	\N	\N
1171	81	1	UNIDAD	t	t	1	4	\N	\N
1172	82	1	UNIDAD	t	t	1	4	\N	\N
1173	85	1	UNIDAD	t	t	1	4	\N	\N
1174	86	1	UNIDAD	t	t	1	4	\N	\N
1175	88	1	UNIDAD	t	t	1	4	\N	\N
1176	92	1	UNIDAD	t	t	1	4	\N	\N
1177	92	12	CAJA X 12	f	t	2	4	\N	\N
1178	93	1	UNIDAD	t	t	1	4	\N	\N
1179	94	1	UNIDAD	t	t	1	4	\N	\N
1180	95	1	UNIDAD	t	t	1	4	\N	\N
1181	98	1	UNIDAD	t	t	1	4	\N	\N
1182	99	1	UNIDAD	t	t	1	4	\N	\N
1183	99	1	UNIDAD	f	t	1	4	\N	\N
1184	100	1	UNIDAD	t	t	1	4	\N	\N
1185	106	1	UNIDAD	t	t	1	4	\N	\N
1186	108	1	UNIDAD	t	t	1	4	\N	\N
1187	109	1	UNIDAD	t	t	1	4	\N	\N
1188	110	1	UNIDAD	t	t	1	4	\N	\N
1189	121	1	UNIDAD	t	t	1	4	\N	\N
1190	127	1	UNIDAD	t	t	1	4	\N	\N
1191	128	1	UNIDAD	t	t	1	4	\N	\N
1192	129	1	UNIDAD	t	t	1	4	\N	\N
1193	131	1	UNIDAD	t	t	1	4	\N	\N
1194	132	1	UNIDAD	t	t	1	4	\N	\N
1195	135	1	UNIDAD	t	t	1	4	\N	\N
1196	135	12	CAJA X 12	f	t	2	4	\N	\N
1197	136	1	UNIDAD	t	t	1	4	\N	\N
1198	137	6	CAJA X 6	f	t	2	4	\N	\N
1199	138	1	UNIDAD	t	t	1	4	\N	\N
1200	139	6	CAJA X 6	f	t	2	4	\N	\N
1201	140	1	UNIDAD	t	t	1	4	\N	\N
1202	140	6	CAJA X 6	f	t	2	4	\N	\N
1203	141	6	CAJA X 6	f	t	2	4	\N	\N
1204	142	1	UNIDAD	t	t	1	4	\N	\N
1205	143	1	UNIDAD	t	t	1	4	\N	\N
1206	143	12	CAJA X 12	f	t	2	4	\N	\N
1207	144	1	unidad	t	t	1	4	\N	\N
1208	144	12	caja x 12	f	t	2	4	\N	\N
1209	801	1	unidad	t	t	1	4	\N	\N
1211	802	1	unidad	t	t	1	4	\N	\N
1212	802	6	caja x 6	f	t	2	4	\N	\N
1213	803	1	unidad	t	t	1	4	\N	\N
1214	803	6	caja x 6	f	t	2	4	\N	\N
1215	804	1	unidad	t	t	1	4	\N	\N
1216	804	6	caja x 6	f	t	2	4	\N	\N
1217	805	1	unidad	t	t	1	4	\N	\N
1218	805	12	caja x 12	f	t	2	4	\N	\N
1219	806	1	UNIDAD	t	t	1	4	\N	\N
1220	806	8	CAJA X 8	f	t	2	4	\N	\N
1221	807	1	UNIDAD	t	t	1	4	\N	\N
1222	807	4	CAJA X 4	f	t	2	4	\N	\N
1224	808	8	CAJA X 8	f	t	2	4	\N	\N
1223	808	1	UNIDAD	t	t	1	4	\N	\N
1225	809	1	UNIDAD	t	t	1	4	\N	\N
1226	809	4	CAJA X 4	f	t	2	4	\N	\N
1227	810	1	UNIDAD	t	t	1	4	\N	\N
1228	810	6	CAJA X 6	f	t	2	4	\N	\N
1229	811	1	UNIDAD	t	t	1	4	\N	\N
1230	811	4	CAJA X 4	f	t	2	4	\N	\N
1231	812	1	UNIDAD	t	t	1	4	\N	\N
1232	812	4	CAJA X 4	f	t	2	4	\N	\N
1233	813	1	UNIDAD	t	t	1	4	\N	\N
1234	813	24	caja x 24	f	t	2	4	\N	\N
1235	814	1	unidad	t	t	1	4	\N	\N
1236	814	6	caja x 6	f	t	2	4	\N	\N
1237	815	1	unidad	t	t	1	4	\N	\N
1238	815	4	caja x 4	f	t	2	4	\N	\N
1239	816	1	unidad	t	t	1	4	\N	\N
1240	816	12	caja x 12	f	t	2	4	\N	\N
1241	817	1	unidad	t	t	1	4	\N	\N
1242	817	8	caja x 8	f	t	2	4	\N	\N
1243	818	1	unidad	t	t	1	4	\N	\N
1244	818	4	caja x 4	f	t	2	4	\N	\N
1245	819	1	unidad	t	t	1	4	\N	\N
1246	819	6	caja x 6	f	t	2	4	\N	\N
1247	820	1	unidad	t	t	1	4	\N	\N
1249	821	1	unidad	t	t	1	4	\N	\N
1250	821	6	caja x 6	f	t	2	4	\N	\N
1251	822	1	unidad	t	t	1	4	\N	\N
1252	822	4	caja x 4	f	t	2	4	\N	\N
1253	823	1	unidad	t	t	1	4	\N	\N
1255	824	1	unidad	t	t	1	4	\N	\N
1256	824	24	caja x 24	f	t	2	4	\N	\N
1257	825	1	UNIDAD	t	t	1	4	\N	\N
1258	825	12	CAJA X 12	f	t	2	4	\N	\N
1259	826	1	UNIDAD	t	t	1	4	\N	\N
1260	826	8	CAJA X 8	f	t	2	4	\N	\N
1261	827	1	UNIDAD	t	t	1	4	\N	\N
1262	827	6	CAJA X 6	f	t	2	4	\N	\N
1263	828	1	UNIDAD	t	t	1	4	\N	\N
1264	828	4	CAJA X 4	f	t	2	4	\N	\N
1265	829	1	UNIDAD	t	t	1	4	\N	\N
1266	829	12	CAJA X 12	f	t	2	4	\N	\N
1267	830	1	UNIDAD	t	t	1	4	\N	\N
1268	830	8	CAJA X 8	f	t	2	4	\N	\N
1269	831	1	UNIDAD	t	t	1	4	\N	\N
1270	831	6	CAJA X 6	f	t	2	4	\N	\N
1271	832	1	UNIDAD	t	t	1	4	\N	\N
1272	832	6	CAJA X 6	f	t	2	4	\N	\N
1273	833	1	UNIDAD	t	t	1	4	\N	\N
1274	833	4	CAJA X 4	f	t	2	4	\N	\N
1275	834	1	unidad	t	t	1	4	\N	\N
1276	834	4	caja x 4	f	t	2	4	\N	\N
1277	835	1	unidad	t	t	1	4	\N	\N
1278	835	12	caja x 12	f	t	2	4	\N	\N
1279	836	1	unidad	t	t	1	4	\N	\N
1280	836	8	caja x 8	f	t	2	4	\N	\N
1281	837	1	unidad	t	t	1	4	\N	\N
1282	837	24	caja x 24	f	t	2	4	\N	\N
1283	838	1	unidad	t	t	1	4	\N	\N
1284	838	6	pack x 6	f	t	4	4	\N	\N
1285	839	1	unidad	t	t	1	4	\N	\N
1286	839	6	caja x 6	f	t	2	4	\N	\N
1287	840	1	unidad	t	t	1	4	\N	\N
1288	840	6	caja x 6	f	t	2	4	\N	\N
1289	841	1	unidad	t	t	1	4	\N	\N
1290	841	6	caja x 6	f	t	2	4	\N	\N
1291	842	1	unidad	t	t	1	4	\N	\N
1292	842	6	caja x 6	f	t	2	4	\N	\N
1293	843	1	unidad	t	t	1	4	\N	\N
1294	843	6	caja x 6	f	t	2	4	\N	\N
1295	844	1	unidad	t	t	1	4	\N	\N
1296	844	6	caja x 6	f	t	2	4	\N	\N
1297	845	1	unidad	t	t	1	4	\N	\N
1298	845	6	caja x 6	f	t	2	4	\N	\N
1299	846	1	unidad	t	t	1	4	\N	\N
1300	846	6	caja x 6	f	t	2	4	\N	\N
1301	847	1	unidad	t	t	1	4	\N	\N
1302	847	6	caja x 6	f	t	2	4	\N	\N
1303	848	1	unidad	t	t	1	4	\N	\N
1304	848	6	caja x 6	f	t	2	4	\N	\N
1305	849	1	unidad	t	t	1	4	\N	\N
1306	849	6	caja x 6	f	t	2	4	\N	\N
1307	850	1	unidad	t	t	1	4	\N	\N
1308	850	6	caja x 6	f	t	2	4	\N	\N
1309	850	24	caja x 24	f	t	2	4	\N	\N
1310	851	1	unidad	t	t	1	4	\N	\N
1311	851	8	caja x 8	f	t	2	4	\N	\N
1312	852	1	unidad	t	t	1	4	\N	\N
1313	852	6	caja x 6	f	t	2	4	\N	\N
1314	853	1	unidad	t	t	1	4	\N	\N
1315	853	8	caja x 8	f	t	2	4	\N	\N
1316	854	1	unidad	t	t	1	4	\N	\N
1317	854	6	caja x 6	f	t	2	4	\N	\N
1318	855	1	unidad	t	t	1	4	\N	\N
1319	855	8	caja x 8	f	t	2	4	\N	\N
1320	856	1	unidad	t	t	1	4	\N	\N
1321	856	6	caja x 6 	f	t	2	4	\N	\N
1322	857	1	unidad	t	t	1	4	\N	\N
1323	857	8	caja x 8	f	t	2	4	\N	\N
1254	823	4	pack x 4 unidad	f	t	4	4	\N	\N
1324	858	1	unidad	t	t	1	4	\N	\N
1325	858	4	caja x 4	f	t	2	4	\N	\N
1326	859	1	unidad	t	t	1	4	\N	\N
1328	860	1	unidad	t	t	1	4	\N	\N
1329	860	4	caja x 4	f	t	2	4	\N	\N
1327	859	6	caja x 6	f	t	2	4	\N	\N
1330	861	1	unidad	t	t	1	4	\N	\N
1331	861	6	caja x 6	f	t	2	4	\N	\N
1332	862	1	unidad	t	t	1	4	\N	\N
1333	862	6	caja x 6	f	t	2	4	\N	\N
1334	863	1	unidad	t	t	1	4	\N	\N
1335	863	6	caja x 6	f	t	2	4	\N	\N
1336	864	1	unidad	t	t	1	4	\N	\N
1337	864	6	caja x 6	f	t	2	4	\N	\N
1338	865	1	unidad	t	t	1	4	\N	\N
1339	865	4	caja x 4	f	t	2	4	\N	\N
1340	866	1	unidad	t	t	1	4	\N	\N
1341	866	4	caja x 4	f	t	2	4	\N	\N
1342	867	1	unidad	t	t	1	4	\N	\N
1343	867	6	caja x 6	f	t	2	4	\N	\N
1344	868	1	unidad	t	t	1	4	\N	\N
1345	868	4	caja x 4	f	t	2	4	\N	\N
1346	869	1	unidad	t	t	1	4	\N	\N
1347	869	6	caja x 6	f	t	2	4	\N	\N
1348	870	1	unidad	t	t	1	4	\N	\N
1349	870	4	caja x 4	f	t	2	4	\N	\N
1350	871	1	UNIDAD	t	t	1	4	\N	\N
1351	871	6	CAJA X 6	f	t	2	4	\N	\N
1352	872	1	UNIDAD	t	t	1	4	\N	\N
1353	872	12	CAJA X 12	f	t	2	4	\N	\N
1354	873	1	UNIDAD	t	t	1	4	\N	\N
1355	873	6	CAJA X 6	f	t	2	4	\N	\N
1356	874	1	UNIDAD	t	t	1	4	\N	\N
1357	874	6	CAJA X 6	f	t	2	4	\N	\N
1358	875	1	UNIDAD	t	t	1	4	\N	\N
1359	875	6	CAJA X 6	f	t	2	4	\N	\N
1360	876	1	UNIDAD	t	t	1	4	\N	\N
1361	876	6	CAJA  X 6	f	t	2	4	\N	\N
1362	877	1	UNIDAD	t	t	1	4	\N	\N
1363	877	4	CAJA X 4	f	t	2	4	\N	\N
1364	878	1	UNIDAD	t	t	1	4	\N	\N
1365	878	6	CAJA X 6	f	t	2	4	\N	\N
1366	879	1	UNIDAD	t	t	1	4	\N	\N
1367	879	4	CAJA X 4	f	t	2	4	\N	\N
1368	880	1	UNIDAD	t	t	1	4	\N	\N
1369	880	6	CAJA X 6	f	t	2	4	\N	\N
1370	881	1	UNIDAD	t	t	1	4	\N	\N
1371	881	4	CAJA X 4	f	t	2	4	\N	\N
1372	882	1	UNIDAD	t	t	1	4	\N	\N
1373	882	6	CAJA X 6	f	t	2	4	\N	\N
1374	883	1	unidad	t	t	1	4	\N	\N
1375	883	12	caja x 12	f	t	2	4	\N	\N
1376	793	1	UNIDAD	t	t	1	4	\N	\N
1377	884	1	UNIDAD	t	t	1	4	\N	\N
1378	885	1	UNIDAD	t	t	1	4	\N	\N
1379	886	1	UNIDAD	t	t	1	4	\N	\N
1380	887	1	UNIDAD	t	t	1	4	\N	\N
1381	888	1	UNIDAD	t	t	1	4	\N	\N
1382	889	1	unidad	t	t	1	4	\N	\N
1383	890	1	unidad	t	t	1	4	\N	\N
1384	891	1	unidad	t	t	1	4	\N	\N
1385	892	1	unidad	t	t	1	4	\N	\N
1386	893	1	unidad	t	t	1	4	\N	\N
1387	894	1	unidad	t	t	1	4	\N	\N
1388	895	1	unidad	t	t	1	4	\N	\N
1389	896	1	unidad	t	t	1	4	\N	\N
1390	897	1	unidad	t	t	1	4	\N	\N
1391	898	1	unidad	t	t	1	4	\N	\N
1392	899	1	unidad	t	t	1	4	\N	\N
1393	899	125	caja x 125	f	t	2	4	\N	\N
1394	304	1	UNIDAD	t	t	1	4	\N	\N
1395	900	1	UNIDAD	t	t	1	4	\N	\N
1396	901	1	UNIDAD	t	t	1	4	\N	\N
1397	902	1	UNIDAD	t	t	1	4	\N	\N
1398	903	1	UNIDAD	t	t	1	4	\N	\N
1399	904	1	UNIDAD	t	t	1	4	\N	\N
1400	905	1	UNIDAD	t	t	1	4	\N	\N
1401	906	1	UNIDAD	t	t	1	4	\N	\N
1402	907	1	UNIDAD	t	t	1	4	\N	\N
1403	908	1	UNIDAD	t	t	1	4	\N	\N
1404	909	1	UNIDAD	t	t	1	4	\N	\N
1405	910	1	UNIDAD	t	t	1	4	\N	\N
1406	911	1	UNIDAD	t	t	1	4	\N	\N
1407	912	1	UNIDAD	t	t	1	4	\N	\N
1409	913	1	UNIDAD	t	t	1	4	\N	\N
1410	914	1	UNIDAD	t	t	1	4	\N	\N
1411	915	1	UNIDAD	t	t	1	4	\N	\N
1412	915	30	CAJA X 30	f	t	2	4	\N	\N
1413	664	1	UNIDAD	t	t	1	4	\N	\N
1414	916	1	UNIDAD	t	t	1	4	\N	\N
1415	917	1	UNIDAD	t	t	1	4	\N	\N
1416	918	1	UNIDAD	t	t	1	4	\N	\N
1417	919	1	UNIDAD	t	t	1	4	\N	\N
1418	920	1	UNIDAD	t	t	1	4	\N	\N
1419	921	1	UNIDAD	t	t	1	4	\N	\N
1420	922	1	UNIDAD	t	t	1	4	\N	\N
1421	923	1	unidad	t	t	1	4	\N	\N
1422	924	1	unidad	t	t	1	4	\N	\N
1423	924	10	caja x 10	f	t	2	4	\N	\N
1424	925	1	unidad	t	t	1	4	\N	\N
1425	925	12	caja x 12	f	t	2	4	\N	\N
1426	926	1	unidad	t	t	1	4	\N	\N
1427	927	1	unidad	t	t	1	4	\N	\N
1428	928	1	unidad	t	t	1	4	\N	\N
1429	929	1	UNIDAD	t	t	1	4	\N	\N
1430	930	1	UNIDAD	t	t	1	4	\N	\N
1431	931	1	unidad	t	t	1	4	\N	\N
1432	932	1	unidad	t	t	1	4	\N	\N
1433	933	1	unidad	t	t	1	4	\N	\N
1434	934	1	unidad	t	t	1	4	\N	\N
1435	935	1	unidad	t	t	1	4	\N	\N
1436	936	1	unidad	t	t	1	4	\N	\N
1437	937	1	unidad	t	t	1	4	\N	\N
1438	938	1	unidad	t	t	1	4	\N	\N
1439	939	1	unidad	t	t	1	4	\N	\N
1440	940	1	unidad	t	t	1	4	\N	\N
1441	941	1	unidad	t	t	1	4	\N	\N
1442	942	1	unidad	t	t	1	4	\N	\N
1443	943	1	unidad	t	t	1	4	\N	\N
1444	944	1	unidad	t	t	1	4	\N	\N
1445	945	1	unidad	t	t	1	4	\N	\N
1446	946	1	unidad	t	t	1	4	\N	\N
1447	947	1	unidad	t	t	1	4	\N	\N
1448	948	1	UNIDAD	t	t	1	4	\N	\N
1449	949	1	UNIDAD	t	t	1	4	\N	\N
1450	950	1	UNIDAD	t	t	1	4	\N	\N
1451	951	1	UNIDAD	t	t	1	4	\N	\N
1452	952	1	UNIDAD	t	t	1	4	\N	\N
1453	953	1	unidad	t	t	1	4	\N	\N
1454	954	1	unidad	t	t	1	4	\N	\N
1455	955	1	unidad	t	t	1	4	\N	\N
1456	956	1	UNIDAD	t	t	1	4	\N	\N
1457	957	1	UNIDAD	t	t	1	4	\N	\N
1458	958	1	unidad	t	t	1	4	\N	\N
1459	959	1	unidad	t	t	1	4	\N	\N
1460	960	1	unidad	t	t	1	4	\N	\N
1461	961	1	unidad	t	t	1	4	\N	\N
1462	962	1	unidad	t	t	1	4	\N	\N
1463	963	1	unidad	t	t	1	4	\N	\N
1464	964	1	unidad	t	t	1	4	\N	\N
1465	965	1	unidad	t	t	1	4	\N	\N
1466	966	1	unidad	t	t	1	4	\N	\N
1467	967	1	unidad	t	t	1	4	\N	\N
1468	964	12	caja x 12	f	t	2	4	\N	\N
1469	962	12	caja x 12	f	t	2	4	\N	\N
1470	961	16	caja x 16	f	t	2	4	\N	\N
1471	968	1	unidad	t	t	1	4	\N	\N
1472	968	16	caja x 16	f	t	2	4	\N	\N
1473	969	1	unidad	t	t	1	4	\N	\N
1474	969	12	caja x 12	f	t	1	4	\N	\N
1475	970	1	unidad	t	t	1	4	\N	\N
1477	971	1	unidad	t	t	1	4	\N	\N
1478	971	12	caja x 12	f	t	2	4	\N	\N
1476	970	12	caja x 12	f	t	2	4	\N	\N
1479	972	1	unidad	t	t	1	4	\N	\N
1480	972	12	caja x 12	f	t	1	4	\N	\N
1481	973	1	unidad	t	t	1	4	\N	\N
1482	974	1	unidad	t	t	1	4	\N	\N
1483	975	1	unidad	t	t	1	4	\N	\N
1484	976	1	unidad	t	t	1	4	\N	\N
1485	977	1	unidad	t	t	1	4	\N	\N
1486	978	1	unidad	t	t	1	4	\N	\N
1487	979	1	unidad	t	t	1	4	\N	\N
1488	980	1	unidad	t	t	1	4	\N	\N
1489	981	1	unidad	t	t	1	4	\N	\N
1490	982	1	unidAd	t	t	1	4	\N	\N
1491	983	1	unidad	t	t	1	4	\N	\N
1492	984	1	UNIDAD	t	t	1	4	\N	\N
1493	985	1	unidad	t	t	1	4	\N	\N
1494	986	1	unidad	t	t	1	4	\N	\N
1495	987	1	unidad	t	t	1	4	\N	\N
1496	988	1	unidad	t	t	1	4	\N	\N
1497	989	1	unidad	t	t	1	4	\N	\N
1498	990	1	unidad	t	t	1	4	\N	\N
1499	991	1	unidad	t	t	1	4	\N	\N
1500	992	1	unidad	t	t	1	4	\N	\N
1501	993	1	unidad	t	t	1	4	\N	\N
1502	994	1	unidad	t	t	1	4	\N	\N
1503	995	1	unidad	t	t	1	4	\N	\N
1504	995	24	caja x 24	f	t	2	4	\N	\N
1505	996	1	unidad	t	t	1	4	\N	\N
1506	996	12	caja x 12	f	t	2	4	\N	\N
1507	997	1	unidad	t	t	1	4	\N	\N
1508	997	28000	caja x 12	f	t	2	4	\N	\N
1509	998	1	unidad	t	t	1	4	\N	\N
1510	998	12	caja x 12	f	t	2	4	\N	\N
1511	999	1	unidad	t	t	1	4	\N	\N
1512	999	6	caja x 6	f	t	2	4	\N	\N
1513	1000	1	unidad	t	t	1	4	\N	\N
1514	1000	9	caja x 9	f	t	2	4	\N	\N
1515	1001	1	unidad	t	t	1	4	\N	\N
1516	1001	4	caja x 4	f	t	2	4	\N	\N
1517	1002	1	unidad	t	t	1	4	\N	\N
1518	1003	1	unidad	t	t	1	4	\N	\N
1519	1004	1	unidad	t	t	1	4	\N	\N
1520	1005	1	unidad	t	t	1	4	\N	\N
1521	1006	1	unidad	t	t	1	4	\N	\N
1522	1007	1	unidad	t	t	1	4	\N	\N
1523	1008	1	unidad	t	t	1	4	\N	\N
1524	165	1	1	t	t	1	4	\N	\N
1525	1009	1	UNIDAD	t	t	1	7	\N	\N
1526	1010	1	unidad	t	t	1	7	\N	\N
1527	1011	1	unidad	t	t	1	7	\N	\N
1528	1012	1	unidad	t	t	1	4	\N	\N
1529	1013	1	unidad	t	t	1	4	\N	\N
1530	1014	1	unidad	t	t	1	4	\N	\N
1531	1015	1	unidad	t	t	1	4	\N	\N
1532	1016	1	unidad	t	t	1	4	\N	\N
1533	1017	1	unidad	t	t	1	4	\N	\N
1534	1018	1	unidad	t	t	1	4	\N	\N
1535	1019	1	unidad	t	t	1	4	\N	\N
1536	1020	1	unidad	t	t	1	4	\N	\N
1537	1021	1	unidad	t	t	1	4	\N	\N
1538	1022	1	unidad	t	t	1	4	\N	\N
1539	1023	1	UNIDAD	t	t	1	4	\N	\N
1540	1024	1	unidad	t	t	1	4	\N	\N
1541	1025	1	unidad	t	t	1	4	\N	\N
1542	1026	1	unidad	t	t	1	4	\N	\N
1543	1027	1	unidad	t	t	1	4	\N	\N
1544	1028	1	unidad	t	t	1	4	\N	\N
1545	1029	1	unidad	t	t	1	4	\N	\N
1546	1030	1	unidad	t	t	1	4	\N	\N
1547	1031	1	unidad	t	t	1	4	\N	\N
1548	1032	1	unidad	t	t	1	4	\N	\N
1549	1033	1	unidad	t	t	1	4	\N	\N
1550	1034	1	UNIDAD	t	t	1	4	\N	\N
1551	1035	1	UNIDAD	t	t	1	4	\N	\N
1552	1036	1	unidad	t	t	1	4	\N	\N
1553	1037	1	unidad	t	t	1	4	\N	\N
1554	1038	1	unidad	t	t	1	4	\N	\N
1555	1039	1	unidad	t	t	1	4	\N	\N
1556	1040	1	unidad	t	t	1	4	\N	\N
1210	801	6	pack x 6 unidad	f	t	2	4	\N	\N
1557	1041	1	unidad	t	t	1	4	\N	\N
1558	1041	6	pack x 6 unidad	f	t	4	4	\N	\N
1248	820	6	pack x 6 unidad	f	t	4	4	\N	\N
1559	1042	1	unidad	t	t	1	4	\N	\N
1560	1042	12	caja x 12 unidad	f	t	1	4	\N	\N
1561	1043	1	unidad	t	t	1	4	\N	\N
1562	1043	6	caja x 6 unidad	f	t	1	4	\N	\N
1564	1045	1	unidad	t	t	1	4	\N	\N
1565	1045	12	pack x 12 unidad	f	t	4	4	\N	\N
1566	1046	1	unidad	t	t	1	4	\N	\N
1567	1046	12	pack x 12 unidad	f	t	4	4	\N	\N
1568	1047	1	unidad	t	t	1	4	\N	\N
1569	1047	12	pack x 12 unidad	f	t	4	4	\N	\N
1570	1048	1	unidad	t	t	1	4	\N	\N
1571	1048	12	pack x 12 unidad	f	t	1	4	\N	\N
1572	1049	1	UNIDAD	t	t	1	4	\N	\N
1573	1050	1	UNIDAD	t	t	1	4	\N	\N
1574	1051	1	unidad	t	t	1	4	\N	\N
1575	1052	1	unidad	t	t	1	4	\N	\N
1576	1053	1	UNIDAD	t	t	1	4	\N	\N
1577	1054	1	unidad	t	t	1	4	\N	\N
1578	1055	1	unidad	t	t	1	4	\N	\N
1579	34	24	cAJA X 24 UNIDAD	f	t	2	4	\N	\N
1580	1056	1	unidad	t	t	1	4	\N	\N
1581	1057	1	unidad	t	t	1	4	\N	\N
1582	1058	1	unidad	t	t	1	4	\N	\N
1583	1059	1	unidad	t	t	1	4	\N	\N
1584	1060	1	unidad	t	t	1	4	\N	\N
1585	1061	1	unidad	t	t	1	4	\N	\N
1587	1062	1	unidad	t	t	1	4	\N	\N
1588	1063	1	unidad	t	t	1	4	\N	\N
1589	1064	1	unidad	t	t	1	4	\N	\N
1590	1064	6	pack x 6 unidad	f	t	4	4	\N	\N
1591	1065	1	UNIDAD	t	t	1	4	\N	\N
1592	1065	6	PACK X 6 UNIDAD	f	t	4	4	\N	\N
1593	1065	24	CAJA X 24 UNIDAD	f	t	2	4	\N	\N
1594	1066	1	unidad	t	t	1	4	\N	\N
1595	1067	1	unidad	t	t	1	4	\N	\N
1596	1068	1	unidad	t	t	1	4	\N	\N
1597	1069	1	unidad	t	t	1	4	\N	\N
1598	1069	20	bresa x 20 unidad	f	t	4	4	\N	\N
1599	911	12	caja x 12 unidad	f	t	1	4	\N	\N
1600	1070	1	unidad	t	t	1	4	\N	\N
1602	1071	1	UNIDAD	t	t	1	4	\N	\N
1603	1072	1	unidad	t	t	1	4	\N	\N
1604	1073	1	unidad	t	t	1	4	\N	\N
1605	1074	1	unidad	t	t	1	4	\N	\N
1606	1075	1	unidad	t	t	1	4	\N	\N
1607	1076	1	unidad	t	t	1	4	\N	\N
1608	1077	1	unidad	t	t	1	4	\N	\N
1609	1078	1	unidad	t	t	1	4	\N	\N
1610	1079	1	unidad	t	t	1	4	\N	\N
1611	1080	1	unidad	t	t	1	4	\N	\N
1612	1081	1	unidad	t	t	1	4	\N	\N
1613	1081	4	pack x 4 unidad	f	t	4	4	\N	\N
1614	1082	1	unidad	t	t	1	4	\N	\N
1615	1083	1	unidad	t	t	1	4	\N	\N
1616	1084	1	unidad	t	t	1	4	\N	\N
1617	1085	1	unidad	t	t	1	4	\N	\N
1618	1086	1	unidad	t	t	1	4	\N	\N
1620	1087	1	unidad	t	t	1	4	\N	\N
1621	1088	1	unidad	t	t	1	4	\N	\N
1622	1089	1	unidad	t	t	1	4	\N	\N
1623	1090	1	unidad	t	t	1	4	\N	\N
1624	1091	1	unidad	t	t	1	4	\N	\N
1625	1092	1	unidad	t	t	1	4	\N	\N
1626	1093	1	unidad	t	t	1	4	\N	\N
1627	1094	1	unidad	t	t	1	4	\N	\N
1628	1095	1	unidad	t	t	1	4	\N	\N
1629	1096	1	unidad	t	t	1	4	\N	\N
1630	1097	1	unidad	t	t	1	4	\N	\N
1631	1098	1	unidad	t	t	1	4	\N	\N
1632	1099	1	unidad	t	t	1	4	\N	\N
1633	913	6	pack x 6 unidad	f	t	4	4	\N	\N
1408	912	6	PACK X 6 UNIDAD	f	t	2	4	\N	\N
1634	1100	1	unidad	t	t	1	8	\N	\N
1635	1100	6	pack x 6 unidad	f	t	4	8	\N	\N
1636	1101	1	unidad	t	t	1	4	\N	\N
1637	1102	1	unidad	t	t	1	4	\N	\N
1638	1102	6	pack x 6 unidad	f	t	4	4	\N	\N
1639	1103	1	unidad	t	t	1	4	\N	\N
1640	1103	12	caja x 12 unidad	f	t	2	4	\N	\N
1641	1104	1	unidad	t	t	1	12	\N	\N
1643	1105	1	unidad	t	t	1	9	\N	\N
1644	1106	1	UNIDAD	t	t	1	9	\N	\N
1645	1107	1	UNIDAD	t	t	1	9	\N	\N
1646	1108	1	UNIDAD	t	t	1	9	\N	\N
1647	1109	1	UNIDAD	t	t	1	9	\N	\N
1648	1110	1	UNIDAD	t	t	1	9	\N	\N
1649	1111	1	UNIDAD	t	t	1	9	\N	\N
1650	1112	1	UNIDAD	t	t	1	9	\N	\N
1651	1113	1	UNIDAD	t	t	1	9	\N	\N
1652	1114	1	UNIDAD	t	t	1	9	\N	\N
1653	1115	1	unidad	t	t	1	9	\N	\N
1654	1116	1	unidad	t	t	1	9	\N	\N
1681	1133	1	unidad	t	t	1	4	2022-04-30 20:38:13.073+00	\N
1682	1134	1	unidad	t	t	1	4	2022-04-30 21:18:14.331+00	\N
1683	1135	1	unidad	t	t	1	4	2022-04-30 21:22:43.662+00	\N
1684	1136	1	unidad	t	t	1	4	2022-04-30 21:24:56.62+00	\N
1685	1137	1	unidad	t	t	1	4	2022-04-30 21:26:54.384+00	\N
1686	1138	1	uNIDad	t	t	1	4	2022-04-30 21:28:30.46+00	\N
1687	1139	1	unidad	t	t	1	4	2022-04-30 21:33:36.57+00	\N
1688	1140	1	unidad	t	t	1	4	2022-04-30 21:38:21.352+00	\N
1689	1141	1	unidad	t	t	1	4	2022-04-30 21:47:03.298+00	\N
1690	1142	1	unidad	t	t	1	4	2022-04-30 21:48:43.805+00	\N
1691	1143	1	unidad	t	t	1	4	2022-04-30 21:51:23.553+00	\N
1692	1144	1	unidad	t	t	1	4	2022-04-30 21:53:31.96+00	\N
1693	1145	1	unidad	t	t	1	4	2022-04-30 21:55:08.867+00	\N
1694	1146	1	unidad	t	t	1	4	2022-04-30 21:57:12.396+00	\N
1695	1147	1	unidad	t	t	1	4	2022-04-30 21:59:40.478+00	\N
1696	1148	1	unidad	t	t	1	4	2022-04-30 22:01:20.005+00	\N
1697	1149	1	unidad	t	t	1	4	2022-04-30 22:03:35.521+00	\N
1698	1150	1	unidad	t	t	1	4	2022-04-30 22:05:12.072+00	\N
1699	1151	1	unidad	t	t	1	4	2022-04-30 22:06:25.322+00	\N
1700	1152	1	TIRAS	t	t	6	1	\N	\N
1701	1153	1	tiras	t	t	6	1	2022-06-16 19:33:40.325+00	\N
\.


--
-- Name: presentacion_id_seq; Type: SEQUENCE SET; Schema: productos; Owner: franco
--

SELECT pg_catalog.setval('productos.presentacion_id_seq', 1, false);


--
-- Data for Name: producto; Type: TABLE DATA; Schema: productos; Owner: franco
--

COPY productos.producto (id, id_central, propagado, descripcion, descripcion_factura, iva, unidad_por_caja, balanza, combo, garantia, ingrediente, promocion, vencimiento, stock, usuario_id, tipo_conservacion, creado_en, sub_familia_id, observacion, cambiable, es_alcoholico, unidad_por_caja_secundaria, imagenes, tiempo_garantia, dias_vencimiento, id_sucursal_origen, activo, is_envase, envase_id) FROM stdin;
13	\N	f	SANTA HELENA VINO BLANCO 750 ML	SANTA HELENA VINO BLANCO 750 ML	10	12	f	f	f	f	f	t	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
14	\N	f	BRAHMA ZERO ALCOHOL 0.0 LATA 350 ML	BRAHMA ZERO ALCOHOL 0.0 LATA 350 ML	10	12	f	f	f	f	f	t	t	4	REFRIGERABLE	2021-12-28 18:29:38.098151+00	1	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
15	\N	f	SANTA HELENA VINO DULCE 1.5 LT	SANTA HELENA VINO DULCE 1.5 LT	10	6	f	f	f	f	f	t	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
16	\N	f	SANTA HELENA VINO DULCE 750 ML	SANTA HELENA VINO DULCE 750 ML	10	12	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
17	\N	f	BRAHMA DUPLO MALTE BOT 330 ML 	BRAHMA DUPLO MALTE BOT 330 ML 	10	12	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	1	\N	f	f	2	/productos	\N	30	\N	t	f	\N
18	\N	f	SANTA HELENA REFRESCANTE ROSE 750 ML	SANTA HELENA REFRESCANTE ROSE 750 ML	10	12	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
21	\N	f	BRAHMA DUPLO MALTE BOT 600 ML 	BRAHMA DUPLO MALTE BOT 600 ML 	10	12	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	1	\N	f	f	2	/productos	\N	30	\N	t	f	\N
3	\N	f	DON FRANCO SALTO LAGER 330 ML	DON FRANCO SALTO LAGER 330 ML	10	1	f	f	f	f	f	t	t	1	ENFRIABLE	2021-12-28 18:29:38.098151+00	1	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
4	\N	f	DON FRANCO IPA HAPPE 330 ML	DON FRANCO IPA HAPPE 330 ML	10	6	f	f	f	f	f	t	t	1	ENFRIABLE	2021-12-28 18:29:38.098151+00	1	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
5	\N	f	SKOL LITRO RETORNABLE	SKOL LITRO RETORNABLE	10	12	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	1	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
6	\N	f	7 COLINAS VINO TINTO 3 L	7 COLINAS VINO TINTO 3 L	10	6	f	f	f	f	f	f	t	3	ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
7	\N	f	BRAHMA SUB ZERO LATA 269 ML 	BRAHMA SUB ZERO LATA 269 ML 	10	12	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	1	\N	f	f	2	/productos	\N	30	\N	t	f	\N
9	\N	f	BRAHMA SUB ZERO BOT 340 ML RETORNABLE	BRAHMA SUB ZERO BOT 340 ML RETORNABLE	10	24	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	1	\N	f	f	2	/productos	\N	30	\N	t	f	\N
10	\N	f	7 COLINAS VINO TINTO 2 L	7 COLINAS VINO TINTO 2 L	10	6	f	f	f	f	f	f	t	3	ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
11	\N	f	BRAHMA CHOPP LATA 269 ML 	BRAHMA CHOPP LATA 269 ML 	10	12	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	1	\N	f	f	2	/productos	\N	30	\N	t	f	\N
8	\N	f	7 COLINAS VINO TINTO 880 ML	7 COLINAS VINO TINTO 880 ML	10	12	f	f	f	f	f	f	t	3	ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
12	\N	f	BRAHMA CHOPP BOT 340 ML RETORNABLE	BRAHMA CHOPP BOT 340 ML RETORNABLE	10	24	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	1	\N	f	f	2	/productos	\N	30	\N	t	f	\N
23	\N	f	SANTA HELENA ROSADO 1.5 L	SANTA HELENA ROSADO 1.5 L	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
24	\N	f	SANTA HELENA ROSE 750 ML	SANTA HELENA ROSE 750 ML	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
25	\N	f	SANTA HELENA SELECCION DEL DIRECTORIO 750 ML	SANTA HELENA SELECCION DEL DIRECTORIO 750 ML	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
27	\N	f	PILSEN LITRO RETORNABLE	PILSEN LITRO RETORNABLE	10	12	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	1	\N	f	f	2	/productos	\N	30	\N	t	f	\N
28	\N	f	SKOL LATA 269 ML	SKOL LATA 269 ML	10	15	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	1	\N	f	f	2	/productos	\N	30	\N	t	f	\N
29	\N	f	SKOL BOT ABRE FACIL 275 ML 	SKOL BOT ABRE FACIL 275 ML 	10	6	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	1	\N	f	f	24	/productos	\N	30	\N	t	f	\N
30	\N	f	SKOL BOT PURO MALTE ABRE FACIL 275 ML	SKOL BOT PURO MALTE ABRE FACIL 275 ML	10	6	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	1	\N	f	f	24	/productos	\N	30	\N	t	f	\N
31	\N	f	SANTA HELENA TINTO 1.5 ML	SANTA HELENA TINTO 1.5 ML	10	6	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
32	\N	f	CORONITA EXTRA 7FL. OZ. 210 ML	CORONITA EXTRA 7FL. OZ. 210 ML	10	6	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	1	\N	f	f	24	/productos	\N	30	\N	t	f	\N
33	\N	f	SANTA HELENA TINTO 750 ML	SANTA HELENA TINTO 750 ML	10	12	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
34	\N	f	CORONA BOT 355 ML	CORONA BOT 355 ML	10	6	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	1	\N	f	f	24	/productos	\N	30	\N	t	f	\N
35	\N	f	SANTA HELENA VERNUS 750 ML	SANTA HELENA VERNUS 750 ML	10	12	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
36	\N	f	CORONA BOT 710 ML 	CORONA BOT 710 ML 	10	12	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	1	\N	f	f	2	/productos	\N	30	\N	t	f	\N
37	\N	f	SANTA HELENA TINTO PACK 2 BOTELLA 750ML + 1 COPA	SANTA HELENA TINTO PACK 2 BOTELLA 750ML + 1 COPA	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
38	\N	f	CONCHA Y TORO CASILLERO DEL DIABLO RESERVA PRIVADA 750ML	CONCHA Y TORO CASILLERO DEL DIABLO RESERVA PRIVADA 750ML	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
39	\N	f	CONCHA Y TORO CASILLERO DEL DIABLO RVA CAB SAUV 750ML	CONCHA Y TORO CASILLERO DEL DIABLO RVA CAB SAUV 750ML	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
40	\N	f	CONCHA Y TORO EXPORTACION CAB SAUV 750 ML	CONCHA Y TORO EXPORTACION CAB SAUV 750 ML	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
41	\N	f	CONCHA Y TORO EXPORTACION CABERNET SAUVIGNON 1.5 L	CONCHA Y TORO EXPORTACION CABERNET SAUVIGNON 1.5 L	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
42	\N	f	CONCHA Y TORO FRONTERA CAB. SAU. 750 ML	CONCHA Y TORO FRONTERA CAB. SAU. 750 ML	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
43	\N	f	CONCHA Y TORO FRONTERA SAUV. BLANC 750 ML	CONCHA Y TORO FRONTERA SAUV. BLANC 750 ML	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
44	\N	f	CONCHA Y TORO GRAN RESERVA BLANC 750 ML	CONCHA Y TORO GRAN RESERVA BLANC 750 ML	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
45	\N	f	CONCHA Y TORO GRAN RESERVA RIBERAS CAB SAUV 750ML	CONCHA Y TORO GRAN RESERVA RIBERAS CAB SAUV 750ML	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
46	\N	f	CONCHA Y TORO RESERVADO CAB. SAUV.750 ML	CONCHA Y TORO RESERVADO CAB. SAUV.750 ML	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
47	\N	f	CONCHA Y TORO RESERVADO MERLOT 750 ML	CONCHA Y TORO RESERVADO MERLOT 750 ML	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
48	\N	f	CONCHA Y TORO RESERVADO SAUV BLANCO 750 ML	CONCHA Y TORO RESERVADO SAUV BLANCO 750 ML	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
49	\N	f	CORONA LATA 269 ML	CORONA LATA 269 ML	10	12	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	1	\N	f	f	2	/productos	\N	30	\N	t	f	\N
83	\N	f	HEINEKEN BOT 650 ML	HEINEKEN BOT 650 ML	10	12	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	1	\N	f	f	2	/productos	\N	30	\N	t	f	\N
1	\N	f	PILSEN EXTRA PURA MALTA LATA 310 ML 	PILSEN PURA MALTA LATA 310 ML 	10	12	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	1	\N	f	f	2	/productos	\N	30	\N	t	f	\N
52	\N	f	BUDWEISER 66 BOT 330 ML	BUDWEISER 66 BOT 330 ML	10	6	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	1	\N	f	f	24	/productos	\N	30	\N	t	f	\N
53	\N	f	BUDWEISER 66 CADILLAC BOT 550 ML 	BUDWEISER 66 CADILLAC BOT 550 ML 	10	6	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	1	\N	f	f	12	/productos	\N	30	\N	t	f	\N
50	\N	f	AURORA VINO MOSCATEL ESPUMANTE 750 ML	AURORA VINO MOSCATEL ESPUMANTE 750 ML	10	1	f	f	f	f	f	f	t	3	ENFRIABLE	2021-12-28 18:29:38.098151+00	16	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
51	\N	f	AURORA ESPUMANTE BRUT 750 ML	AURORA ESPUMANTE BRUT 750 ML	10	6	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	16	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
54	\N	f	BUDWEISER 66 LATA 269 ML	BUDWEISER 66 LATA 269 ML	10	12	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	1	\N	f	f	2	/productos	\N	30	\N	t	f	\N
55	\N	f	AURORA JUGO DE UVA TINTO INTEGRAL 300 ML	AURORA JUGO DE UVA TINTO INTEGRAL 300 ML	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	22	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
56	\N	f	AURORA JUGO DE UVA TINTO INTEGRAL 1 L	AURORA JUGO DE UVA TINTO INTEGRAL 1 L	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	22	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
57	\N	f	BUDWEISER BOT 340 ML RETORNABLE	BUDWEISER BOT 340 ML RETORNABLE	10	24	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	1	\N	f	f	2	/productos	\N	30	\N	t	f	\N
58	\N	f	AURORA JUGO DE UVA TINTO INTEGRAL 1.5 L	AURORA JUGO DE UVA TINTO INTEGRAL 1.5 L	10	6	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	22	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
59	\N	f	SANTA CAROLINA ESTRELLAS CAB SAUV 750ML	SANTA CAROLINA ESTRELLAS CAB SAUV 750ML	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
60	\N	f	SANTA CAROLINA ESTRELLAS CARMENERE 750 ML	SANTA CAROLINA ESTRELLAS CARMENERE 750 ML	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
61	\N	f	BUDWEISER CADILLAC BOT 550 ML	BUDWEISER CADILLAC BOT 550 ML	10	12	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	1	\N	f	f	2	/productos	\N	30	\N	t	f	\N
62	\N	f	SANTA CAROLINA PREMIO BLANCO 750 ML	SANTA CAROLINA PREMIO BLANCO 750 ML	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
63	\N	f	BUDWEISER LATA 269 ML	BUDWEISER LATA 269 ML	10	12	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	1	\N	f	f	2	/productos	\N	30	\N	t	f	\N
64	\N	f	SANTA CAROLINA PREMIO TINTO 1.5 L	SANTA CAROLINA PREMIO TINTO 1.5 L	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
65	\N	f	SANTA CAROLINA PREMIO TINTO 750 ML	SANTA CAROLINA PREMIO TINTO 750 ML	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
66	\N	f	SANTA CAROLINA PREMIO TINTO DULCE 750 ML	SANTA CAROLINA PREMIO TINTO DULCE 750 ML	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
67	\N	f	SANTA CAROLINA RESERVA CABERNET SAUVIGNON 750 ML	SANTA CAROLINA RESERVA CABERNET SAUVIGNON 750 ML	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
68	\N	f	SANTA CAROLINA RESERVA DE FAMILIA CABERNT SAUV 750 ML	SANTA CAROLINA RESERVA DE FAMILIA CABERNT SAUV 750 ML	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
69	\N	f	SANTA CAROLINA RESERVA SAUVIGNON BLANC 750 ML	SANTA CAROLINA RESERVA SAUVIGNON BLANC 750 ML	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
71	\N	f	SANTA CAROLINA RESERVADO CABER SAUV CARM EDIC LTDA 750 ML	SANTA CAROLINA RESERVADO CABER SAUV CARM EDIC LTDA 750 ML	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
72	\N	f	SANTA CAROLINA RESERVADO CABERNET SAUVIGNON 1.5 L	SANTA CAROLINA RESERVADO CABERNET SAUVIGNON 1.5 L	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
84	\N	f	QUINTA DO MORGADO BORDO TINTO SUAVE 1 L	QUINTA DO MORGADO BORDO TINTO SUAVE 1 L	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
73	\N	f	SANTA CAROLINA RESERVADO CABERNET SAUVIGNON 750 ML	SANTA CAROLINA RESERVADO CABERNET SAUVIGNON 750 ML	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
78	\N	f	SANTA CAROLINA RESERVADO CARMENERE 750 ML	SANTA CAROLINA RESERVADO CARMENERE 750 ML	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
79	\N	f	HEINEKEN BOT 330 ML 	HEINEKEN BOT 330 ML 	10	6	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	1	\N	f	f	24	/productos	\N	30	\N	t	f	\N
81	\N	f	QUINTA DO MORGADO BLANCO SUAVE 750 ML	QUINTA DO MORGADO BLANCO SUAVE 750 ML	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
82	\N	f	QUINTA DO MORGADO BORDO SUAVE 750 ML	QUINTA DO MORGADO BORDO SUAVE 750 ML	10	12	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
85	\N	f	QUINTA DO MORGADO ESPUMANTE DEMI SEC 660 ML	QUINTA DO MORGADO ESPUMANTE DEMI SEC 660 ML	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	16	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
86	\N	f	QUINTA DO MORGADO ESPUMANTE MOSCATEL 660ML	QUINTA DO MORGADO ESPUMANTE MOSCATEL 660ML	10	6	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	16	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
87	\N	f	HEINEKEN PURO MALTE 0,0 ALCOHOL BOT 330 ML	HEINEKEN PURO MALTE 0,0 ALCOHOL BOT 330 ML	10	6	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	1	\N	f	f	24	/productos	\N	30	\N	t	f	\N
88	\N	f	QUINTA DO MORGADO ROSADO SUAVE 750 ML	QUINTA DO MORGADO ROSADO SUAVE 750 ML	10	12	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
89	\N	f	MILLER BOT 650 ML	MILLER BOT 650 ML	10	15	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	1	\N	f	f	2	/productos	\N	30	\N	t	f	\N
90	\N	f	MILLER BOT 355 ML	MILLER BOT 355 ML	10	6	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	1	\N	f	f	24	/productos	\N	30	\N	t	f	\N
91	\N	f	MILLER LATA 237 ML 8OZ	MILLER LATA 237 ML 8OZ	10	6	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	1	\N	f	f	24	/productos	\N	30	\N	t	f	\N
92	\N	f	QUINTA DO MORGADO SUAVE LATA 269 ML	QUINTA DO MORGADO SUAVE LATA 269 ML	10	12	f	f	f	f	f	f	t	3	ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
93	\N	f	QUINTA DO MORGADO JUGO DE UVA INTEGRAL 300 ML	QUINTA DO MORGADO JUGO DE UVA INTEGRAL 300 ML	10	1	f	f	f	f	f	f	t	3	ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
94	\N	f	QUINTA DO MORGADO JUGO DE UVA INTEGRAL 1 L	QUINTA DO MORGADO JUGO DE UVA INTEGRAL 1 L	10	1	f	f	f	f	f	f	t	3	ENFRIABLE	2021-12-28 18:29:38.098151+00	22	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
95	\N	f	QUINTA DO MORGADO SUCO DE UVA TINTO 330 ML	QUINTA DO MORGADO SUCO DE UVA TINTO 330 ML	10	1	f	f	f	f	f	f	t	3	ENFRIABLE	2021-12-28 18:29:38.098151+00	22	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
560	\N	\N	NINFA GALLETITA MORANGO	NINFA GALLETITA MORANGO	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	18	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
96	\N	f	QUINTA DO MORGADO TINTO SUAVE 1 L	QUINTA DO MORGADO TINTO SUAVE 1 L	10	12	f	f	f	f	f	f	t	3	ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
97	\N	f	QUINTA DO MORGADO TINTO SUAVE 2 LT	QUINTA DO MORGADO TINTO SUAVE 2 LT	10	6	f	f	f	f	f	f	t	3	ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
98	\N	f	QUINTA DO MORGADO TINTO SUAVE 245 ML	QUINTA DO MORGADO TINTO SUAVE 245 ML	10	1	f	f	f	f	f	f	t	3	ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
80	\N	f	TEST PRODUCTO IMAGEN 2	TEST PRODUCTO IMAGEN 2	10	1	f	f	f	f	f	t	t	1	ENFRIABLE	2021-12-28 18:29:38.098151+00	1	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
99	\N	f	QUINTA DO MORGADO TINTO SUAVE 750 ML	QUINTA DO MORGADO TINTO SUAVE 750 ML	10	12	f	f	f	f	f	f	t	3	ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
100	\N	f	SAN PEDRO GATO NEGRO CABERNET SAUVIGNON 750 ML	SAN PEDRO GATO NEGRO CABERNET SAUVIGNON 750 ML	10	12	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
101	\N	f	CANCAO VINO SUAVE 750 ML	CANCAO VINO SUAVE 750 ML	10	12	f	f	f	f	f	f	t	3	ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
102	\N	f	CANCAO VINO SUAVE 1 L	CANCAO VINO SUAVE 1 L	10	1	f	f	f	f	f	f	t	3	ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
105	\N	f	LA CELIA EUGENIO BUSTOS CABERNET SAUVIGNON 750 ML	LA CELIA EUGENIO BUSTOS CABERNET SAUVIGNON 750 ML	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
103	\N	f	CANCAO VINO 1.5L	CANCAO VINO 1.5L	10	1	f	f	f	f	f	f	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
460	\N	f	LEON POPULAR 875ML	LEON POPULAR 875ML	10	1	f	f	f	f	f	f	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	27	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
461	\N	f	JOHNNIE WALKER BLACK LABEL 500 ML	JOHNNIE WALKER BLACK LABEL 500 ML	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	17	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
106	\N	f	LUIGI BOSCA CABERNET SAUVIGNON 750 ML	LUIGI BOSCA CABERNET SAUVIGNON 750 ML	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
107	\N	f	LUIGI BOSCA CABERNET - MALBEC 750 ML	LUIGI BOSCA CABERNET - MALBEC 750 ML	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
108	\N	f	LUIGI BOSCA MALBEC 750 ML	LUIGI BOSCA MALBEC 750 ML	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
109	\N	f	LATITUD 33 CABERNET SAUVIGNON 750 ML	LATITUD 33 CABERNET SAUVIGNON 750 ML	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
110	\N	f	LATITUD 33 MALBEC 750 ML	LATITUD 33 MALBEC 750 ML	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
111	\N	f	NAVARRO CORREA RESERVA CABERNET SAUVIGNON 750 ML	NAVARRO CORREA RESERVA CABERNET SAUVIGNON 750 ML	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
112	\N	f	NAVARRO CORREAS COLECCION PRIVADA CAB SAU 750 ML	NAVARRO CORREAS COLECCION PRIVADA CAB SAU 750 ML	10	6	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
113	\N	f	NAVARRO CORREAS COLECCION PRIVADA MALBEC 750 ML	NAVARRO CORREAS COLECCION PRIVADA MALBEC 750 ML	10	6	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
114	\N	f	NAVARRO CORREAS ESPUMANTE EXTRA BRUT 750 ML	NAVARRO CORREAS ESPUMANTE EXTRA BRUT 750 ML	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	16	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
115	\N	f	NAVARRO CORREAS GRAN LOS ARBOLES MALBEC 750 ML	NAVARRO CORREAS GRAN LOS ARBOLES MALBEC 750 ML	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
116	\N	f	NAVARRO CORREAS LOS ARBOLES CAB SAUV 750 ML	NAVARRO CORREAS LOS ARBOLES CAB SAUV 750 ML	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
117	\N	f	NAVARRO CORREAS LOS ARBOLES CAB. MALBEC 750 ML	NAVARRO CORREAS LOS ARBOLES CAB. MALBEC 750 ML	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
118	\N	f	NAVARRO CORREAS LOS ARBOLES MALBEC 750 ML	NAVARRO CORREAS LOS ARBOLES MALBEC 750 ML	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
119	\N	f	MILLER LATA 296 ML 	MILLER LATA 296 ML 	10	6	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	1	\N	f	f	24	/productos	\N	30	\N	t	f	\N
120	\N	f	MILLER LATA 355 ML	MILLER LATA 355 ML	10	12	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	1	\N	f	f	2	/productos	\N	30	\N	t	f	\N
121	\N	f	FINCA LA LINDA CABERNET SAUVIGNON 750 ML	FINCA LA LINDA CABERNET SAUVIGNON 750 ML	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
122	\N	f	FINCA LA LINDA MALBEC 750 ML	FINCA LA LINDA MALBEC 750 ML	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
123	\N	f	TRAPICHE VINEYARD CABERNET SAUVIGNON 750 ML	TRAPICHE VINEYARD CABERNET SAUVIGNON 750 ML	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
124	\N	f	TRAPICHE VINEYARD MALBEC 750 ML	TRAPICHE VINEYARD MALBEC 750 ML	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
125	\N	f	FINCA DO CARVALHO TINTO SUAVE 1 LT	FINCA DO CARVALHO TINTO SUAVE 1 LT	10	12	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
126	\N	f	FINCA DO CARVALHO TINTO SUAVE 2 LT	FINCA DO CARVALHO TINTO SUAVE 2 LT	10	6	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
127	\N	f	FINCA DO CARVALHO TINTO SUAVE 750 ML	FINCA DO CARVALHO TINTO SUAVE 750 ML	10	12	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
128	\N	f	BODEGA PRIVADA CABERNET SAUVIGNON 750ML	BODEGA PRIVADA CABERNET SAUVIGNON 750ML	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
129	\N	f	BODEGA PRIVADA TINTO MALBEC 750 ML	BODEGA PRIVADA TINTO MALBEC 750 ML	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
130	\N	f	MILLER HIGH LIFE BOT 710 ML	MILLER HIGH LIFE BOT 710 ML	10	15	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	1	\N	f	f	2	/productos	\N	30	\N	t	f	\N
132	\N	f	TORO CENTENARIO CABERNET SAUVIGNON 750 ML	TORO CENTENARIO CABERNET SAUVIGNON 750 ML	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
133	\N	f	ANTARCTICA ORIGINAL LATA 269 ML	ANTARCTICA ORIGINAL LATA 269 ML	10	12	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	1	\N	f	f	2	/productos	\N	30	\N	t	f	\N
134	\N	f	TORO VIEJO BIVARIETAL BONARDA SIRAH 1.125 L	TORO VIEJO BIVARIETAL BONARDA SIRAH 1.125 L	10	6	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
135	\N	f	ANTARCTICA ORIGINAL BOT 300 ML	ANTARCTICA ORIGINAL BOT 300 ML	10	12	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	1	\N	f	f	2	/productos	\N	30	\N	t	f	\N
136	\N	f	TORO CENTENARIO VINO TINTO 750 ML	TORO CENTENARIO VINO TINTO 750 ML	10	6	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
744	\N	\N	FORTIN CAÑA 200ML	FORTIN CAÑA 200ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	27	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
230	\N	f	CONTI BIER BOT 600ML	CONTI BIER BOT 600ML	10	1	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	1	\N	f	f	2	/productos	\N	600	\N	t	f	\N
137	\N	f	TORO VIEJO BIVARIETAL BONARDA SIRAH 750 ML	TORO VIEJO BIVARIETAL BONARDA SIRAH 750 ML	10	6	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
138	\N	f	TORO VIEJO CHENIN TORRONTES BLANCO 750 ML	TORO VIEJO CHENIN TORRONTES BLANCO 750 ML	10	6	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
139	\N	f	TORO VIEJO CLASICO 1.125 ML	TORO VIEJO CLASICO 1.125 ML	10	6	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
140	\N	f	TORO VIEJO CLASICO BLANCO 700 ML	TORO VIEJO CLASICO BLANCO 700 ML	10	6	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
141	\N	f	TORO VIEJO TINTO CLASICO 700 ML	TORO VIEJO TINTO CLASICO 700 ML	10	6	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
142	\N	f	TORO VIEJO VINO ROSADO 700 ML	TORO VIEJO VINO ROSADO 700 ML	10	6	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
143	\N	f	TORO CENTENARIO MALBEC 750 ML	TORO CENTENARIO MALBEC 750 ML	10	6	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
144	\N	f	ANTARCTICA ORIGINAL BOT 600 ML	ANTARCTICA ORIGINAL BOT 600 ML	10	12	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	1	\N	f	f	2	/productos	\N	30	\N	t	f	\N
146	\N	f	OURO FINO LATA 269 ML	OURO FINO LATA 269 ML	10	12	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	1	\N	f	f	2	/productos	\N	30	\N	t	f	\N
147	\N	f	STELLA ARTOIS BOT 330 ML 	STELLA ARTOIS BOT 330 ML 	10	6	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	1	\N	f	f	24	/productos	\N	30	\N	t	f	\N
148	\N	f	STELLA ARTOIS BOT 660 ML 	STELLA ARTOIS BOT 660 ML 	10	12	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	1	\N	f	f	2	/productos	\N	30	\N	t	f	\N
149	\N	f	STELLA ARTOIS LATA 250 ML	STELLA ARTOIS LATA 250 ML	10	6	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	1	\N	f	f	24	/productos	\N	30	\N	t	f	\N
150	\N	f	OURO FINO LITRO RETORNABLE	OURO FINO LITRO RETORNABLE	10	12	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	1	\N	f	f	2	/productos	\N	30	\N	t	f	\N
151	\N	f	ITAIPAVA BOT 600 ML RETORNABLE	ITAIPAVA BOT 600 ML RETORNABLE	10	24	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	1	\N	f	f	2	/productos	\N	30	\N	t	f	\N
152	\N	f	ITAIPAVA BOT 250 ML	ITAIPAVA BOT 250 ML	10	6	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	1	\N	f	f	12	/productos	\N	30	\N	t	f	\N
153	\N	f	BRAHMA LITRO RETORNABLE	BRAHMA LITRO RETORNABLE	10	12	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	1	\N	f	f	2	/productos	\N	30	\N	t	f	\N
154	\N	f	ITAIPAVA LATA 269 ML	ITAIPAVA LATA 269 ML	10	12	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	1	\N	f	f	2	/productos	\N	30	\N	t	f	\N
155	\N	f	POLAR ICE LATA 269 ML	POLAR ICE LATA 269 ML	10	12	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	1	\N	f	f	2	/productos	\N	30	\N	t	f	\N
156	\N	f	BURGUESA LATA 269 ML	BURGUESA LATA 269 ML	10	12	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	1	\N	f	f	2	/productos	\N	30	\N	t	f	\N
157	\N	f	MUNICH ORIGINAL BOT LITRO RETORNABLE	MUNICH ORIGINAL BOT LITRO RETORNABLE	10	12	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	1	\N	f	f	2	/productos	\N	30	\N	t	f	\N
158	\N	f	MUNICH ORIGINAL LATA 269 ML	MUNICH ORIGINAL LATA 269 ML	10	12	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	1	\N	f	f	2	/productos	\N	30	\N	t	f	\N
159	\N	f	MUNICH ROYAL BOT 350 ML	MUNICH ROYAL BOT 350 ML	10	12	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	1	\N	f	f	2	/productos	\N	30	\N	t	f	\N
2	\N	f	PILSEN CLASICA LATA 269 ML	PILSEN CLASICA LATA 269 ML	10	1	f	f	f	f	f	t	t	1	ENFRIABLE	2021-12-28 18:29:38.098151+00	1	\N	f	f	2	/productos	\N	30	\N	t	f	\N
160	\N	f	PRUEBA PRODUCTO 5	PRUEBA PRODUCTO 5	10	1	f	f	f	f	f	t	t	1	ENFRIABLE	2021-12-28 18:29:38.098151+00	1	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
162	\N	f	PRUDUCTO SIN CODIGO	PRUDUCTO SIN CODIGO	\N	1	f	f	f	f	f	t	t	1	ENFRIABLE	2021-12-28 18:29:38.098151+00	1	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
198	\N	f	SANTA HELENA RESERVADO CABERNET SAUV 750 ML	SANTA HELENA RESERVADO CABERNET SAUV 750 ML	10	1	f	f	f	f	f	t	t	3	ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
199	\N	f	SANTA HELENA RESERVADO CARMENERE 750 ML	SANTA HELENA RESERVADO CARMENERE 750 ML	10	1	f	f	f	f	f	t	t	3	ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
201	\N	f	SANTA HELENA RESERVADO MERLOT 750 ML	SANTA HELENA RESERVADO MERLOT 750 ML	10	1	f	f	f	f	f	t	t	3	ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
203	\N	f	PRUEBA PRODUCTO 6	PRUEBA PRODUCTO 6	10	1	t	f	f	f	f	t	t	2	ENFRIABLE	2021-12-28 18:29:38.098151+00	1	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
204	\N	f	HEINEKEN LATA 250 ML 	HEINEKEN LATA 250 ML 	10	1	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	1	\N	f	f	2	/productos	\N	30	\N	t	f	\N
205	\N	f	HEINEKEN DRAUGHTKET 5L	HEINEKEN DRAUGHTKET 5L	10	1	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	1	\N	f	f	2	/productos	\N	30	\N	t	f	\N
206	\N	f	PILSEN PURA MALTA LITRO RETORNABLE	PILSEN PURA MALTA LITRO RETORNABLE	10	1	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	1	\N	f	f	2	/productos	\N	30	\N	t	f	\N
207	\N	f	MILLER HIGH LIFE BOT 355ML	MILLER HIGH LIFE BOT 355ML	10	1	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	1	\N	f	f	2	/productos	\N	30	\N	t	f	\N
165	\N	f	TEST PRODUCTO VALUE	TEST PRODUCTO VALUE	\N	1	f	f	f	f	f	t	t	1	ENFRIABLE	2021-12-28 18:29:38.098151+00	1	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
166	\N	f	TEST PRODUCTO VALUE 2	TEST PRODUCTO VALUE	\N	1	f	f	f	f	f	t	t	1	ENFRIABLE	2021-12-28 18:29:38.098151+00	1	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
212	\N	f	KAISER LATA 269ML	KAISER LATA 269ML	10	1	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	1	\N	f	f	2	/productos	\N	30	\N	t	f	\N
213	\N	f	KAISER ULTRA CERO LATA 269ML	KAISER ULTRA CERO LATA 269ML	10	1	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	1	\N	f	f	2	/productos	\N	30	\N	t	f	\N
215	\N	f	NORTE BLANCA CERVEZA LATA 269ML	NORTE BLANCA CERVEZA LATA 269ML	10	1	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	1	\N	f	f	2	/productos	\N	30	\N	t	f	\N
220	\N	f	AMSTEL BIER BOT 650ML	AMSTEL BIER BOT 650ML	10	1	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	1	\N	f	f	2	/productos	\N	30	\N	t	f	\N
221	\N	f	AMSTEL BIER BOT 355ML	AMSTEL BIER BOT 355ML	10	1	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	1	\N	f	f	2	/productos	\N	30	\N	t	f	\N
222	\N	f	AMSTEL BIER LATA 250ML	AMSTEL BIER LATA 250ML	10	1	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	1	\N	f	f	2	/productos	\N	30	\N	t	f	\N
224	\N	f	AMSTEL LAGER LATA 350ML	AMSTEL LAGER LATA 350ML	10	1	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	1	\N	f	f	2	/productos	\N	30	\N	t	f	\N
225	\N	f	SKOL PROFISA BOT 330ML	SKOL PROFISA BOT 330ML	10	1	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	1	\N	f	f	2	/productos	\N	30	\N	t	f	\N
226	\N	f	CONTI ZERO GRAU LATA 269ML	CONTI ZERO GRAU LATA 269ML	10	1	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	1	\N	f	f	2	/productos	\N	30	\N	t	f	\N
919	\N	\N	CARBON BRITEZ KUE CHICO	CARBON BRITEZ KUE CHICO	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	36	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
227	\N	f	CONTI ZERO GRAU BOT 330ML	CONTI ZERO GRAU BOT 330ML	10	1	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	1	\N	f	f	2	/productos	\N	30	\N	t	f	\N
228	\N	f	CONTI ZERO GRAU BOT 660ML	CONTI ZERO GRAU BOT 660ML	10	1	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	1	\N	f	f	2	/productos	\N	30	\N	t	f	\N
229	\N	f	CONTI BIER LATA 269ML	CONTI BIER LATA 269ML	10	1	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	1	\N	f	f	2	/productos	\N	30	\N	t	f	\N
231	\N	f	EISENBAHN PILSEN LATA 350ML	EISENBAHN PILSEN LATA 350ML	10	1	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	1	\N	f	f	2	/productos	\N	30	\N	t	f	\N
232	\N	f	EISENBAHN PILSEN BOT 355ML	EISENBAHN PILSEN BOT 355ML	10	1	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	1	\N	f	f	2	/productos	\N	30	\N	t	f	\N
145	\N	f	OURO FINO LATA 354 ML	OURO FINO LATA 354 ML	10	1	f	f	f	f	f	t	t	2	ENFRIABLE	2021-12-28 18:29:38.098151+00	1	\N	f	f	2	/productos	\N	30	\N	t	f	\N
235	\N	f	EISENBAHN PILSEN BOT 600ML	EISENBAHN PILSEN BOT 600ML	10	1	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	1	\N	f	f	2	/productos	\N	30	\N	t	f	\N
236	\N	f	EISENBAHN PALE ALE LATA 350ML	EISENBAHN PALE ALE LATA 350ML	10	1	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	1	\N	f	f	2	/productos	\N	30	\N	t	f	\N
238	\N	f	EISENBAHN AMERICAN IPA LATA 350ML	EISENBAHN AMERICAN IPA LATA 350ML	10	1	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	1	\N	f	f	2	/productos	\N	30	\N	t	f	\N
239	\N	f	MUNICH ROYAL LATA 269ML	MUNICH ROYAL LATA 269ML	10	1	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	1	\N	f	f	2	/productos	\N	30	\N	t	f	\N
242	\N	f	ESTRELLA GALICIA NEGRA 0.0 ALCOHOL BOT 250 ML	ESTRELLA GALICIA NEGRA 0.0 ALCOHOL BOT 250 ML	10	1	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	1	\N	f	f	2	/productos	\N	30	\N	t	f	\N
241	\N	f	ESTRELLA GALICIA SIN GLUTEN BOT 330 ML	ESTRELLA GALICIA SIN GLUTEN BOT 330 ML	10	1	f	f	f	f	f	t	t	2	ENFRIABLE	2021-12-28 18:29:38.098151+00	1	\N	f	f	2	/productos	\N	30	\N	t	f	\N
243	\N	f	ESTRELLA GALICIA 0.0 ALCOHOL 250 ML	ESTRELLA GALICIA 0.0 ALCOHOL 250 ML	10	1	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	1	\N	f	f	2	/productos	\N	30	\N	t	f	\N
244	\N	f	ESTRELLA GALICIA PREMIUM LAGER BOT 355 ML	ESTRELLA GALICIA PREMIUM LAGER BOT 355 ML	10	1	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	1	\N	f	f	2	/productos	\N	30	\N	t	f	\N
245	\N	f	ESTRELLA GALICIA WORLD LAGER 355ML 	ESTRELLA GALICIA WORLD LAGER 355ML 	10	1	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	1	\N	f	f	2	/productos	\N	30	\N	t	f	\N
251	\N	f	SMIRNOFF ICE BOT 275 ML	SMIRNOFF ICE BOT 275 ML	10	1	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	17	\N	f	f	2	/productos	\N	30	\N	t	f	\N
252	\N	f	RED BULL ENERGY DRINK LATA 250 ML	RED BULL ENERGY DRINK LATA 250 ML	10	1	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	23	\N	f	f	2	/productos	\N	30	\N	t	f	\N
253	\N	f	RED BULL ENERGY DRINK LATA 473 ML	RED BULL ENERGY DRINK LATA 473 ML	10	1	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	23	\N	f	f	2	/productos	\N	30	\N	t	f	\N
254	\N	f	RED BULL THE COCO EDITION LATA 250 ML	RED BULL THE COCO EDITION LATA 250 ML	10	1	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	23	\N	f	f	2	/productos	\N	30	\N	t	f	\N
255	\N	f	RED BULL THE TROPICAL EDITION LATA 250 ML	RED BULL THE TROPICAL EDITION LATA 250 ML	10	1	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	23	\N	f	f	2	/productos	\N	30	\N	t	f	\N
256	\N	f	RED BULL THE ACAI EDITION LATA 250 ML	RED BULL THE ACAI EDITION LATA 250 ML	10	1	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	23	\N	f	f	2	/productos	\N	30	\N	t	f	\N
257	\N	f	RED BULL THE RED / MELANCIA EDITION LATA 250 ML	RED BULL THE RED / MELANCIA EDITION LATA 250 ML	10	1	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	23	\N	f	f	2	/productos	\N	30	\N	t	f	\N
258	\N	f	CONTI GASEOSA UVA 2LT	CONTI GASEOSA UVA 2LT	10	1	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	2	\N	f	f	2	/productos	\N	30	\N	t	f	\N
259	\N	f	TRES LEONES CAÑA ESPECIAL 875ML	TRES LEONES CAÑA ESPECIAL 875ML	10	1	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	17	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
261	\N	f	LEON POPULAR 425 ML	LEON POPULAR 425 ML	10	1	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	17	\N	f	f	2	/productos	\N	30	\N	t	f	\N
262	\N	f	TALLARICO VINO TINTO SUAVE 750 ML	TALLARICO VINO TINTO SUAVE 750 ML	10	1	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
263	\N	f	SANTANDER SIDRA 910ML	SANTANDER SIDRA 910ML	10	1	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	16	\N	f	f	2	/productos	\N	30	\N	t	f	\N
265	\N	f	NOVECENTO VINO CABERNET SAUVIGNON 750ML	NOVECENTO VINO CABERNET SAUVIGNON 750ML	10	1	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
266	\N	f	NOVECENTO VINO MALBEC 750ML	NOVECENTO VINO MALBEC 750ML	10	1	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
267	\N	f	ESPIRITU DE CHILE CARMENERE CLASICO 750 ML	ESPIRITU DE CHILE CARMENERE CLASICO 750 ML	10	1	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
268	\N	f	ESPIRITU DE CHILE CABERNET SAUVIGNON CLASICO 750 ML	ESPIRITU DE CHILE CABERNET SAUVIGNON CLASICO 750 ML	10	1	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
269	\N	f	VIÑAS DE BALBO 1.250 ML 	VIÑAS DE BALBO 1.250 ML 	10	1	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
270	\N	f	PULP NARANJA 1L	PULP NARANJA 1L	10	1	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	2	\N	f	f	2	/productos	\N	30	\N	t	f	\N
271	\N	f	PULP POMELO 1 L	PULP POMELO 1 L	10	1	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	2	\N	f	f	2	/productos	\N	30	\N	t	f	\N
272	\N	f	VINO CANCILLER BLEND MERLOT SYRAH MALBEC 750ML	VINO CANCILLER BLEND MERLOT SYRAH MALBEC 750ML	10	1	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
273	\N	f	BAUDUCCO WAFER VAINILLA 140G	BAUDUCCO WAFER VAINILLA 140G	10	1	f	f	t	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	18	\N	f	f	2	/productos	30	30	\N	t	f	\N
274	\N	f	BAUDUCCO WAFER FRUTILLA 140G	BAUDUCCO WAFER FRUTILLA 140G	10	1	f	f	t	f	f	t	t	4	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	18	\N	f	f	2	/productos	30	30	\N	t	f	\N
277	\N	\N	MINTY MENTA  17G	MINTY MENTA  17G	10	\N	\N	\N	f	\N	\N	t	t	4	\N	\N	25	\N	f	f	\N	/productos	\N	30	\N	t	f	\N
247	\N	\N	MIKS Nº 2 DURAZNO BOT 275ML	MIKS Nº 2 DURAZNO BOT 275ML	10	\N	\N	\N	f	\N	\N	t	t	4	ENFRIABLE	\N	17	\N	f	f	\N	/productos	\N	30	\N	t	f	\N
248	\N	\N	MIKS Nº 3 FRUTAS VERDES BOT 275 ML	MIKS Nº 3 FRUTAS VERDES BOT 275 ML	10	\N	\N	\N	f	\N	\N	t	t	4	ENFRIABLE	\N	17	\N	f	f	\N	/productos	\N	30	\N	t	f	\N
249	\N	\N	MIKS Nº 4 CITRUS BOT 275 ML	MIKS Nº 4 CITRUS BOT 275 ML	10	\N	\N	\N	f	\N	\N	t	t	4	ENFRIABLE	\N	17	\N	f	f	\N	/productos	\N	30	\N	t	f	\N
250	\N	\N	MIKS Nº 5 LIMON BOT 275 ML	MIKS Nº 5 LIMON BOT 275 ML	10	\N	\N	\N	f	\N	\N	t	t	4	ENFRIABLE	\N	17	\N	f	f	\N	/productos	\N	30	\N	t	f	\N
246	\N	\N	MIKS  Nº 1 FRUTILLA BOT 275ML	MIKS  Nº 1 FRUTILLA BOT 275ML	10	\N	\N	\N	f	\N	\N	t	t	4	ENFRIABLE	\N	17	\N	f	f	\N	/productos	\N	30	\N	t	f	\N
264	\N	\N	LA FARRUCA FRESAS FIZZ 710 ML	LA FARRUCA FRESAS FIZZ 710 ML	10	\N	\N	\N	f	\N	\N	t	t	4	ENFRIABLE	\N	16	\N	f	f	\N	/productos	\N	30	\N	t	f	\N
275	\N	\N	NESTLE ESPECIALIDADES 251G ROJO	NESTLE ESPECIALIDADES 251G ROJO	10	\N	\N	\N	f	\N	\N	t	t	4	\N	\N	24	\N	f	f	\N	/productos	\N	30	\N	t	f	\N
278	\N	\N	FREEGELLS LARANJA	FREEGELLS LARANJA	10	\N	\N	\N	f	\N	\N	t	t	4	\N	\N	25	\N	f	f	\N	/productos	\N	30	\N	t	f	\N
281	\N	f	ELMA CHIPS BACONZITOS 28G	ELMA CHIPS BACONZITOS 28G	10	1	f	f	f	f	f	t	t	4	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	18	\N	f	f	2	/productos	\N	30	\N	t	f	\N
282	\N	f	FANDANGOS FAMILIA PRESUNTO  140G / 164G 	FANDANGOS FAMILIA PRESUNTO  140G / 164G 	10	1	f	f	f	f	f	t	t	4	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	18	\N	f	f	2	/productos	\N	30	\N	t	f	\N
283	\N	f	FANDANGOS FAMILIA PRESUNTO 45G / 59G	FANDANGOS FAMILIA PRESUNTO 45G / 59G	10	1	f	f	f	f	f	t	t	4	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	18	\N	f	f	2	/productos	\N	30	\N	t	f	\N
284	\N	f	FANDANGOS FAMILIA QUEIJO ASADO 140G / 164G	FANDANGOS FAMILIA QUEIJO ASADO 140G / 164G	10	1	f	f	f	f	f	t	t	4	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	18	\N	f	f	2	/productos	\N	30	\N	t	f	\N
286	\N	f	ELMA CHIPS BACONZITOS 103G	ELMA CHIPS BACONZITOS 103G	10	1	f	f	f	f	f	t	t	4	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	18	\N	f	f	2	/productos	\N	30	\N	t	f	\N
287	\N	f	FANDANGOS FAMILIA QUEIJO ASADO 45G / 59G	FANDANGOS FAMILIA QUEIJO ASADO 45G / 59G	10	1	f	f	f	f	f	t	t	4	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	18	\N	f	f	2	/productos	\N	30	\N	t	f	\N
289	\N	f	KURUPI YERBA CITRUS YORADOR 500G	KURUPI YERBA CITRUS YORADOR 500G	10	1	f	f	f	f	f	t	t	4	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	26	\N	f	f	2	/productos	\N	30	\N	t	f	\N
290	\N	f	KURUPI YERBA MENTA Y BOLDO 500G	KURUPI YERBA MENTA Y BOLDO 500G	10	1	f	f	f	f	f	t	t	4	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	26	\N	f	f	2	/productos	\N	30	\N	t	f	\N
291	\N	f	KURUPI YERBA CLASICA 500G	KURUPI YERBA CLASICA 500G	10	1	f	f	f	f	f	t	t	4	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	26	\N	f	f	2	/productos	\N	30	\N	t	f	\N
292	\N	f	KURUPI YERBA KATUAVA 250G	KURUPI YERBA KATUAVA 250G	10	1	f	f	f	f	f	t	t	4	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	26	\N	f	f	2	/productos	\N	30	\N	t	f	\N
293	\N	f	KURUPI YERBA MENTA Y BOLDO 250G	KURUPI YERBA MENTA Y BOLDO 250G	10	1	f	f	f	f	f	t	t	4	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	26	\N	f	f	2	/productos	\N	30	\N	t	f	\N
294	\N	f	KURUPI YERBA KAPI`I Y MENTA 250G	KURUPI YERBA KAPI`I Y MENTA 250G	10	1	f	f	f	f	f	t	t	4	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	26	\N	f	f	2	/productos	\N	30	\N	t	f	\N
295	\N	f	MOGUL CEREBRITOS 30G	MOGUL CEREBRITOS 30G	10	1	f	f	f	f	f	t	t	4	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	25	\N	f	f	2	/productos	\N	30	\N	t	f	\N
296	\N	f	MOGUL VIBORITAS 30G	MOGUL VIBORITAS 30G	10	1	f	f	f	f	f	t	t	4	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	25	\N	f	f	2	/productos	\N	30	\N	t	f	\N
297	\N	f	HELLMANNS KETCHUP DOYPACK 500G	HELLMANNS KETCHUP DOYPACK 500G	10	1	f	f	f	f	f	t	t	4	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	21	\N	f	f	2	/productos	\N	30	\N	t	f	\N
298	\N	f	EXTRA PEPPERMINT 15 STICKS 	EXTRA PEPPERMINT 15 STICKS 	10	1	f	f	f	f	f	t	t	4	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	25	\N	f	f	2	/productos	\N	30	\N	t	f	\N
299	\N	f	EXTRA SPEARMINT 15 STICKS	EXTRA SPEARMINT 15 STICKS	10	1	f	f	f	f	f	t	t	4	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	25	\N	f	f	2	/productos	\N	30	\N	t	f	\N
301	\N	f	WATTS NECTAR DE MANZANA 200 ML	WATTS NECTAR DE MANZANA 200 ML	10	1	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	22	\N	f	f	2	/productos	\N	30	\N	t	f	\N
302	\N	f	WATTS NECTAR DE NARANJA 200 ML	WATTS NECTAR DE NARANJA 200 ML	10	1	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	22	\N	f	f	2	/productos	\N	30	\N	t	f	\N
303	\N	f	SALADIX DE PIZZA 100 G 	SALADIX DE PIZZA 100 G 	10	1	f	f	f	f	f	t	t	4	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	18	\N	f	f	2	/productos	\N	30	\N	t	f	\N
300	\N	f	AMENDUPA SNACKS DE QUEIJO 50G	AMENDUPA SNACKS DE QUEIJO 50G	10	1	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	18	\N	f	f	2	/productos	\N	30	\N	t	f	\N
306	\N	f	AMENDUPA SNACKS DE COSTELINHA SUINA 50G	AMENDUPA SNACKS DE COSTELINHA SUINA 50G	10	1	f	f	f	f	f	t	t	4	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	18	\N	f	f	2	/productos	\N	30	\N	t	f	\N
307	\N	f	AMENDUPA SNACKS DE BACON 50G	AMENDUPA SNACKS DE BACON 50G	10	1	f	f	f	f	f	t	t	4	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	18	\N	f	f	2	/productos	\N	30	\N	t	f	\N
308	\N	f	CAVALLARO AZAHAR DESODORANTE DE AMBIENTE 900 ML	CAVALLARO AZAHAR DESODORANTE DE AMBIENTE 900 ML	10	1	f	f	f	f	f	t	t	4	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	6	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
309	\N	f	YPE DETERGENTE NEUTRO 500 ML	YPE DETERGENTE NEUTRO 500 ML	10	1	f	f	f	f	f	t	t	4	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	6	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
310	\N	f	YPE DETERGENTE MANZANA 500 ML	YPE DETERGENTE MANZANA 500 ML	10	1	f	f	f	f	f	t	t	4	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	6	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
311	\N	f	SAN DIEGO PALMITO EN TROZOS 800 G	SAN DIEGO PALMITO EN TROZOS 800 G	10	1	f	f	f	f	f	t	t	4	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	19	\N	f	f	2	/productos	\N	30	\N	t	f	\N
314	\N	f	SAVORA MOSTAZA SACHET 250 G	SAVORA MOSTAZA SACHET 250 G	10	1	f	f	f	f	f	t	t	4	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	21	\N	f	f	2	/productos	\N	30	\N	t	f	\N
315	\N	f	BAUDUCCO WAFER CHOCOLATE 140 G	BAUDUCCO WAFER CHOCOLATE 140 G	10	1	f	f	f	f	f	t	t	4	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	18	\N	f	f	2	/productos	\N	30	\N	t	f	\N
316	\N	f	PULP NARANJA 2 L	PULP NARANJA 2 L	10	1	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	2	\N	f	f	2	/productos	\N	30	\N	t	f	\N
317	\N	f	PULP POMELO 2L	PULP POMELO 2L	10	1	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	2	\N	f	f	2	/productos	\N	30	\N	t	f	\N
318	\N	f	MIRINDA GUARANA 2L	MIRINDA GUARANA 2L	10	1	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	2	\N	f	f	2	/productos	\N	30	\N	t	f	\N
319	\N	f	DE LA COSTA AGUA SIN GAS 500ML	DE LA COSTA AGUA SIN GAS 500ML	10	1	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	5	\N	f	f	2	/productos	\N	30	\N	t	f	\N
320	\N	f	COROTE COCTEL TUTTI FRUTTI 500ML	COROTE COCTEL TUTTI FRUTTI 500ML	10	1	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	27	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
321	\N	f	COROTE COCTEL SABOR FRUTILLA 500ML	COROTE COCTEL SABOR FRUTILLA 500ML	10	1	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	27	\N	f	f	2	/productos	\N	30	\N	t	f	\N
322	\N	f	COROTE COCTEL BLUEBERRY 500ML	COROTE COCTEL BLUEBERRY 500ML	10	1	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	27	\N	f	f	2	/productos	\N	30	\N	t	f	\N
323	\N	f	FORTIN RON COCO 750ML	FORTIN RON COCO 750ML	10	1	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	27	\N	f	f	2	/productos	\N	30	\N	t	f	\N
288	\N	\N	KURUPI YERBA CEDRON CAPI´I 500G	KURUPI YERBA CEDRON CAPI´I 500G	10	\N	\N	\N	f	\N	\N	t	t	4	\N	\N	26	\N	f	f	\N	/productos	\N	30	\N	t	f	\N
304	\N	\N	SALADIX DUO JAMON Y QUESO DE 80 G	SALADIX DUO JAMON Y QUESO DE 80 G	10	\N	\N	\N	f	\N	\N	t	t	4	\N	\N	18	\N	f	f	\N	/productos	\N	30	\N	t	f	\N
285	\N	\N	CHEETOS LUA PARMESAO 140G	CHEETOS LUA PARMESAO 140G	10	\N	\N	\N	f	\N	\N	t	t	4	\N	\N	18	\N	f	f	\N	/productos	\N	30	\N	t	f	\N
280	\N	\N	ARCOR MENTHOPLUS STRONG	ARCOR MENTHOPLUS STRONG	10	\N	\N	\N	f	\N	\N	t	t	4	\N	\N	25	\N	f	f	\N	/productos	\N	\N	\N	t	f	\N
279	\N	\N	TOPLINE 6 UND 11G MENTOL	TOPLINE 6 UND 11G MENTOL	10	\N	\N	\N	f	\N	\N	t	t	4	\N	\N	25	\N	f	f	\N	/productos	\N	30	\N	t	f	\N
313	\N	\N	BON O BON BLANCO 450 GR X 30 UNIDAD	BON O BON BLANCO 450 GR X 30 UNIDAD	10	\N	\N	\N	f	\N	\N	t	t	4	\N	\N	24	\N	f	f	\N	/productos	\N	30	\N	t	f	\N
312	\N	\N	GILLETTE PRESTOBARBA ULTRAGRIP	GILLETTE PRESTOBARBA ULTRAGRIP	10	\N	\N	\N	f	\N	\N	t	t	4	\N	\N	6	\N	f	f	\N	/productos	\N	\N	\N	t	f	\N
324	\N	f	XERETA COLA 2 L	XERETA COLA 2 L	10	1	f	f	f	f	f	t	t	3	ENFRIABLE	2021-12-28 18:29:38.098151+00	2	\N	f	f	2	/productos	\N	30	\N	t	f	\N
325	\N	f	FORTIN RON BLANCO 750ML	FORTIN RON BLANCO 750ML	10	1	f	f	f	f	f	f	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	27	\N	f	f	2	/productos	\N	30	\N	t	f	\N
326	\N	f	FORTIN RON CANELA 750ML	FORTIN RON CANELA 750ML	10	1	f	f	f	f	f	f	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	27	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
327	\N	f	FORTIN RON LIMON 750ML	FORTIN RON LIMON 750ML	10	1	f	f	f	f	f	f	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	27	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
328	\N	f	XERETA TUBAINA 2 L	XERETA TUBAINA 2 L	10	1	f	f	f	f	f	t	t	3	ENFRIABLE	2021-12-28 18:29:38.098151+00	2	\N	f	f	2	/productos	\N	30	\N	t	f	\N
329	\N	f	CATUABA RANDON ACAI 900 ML	CATUABA RANDON ACAI 900 ML	10	1	f	f	f	f	f	t	t	3	ENFRIABLE	2021-12-28 18:29:38.098151+00	27	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
330	\N	f	CATUABA PITOLA 900 ML	CATUABA PITOLA 900 ML	10	1	f	f	f	f	f	f	t	3	ENFRIABLE	2021-12-28 18:29:38.098151+00	27	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
331	\N	f	SALTOS AGUA SIN GAS CON PICO 1L	SALTOS AGUA SIN GAS CON PICO 1L	10	1	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	5	\N	f	f	2	/productos	\N	30	\N	t	f	\N
332	\N	f	PITOLA AMENDUIM 900 ML	PITOLA AMENDUIM 900 ML	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	27	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
333	\N	f	CAMPESINO YERBA MENTA Y BOLDO 500 G	CAMPESINO YERBA MENTA Y BOLDO 500 G	10	1	f	f	f	f	f	t	t	3	ENFRIABLE	2021-12-28 18:29:38.098151+00	26	\N	f	f	2	/productos	\N	120	\N	t	f	\N
334	\N	f	FORTIN RESERVA ESPECIAL 8 AÑOS 750ML	FORTIN RESERVA ESPECIAL 8 AÑOS 750ML	10	1	f	f	f	f	f	f	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	27	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
335	\N	f	CAMPESINO YERBA FITNESS 500 G	CAMPESINO YERBA FITNESS 500 G	10	1	f	f	f	f	f	t	t	3	ENFRIABLE	2021-12-28 18:29:38.098151+00	26	\N	f	f	2	/productos	\N	120	\N	t	f	\N
336	\N	f	CAMPESINO YERBA TRADICIONAL HIERBAS NAT 500 G	CAMPESINO YERBA TRADICIONAL HIERBAS NAT 500 G	10	1	f	f	f	f	f	t	t	3	ENFRIABLE	2021-12-28 18:29:38.098151+00	26	\N	f	f	2	/productos	\N	120	\N	t	f	\N
337	\N	f	PAJARITO YERBA ELABORADA 500 G	PAJARITO YERBA ELABORADA 500 G	10	1	f	f	f	f	f	t	t	3	ENFRIABLE	2021-12-28 18:29:38.098151+00	26	\N	f	f	2	/productos	\N	120	\N	t	f	\N
338	\N	f	KURUPI YERBA MENTA Y LIMON 500 G	KURUPI YERBA MENTA Y LIMON 500 G	10	1	f	f	f	f	f	t	t	3	ENFRIABLE	2021-12-28 18:29:38.098151+00	26	\N	f	f	2	/productos	\N	120	\N	t	f	\N
339	\N	f	COLON YERBA SELECCION ESPECIAL 500 G	COLON YERBA SELECCION ESPECIAL 500 G	10	1	f	f	f	f	f	t	t	3	ENFRIABLE	2021-12-28 18:29:38.098151+00	26	\N	f	f	2	/productos	\N	120	\N	t	f	\N
340	\N	f	COLON YERBA TRADICIONAL 500 G	COLON YERBA TRADICIONAL 500 G	10	1	f	f	f	f	f	t	t	3	ENFRIABLE	2021-12-28 18:29:38.098151+00	26	\N	f	f	2	/productos	\N	120	\N	t	f	\N
341	\N	f	JOINVILLE VASO (7941) 680ML	JOINVILLE VASO (7941) 680ML	10	1	f	f	f	f	f	t	t	4	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	28	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
342	\N	f	KURUPI YERBA TRADICIONAL 100% 250 G	KURUPI YERBA TRADICIONAL 100% 250 G	10	1	f	f	f	f	f	t	t	3	ENFRIABLE	2021-12-28 18:29:38.098151+00	26	\N	f	f	2	/productos	\N	120	\N	t	f	\N
343	\N	f	NADIR MUNICH VASO (7709) 300ML	NADIR MUNICH VASO (7709) 300ML	10	1	f	f	f	f	f	t	t	4	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	28	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
344	\N	f	KURUPI YERBA TRADICIONAL 100% 500 G	KURUPI YERBA TRADICIONAL 100% 500 G	10	1	f	f	f	f	f	t	t	3	ENFRIABLE	2021-12-28 18:29:38.098151+00	26	\N	f	f	2	/productos	\N	120	\N	t	f	\N
345	\N	f	CAMPESINO YERBA TRADICIONAL HIERBAS NAT 250 G	CAMPESINO YERBA TRADICIONAL HIERBAS NAT 250 G	10	1	f	f	f	f	f	t	t	3	ENFRIABLE	2021-12-28 18:29:38.098151+00	26	\N	f	f	2	/productos	\N	120	\N	t	f	\N
346	\N	f	RANDON VINO TINTO SUAVE 750 ML	RANDON VINO TINTO SUAVE 750 ML	10	1	f	f	f	f	f	t	t	3	ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	30	\N	t	f	\N
347	\N	f	KURUPI YERBA CITRUS YORADOR 250 G	KURUPI YERBA CITRUS YORADOR 250 G	10	1	f	f	f	f	f	t	t	3	ENFRIABLE	2021-12-28 18:29:38.098151+00	26	\N	f	f	2	/productos	\N	120	\N	t	f	\N
348	\N	f	VASO (7909) MUNICH 530ML 	VASO (7909) MUNICH 530ML 	10	1	f	f	f	f	f	t	t	4	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	28	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
349	\N	f	NADIR MUNICH VASO (7109) 200ML	NADIR MUNICH VASO (7109) 200ML	10	1	f	f	f	f	f	t	t	4	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	28	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
350	\N	f	NADIR STOUT VASO (7051) 473ML	NADIR STOUT VASO (7051) 473ML	10	1	f	f	f	f	f	t	t	4	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	28	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
351	\N	f	LONDON VASO (7551) 540ML	LONDON VASO (7551) 540ML	10	1	f	f	f	f	f	t	t	4	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	28	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
352	\N	f	NADIR COPA GIN (7948) 600ML	NADIR COPA GIN (7948) 600ML	10	1	f	f	f	f	f	t	t	4	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	28	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
353	\N	f	CONTROL ADAPTA RETARDANTE 3 UNID	CONTROL ADAPTA RETARDANTE 3 UNID	10	1	f	f	f	f	f	t	t	3	ENFRIABLE	2021-12-28 18:29:38.098151+00	30	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
354	\N	f	NADIR COPA EMPERATRIZ (7933) 590ML	NADIR COPA EMPERATRIZ (7933) 590ML	10	1	f	f	f	f	f	t	t	4	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	28	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
355	\N	f	CONTROL ADAPTA NATURE 3 UNID	CONTROL ADAPTA NATURE 3 UNID	10	1	f	f	f	f	f	t	t	3	ENFRIABLE	2021-12-28 18:29:38.098151+00	30	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
356	\N	f	CONTROL ADAPTA RETARDANTE X 6 UNID	CONTROL ADAPTA RETARDANTE X 6 UNID	10	1	f	f	f	f	f	t	t	3	ENFRIABLE	2021-12-28 18:29:38.098151+00	30	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
358	\N	f	WINDSOR COPA (7128) 250 ML	WINDSOR COPA (7128) 250 ML	10	1	f	f	f	f	f	t	t	3	ENFRIABLE	2021-12-28 18:29:38.098151+00	28	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
359	\N	f	TEMPEROS MAIS VIDA SAL GROSSO VERDE 500G	TEMPEROS MAIS VIDA SAL GROSSO VERDE 500G	10	1	f	f	f	f	f	t	t	4	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	31	\N	f	f	2	/productos	\N	30	\N	t	f	\N
360	\N	f	PAJARITO YERBA HIERBAS NATURALES 500 G	PAJARITO YERBA HIERBAS NATURALES 500 G	10	1	f	f	f	f	f	t	t	3	ENFRIABLE	2021-12-28 18:29:38.098151+00	26	\N	f	f	2	/productos	\N	120	\N	t	f	\N
361	\N	f	COLON YERBA MATE SUAVE 500 G	COLON YERBA MATE SUAVE 500 G	10	1	f	f	f	f	f	t	t	3	ENFRIABLE	2021-12-28 18:29:38.098151+00	26	\N	f	f	2	/productos	\N	120	\N	t	f	\N
362	\N	f	COLON YERBA STEVIA KAA HEE 250 G	COLON YERBA STEVIA KAA HEE 250 G	10	1	f	f	f	f	f	t	t	3	ENFRIABLE	2021-12-28 18:29:38.098151+00	26	\N	f	f	2	/productos	\N	120	\N	t	f	\N
363	\N	f	CAMPESINO YERBA MANZANILLA Y ANIS 250 G	CAMPESINO YERBA MANZANILLA Y ANIS 250 G	10	1	f	f	f	f	f	t	t	3	ENFRIABLE	2021-12-28 18:29:38.098151+00	26	\N	f	f	2	/productos	\N	120	\N	t	f	\N
365	\N	f	CAMPESINO YERBA CEDRON 500 G	CAMPESINO YERBA CEDRON 500 G	10	1	f	f	f	f	f	t	t	3	ENFRIABLE	2021-12-28 18:29:38.098151+00	26	\N	f	f	2	/productos	\N	120	\N	t	f	\N
366	\N	f	COLON YERBA MENTA-BOLDO 500 G	COLON YERBA MENTA-BOLDO 500 G	10	1	f	f	f	f	f	t	t	3	ENFRIABLE	2021-12-28 18:29:38.098151+00	26	\N	f	f	2	/productos	\N	120	\N	t	f	\N
367	\N	f	TEMPEROS MAIS VIDA SAL GROSSO ROJO 500G	TEMPEROS MAIS VIDA SAL GROSSO ROJO 500G	10	1	f	f	f	f	f	t	t	4	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	31	\N	f	f	2	/productos	\N	30	\N	t	f	\N
559	\N	\N	NINFA WAFER CHOCOLATE	NINFA WAFER CHOCOLATE	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	18	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
368	\N	f	CAMPESINO YERBA DOBLE MENTA Y BOLDO 500 G	CAMPESINO YERBA DOBLE MENTA Y BOLDO 500 G	10	1	f	f	f	f	f	t	t	3	ENFRIABLE	2021-12-28 18:29:38.098151+00	26	\N	f	f	2	/productos	\N	120	\N	t	f	\N
369	\N	f	ARCOIRIS SAL FINA YODADA 500G	ARCOIRIS SAL FINA YODADA 500G	10	1	f	f	f	f	f	t	t	4	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	31	\N	f	f	2	/productos	\N	30	\N	t	f	\N
370	\N	f	COLON YERBA MORINGA KATUAVA BURRITO 500 G	COLON YERBA MORINGA KATUAVA BURRITO 500 G	10	1	f	f	f	f	f	t	t	3	ENFRIABLE	2021-12-28 18:29:38.098151+00	26	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
371	\N	f	COLON YERBA TRADICIONAL 250 G	COLON YERBA TRADICIONAL 250 G	10	1	f	f	f	f	f	t	t	3	ENFRIABLE	2021-12-28 18:29:38.098151+00	26	\N	f	f	2	/productos	\N	120	\N	t	f	\N
373	\N	f	ARCOIRIS SAL CONDIMENTADA 400G	ARCOIRIS SAL CONDIMENTADA 400G	10	1	f	f	f	f	f	t	t	4	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	31	\N	f	f	2	/productos	\N	30	\N	t	f	\N
374	\N	f	ARCOIRIS SAL ENTREFINA AHUMADA 400G	ARCOIRIS SAL ENTREFINA AHUMADA 400G	10	1	f	f	f	f	f	t	t	4	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	31	\N	f	f	2	/productos	\N	30	\N	t	f	\N
375	\N	f	PARRILLITA DE ALUMINIO DESMONTABLE	PARRILLITA DE ALUMINIO DESMONTABLE	10	1	f	f	f	f	f	t	t	3	ENFRIABLE	2021-12-28 18:29:38.098151+00	28	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
376	\N	f	100 PIPERS 1 L WHISKY	100 PIPERS 1 L WHISKY	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	17	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
377	\N	f	GRAN PAR WHISKY 1 L	GRAN PAR WHISKY 1 L	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	17	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
378	\N	f	ARCOIRIS SAL CONDIMENTADA CON PIMIENTA 400G	ARCOIRIS SAL CONDIMENTADA CON PIMIENTA 400G	10	1	f	f	f	f	f	t	t	4	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	31	\N	f	f	2	/productos	\N	30	\N	t	f	\N
379	\N	f	ARCOIRIS SAL FINA MARINA CONDIMENTADA 400G	ARCOIRIS SAL FINA MARINA CONDIMENTADA 400G	10	1	f	f	f	f	f	t	t	4	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	31	\N	f	f	2	/productos	\N	30	\N	t	f	\N
380	\N	f	ARCOIRIS SAL ENTREFINA MARINA CONDIMENTADA 400G	ARCOIRIS SAL ENTREFINA MARINA CONDIMENTADA 400G	10	1	f	f	f	f	f	t	t	4	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	31	\N	f	f	2	/productos	\N	30	\N	t	f	\N
381	\N	f	TEMPEROS MAIS VIDA SAL CONDIMENTADA 500G	TEMPEROS MAIS VIDA SAL CONDIMENTADA 500G	10	1	f	f	f	f	f	t	t	4	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	31	\N	f	f	2	/productos	\N	30	\N	t	f	\N
382	\N	f	CLAN MAC GREGOR 1 L	CLAN MAC GREGOR 1 L	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	17	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
383	\N	f	GARÇA GRILL SAL GRUEZA 1KG	GARÇA GRILL SAL GRUEZA 1KG	10	1	f	f	f	f	f	t	t	4	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	31	\N	f	f	2	/productos	\N	30	\N	t	f	\N
384	\N	f	CAMPO LARGO TINTO SUAVE 750 ML	CAMPO LARGO TINTO SUAVE 750 ML	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
385	\N	f	JOHNNIE WALKER RED LABEL 200 ML	JOHNNIE WALKER RED LABEL 200 ML	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	17	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
386	\N	f	PAPEL HIGIENICO DUPLA HOJA VARIOS  X UNIDAD	PAPEL HIGIENICO DUPLA HOJA VARIOS  X UNIDAD	10	1	f	f	f	f	f	f	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	6	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
388	\N	f	GRANTS 200 ML	GRANTS 200 ML	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	17	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
389	\N	f	JOHNNIE WALKER BLACK LABEL 375 ML	JOHNNIE WALKER BLACK LABEL 375 ML	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	17	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
390	\N	f	TANQUERAY DRY GIN 750 ML	TANQUERAY DRY GIN 750 ML	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	27	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
391	\N	f	OLD TRADI CARTA DE PLATA 500 ML	OLD TRADI CARTA DE PLATA 500 ML	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	17	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
392	\N	f	ECOPOWER CARGADOR DE IPHONE 2.1A EP7052	ECOPOWER CARGADOR DE IPHONE 2.1A EP7052	10	1	f	f	f	f	f	t	t	4	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	14	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
393	\N	f	SMIRNOFF VODKA 1 L	SMIRNOFF VODKA 1 L	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	27	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
394	\N	f	SIR ALBERT PREMIUM RESERVE 1 L	SIR ALBERT PREMIUM RESERVE 1 L	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	17	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
395	\N	f	ENCENDEDOR VARIOS	ENCENDEDOR VARIOS	10	1	f	f	f	f	f	t	t	4	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	32	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
396	\N	f	CAPEL PISCO SOUR 700 ML	CAPEL PISCO SOUR 700 ML	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	27	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
397	\N	f	JOHN BARR WHISKY 1 L	JOHN BARR WHISKY 1 L	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	17	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
398	\N	f	JOSE CUERVO REPOSADO 750 ML	JOSE CUERVO REPOSADO 750 ML	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	27	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
399	\N	f	STOLICHNAYA VODKA 1 L	STOLICHNAYA VODKA 1 L	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	27	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
400	\N	f	BOMBAY SAPPHIRE DRY GIN 750 ML	BOMBAY SAPPHIRE DRY GIN 750 ML	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	27	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
401	\N	f	AMARULA LICOR 750 ML	AMARULA LICOR 750 ML	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	27	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
402	\N	f	TRES LEONES RON ETIQUETA NEGRA 720 ML	TRES LEONES RON ETIQUETA NEGRA 720 ML	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	17	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
403	\N	f	INDOMITA MERLOT 750 ML	INDOMITA MERLOT 750 ML	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
404	\N	f	JP CHENET ROSE 750ML	JP CHENET ROSE 750ML	10	1	f	f	f	f	f	f	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	16	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
405	\N	f	INDOMITA CABERNET SAUVIGNON 750 ML	INDOMITA CABERNET SAUVIGNON 750 ML	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
406	\N	f	INDOMITA CARMENERE 750	INDOMITA CARMENERE 750	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
407	\N	f	FORTIN CARRULIM 200 ML	FORTIN CARRULIM 200 ML	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	17	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
408	\N	f	FERNET BRANCA 750ML	FERNET BRANCA 750ML	10	1	f	f	f	f	f	f	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	27	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
409	\N	f	JABON EN PAN AGRICULTOR 180 G	JABON EN PAN AGRICULTOR 180 G	10	1	f	f	f	f	f	t	t	3	ENFRIABLE	2021-12-28 18:29:38.098151+00	6	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
410	\N	f	LANCERS ROSE SERVE CHILLED 750ML	LANCERS ROSE SERVE CHILLED 750ML	10	1	f	f	f	f	f	f	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	27	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
411	\N	f	VINOVALIE ROSE PISCINE 750ML	VINOVALIE ROSE PISCINE 750ML	10	1	f	f	f	f	f	f	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
413	\N	f	HEMMER ACEITUNAS VERDES RECHEADAS LOCOTE 140 G	HEMMER ACEITUNAS VERDES RECHEADAS LOCOTE 140 G	10	1	f	f	f	f	f	t	t	3	ENFRIABLE	2021-12-28 18:29:38.098151+00	21	\N	f	f	2	/productos	\N	120	\N	t	f	\N
414	\N	f	HEMMER ACEITUNAS VERDES FATIADAS 150 G SACHET	HEMMER ACEITUNAS VERDES FATIADAS 150 G SACHET	10	1	f	f	f	f	f	t	t	3	ENFRIABLE	2021-12-28 18:29:38.098151+00	21	\N	f	f	2	/productos	\N	120	\N	t	f	\N
920	\N	\N	CARBON BRITEZ KUE MEDIANO	CARBON BRITEZ KUE MEDIANO	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	36	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
415	\N	f	PARANA VINO TINTO SUAVE 750ML	PARANA VINO TINTO SUAVE 750ML	10	1	f	f	f	f	f	f	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
416	\N	f	HEMMER ACEITUNAS VERDES CON SEMILLA 180 G	HEMMER ACEITUNAS VERDES CON SEMILLA 180 G	10	1	f	f	f	f	f	t	t	3	ENFRIABLE	2021-12-28 18:29:38.098151+00	21	\N	f	f	2	/productos	\N	120	\N	t	f	\N
417	\N	f	SANTA CAROLINA ESTRELLAS MERLOT 750ML	SANTA CAROLINA ESTRELLAS MERLOT 750ML	10	1	f	f	f	f	f	f	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
104	\N	f	VALLE DE UCO LA CELIA PIONNER MALBEC 750ML	VALLE DE UCO LA CELIA PIONNER MALBEC 750ML	10	1	f	f	f	f	f	f	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	15	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
418	\N	f	PALERMO GREEN 20	PALERMO GREEN 20	10	1	f	f	f	f	f	t	t	4	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	11	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
419	\N	f	ARCOIRIS CONDIMIENTO PARA CARNE 15 G	ARCOIRIS CONDIMIENTO PARA CARNE 15 G	10	1	f	f	f	f	f	t	t	3	ENFRIABLE	2021-12-28 18:29:38.098151+00	31	\N	f	f	2	/productos	\N	120	\N	t	f	\N
420	\N	f	ARCOIRIS AJI PICANTE 15 G	ARCOIRIS AJI PICANTE 15 G	10	1	f	f	f	f	f	t	t	3	ENFRIABLE	2021-12-28 18:29:38.098151+00	26	\N	f	f	2	/productos	\N	120	\N	t	f	\N
421	\N	f	ARCOIRIS CHIMICHURRI 15 G	ARCOIRIS CHIMICHURRI 15 G	10	1	f	f	f	f	f	t	t	3	ENFRIABLE	2021-12-28 18:29:38.098151+00	31	\N	f	f	2	/productos	\N	120	\N	t	f	\N
422	\N	f	ARCOIRIS COMINO MOLIDO 25 G	ARCOIRIS COMINO MOLIDO 25 G	10	1	f	f	f	f	f	t	t	3	ENFRIABLE	2021-12-28 18:29:38.098151+00	31	\N	f	f	2	/productos	\N	120	\N	t	f	\N
423	\N	f	PALERMO GREEN 10 	PALERMO GREEN 10 	10	1	f	f	f	f	f	t	t	4	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	11	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
424	\N	f	FOX ORIGINAL BOX 20	FOX ORIGINAL BOX 20	10	1	f	f	f	f	f	t	t	4	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	11	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
426	\N	f	ARCOIRIS KURATU CILANTRO MOLIDO 15 G	ARCOIRIS KURATU CILANTRO MOLIDO 15 G	10	1	f	f	f	f	f	t	t	3	ENFRIABLE	2021-12-28 18:29:38.098151+00	31	\N	f	f	2	/productos	\N	120	\N	t	f	\N
427	\N	f	ARCOIRIS AJO DESHIDRATADO 15 G	ARCOIRIS AJO DESHIDRATADO 15 G	10	1	f	f	f	f	f	t	t	3	ENFRIABLE	2021-12-28 18:29:38.098151+00	31	\N	f	f	2	/productos	\N	120	\N	t	f	\N
429	\N	f	ARCOIRIS BURRITO 15 G	ARCOIRIS BURRITO 15 G	10	1	f	f	f	f	f	t	t	3	ENFRIABLE	2021-12-28 18:29:38.098151+00	31	\N	f	f	2	/productos	\N	120	\N	t	f	\N
430	\N	f	ARCOIRIS MEZCLA HIERBAS 15 G	ARCOIRIS MEZCLA HIERBAS 15 G	10	1	f	f	f	f	f	t	t	3	ENFRIABLE	2021-12-28 18:29:38.098151+00	31	\N	f	f	2	/productos	\N	120	\N	t	f	\N
432	\N	f	ARCOIRIS ANIS ESTRELLADO 15 G	ARCOIRIS ANIS ESTRELLADO 15 G	10	1	f	f	f	f	f	t	t	3	ENFRIABLE	2021-12-28 18:29:38.098151+00	31	\N	f	f	2	/productos	\N	120	\N	t	f	\N
433	\N	f	LUCKY STRIKE DOUBLE CLICK WILD 20	LUCKY STRIKE DOUBLE CLICK WILD 20	10	1	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	11	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
434	\N	f	NAVARRO SALSA DE SOJA 200 ML	NAVARRO SALSA DE SOJA 200 ML	10	1	f	f	f	f	f	t	t	3	ENFRIABLE	2021-12-28 18:29:38.098151+00	21	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
435	\N	f	NAVARRO SALSA DE SOJA 400 ML	NAVARRO SALSA DE SOJA 400 ML	10	1	f	f	f	f	f	t	t	3	ENFRIABLE	2021-12-28 18:29:38.098151+00	21	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
436	\N	f	LUCKY STRIKE DOUBLE CLICK WILD 10	LUCKY STRIKE DOUBLE CLICK WILD 10	10	1	f	f	f	f	f	t	t	4	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	11	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
437	\N	f	ARCOIRIS BOLDO 15 G	ARCOIRIS BOLDO 15 G	10	1	f	f	f	f	f	t	t	3	ENFRIABLE	2021-12-28 18:29:38.098151+00	31	\N	f	f	2	/productos	\N	120	\N	t	f	\N
438	\N	f	DOBLE V ETIQUETA NEGRA 1 L	DOBLE V ETIQUETA NEGRA 1 L	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	17	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
439	\N	f	BLACK STONE HONEY 1 L	BLACK STONE HONEY 1 L	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	17	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
440	\N	f	LUCKY STRIKE SWITCH 20 	LUCKY STRIKE SWITCH 20 	10	1	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	11	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
441	\N	f	LUCKY STRIKE SWITCH 10	LUCKY STRIKE SWITCH 10	10	1	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	11	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
442	\N	f	SIR EDWARDS 1 L	SIR EDWARDS 1 L	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	17	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
443	\N	f	BLACK STONE NEGRO 1 L	BLACK STONE NEGRO 1 L	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	17	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
444	\N	f	CHESTERFIELD REMIX BOX 11	CHESTERFIELD REMIX BOX 11	10	1	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	11	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
445	\N	f	SAN DIEGO PALMITO ENTERO VDR 360 G	SAN DIEGO PALMITO ENTERO VDR 360 G	10	1	f	f	f	f	f	t	t	3	ENFRIABLE	2021-12-28 18:29:38.098151+00	19	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
446	\N	f	LUCKY STRIKE ENIGMA 20	LUCKY STRIKE ENIGMA 20	10	1	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	11	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
447	\N	f	COAMO OLEO DE SOJA 900 ML	COAMO OLEO DE SOJA 900 ML	10	1	f	f	f	f	f	t	t	3	ENFRIABLE	2021-12-28 18:29:38.098151+00	21	\N	f	f	2	/productos	\N	120	\N	t	f	\N
448	\N	f	SAN MARINO BOX 20 	SAN MARINO BOX 20 	10	1	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	11	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
450	\N	f	GAUCHO PARRILLA P/ PESCADO M 19.5CM X 29.5CM	GAUCHO PARRILLA P/ PESCADO M 19.5CM X 29.5CM	10	1	f	f	f	f	f	t	t	3	ENFRIABLE	2021-12-28 18:29:38.098151+00	28	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
451	\N	f	SALTOS AGUA SIN GAS 500ML	SALTOS AGUA SIN GAS 500ML	10	1	f	f	f	f	f	f	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	5	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
452	\N	f	SANDY MAC 1L	SANDY MAC 1L	10	1	f	f	f	f	f	f	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	17	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
453	\N	f	CEBILA ACEITUNAS DESCAROZADAS 160 G	CEBILA ACEITUNAS DESCAROZADAS 160 G	10	1	f	f	f	f	f	t	t	3	ENFRIABLE	2021-12-28 18:29:38.098151+00	21	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
454	\N	f	CAPEL MIX MANGO COLADA 700 ML	CAPEL MIX MANGO COLADA 700 ML	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	27	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
455	\N	f	JACK DANIELS HONEY 1 L	JACK DANIELS HONEY 1 L	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	17	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
456	\N	f	CIROC PEACH VODKA 750 ML	CIROC PEACH VODKA 750 ML	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	27	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
457	\N	f	SALTOS AGUA SIN GAS 2L	SALTOS AGUA SIN GAS 2L	10	1	f	f	f	f	f	f	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	5	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
412	\N	\N	HEMMER ACEITUNAS VERDES SIN SEMILLA 140 G	HEMMER ACEITUNAS VERDES SIN SEMILLA 140 G	10	\N	\N	\N	f	\N	\N	t	t	4	\N	\N	21	\N	f	f	\N	/productos	\N	365	\N	t	f	\N
428	\N	\N	ELEGANCE SUP. SLIM LIGHTS 20 AZUL	ELEGANCE SUP. SLIM LIGHTS 20 AZUL	10	\N	\N	\N	f	\N	\N	t	t	4	\N	\N	11	\N	f	f	\N	/productos	\N	\N	\N	t	f	\N
425	\N	\N	ELEGANCE SUP. SLIM ULTRA 20 GRIS	ELEGANCE SUP. SLIM ULTRA 20 GRIS	10	\N	\N	\N	f	\N	\N	t	t	4	\N	\N	11	\N	f	f	\N	/productos	\N	\N	\N	t	f	\N
431	\N	\N	EURO STAR BOX 20 	EURO STAR BOX 20 	10	\N	\N	\N	f	\N	\N	t	t	4	\N	\N	11	\N	f	f	\N	/productos	\N	\N	\N	t	f	\N
449	\N	\N	MARLBORO VISTA FOREST FUSION 20	MARLBORO VISTA FOREST FUSION 20	10	\N	\N	\N	f	\N	\N	t	t	4	\N	\N	11	\N	f	f	\N	/productos	\N	\N	\N	t	f	\N
458	\N	f	CIROC RED BERRY VODKA 750 ML	CIROC RED BERRY VODKA 750 ML	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	27	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
921	\N	\N	CARBON BRITEZ KUE GRANDE	CARBON BRITEZ KUE GRANDE	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	36	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
459	\N	f	CIROC VODKA 750 ML	CIROC VODKA 750 ML	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	27	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
462	\N	f	JOHNNIE WALKER RED LABEL 500 ML	JOHNNIE WALKER RED LABEL 500 ML	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	17	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
463	\N	f	JOHNNIE WALKER RED LABEL 375 ML	JOHNNIE WALKER RED LABEL 375 ML	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	17	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
464	\N	f	CONTI GASEOSA COLA 2L	CONTI GASEOSA COLA 2L	10	1	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	2	\N	f	f	2	/productos	\N	30	\N	t	f	\N
465	\N	f	NEMIROFF ORIGINAL VODKA 1 L	NEMIROFF ORIGINAL VODKA 1 L	10	1	f	f	f	f	f	t	t	3	ENFRIABLE	2021-12-28 18:29:38.098151+00	27	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
466	\N	f	TEQUILERO DEL LESTE REPOSADO 750 ML	TEQUILERO DEL LESTE REPOSADO 750 ML	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	27	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
467	\N	f	TEQUILERO DEL LESTE SILVER 750 ML	TEQUILERO DEL LESTE SILVER 750 ML	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	27	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
468	\N	f	NINNOFF VODKA PINK LEMONADE 900 ML	NINNOFF VODKA PINK LEMONADE 900 ML	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	27	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
469	\N	f	VEGAS CONHAQUE 1 L	VEGAS CONHAQUE 1 L	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	27	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
70	\N	f	HEINEKEN BOT 250 ML	HEINEKEN BOT 250 ML	10	1	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	1	\N	f	f	2	/productos	\N	30	\N	t	f	\N
470	\N	f	OLD TRADI ETIQUETA NEGRA 750 ML C/ VASO	OLD TRADI ETIQUETA NEGRA 750 ML C/ VASO	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	17	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
471	\N	f	OLD TRADI ETIQUETA NEGRA 500 ML C/VASO	OLD TRADI ETIQUETA NEGRA 500 ML C/VASO	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	17	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
472	\N	f	COCA COLA LATA 350ML	COCA COLA LATA 350ML	10	1	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	2	\N	f	f	2	/productos	\N	30	\N	t	f	\N
473	\N	f	OLD TRADI ETIQUETA NEGRA 500 ML	OLD TRADI ETIQUETA NEGRA 500 ML	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	17	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
474	\N	f	SPRITE LATA 350ML	SPRITE LATA 350ML	10	1	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	2	\N	f	f	2	/productos	\N	30	\N	t	f	\N
475	\N	f	CAPITAN CORTEZ RON CARTA BLANCA 965 ML	CAPITAN CORTEZ RON CARTA BLANCA 965 ML	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	27	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
476	\N	f	ANTARCTICA GUARANA LATA 269ML	ANTARCTICA GUARANA LATA 269ML	10	1	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	2	\N	f	f	2	/productos	\N	30	\N	t	f	\N
477	\N	f	WHITE HORSE C/CAJA 1 L	WHITE HORSE C/CAJA 1 L	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	17	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
478	\N	f	FANTA UVA LATA 350ML	FANTA UVA LATA 350ML	10	1	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	2	\N	f	f	2	/productos	\N	30	\N	t	f	\N
479	\N	f	BALLANTINES 8 AÑOS S/CAJA 1 L	BALLANTINES 8 AÑOS S/CAJA 1 L	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	17	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
480	\N	f	FANTA NARANJA LATA 350ML	FANTA NARANJA LATA 350ML	10	1	f	f	f	f	f	t	t	4	ENFRIABLE	2021-12-28 18:29:38.098151+00	2	\N	f	f	2	/productos	\N	30	\N	t	f	\N
481	\N	f	THE BREEDERS CHOICE 1 L	THE BREEDERS CHOICE 1 L	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	17	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
482	\N	f	FORTIN ETIQUETA NEGRA 475 ML	FORTIN ETIQUETA NEGRA 475 ML	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	17	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
483	\N	f	TRES LEONES ETIQUETA NEGRA 420 ML	TRES LEONES ETIQUETA NEGRA 420 ML	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	27	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
484	\N	f	ARISTOCRATA ETIQUETA NEGRA 750 ML	ARISTOCRATA ETIQUETA NEGRA 750 ML	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	17	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
485	\N	f	ARISTOCRATA ETIQUETA NEGRA 450 ML	ARISTOCRATA ETIQUETA NEGRA 450 ML	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	17	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
486	\N	f	BID LICOR DE MENTA 720 ML	BID LICOR DE MENTA 720 ML	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	27	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
487	\N	f	BID LICOR DE AMARULA 720 ML	BID LICOR DE AMARULA 720 ML	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	27	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
488	\N	f	PUERTO DE INDIAS GIN PURE BLACK 700 ML	PUERTO DE INDIAS GIN PURE BLACK 700 ML	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	27	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
490	\N	f	GRANTS 500 ML	GRANTS 500 ML	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	17	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
491	\N	f	GRANTS 350 ML	GRANTS 350 ML	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	17	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
492	\N	f	GIN INTENCION 900 ML	GIN INTENCION 900 ML	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	27	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
493	\N	f	INTENCION VODKA 900 ML	INTENCION VODKA 900 ML	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	27	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
494	\N	f	VELHO BARREIRO LIMON 910 ML	VELHO BARREIRO LIMON 910 ML	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	27	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
495	\N	f	JOHNNIE WALKER GREEN LABEL 15 A 750 ML	JOHNNIE WALKER GREEN LABEL 15 A 750 ML	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	17	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
496	\N	f	JOHNNIE WALKER GOLD LABER RESERVE 750 ML	JOHNNIE WALKER GOLD LABER RESERVE 750 ML	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	17	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
497	\N	f	JOHNNIE WALKER BLACK LABEL 1 L	JOHNNIE WALKER BLACK LABEL 1 L	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	17	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
498	\N	f	JOHNNIE WALKER RED LABEL 1 L	JOHNNIE WALKER RED LABEL 1 L	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	17	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
499	\N	f	JOHNNIE WALKER GOLD LABEL 18 A 750 ML	JOHNNIE WALKER GOLD LABEL 18 A 750 ML	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	17	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
500	\N	f	CHIVAS REGAL 12 AÑOS 1 L	CHIVAS REGAL 12 AÑOS 1 L	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	17	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
501	\N	f	BUCHANANS 12 AÑOS 1 L	BUCHANANS 12 AÑOS 1 L	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	17	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
502	\N	f	BUCHANANS 18 AÑOS 1 L	BUCHANANS 18 AÑOS 1 L	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	17	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
489	\N	f	PRESIDENTE CONHAQUE 970 ML	PRESIDENTE CONHAQUE 970 ML	10	1	f	f	f	f	f	t	t	3	ENFRIABLE	2021-12-28 18:29:38.098151+00	27	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
503	\N	f	PRESIDENTE CONHAQUE CON MIEL 900 ML	PRESIDENTE CONHAQUE CON MIEL 900 ML	10	1	f	f	f	f	f	f	t	3	NO_ENFRIABLE	2021-12-28 18:29:38.098151+00	27	\N	f	f	2	/productos	\N	\N	\N	t	f	\N
505	\N	\N	POETT SUAVIDAD DE ALGODON 990ML	POETT SUAVIDAD DE ALGODON 990ML	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	6	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
506	\N	\N	POETT FLOR DE PRIMAVERA 990 ML	POETT FLOR DE PRIMAVERA 990 ML	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	6	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
507	\N	\N	POETT FRESCURA DE LAVANDA 900 ML	POETT FRESCURA DE LAVANDA 900 ML	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	6	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
508	\N	\N	POETT ESPIRITU PLAY 900 ML	POETT ESPIRITU PLAY 900 ML	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	6	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
509	\N	\N	FEDERAL CARACOLITO 400G	FEDERAL CARACOLITO 400G	10	\N	\N	\N	\N	\N	\N	t	t	4	NO_ENFRIABLE	\N	33	\N	\N	f	\N	/productos	\N	20	\N	t	f	\N
510	\N	\N	FEDERAL ESPAGUETTI 400G	FEDERAL ESPAGUETTI 400G	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	33	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
511	\N	\N	FEDERAL MOSTACHOLI 400G	FEDERAL MOSTACHOLI 400G	10	\N	\N	\N	\N	\N	\N	t	t	4	\N	\N	33	\N	\N	f	\N	/productos	\N	20	\N	t	f	\N
512	\N	\N	FEDERAL TALLARIN AMARILLO GRUESO 400G	FEDERAL TALLARIN AMARILLO GRUESO 400G	10	\N	\N	\N	\N	\N	\N	t	t	4	NO_ENFRIABLE	\N	33	\N	\N	f	\N	/productos	\N	20	\N	t	f	\N
513	\N	\N	CAT CHOW ADULTO CARNE	CAT CHOW ADULTO CARNE	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	34	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
514	\N	\N	CAT CHOW DELIMIX SALMON	CAT CHOW DELIMIX SALMON	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	34	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
515	\N	\N	CAT CHOW ADULTO PESCADO	CAT CHOW ADULTO PESCADO	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	34	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
516	\N	\N	DOG CHOW SALUD VISIBLE ADULTO MINI PEQUEÑO	DOG CHOW SALUD VISIBLE ADULTO MINI PEQUEÑO	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	34	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
364	\N	\N	ARCOIRIS SAL MARINA FINA DE MESA 500G	ARCOIRIS SAL MARINA FINA DE MESA 500G	10	\N	\N	\N	f	\N	\N	t	t	4	\N	\N	31	\N	f	f	\N	/productos	\N	30	\N	t	f	\N
372	\N	\N	ARCOIRIS SAL ENTREFINA YODADA 500G	ARCOIRIS SAL ENTREFINA YODADA 500G	10	\N	\N	\N	f	\N	\N	t	t	4	\N	\N	31	\N	f	f	\N	/productos	\N	30	\N	t	f	\N
517	\N	\N	ZAELI SAL GROSSO	ZAELI SAL GROSSO	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	31	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
518	\N	\N	GALLETITA SURTIDA EL TRIGAL 140GR	GALLETITA SURTIDA EL TRIGAL 140GR	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	18	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
519	\N	\N	GALLETITA SURTIDA EL TRIGAL 300GR	GALLETITA SURTIDA EL TRIGAL 300GR	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	18	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
521	\N	\N	GALLETITA TORTUGUITA VAINILLA	GALLETITA TORTUGUITA VAINILLA	10	\N	f	\N	\N	\N	\N	\N	t	4	\N	\N	18	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
520	\N	\N	GALLETITA TORTUGUITA MORANGO	GALLETITA TORTUGUITA MORANGO	10	\N	f	\N	\N	\N	\N	\N	t	4	\N	\N	18	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
522	\N	\N	GALLETITA TORTUGUITA BRIGADEIRO	GALLETITA TORTUGUITA BRIGADEIRO	10	\N	f	\N	\N	\N	\N	\N	t	4	\N	\N	18	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
523	\N	\N	GALLETITA TORTUGUITA CHOCOLATE	GALLETITA TORTUGUITA CHOCOLATE	10	\N	f	\N	\N	\N	\N	\N	t	4	\N	\N	18	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
524	\N	\N	COOKIES ORIGINAL	COOKIES ORIGINAL	10	\N	f	\N	\N	\N	\N	\N	t	4	\N	\N	18	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
305	\N	\N	AMENDUPA SNACKS DE PIZZA 50G	AMENDUPA SNACKS DE PIZZA 50G	10	\N	\N	\N	f	\N	\N	t	t	4	\N	\N	18	\N	f	f	\N	/productos	\N	30	\N	t	f	\N
525	\N	\N	AMENDUPA SNACKS CALABRESA 50GR	AMENDUPA SNACKS CALABRESA 50GR	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	18	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
526	\N	\N	AMENDUPA SNACKS CHURRASCO 50GR	AMENDUPA SNACKS CHURRASCO 50GR	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	18	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
527	\N	\N	AMENDUPA SNACKS JALAPEÑO 50G	AMENDUPA SNACKS JALAPEÑO 50G	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	18	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
528	\N	\N	SERVILLETA SAN JOSE	SERVILLETA SAN JOSE	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	6	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
529	\N	\N	CEBILA ACEITUNA VERDE	CEBILA ACEITUNA VERDE	10	\N	f	\N	\N	\N	\N	\N	t	4	\N	\N	21	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
530	\N	\N	CEBILA ACEITUNA VERDE RELLENA	CEBILA ACEITUNA VERDE RELLENA	10	\N	f	\N	\N	\N	\N	\N	t	4	\N	\N	19	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
531	\N	\N	CORNED BEEF	CORNED BEEF	10	\N	f	\N	\N	\N	\N	\N	t	4	\N	\N	19	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
532	\N	\N	HELLMANNS SALSA BARBACOA 400G	HELLMANNS SALSA BARBACOA 400G	10	\N	f	\N	\N	\N	\N	\N	t	4	\N	\N	21	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
533	\N	\N	HEMMER KETCHUP PICANTE 320G	HEMMER KETCHUP PICANTE 320G	10	\N	f	\N	\N	\N	\N	\N	t	4	\N	\N	21	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
534	\N	\N	NORTE DURAZNOS 820G	NORTE DURAZNOS 820G	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	19	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
535	\N	\N	ARCOR DURAZNOS 820G	ARCOR DURAZNOS 820G	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	19	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
536	\N	\N	HELLMANNS MAYONESA TIPO CASERA 445G	HELLMANNS MAYONESA TIPO CASERA 445G	10	\N	f	\N	\N	\N	\N	\N	t	4	\N	\N	21	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
537	\N	\N	HEMMER KETCHUP TRADICIONAL	HEMMER KETCHUP TRADICIONAL	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	21	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
538	\N	\N	CEPILLO SAFERI	CEPILLO SAFERI	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	6	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
539	\N	\N	HELLMANNS MAYONESA SACHET 118G	HELLMANNS MAYONESA SACHET 118G	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	21	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
540	\N	\N	SAFRA PICADILLO	SAFRA PICADILLO	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	19	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
541	\N	\N	LA NEGRA PICADILLO	LA NEGRA PICADILLO	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	19	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
542	\N	\N	PREDILECTA KETCHUP TRADICIONAL 400G	PREDILECTA KETCHUP TRADICIONAL 400G	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	21	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
543	\N	\N	PREDILECTA KETCHUP TRADICIONAL 200G	PREDILECTA KETCHUP TRADICIONAL 200G	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	21	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
544	\N	\N	HELLMANNS KETCHUP SACHET 60G	HELLMANNS KETCHUP SACHET 60G	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	21	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
545	\N	\N	SAVORA ORIGINAL 200G	SAVORA ORIGINAL 200G	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	21	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
546	\N	\N	HEMMER PICANTE MALAGUETA 70G	HEMMER PICANTE MALAGUETA 70G	10	\N	f	\N	\N	\N	\N	\N	t	4	\N	\N	21	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
547	\N	\N	LA GOTITA	LA GOTITA	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	28	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
548	\N	\N	KOLYNOS 90G	KOLYNOS 90G	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	6	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
549	\N	\N	COLGATE 50G	COLGATE 50G	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	6	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
550	\N	\N	COLGATE TRIPLE ACCION 180G	COLGATE TRIPLE ACCION 180G	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	6	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
551	\N	\N	CALDO BOM PARA PIPOCA	CALDO BOM PARA PIPOCA	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	33	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
552	\N	\N	BATATA PALHA 120G	BATATA PALHA 120G	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	21	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
553	\N	\N	ARCOR DIVERSION SURTIDOS 400G	ARCOR DIVERSION SURTIDOS 400G	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	18	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
554	\N	\N	NINFA WAFER CHOCOLATE Y AVELA	NINFA WAFER CHOCOLATE Y AVELA	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	18	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
555	\N	\N	NINFA WAFER MORANGO	NINFA WAFER MORANGO	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	18	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
556	\N	\N	NINFA WAFER CHOCOLATE SUIZO	NINFA WAFER CHOCOLATE SUIZO	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	18	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
557	\N	\N	NINFA WAFER NOZES	NINFA WAFER NOZES	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	18	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
558	\N	\N	NINFA WAFER CHOCOLATE BRANCO	NINFA WAFER CHOCOLATE BRANCO	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	18	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
561	\N	\N	NINFA GALLETITA CHOCOLATE BRANCO	NINFA GALLETITA CHOCOLATE BRANCO	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	18	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
562	\N	\N	NINFA GALLETITA CHOCOLATE	NINFA GALLETITA CHOCOLATE	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	18	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
563	\N	\N	ARCOR SERRANITAS PACK FAMILIAR X3	ARCOR SERRANITAS PACK FAMILIAR X3	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	18	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
564	\N	\N	ARCOR SERRANITAS	ARCOR SERRANITAS	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	18	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
566	\N	\N	ARCOR GALLETITAS ROCKLETS 118G	ARCOR GALLETITAS ROCKLETS 118G	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	18	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
567	\N	\N	GALLETITA BONO MORANGO	GALLETITA BONO MORANGO	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	18	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
568	\N	\N	GALLETITA NEGRESCO MORANGO	GALLETITA NEGRESCO MORANGO	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	18	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
569	\N	\N	NESCAFE TRADICIONAL SOBRE 8G	NESCAFE TRADICIONAL SOBRE 8G	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	21	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
570	\N	\N	ALFAJOR BON O BON TRIPLE	ALFAJOR BON O BON TRIPLE	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	24	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
571	\N	\N	ALFAJOR BON O BON BLANCO	ALFAJOR BON O BON BLANCO	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	24	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
572	\N	\N	ALFAJOR BON O BON	ALFAJOR BON O BON	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	24	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
573	\N	\N	ALFAJOR TATIN BLANCO	ALFAJOR TATIN BLANCO	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	24	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
574	\N	\N	ALFAJOR TATIN NEGRO	ALFAJOR TATIN NEGRO	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	24	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
575	\N	\N	ALFAJOR AGUILA COCO	ALFAJOR AGUILA COCO	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	24	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
576	\N	\N	ALFAJOR AGUILA BROWNIE	ALFAJOR AGUILA BROWNIE	10	\N	f	\N	\N	\N	\N	\N	t	4	\N	\N	24	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
577	\N	\N	ALFAJOR AGUILA CLASICA	ALFAJOR AGUILA CLASICA	10	\N	f	\N	\N	\N	\N	\N	t	4	\N	\N	24	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
579	\N	\N	NORTE ARVEJA 200 G	NORTE ARVEJA 200 G	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	19	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
580	\N	\N	NORTE CHOCLO 300 G	NORTE CHOCLO 300 G	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	19	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
581	\N	\N	HEMMER PEPINO TIPO MEXICANO 550 G	HEMMER PEPINO TIPO MEXICANO 550 G	10	\N	f	\N	\N	\N	\N	\N	t	4	\N	\N	21	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
582	\N	\N	PEPINO EN VINAGRE SUAVE TAUA 300 G	PEPINO EN VINAGRE SUAVE TAUA 300 G	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	21	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
583	\N	\N	INCOTRIL PEPINO 530 G	INCOTRIL PEPINO 530 G	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	21	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
584	\N	\N	ESPONJA TININDO	ESPONJA TININDO	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	6	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
585	\N	\N	NISSIN LAMEN PICAÑA MIOJO	NISSIN LAMEN PICAÑA MIOJO	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	33	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
586	\N	\N	NISSIN LAMEN BACON MIOJO	NISSIN LAMEN BACON MIOJO	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	33	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
587	\N	\N	NISSIN LAMEN CARNE MIOJO	NISSIN LAMEN CARNE MIOJO	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	33	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
588	\N	\N	NISSIN LAMEN GALLINA CAIPIRA MIOJO	NISSIN LAMEN GALLINA CAIPIRA MIOJO	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	33	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
589	\N	\N	MONICA TOMATE MIOJO	MONICA TOMATE MIOJO	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	33	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
590	\N	\N	MONICA CARNE MIOJO	MONICA CARNE MIOJO	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	33	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
592	\N	\N	BAUDUCCO WAFER FRESAS 78 G 	BAUDUCCO WAFER FRESAS 78 G 	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	18	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
593	\N	\N	BAUDUCCO WAFER CHOCOLATE 78 G	BAUDUCCO WAFER CHOCOLATE 78 G	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	18	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
594	\N	\N	BAUDUCCO WAFER VAINILLA 78 G	BAUDUCCO WAFER VAINILLA 78 G	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	18	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
595	\N	\N	MOGUL OSITOS 30G	MOGUL OSITOS 30G	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	25	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
596	\N	\N	MOGUL PIECITOS 30G	MOGUL PIECITOS 30G	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	25	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
597	\N	\N	MOGUL TIBURONCITOS 30G	MOGUL TIBURONCITOS 30G	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	25	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
598	\N	\N	TURRON DE MANI CHOCOLATE	TURRON DE MANI CHOCOLATE	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	25	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
600	\N	\N	YERBA COLON COMP. CON HIERBAS 500G	YERBA COLON COMP. CON HIERBAS 500G	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	26	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
601	\N	\N	YERBA COLON MATE COMPLETO 250G	YERBA COLON MATE COMPLETO 250G	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	26	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
602	\N	\N	YERBA COLON COMP. CON HIERBAS 250G	YERBA COLON COMP. CON HIERBAS 250G	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	26	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
603	\N	\N	CAMPESINO YERBA DOBLE MENTA Y BOLDO 250G	CAMPESINO YERBA DOBLE MENTA Y BOLDO 250G	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	26	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
604	\N	\N	 PAJARITO YERBA ELABORADA 250G	 PAJARITO YERBA ELABORADA 250G	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	26	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
605	\N	\N	 PAJARITO YERBA ELABORADA 1KG	 PAJARITO YERBA ELABORADA 1KG	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	26	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
606	\N	\N	YERBA KURUPI FITNESS 250G	YERBA KURUPI FITNESS 250G	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	26	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
607	\N	\N	KURUPI YERBA TRADICIONAL 100% 1KG	KURUPI YERBA TRADICIONAL 100% 1KG	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	26	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
608	\N	\N	KURUPI YERBA CON ANIS 500G	KURUPI YERBA CON ANIS 500G	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	26	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
609	\N	\N	KURUPI YERBA CON ANIS 250G	KURUPI YERBA CON ANIS 250G	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	26	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
610	\N	\N	PIPOCA BEIJA FLOR	PIPOCA BEIJA FLOR	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	33	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
611	\N	\N	AZUCAR DOCESUCAR 1KG	AZUCAR DOCESUCAR 1KG	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	31	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
612	\N	\N	KURUPI YERBA KATUAVA 500G	KURUPI YERBA KATUAVA 500G	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	26	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
613	\N	\N	ARCOR JUGO NARANJA DULCE 	ARCOR JUGO NARANJA DULCE 	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	21	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
614	\N	\N	ARCOR JUGO NARANJA 	ARCOR JUGO NARANJA 	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	21	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
615	\N	\N	QUESO RALLADO LA SERENISIMA	QUESO RALLADO LA SERENISIMA	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	21	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
616	\N	\N	COMFORT SUAVIZANTE TRADICIONAL PURO CUIDADO 1.8 L	COMFORT SUAVIZANTE TRADICIONAL PURO CUIDADO 1.8 L	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	6	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
617	\N	\N	COMFORT SUAVIZANTE TRADICIONAL BRISA TROPICAL 1.8 L	COMFORT SUAVIZANTE TRADICIONAL BRISA TROPICAL 1.8 L	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	6	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
618	\N	\N	ARROZ DELLARROZ 1 KG	ARROZ DELLARROZ 1 KG	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	31	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
619	\N	\N	JABON CAVALLARO COCO ALMENDRAS 100G	JABON CAVALLARO COCO ALMENDRAS 100G	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	6	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
565	\N	\N	HOGAREÑAS SALVADO 200G	HOGAREÑAS SALVADO 200G	10	\N	\N	\N	\N	\N	\N	t	t	4	\N	\N	18	\N	\N	f	\N	/productos	\N	30	\N	t	f	\N
578	\N	\N	BORGES VINAGRE EXTRA VIRGEN 250ML	BORGES VINAGRE EXTRA VIRGEN 250ML	10	\N	\N	\N	\N	\N	\N	t	t	4	NO_ENFRIABLE	\N	31	\N	\N	f	\N	/productos	\N	30	\N	t	f	\N
591	\N	\N	PETTIZ MANI CROCANTE NATURAL 90 G	PETTIZ MANI CROCANTE NATURAL 90 G	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	18	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
620	\N	\N	JABON CAVALLARO COCO CLASICA 100G	JABON CAVALLARO COCO CLASICA 100G	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	6	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
621	\N	\N	DETERGENTE ACTIVO 100 LIMON	DETERGENTE ACTIVO 100 LIMON	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	6	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
622	\N	\N	YPE DETERGENTE CLEAR	YPE DETERGENTE CLEAR	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	6	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
623	\N	\N	YPE DETERGENTE COCO	YPE DETERGENTE COCO	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	6	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
624	\N	\N	YPE DETERGENTE LIMON	YPE DETERGENTE LIMON	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	6	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
625	\N	\N	YPE DETERGENTE CAPIM-LIMON	YPE DETERGENTE CAPIM-LIMON	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	6	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
626	\N	\N	YPE DETERGENTE CLEAR CARE	YPE DETERGENTE CLEAR CARE	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	6	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
276	\N	\N	CAVALLARO LAVANDA DESODORANTE DE AMBIENTE  900ML	CAVALLARO LAVANDA DESODORANTE DE AMBIENTE  900ML	10	\N	\N	\N	f	\N	\N	t	t	4	\N	\N	6	\N	f	f	\N	/productos	\N	30	\N	t	f	\N
627	\N	\N	CAVALLARO FRESCURA MARINA DESODORANTE DE AMBIENTE 900ML	CAVALLARO FRESCURA MARINA DESODORANTE DE AMBIENTE 900ML	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	6	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
628	\N	\N	CAVALLARO UVA DESODORANTE DE AMBIENTE 900ML	CAVALLARO UVA DESODORANTE DE AMBIENTE 900ML	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	6	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
629	\N	\N	CAVALLARO FANTASIA DESODORANTE DE AMBIENTE 900ML	CAVALLARO FANTASIA DESODORANTE DE AMBIENTE 900ML	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	6	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
630	\N	\N	OMO JABON LIQUIDO 900ML	OMO JABON LIQUIDO 900ML	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	6	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
631	\N	\N	OMO JABON EN POLVO 800G 	OMO JABON EN POLVO 800G 	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	6	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
633	\N	\N	TODDY 800G	TODDY 800G	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	21	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
634	\N	\N	TODDY 400G	TODDY 400G	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	21	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
635	\N	\N	MELITTA CAFE TORRADO MOIDO EXTRAFORTE	MELITTA CAFE TORRADO MOIDO EXTRAFORTE	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	21	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
636	\N	\N	MELITTA CAFE TORRADO MOIDO SAB. FAZENDA	MELITTA CAFE TORRADO MOIDO SAB. FAZENDA	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	21	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
637	\N	\N	DOCILE PASTILLA MINI MINTY CEREZA 14G	DOCILE PASTILLA MINI MINTY CEREZA 14G	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	25	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
638	\N	\N	DOCILE PASTILLA MINI MINTY EXTRA FORTE 14G	DOCILE PASTILLA MINI MINTY EXTRA FORTE 14G	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	25	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
639	\N	\N	DOCILE PASTILLA MINI MINTY FRUTILLA 14G	DOCILE PASTILLA MINI MINTY FRUTILLA 14G	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	25	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
640	\N	\N	DOCILE PASTILLA MINI MINTY MENTA 14G	DOCILE PASTILLA MINI MINTY MENTA 14G	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	25	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
641	\N	\N	DOCILE PASTILLA MINI MINTY NARANJA 14G	DOCILE PASTILLA MINI MINTY NARANJA 14G	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	25	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
642	\N	\N	MINTY FRUTILLA 17G	MINTY FRUTILLA 17G	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	25	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
643	\N	\N	MINTY EXTRA FUERTE 17G	MINTY EXTRA FUERTE 17G	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	25	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
644	\N	\N	MINTY FRUTALES 17G	MINTY FRUTALES 17G	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	25	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
645	\N	\N	MINTY MELON 17G	MINTY MELON 17G	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	18	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
646	\N	\N	MINTY CEREZA 17G	MINTY CEREZA 17G	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	25	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
647	\N	\N	TIC TAC NARANJA	TIC TAC NARANJA	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	25	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
648	\N	\N	TIC TAC FRUTILLA	TIC TAC FRUTILLA	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	25	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
649	\N	\N	TIC TAC MENTA	TIC TAC MENTA	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	25	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
650	\N	\N	GALLETITA OPERA 55G	GALLETITA OPERA 55G	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	18	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
651	\N	\N	SALADIX CALABRESA 100G	SALADIX CALABRESA 100G	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	18	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
652	\N	\N	SALADIX JAMON 100G	SALADIX JAMON 100G	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	18	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
653	\N	\N	ECOPOWER CARGADOR EP-7033	ECOPOWER CARGADOR EP-7033	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	14	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
654	\N	\N	FAST CHARGER	FAST CHARGER	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	14	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
655	\N	\N	LA CAOBA CIGARRILLO GRAN FLOR NATURAL	LA CAOBA CIGARRILLO GRAN FLOR NATURAL	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	11	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
656	\N	\N	LA CAOBA CIGARRILLO GRAN FLOR CAFE Y MIEL	LA CAOBA CIGARRILLO GRAN FLOR CAFE Y MIEL	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	11	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
657	\N	\N	LA CAOBA CIGARRILLO GRAN FLOR CHOCOLATE	LA CAOBA CIGARRILLO GRAN FLOR CHOCOLATE	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	11	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
658	\N	\N	LA CAOBA CIGARRILLO GRAN FLOR VAINILLA	LA CAOBA CIGARRILLO GRAN FLOR VAINILLA	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	11	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
659	\N	\N	LA CAOBA CIGARRILLO GRAN FLOR WHISKY	LA CAOBA CIGARRILLO GRAN FLOR WHISKY	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	11	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
660	\N	\N	CARTA ESPAÑOLA	CARTA ESPAÑOLA	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	14	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
661	\N	\N	LECHE CONDENSADA FRIMESA 395G	LECHE CONDENSADA FRIMESA 395G	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	21	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
662	\N	\N	CREMA DE LECHE FRIMESA 200G	CREMA DE LECHE FRIMESA 200G	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	21	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
663	\N	\N	CHUPETONCITO 35G	CHUPETONCITO 35G	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	25	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
664	\N	\N	ARCOR VACA LECHERA TRADICIONAL 576G	ARCOR VACA LECHERA TRADICIONAL 576G	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	25	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
665	\N	\N	CAÑONAZO 25G	CAÑONAZO 25G	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	24	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
666	\N	\N	ARCOR ROCKLETS MANI 40G	ARCOR ROCKLETS MANI 40G	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	18	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
667	\N	\N	ARCOR ROCKLETS CHOC. 15G	ARCOR ROCKLETS CHOC. 15G	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	24	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
668	\N	\N	MENTITAS AMBROSOLI 25G	MENTITAS AMBROSOLI 25G	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	25	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
669	\N	\N	TRENTO MORANGO	TRENTO MORANGO	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	24	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
670	\N	\N	TRENTO LIMON	TRENTO LIMON	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	24	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
671	\N	\N	LAYS STAX ORIGINAL 134G	LAYS STAX ORIGINAL 134G	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	18	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
672	\N	\N	LAYS CLASICA 75G	LAYS CLASICA 75G	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	18	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
673	\N	\N	CEBOLITOS 110G	CEBOLITOS 110G	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	18	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
674	\N	\N	CEBOLITOS 31G	CEBOLITOS 31G	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	18	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
675	\N	\N	CHEETOS LUA PARMESAO 33G	CHEETOS LUA PARMESAO 33G	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	18	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
676	\N	\N	MULTIMINT 27G	MULTIMINT 27G	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	25	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
677	\N	\N	FREEGELLS MENTA	FREEGELLS MENTA	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	25	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
678	\N	\N	FREEGELLS EXTRA FUERTE	FREEGELLS EXTRA FUERTE	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	25	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
679	\N	\N	ARCOR MENTHOPLUS MENTOL	ARCOR MENTHOPLUS MENTOL	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	25	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
680	\N	\N	ARCOR MENTHOPLUS HONEY	ARCOR MENTHOPLUS HONEY	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	25	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
681	\N	\N	HALLS MENTOL	HALLS MENTOL	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	25	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
682	\N	\N	HALLS CEREZA	HALLS CEREZA	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	25	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
683	\N	\N	HALLS MENTA	HALLS MENTA	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	25	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
684	\N	\N	TOPLINE 6 UND 11G FRUTILLA	TOPLINE 6 UND 11G FRUTILLA	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	25	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
685	\N	\N	TOPLINE 6 UND 11G BLUEBERRY	TOPLINE 6 UND 11G BLUEBERRY	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	25	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
686	\N	\N	TOPLINE 6 UND 11G STRONG	TOPLINE 6 UND 11G STRONG	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	25	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
687	\N	\N	TOPLINE SEVEN 14.7G STRAWBERRY	TOPLINE SEVEN 14.7G STRAWBERRY	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	25	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
688	\N	\N	TOPLINE SEVEN 14.7G  ATOMIC STRONG	TOPLINE SEVEN 14.7G  ATOMIC STRONG	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	25	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
689	\N	\N	TOPLINE SEVEN 14.7G X-PLOSIVE MINT	TOPLINE SEVEN 14.7G X-PLOSIVE MINT	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	25	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
690	\N	\N	TOPLINE SEVEN ULTRA RED BERRY	TOPLINE SEVEN ULTRA RED BERRY	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	25	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
691	\N	\N	TOPLINE SEVEN ULTRA GREEN MINT	TOPLINE SEVEN ULTRA GREEN MINT	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	25	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
692	\N	\N	BELDENT 10G GLOBO	BELDENT 10G GLOBO	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	25	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
693	\N	\N	BELDENT 10G  FRUTILLA	BELDENT 10G  FRUTILLA	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	25	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
694	\N	\N	BELDENT 10G MENTA FUERTE	BELDENT 10G MENTA FUERTE	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	25	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
695	\N	\N	BELDENT INFINIT MINT 7 UN	BELDENT INFINIT MINT 7 UN	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	25	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
696	\N	\N	BELDENT INFINIT SPEARMINT 14 UN	BELDENT INFINIT SPEARMINT 14 UN	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	25	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
697	\N	\N	TRIDENT 8G MENTA	TRIDENT 8G MENTA	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	25	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
698	\N	\N	TRIDENT 8G MENTA VERDE	TRIDENT 8G MENTA VERDE	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	25	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
699	\N	\N	TRIDENT 8G FRUTILLA	TRIDENT 8G FRUTILLA	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	25	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
700	\N	\N	TRIDENT 8G CANELA	TRIDENT 8G CANELA	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	25	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
701	\N	\N	TRIDENT 8G SANDIA	TRIDENT 8G SANDIA	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	25	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
702	\N	\N	TRIDENT 8G TUTTI-FRUTTI	TRIDENT 8G TUTTI-FRUTTI	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	25	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
703	\N	\N	ANTARCTICA SUB ZERO LATA 269 ML	ANTARCTICA SUB ZERO LATA 269 ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	1	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
704	\N	\N	BUDWEISER 66 BOT 710 ML	BUDWEISER 66 BOT 710 ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	1	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
705	\N	\N	JOHNNIE WALKER BLACK LABEL 1 L + KIT VASO	JOHNNIE WALKER BLACK LABEL 1 L + KIT VASO	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	17	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
706	\N	\N	JOHNNIE WALKER DOUBLE BLACK LABEL 1 L	JOHNNIE WALKER DOUBLE BLACK LABEL 1 L	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	17	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
707	\N	\N	CLAN MAC GREGOR 350ML	CLAN MAC GREGOR 350ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	17	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
708	\N	\N	CLAN MAC GREGOR 200ML	CLAN MAC GREGOR 200ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	17	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
709	\N	\N	GRANTS 1L	GRANTS 1L	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	17	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
710	\N	\N	GRAND OLD PAR 12 AÑOS	GRAND OLD PAR 12 AÑOS	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	17	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
711	\N	\N	BALLANTINES 375ML	BALLANTINES 375ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	17	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
712	\N	\N	BALLANTINES 200ML	BALLANTINES 200ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	17	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
713	\N	\N	JAGERMEIFTER 700ML	JAGERMEIFTER 700ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	27	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
714	\N	\N	SIR EDWARDS 350ML	SIR EDWARDS 350ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	17	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
715	\N	\N	SIR EDWARDS 200ML	SIR EDWARDS 200ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	17	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
716	\N	\N	GRAN PAR WHISKY GP	GRAN PAR WHISKY GP	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	17	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
717	\N	\N	CHIVAS REGAL 200ML	CHIVAS REGAL 200ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	17	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
719	\N	\N	PUERTO DE INDIAS GIN GUADALQUIVIR	PUERTO DE INDIAS GIN GUADALQUIVIR	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	27	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
720	\N	\N	PUERTO DE INDIAS GIN CLASSIC	PUERTO DE INDIAS GIN CLASSIC	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	27	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
721	\N	\N	PUERTO DE INDIAS GIN STRAWBERRY	PUERTO DE INDIAS GIN STRAWBERRY	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	27	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
722	\N	\N	GIN BULLDOG LONDON DRY	GIN BULLDOG LONDON DRY	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	27	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
723	\N	\N	JOSE CUERVO SILVER	JOSE CUERVO SILVER	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	27	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
724	\N	\N	ROCKS GIN SECO	ROCKS GIN SECO	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	27	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
725	\N	\N	ROCKS GIN STRAWBERRY	ROCKS GIN STRAWBERRY	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	27	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
726	\N	\N	SMIRNOFF VODKA 600ML	SMIRNOFF VODKA 600ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	27	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
727	\N	\N	PIRASSUNUNGA 51	PIRASSUNUNGA 51	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	27	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
728	\N	\N	THE BREEDERS CHOICE 195ML	THE BREEDERS CHOICE 195ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	17	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
729	\N	\N	SKYY VODKA	SKYY VODKA	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	27	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
730	\N	\N	MASTER GOLD	MASTER GOLD	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	17	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
731	\N	\N	CONCHA Y TORO RESERVADO CARMENERE 750ML	CONCHA Y TORO RESERVADO CARMENERE 750ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	15	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
732	\N	\N	SANTA CAROLINA RESERVADO MALBEC 750ML	SANTA CAROLINA RESERVADO MALBEC 750ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	15	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
733	\N	\N	SANTA CAROLINA RESERVADO ROSE 750ML	SANTA CAROLINA RESERVADO ROSE 750ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	15	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
734	\N	\N	TRAPICHE VINEYARD MERLOT 750ML	TRAPICHE VINEYARD MERLOT 750ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	15	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
735	\N	\N	VINO CANCILLER BLEND CABERNET SAUVIGNON 750ML	VINO CANCILLER BLEND CABERNET SAUVIGNON 750ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	15	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
736	\N	\N	LAZO TINTO CABERNET SAUVIGNON 750ML	LAZO TINTO CABERNET SAUVIGNON 750ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	15	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
1064	\N	\N	KIN AGUA SIN GAS 2LT	KIN AGUA SIN GAS 2LT	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	5	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
737	\N	\N	DON VALENTIN LACRADO 750 ML	DON VALENTIN LACRADO 750 ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	15	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
738	\N	\N	FERNET CAPRI 750ML	FERNET CAPRI 750ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	27	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
739	\N	\N	TRES LEONES ETIQUETA NEGRA 750ML	TRES LEONES ETIQUETA NEGRA 750ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	27	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
740	\N	\N	TRES LEONES ETIQUETA NEGRA  200ML	TRES LEONES ETIQUETA NEGRA  200ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	27	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
742	\N	\N	JAMEL CACHAÇA 965 ML	JAMEL CACHAÇA 965 ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	27	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
743	\N	\N	FORTIN CAÑA 450ML	FORTIN CAÑA 450ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	27	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
745	\N	\N	ARISTOCRATA ETIQUETA NEGRA 200ML	ARISTOCRATA ETIQUETA NEGRA 200ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	27	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
746	\N	\N	OLD TRADI ETIQUETA NEGRA 750ML	OLD TRADI ETIQUETA NEGRA 750ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	27	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
747	\N	\N	OLD TRADI CARTA DE PLATA 750ML	OLD TRADI CARTA DE PLATA 750ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	27	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
748	\N	\N	CATUABA RANDON 900 ML	CATUABA RANDON 900 ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	27	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
749	\N	\N	OLD TRADI ETIQUETA NEGRA 210ML	OLD TRADI ETIQUETA NEGRA 210ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	27	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
750	\N	\N	OLD TRADI CARTA DE PLATA 200ML	OLD TRADI CARTA DE PLATA 200ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	27	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
751	\N	\N	LEON POPULAR 200ML	LEON POPULAR 200ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	27	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
752	\N	\N	ARISTOCRATA 12 AÑOS	ARISTOCRATA 12 AÑOS	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	27	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
753	\N	\N	ARISTOCRATA TRADICIONAL 750ML	ARISTOCRATA TRADICIONAL 750ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	27	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
754	\N	\N	NINNOFF VODKA GREEN	NINNOFF VODKA GREEN	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	27	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
755	\N	\N	NINNOFF VODKA LEMON	NINNOFF VODKA LEMON	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	27	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
756	\N	\N	NINNOFF VODKA YELLOW	NINNOFF VODKA YELLOW	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	27	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
757	\N	\N	FRIZZE BLUE	FRIZZE BLUE	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	27	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
758	\N	\N	MARULA COCTEL CAPRICHO	MARULA COCTEL CAPRICHO	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	27	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
759	\N	\N	COROTE COCTEL SABOR ACAI Y CATUABA	COROTE COCTEL SABOR ACAI Y CATUABA	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	27	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
760	\N	\N	COROTE COCTEL SABOR MENTA	COROTE COCTEL SABOR MENTA	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	27	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
761	\N	\N	AGUA DE COCO DUCOCO 1LT	AGUA DE COCO DUCOCO 1LT	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	5	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
762	\N	\N	GIN INTENCION ORANGE	GIN INTENCION ORANGE	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	27	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
763	\N	\N	EIGHT ROJO	EIGHT ROJO	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	11	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
764	\N	\N	EIGHT CONVERTIBLE 20	EIGHT CONVERTIBLE 20	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	11	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
765	\N	\N	KENTUCKY BOX 20	KENTUCKY BOX 20	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	11	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
766	\N	\N	KENTUCKY SOFT 20	KENTUCKY SOFT 20	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	11	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
767	\N	\N	PALERMO TRICK 20	PALERMO TRICK 20	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	11	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
768	\N	\N	PALERMO DUO 20	PALERMO DUO 20	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	11	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
769	\N	\N	PALERMO SILVER 20	PALERMO SILVER 20	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	11	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
770	\N	\N	PALERMO RED 20	PALERMO RED 20	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	11	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
771	\N	\N	PALERMO BLUE 20	PALERMO BLUE 20	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	11	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
772	\N	\N	GUDANG GARAM BORDO (CANELA)	GUDANG GARAM BORDO (CANELA)	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	11	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
773	\N	\N	GUDANG GARAM MENTHOL	GUDANG GARAM MENTHOL	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	11	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
775	\N	\N	SILVER FULL FLAVOR	SILVER FULL FLAVOR	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	11	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
776	\N	\N	CHESTERFIELD FRESH 20	CHESTERFIELD FRESH 20	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	11	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
777	\N	\N	MARLBORO ADVANCE 20	MARLBORO ADVANCE 20	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	11	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
778	\N	\N	LUCKY STRIKE RED 20	LUCKY STRIKE RED 20	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	11	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
779	\N	\N	CHESTERFIELD REMIX 20	CHESTERFIELD REMIX 20	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	11	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
780	\N	\N	KENT CONVERTIBLE 20	KENT CONVERTIBLE 20	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	11	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
781	\N	\N	KENT SILVER 4 20	KENT SILVER 4 20	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	11	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
782	\N	\N	KENT NEO TROPIC 20	KENT NEO TROPIC 20	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	11	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
783	\N	\N	KENT NEO ROSE 20	KENT NEO ROSE 20	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	11	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
784	\N	\N	MARLBORO S. ARTESANAL TABACO REPOSADO 20	MARLBORO S. ARTESANAL TABACO REPOSADO 20	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	11	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
785	\N	\N	PHILIP MORRIS BLUE 20	PHILIP MORRIS BLUE 20	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	11	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
786	\N	\N	MARLBORO ROJO 10	MARLBORO ROJO 10	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	11	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
787	\N	\N	MARLBORO ADVANCE 10	MARLBORO ADVANCE 10	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	11	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
788	\N	\N	LUCKY STRIKE ENIGMA 10/12	LUCKY STRIKE ENIGMA 10/12	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	11	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
789	\N	\N	LUCKY STRIKE CRUSH 10	LUCKY STRIKE CRUSH 10	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	11	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
790	\N	\N	KENT BLUE 10/11	KENT BLUE 10/11	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	11	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
791	\N	\N	CONTROL ADAPTA SENSO 3 UNID	CONTROL ADAPTA SENSO 3 UNID	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	30	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
792	\N	\N	CONTROL ADAPTA XTRA LUBRE 3 UNID	CONTROL ADAPTA XTRA LUBRE 3 UNID	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	30	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
793	\N	\N	CONTROL ADAPTA NATURE EASY WAY 3 UNID	CONTROL ADAPTA NATURE EASY WAY 3 UNID	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	30	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
794	\N	\N	CONTROL ADAPTA PEPPERMINT ECSTASY 3 UNID	CONTROL ADAPTA PEPPERMINT ECSTASY 3 UNID	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	30	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
795	\N	\N	COLONIA 600ML	COLONIA 600ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	1	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
796	\N	\N	DIOSA LATA 269ML	DIOSA LATA 269ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	1	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
774	\N	\N	MARLBORO VISTA EXOTIC FUSION 20	MARLBORO VISTA EXOTIC FUSION 20	10	\N	\N	\N	\N	\N	\N	\N	t	4	NO_ENFRIABLE	\N	11	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
797	\N	\N	BRAHMA DUPLO MALTE 269ML	BRAHMA DUPLO MALTE 269ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	1	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
798	\N	\N	BRAHMA DUPLO MALTE 350ML	BRAHMA DUPLO MALTE 350ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	1	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
799	\N	\N	BUDWEISER 66 LATA 354ML	BUDWEISER 66 LATA 354ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	1	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
800	\N	\N	KENT CONVERTIBLE 11	KENT CONVERTIBLE 11	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	11	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
26	\N	\N	PILSEN BOT 340 ML RETORNABLE	PILSEN BOT 340 ML RETORNABLE	10	\N	\N	\N	f	\N	\N	t	t	4	ENFRIABLE	\N	1	\N	f	f	\N	/productos	\N	30	\N	t	f	\N
131	\N	\N	BODEGA PRIVADA MERLOT 750 ML	BODEGA PRIVADA MERLOT 750 ML	10	\N	\N	\N	f	\N	\N	t	t	4	ENFRIABLE	\N	15	\N	f	f	\N	/productos	\N	\N	\N	t	f	\N
801	\N	\N	COCA COLA 250ML	COCA COLA 250ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	2	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
802	\N	\N	COCA COLA 500ML	COCA COLA 500ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	2	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
803	\N	\N	COCA COLA 1LT DESC.	COCA COLA 1LT DESC.	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	2	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
804	\N	\N	COCA COLA 1.5LT DESC.	COCA COLA 1.5LT DESC.	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	2	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
805	\N	\N	COCA COLA 1LT  RETORNABLE	COCA COLA 1LT  RETORNABLE	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	2	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
806	\N	\N	COCA COLA 1.5LTS RETORNABLE	COCA COLA 1.5LTS RETORNABLE	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	2	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
807	\N	\N	COCA COLA 2LTS 	COCA COLA 2LTS 	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	2	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
808	\N	\N	COCA COLA 200ML RETORNABLE	COCA COLA 200ML RETORNABLE	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	2	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
809	\N	\N	COCA COLA 3LTS	COCA COLA 3LTS	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	2	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
810	\N	\N	COCA COLA ZERO 500ML	COCA COLA ZERO 500ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	2	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
811	\N	\N	COCA COLA ZERO 1.5LTS	COCA COLA ZERO 1.5LTS	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	2	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
812	\N	\N	COCA COLA ZERO 2LTS	COCA COLA ZERO 2LTS	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	2	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
813	\N	\N	FANTA NARANJA 200ML RETORNABLE	FANTA NARANJA 200ML RETORNABLE	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	2	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
815	\N	\N	FANTA NARANJA 2LTS	FANTA NARANJA 2LTS	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	2	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
816	\N	\N	FANTA NARANJA 1LT RETORNABLE	FANTA NARANJA 1LT RETORNABLE	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	2	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
817	\N	\N	FANTA NARANJA 1.5LTS RETORNABLE	FANTA NARANJA 1.5LTS RETORNABLE	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	2	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
818	\N	\N	FANTA NARANJA 3LTS	FANTA NARANJA 3LTS	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	2	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
819	\N	\N	FANTA NARANJA 250ML	FANTA NARANJA 250ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	2	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
820	\N	\N	FANTA GUARANA 250ML	FANTA GUARANA 250ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	2	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
822	\N	\N	FANTA GUARANA 2LTS	FANTA GUARANA 2LTS	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	2	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
823	\N	\N	FANTA GUARANA 3LTS	FANTA GUARANA 3LTS	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	2	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
824	\N	\N	FANTA GUARANA 200ML RETORNABLE	FANTA GUARANA 200ML RETORNABLE	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	2	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
825	\N	\N	FANTA GUARANA 1LT RETORNABLE	FANTA GUARANA 1LT RETORNABLE	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	2	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
826	\N	\N	FANTA GUARANA 1.5LTS RETORNABLE	FANTA GUARANA 1.5LTS RETORNABLE	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	2	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
827	\N	\N	FANTA PIÑA 500ML	FANTA PIÑA 500ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	2	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
828	\N	\N	FANTA PIÑA 2LTS	FANTA PIÑA 2LTS	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	2	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
829	\N	\N	FANTA PIÑA 1LT RETORNABLE	FANTA PIÑA 1LT RETORNABLE	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	2	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
830	\N	\N	FANTA PIÑA 1.5LTS RETORNABLE	FANTA PIÑA 1.5LTS RETORNABLE	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	2	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
831	\N	\N	SPRITE 250ML	SPRITE 250ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	2	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
832	\N	\N	SPRITE 500ML	SPRITE 500ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	2	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
833	\N	\N	SPRITE 2LTS	SPRITE 2LTS	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	2	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
834	\N	\N	SPRITE 3LTS	SPRITE 3LTS	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	2	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
835	\N	\N	SPRITE 1LT RETORNABLE	SPRITE 1LT RETORNABLE	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	2	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
836	\N	\N	SPRITE 1.5LTS RETORNABLE	SPRITE 1.5LTS RETORNABLE	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	2	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
837	\N	\N	SPRITE 200ML RETORNABLE	SPRITE 200ML RETORNABLE	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	2	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
838	\N	\N	FRUGOS NARANJA 200ML	FRUGOS NARANJA 200ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	22	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
839	\N	\N	FRUGOS NARANJA 1LT	FRUGOS NARANJA 1LT	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	22	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
840	\N	\N	FRUGOS NARANJA 1.5LTS	FRUGOS NARANJA 1.5LTS	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	22	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
841	\N	\N	FRUGOS DURAZNO 200ML	FRUGOS DURAZNO 200ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	22	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
842	\N	\N	FRUGOS DURAZNO 1LT	FRUGOS DURAZNO 1LT	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	22	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
843	\N	\N	FRUGOS DURAZNO 1.5LTS	FRUGOS DURAZNO 1.5LTS	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	22	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
844	\N	\N	FRUGOS MANZANA 200ML	FRUGOS MANZANA 200ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	22	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
845	\N	\N	FRUGOS MANZANA 1LT	FRUGOS MANZANA 1LT	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	22	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
846	\N	\N	CRUSH NARANJA 2LT	CRUSH NARANJA 2LT	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	2	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
847	\N	\N	CRUSH PIÑA 2LT	CRUSH PIÑA 2LT	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	2	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
848	\N	\N	CRUSH POMELO 2LT	CRUSH POMELO 2LT	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	2	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
849	\N	\N	CRUSH GUARANA 2LT	CRUSH GUARANA 2LT	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	2	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
850	\N	\N	ADES SOJA MANZANA 200ML	ADES SOJA MANZANA 200ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	22	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
851	\N	\N	ADES SOJA MANZANA 1LT	ADES SOJA MANZANA 1LT	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	22	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
852	\N	\N	ADES SOJA NARANJA 200ML	ADES SOJA NARANJA 200ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	22	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
853	\N	\N	ADES SOJA NARANJA 1LT	ADES SOJA NARANJA 1LT	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	22	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
854	\N	\N	ADES SOJA DURAZNO 200ML	ADES SOJA DURAZNO 200ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	22	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
855	\N	\N	ADES SOJA DURAZNO 1LT	ADES SOJA DURAZNO 1LT	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	22	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
856	\N	\N	ADES SOJA FRUTAS TROPICALES 200ML	ADES SOJA FRUTAS TROPICALES 200ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	22	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
857	\N	\N	ADES SOJA FRUTAS TROPICALES 1LT	ADES SOJA FRUTAS TROPICALES 1LT	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	22	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
858	\N	\N	AGUA DASANI C/ GAS 2.25LT	AGUA DASANI C/ GAS 2.25LT	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	5	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
859	\N	\N	AGUA DASANI C/ GAS 500ML	AGUA DASANI C/ GAS 500ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	5	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
860	\N	\N	AGUA DASANI S/ GAS 2.25LT	AGUA DASANI S/ GAS 2.25LT	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	5	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
861	\N	\N	AGUA DASANI S/ GAS 500ML	AGUA DASANI S/ GAS 500ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	5	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
862	\N	\N	AGUA DASANI S/ GAS 500ML C/ PICO	AGUA DASANI S/ GAS 500ML C/ PICO	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	5	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
814	\N	\N	FANTA NARANJA 500ML	FANTA NARANJA 500ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	2	\N	\N	f	\N	/productos	\N	30	\N	t	\N	\N
863	\N	\N	AGUA DASANI S/ GAS 990ML C/ PICO	AGUA DASANI S/ GAS 990ML C/ PICO	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	5	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
864	\N	\N	AGUA DASANI S/ GAS TOUCH LIMON 500ML	AGUA DASANI S/ GAS TOUCH LIMON 500ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	5	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
865	\N	\N	AGUA DASANI S/ GAS 3LT	AGUA DASANI S/ GAS 3LT	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	5	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
866	\N	\N	SCHWEPPES AGUA TONICA 2LTS	SCHWEPPES AGUA TONICA 2LTS	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	5	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
867	\N	\N	SCHWEPPES AGUA TONICA 500ML	SCHWEPPES AGUA TONICA 500ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	5	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
868	\N	\N	SCHWEPPES CITRUS 2LT	SCHWEPPES CITRUS 2LT	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	2	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
869	\N	\N	SCHWEPPES CITRUS 500ML	SCHWEPPES CITRUS 500ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	2	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
870	\N	\N	SCHWEPPES POMELO 2LTS	SCHWEPPES POMELO 2LTS	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	2	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
871	\N	\N	SCHWEPPES POMELO 500ML	SCHWEPPES POMELO 500ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	2	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
873	\N	\N	POWER ADE AZUL 500ML	POWER ADE AZUL 500ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	23	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
874	\N	\N	POWER ADE MANZANA 500ML	POWER ADE MANZANA 500ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	23	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
875	\N	\N	POWER ADE MULTIFRUTAS 500ML	POWER ADE MULTIFRUTAS 500ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	23	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
876	\N	\N	POWER ADE AZUL PRO C/ PICO 500ML	POWER ADE AZUL PRO C/ PICO 500ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	23	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
877	\N	\N	AQUARIUS MANZANA 1.5LTS	AQUARIUS MANZANA 1.5LTS	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	22	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
878	\N	\N	AQUARIUS MANZANA 410ML	AQUARIUS MANZANA 410ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	22	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
879	\N	\N	AQUARIUS NARANJA 1.5LT	AQUARIUS NARANJA 1.5LT	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	22	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
880	\N	\N	AQUARIUS NARANJA 410ML	AQUARIUS NARANJA 410ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	22	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
881	\N	\N	AQUARIUS POMELO 1.5LT	AQUARIUS POMELO 1.5LT	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	22	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
882	\N	\N	AQUARIUS POMELO 410ML	AQUARIUS POMELO 410ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	22	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
883	\N	\N	TIC TAC MIX DE FRUTAS	TIC TAC MIX DE FRUTAS	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	25	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
884	\N	\N	CONTROL ADAPTA XL 3 UNID	CONTROL ADAPTA XL 3 UNID	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	30	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
885	\N	\N	BELDENT INFINIT MENTA 14 UNID	BELDENT INFINIT MENTA 14 UNID	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	25	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
886	\N	\N	TOPLINE SEVEN ULTRA CLEANT MINT	TOPLINE SEVEN ULTRA CLEANT MINT	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	25	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
887	\N	\N	TRIDENT 8G FRESH INTENSE	TRIDENT 8G FRESH INTENSE	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	25	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
888	\N	\N	TOPLINE 6 UND 11G MENTA	TOPLINE 6 UND 11G MENTA	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	25	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
599	\N	\N	TURRON DE MANI	TURRON DE MANI	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	25	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
889	\N	\N	HALLS FRUTILLA	HALLS FRUTILLA	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	25	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
890	\N	\N	HALLS EXTRA FORTE	HALLS EXTRA FORTE	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	25	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
891	\N	\N	BELDENT 10G MENTA	BELDENT 10G MENTA	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	25	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
892	\N	\N	ARCOR MENTHOPLUS MENTA	ARCOR MENTHOPLUS MENTA	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	25	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
893	\N	\N	ARCOR MENTHOPLUS CEREZA	ARCOR MENTHOPLUS CEREZA	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	25	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
894	\N	\N	FREEGELLS MELON	FREEGELLS MELON	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	25	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
895	\N	\N	FREEGELLS MENTA CHOCOLATE	FREEGELLS MENTA CHOCOLATE	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	25	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
896	\N	\N	FREEGELLS CHERRY MENTOL	FREEGELLS CHERRY MENTOL	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	25	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
897	\N	\N	FREEGELLS UVA CREAM	FREEGELLS UVA CREAM	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	25	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
898	\N	\N	FREEGELLS MORANGO CHOC.	FREEGELLS MORANGO CHOC.	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	25	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
899	\N	\N	ARCOR CHOCOMANI	ARCOR CHOCOMANI	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	25	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
900	\N	\N	PAJARITO YERBA SUAVE 500G	PAJARITO YERBA SUAVE 500G	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	26	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
901	\N	\N	YERBA MATE KURUPI FITNESS 250G	YERBA MATE KURUPI FITNESS 250G	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	26	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
902	\N	\N	HEMMER PEPINO EN CONDIMENTO SUAVE 550G	HEMMER PEPINO EN CONDIMENTO SUAVE 550G	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	21	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
903	\N	\N	TEMPERO DO SUL OVOS DE CODORNA	TEMPERO DO SUL OVOS DE CODORNA	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	21	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
904	\N	\N	VELA IGUACU 6 UNID 17G	VELA IGUACU 6 UNID 17G	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	6	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
905	\N	\N	LIANE ESPAGUETE 500	LIANE ESPAGUETE 500	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	33	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
906	\N	\N	LIANE PADRE NOSSO 500G	LIANE PADRE NOSSO 500G	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	33	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
907	\N	\N	LIANE PARAFUSO 500G	LIANE PARAFUSO 500G	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	33	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
908	\N	\N	JOHNNIE WALKER 18 AÑOS GOLD	JOHNNIE WALKER 18 AÑOS GOLD	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	17	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
909	\N	\N	CHANDON ORANGE BITTER	CHANDON ORANGE BITTER	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	16	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
910	\N	\N	SANDY MAC 200ML	SANDY MAC 200ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	17	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
911	\N	\N	VELHO BARREIRO 910ML	VELHO BARREIRO 910ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	27	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
387	\N	\N	JOHNNIE WALKER BLACK LABEL 200 ML	JOHNNIE WALKER BLACK LABEL 200 ML	10	\N	\N	\N	f	\N	\N	t	t	4	ENFRIABLE	\N	17	\N	f	f	\N	/productos	\N	\N	\N	t	f	\N
741	\N	\N	SANGUE DE BOI BRANCO SUAVE 750ML	SANGUE DE BOI BRANCO SUAVE 750ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	15	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
718	\N	\N	VIBRA VINO FUSION DULCE 1.5 LTS	VIBRA VINO FUSION DULCE 1.5 LTS	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	15	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
912	\N	\N	PATAGONIA AMBER LAGER 730ML	PATAGONIA AMBER LAGER 730ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	1	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
913	\N	\N	PATAGONIA WEISSE 730ML	PATAGONIA WEISSE 730ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	1	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
914	\N	\N	NESCAFE TRADIÇAO FORTE 230G	NESCAFE TRADIÇAO FORTE 230G	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	21	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
915	\N	\N	BON O BON AMARILLO 450 GR X 30 UNIDAD	BON O BON AMARILLO 450 GR X 30 UNIDAD	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	24	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
916	\N	\N	HIELO CHICO	HIELO CHICO	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	35	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
917	\N	\N	HIELO MEDIANO	HIELO MEDIANO	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	35	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
918	\N	\N	HIELO GRANDE	HIELO GRANDE	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	35	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
922	\N	\N	RAJAS DE EUCALIPTO LEÑA	RAJAS DE EUCALIPTO LEÑA	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	36	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
923	\N	\N	CARBON 5 UNID NARGUILE	CARBON 5 UNID NARGUILE	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	37	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
924	\N	\N	FOSFOROS QUELUZ	FOSFOROS QUELUZ	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	32	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
357	\N	\N	ARCOIRIS SAL CONDIMENTADA CON CURCUCUMA 400G	ARCOIRIS SAL CONDIMENTADA CON CURCUCUMA 400G	10	\N	\N	\N	f	\N	\N	t	t	4	\N	\N	31	\N	f	f	\N	/productos	\N	30	\N	t	f	\N
925	\N	\N	BRAHMA POMELO 269ML	BRAHMA POMELO 269ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	1	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
926	\N	\N	YOGURT LACTOLANDA 140 ML FRUTILLA	YOGURT LACTOLANDA 140 ML FRUTILLA	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	38	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
927	\N	\N	YOGURT LACTOLANDA 140 ML COCO	YOGURT LACTOLANDA 140 ML COCO	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	38	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
928	\N	\N	YOGURT LACTOLANDA 140 ML VITAL LIGHT DURAZNO	YOGURT LACTOLANDA 140 ML VITAL LIGHT DURAZNO	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	38	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
929	\N	\N	YOGURT LACTOLANDA 140 ML VITAL LIGHT COCO	YOGURT LACTOLANDA 140 ML VITAL LIGHT COCO	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	38	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
930	\N	\N	YOGURT LACTOLANDA 140 ML VITAL LIGHT VAINILLA	YOGURT LACTOLANDA 140 ML VITAL LIGHT VAINILLA	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	38	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
931	\N	\N	YOGURT LACTOLANDA 350 ML DURAZNO	YOGURT LACTOLANDA 350 ML DURAZNO	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	38	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
932	\N	\N	YOGURT LACTOLANDA 350 ML FRUTILLA	YOGURT LACTOLANDA 350 ML FRUTILLA	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	38	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
933	\N	\N	YOGURT LACTOLANDA 350 ML VAINILLA	YOGURT LACTOLANDA 350 ML VAINILLA	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	38	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
934	\N	\N	YOGURT LACTOLANDA 350 ML PIÑA	YOGURT LACTOLANDA 350 ML PIÑA	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	38	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
935	\N	\N	YOGURT LACTOLANDA 350 ML COCO	YOGURT LACTOLANDA 350 ML COCO	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	38	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
936	\N	\N	YOGURT LACTOLANDA 350 ML VITAL LIGHT DURAZNO	YOGURT LACTOLANDA 350 ML VITAL LIGHT DURAZNO	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	38	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
937	\N	\N	YOGURT LACTOLANDA 350 ML VITAL LIGHT VAINILLA	YOGURT LACTOLANDA 350 ML VITAL LIGHT VAINILLA	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	38	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
938	\N	\N	YOGURT LACTOLANDA 350 ML VITAL LIGHT COCO	YOGURT LACTOLANDA 350 ML VITAL LIGHT COCO	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	38	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
939	\N	\N	YOGURT LACTOLANDA SACHET 500 ML VAINILLA	YOGURT LACTOLANDA SACHET 500 ML VAINILLA	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	38	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
940	\N	\N	YOGURT LACTOLANDA SACHET 1 LT COCO	YOGURT LACTOLANDA SACHET 1 LT COCO	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	38	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
941	\N	\N	YOGURT LACTOLANDA SACHET 1 LT DURAZNO	YOGURT LACTOLANDA SACHET 1 LT DURAZNO	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	38	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
942	\N	\N	YOGURT LACTOLANDA SACHET 1 LT VAINILLA	YOGURT LACTOLANDA SACHET 1 LT VAINILLA	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	38	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
943	\N	\N	YOGURT LACTOLANDA SACHET 1 LT FRUTILLA	YOGURT LACTOLANDA SACHET 1 LT FRUTILLA	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	38	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
944	\N	\N	YOGURT LACTOLANDA 900 ML DURAZNO	YOGURT LACTOLANDA 900 ML DURAZNO	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	38	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
945	\N	\N	YOGURT LACTOLANDA 900 ML BIO FRUTILLA	YOGURT LACTOLANDA 900 ML BIO FRUTILLA	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	38	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
947	\N	\N	YOGURT LACTOLANDA 900 ML BIO CIRUELA	YOGURT LACTOLANDA 900 ML BIO CIRUELA	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	38	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
946	\N	\N	YOGURT LACTOLANDA 900 ML BIO MANZANA KIWI	YOGURT LACTOLANDA 900 ML BIO MANZANA KIWI	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	38	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
948	\N	\N	YOGURT LACTOLANDA 180 ML BIO FRUTILLA	YOGURT LACTOLANDA 180 ML BIO FRUTILLA	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	38	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
949	\N	\N	YOGURT LACTOLANDA 180 ML BIO COCO	YOGURT LACTOLANDA 180 ML BIO COCO	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	38	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
950	\N	\N	YOGURT LACTOLANDA 180 ML SIN LACTOSA	YOGURT LACTOLANDA 180 ML SIN LACTOSA	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	38	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
951	\N	\N	CEREGURT LACTOLANDA 140 ML	CEREGURT LACTOLANDA 140 ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	38	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
952	\N	\N	CEREGURT LIGHT LACTOLANDA 140 ML	CEREGURT LIGHT LACTOLANDA 140 ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	38	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
953	\N	\N	LACTOLANDA LACTO MIX PULPA 120 G FRUTILLA	LACTOLANDA LACTO MIX PULPA 120 G FRUTILLA	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	38	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
954	\N	\N	LACTOLANDA LACTO MIX PULPA 120 G MBURUCUYA	LACTOLANDA LACTO MIX PULPA 120 G MBURUCUYA	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	38	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
955	\N	\N	LACTOLANDA LACTO MIX PULPA 120 G FRUTOS ROJOS	LACTOLANDA LACTO MIX PULPA 120 G FRUTOS ROJOS	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	38	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
956	\N	\N	LACTOLANDA PUDDING 120 ML CHOCOLATE 	LACTOLANDA PUDDING 120 ML CHOCOLATE 	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	38	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
957	\N	\N	LACTOLANDA PUDDING 120 ML VAINILLA	LACTOLANDA PUDDING 120 ML VAINILLA	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	38	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
958	\N	\N	LACTOLANDA CHOCOLANDA 200 ML  	LACTOLANDA CHOCOLANDA 200 ML  	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	38	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
959	\N	\N	LACTOLANDA CHOCOLANDA 500 ML	LACTOLANDA CHOCOLANDA 500 ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	38	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
960	\N	\N	LACTOLANDA CHOCOLANDA 1 LT	LACTOLANDA CHOCOLANDA 1 LT	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	38	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
961	\N	\N	LACTOLANDA LECHE ENTERA 500 ML	LACTOLANDA LECHE ENTERA 500 ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	39	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
962	\N	\N	LACTOLANDA LECHE ENTERA 1 LT	LACTOLANDA LECHE ENTERA 1 LT	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	39	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
963	\N	\N	LACTOLANDA LECHE SIN LACTOSA 1 LT	LACTOLANDA LECHE SIN LACTOSA 1 LT	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	39	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
964	\N	\N	LACTOLANDA LECHE CRECIMIENTO 1 LT	LACTOLANDA LECHE CRECIMIENTO 1 LT	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	39	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
965	\N	\N	LACTOLANDA LECHE DESCREMADA VITAL LIGHT 1 LT	LACTOLANDA LECHE DESCREMADA VITAL LIGHT 1 LT	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	39	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
966	\N	\N	LACTOLANDA LECHE DESCREMADA EN POLVO 400 G	LACTOLANDA LECHE DESCREMADA EN POLVO 400 G	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	21	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
967	\N	\N	LACTOLANDA LECHE ENTERA EN POLVO 400 G 	LACTOLANDA LECHE ENTERA EN POLVO 400 G 	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	21	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
968	\N	\N	SOM BERG LECHE 500 ML	SOM BERG LECHE 500 ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	39	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
969	\N	\N	SOM BERG LECHE 1 LT 	SOM BERG LECHE 1 LT 	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	39	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
970	\N	\N	TREBOL LECHE UAT ENTERA 1 LT	TREBOL LECHE UAT ENTERA 1 LT	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	39	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
971	\N	\N	FAMLAC LECHE LARGA VIDA 1 LT	FAMLAC LECHE LARGA VIDA 1 LT	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	39	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
972	\N	\N	TREBOL LECHE DESCREMADA 1 LT	TREBOL LECHE DESCREMADA 1 LT	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	39	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
973	\N	\N	RED HORSE ENERGY DRINK 2 LT|	RED HORSE ENERGY DRINK 2 LT|	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	23	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
974	\N	\N	RED HORSE BLUEBERRY 2 LT	RED HORSE BLUEBERRY 2 LT	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	23	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
975	\N	\N	RED HORSE COCO E ACAI 2 LT	RED HORSE COCO E ACAI 2 LT	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	23	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
976	\N	\N	RED HORSE MELANCIA 2 LT	RED HORSE MELANCIA 2 LT	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	23	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
977	\N	\N	RED HORSE MANGA 2 LT	RED HORSE MANGA 2 LT	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	23	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
978	\N	\N	BALY ENERGY 2 LT	BALY ENERGY 2 LT	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	23	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
979	\N	\N	BALY ENERGY MELANCIA 2 LT	BALY ENERGY MELANCIA 2 LT	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	23	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
980	\N	\N	MONSTER ENERGY NORMAL 473 ML	MONSTER ENERGY NORMAL 473 ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	23	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
981	\N	\N	MONSTER ENERGY MANGO LOCO 473 ML	MONSTER ENERGY MANGO LOCO 473 ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	23	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
982	\N	\N	MONSTER ENERGY ABSOLUTELY ZERO 473 ML	MONSTER ENERGY ABSOLUTELY ZERO 473 ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	23	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
983	\N	\N	MONSTER ENERGY ULTRA VIOLET 473 ML	MONSTER ENERGY ULTRA VIOLET 473 ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	5	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
984	\N	\N	BALY ENERGY LATA 250 ML 	BALY ENERGY LATA 250 ML 	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	23	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
985	\N	\N	BALY ENERGY LATA 250 ML TROPICAL	BALY ENERGY LATA 250 ML TROPICAL	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	23	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
986	\N	\N	BALY ENERGY LATA 250 ML COCO E ACAI	BALY ENERGY LATA 250 ML COCO E ACAI	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	23	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
987	\N	\N	V12 ENERGY LATA 250 ML	V12 ENERGY LATA 250 ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	23	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
988	\N	\N	V12 ENERGY 2 LTS	V12 ENERGY 2 LTS	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	23	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
989	\N	\N	BALY ENERGY 1 LT TROPICAL	BALY ENERGY 1 LT TROPICAL	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	23	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
990	\N	\N	BALY ENERGY 2 LT TROPICAL	BALY ENERGY 2 LT TROPICAL	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	23	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
991	\N	\N	BALY ENERGY 2 LT ACAI	BALY ENERGY 2 LT ACAI	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	23	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
992	\N	\N	BALY ENERGY 2 LT COCO E ACAI	BALY ENERGY 2 LT COCO E ACAI	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	23	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
993	\N	\N	BALY ENERGY 1 LT	BALY ENERGY 1 LT	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	23	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
994	\N	\N	DARK DOG 1.5 LT	DARK DOG 1.5 LT	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	23	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
995	\N	\N	DARK DOG 250 ML	DARK DOG 250 ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	23	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
996	\N	\N	AGUA SELTZ SIN GAS 500 ML	AGUA SELTZ SIN GAS 500 ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	5	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
997	\N	\N	AGUA SELTZ CON GAS 500 ML	AGUA SELTZ CON GAS 500 ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	5	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
998	\N	\N	AGUA SELTZ LADY SIN GAS C/ PICO 500 ML	AGUA SELTZ LADY SIN GAS C/ PICO 500 ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	5	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
999	\N	\N	AGUA SELTZ SIN GAS 2 LT	AGUA SELTZ SIN GAS 2 LT	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	5	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
1000	\N	\N	SELTZ MR BEE ENERGY 500 ML	SELTZ MR BEE ENERGY 500 ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	23	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
1001	\N	\N	SODA SIFON 2 LT	SODA SIFON 2 LT	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	5	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
1002	\N	\N	THE BLACK SHEEP 600 PUFF PINEAPPLE ICE (PIÑA-HIELO)	THE BLACK SHEEP 600 PUFF PINEAPPLE ICE (PIÑA-HIELO)	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	11	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
1003	\N	\N	THE BLACK SHEEP 600 PUFF  FROSTED BERRIES (MORAS)	THE BLACK SHEEP 600 PUFF  FROSTED BERRIES (MORAS)	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	11	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
1004	\N	\N	THE BLACK SHEEP 600 PUFF  STRAWBERRY ICE (FRUTILLA-HIELO)	THE BLACK SHEEP 600 PUFF  STRAWBERRY ICE (FRUTILLA-HIELO)	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	11	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
1005	\N	\N	THE BLACK SHEEP 600 PUFF  GRAPE ICE (UVA-HIELO)	THE BLACK SHEEP 600 PUFF  GRAPE ICE (UVA-HIELO)	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	11	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
1006	\N	\N	THE BLACK SHEEP 600 PUFF  MINT ICE (MENTA-HIELO)	THE BLACK SHEEP 600 PUFF  MINT ICE (MENTA-HIELO)	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	11	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
1007	\N	\N	THE BLACK SHEEP 600 PUFF MANGO ICE (MANGO-HIELO)	THE BLACK SHEEP 600 PUFF MANGO ICE (MANGO-HIELO)	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	11	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
1008	\N	\N	TRITURADOR DE HIERBAS VARIOS	TRITURADOR DE HIERBAS VARIOS	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	14	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
1009	\N	\N	VASO PLASTICO 770 ML	VASO PLASTICO 770 ML	10	\N	\N	\N	\N	\N	\N	\N	t	7	\N	\N	14	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
1010	\N	\N	BIC ENCENDEDOR CHICO	BIC ENCENDEDOR CHICO	10	\N	\N	\N	\N	\N	\N	\N	t	7	NO_ENFRIABLE	\N	32	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
1011	\N	\N	BIC ENCENDEDOR GRANDE	BIC ENCENDEDOR GRANDE	10	\N	\N	\N	\N	\N	\N	\N	t	7	NO_ENFRIABLE	\N	32	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
1012	\N	\N	DORITOS QUEIJO NACHO 84G	DORITOS QUEIJO NACHO 84G	10	\N	\N	\N	\N	\N	\N	t	t	4	NO_ENFRIABLE	\N	18	\N	\N	f	\N	/productos	\N	30	\N	t	f	\N
1013	\N	\N	STOKERS LONG CUT MINT 34G	STOKERS LONG CUT MINT 34G	10	\N	\N	\N	\N	\N	\N	\N	t	4	NO_ENFRIABLE	\N	40	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
1014	\N	\N	STOKERS LONG CUT WINTERGREEN 34G	STOKERS LONG CUT WINTERGREEN 34G	10	\N	\N	\N	\N	\N	\N	\N	t	4	NO_ENFRIABLE	\N	40	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
1015	\N	\N	DORITOS QUEIJO NACHO 48G/55G	DORITOS QUEIJO NACHO 48G/55G	10	\N	\N	\N	\N	\N	\N	\N	t	4	NO_ENFRIABLE	\N	18	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
1016	\N	\N	CHEETOS REQUEIJAO FAMILIA 140G	CHEETOS REQUEIJAO FAMILIA 140G	10	\N	\N	\N	\N	\N	\N	t	t	4	NO_ENFRIABLE	\N	18	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
1017	\N	\N	FODAC ESENCIA BUBBALOO 50G	FODAC ESENCIA BUBBALOO 50G	10	\N	\N	\N	\N	\N	\N	t	t	4	NO_ENFRIABLE	\N	37	\N	\N	f	\N	/productos	\N	30	\N	t	f	\N
1018	\N	\N	ZIGGY ESENCIA TUTTI FRUTI 50G	ZIGGY ESENCIA TUTTI FRUTI 50G	10	\N	\N	\N	\N	\N	\N	t	t	4	NO_ENFRIABLE	\N	37	\N	\N	f	\N	/productos	\N	30	\N	t	f	\N
1019	\N	\N	ELMA CHIPS PINGO D OURO PICANHA 95G	ELMA CHIPS PINGO D OURO PICANHA 95G	10	\N	\N	\N	\N	\N	\N	t	t	4	\N	\N	18	\N	\N	f	\N	/productos	\N	30	\N	t	f	\N
1020	\N	\N	ELMA CHIPS PINGO D OURO BACON 130G	ELMA CHIPS PINGO D OURO BACON 130G	10	\N	\N	\N	\N	\N	\N	t	t	4	NO_ENFRIABLE	\N	18	\N	\N	f	\N	/productos	\N	30	\N	t	f	\N
1021	\N	\N	MELITTA TRADICIONAL CAFE TORRADO 500G	MELITTA TRADICIONAL CAFE TORRADO 500G	10	\N	\N	\N	\N	\N	\N	t	t	4	NO_ENFRIABLE	\N	41	\N	\N	f	\N	/productos	\N	30	\N	t	f	\N
632	\N	\N	NESCAFE CAFE MATINAL SUAVE 230G	NESCAFE CAFE MATINAL SUAVE 230G	10	\N	\N	\N	\N	\N	\N	t	t	4	NO_ENFRIABLE	\N	21	\N	\N	f	\N	/productos	\N	30	\N	t	f	\N
1022	\N	\N	NESTLE CHOCOLATE PRESTIGIO 33G	NESTLE CHOCOLATE PRESTIGIO 33G	10	\N	\N	\N	\N	\N	\N	t	t	4	NO_ENFRIABLE	\N	25	\N	\N	f	\N	/productos	\N	30	\N	t	f	\N
1023	\N	\N	NAVETA PLAYING CARDS - CARTA ESPAÑOLA	NAVETA PLAYING CARDS - CARTA ESPAÑOLA	10	\N	\N	\N	\N	\N	\N	\N	t	4	NO_ENFRIABLE	\N	42	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
1024	\N	\N	UNO CARTAS 97275	UNO CARTAS 97275	10	\N	\N	\N	\N	\N	\N	\N	t	4	NO_ENFRIABLE	\N	42	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
1025	\N	\N	CARGADOR P/ CELULAR FAST - TIPO C	CARGADOR P/ CELULAR FAST - TIPO C	10	\N	\N	\N	\N	\N	\N	\N	t	4	NO_ENFRIABLE	\N	14	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
1026	\N	\N	ECOPOWER CARGADOR EP-7056	ECOPOWER CARGADOR EP-7056	10	\N	\N	\N	\N	\N	\N	\N	t	4	NO_ENFRIABLE	\N	14	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
1027	\N	\N	ECOPOWER AURICULAR H123	ECOPOWER AURICULAR H123	10	\N	\N	\N	\N	\N	\N	\N	t	4	NO_ENFRIABLE	\N	14	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
504	\N	\N	POETT ALEGRA TU DIA  990 ML	POETT ALEGRA TU DIA  990 ML	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	6	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
1028	\N	\N	POETT FRESCURA DE LAVANDA 360ML	POETT FRESCURA DE LAVANDA 360ML	10	\N	\N	\N	\N	\N	\N	\N	t	4	NO_ENFRIABLE	\N	6	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
1029	\N	\N	CAVALLARO DES. AMBIENTE FANTASIA 900ML	CAVALLARO DES. AMBIENTE FANTASIA 900ML	10	\N	\N	\N	\N	\N	\N	\N	t	4	NO_ENFRIABLE	\N	6	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
1030	\N	\N	MENTOS MAGIC 29.5G	MENTOS MAGIC 29.5G	10	\N	\N	\N	\N	\N	\N	t	t	4	NO_ENFRIABLE	\N	25	\N	\N	f	\N	/productos	\N	30	\N	t	f	\N
1031	\N	\N	PRINGLES QUESO 124G	PRINGLES QUESO 124G	10	\N	\N	\N	\N	\N	\N	t	t	4	NO_ENFRIABLE	\N	18	\N	\N	f	\N	/productos	\N	30	\N	t	f	\N
1032	\N	\N	PRINGLES ORIGINAL 124G	PRINGLES ORIGINAL 124G	10	\N	\N	\N	\N	\N	\N	t	t	4	NO_ENFRIABLE	\N	18	\N	\N	f	\N	/productos	\N	30	\N	t	f	\N
1033	\N	\N	PRINGLES CREMA Y CEBOLLA 124G	PRINGLES CREMA Y CEBOLLA 124G	10	\N	\N	\N	\N	\N	\N	t	t	4	NO_ENFRIABLE	\N	18	\N	f	f	\N	/productos	\N	30	\N	t	f	\N
1034	\N	\N	ECOPOWER CARGADOR EP - 7070	ECOPOWER CARGADOR EP - 7070	10	\N	\N	\N	f	\N	\N	f	t	4	NO_ENFRIABLE	\N	14	\N	f	f	\N	/productos	\N	\N	\N	t	f	\N
1035	\N	\N	NESTLE CRUNCH 90G	NESTLE CRUNCH 90G	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	25	\N	\N	f	\N	/productos	\N	30	\N	t	f	\N
1036	\N	\N	NESTLE CLASSIC PRESTIGIO 90G	NESTLE CLASSIC PRESTIGIO 90G	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	25	\N	\N	f	\N	/productos	\N	30	\N	t	f	\N
1037	\N	\N	LACTA LAKA OREO 90G	LACTA LAKA OREO 90G	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	25	\N	\N	f	\N	/productos	\N	30	\N	t	f	\N
1038	\N	\N	LACTA LAKA BLANCO 90G	LACTA LAKA BLANCO 90G	10	\N	\N	\N	\N	\N	\N	t	t	4	NO_ENFRIABLE	\N	25	\N	\N	f	\N	/productos	\N	30	\N	t	f	\N
1039	\N	\N	LACTA AMARO 40% CACAU 90G	LACTA AMARO 40% CACAU 90G	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	25	\N	\N	f	\N	/productos	\N	30	\N	t	f	\N
1040	\N	\N	LACTA DIAMANTE NEGRO 90G	LACTA DIAMANTE NEGRO 90G	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	25	\N	\N	f	\N	/productos	\N	30	\N	t	f	\N
1041	\N	\N	KURUPI YERBA MATE ED.LIM MENTA Y BOLDO 500G	KURUPI YERBA MATE ED.LIM MENTA Y BOLDO 500G	10	\N	\N	\N	f	\N	\N	t	t	4	\N	\N	26	\N	f	f	\N	/productos	\N	30	\N	t	f	\N
1042	\N	\N	DOSIS VITAL ORIGINAL AUTENTICA VIP 15G	DOSIS VITAL ORIGINAL AUTENTICA VIP 15G	10	\N	\N	\N	\N	\N	\N	\N	t	4	NO_ENFRIABLE	\N	30	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
1043	\N	\N	WATTS NECTAR FRUTOS ROJOS 1L	WATTS NECTAR FRUTOS ROJOS 1L	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	22	\N	\N	f	\N	/productos	\N	30	\N	t	f	\N
1044	\N	\N	FREEGELLS CEREZA 	FREEGELLS CEREZA 	10	\N	\N	\N	\N	\N	\N	\N	t	4	NO_ENFRIABLE	\N	25	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
1045	\N	\N	CONTI GASEOSA UVA LATA 269ML	CONTI GASEOSA UVA LATA 269ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	2	\N	\N	f	\N	/productos	\N	30	\N	t	f	\N
1047	\N	\N	CONTI GASEOSA COLA 269ML	CONTI GASEOSA COLA 269ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	2	\N	\N	f	\N	/productos	\N	30	\N	t	f	\N
1046	\N	\N	CONTI GASEOSA GUARANA LATA 269ML	CONTI GASEOSA GUARANA LATA 269ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	2	\N	\N	f	\N	/productos	\N	30	\N	t	f	\N
1048	\N	\N	SANTA CLARA AGUA MINERAL SIN GAS 500ML	SANTA CLARA AGUA MINERAL SIN GAS 500ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	5	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
1049	\N	\N	ADALYA ESENCIA LOVE 66 - 50G	ADALYA ESENCIA LOVE 66 - 50G	10	\N	\N	\N	\N	\N	\N	t	t	4	NO_ENFRIABLE	\N	37	\N	\N	f	\N	/productos	\N	30	\N	t	f	\N
1050	\N	\N	ZOMO ESENCIA SORVETUVA 50G	ZOMO ESENCIA SORVETUVA 50G	10	\N	\N	\N	\N	\N	\N	t	t	4	NO_ENFRIABLE	\N	37	\N	\N	f	\N	/productos	\N	30	\N	t	f	\N
1051	\N	\N	ZOMO ESENCIA MY SPLASH JOY 50G	ZOMO ESENCIA MY SPLASH JOY 50G	10	\N	\N	\N	\N	\N	\N	t	t	4	NO_ENFRIABLE	\N	37	\N	\N	f	\N	/productos	\N	30	\N	t	f	\N
1052	\N	\N	ZOMO ESENCIA MY TOKYO 50G	ZOMO ESENCIA MY TOKYO 50G	10	\N	\N	\N	\N	\N	\N	t	t	4	NO_ENFRIABLE	\N	40	\N	\N	f	\N	/productos	\N	30	\N	t	f	\N
1053	\N	\N	PICO DULCE CHUPETIN DE CARAMELO 14G	PICO DULCE CHUPETIN DE CARAMELO 14G	10	\N	\N	\N	\N	\N	\N	t	t	4	NO_ENFRIABLE	\N	25	\N	\N	f	\N	/productos	\N	30	\N	t	f	\N
1054	\N	\N	CHEETOS REQUIJAO 37G/42G	CHEETOS REQUIJAO 37G/42G	10	\N	\N	\N	\N	\N	\N	t	t	4	NO_ENFRIABLE	\N	18	\N	\N	f	\N	/productos	\N	30	\N	t	f	\N
1055	\N	\N	YERON BLISTER X4 UNIDAD	YERON BLISTER X4 UNIDAD	10	\N	\N	\N	\N	\N	\N	t	t	4	NO_ENFRIABLE	\N	43	\N	\N	f	\N	/productos	\N	30	\N	t	f	\N
1056	\N	\N	HORNET ROLLING PAPERS - CHOCOLATE 	HORNET ROLLING PAPERS - CHOCOLATE 	10	\N	\N	\N	\N	\N	\N	\N	t	4	NO_ENFRIABLE	\N	40	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
1057	\N	\N	SMOKING MASTER KS SILVER EXTRA SLIM	SMOKING MASTER KS SILVER EXTRA SLIM	10	\N	\N	\N	\N	\N	\N	\N	t	4	NO_ENFRIABLE	\N	40	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
1058	\N	\N	BEM BOLADO KING SIZE SLIM CELULOSE 	BEM BOLADO KING SIZE SLIM CELULOSE 	10	\N	\N	\N	\N	\N	\N	\N	t	4	NO_ENFRIABLE	\N	40	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
1059	\N	\N	BOB MARLEY CIGARETTE PAPERS - BLANCO	BOB MARLEY CIGARETTE PAPERS - BLANCO	10	\N	\N	\N	\N	\N	\N	\N	t	4	NO_ENFRIABLE	\N	40	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
1060	\N	\N	INOVA CARGADOR VEHICULAR CAR -0021	INOVA CARGADOR VEHICULAR CAR -0021	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	14	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
1061	\N	\N	SHENGYA TOP CHOICE - SACA CORCHOS	SHENGYA TOP CHOICE - SACA CORCHOS	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	28	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
1062	\N	\N	HEMMER PEPINOS EM CONDIMENTO SUAVE 300G	HEMMER PEPINOS EM CONDIMENTO SUAVE 300G	10	\N	\N	\N	\N	\N	\N	t	t	4	NO_ENFRIABLE	\N	21	\N	\N	f	\N	/productos	\N	30	\N	t	f	\N
1063	\N	\N	NINNOFF VODKA RED 900ML	NINNOFF VODKA RED 900ML	10	\N	\N	\N	\N	\N	\N	f	t	4	ENFRIABLE	\N	27	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
872	\N	\N	KIN AGUA SIN GAS 500ML	KIN AGUA SIN GAS 500ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	5	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
1065	\N	\N	MILLER HIGT LIFE LATA 296ML	MILLER HIGT LIFE LATA 296ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	1	\N	\N	f	\N	/productos	\N	30	\N	t	f	\N
1066	\N	\N	NESTLE BONO RELLENAS CHOCOLATE 126G	NESTLE BONO RELLENAS CHOCOLATE 126G	10	\N	\N	\N	\N	\N	\N	t	t	4	NO_ENFRIABLE	\N	18	\N	\N	f	\N	/productos	\N	30	\N	t	f	\N
1067	\N	\N	NESTLE BONO RELLENAS DULCE DE LECHE 126G	NESTLE BONO RELLENAS DULCE DE LECHE 126G	10	\N	\N	\N	\N	\N	\N	t	t	4	\N	\N	18	\N	\N	f	\N	/productos	\N	30	\N	t	f	\N
1068	\N	\N	NESTLE BONO RELLENAS FRUTILLA 126G	NESTLE BONO RELLENAS FRUTILLA 126G	10	\N	\N	\N	\N	\N	\N	t	t	4	NO_ENFRIABLE	\N	18	\N	\N	f	\N	/productos	\N	30	\N	t	f	\N
1069	\N	\N	PALERMO DUO 10	PALERMO DUO 10	10	\N	\N	\N	\N	\N	\N	t	t	4	NO_ENFRIABLE	\N	11	\N	\N	f	\N	/productos	\N	30	\N	t	f	\N
1070	\N	\N	ABSOLUT VODKA 1L	ABSOLUT VODKA 1L	10	\N	\N	\N	\N	\N	\N	f	t	4	ENFRIABLE	\N	27	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
1071	\N	\N	DARK DOG LATA 500ML	DARK DOG LATA 500ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	23	\N	\N	f	\N	/productos	\N	30	\N	t	f	\N
1072	\N	\N	NISSIN CUP NOODLES YAKISSOBA 70G	NISSIN CUP NOODLES YAKISSOBA 70G	10	\N	\N	\N	\N	\N	\N	t	t	4	NO_ENFRIABLE	\N	21	\N	\N	f	\N	/productos	\N	30	\N	t	f	\N
1073	\N	\N	NISSIN CUP NOODLES GALINHA CAIPIRA 70G	NISSIN CUP NOODLES GALINHA CAIPIRA 70G	10	\N	\N	\N	\N	\N	\N	t	t	4	NO_ENFRIABLE	\N	21	\N	\N	f	\N	/productos	\N	30	\N	t	f	\N
1075	\N	\N	NISSIN CUP NOODLES CARNE DEFUMADA 70G	NISSIN CUP NOODLES CARNE DEFUMADA 70G	10	\N	\N	\N	\N	\N	\N	t	t	4	NO_ENFRIABLE	\N	21	\N	\N	f	\N	/productos	\N	30	\N	t	f	\N
1076	\N	\N	STOKERS COOL WINTERGREEN 34G	STOKERS COOL WINTERGREEN 34G	10	\N	\N	\N	\N	\N	\N	\N	t	4	NO_ENFRIABLE	\N	40	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
1077	\N	\N	ROSKOFF VODKA 880ML	ROSKOFF VODKA 880ML	10	\N	\N	\N	\N	\N	\N	f	t	4	ENFRIABLE	\N	27	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
1078	\N	\N	CAPITAN CORTEZ RON CARTA DE ORO 1L	CAPITAN CORTEZ RON CARTA DE ORO 1L	10	\N	\N	\N	\N	\N	\N	f	t	4	ENFRIABLE	\N	27	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
1079	\N	\N	JOSE CUERVO REPOSADO EDICION LIMITADA 750ML	JOSE CUERVO REPOSADO EDICION LIMITADA 750ML	10	\N	\N	\N	\N	\N	\N	f	t	4	ENFRIABLE	\N	27	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
1080	\N	\N	KENT BLUE 20	KENT BLUE 20	10	\N	\N	\N	\N	\N	\N	\N	t	4	NO_ENFRIABLE	\N	11	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
1081	\N	\N	BUDWEISER 66 BRAVE  LATA 310ML	BUDWEISER 66 BRAVE  LATA 310ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	1	\N	\N	f	\N	/productos	\N	30	\N	t	f	\N
1082	\N	\N	PETTIZ MANI CROCANTE PIMIENTA ROJA 500G	PETTIZ MANI CROCANTE PIMIENTA ROJA 500G	10	\N	\N	\N	\N	\N	\N	t	t	4	NO_ENFRIABLE	\N	18	\N	\N	f	\N	/productos	\N	30	\N	t	f	\N
1074	\N	\N	PETTIZ MANI CROCANTE NATURAL150G	PETTIZ MANI CROCANTE NATURAL150G	10	\N	\N	\N	\N	\N	\N	t	t	4	\N	\N	18	\N	\N	f	\N	/productos	\N	30	\N	t	f	\N
1083	\N	\N	PETTIZ MANI CROCANTE NATURAL 500G	PETTIZ MANI CROCANTE NATURAL 500G	10	\N	\N	\N	\N	\N	\N	t	t	4	NO_ENFRIABLE	\N	18	\N	\N	f	\N	/productos	\N	30	\N	t	f	\N
1084	\N	\N	NESTLE RELLENAS PRESTIGIO 140G	NESTLE RELLENAS PRESTIGIO 140G	10	\N	\N	\N	\N	\N	\N	t	t	4	NO_ENFRIABLE	\N	18	\N	\N	f	\N	/productos	\N	30	\N	t	f	\N
1085	\N	\N	VOZOL POD DESCARTABLE BANANA ICE BAR 500	VOZOL POD DESCARTABLE BANANA ICE BAR 500	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	40	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
1086	\N	\N	VOZOL POD DESCARTABLE SANDIA ICE BAR 500	VOZOL POD DESCARTABLE SANDIA ICE BAR 500	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	40	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
1087	\N	\N	VOZOL POD DESCARTABLE NARANJA ICE BAR 500	VOZOL POD DESCARTABLE NARANJA ICE BAR 500	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	40	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
1088	\N	\N	VOZOL POD DESCARTABLE BLUE RAZZ ICE BAR 500	VOZOL POD DESCARTABLE BLUE RAZZ ICE BAR 500	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	40	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
1089	\N	\N	VOZOL POD DESCARTABLE SANDIA ICE BAR 800	VOZOL POD DESCARTABLE SANDIA ICE BAR 800	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	40	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
1090	\N	\N	VOZOL POD DESCARTABLE BLUE RAZZ ICE BAR 800	VOZOL POD DESCARTABLE BLUE RAZZ ICE BAR 800	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	40	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
1091	\N	\N	VOZOL POD DESCARTABLE NARANJA SODA BAR 800	VOZOL POD DESCARTABLE NARANJA SODA BAR 800	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	40	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
1092	\N	\N	VOZOL POD DESCARTABLE REFRESHING MINT BAR 800	VOZOL POD DESCARTABLE REFRESHING MINT BAR 800	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	40	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
1094	\N	\N	VOZOL ALIEN MENTA REFRESCANTE 2500PUFFS 	VOZOL ALIEN MENTA REFRESCANTE 2500PUFFS 	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	40	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
1095	\N	\N	VOZOL ALIEN UVA ICE 2500PUFFS 	VOZOL ALIEN UVA ICE 2500PUFFS 	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	40	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
1096	\N	\N	VOZOL ALIEN RED BULL 2500PUFFS 	VOZOL ALIEN RED BULL 2500PUFFS 	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	40	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
1097	\N	\N	VOZOL ALIEN PINA COLADA 2500PUFFS	VOZOL ALIEN PINA COLADA 2500PUFFS	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	40	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
1098	\N	\N	VOZOL BAR RED BULL 3000PUFFS	VOZOL BAR RED BULL 3000PUFFS	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	40	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
1099	\N	\N	VOZOL BAR UVA ICE 3000PUFFS 	VOZOL BAR UVA ICE 3000PUFFS 	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	40	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
1093	\N	\N	VOZOL POD DESCARTABLE TERERE MINT PUFFS 1000	VOZOL POD DESCARTABLE TERERE MINT PUFFS 1000	10	\N	\N	\N	\N	\N	\N	\N	t	4	\N	\N	40	\N	\N	f	\N	/productos	\N	\N	\N	t	f	\N
1100	\N	\N	BUDWEISER LATA 410ML	BUDWEISER LATA 410ML	10	\N	\N	\N	\N	\N	\N	t	t	8	ENFRIABLE	\N	1	\N	\N	f	\N	/productos	\N	30	\N	t	\N	\N
1103	\N	\N	SOL CERVEZA BOT 650ML	SOL CERVEZA BOT 650ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	1	\N	\N	f	\N	/productos	\N	30	\N	t	\N	\N
1106	\N	\N	LACTA DIAMANTE NEGRO 20 G	LACTA DIAMANTE NEGRO 20 G	10	\N	\N	\N	\N	\N	\N	\N	t	9	\N	\N	24	\N	\N	f	\N	/productos	\N	\N	\N	t	\N	\N
1107	\N	\N	LACTA AO LEITE 20 G	LACTA AO LEITE 20 G	10	\N	\N	\N	\N	\N	\N	\N	t	9	\N	\N	24	\N	\N	f	\N	/productos	\N	\N	\N	t	\N	\N
1108	\N	\N	ALFAJOR NEVARES BLANCO 70 G	ALFAJOR NEVARES BLANCO 70 G	10	\N	\N	\N	\N	\N	\N	\N	t	9	\N	\N	24	\N	\N	f	\N	/productos	\N	\N	\N	t	\N	\N
1109	\N	\N	ALFAJOR NEVARES NEGRO 70 G	ALFAJOR NEVARES NEGRO 70 G	10	\N	\N	\N	\N	\N	\N	\N	t	9	\N	\N	24	\N	\N	f	\N	/productos	\N	\N	\N	t	\N	\N
1110	\N	\N	AMOR GALLE. BAGLEY 112 G	AMOR GALLE. BAGLEY 112 G	10	\N	\N	\N	\N	\N	\N	\N	t	9	\N	\N	18	\N	\N	f	\N	/productos	\N	\N	\N	t	\N	\N
1111	\N	\N	GALLETITA EL TRIGAL SALVAJE 	GALLETITA EL TRIGAL SALVAJE 	10	\N	\N	\N	\N	\N	\N	\N	t	9	\N	\N	18	\N	\N	f	\N	/productos	\N	\N	\N	t	\N	\N
1112	\N	\N	BATON GALAK TUBITO CHOCOLATE 16 G	BATON GALAK TUBITO CHOCOLATE 16 G	10	\N	\N	\N	\N	\N	\N	\N	t	9	\N	\N	24	\N	\N	f	\N	/productos	\N	\N	\N	t	\N	\N
1113	\N	\N	ZOMO ESENCIA MY BLUEBERRY MINT 50 G	ZOMO ESENCIA MY BLUEBERRY MINT 50 G	10	\N	\N	\N	\N	\N	\N	\N	t	9	\N	\N	40	\N	\N	f	\N	/productos	\N	\N	\N	t	\N	\N
1114	\N	\N	ZOMO ENSENCIA MY WATERMELON MINT 50 G	ZOMO ENSENCIA MY WATERMELON MINT 50 G	10	\N	\N	\N	\N	\N	\N	\N	t	9	\N	\N	40	\N	\N	f	\N	/productos	\N	\N	\N	t	\N	\N
1115	\N	\N	ZOMO ENSENCIA MELANCIA ATOMICA 50 G	ZOMO ENSENCIA MELANCIA ATOMICA 50 G	10	\N	\N	\N	\N	\N	\N	\N	t	9	\N	\N	40	\N	\N	f	\N	/productos	\N	\N	\N	t	\N	\N
1116	\N	\N	ZOMO ENSENCIA MY STRAWBERRY 50 G	ZOMO ENSENCIA MY STRAWBERRY 50 G	10	\N	\N	\N	\N	\N	\N	\N	t	9	\N	\N	40	\N	\N	f	\N	/productos	\N	\N	\N	t	\N	\N
1101	\N	\N	NESTLE GALLETITA RELLENAS CHOCOLATE 140G	NESTLE GALLETITA RELLENAS CHOCOLATE 140G	10	\N	\N	\N	\N	\N	\N	t	t	4	NO_ENFRIABLE	\N	18	\N	\N	f	\N	/productos	\N	30	\N	t	\N	\N
1102	\N	\N	SOL CERVEZA BOT 330ML	SOL CERVEZA BOT 330ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	1	\N	\N	f	\N	/productos	\N	30	\N	t	\N	\N
1104	\N	\N	BIS ORIGINAL 126G	BIS ORIGINAL 126G	10	\N	\N	\N	\N	\N	\N	t	t	12	NO_ENFRIABLE	\N	24	\N	\N	f	\N	/productos	\N	30	\N	t	\N	\N
1105	\N	\N	BOTTEGA FRAGOLINO TINTO 750 ML	BOTTEGA FRAGOLINO TINTO 750 ML	10	\N	\N	\N	\N	\N	\N	t	t	9	ENFRIABLE	\N	16	\N	\N	f	\N	/productos	\N	\N	\N	t	\N	\N
821	\N	\N	FANTA GUARANA 500ML	FANTA GUARANA 500ML	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	2	\N	\N	f	\N	/productos	\N	30	\N	t	\N	\N
1133	\N	\N	DOVE PERA Y ALOE VERA DESODORANTE 150ML	DOVE PERA Y ALOE VERA DESODORANTE 150ML	10	\N	\N	\N	\N	\N	\N	\N	t	4	NO_ENFRIABLE	\N	6	\N	\N	f	\N	/productos	\N	\N	\N	t	\N	\N
1134	\N	\N	NESTLE MOÇA CHOCOLATE 38GR	NESTLE MOÇA CHOCOLATE 38GR	10	\N	\N	\N	\N	\N	\N	t	t	4	ENFRIABLE	\N	24	\N	\N	f	\N	/productos	\N	30	\N	t	\N	\N
1135	\N	\N	BILL ROLLING PAPERS LIMBO SMOKE SHOP VISITAR 100US	BILL ROLLING PAPERS LIMBO SMOKE SHOP VISITAR 100US	10	\N	\N	\N	\N	\N	\N	\N	t	4	NO_ENFRIABLE	\N	45	\N	\N	f	\N	/productos	\N	\N	\N	t	\N	\N
1136	\N	\N	ZOMO ROLLING PAPER CLASSIC MEDIUM SIZE	ZOMO ROLLING PAPER CLASSIC MEDIUM SIZE	10	\N	\N	\N	\N	\N	\N	\N	t	4	NO_ENFRIABLE	\N	45	\N	\N	f	\N	/productos	\N	\N	\N	t	\N	\N
1137	\N	\N	ZOMO NATURAL PERFECT BLACK KING SIZE 	ZOMO NATURAL PERFECT BLACK KING SIZE 	10	\N	\N	\N	\N	\N	\N	\N	t	4	NO_ENFRIABLE	\N	45	\N	\N	f	\N	/productos	\N	\N	\N	t	\N	\N
1138	\N	\N	OCB SLIM PREMIUM KING SIZE 	OCB SLIM PREMIUM KING SIZE 	10	\N	\N	\N	\N	\N	\N	\N	t	4	NO_ENFRIABLE	\N	45	\N	\N	f	\N	/productos	\N	\N	\N	t	\N	\N
1139	\N	\N	MAR NUTRIVE HUMECTANTE LECHE DE ALMENDRAS 125G	MAR NUTRIVE HUMECTANTE LECHE DE ALMENDRAS 125G	10	\N	\N	\N	\N	\N	\N	\N	t	4	NO_ENFRIABLE	\N	6	\N	\N	f	\N	/productos	\N	\N	\N	t	\N	\N
1140	\N	\N	MAR NUTRIVE VAINILHA TOUCH 125G	MAR NUTRIVE VAINILHA TOUCH 125G	10	\N	\N	\N	\N	\N	\N	\N	t	4	NO_ENFRIABLE	\N	6	\N	\N	f	\N	/productos	\N	\N	\N	t	\N	\N
1141	\N	\N	VGOD ESENCIA COCONUT 30ML	VGOD ESENCIA COCONUT 30ML	10	\N	\N	\N	\N	\N	\N	\N	t	4	NO_ENFRIABLE	\N	46	\N	\N	f	\N	/productos	\N	\N	\N	t	\N	\N
1142	\N	\N	VGOD ESENCIA JUNGLE 30ML	VGOD ESENCIA JUNGLE 30ML	10	\N	\N	\N	\N	\N	\N	\N	t	4	NO_ENFRIABLE	\N	46	\N	\N	f	\N	/productos	\N	\N	\N	t	\N	\N
1143	\N	\N	VGOD ESENCIA LUSCIOUS 30ML	VGOD ESENCIA LUSCIOUS 30ML	10	\N	\N	\N	\N	\N	\N	\N	t	4	NO_ENFRIABLE	\N	46	\N	\N	f	\N	/productos	\N	\N	\N	t	\N	\N
1144	\N	\N	CLIPPER ENCENDEDOR 	CLIPPER ENCENDEDOR 	10	\N	\N	\N	\N	\N	\N	\N	t	4	NO_ENFRIABLE	\N	32	\N	\N	f	\N	/productos	\N	\N	\N	t	\N	\N
1145	\N	\N	OFF FAMILY AEROSOL REPELENTE DE INSECTOS 127G	OFF FAMILY AEROSOL REPELENTE DE INSECTOS 127G	10	\N	\N	\N	\N	\N	\N	\N	t	4	NO_ENFRIABLE	\N	10	\N	\N	f	\N	/productos	\N	\N	\N	t	\N	\N
1146	\N	\N	DOVE ANTITRANSPIRANTE EXTRA FRESH MEN 89 GR	DOVE ANTITRANSPIRANTE EXTRA FRESH MEN 89 GR	10	\N	\N	\N	\N	\N	\N	t	t	4	NO_ENFRIABLE	\N	6	\N	\N	f	\N	/productos	\N	30	\N	t	\N	\N
1147	\N	\N	KOLYNOS 180G	KOLYNOS 180G	10	\N	\N	\N	\N	\N	\N	t	t	4	NO_ENFRIABLE	\N	6	\N	\N	f	\N	/productos	\N	30	\N	t	\N	\N
1148	\N	\N	COLGATE CREMA DENTAL CALCIO Y MENTA 90G	COLGATE CREMA DENTAL CALCIO Y MENTA 90G	10	\N	\N	\N	\N	\N	\N	t	t	4	NO_ENFRIABLE	\N	6	\N	\N	f	\N	/productos	\N	30	\N	t	\N	\N
1149	\N	\N	NOVO PAPEL ALUMINIO 7,5M	NOVO PAPEL ALUMINIO 7,5M	10	\N	\N	\N	\N	\N	\N	\N	t	4	NO_ENFRIABLE	\N	28	\N	\N	f	\N	/productos	\N	\N	\N	t	\N	\N
1150	\N	\N	BAUDUCCO COOKIES CHOCOLATE X 100 GR 	BAUDUCCO COOKIES CHOCOLATE X 100 GR 	10	\N	\N	\N	\N	\N	\N	t	t	4	NO_ENFRIABLE	\N	18	\N	\N	f	\N	/productos	\N	30	\N	t	\N	\N
1151	\N	\N	BAUDUCCO MAXI COOKIES 96G	BAUDUCCO MAXI COOKIES 96G	10	\N	\N	\N	\N	\N	\N	t	t	4	NO_ENFRIABLE	\N	18	\N	\N	f	\N	/productos	\N	30	\N	t	\N	\N
1152	\N	\N	COSTILLA VACUNA DE 1RA	COSTILLA VACUNA DE 1RA	10	\N	t	\N	\N	\N	\N	\N	t	1	\N	\N	8	\N	\N	f	\N	/productos	\N	\N	\N	t	\N	\N
1153	\N	\N	LOMBO SUINO DEFUNO	LOMBO SUINO DEFUNO	10	\N	t	\N	\N	\N	\N	\N	t	1	\N	\N	8	\N	\N	f	\N	/productos	\N	\N	\N	t	\N	\N
\.


--
-- Name: producto_id_seq; Type: SEQUENCE SET; Schema: productos; Owner: franco
--

SELECT pg_catalog.setval('productos.producto_id_seq', 1, false);


--
-- Data for Name: producto_imagen; Type: TABLE DATA; Schema: productos; Owner: franco
--

COPY productos.producto_imagen (id, producto_id, ruta, principal, usuario_id, creado_en) FROM stdin;
\.


--
-- Data for Name: producto_por_sucursal; Type: TABLE DATA; Schema: productos; Owner: franco
--

COPY productos.producto_por_sucursal (id, producto_id, sucursal_id, cant_minima, cant_media, cant_maxima, usuario_id, creado_en) FROM stdin;
\.


--
-- Data for Name: producto_proveedor; Type: TABLE DATA; Schema: productos; Owner: franco
--

COPY productos.producto_proveedor (id, producto_id, proveedor_id, pedido_id, usuario_id, creado_en) FROM stdin;
\.


--
-- Name: producto_proveedor_id_seq; Type: SEQUENCE SET; Schema: productos; Owner: franco
--

SELECT pg_catalog.setval('productos.producto_proveedor_id_seq', 1, false);


--
-- Name: productos_por_sucursal_id_seq; Type: SEQUENCE SET; Schema: productos; Owner: franco
--

SELECT pg_catalog.setval('productos.productos_por_sucursal_id_seq', 1, false);


--
-- Data for Name: subfamilia; Type: TABLE DATA; Schema: productos; Owner: franco
--

COPY productos.subfamilia (id, familia_id, descripcion, activo, usuario_id, creado_en, sub_familia_id, icono, nombre, posicion, id_central) FROM stdin;
1	1		t	1	2021-03-10 00:48:55+00	\N	sports_bar	CERVEZAS	1	\N
2	1		t	1	2021-03-10 00:54:39+00	\N	local_drink	GASEOSAS	2	\N
3	\N		t	1	2021-07-27 23:36:24+00	1		CON ALCOHOL	3	\N
4	\N		t	1	2021-07-27 23:36:57+00	1		SIN ALCOHOL	4	\N
5	1	AGUAS MINERALES, CON GAS, SIN GAS, TONICAS, AGUAS SABORIZADAS	t	\N	2021-12-28 18:23:46.046486+00	\N	local_drink	AGUAS	6	\N
6	2	JABON, DETERGENTE, PAPEL HIGIENICO, SHAMPOO, ETC	t	\N	2021-12-28 18:23:46.046486+00	\N	block	PRODUCTOS DE BAÃ‘O Y COCINA	7	\N
7	5		t	\N	2021-12-28 18:23:46.046486+00	\N	block	PANIFICADOS	8	\N
8	5		t	\N	2021-12-28 18:23:46.046486+00	\N	block	CARNICOS	9	\N
9	5	CHORIZOS, JAMON, PATE	t	\N	2021-12-28 18:23:46.046486+00	\N	block	EMBUTIDOS	10	\N
10	2	PASTILLAS, JARABES	t	\N	2021-12-28 18:23:46.046486+00	\N	block	MEDICAMENTOS	11	\N
11	7		t	\N	2021-12-28 18:23:46.046486+00	\N	block	TRADICIONALES	12	\N
14	2		t	\N	2021-12-28 18:23:46.046486+00	\N	block	ACCESORIOS	13	\N
15	1		t	\N	2021-12-28 18:23:46.046486+00	\N	block	VINOS	14	\N
16	1		t	\N	2021-12-28 18:23:46.046486+00	\N	block	ESPUMANTES	15	\N
17	1		t	\N	2021-12-28 18:23:46.046486+00	\N	block	WHISKYS	16	\N
18	5		t	\N	2021-12-28 18:23:46.046486+00	\N	block	SNACKS Y GALLETITAS	17	\N
19	5		t	\N	2021-12-28 18:23:46.046486+00	\N	block	ENLATADOS	18	\N
21	5		t	\N	2021-12-28 18:23:46.046486+00	\N	block	ENVASADOS	18	\N
22	1	NATURALES  Y EXTRACTOS	t	3	2021-12-28 18:23:46.046486+00	\N	arrow_drop_up	JUGOS	20	\N
23	1	ENERGETICOS	t	4	2021-12-28 18:23:46.046486+00	\N	block	ENERGIZANTES	21	\N
24	5	TODA CLASE DE CHOCOLATE	t	4	2021-12-28 18:23:46.046486+00	\N	block	CHOCOLATES	22	\N
25	5	TODA CLASE DE GOLOSINA	t	4	2021-12-28 18:23:46.046486+00	\N	block	CANDY´S / GOLOSINAS 	22	\N
26	10	TODA CLASE DE YERBA	t	4	2021-12-28 18:23:46.046486+00	\N	filter_vintage	YERBAS	24	\N
27	1	LICOR / VODKA / GIN	t	4	2021-12-28 18:23:46.046486+00	\N	local_bar	DESTILADOS 	25	\N
28	2	VASOS / CUCHILLAS / COLEMANNS / PARRILLAS / 	t	4	2021-12-28 18:23:46.046486+00	\N	block	UTENCILIOS 	26	\N
29	2	VASOS / CUCHILLAS / COLEMANNS / PARRILLAS / 	t	4	2021-12-28 18:23:46.046486+00	\N	block	UTENCILIOS 	26	\N
30	2	PRESERVATIVOS - LUBRICANTES - MIEL 	t	3	2021-12-28 18:23:46.046486+00	\N	hotel	AFRODICIACOS	28	\N
31	10	SAL GRUEZA, SAL FINA, CONDIMENTOS VARIOS, 	t	4	2021-12-28 18:23:46.046486+00	\N	restaurant	CONDIMENTOS	29	\N
32	7	ENCENDEDORES , DECHAVADOR	t	4	2021-12-28 18:23:46.046486+00	\N	block	ENCENDEDORES	29	\N
33	5	FIDEOS, FIDEOS INSTANTANEOS, ARROZ	t	4	\N	\N	block	PASTAS / SEMILLAS	31	\N
34	5	PURINAS Y OTROS	t	4	\N	\N	block	PETS	32	\N
35	10		t	4	\N	\N	block	HIELO	33	\N
36	2	\N	t	4	\N	\N	block	CARBON	33	\N
37	7	\N	t	4	\N	\N	block	CARBON P/ NARGUILE	33	\N
38	1	\N	t	4	\N	\N	block	YOGURTH	36	\N
39	1	\N	t	4	\N	\N	block	LECHES	36	\N
40	7	CHARUTOS Y TABACOS	t	4	\N	\N	block	TABACO	38	\N
41	10	\N	t	4	\N	\N	block	CAFE	39	\N
42	2	TODO LO RELACIONADO A CARTAS	t	4	\N	\N	block	CARTAS	39	\N
43	10	MEDICAMENTOS VARIOS	t	4	\N	\N	block	MEDICAMENTOS 	41	\N
45	7	SEDA, LEDA, PAPEL ALUMINIO P/ ARGUILE	t	4	\N	\N	block	PAPEL SEDA	43	\N
46	7	ESENCIAS	t	4	\N	\N	block	VAPE/PODS	43	\N
\.


--
-- Name: subfamilia_id_seq; Type: SEQUENCE SET; Schema: productos; Owner: franco
--

SELECT pg_catalog.setval('productos.subfamilia_id_seq', 1, false);


--
-- Data for Name: tipo_precio; Type: TABLE DATA; Schema: productos; Owner: franco
--

COPY productos.tipo_precio (id, descripcion, autorizacion, usuario_id, creado_en, activo, id_central) FROM stdin;
5	EXPO	\N	\N	2022-04-03 18:28:54.070435+00	t	\N
1	UNITARIO	\N	1	2021-05-20 15:29:22+00	f	\N
2	FRIO	\N	1	2021-05-20 15:29:22+00	f	\N
3	NATURAL	\N	1	2021-05-20 15:29:22+00	f	\N
4	FUNCIONARIOS	t	1	2021-05-20 15:29:22+00	f	\N
\.


--
-- Name: tipo_precio_id_seq; Type: SEQUENCE SET; Schema: productos; Owner: franco
--

SELECT pg_catalog.setval('productos.tipo_precio_id_seq', 5, true);


--
-- Data for Name: tipo_presentacion; Type: TABLE DATA; Schema: productos; Owner: franco
--

COPY productos.tipo_presentacion (id, descripcion, unico, usuario_id, creado_en, id_central) FROM stdin;
2	CAJA	f	1	2021-09-28 21:59:22+00	\N
3	CAJA SECUNDARIA	f	1	2021-09-28 21:59:39+00	\N
4	PACK	f	\N	2021-10-06 13:08:52+00	\N
1	UNIDAD	f	1	2021-09-28 21:59:02+00	\N
5	GRAMO	f	1	2021-10-06 13:08:52+00	\N
6	KILO	f	1	2021-10-06 13:08:52+00	\N
7	LITRO	f	1	2021-10-06 13:08:52+00	\N
\.


--
-- Name: tipo_presentacion_id_seq; Type: SEQUENCE SET; Schema: productos; Owner: franco
--

SELECT pg_catalog.setval('productos.tipo_presentacion_id_seq', 1, true);


--
-- Data for Name: databasechangelog; Type: TABLE DATA; Schema: public; Owner: franco
--

COPY public.databasechangelog (id, author, filename, dateexecuted, orderexecuted, exectype, md5sum, description, comments, tag, liquibase, contexts, labels, deployment_id) FROM stdin;
1	gabriel	example-changelog.sql	2022-06-28 16:52:24.268372	1	EXECUTED	8:1780b10dac483d498f16e072a9411ddc	sql		\N	4.12.0	\N	\N	6449544143
\.


--
-- Data for Name: databasechangeloglock; Type: TABLE DATA; Schema: public; Owner: franco
--

COPY public.databasechangeloglock (id, locked, lockgranted, lockedby) FROM stdin;
1	f	\N	\N
\.


--
-- Data for Name: producto_proveedor; Type: TABLE DATA; Schema: public; Owner: franco
--

COPY public.producto_proveedor (id, producto_id, proveedor_id, pedido_id, usuario_id, creado_en) FROM stdin;
\.


--
-- Name: producto_proveedor_id_seq; Type: SEQUENCE SET; Schema: public; Owner: franco
--

SELECT pg_catalog.setval('public.producto_proveedor_id_seq', 1, false);


--
-- Data for Name: test; Type: TABLE DATA; Schema: public; Owner: franco
--

COPY public.test (id, name) FROM stdin;
\.


--
-- Name: test_id_seq; Type: SEQUENCE SET; Schema: public; Owner: franco
--

SELECT pg_catalog.setval('public.test_id_seq', 1, false);


--
-- Data for Name: marca; Type: TABLE DATA; Schema: vehiculos; Owner: franco
--

COPY vehiculos.marca (id, descripcion, usuario_id, creado_en) FROM stdin;
\.


--
-- Name: marca_id_seq; Type: SEQUENCE SET; Schema: vehiculos; Owner: franco
--

SELECT pg_catalog.setval('vehiculos.marca_id_seq', 1, false);


--
-- Data for Name: modelo; Type: TABLE DATA; Schema: vehiculos; Owner: franco
--

COPY vehiculos.modelo (id, descripcion, marca_id, usuario_id, creado_en) FROM stdin;
\.


--
-- Name: modelo_id_seq; Type: SEQUENCE SET; Schema: vehiculos; Owner: franco
--

SELECT pg_catalog.setval('vehiculos.modelo_id_seq', 1, false);


--
-- Data for Name: tipo_vehiculo; Type: TABLE DATA; Schema: vehiculos; Owner: franco
--

COPY vehiculos.tipo_vehiculo (id, descripcion, usuario_id, creado_en) FROM stdin;
\.


--
-- Name: tipo_vehiculo_id_seq; Type: SEQUENCE SET; Schema: vehiculos; Owner: franco
--

SELECT pg_catalog.setval('vehiculos.tipo_vehiculo_id_seq', 1, false);


--
-- Data for Name: vehiculo; Type: TABLE DATA; Schema: vehiculos; Owner: franco
--

COPY vehiculos.vehiculo (id, color, chapa, documentacion, refrigerado, nuevo, fecha_adquisicion, primer_kilometraje, tipo_vehiculo, imagenes_documentos, imagenes_vehiculo, usuario_id, creado_en, anho, capacidad_kg, capacidad_pasajeros, modelo_id) FROM stdin;
\.


--
-- Name: vehiculo_id_seq; Type: SEQUENCE SET; Schema: vehiculos; Owner: franco
--

SELECT pg_catalog.setval('vehiculos.vehiculo_id_seq', 1, false);


--
-- Data for Name: vehiculo_sucursal; Type: TABLE DATA; Schema: vehiculos; Owner: franco
--

COPY vehiculos.vehiculo_sucursal (id, sucursal_id, vehiculo_id, responsable_id, usuario_id, creado_en) FROM stdin;
\.


--
-- Name: vehiculo_sucursal_id_seq; Type: SEQUENCE SET; Schema: vehiculos; Owner: franco
--

SELECT pg_catalog.setval('vehiculos.vehiculo_sucursal_id_seq', 1, false);


--
-- Name: autorizacion_pkey; Type: CONSTRAINT; Schema: administrativo; Owner: franco
--

ALTER TABLE ONLY administrativo.autorizacion
    ADD CONSTRAINT autorizacion_pkey PRIMARY KEY (id);


--
-- Name: marcacion_pkey; Type: CONSTRAINT; Schema: administrativo; Owner: franco
--

ALTER TABLE ONLY administrativo.marcacion
    ADD CONSTRAINT marcacion_pkey PRIMARY KEY (id);


--
-- Name: inicio_sesion_pkey; Type: CONSTRAINT; Schema: configuraciones; Owner: franco
--

ALTER TABLE ONLY configuraciones.inicio_sesion
    ADD CONSTRAINT inicio_sesion_pkey PRIMARY KEY (id);


--
-- Name: local_pkey; Type: CONSTRAINT; Schema: configuraciones; Owner: franco
--

ALTER TABLE ONLY configuraciones.local
    ADD CONSTRAINT local_pkey PRIMARY KEY (id);


--
-- Name: local_un; Type: CONSTRAINT; Schema: configuraciones; Owner: franco
--

ALTER TABLE ONLY configuraciones.local
    ADD CONSTRAINT local_un UNIQUE (sucursal_id);


--
-- Name: cargo_pkey; Type: CONSTRAINT; Schema: empresarial; Owner: franco
--

ALTER TABLE ONLY empresarial.cargo
    ADD CONSTRAINT cargo_pkey PRIMARY KEY (id);


--
-- Name: cargo_un_id_central; Type: CONSTRAINT; Schema: empresarial; Owner: franco
--

ALTER TABLE ONLY empresarial.cargo
    ADD CONSTRAINT cargo_un_id_central UNIQUE (id_central);


--
-- Name: sector_pkey; Type: CONSTRAINT; Schema: empresarial; Owner: franco
--

ALTER TABLE ONLY empresarial.sector
    ADD CONSTRAINT sector_pkey PRIMARY KEY (id);


--
-- Name: sucursal_pkey; Type: CONSTRAINT; Schema: empresarial; Owner: franco
--

ALTER TABLE ONLY empresarial.sucursal
    ADD CONSTRAINT sucursal_pkey PRIMARY KEY (id);


--
-- Name: zona_pkey; Type: CONSTRAINT; Schema: empresarial; Owner: franco
--

ALTER TABLE ONLY empresarial.zona
    ADD CONSTRAINT zona_pkey PRIMARY KEY (id);


--
-- Name: equipo_pkey; Type: CONSTRAINT; Schema: equipos; Owner: franco
--

ALTER TABLE ONLY equipos.equipo
    ADD CONSTRAINT equipo_pkey PRIMARY KEY (id);


--
-- Name: tipo_equipo_pkey; Type: CONSTRAINT; Schema: equipos; Owner: franco
--

ALTER TABLE ONLY equipos.tipo_equipo
    ADD CONSTRAINT tipo_equipo_pkey PRIMARY KEY (id);


--
-- Name: banco_pkey; Type: CONSTRAINT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.banco
    ADD CONSTRAINT banco_pkey PRIMARY KEY (id);


--
-- Name: cambio_pkey; Type: CONSTRAINT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.cambio
    ADD CONSTRAINT cambio_pkey PRIMARY KEY (id);


--
-- Name: cambio_un_id_central; Type: CONSTRAINT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.cambio
    ADD CONSTRAINT cambio_un_id_central UNIQUE (id_central);


--
-- Name: conteo_moneda_pkey; Type: CONSTRAINT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.conteo_moneda
    ADD CONSTRAINT conteo_moneda_pkey PRIMARY KEY (id);


--
-- Name: conteo_pkey; Type: CONSTRAINT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.conteo
    ADD CONSTRAINT conteo_pkey PRIMARY KEY (id);


--
-- Name: cuenta_bancaria_pkey; Type: CONSTRAINT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.cuenta_bancaria
    ADD CONSTRAINT cuenta_bancaria_pkey PRIMARY KEY (id);


--
-- Name: cuenta_bancaria_un_id_central; Type: CONSTRAINT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.cuenta_bancaria
    ADD CONSTRAINT cuenta_bancaria_un_id_central UNIQUE (id_central);


--
-- Name: documento_pkey; Type: CONSTRAINT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.documento
    ADD CONSTRAINT documento_pkey PRIMARY KEY (id);


--
-- Name: documento_un; Type: CONSTRAINT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.documento
    ADD CONSTRAINT documento_un UNIQUE (descripcion);


--
-- Name: forma_pago_bancaria_un_id_central; Type: CONSTRAINT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.forma_pago
    ADD CONSTRAINT forma_pago_bancaria_un_id_central UNIQUE (id_central);


--
-- Name: forma_pago_pkey; Type: CONSTRAINT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.forma_pago
    ADD CONSTRAINT forma_pago_pkey PRIMARY KEY (id);


--
-- Name: gasto_detalle_pkey; Type: CONSTRAINT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.gasto_detalle
    ADD CONSTRAINT gasto_detalle_pkey PRIMARY KEY (id);


--
-- Name: gasto_pkey; Type: CONSTRAINT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.gasto
    ADD CONSTRAINT gasto_pkey PRIMARY KEY (id);


--
-- Name: maletin_pkey; Type: CONSTRAINT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.maletin
    ADD CONSTRAINT maletin_pkey PRIMARY KEY (id);


--
-- Name: maletin_un_descripcion; Type: CONSTRAINT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.maletin
    ADD CONSTRAINT maletin_un_descripcion UNIQUE (descripcion);


--
-- Name: moneda_billetes_pkey; Type: CONSTRAINT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.moneda_billetes
    ADD CONSTRAINT moneda_billetes_pkey PRIMARY KEY (id);


--
-- Name: moneda_billetes_un_id_central; Type: CONSTRAINT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.moneda_billetes
    ADD CONSTRAINT moneda_billetes_un_id_central UNIQUE (id_central);


--
-- Name: moneda_pkey; Type: CONSTRAINT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.moneda
    ADD CONSTRAINT moneda_pkey PRIMARY KEY (id);


--
-- Name: moneda_un_id_central; Type: CONSTRAINT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.moneda
    ADD CONSTRAINT moneda_un_id_central UNIQUE (id_central);


--
-- Name: mov_cambio_pkey; Type: CONSTRAINT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.cambio_caja
    ADD CONSTRAINT mov_cambio_pkey PRIMARY KEY (id);


--
-- Name: movimiento_caja_pkey; Type: CONSTRAINT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.movimiento_caja
    ADD CONSTRAINT movimiento_caja_pkey PRIMARY KEY (id);


--
-- Name: pdv_caja_pkey; Type: CONSTRAINT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.pdv_caja
    ADD CONSTRAINT pdv_caja_pkey PRIMARY KEY (id);


--
-- Name: retiro_detalle_pkey; Type: CONSTRAINT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.retiro_detalle
    ADD CONSTRAINT retiro_detalle_pkey PRIMARY KEY (id);


--
-- Name: retiro_pkey; Type: CONSTRAINT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.retiro
    ADD CONSTRAINT retiro_pkey PRIMARY KEY (id);


--
-- Name: sencillo_detalle_pkey; Type: CONSTRAINT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.sencillo_detalle
    ADD CONSTRAINT sencillo_detalle_pkey PRIMARY KEY (id);


--
-- Name: sencillo_pkey; Type: CONSTRAINT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.sencillo
    ADD CONSTRAINT sencillo_pkey PRIMARY KEY (id);


--
-- Name: tipo_gasto_pkey; Type: CONSTRAINT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.tipo_gasto
    ADD CONSTRAINT tipo_gasto_pkey PRIMARY KEY (id);


--
-- Name: tipo_gasto_un_id_central; Type: CONSTRAINT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.tipo_gasto
    ADD CONSTRAINT tipo_gasto_un_id_central UNIQUE (id_central);


--
-- Name: barrio_pkey; Type: CONSTRAINT; Schema: general; Owner: franco
--

ALTER TABLE ONLY general.barrio
    ADD CONSTRAINT barrio_pkey PRIMARY KEY (id);


--
-- Name: barrio_un_id_central; Type: CONSTRAINT; Schema: general; Owner: franco
--

ALTER TABLE ONLY general.barrio
    ADD CONSTRAINT barrio_un_id_central UNIQUE (id_central);


--
-- Name: ciudad_pkey; Type: CONSTRAINT; Schema: general; Owner: franco
--

ALTER TABLE ONLY general.ciudad
    ADD CONSTRAINT ciudad_pkey PRIMARY KEY (id);


--
-- Name: contacto_pkey; Type: CONSTRAINT; Schema: general; Owner: franco
--

ALTER TABLE ONLY general.contacto
    ADD CONSTRAINT contacto_pkey PRIMARY KEY (id);


--
-- Name: pais_pkey; Type: CONSTRAINT; Schema: general; Owner: franco
--

ALTER TABLE ONLY general.pais
    ADD CONSTRAINT pais_pkey PRIMARY KEY (id);


--
-- Name: cobro_detalle_pkey; Type: CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.cobro_detalle
    ADD CONSTRAINT cobro_detalle_pkey PRIMARY KEY (id);


--
-- Name: cobro_pkey; Type: CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.cobro
    ADD CONSTRAINT cobro_pkey PRIMARY KEY (id);


--
-- Name: compra_item_pkey; Type: CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.compra_item
    ADD CONSTRAINT compra_item_pkey PRIMARY KEY (id);


--
-- Name: compra_pkey; Type: CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.compra
    ADD CONSTRAINT compra_pkey PRIMARY KEY (id);


--
-- Name: delivery_pkey; Type: CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.delivery
    ADD CONSTRAINT delivery_pkey PRIMARY KEY (id);


--
-- Name: entrada_item_pkey; Type: CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.entrada_item
    ADD CONSTRAINT entrada_item_pkey PRIMARY KEY (id);


--
-- Name: entrada_pkey; Type: CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.entrada
    ADD CONSTRAINT entrada_pkey PRIMARY KEY (id);


--
-- Name: inventario_pkey; Type: CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.inventario
    ADD CONSTRAINT inventario_pkey PRIMARY KEY (id);


--
-- Name: inventario_producto_item_pkey; Type: CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.inventario_producto_item
    ADD CONSTRAINT inventario_producto_item_pkey PRIMARY KEY (id);


--
-- Name: inventario_producto_pkey; Type: CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.inventario_producto
    ADD CONSTRAINT inventario_producto_pkey PRIMARY KEY (id);


--
-- Name: inventario_producto_un; Type: CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.inventario_producto
    ADD CONSTRAINT inventario_producto_un UNIQUE (inventario_id, zona_id);


--
-- Name: motivo_diferencia_pedido_pkey; Type: CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.motivo_diferencia_pedido
    ADD CONSTRAINT motivo_diferencia_pedido_pkey PRIMARY KEY (id);


--
-- Name: movimientos_stock_pkey; Type: CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.movimiento_stock
    ADD CONSTRAINT movimientos_stock_pkey PRIMARY KEY (id);


--
-- Name: necesidad_item_pkey; Type: CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.necesidad_item
    ADD CONSTRAINT necesidad_item_pkey PRIMARY KEY (id);


--
-- Name: necesidad_pkey; Type: CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.necesidad
    ADD CONSTRAINT necesidad_pkey PRIMARY KEY (id);


--
-- Name: nota_pedido_pkey; Type: CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.nota_pedido
    ADD CONSTRAINT nota_pedido_pkey PRIMARY KEY (id);


--
-- Name: nota_recepcion_item_pkey; Type: CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.nota_recepcion_item
    ADD CONSTRAINT nota_recepcion_item_pkey PRIMARY KEY (id);


--
-- Name: nota_recepcion_pkey; Type: CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.nota_recepcion
    ADD CONSTRAINT nota_recepcion_pkey PRIMARY KEY (id);


--
-- Name: pedido_item_pkey; Type: CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.pedido_item
    ADD CONSTRAINT pedido_item_pkey PRIMARY KEY (id);


--
-- Name: pedido_item_sucursal_pkey; Type: CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.pedido_item_sucursal
    ADD CONSTRAINT pedido_item_sucursal_pkey PRIMARY KEY (id);


--
-- Name: pedido_pkey; Type: CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.pedido
    ADD CONSTRAINT pedido_pkey PRIMARY KEY (id);


--
-- Name: precio_delivery_pkey; Type: CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.precio_delivery
    ADD CONSTRAINT precio_delivery_pkey PRIMARY KEY (id);


--
-- Name: programar_precio_pkey; Type: CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.programar_precio
    ADD CONSTRAINT programar_precio_pkey PRIMARY KEY (id);


--
-- Name: salida_item_pkey; Type: CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.salida_item
    ADD CONSTRAINT salida_item_pkey PRIMARY KEY (id);


--
-- Name: salida_pkey; Type: CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.salida
    ADD CONSTRAINT salida_pkey PRIMARY KEY (id);


--
-- Name: transferencia_item_pkey; Type: CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.transferencia_item
    ADD CONSTRAINT transferencia_item_pkey PRIMARY KEY (id);


--
-- Name: transferencia_pkey; Type: CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.transferencia
    ADD CONSTRAINT transferencia_pkey PRIMARY KEY (id);


--
-- Name: venta_item_pkey; Type: CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.venta_item
    ADD CONSTRAINT venta_item_pkey PRIMARY KEY (id);


--
-- Name: venta_pkey; Type: CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.venta
    ADD CONSTRAINT venta_pkey PRIMARY KEY (id);


--
-- Name: vuelto_item_pkey; Type: CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.vuelto_item
    ADD CONSTRAINT vuelto_item_pkey PRIMARY KEY (id);


--
-- Name: vuelto_pkey; Type: CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.vuelto
    ADD CONSTRAINT vuelto_pkey PRIMARY KEY (id);


--
-- Name: cliente_pkey; Type: CONSTRAINT; Schema: personas; Owner: franco
--

ALTER TABLE ONLY personas.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (id);


--
-- Name: cliente_un_id_central; Type: CONSTRAINT; Schema: personas; Owner: franco
--

ALTER TABLE ONLY personas.cliente
    ADD CONSTRAINT cliente_un_id_central UNIQUE (id_central);


--
-- Name: funcionario_pkey; Type: CONSTRAINT; Schema: personas; Owner: franco
--

ALTER TABLE ONLY personas.funcionario
    ADD CONSTRAINT funcionario_pkey PRIMARY KEY (id);


--
-- Name: funcionario_un_id_central; Type: CONSTRAINT; Schema: personas; Owner: franco
--

ALTER TABLE ONLY personas.funcionario
    ADD CONSTRAINT funcionario_un_id_central UNIQUE (id_central);


--
-- Name: funcionario_un_persona; Type: CONSTRAINT; Schema: personas; Owner: franco
--

ALTER TABLE ONLY personas.funcionario
    ADD CONSTRAINT funcionario_un_persona UNIQUE (persona_id);


--
-- Name: grupo_privilegio_pkey; Type: CONSTRAINT; Schema: personas; Owner: franco
--

ALTER TABLE ONLY personas.grupo_privilegio
    ADD CONSTRAINT grupo_privilegio_pkey PRIMARY KEY (id);


--
-- Name: persona_pkey; Type: CONSTRAINT; Schema: personas; Owner: franco
--

ALTER TABLE ONLY personas.persona
    ADD CONSTRAINT persona_pkey PRIMARY KEY (id);


--
-- Name: persona_un_id_central; Type: CONSTRAINT; Schema: personas; Owner: franco
--

ALTER TABLE ONLY personas.persona
    ADD CONSTRAINT persona_un_id_central UNIQUE (id_central);


--
-- Name: proveedor_dias_visita_pkey; Type: CONSTRAINT; Schema: personas; Owner: franco
--

ALTER TABLE ONLY personas.proveedor_dias_visita
    ADD CONSTRAINT proveedor_dias_visita_pkey PRIMARY KEY (id);


--
-- Name: proveedor_pkey; Type: CONSTRAINT; Schema: personas; Owner: franco
--

ALTER TABLE ONLY personas.proveedor
    ADD CONSTRAINT proveedor_pkey PRIMARY KEY (id);


--
-- Name: role_pkey; Type: CONSTRAINT; Schema: personas; Owner: franco
--

ALTER TABLE ONLY personas.role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- Name: usuario_grupo_pkey; Type: CONSTRAINT; Schema: personas; Owner: franco
--

ALTER TABLE ONLY personas.usuario_grupo
    ADD CONSTRAINT usuario_grupo_pkey PRIMARY KEY (id);


--
-- Name: usuario_pkey; Type: CONSTRAINT; Schema: personas; Owner: franco
--

ALTER TABLE ONLY personas.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (id);


--
-- Name: usuario_role_pkey; Type: CONSTRAINT; Schema: personas; Owner: franco
--

ALTER TABLE ONLY personas.usuario_role
    ADD CONSTRAINT usuario_role_pkey PRIMARY KEY (id);


--
-- Name: usuario_role_un_id_central; Type: CONSTRAINT; Schema: personas; Owner: franco
--

ALTER TABLE ONLY personas.usuario_role
    ADD CONSTRAINT usuario_role_un_id_central UNIQUE (id_central);


--
-- Name: usuario_un_nickname; Type: CONSTRAINT; Schema: personas; Owner: franco
--

ALTER TABLE ONLY personas.usuario
    ADD CONSTRAINT usuario_un_nickname UNIQUE (nickname);


--
-- Name: usuario_un_persona; Type: CONSTRAINT; Schema: personas; Owner: franco
--

ALTER TABLE ONLY personas.usuario
    ADD CONSTRAINT usuario_un_persona UNIQUE (persona_id);


--
-- Name: vendedor_pkey; Type: CONSTRAINT; Schema: personas; Owner: franco
--

ALTER TABLE ONLY personas.vendedor
    ADD CONSTRAINT vendedor_pkey PRIMARY KEY (id);


--
-- Name: vendedor_proveedor_pkey; Type: CONSTRAINT; Schema: personas; Owner: franco
--

ALTER TABLE ONLY personas.vendedor_proveedor
    ADD CONSTRAINT vendedor_proveedor_pkey PRIMARY KEY (id);


--
-- Name: vendedor_proveedor_un_id_central; Type: CONSTRAINT; Schema: personas; Owner: franco
--

ALTER TABLE ONLY personas.vendedor_proveedor
    ADD CONSTRAINT vendedor_proveedor_un_id_central UNIQUE (id_central);


--
-- Name: vendedor_un_id_central; Type: CONSTRAINT; Schema: personas; Owner: franco
--

ALTER TABLE ONLY personas.vendedor
    ADD CONSTRAINT vendedor_un_id_central UNIQUE (id_central);


--
-- Name: codigo_pkey; Type: CONSTRAINT; Schema: productos; Owner: franco
--

ALTER TABLE ONLY productos.codigo
    ADD CONSTRAINT codigo_pkey PRIMARY KEY (id);


--
-- Name: codigo_tipo_precio_pkey; Type: CONSTRAINT; Schema: productos; Owner: franco
--

ALTER TABLE ONLY productos.codigo_tipo_precio
    ADD CONSTRAINT codigo_tipo_precio_pkey PRIMARY KEY (id);


--
-- Name: codigo_tipo_precio_un_id_central; Type: CONSTRAINT; Schema: productos; Owner: franco
--

ALTER TABLE ONLY productos.codigo_tipo_precio
    ADD CONSTRAINT codigo_tipo_precio_un_id_central UNIQUE (id_central);


--
-- Name: codigo_un; Type: CONSTRAINT; Schema: productos; Owner: franco
--

ALTER TABLE ONLY productos.codigo
    ADD CONSTRAINT codigo_un UNIQUE (codigo);


--
-- Name: codigo_un_id_central; Type: CONSTRAINT; Schema: productos; Owner: franco
--

ALTER TABLE ONLY productos.codigo
    ADD CONSTRAINT codigo_un_id_central UNIQUE (id_central);


--
-- Name: codigo_un_presentacion_principal; Type: CONSTRAINT; Schema: productos; Owner: franco
--

ALTER TABLE ONLY productos.codigo
    ADD CONSTRAINT codigo_un_presentacion_principal UNIQUE (principal, presentacion_id);


--
-- Name: costo_por_producto_un_id_central; Type: CONSTRAINT; Schema: productos; Owner: franco
--

ALTER TABLE ONLY productos.costo_por_producto
    ADD CONSTRAINT costo_por_producto_un_id_central UNIQUE (id_central);


--
-- Name: costos_por_sucursal_pkey; Type: CONSTRAINT; Schema: productos; Owner: franco
--

ALTER TABLE ONLY productos.costo_por_producto
    ADD CONSTRAINT costos_por_sucursal_pkey PRIMARY KEY (id);


--
-- Name: familia_pkey; Type: CONSTRAINT; Schema: productos; Owner: franco
--

ALTER TABLE ONLY productos.familia
    ADD CONSTRAINT familia_pkey PRIMARY KEY (id);


--
-- Name: familia_un; Type: CONSTRAINT; Schema: productos; Owner: franco
--

ALTER TABLE ONLY productos.familia
    ADD CONSTRAINT familia_un UNIQUE (posicion);


--
-- Name: familia_un_id_central; Type: CONSTRAINT; Schema: productos; Owner: franco
--

ALTER TABLE ONLY productos.familia
    ADD CONSTRAINT familia_un_id_central UNIQUE (id_central);


--
-- Name: imagenes_pkey; Type: CONSTRAINT; Schema: productos; Owner: franco
--

ALTER TABLE ONLY productos.producto_imagen
    ADD CONSTRAINT imagenes_pkey PRIMARY KEY (id);


--
-- Name: pdv_categoria_pkey; Type: CONSTRAINT; Schema: productos; Owner: franco
--

ALTER TABLE ONLY productos.pdv_categoria
    ADD CONSTRAINT pdv_categoria_pkey PRIMARY KEY (id);


--
-- Name: pdv_categoria_un_id_central; Type: CONSTRAINT; Schema: productos; Owner: franco
--

ALTER TABLE ONLY productos.pdv_categoria
    ADD CONSTRAINT pdv_categoria_un_id_central UNIQUE (id_central);


--
-- Name: pdv_grupo_pkey; Type: CONSTRAINT; Schema: productos; Owner: franco
--

ALTER TABLE ONLY productos.pdv_grupo
    ADD CONSTRAINT pdv_grupo_pkey PRIMARY KEY (id);


--
-- Name: pdv_grupo_un_id_central; Type: CONSTRAINT; Schema: productos; Owner: franco
--

ALTER TABLE ONLY productos.pdv_grupo
    ADD CONSTRAINT pdv_grupo_un_id_central UNIQUE (id_central);


--
-- Name: pdv_grupos_productos_pkey; Type: CONSTRAINT; Schema: productos; Owner: franco
--

ALTER TABLE ONLY productos.pdv_grupos_productos
    ADD CONSTRAINT pdv_grupos_productos_pkey PRIMARY KEY (id);


--
-- Name: pdv_grupos_productos_un_id_central; Type: CONSTRAINT; Schema: productos; Owner: franco
--

ALTER TABLE ONLY productos.pdv_grupos_productos
    ADD CONSTRAINT pdv_grupos_productos_un_id_central UNIQUE (id_central);


--
-- Name: precio_por_sucursal_pkey; Type: CONSTRAINT; Schema: productos; Owner: franco
--

ALTER TABLE ONLY productos.precio_por_sucursal
    ADD CONSTRAINT precio_por_sucursal_pkey PRIMARY KEY (id);


--
-- Name: precio_por_sucursal_un_id_central; Type: CONSTRAINT; Schema: productos; Owner: franco
--

ALTER TABLE ONLY productos.precio_por_sucursal
    ADD CONSTRAINT precio_por_sucursal_un_id_central UNIQUE (id_central);


--
-- Name: precio_por_sucursal_un_presentacion_tipo_precio; Type: CONSTRAINT; Schema: productos; Owner: franco
--

ALTER TABLE ONLY productos.precio_por_sucursal
    ADD CONSTRAINT precio_por_sucursal_un_presentacion_tipo_precio UNIQUE (presentacion_id, tipo_precio_id);


--
-- Name: presentacion_pkey; Type: CONSTRAINT; Schema: productos; Owner: franco
--

ALTER TABLE ONLY productos.presentacion
    ADD CONSTRAINT presentacion_pkey PRIMARY KEY (id);


--
-- Name: presentacion_un_id_central; Type: CONSTRAINT; Schema: productos; Owner: franco
--

ALTER TABLE ONLY productos.presentacion
    ADD CONSTRAINT presentacion_un_id_central UNIQUE (id_central);


--
-- Name: producto_pkey; Type: CONSTRAINT; Schema: productos; Owner: franco
--

ALTER TABLE ONLY productos.producto
    ADD CONSTRAINT producto_pkey PRIMARY KEY (id);


--
-- Name: producto_por_sucursal_pk; Type: CONSTRAINT; Schema: productos; Owner: franco
--

ALTER TABLE ONLY productos.producto_por_sucursal
    ADD CONSTRAINT producto_por_sucursal_pk PRIMARY KEY (id);


--
-- Name: producto_proveedor_pkey; Type: CONSTRAINT; Schema: productos; Owner: franco
--

ALTER TABLE ONLY productos.producto_proveedor
    ADD CONSTRAINT producto_proveedor_pkey PRIMARY KEY (id);


--
-- Name: producto_un_id_central; Type: CONSTRAINT; Schema: productos; Owner: franco
--

ALTER TABLE ONLY productos.producto
    ADD CONSTRAINT producto_un_id_central UNIQUE (id_central);


--
-- Name: producto_un_producto; Type: CONSTRAINT; Schema: productos; Owner: franco
--

ALTER TABLE ONLY productos.producto
    ADD CONSTRAINT producto_un_producto UNIQUE (descripcion);


--
-- Name: subfamilia_id_central; Type: CONSTRAINT; Schema: productos; Owner: franco
--

ALTER TABLE ONLY productos.subfamilia
    ADD CONSTRAINT subfamilia_id_central UNIQUE (id_central);


--
-- Name: subfamilia_pkey; Type: CONSTRAINT; Schema: productos; Owner: franco
--

ALTER TABLE ONLY productos.subfamilia
    ADD CONSTRAINT subfamilia_pkey PRIMARY KEY (id);


--
-- Name: tipo_precio_pkey; Type: CONSTRAINT; Schema: productos; Owner: franco
--

ALTER TABLE ONLY productos.tipo_precio
    ADD CONSTRAINT tipo_precio_pkey PRIMARY KEY (id);


--
-- Name: tipo_precio_un_id_central; Type: CONSTRAINT; Schema: productos; Owner: franco
--

ALTER TABLE ONLY productos.tipo_precio
    ADD CONSTRAINT tipo_precio_un_id_central UNIQUE (id_central);


--
-- Name: tipo_presentacion_pkey; Type: CONSTRAINT; Schema: productos; Owner: franco
--

ALTER TABLE ONLY productos.tipo_presentacion
    ADD CONSTRAINT tipo_presentacion_pkey PRIMARY KEY (id);


--
-- Name: tipo_presentacion_un_id_central; Type: CONSTRAINT; Schema: productos; Owner: franco
--

ALTER TABLE ONLY productos.tipo_presentacion
    ADD CONSTRAINT tipo_presentacion_un_id_central UNIQUE (id_central);


--
-- Name: databasechangeloglock_pkey; Type: CONSTRAINT; Schema: public; Owner: franco
--

ALTER TABLE ONLY public.databasechangeloglock
    ADD CONSTRAINT databasechangeloglock_pkey PRIMARY KEY (id);


--
-- Name: producto_proveedor_pkey; Type: CONSTRAINT; Schema: public; Owner: franco
--

ALTER TABLE ONLY public.producto_proveedor
    ADD CONSTRAINT producto_proveedor_pkey PRIMARY KEY (id);


--
-- Name: test_pkey; Type: CONSTRAINT; Schema: public; Owner: franco
--

ALTER TABLE ONLY public.test
    ADD CONSTRAINT test_pkey PRIMARY KEY (id);


--
-- Name: marca_pkey; Type: CONSTRAINT; Schema: vehiculos; Owner: franco
--

ALTER TABLE ONLY vehiculos.marca
    ADD CONSTRAINT marca_pkey PRIMARY KEY (id);


--
-- Name: modelo_pkey; Type: CONSTRAINT; Schema: vehiculos; Owner: franco
--

ALTER TABLE ONLY vehiculos.modelo
    ADD CONSTRAINT modelo_pkey PRIMARY KEY (id);


--
-- Name: tipo_vehiculo_pkey; Type: CONSTRAINT; Schema: vehiculos; Owner: franco
--

ALTER TABLE ONLY vehiculos.tipo_vehiculo
    ADD CONSTRAINT tipo_vehiculo_pkey PRIMARY KEY (id);


--
-- Name: vehiculo_pkey; Type: CONSTRAINT; Schema: vehiculos; Owner: franco
--

ALTER TABLE ONLY vehiculos.vehiculo
    ADD CONSTRAINT vehiculo_pkey PRIMARY KEY (id);


--
-- Name: vehiculo_sucursal_pkey; Type: CONSTRAINT; Schema: vehiculos; Owner: franco
--

ALTER TABLE ONLY vehiculos.vehiculo_sucursal
    ADD CONSTRAINT vehiculo_sucursal_pkey PRIMARY KEY (id);


--
-- Name: autorizacion_autorizador_id_fkey; Type: FK CONSTRAINT; Schema: administrativo; Owner: franco
--

ALTER TABLE ONLY administrativo.autorizacion
    ADD CONSTRAINT autorizacion_autorizador_id_fkey FOREIGN KEY (autorizador_id) REFERENCES personas.funcionario(id);


--
-- Name: autorizacion_autorizador_id_fkey1; Type: FK CONSTRAINT; Schema: administrativo; Owner: franco
--

ALTER TABLE ONLY administrativo.autorizacion
    ADD CONSTRAINT autorizacion_autorizador_id_fkey1 FOREIGN KEY (autorizador_id) REFERENCES personas.funcionario(id);


--
-- Name: autorizacion_autorizador_id_fkey2; Type: FK CONSTRAINT; Schema: administrativo; Owner: franco
--

ALTER TABLE ONLY administrativo.autorizacion
    ADD CONSTRAINT autorizacion_autorizador_id_fkey2 FOREIGN KEY (autorizador_id) REFERENCES personas.funcionario(id);


--
-- Name: autorizacion_funcionario_id_fkey; Type: FK CONSTRAINT; Schema: administrativo; Owner: franco
--

ALTER TABLE ONLY administrativo.autorizacion
    ADD CONSTRAINT autorizacion_funcionario_id_fkey FOREIGN KEY (funcionario_id) REFERENCES personas.funcionario(id);


--
-- Name: autorizacion_funcionario_id_fkey1; Type: FK CONSTRAINT; Schema: administrativo; Owner: franco
--

ALTER TABLE ONLY administrativo.autorizacion
    ADD CONSTRAINT autorizacion_funcionario_id_fkey1 FOREIGN KEY (funcionario_id) REFERENCES personas.funcionario(id);


--
-- Name: autorizacion_funcionario_id_fkey2; Type: FK CONSTRAINT; Schema: administrativo; Owner: franco
--

ALTER TABLE ONLY administrativo.autorizacion
    ADD CONSTRAINT autorizacion_funcionario_id_fkey2 FOREIGN KEY (funcionario_id) REFERENCES personas.funcionario(id);


--
-- Name: autorizacion_usuario_id_fkey; Type: FK CONSTRAINT; Schema: administrativo; Owner: franco
--

ALTER TABLE ONLY administrativo.autorizacion
    ADD CONSTRAINT autorizacion_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: autorizacion_usuario_id_fkey1; Type: FK CONSTRAINT; Schema: administrativo; Owner: franco
--

ALTER TABLE ONLY administrativo.autorizacion
    ADD CONSTRAINT autorizacion_usuario_id_fkey1 FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: autorizacion_usuario_id_fkey2; Type: FK CONSTRAINT; Schema: administrativo; Owner: franco
--

ALTER TABLE ONLY administrativo.autorizacion
    ADD CONSTRAINT autorizacion_usuario_id_fkey2 FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: marcacion_sucursal_id_fkey; Type: FK CONSTRAINT; Schema: administrativo; Owner: franco
--

ALTER TABLE ONLY administrativo.marcacion
    ADD CONSTRAINT marcacion_sucursal_id_fkey FOREIGN KEY (sucursal_id) REFERENCES empresarial.sucursal(id);


--
-- Name: marcacion_usuario_id_fkey; Type: FK CONSTRAINT; Schema: administrativo; Owner: franco
--

ALTER TABLE ONLY administrativo.marcacion
    ADD CONSTRAINT marcacion_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: marcacion_usuario_id_fkey1; Type: FK CONSTRAINT; Schema: administrativo; Owner: franco
--

ALTER TABLE ONLY administrativo.marcacion
    ADD CONSTRAINT marcacion_usuario_id_fkey1 FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: marcacion_usuario_id_fkey2; Type: FK CONSTRAINT; Schema: administrativo; Owner: franco
--

ALTER TABLE ONLY administrativo.marcacion
    ADD CONSTRAINT marcacion_usuario_id_fkey2 FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: inicio_sesion_sucursal_id_fkey; Type: FK CONSTRAINT; Schema: configuraciones; Owner: franco
--

ALTER TABLE ONLY configuraciones.inicio_sesion
    ADD CONSTRAINT inicio_sesion_sucursal_id_fkey FOREIGN KEY (sucursal_id) REFERENCES empresarial.sucursal(id);


--
-- Name: local_equipo_id_fkey; Type: FK CONSTRAINT; Schema: configuraciones; Owner: franco
--

ALTER TABLE ONLY configuraciones.local
    ADD CONSTRAINT local_equipo_id_fkey FOREIGN KEY (equipo_id) REFERENCES equipos.equipo(id);


--
-- Name: local_sucursal_id_fkey; Type: FK CONSTRAINT; Schema: configuraciones; Owner: franco
--

ALTER TABLE ONLY configuraciones.local
    ADD CONSTRAINT local_sucursal_id_fkey FOREIGN KEY (sucursal_id) REFERENCES empresarial.sucursal(id);


--
-- Name: local_usuario_id_fkey; Type: FK CONSTRAINT; Schema: configuraciones; Owner: franco
--

ALTER TABLE ONLY configuraciones.local
    ADD CONSTRAINT local_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: local_usuario_id_fkey1; Type: FK CONSTRAINT; Schema: configuraciones; Owner: franco
--

ALTER TABLE ONLY configuraciones.local
    ADD CONSTRAINT local_usuario_id_fkey1 FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: cargo_supervisado_por_id_fkey; Type: FK CONSTRAINT; Schema: empresarial; Owner: franco
--

ALTER TABLE ONLY empresarial.cargo
    ADD CONSTRAINT cargo_supervisado_por_id_fkey FOREIGN KEY (supervisado_por_id) REFERENCES empresarial.cargo(id);


--
-- Name: cargo_usuario_id_fkey; Type: FK CONSTRAINT; Schema: empresarial; Owner: franco
--

ALTER TABLE ONLY empresarial.cargo
    ADD CONSTRAINT cargo_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: sector_sector_fk; Type: FK CONSTRAINT; Schema: empresarial; Owner: franco
--

ALTER TABLE ONLY empresarial.zona
    ADD CONSTRAINT sector_sector_fk FOREIGN KEY (sector_id) REFERENCES empresarial.sector(id);


--
-- Name: sector_sucursal_fk; Type: FK CONSTRAINT; Schema: empresarial; Owner: franco
--

ALTER TABLE ONLY empresarial.sector
    ADD CONSTRAINT sector_sucursal_fk FOREIGN KEY (sucursal_id) REFERENCES empresarial.sucursal(id);


--
-- Name: sector_usuario_fk; Type: FK CONSTRAINT; Schema: empresarial; Owner: franco
--

ALTER TABLE ONLY empresarial.sector
    ADD CONSTRAINT sector_usuario_fk FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: sector_usuario_fk; Type: FK CONSTRAINT; Schema: empresarial; Owner: franco
--

ALTER TABLE ONLY empresarial.zona
    ADD CONSTRAINT sector_usuario_fk FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: sucursal_ciudad_id_fkey; Type: FK CONSTRAINT; Schema: empresarial; Owner: franco
--

ALTER TABLE ONLY empresarial.sucursal
    ADD CONSTRAINT sucursal_ciudad_id_fkey FOREIGN KEY (ciudad_id) REFERENCES general.ciudad(id);


--
-- Name: sucursal_usuario_id_fkey; Type: FK CONSTRAINT; Schema: empresarial; Owner: franco
--

ALTER TABLE ONLY empresarial.sucursal
    ADD CONSTRAINT sucursal_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: equipo_tipo_equipo_id_fkey; Type: FK CONSTRAINT; Schema: equipos; Owner: franco
--

ALTER TABLE ONLY equipos.equipo
    ADD CONSTRAINT equipo_tipo_equipo_id_fkey FOREIGN KEY (tipo_equipo_id) REFERENCES equipos.equipo(id);


--
-- Name: equipo_tipo_equipo_id_fkey1; Type: FK CONSTRAINT; Schema: equipos; Owner: franco
--

ALTER TABLE ONLY equipos.equipo
    ADD CONSTRAINT equipo_tipo_equipo_id_fkey1 FOREIGN KEY (tipo_equipo_id) REFERENCES equipos.tipo_equipo(id);


--
-- Name: equipo_usuario_id_fkey; Type: FK CONSTRAINT; Schema: equipos; Owner: franco
--

ALTER TABLE ONLY equipos.equipo
    ADD CONSTRAINT equipo_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: cambio_autorizado_por_id_fkey; Type: FK CONSTRAINT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.gasto
    ADD CONSTRAINT cambio_autorizado_por_id_fkey FOREIGN KEY (autorizado_por_id) REFERENCES personas.funcionario(id);


--
-- Name: cambio_moneda_id_fkey; Type: FK CONSTRAINT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.cambio
    ADD CONSTRAINT cambio_moneda_id_fkey FOREIGN KEY (moneda_id) REFERENCES financiero.moneda(id);


--
-- Name: cambio_responsable_id_fkey; Type: FK CONSTRAINT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.gasto
    ADD CONSTRAINT cambio_responsable_id_fkey FOREIGN KEY (responsable_id) REFERENCES personas.funcionario(id);


--
-- Name: cambio_usuario_id_fkey; Type: FK CONSTRAINT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.cambio
    ADD CONSTRAINT cambio_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: cambio_usuario_id_fkey; Type: FK CONSTRAINT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.gasto
    ADD CONSTRAINT cambio_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: conteo_moneda_conteo_id_fkey; Type: FK CONSTRAINT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.conteo_moneda
    ADD CONSTRAINT conteo_moneda_conteo_id_fkey FOREIGN KEY (conteo_id) REFERENCES financiero.conteo(id) ON DELETE CASCADE;


--
-- Name: conteo_moneda_moneda_billetes_id_fkey; Type: FK CONSTRAINT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.conteo_moneda
    ADD CONSTRAINT conteo_moneda_moneda_billetes_id_fkey FOREIGN KEY (moneda_billetes_id) REFERENCES financiero.moneda_billetes(id);


--
-- Name: conteo_moneda_usuario_id_fkey; Type: FK CONSTRAINT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.conteo_moneda
    ADD CONSTRAINT conteo_moneda_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: cuenta_bancaria_fk; Type: FK CONSTRAINT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.cuenta_bancaria
    ADD CONSTRAINT cuenta_bancaria_fk FOREIGN KEY (moneda_id) REFERENCES financiero.moneda(id);


--
-- Name: cuenta_bancaria_fk__persona; Type: FK CONSTRAINT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.cuenta_bancaria
    ADD CONSTRAINT cuenta_bancaria_fk__persona FOREIGN KEY (persona_id) REFERENCES personas.persona(id);


--
-- Name: cuenta_bancaria_fk_banco; Type: FK CONSTRAINT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.cuenta_bancaria
    ADD CONSTRAINT cuenta_bancaria_fk_banco FOREIGN KEY (banco_id) REFERENCES financiero.banco(id);


--
-- Name: cuenta_bancaria_fk_usuario; Type: FK CONSTRAINT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.cuenta_bancaria
    ADD CONSTRAINT cuenta_bancaria_fk_usuario FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: documento_fk; Type: FK CONSTRAINT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.documento
    ADD CONSTRAINT documento_fk FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: forma_pago_cuenta_bancaria_id_fkey; Type: FK CONSTRAINT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.forma_pago
    ADD CONSTRAINT forma_pago_cuenta_bancaria_id_fkey FOREIGN KEY (cuenta_bancaria_id) REFERENCES financiero.cuenta_bancaria(id);


--
-- Name: forma_pago_usuario_id_fkey; Type: FK CONSTRAINT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.forma_pago
    ADD CONSTRAINT forma_pago_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: gasto_caja_fk; Type: FK CONSTRAINT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.gasto
    ADD CONSTRAINT gasto_caja_fk FOREIGN KEY (caja_id) REFERENCES financiero.pdv_caja(id) ON DELETE CASCADE;


--
-- Name: gasto_detalle_fk; Type: FK CONSTRAINT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.gasto_detalle
    ADD CONSTRAINT gasto_detalle_fk FOREIGN KEY (gasto_id) REFERENCES financiero.gasto(id) ON DELETE CASCADE;


--
-- Name: gasto_detalle_moneda_id_fkey; Type: FK CONSTRAINT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.gasto_detalle
    ADD CONSTRAINT gasto_detalle_moneda_id_fkey FOREIGN KEY (moneda_id) REFERENCES financiero.moneda(id);


--
-- Name: gasto_detalle_usuario_id_fkey; Type: FK CONSTRAINT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.gasto_detalle
    ADD CONSTRAINT gasto_detalle_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: maletin_cargo_id_fkey; Type: FK CONSTRAINT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.tipo_gasto
    ADD CONSTRAINT maletin_cargo_id_fkey FOREIGN KEY (cargo_id) REFERENCES empresarial.cargo(id);


--
-- Name: maletin_usuario_id_fkey; Type: FK CONSTRAINT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.maletin
    ADD CONSTRAINT maletin_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: maletin_usuario_id_fkey; Type: FK CONSTRAINT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.tipo_gasto
    ADD CONSTRAINT maletin_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: maletin_usuario_id_fkey; Type: FK CONSTRAINT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.conteo
    ADD CONSTRAINT maletin_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: moneda_detalle_moneda_id_fkey; Type: FK CONSTRAINT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.moneda_billetes
    ADD CONSTRAINT moneda_detalle_moneda_id_fkey FOREIGN KEY (moneda_id) REFERENCES financiero.moneda(id) ON DELETE CASCADE;


--
-- Name: moneda_detalle_usuario_id_fkey; Type: FK CONSTRAINT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.moneda_billetes
    ADD CONSTRAINT moneda_detalle_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: moneda_fk; Type: FK CONSTRAINT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.moneda
    ADD CONSTRAINT moneda_fk FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: moneda_pais_id_fkey; Type: FK CONSTRAINT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.moneda
    ADD CONSTRAINT moneda_pais_id_fkey FOREIGN KEY (pais_id) REFERENCES general.pais(id);


--
-- Name: mov_cambio_autorizado_por_id_fkey; Type: FK CONSTRAINT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.cambio_caja
    ADD CONSTRAINT mov_cambio_autorizado_por_id_fkey FOREIGN KEY (autorizado_por_id) REFERENCES personas.funcionario(id);


--
-- Name: mov_cambio_cliente_id_fkey; Type: FK CONSTRAINT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.cambio_caja
    ADD CONSTRAINT mov_cambio_cliente_id_fkey FOREIGN KEY (cliente_id) REFERENCES personas.cliente(id);


--
-- Name: mov_cambio_moneda_compra_id_fkey; Type: FK CONSTRAINT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.cambio_caja
    ADD CONSTRAINT mov_cambio_moneda_compra_id_fkey FOREIGN KEY (moneda_compra_id) REFERENCES financiero.moneda(id);


--
-- Name: mov_cambio_moneda_venta_id_fkey; Type: FK CONSTRAINT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.cambio_caja
    ADD CONSTRAINT mov_cambio_moneda_venta_id_fkey FOREIGN KEY (moneda_venta_id) REFERENCES financiero.moneda(id);


--
-- Name: mov_cambio_usuario_id_fkey; Type: FK CONSTRAINT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.cambio_caja
    ADD CONSTRAINT mov_cambio_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: movimiento_caja_cambio_id_fkey; Type: FK CONSTRAINT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.movimiento_caja
    ADD CONSTRAINT movimiento_caja_cambio_id_fkey FOREIGN KEY (cambio_id) REFERENCES financiero.cambio(id);


--
-- Name: movimiento_caja_fk; Type: FK CONSTRAINT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.movimiento_caja
    ADD CONSTRAINT movimiento_caja_fk FOREIGN KEY (caja_id) REFERENCES financiero.pdv_caja(id) ON DELETE CASCADE;


--
-- Name: movimiento_caja_moneda_id_fkey; Type: FK CONSTRAINT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.movimiento_caja
    ADD CONSTRAINT movimiento_caja_moneda_id_fkey FOREIGN KEY (moneda_id) REFERENCES financiero.moneda(id);


--
-- Name: movimiento_caja_usuario_id_fkey; Type: FK CONSTRAINT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.movimiento_caja
    ADD CONSTRAINT movimiento_caja_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: pdv_caja_conteo_apertura_fk; Type: FK CONSTRAINT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.pdv_caja
    ADD CONSTRAINT pdv_caja_conteo_apertura_fk FOREIGN KEY (conteo_apertura_id) REFERENCES financiero.conteo(id) ON DELETE CASCADE;


--
-- Name: pdv_caja_conteo_cierre_fk; Type: FK CONSTRAINT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.pdv_caja
    ADD CONSTRAINT pdv_caja_conteo_cierre_fk FOREIGN KEY (conteo_cierre_id) REFERENCES financiero.conteo(id) ON DELETE CASCADE;


--
-- Name: pdv_caja_maletin_id_fkey; Type: FK CONSTRAINT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.pdv_caja
    ADD CONSTRAINT pdv_caja_maletin_id_fkey FOREIGN KEY (maletin_id) REFERENCES financiero.maletin(id);


--
-- Name: pdv_caja_usuario_id_fkey; Type: FK CONSTRAINT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.pdv_caja
    ADD CONSTRAINT pdv_caja_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: retiro_detalle_moneda_id_fkey; Type: FK CONSTRAINT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.retiro_detalle
    ADD CONSTRAINT retiro_detalle_moneda_id_fkey FOREIGN KEY (moneda_id) REFERENCES financiero.moneda(id);


--
-- Name: retiro_detalle_retiro_id_fkey; Type: FK CONSTRAINT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.retiro_detalle
    ADD CONSTRAINT retiro_detalle_retiro_id_fkey FOREIGN KEY (retiro_id) REFERENCES financiero.retiro(id);


--
-- Name: retiro_detalle_usuario_id_fkey; Type: FK CONSTRAINT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.retiro_detalle
    ADD CONSTRAINT retiro_detalle_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: retiro_fk_entrada; Type: FK CONSTRAINT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.retiro
    ADD CONSTRAINT retiro_fk_entrada FOREIGN KEY (caja_entrada_id) REFERENCES financiero.pdv_caja(id) ON DELETE CASCADE;


--
-- Name: retiro_fk_salida; Type: FK CONSTRAINT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.retiro
    ADD CONSTRAINT retiro_fk_salida FOREIGN KEY (caja_salida_id) REFERENCES financiero.pdv_caja(id) ON DELETE CASCADE;


--
-- Name: retiro_responsable_id_fkey; Type: FK CONSTRAINT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.retiro
    ADD CONSTRAINT retiro_responsable_id_fkey FOREIGN KEY (responsable_id) REFERENCES personas.funcionario(id);


--
-- Name: retiro_usuario_id_fkey; Type: FK CONSTRAINT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.retiro
    ADD CONSTRAINT retiro_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: sencillo_autorizado_por_id_fkey; Type: FK CONSTRAINT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.sencillo
    ADD CONSTRAINT sencillo_autorizado_por_id_fkey FOREIGN KEY (autorizado_por_id) REFERENCES personas.funcionario(id);


--
-- Name: sencillo_detalle_cambio_id_fkey; Type: FK CONSTRAINT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.sencillo_detalle
    ADD CONSTRAINT sencillo_detalle_cambio_id_fkey FOREIGN KEY (cambio_id) REFERENCES financiero.cambio(id);


--
-- Name: sencillo_detalle_moneda_id_fkey; Type: FK CONSTRAINT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.sencillo_detalle
    ADD CONSTRAINT sencillo_detalle_moneda_id_fkey FOREIGN KEY (moneda_id) REFERENCES financiero.moneda(id);


--
-- Name: sencillo_detalle_sencillo_id_fkey; Type: FK CONSTRAINT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.sencillo_detalle
    ADD CONSTRAINT sencillo_detalle_sencillo_id_fkey FOREIGN KEY (sencillo_id) REFERENCES financiero.sencillo(id);


--
-- Name: sencillo_detalle_usuario_id_fkey; Type: FK CONSTRAINT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.sencillo_detalle
    ADD CONSTRAINT sencillo_detalle_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: sencillo_responsable_id_fkey; Type: FK CONSTRAINT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.sencillo
    ADD CONSTRAINT sencillo_responsable_id_fkey FOREIGN KEY (responsable_id) REFERENCES personas.funcionario(id);


--
-- Name: sencillo_usuario_id_fkey; Type: FK CONSTRAINT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.sencillo
    ADD CONSTRAINT sencillo_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: tipo_gasto_clasificacion_gasto_id_fkey; Type: FK CONSTRAINT; Schema: financiero; Owner: franco
--

ALTER TABLE ONLY financiero.tipo_gasto
    ADD CONSTRAINT tipo_gasto_clasificacion_gasto_id_fkey FOREIGN KEY (clasificacion_gasto_id) REFERENCES financiero.tipo_gasto(id) ON DELETE CASCADE;


--
-- Name: barrio_ciudad_id_fkey; Type: FK CONSTRAINT; Schema: general; Owner: franco
--

ALTER TABLE ONLY general.barrio
    ADD CONSTRAINT barrio_ciudad_id_fkey FOREIGN KEY (ciudad_id) REFERENCES general.ciudad(id);


--
-- Name: barrio_precio_delivery_id_fkey; Type: FK CONSTRAINT; Schema: general; Owner: franco
--

ALTER TABLE ONLY general.barrio
    ADD CONSTRAINT barrio_precio_delivery_id_fkey FOREIGN KEY (precio_delivery_id) REFERENCES operaciones.precio_delivery(id);


--
-- Name: barrio_usuario_id_fkey; Type: FK CONSTRAINT; Schema: general; Owner: franco
--

ALTER TABLE ONLY general.barrio
    ADD CONSTRAINT barrio_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: ciudad_pais_id_fkey; Type: FK CONSTRAINT; Schema: general; Owner: franco
--

ALTER TABLE ONLY general.ciudad
    ADD CONSTRAINT ciudad_pais_id_fkey FOREIGN KEY (pais_id) REFERENCES general.pais(id);


--
-- Name: ciudad_usuario_id_fkey; Type: FK CONSTRAINT; Schema: general; Owner: franco
--

ALTER TABLE ONLY general.ciudad
    ADD CONSTRAINT ciudad_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: contacto_persona_id_fkey; Type: FK CONSTRAINT; Schema: general; Owner: franco
--

ALTER TABLE ONLY general.contacto
    ADD CONSTRAINT contacto_persona_id_fkey FOREIGN KEY (persona_id) REFERENCES personas.persona(id);


--
-- Name: contacto_persona_id_fkey1; Type: FK CONSTRAINT; Schema: general; Owner: franco
--

ALTER TABLE ONLY general.contacto
    ADD CONSTRAINT contacto_persona_id_fkey1 FOREIGN KEY (persona_id) REFERENCES personas.persona(id);


--
-- Name: contacto_usuario_id_fkey; Type: FK CONSTRAINT; Schema: general; Owner: franco
--

ALTER TABLE ONLY general.contacto
    ADD CONSTRAINT contacto_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: contacto_usuario_id_fkey1; Type: FK CONSTRAINT; Schema: general; Owner: franco
--

ALTER TABLE ONLY general.contacto
    ADD CONSTRAINT contacto_usuario_id_fkey1 FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: cobro_detalle_cobro_id_fkey; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.cobro_detalle
    ADD CONSTRAINT cobro_detalle_cobro_id_fkey FOREIGN KEY (cobro_id) REFERENCES operaciones.cobro(id) ON DELETE CASCADE;


--
-- Name: cobro_detalle_fk_forma_pago; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.cobro_detalle
    ADD CONSTRAINT cobro_detalle_fk_forma_pago FOREIGN KEY (forma_pago_id) REFERENCES financiero.forma_pago(id);


--
-- Name: cobro_detalle_moneda_id_fkey; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.cobro_detalle
    ADD CONSTRAINT cobro_detalle_moneda_id_fkey FOREIGN KEY (moneda_id) REFERENCES financiero.moneda(id);


--
-- Name: cobro_detalle_usuario_id_fkey; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.cobro_detalle
    ADD CONSTRAINT cobro_detalle_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: cobro_usuario_id_fk; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.cobro
    ADD CONSTRAINT cobro_usuario_id_fk FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: compra_contacto_proveedor_id_fkey; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.compra
    ADD CONSTRAINT compra_contacto_proveedor_id_fkey FOREIGN KEY (contacto_proveedor_id) REFERENCES personas.persona(id);


--
-- Name: compra_fk; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.compra
    ADD CONSTRAINT compra_fk FOREIGN KEY (forma_pago_id) REFERENCES financiero.forma_pago(id);


--
-- Name: compra_item_compra_id_fkey; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.compra_item
    ADD CONSTRAINT compra_item_compra_id_fkey FOREIGN KEY (compra_id) REFERENCES operaciones.compra(id);


--
-- Name: compra_item_pedido_item_fk; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.compra_item
    ADD CONSTRAINT compra_item_pedido_item_fk FOREIGN KEY (pedido_item_id) REFERENCES operaciones.pedido_item(id);


--
-- Name: compra_item_presentacion_fk; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.compra_item
    ADD CONSTRAINT compra_item_presentacion_fk FOREIGN KEY (presentacion_id) REFERENCES productos.presentacion(id);


--
-- Name: compra_item_producto_id_fkey; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.compra_item
    ADD CONSTRAINT compra_item_producto_id_fkey FOREIGN KEY (producto_id) REFERENCES productos.producto(id);


--
-- Name: compra_item_usuario_id_fkey; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.compra_item
    ADD CONSTRAINT compra_item_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: compra_moneda_id_fkey; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.compra
    ADD CONSTRAINT compra_moneda_id_fkey FOREIGN KEY (moneda_id) REFERENCES financiero.moneda(id);


--
-- Name: compra_pedido_id_fkey; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.compra
    ADD CONSTRAINT compra_pedido_id_fkey FOREIGN KEY (pedido_id) REFERENCES operaciones.pedido(id);


--
-- Name: compra_proveedor_id_fkey; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.compra
    ADD CONSTRAINT compra_proveedor_id_fkey FOREIGN KEY (proveedor_id) REFERENCES personas.proveedor(id);


--
-- Name: compra_sucursal_id_fkey; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.compra
    ADD CONSTRAINT compra_sucursal_id_fkey FOREIGN KEY (sucursal_id) REFERENCES empresarial.sucursal(id);


--
-- Name: compra_usuario_id_fkey; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.compra
    ADD CONSTRAINT compra_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: delivery_cliente_id_fkey; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.delivery
    ADD CONSTRAINT delivery_cliente_id_fkey FOREIGN KEY (cliente_id) REFERENCES personas.cliente(id);


--
-- Name: delivery_entregador_id_fkey; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.delivery
    ADD CONSTRAINT delivery_entregador_id_fkey FOREIGN KEY (entregador_id) REFERENCES personas.funcionario(id);


--
-- Name: delivery_fk; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.delivery
    ADD CONSTRAINT delivery_fk FOREIGN KEY (barrio_id) REFERENCES general.barrio(id);


--
-- Name: delivery_forma_pago_id_fkey; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.delivery
    ADD CONSTRAINT delivery_forma_pago_id_fkey FOREIGN KEY (forma_pago_id) REFERENCES operaciones.precio_delivery(id);


--
-- Name: delivery_forma_pago_id_fkey1; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.delivery
    ADD CONSTRAINT delivery_forma_pago_id_fkey1 FOREIGN KEY (forma_pago_id) REFERENCES financiero.forma_pago(id);


--
-- Name: delivery_usuario_id_fkey; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.delivery
    ADD CONSTRAINT delivery_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: delivery_venta_id_fkey; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.delivery
    ADD CONSTRAINT delivery_venta_id_fkey FOREIGN KEY (venta_id) REFERENCES operaciones.venta(id);


--
-- Name: delivery_vuelto_fk; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.delivery
    ADD CONSTRAINT delivery_vuelto_fk FOREIGN KEY (vuelto_id) REFERENCES operaciones.vuelto(id);


--
-- Name: entrada_fk; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.entrada
    ADD CONSTRAINT entrada_fk FOREIGN KEY (sucursal_id) REFERENCES empresarial.sucursal(id);


--
-- Name: entrada_fk_responsable; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.entrada
    ADD CONSTRAINT entrada_fk_responsable FOREIGN KEY (responsable_carga_id) REFERENCES personas.usuario(id);


--
-- Name: entrada_fk_usuario; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.entrada
    ADD CONSTRAINT entrada_fk_usuario FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: entrada_item_fk_entrada; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.entrada_item
    ADD CONSTRAINT entrada_item_fk_entrada FOREIGN KEY (entrada_id) REFERENCES operaciones.entrada(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: entrada_item_fk_presentacion; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.entrada_item
    ADD CONSTRAINT entrada_item_fk_presentacion FOREIGN KEY (presentacion_id) REFERENCES productos.presentacion(id);


--
-- Name: entrada_item_fk_producto; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.entrada_item
    ADD CONSTRAINT entrada_item_fk_producto FOREIGN KEY (producto_id) REFERENCES productos.producto(id);


--
-- Name: entrada_item_fk_usuario; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.entrada_item
    ADD CONSTRAINT entrada_item_fk_usuario FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: inventario_producto_inventario_fk; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.inventario_producto
    ADD CONSTRAINT inventario_producto_inventario_fk FOREIGN KEY (inventario_id) REFERENCES operaciones.inventario(id) ON DELETE CASCADE;


--
-- Name: inventario_producto_inventario_producto_fk; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.inventario_producto_item
    ADD CONSTRAINT inventario_producto_inventario_producto_fk FOREIGN KEY (inventario_producto_id) REFERENCES operaciones.inventario_producto(id) ON DELETE CASCADE;


--
-- Name: inventario_producto_presentacion_fk; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.inventario_producto_item
    ADD CONSTRAINT inventario_producto_presentacion_fk FOREIGN KEY (presentacion_id) REFERENCES productos.presentacion(id);


--
-- Name: inventario_producto_producto_fk; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.inventario_producto
    ADD CONSTRAINT inventario_producto_producto_fk FOREIGN KEY (producto_id) REFERENCES productos.producto(id);


--
-- Name: inventario_producto_usuario_fk; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.inventario_producto
    ADD CONSTRAINT inventario_producto_usuario_fk FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: inventario_producto_usuario_fk; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.inventario_producto_item
    ADD CONSTRAINT inventario_producto_usuario_fk FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: inventario_producto_zona_fk; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.inventario_producto
    ADD CONSTRAINT inventario_producto_zona_fk FOREIGN KEY (zona_id) REFERENCES empresarial.zona(id);


--
-- Name: inventario_producto_zona_fk; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.inventario_producto_item
    ADD CONSTRAINT inventario_producto_zona_fk FOREIGN KEY (zona_id) REFERENCES empresarial.zona(id);


--
-- Name: inventario_sucursal_fk; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.inventario
    ADD CONSTRAINT inventario_sucursal_fk FOREIGN KEY (sucursal_id) REFERENCES empresarial.sucursal(id);


--
-- Name: inventario_usuario_fk; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.inventario
    ADD CONSTRAINT inventario_usuario_fk FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: motivo_diferencia_pedido_usuario_id_fkey; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.motivo_diferencia_pedido
    ADD CONSTRAINT motivo_diferencia_pedido_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: movimientos_stock_producto_id_fkey; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.movimiento_stock
    ADD CONSTRAINT movimientos_stock_producto_id_fkey FOREIGN KEY (producto_id) REFERENCES productos.producto(id);


--
-- Name: movimientos_stock_sucursal_id_fkey; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.movimiento_stock
    ADD CONSTRAINT movimientos_stock_sucursal_id_fkey FOREIGN KEY (sucursal_id) REFERENCES empresarial.sucursal(id);


--
-- Name: movimientos_stock_usuario_id_fkey; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.movimiento_stock
    ADD CONSTRAINT movimientos_stock_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: necesidad_item_necesidad_id_fkey; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.necesidad_item
    ADD CONSTRAINT necesidad_item_necesidad_id_fkey FOREIGN KEY (necesidad_id) REFERENCES operaciones.necesidad(id);


--
-- Name: necesidad_item_producto_id_fkey; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.necesidad_item
    ADD CONSTRAINT necesidad_item_producto_id_fkey FOREIGN KEY (producto_id) REFERENCES productos.producto(id);


--
-- Name: necesidad_item_usuario_id_fkey; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.necesidad_item
    ADD CONSTRAINT necesidad_item_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: necesidad_sucursal_id_fkey; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.necesidad
    ADD CONSTRAINT necesidad_sucursal_id_fkey FOREIGN KEY (sucursal_id) REFERENCES empresarial.sucursal(id);


--
-- Name: necesidad_usuario_id_fkey; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.necesidad
    ADD CONSTRAINT necesidad_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: nota_pedido_pedido_id_fkey; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.nota_pedido
    ADD CONSTRAINT nota_pedido_pedido_id_fkey FOREIGN KEY (pedido_id) REFERENCES operaciones.pedido(id);


--
-- Name: nota_pedido_usuario_id_fkey; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.nota_pedido
    ADD CONSTRAINT nota_pedido_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: nota_recepcion_compra_fk; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.nota_recepcion
    ADD CONSTRAINT nota_recepcion_compra_fk FOREIGN KEY (compra_id) REFERENCES operaciones.nota_recepcion_item(id);


--
-- Name: nota_recepcion_documento_fk; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.nota_recepcion
    ADD CONSTRAINT nota_recepcion_documento_fk FOREIGN KEY (documento_id) REFERENCES financiero.documento(id);


--
-- Name: nota_recepcion_item_nota_recepcion_fk; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.nota_recepcion_item
    ADD CONSTRAINT nota_recepcion_item_nota_recepcion_fk FOREIGN KEY (nota_recepcion_id) REFERENCES operaciones.nota_recepcion(id) ON DELETE CASCADE;


--
-- Name: nota_recepcion_item_pedido_item_fk; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.nota_recepcion_item
    ADD CONSTRAINT nota_recepcion_item_pedido_item_fk FOREIGN KEY (pedido_item_id) REFERENCES operaciones.pedido_item(id) ON DELETE CASCADE;


--
-- Name: nota_recepcion_item_usuario_fk; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.nota_recepcion_item
    ADD CONSTRAINT nota_recepcion_item_usuario_fk FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: nota_recepcion_pedido_fk; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.nota_recepcion
    ADD CONSTRAINT nota_recepcion_pedido_fk FOREIGN KEY (pedido_id) REFERENCES operaciones.pedido(id) ON DELETE CASCADE;


--
-- Name: nota_recepcion_usuario_fk; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.nota_recepcion
    ADD CONSTRAINT nota_recepcion_usuario_fk FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: pedido_fk; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.pedido
    ADD CONSTRAINT pedido_fk FOREIGN KEY (forma_pago_id) REFERENCES financiero.forma_pago(id);


--
-- Name: pedido_item_nota_recepcion_fk; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.pedido_item
    ADD CONSTRAINT pedido_item_nota_recepcion_fk FOREIGN KEY (nota_recepcion_id) REFERENCES operaciones.nota_recepcion(id);


--
-- Name: pedido_item_pedido_fk; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.pedido_item
    ADD CONSTRAINT pedido_item_pedido_fk FOREIGN KEY (pedido_id) REFERENCES operaciones.pedido(id) ON DELETE CASCADE;


--
-- Name: pedido_item_presentacion_fk; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.pedido_item
    ADD CONSTRAINT pedido_item_presentacion_fk FOREIGN KEY (presentacion_id) REFERENCES productos.presentacion(id);


--
-- Name: pedido_item_producto_id_fkey; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.pedido_item
    ADD CONSTRAINT pedido_item_producto_id_fkey FOREIGN KEY (producto_id) REFERENCES productos.producto(id);


--
-- Name: pedido_item_usuario_id_fkey; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.pedido_item
    ADD CONSTRAINT pedido_item_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: pedido_moneda_id_fkey; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.pedido
    ADD CONSTRAINT pedido_moneda_id_fkey FOREIGN KEY (moneda_id) REFERENCES financiero.moneda(id);


--
-- Name: pedido_necesidad_id_fkey; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.pedido
    ADD CONSTRAINT pedido_necesidad_id_fkey FOREIGN KEY (necesidad_id) REFERENCES operaciones.necesidad(id);


--
-- Name: pedido_proveedor_id_fkey; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.pedido
    ADD CONSTRAINT pedido_proveedor_id_fkey FOREIGN KEY (proveedor_id) REFERENCES personas.proveedor(id);


--
-- Name: pedido_usuario_id_fkey; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.pedido
    ADD CONSTRAINT pedido_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: pedido_vendedor_fk; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.pedido
    ADD CONSTRAINT pedido_vendedor_fk FOREIGN KEY (vendedor_id) REFERENCES personas.vendedor(id);


--
-- Name: precio_delivery_usuario_id_fkey; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.precio_delivery
    ADD CONSTRAINT precio_delivery_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: programar_precio_precio_fk; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.programar_precio
    ADD CONSTRAINT programar_precio_precio_fk FOREIGN KEY (precio_id) REFERENCES productos.precio_por_sucursal(id) ON DELETE CASCADE;


--
-- Name: programar_precio_usuairo_fk; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.programar_precio
    ADD CONSTRAINT programar_precio_usuairo_fk FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: salida_fk_responsable; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.salida
    ADD CONSTRAINT salida_fk_responsable FOREIGN KEY (responsable_carga_id) REFERENCES personas.usuario(id);


--
-- Name: salida_fk_sucursal; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.salida
    ADD CONSTRAINT salida_fk_sucursal FOREIGN KEY (sucursal_id) REFERENCES empresarial.sucursal(id);


--
-- Name: salida_fk_usuario; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.salida
    ADD CONSTRAINT salida_fk_usuario FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: salida_item_fk_1_producto; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.salida_item
    ADD CONSTRAINT salida_item_fk_1_producto FOREIGN KEY (producto_id) REFERENCES productos.producto(id);


--
-- Name: salida_item_fk_presentacion; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.salida_item
    ADD CONSTRAINT salida_item_fk_presentacion FOREIGN KEY (presentacion_id) REFERENCES productos.presentacion(id);


--
-- Name: salida_item_fk_salida; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.salida_item
    ADD CONSTRAINT salida_item_fk_salida FOREIGN KEY (salida_id) REFERENCES operaciones.salida(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: salida_item_fk_usuario; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.salida_item
    ADD CONSTRAINT salida_item_fk_usuario FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: transferencia_item_presentacion_1_fk; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.transferencia_item
    ADD CONSTRAINT transferencia_item_presentacion_1_fk FOREIGN KEY (presentacion_pre_transferencia_id) REFERENCES productos.presentacion(id);


--
-- Name: transferencia_item_presentacion_2_fk; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.transferencia_item
    ADD CONSTRAINT transferencia_item_presentacion_2_fk FOREIGN KEY (presentacion_preparacion_id) REFERENCES productos.presentacion(id);


--
-- Name: transferencia_item_presentacion_3_fk; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.transferencia_item
    ADD CONSTRAINT transferencia_item_presentacion_3_fk FOREIGN KEY (presentacion_transporte_id) REFERENCES productos.presentacion(id);


--
-- Name: transferencia_item_presentacion_4_fk; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.transferencia_item
    ADD CONSTRAINT transferencia_item_presentacion_4_fk FOREIGN KEY (presentacion_recepcion_id) REFERENCES productos.presentacion(id);


--
-- Name: transferencia_item_transferencia_fk; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.transferencia_item
    ADD CONSTRAINT transferencia_item_transferencia_fk FOREIGN KEY (transferencia_id) REFERENCES operaciones.transferencia(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: transferencia_item_usuario_fk; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.transferencia_item
    ADD CONSTRAINT transferencia_item_usuario_fk FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: transferencia_suc_destino_fk; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.transferencia
    ADD CONSTRAINT transferencia_suc_destino_fk FOREIGN KEY (sucursal_destino_id) REFERENCES empresarial.sucursal(id);


--
-- Name: transferencia_suc_origen_fk; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.transferencia
    ADD CONSTRAINT transferencia_suc_origen_fk FOREIGN KEY (sucursal_origen_id) REFERENCES empresarial.sucursal(id);


--
-- Name: transferencia_usuario_1_fk; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.transferencia
    ADD CONSTRAINT transferencia_usuario_1_fk FOREIGN KEY (usuario_pre_transferencia_id) REFERENCES personas.usuario(id);


--
-- Name: transferencia_usuario_2_fk; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.transferencia
    ADD CONSTRAINT transferencia_usuario_2_fk FOREIGN KEY (usuario_preparacion_id) REFERENCES personas.usuario(id);


--
-- Name: transferencia_usuario_3_fk; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.transferencia
    ADD CONSTRAINT transferencia_usuario_3_fk FOREIGN KEY (usuario_transporte_id) REFERENCES personas.usuario(id);


--
-- Name: transferencia_usuario_4_fk; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.transferencia
    ADD CONSTRAINT transferencia_usuario_4_fk FOREIGN KEY (usuario_recepcion_id) REFERENCES personas.usuario(id);


--
-- Name: venta_cliente_id_fkey; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.venta
    ADD CONSTRAINT venta_cliente_id_fkey FOREIGN KEY (cliente_id) REFERENCES personas.cliente(id);


--
-- Name: venta_fk; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.venta
    ADD CONSTRAINT venta_fk FOREIGN KEY (forma_pago_id) REFERENCES financiero.forma_pago(id);


--
-- Name: venta_fk_caja; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.venta
    ADD CONSTRAINT venta_fk_caja FOREIGN KEY (caja_id) REFERENCES financiero.pdv_caja(id);


--
-- Name: venta_fk_cobro; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.venta
    ADD CONSTRAINT venta_fk_cobro FOREIGN KEY (cobro_id) REFERENCES operaciones.cobro(id);


--
-- Name: venta_item_fk; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.venta_item
    ADD CONSTRAINT venta_item_fk FOREIGN KEY (presentacion_id) REFERENCES productos.presentacion(id);


--
-- Name: venta_item_fk_precio; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.venta_item
    ADD CONSTRAINT venta_item_fk_precio FOREIGN KEY (precio_id) REFERENCES productos.precio_por_sucursal(id);


--
-- Name: venta_item_fk_venta; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.venta_item
    ADD CONSTRAINT venta_item_fk_venta FOREIGN KEY (venta_id) REFERENCES operaciones.venta(id) ON DELETE CASCADE;


--
-- Name: venta_item_producto_id_fkey; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.venta_item
    ADD CONSTRAINT venta_item_producto_id_fkey FOREIGN KEY (producto_id) REFERENCES productos.producto(id);


--
-- Name: venta_item_usuario_id_fkey; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.venta_item
    ADD CONSTRAINT venta_item_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: venta_usuario_id_fkey; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.venta
    ADD CONSTRAINT venta_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: vuelto_autorizado_por_id_fkey; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.vuelto
    ADD CONSTRAINT vuelto_autorizado_por_id_fkey FOREIGN KEY (autorizado_por_id) REFERENCES personas.funcionario(id);


--
-- Name: vuelto_item_moneda_id_fkey; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.vuelto_item
    ADD CONSTRAINT vuelto_item_moneda_id_fkey FOREIGN KEY (moneda_id) REFERENCES financiero.moneda(id);


--
-- Name: vuelto_item_usuario_id_fkey; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.vuelto_item
    ADD CONSTRAINT vuelto_item_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: vuelto_item_vuelto_id_fkey; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.vuelto_item
    ADD CONSTRAINT vuelto_item_vuelto_id_fkey FOREIGN KEY (vuelto_id) REFERENCES operaciones.vuelto(id);


--
-- Name: vuelto_responsable_id_fkey; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.vuelto
    ADD CONSTRAINT vuelto_responsable_id_fkey FOREIGN KEY (responsable_id) REFERENCES personas.funcionario(id);


--
-- Name: vuelto_usuario_id_fkey; Type: FK CONSTRAINT; Schema: operaciones; Owner: franco
--

ALTER TABLE ONLY operaciones.vuelto
    ADD CONSTRAINT vuelto_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: cliente_persona_id_fkey; Type: FK CONSTRAINT; Schema: personas; Owner: franco
--

ALTER TABLE ONLY personas.cliente
    ADD CONSTRAINT cliente_persona_id_fkey FOREIGN KEY (persona_id) REFERENCES personas.persona(id);


--
-- Name: cliente_usuario_id_fkey; Type: FK CONSTRAINT; Schema: personas; Owner: franco
--

ALTER TABLE ONLY personas.cliente
    ADD CONSTRAINT cliente_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: funcionario_cargo_id_fkey; Type: FK CONSTRAINT; Schema: personas; Owner: franco
--

ALTER TABLE ONLY personas.funcionario
    ADD CONSTRAINT funcionario_cargo_id_fkey FOREIGN KEY (cargo_id) REFERENCES empresarial.cargo(id);


--
-- Name: funcionario_persona_id_fkey; Type: FK CONSTRAINT; Schema: personas; Owner: franco
--

ALTER TABLE ONLY personas.funcionario
    ADD CONSTRAINT funcionario_persona_id_fkey FOREIGN KEY (persona_id) REFERENCES personas.persona(id);


--
-- Name: funcionario_sucursal_id_fkey; Type: FK CONSTRAINT; Schema: personas; Owner: franco
--

ALTER TABLE ONLY personas.funcionario
    ADD CONSTRAINT funcionario_sucursal_id_fkey FOREIGN KEY (sucursal_id) REFERENCES empresarial.sucursal(id);


--
-- Name: funcionario_supervisado_por_id_fkey; Type: FK CONSTRAINT; Schema: personas; Owner: franco
--

ALTER TABLE ONLY personas.funcionario
    ADD CONSTRAINT funcionario_supervisado_por_id_fkey FOREIGN KEY (supervisado_por_id) REFERENCES personas.funcionario(id);


--
-- Name: funcionario_usuario_id_fkey; Type: FK CONSTRAINT; Schema: personas; Owner: franco
--

ALTER TABLE ONLY personas.funcionario
    ADD CONSTRAINT funcionario_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: grupo_privilegio_id_fkey; Type: FK CONSTRAINT; Schema: personas; Owner: franco
--

ALTER TABLE ONLY personas.usuario_grupo
    ADD CONSTRAINT grupo_privilegio_id_fkey FOREIGN KEY (grupo_privilegio_id) REFERENCES personas.grupo_privilegio(id);


--
-- Name: persona_ciudad_id_fkey; Type: FK CONSTRAINT; Schema: personas; Owner: franco
--

ALTER TABLE ONLY personas.persona
    ADD CONSTRAINT persona_ciudad_id_fkey FOREIGN KEY (ciudad_id) REFERENCES general.ciudad(id);


--
-- Name: persona_usuario_id_fkey; Type: FK CONSTRAINT; Schema: personas; Owner: franco
--

ALTER TABLE ONLY personas.persona
    ADD CONSTRAINT persona_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: proveedor_dias_visita_proveedor_id_fkey; Type: FK CONSTRAINT; Schema: personas; Owner: franco
--

ALTER TABLE ONLY personas.proveedor_dias_visita
    ADD CONSTRAINT proveedor_dias_visita_proveedor_id_fkey FOREIGN KEY (proveedor_id) REFERENCES personas.proveedor(id);


--
-- Name: proveedor_dias_visita_usuario_id_fkey; Type: FK CONSTRAINT; Schema: personas; Owner: franco
--

ALTER TABLE ONLY personas.proveedor_dias_visita
    ADD CONSTRAINT proveedor_dias_visita_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: proveedor_funcionario_encargado_id_fkey; Type: FK CONSTRAINT; Schema: personas; Owner: franco
--

ALTER TABLE ONLY personas.proveedor
    ADD CONSTRAINT proveedor_funcionario_encargado_id_fkey FOREIGN KEY (funcionario_encargado_id) REFERENCES personas.funcionario(id);


--
-- Name: proveedor_persona_id_fkey; Type: FK CONSTRAINT; Schema: personas; Owner: franco
--

ALTER TABLE ONLY personas.proveedor
    ADD CONSTRAINT proveedor_persona_id_fkey FOREIGN KEY (persona_id) REFERENCES personas.persona(id);


--
-- Name: proveedor_usuario_id_fkey; Type: FK CONSTRAINT; Schema: personas; Owner: franco
--

ALTER TABLE ONLY personas.proveedor
    ADD CONSTRAINT proveedor_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: role_fk; Type: FK CONSTRAINT; Schema: personas; Owner: franco
--

ALTER TABLE ONLY personas.role
    ADD CONSTRAINT role_fk FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: usuario_id_fkey; Type: FK CONSTRAINT; Schema: personas; Owner: franco
--

ALTER TABLE ONLY personas.grupo_privilegio
    ADD CONSTRAINT usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: usuario_id_fkey; Type: FK CONSTRAINT; Schema: personas; Owner: franco
--

ALTER TABLE ONLY personas.usuario_grupo
    ADD CONSTRAINT usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: usuario_persona_id_fkey; Type: FK CONSTRAINT; Schema: personas; Owner: franco
--

ALTER TABLE ONLY personas.usuario
    ADD CONSTRAINT usuario_persona_id_fkey FOREIGN KEY (persona_id) REFERENCES personas.persona(id);


--
-- Name: usuario_role_fk; Type: FK CONSTRAINT; Schema: personas; Owner: franco
--

ALTER TABLE ONLY personas.usuario_role
    ADD CONSTRAINT usuario_role_fk FOREIGN KEY (role_id) REFERENCES personas.role(id);


--
-- Name: usuario_role_fk_1; Type: FK CONSTRAINT; Schema: personas; Owner: franco
--

ALTER TABLE ONLY personas.usuario_role
    ADD CONSTRAINT usuario_role_fk_1 FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: usuario_role_fk_2; Type: FK CONSTRAINT; Schema: personas; Owner: franco
--

ALTER TABLE ONLY personas.usuario_role
    ADD CONSTRAINT usuario_role_fk_2 FOREIGN KEY (user_id) REFERENCES personas.usuario(id);


--
-- Name: usuario_usuario_id_fkey; Type: FK CONSTRAINT; Schema: personas; Owner: franco
--

ALTER TABLE ONLY personas.usuario
    ADD CONSTRAINT usuario_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: vendedor_persona_id_fkey; Type: FK CONSTRAINT; Schema: personas; Owner: franco
--

ALTER TABLE ONLY personas.vendedor
    ADD CONSTRAINT vendedor_persona_id_fkey FOREIGN KEY (persona_id) REFERENCES personas.persona(id);


--
-- Name: vendedor_proveedor_proveedor_id_fkey; Type: FK CONSTRAINT; Schema: personas; Owner: franco
--

ALTER TABLE ONLY personas.vendedor_proveedor
    ADD CONSTRAINT vendedor_proveedor_proveedor_id_fkey FOREIGN KEY (proveedor_id) REFERENCES personas.proveedor(id);


--
-- Name: vendedor_proveedor_usuario_id_fkey; Type: FK CONSTRAINT; Schema: personas; Owner: franco
--

ALTER TABLE ONLY personas.vendedor_proveedor
    ADD CONSTRAINT vendedor_proveedor_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: vendedor_proveedor_vendedor_id_fkey; Type: FK CONSTRAINT; Schema: personas; Owner: franco
--

ALTER TABLE ONLY personas.vendedor_proveedor
    ADD CONSTRAINT vendedor_proveedor_vendedor_id_fkey FOREIGN KEY (vendedor_id) REFERENCES personas.vendedor(id);


--
-- Name: vendedor_usuario_id_fkey; Type: FK CONSTRAINT; Schema: personas; Owner: franco
--

ALTER TABLE ONLY personas.vendedor
    ADD CONSTRAINT vendedor_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: codigo_fk; Type: FK CONSTRAINT; Schema: productos; Owner: franco
--

ALTER TABLE ONLY productos.codigo
    ADD CONSTRAINT codigo_fk FOREIGN KEY (presentacion_id) REFERENCES productos.presentacion(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: codigo_tipo_precio_fk; Type: FK CONSTRAINT; Schema: productos; Owner: franco
--

ALTER TABLE ONLY productos.codigo_tipo_precio
    ADD CONSTRAINT codigo_tipo_precio_fk FOREIGN KEY (codigo_id) REFERENCES productos.codigo(id);


--
-- Name: codigo_tipo_precio_fk_1; Type: FK CONSTRAINT; Schema: productos; Owner: franco
--

ALTER TABLE ONLY productos.codigo_tipo_precio
    ADD CONSTRAINT codigo_tipo_precio_fk_1 FOREIGN KEY (id) REFERENCES productos.tipo_precio(id);


--
-- Name: codigo_tipo_precio_fk_2; Type: FK CONSTRAINT; Schema: productos; Owner: franco
--

ALTER TABLE ONLY productos.codigo_tipo_precio
    ADD CONSTRAINT codigo_tipo_precio_fk_2 FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: codigo_usuario_id_fkey; Type: FK CONSTRAINT; Schema: productos; Owner: franco
--

ALTER TABLE ONLY productos.codigo
    ADD CONSTRAINT codigo_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: costos_por_sucursal_moneda_id_fkey; Type: FK CONSTRAINT; Schema: productos; Owner: franco
--

ALTER TABLE ONLY productos.costo_por_producto
    ADD CONSTRAINT costos_por_sucursal_moneda_id_fkey FOREIGN KEY (moneda_id) REFERENCES financiero.moneda(id);


--
-- Name: costos_por_sucursal_movimiento_stock_id_fkey; Type: FK CONSTRAINT; Schema: productos; Owner: franco
--

ALTER TABLE ONLY productos.costo_por_producto
    ADD CONSTRAINT costos_por_sucursal_movimiento_stock_id_fkey FOREIGN KEY (movimiento_stock_id) REFERENCES operaciones.movimiento_stock(id);


--
-- Name: costos_por_sucursal_producto_id_fkey; Type: FK CONSTRAINT; Schema: productos; Owner: franco
--

ALTER TABLE ONLY productos.costo_por_producto
    ADD CONSTRAINT costos_por_sucursal_producto_id_fkey FOREIGN KEY (producto_id) REFERENCES productos.producto(id);


--
-- Name: costos_por_sucursal_sucursal_id_fkey; Type: FK CONSTRAINT; Schema: productos; Owner: franco
--

ALTER TABLE ONLY productos.costo_por_producto
    ADD CONSTRAINT costos_por_sucursal_sucursal_id_fkey FOREIGN KEY (sucursal_id) REFERENCES empresarial.sucursal(id);


--
-- Name: costos_por_sucursal_usuario_id_fkey; Type: FK CONSTRAINT; Schema: productos; Owner: franco
--

ALTER TABLE ONLY productos.costo_por_producto
    ADD CONSTRAINT costos_por_sucursal_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: familia_usuario_id_fkey; Type: FK CONSTRAINT; Schema: productos; Owner: franco
--

ALTER TABLE ONLY productos.familia
    ADD CONSTRAINT familia_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: pdv_categoria_usuario_id_fkey; Type: FK CONSTRAINT; Schema: productos; Owner: franco
--

ALTER TABLE ONLY productos.pdv_categoria
    ADD CONSTRAINT pdv_categoria_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: pdv_grupo_categoria_id_fkey; Type: FK CONSTRAINT; Schema: productos; Owner: franco
--

ALTER TABLE ONLY productos.pdv_grupo
    ADD CONSTRAINT pdv_grupo_categoria_id_fkey FOREIGN KEY (categoria_id) REFERENCES productos.pdv_categoria(id);


--
-- Name: pdv_grupo_usuario_id_fkey; Type: FK CONSTRAINT; Schema: productos; Owner: franco
--

ALTER TABLE ONLY productos.pdv_grupo
    ADD CONSTRAINT pdv_grupo_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: pdv_grupos_productos_grupo_id_fkey; Type: FK CONSTRAINT; Schema: productos; Owner: franco
--

ALTER TABLE ONLY productos.pdv_grupos_productos
    ADD CONSTRAINT pdv_grupos_productos_grupo_id_fkey FOREIGN KEY (grupo_id) REFERENCES productos.pdv_grupo(id);


--
-- Name: pdv_grupos_productos_producto_id_fkey; Type: FK CONSTRAINT; Schema: productos; Owner: franco
--

ALTER TABLE ONLY productos.pdv_grupos_productos
    ADD CONSTRAINT pdv_grupos_productos_producto_id_fkey FOREIGN KEY (producto_id) REFERENCES productos.producto(id);


--
-- Name: pdv_grupos_productos_usuario_id_fkey; Type: FK CONSTRAINT; Schema: productos; Owner: franco
--

ALTER TABLE ONLY productos.pdv_grupos_productos
    ADD CONSTRAINT pdv_grupos_productos_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: precio_por_sucursal_fk; Type: FK CONSTRAINT; Schema: productos; Owner: franco
--

ALTER TABLE ONLY productos.precio_por_sucursal
    ADD CONSTRAINT precio_por_sucursal_fk FOREIGN KEY (presentacion_id) REFERENCES productos.presentacion(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: precio_por_sucursal_fk_1; Type: FK CONSTRAINT; Schema: productos; Owner: franco
--

ALTER TABLE ONLY productos.precio_por_sucursal
    ADD CONSTRAINT precio_por_sucursal_fk_1 FOREIGN KEY (tipo_precio_id) REFERENCES productos.tipo_precio(id);


--
-- Name: precio_por_sucursal_sucursal_id_fkey; Type: FK CONSTRAINT; Schema: productos; Owner: franco
--

ALTER TABLE ONLY productos.precio_por_sucursal
    ADD CONSTRAINT precio_por_sucursal_sucursal_id_fkey FOREIGN KEY (sucursal_id) REFERENCES empresarial.sucursal(id);


--
-- Name: precio_por_sucursal_usuario_id_fkey; Type: FK CONSTRAINT; Schema: productos; Owner: franco
--

ALTER TABLE ONLY productos.precio_por_sucursal
    ADD CONSTRAINT precio_por_sucursal_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: presentacion_fk; Type: FK CONSTRAINT; Schema: productos; Owner: franco
--

ALTER TABLE ONLY productos.presentacion
    ADD CONSTRAINT presentacion_fk FOREIGN KEY (tipo_presentacion_id) REFERENCES productos.tipo_presentacion(id);


--
-- Name: presentacion_fk_1; Type: FK CONSTRAINT; Schema: productos; Owner: franco
--

ALTER TABLE ONLY productos.presentacion
    ADD CONSTRAINT presentacion_fk_1 FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: presentacion_fk_producto; Type: FK CONSTRAINT; Schema: productos; Owner: franco
--

ALTER TABLE ONLY productos.presentacion
    ADD CONSTRAINT presentacion_fk_producto FOREIGN KEY (producto_id) REFERENCES productos.producto(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: producto_imagen_producto_id_fkey; Type: FK CONSTRAINT; Schema: productos; Owner: franco
--

ALTER TABLE ONLY productos.producto_imagen
    ADD CONSTRAINT producto_imagen_producto_id_fkey FOREIGN KEY (producto_id) REFERENCES productos.producto(id);


--
-- Name: producto_imagen_usuario_id_fkey; Type: FK CONSTRAINT; Schema: productos; Owner: franco
--

ALTER TABLE ONLY productos.producto_imagen
    ADD CONSTRAINT producto_imagen_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: producto_proveedor_pedido_id_fkey; Type: FK CONSTRAINT; Schema: productos; Owner: franco
--

ALTER TABLE ONLY productos.producto_proveedor
    ADD CONSTRAINT producto_proveedor_pedido_id_fkey FOREIGN KEY (pedido_id) REFERENCES operaciones.pedido(id);


--
-- Name: producto_proveedor_producto_id_fkey; Type: FK CONSTRAINT; Schema: productos; Owner: franco
--

ALTER TABLE ONLY productos.producto_proveedor
    ADD CONSTRAINT producto_proveedor_producto_id_fkey FOREIGN KEY (producto_id) REFERENCES productos.producto(id);


--
-- Name: producto_proveedor_proveedor_id_fkey; Type: FK CONSTRAINT; Schema: productos; Owner: franco
--

ALTER TABLE ONLY productos.producto_proveedor
    ADD CONSTRAINT producto_proveedor_proveedor_id_fkey FOREIGN KEY (proveedor_id) REFERENCES personas.proveedor(id);


--
-- Name: producto_proveedor_usuario_id_fkey; Type: FK CONSTRAINT; Schema: productos; Owner: franco
--

ALTER TABLE ONLY productos.producto_proveedor
    ADD CONSTRAINT producto_proveedor_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: producto_sub_familia_id_fkey; Type: FK CONSTRAINT; Schema: productos; Owner: franco
--

ALTER TABLE ONLY productos.producto
    ADD CONSTRAINT producto_sub_familia_id_fkey FOREIGN KEY (sub_familia_id) REFERENCES productos.subfamilia(id);


--
-- Name: productos_por_sucursal_producto_id_fkey; Type: FK CONSTRAINT; Schema: productos; Owner: franco
--

ALTER TABLE ONLY productos.producto_por_sucursal
    ADD CONSTRAINT productos_por_sucursal_producto_id_fkey FOREIGN KEY (producto_id) REFERENCES productos.producto(id);


--
-- Name: productos_por_sucursal_sucursal_id_fkey; Type: FK CONSTRAINT; Schema: productos; Owner: franco
--

ALTER TABLE ONLY productos.producto_por_sucursal
    ADD CONSTRAINT productos_por_sucursal_sucursal_id_fkey FOREIGN KEY (sucursal_id) REFERENCES empresarial.sucursal(id);


--
-- Name: productos_por_sucursal_usuario_id_fkey; Type: FK CONSTRAINT; Schema: productos; Owner: franco
--

ALTER TABLE ONLY productos.producto_por_sucursal
    ADD CONSTRAINT productos_por_sucursal_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: subfamilia_familia_id_fkey; Type: FK CONSTRAINT; Schema: productos; Owner: franco
--

ALTER TABLE ONLY productos.subfamilia
    ADD CONSTRAINT subfamilia_familia_id_fkey FOREIGN KEY (familia_id) REFERENCES productos.familia(id);


--
-- Name: subfamilia_subfamiliafk; Type: FK CONSTRAINT; Schema: productos; Owner: franco
--

ALTER TABLE ONLY productos.subfamilia
    ADD CONSTRAINT subfamilia_subfamiliafk FOREIGN KEY (sub_familia_id) REFERENCES productos.subfamilia(id) ON DELETE CASCADE;


--
-- Name: subfamilia_usuario_id_fkey; Type: FK CONSTRAINT; Schema: productos; Owner: franco
--

ALTER TABLE ONLY productos.subfamilia
    ADD CONSTRAINT subfamilia_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: tipo_precio_usuario_id_fkey; Type: FK CONSTRAINT; Schema: productos; Owner: franco
--

ALTER TABLE ONLY productos.tipo_precio
    ADD CONSTRAINT tipo_precio_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: tipo_presentacion_fk; Type: FK CONSTRAINT; Schema: productos; Owner: franco
--

ALTER TABLE ONLY productos.tipo_presentacion
    ADD CONSTRAINT tipo_presentacion_fk FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: marca_usuario_id_fkey; Type: FK CONSTRAINT; Schema: vehiculos; Owner: franco
--

ALTER TABLE ONLY vehiculos.marca
    ADD CONSTRAINT marca_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: modelo_marca_id_fkey; Type: FK CONSTRAINT; Schema: vehiculos; Owner: franco
--

ALTER TABLE ONLY vehiculos.modelo
    ADD CONSTRAINT modelo_marca_id_fkey FOREIGN KEY (marca_id) REFERENCES vehiculos.marca(id);


--
-- Name: modelo_usuario_id_fkey; Type: FK CONSTRAINT; Schema: vehiculos; Owner: franco
--

ALTER TABLE ONLY vehiculos.modelo
    ADD CONSTRAINT modelo_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: tipo_vehiculo_usuario_id_fkey; Type: FK CONSTRAINT; Schema: vehiculos; Owner: franco
--

ALTER TABLE ONLY vehiculos.tipo_vehiculo
    ADD CONSTRAINT tipo_vehiculo_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: vehiculo_modelo_fk; Type: FK CONSTRAINT; Schema: vehiculos; Owner: franco
--

ALTER TABLE ONLY vehiculos.vehiculo
    ADD CONSTRAINT vehiculo_modelo_fk FOREIGN KEY (modelo_id) REFERENCES vehiculos.modelo(id);


--
-- Name: vehiculo_sucursal_responsable_id_fkey; Type: FK CONSTRAINT; Schema: vehiculos; Owner: franco
--

ALTER TABLE ONLY vehiculos.vehiculo_sucursal
    ADD CONSTRAINT vehiculo_sucursal_responsable_id_fkey FOREIGN KEY (responsable_id) REFERENCES personas.funcionario(id);


--
-- Name: vehiculo_sucursal_sucursal_id_fkey; Type: FK CONSTRAINT; Schema: vehiculos; Owner: franco
--

ALTER TABLE ONLY vehiculos.vehiculo_sucursal
    ADD CONSTRAINT vehiculo_sucursal_sucursal_id_fkey FOREIGN KEY (sucursal_id) REFERENCES empresarial.sucursal(id);


--
-- Name: vehiculo_sucursal_usuario_id_fkey; Type: FK CONSTRAINT; Schema: vehiculos; Owner: franco
--

ALTER TABLE ONLY vehiculos.vehiculo_sucursal
    ADD CONSTRAINT vehiculo_sucursal_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: vehiculo_tipo_vehiculo_fkey; Type: FK CONSTRAINT; Schema: vehiculos; Owner: franco
--

ALTER TABLE ONLY vehiculos.vehiculo
    ADD CONSTRAINT vehiculo_tipo_vehiculo_fkey FOREIGN KEY (tipo_vehiculo) REFERENCES vehiculos.vehiculo(id);


--
-- Name: vehiculo_usuario_id_fkey; Type: FK CONSTRAINT; Schema: vehiculos; Owner: franco
--

ALTER TABLE ONLY vehiculos.vehiculo
    ADD CONSTRAINT vehiculo_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES personas.usuario(id);


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: franco
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM franco;
GRANT ALL ON SCHEMA public TO franco;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

