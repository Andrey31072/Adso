
import java.util.Scanner;

public class exercise2 {
    public static void main(String[] args) {
        Scanner teclado = new Scanner(System.in);    
        
        System.out.print("introduce la primera nota : ");
        int number1 = teclado .nextInt();

        System.out.print("introduce la primera nota : ");
        int number2 = teclado.nextInt();

        System.out.print("introduce la primera nota : ");
        int number3 = teclado.nextInt();

        int promedio = (number1 +number2+ number3)/3;

        System.out.println("el promedio es : "+ promedio  );

 teclado.close();       
    }
    
}