import java.util.Scanner;
public class exercise9 {

    public static void main(String[] args) {
        Scanner teclado = new Scanner(System.in);
        int AñoDeNacimiento;
        int AñoActual;
        int Edad;

        System.out.println("Ingrese el año de nacimiento:");
        AñoDeNacimiento= teclado.nextInt();

        System.out.println("Ingrese el año actual:");
        AñoActual = teclado.nextInt();

        Edad = AñoActual - AñoDeNacimiento;

        if (Edad > 17) {
            System.out.println("Debe solicitar su CUIL");
        } else {
            System.out.println("No debe solicitar su CUIL por el momento");
        }

        teclado.close();
    
}

}