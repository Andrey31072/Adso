import java.util.Scanner;

public class exercise1 {
    public static void main(String[] args) {
        Scanner teclado = new Scanner(System.in);

     
        System.out.print("Introduce la velocidad constante (m/s): ");
        int velocidadConstante = teclado.nextInt();

        System.out.print("Introduce el tiempo (segundos): ");
        int tiempo = teclado.nextInt();

        
        int distancia = velocidadConstante * tiempo;

        System.out.println("La distancia recorrida es: " + distancia + " km");

        teclado.close();
    }
}
