// Uso
public class Main {
    public static void main(String[] args) {
        Dispositivo tv = new TV();
        ControlRemoto controlBasico = new ControlRemotoBasico(tv);
        controlBasico.encender();
        controlBasico.apagar();

        Dispositivo radio = new Radio();
        ControlRemoto controlAvanzado = new ControlRemotoAvanzado(radio);
        controlAvanzado.encender();
        ((ControlRemotoAvanzado) controlAvanzado).ajustarVolumen(50);
        controlAvanzado.apagar();
    }
}