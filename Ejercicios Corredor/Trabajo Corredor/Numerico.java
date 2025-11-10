public class Numerico {
    int edad = 25;
    double salario = 3500.75;
    float altura = 1.78f;
    long telefono = 3124567890L;
    short cantidad = 5;

    public int sumar(int a, int b) { return a + b; }
    public double promedio(double a, double b) { return (a + b) / 2; }
    public long multiplicar(long a, long b) { return a * b; }
    public float convertirMetros(float km) { return km * 1000; }
    public int restar(int a, int b) { return a - b; }
}
