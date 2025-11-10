public class Binario {
    public byte[] Imagen = { 1, 0, 1, 0 };
    public byte[] Audio = { 10, 20, 30 };
    public byte[] Video = { 50, 60, 70 };
    public byte[] Archivo = { 65, 66, 67 };
    public byte[] Clave = { 1, 1, 0, 1 };

    public int ContarBytes(byte[] data) => data.Length;
    public byte ObtenerPrimerByte(byte[] data) => data[0];
    public bool EsVacio(byte[] data) => data.Length == 0;
    public byte SumarBytes(byte a, byte b) => (byte)(a + b);
    public byte[] Duplicar(byte[] data) => new byte[] { data[0], data[0] };
}
