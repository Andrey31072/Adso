class JsonEjemplo {
  usuario = { nombre: "Kevin", edad: 25 };
  producto = { nombre: "Laptop", precio: 3000 };
  empresa = { nombre: "CocaCola" };
  pais = { nombre: "Colombia" };
  ciudad = { nombre: "Bogotá" };

  crearUsuario(nombre, edad) { return { nombre, edad }; }
  obtenerNombre(obj) { return obj.nombre; }
  obtenerEdad(obj) { return obj.edad; }
  tieneClave(obj, clave) { return clave in obj; }
  contarClaves(obj) { return Object.keys(obj).length; }
}
