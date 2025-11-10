public class Booleano {
    public bool Activo = true;
    public bool Encendido = false;
    public bool Aprobado = true;
    public bool Disponible = false;
    public bool Visible = true;

    public bool EsVerdadero(bool valor) => valor;
    public bool Negacion(bool valor) => !valor;
    public bool AmbosVerdaderos(bool a, bool b) => a && b;
    public bool AlgunoVerdadero(bool a, bool b) => a || b;
    public bool Iguales(bool a, bool b) => a == b;
}
