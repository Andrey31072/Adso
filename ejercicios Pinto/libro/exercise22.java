import java.util.Scanner;

public class exercise22 {

    public static void main(String[] args) {
        Scanner teclado = new Scanner(System.in);

        int PrimereNumero; 
        int SegundoNumero;  
        int K; //contador  
        int Producto = 0; 
        System.out.print("Ingrese el primer número: ");
        PrimereNumero = teclado.nextInt();

        System.out.print("Ingrese el segundo número: ");
        SegundoNumero= teclado.nextInt();

        for (K = 1; K <= SegundoNumero; K++) {
            Producto = Producto + PrimereNumero;
        }

        
        System.out.println("El producto por sumas sucesivas es: " + Producto);

        

        teclado.close();
    }
}
