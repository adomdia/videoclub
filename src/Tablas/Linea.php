<?php

namespace App\Tablas;

use App\Tablas\Pelicula;

class Linea extends Modelo
{
    private Pelicula $peliculas;

    public function __construct(array $campos)
    {
        $this->peliculas = Pelicula::obtener($campos['pelicula_id']);
    }

    public function getPelicula(): Pelicula
    {
        return $this->peliculas;
    }
}
