
class Radio implements Dispositivo {
    @Override
    public void encender() {
        System.out.println("Radio encendida");
    }

    @Override
    public void apagar() {
        System.out.println("Radio apagada");
    }

    @Override
    public void setVolumen(int nivel) {
        System.out.println("Volumen de Radio ajustado a " + nivel);
    }
}
