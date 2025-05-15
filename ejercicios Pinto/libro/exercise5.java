import java.util.Scanner;

public class exercise5{
    public static void main(String[] args) {
        Scanner teclado = new Scanner(System.in);
 int horasTrabajadas;
 int tarifaHora;
int pago;

 System.out.println("ingresar las horas trabajadas :");
horasTrabajadas = teclado.nextInt();

System.out.println("ingrese la tarifa por hora : ");
    
tarifaHora = teclado.nextInt();

pago = horasTrabajadas*tarifaHora;
System.out.println("Su pago es "+pago);
teclado.close();
}
}