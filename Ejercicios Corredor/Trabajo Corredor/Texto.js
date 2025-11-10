class Texto {
  nombre = "Kevin";
  apellido = "Andrey";
  ciudad = "Bogotá";
  pais = "Colombia";
  profesion = "Desarrollador";

  concatenar(a, b) { return `${a} ${b}`; }
  contar(texto) { return texto.length; }
  mayuscula(texto) { return texto.toUpperCase(); }
  minuscula(texto) { return texto.toLowerCase(); }
  contiene(texto, palabra) { return texto.includes(palabra); }
}
