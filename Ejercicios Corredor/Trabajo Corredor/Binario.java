public class Binario {
    byte[] imagen = {1, 0, 1, 0};
    byte[] audio = {10, 20, 30};
    byte[] video = {50, 60, 70};
    byte[] archivo = {65, 66, 67};
    byte[] clave = {1, 1, 0, 1};

    public int contarBytes(byte[] data) { return data.length; }
    public byte obtenerPrimerByte(byte[] data) { return data[0]; }
    public boolean esVacio(byte[] data) { return data.length == 0; }
    public byte sumarBytes(byte a, byte b) { return (byte)(a + b); }
    public byte[] duplicar(byte[] data) { return new byte[]{data[0], data[0]}; }
}
