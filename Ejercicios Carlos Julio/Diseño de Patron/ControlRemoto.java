// Abstracción
abstract class ControlRemoto {
    protected Dispositivo dispositivo;

    protected ControlRemoto(Dispositivo dispositivo) {
        this.dispositivo = dispositivo;
    }

    public abstract void encender();
    public abstract void apagar();
}
