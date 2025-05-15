import java.util.Scanner;
import java.lang.Math;

public class exercise6 {

    public static void main(String[] args) {
        Scanner teclado = new Scanner(System.in);
        double longitudA;
        double longitudB;
        double longitudC;
        double longitudSemiperimetro;
        double area;
        System.out.println("ingrese la longitud A");
        longitudA = teclado.nextInt();

        System.out.println("ingresar la longitud B");
        longitudB = teclado.nextInt();

        System.out.println("ingresar la longitud C");
        longitudC = teclado.nextInt();

        longitudSemiperimetro = (longitudA + longitudB + longitudC) / 3;

        area = Math.sqrt(longitudSemiperimetro * (longitudSemiperimetro - longitudA)
                * (longitudSemiperimetro - longitudB) * (longitudSemiperimetro - longitudC));

        System.out.println("el area es " + area);
        teclado.close();
    }
}
