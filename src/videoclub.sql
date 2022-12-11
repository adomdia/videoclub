DROP TABLE IF EXISTS peliculas CASCADE;

CREATE TABLE peliculas (
    id          bigserial     PRIMARY KEY,
    codigo      varchar(13)   NOT NULL UNIQUE,
    descripcion varchar(255)  NOT NULL
);

DROP TABLE IF EXISTS usuarios CASCADE;

CREATE TABLE usuarios (
    id       bigserial    PRIMARY KEY,
    usuario  varchar(255) NOT NULL UNIQUE,
    password varchar(255) NOT NULL
);

DROP TABLE IF EXISTS historial CASCADE;

CREATE TABLE historial (
    id         bigserial  PRIMARY KEY,
    created_at timestamp  NOT NULL DEFAULT localtimestamp(0),
    usuario_id bigint NOT NULL REFERENCES usuarios (id)
);

DROP TABLE IF EXISTS peliculas_historial CASCADE;

CREATE TABLE peliculas_historial (
    pelicula_id bigint NOT NULL REFERENCES peliculas (id),
    historial_id  bigint NOT NULL REFERENCES historial (id),
    PRIMARY KEY (pelicula_id, historial_id)
);

-- Carga inicial de datos de prueba:

INSERT INTO peliculas (codigo, descripcion)
    VALUES ('1', 'El Club de la Lucha'),
           ('2', 'Pulp Fiction'),
           ('3', 'Joker'),
           ('4', 'El lobo de Wall Street'),
           ('5', 'Scary Movie'),
           ('6', 'Avatar'),
           ('7', 'It');

INSERT INTO usuarios (usuario, password)
    VALUES ('admin', crypt('admin', gen_salt('bf', 10))),
           ('pepe', crypt('pepe', gen_salt('bf', 10)));
