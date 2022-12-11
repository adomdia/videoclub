<?php

namespace App\Tablas;

use PDO;

class Pelicula extends Modelo
{
    protected static string $tabla = 'peliculas';

    public $id;
    private $codigo;
    private $descripcion;
    private $prestada;

    public function __construct(array $campos)
    {
        $this->id = $campos['id'];
        $this->codigo = $campos['codigo'];
        $this->descripcion = $campos['descripcion'];
        $this->prestada = false;
    }

    public static function existe(int $id, ?PDO $pdo = null): bool
    {
        return static::obtener($id, $pdo) !== null;
    }

    public function getCodigo()
    {
        return $this->codigo;
    }

    public function getDescripcion()
    {
        return $this->descripcion;
    }

    public function prestar()
    {
        $this->prestada = true;
    }

    public function devolver()
    {
        $this->prestada = false;
    }

    public function getPrestada()
    {
        return $this->prestada;
    }
}
