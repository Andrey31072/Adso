import org.json.JSONObject;

public class JsonEjemplo {
    JSONObject usuario = new JSONObject("{\"nombre\":\"Kevin\",\"edad\":25}");
    JSONObject producto = new JSONObject("{\"nombre\":\"Laptop\",\"precio\":3000}");
    JSONObject empresa = new JSONObject("{\"nombre\":\"CocaCola\"}");
    JSONObject pais = new JSONObject("{\"nombre\":\"Colombia\"}");
    JSONObject ciudad = new JSONObject("{\"nombre\":\"Bogotá\"}");

    public JSONObject crearUsuario(String nombre, int edad) {
        return new JSONObject().put("nombre", nombre).put("edad", edad);
    }
    public String obtenerNombre(JSONObject obj) { return obj.getString("nombre"); }
    public int obtenerEdad(JSONObject obj) { return obj.getInt("edad"); }
    public boolean tieneClave(JSONObject obj, String clave) { return obj.has(clave); }
    public int contarClaves(JSONObject obj) { return obj.length(); }
}
