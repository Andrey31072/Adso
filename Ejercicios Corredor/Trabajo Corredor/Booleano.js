class Booleano {
  activo = true;
  encendido = false;
  aprobado = true;
  disponible = false;
  visible = true;

  esVerdadero(valor) { return valor; }
  negacion(valor) { return !valor; }
  ambosVerdaderos(a, b) { return a && b; }
  algunoVerdadero(a, b) { return a || b; }
  iguales(a, b) { return a === b; }
}
