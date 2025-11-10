using System.Text.Json;

public class JsonEjemplo {
    public string Usuario = "{\"nombre\":\"Kevin\",\"edad\":25}";
    public string Producto = "{\"nombre\":\"Laptop\",\"precio\":3000}";
    public string Empresa = "{\"nombre\":\"CocaCola\"}";
    public string Pais = "{\"nombre\":\"Colombia\"}";
    public string Ciudad = "{\"nombre\":\"Bogotá\"}";

    public string CrearUsuario(string nombre, int edad) =>
        JsonSerializer.Serialize(new { nombre, edad });

    public string ObtenerNombre(string json) =>
        JsonDocument.Parse(json).RootElement.GetProperty("nombre").GetString();

    public int ObtenerEdad(string json) =>
        JsonDocument.Parse(json).RootElement.GetProperty("edad").GetInt32();

    public bool TieneClave(string json, string clave) =>
        JsonDocument.Parse(json).RootElement.TryGetProperty(clave, out _);

    public int ContarClaves(string json) =>
        JsonDocument.Parse(json).RootElement.EnumerateObject().Count();
}
