// Abstracción refinada
class ControlRemotoBasico extends ControlRemoto {
    public ControlRemotoBasico(Dispositivo dispositivo) {
        super(dispositivo);
    }

    @Override
    public void encender() {
        dispositivo.encender();
    }

    @Override
    public void apagar() {
        dispositivo.apagar();
    }
}