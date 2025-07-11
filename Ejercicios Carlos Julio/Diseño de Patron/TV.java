// Implementaciones concretas
class TV implements Dispositivo {
    @Override
    public void encender() {
        System.out.println("TV encendida");
    }

    @Override
    public void apagar() {
        System.out.println("TV apagada");
    }

    @Override
    public void setVolumen(int nivel) {
        System.out.println("Volumen de TV ajustado a " + nivel);
    }
}