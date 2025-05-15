import java.util.Scanner;

public class exercise8 {

    public static void main(String[] args) {
        Scanner teclado = new Scanner(System.in);

        double AbcsiaDeA;
        double AbcsiaDeB;
        double OrdenadaA;
        double OrdenadaB;
        double distancia;

        System.out.println("Ingrese la abscisa del punto A:");
        AbcsiaDeA = teclado.nextDouble();

        System.out.println("Ingrese la abscisa del punto B:");
        AbcsiaDeB = teclado.nextDouble();

        System.out.println("Ingrese la ordenada del punto A:");
        OrdenadaA = teclado.nextDouble();

        System.out.println("Ingrese la ordenada del punto B:");
        OrdenadaB = teclado.nextDouble();

        distancia = Math.sqrt(Math.pow((AbcsiaDeB - AbcsiaDeA), 2) + Math.pow((OrdenadaB - OrdenadaA), 2));

        System.out.println("La distancia entre los puntos A y B es: " + distancia);

        teclado.close();
    }
}