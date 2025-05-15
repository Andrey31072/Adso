import java.util.Scanner;

public class exercise20 {
    public static void main(String[] args) {
        
        int NumeroDeEmpleados; 
        double SueldoDelEmpleado; 
        int K; // Contador
        double SumaDeSueldos;
        double SueldoPromedio; 

       
        Scanner teclado = new Scanner(System.in);

       
        System.out.print("Ingrese el número de empleados: ");
        NumeroDeEmpleados = teclado.nextInt();

      
        if (NumeroDeEmpleados <= 0) {
            System.out.println("Error: El número de empleados debe ser positivo");
            teclado.close();
            return;
        }

       
        SumaDeSueldos = 0;

       
        for (K = 1; K <= NumeroDeEmpleados; K++) {
            System.out.print("Ingrese el sueldo del empleado " + K + ": ");
            SueldoDelEmpleado = teclado.nextDouble();
            SumaDeSueldos = SumaDeSueldos + SueldoDelEmpleado;
        }

       
        SueldoPromedio = SumaDeSueldos / NumeroDeEmpleados;

    
        System.out.println("El sueldo promedio es: " + SueldoPromedio);

     teclado.close();
    }
}