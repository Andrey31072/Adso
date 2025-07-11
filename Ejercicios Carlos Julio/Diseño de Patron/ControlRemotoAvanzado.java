class ControlRemotoAvanzado extends ControlRemoto {
    public ControlRemotoAvanzado(Dispositivo dispositivo) {
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

    public void ajustarVolumen(int nivel) {
        dispositivo.setVolumen(nivel);
    }
}

