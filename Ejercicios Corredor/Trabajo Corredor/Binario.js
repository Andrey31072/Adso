class Binario {
  imagen = new Uint8Array([1, 0, 1, 0]);
  audio = new Uint8Array([10, 20, 30]);
  video = new Uint8Array([50, 60, 70]);
  archivo = new Uint8Array([65, 66, 67]);
  clave = new Uint8Array([1, 1, 0, 1]);

  contarBytes(data) { return data.length; }
  obtenerPrimerByte(data) { return data[0]; }
  esVacio(data) { return data.length === 0; }
  sumarBytes(a, b) { return a + b; }
  duplicar(data) { return new Uint8Array([data[0], data[0]]); }
}
