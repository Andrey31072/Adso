public class Texto {
    public string Nombre = "Kevin";
    public string Apellido = "Andrey";
    public string Ciudad = "Bogotá";
    public string Pais = "Colombia";
    public string Profesion = "Desarrollador";

    public string Concatenar(string a, string b) => $"{a} {b}";
    public int Contar(string texto) => texto.Length;
    public string Mayuscula(string texto) => texto.ToUpper();
    public string Minuscula(string texto) => texto.ToLower();
    public bool Contiene(string texto, string palabra) => texto.Contains(palabra);
}
