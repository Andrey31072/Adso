import java.util.Scanner;

public class exercise11 {
    public static void main(String[] args) {
     
        double ProducciónDelDiaLunes; 
        double ProducciónDelDiaMartes;
        double ProducciónDelDiaMiercoles; 
        double ProducciónDelDiaJueves;
        double ProducciónDelDiaViernes; 
        double ProducciónDelDiaSabado;
        double ProducciónTotal; 
        double ProducciónPromedio;
        String Mensaje;

        
        Scanner teclado = new Scanner(System.in);

        
        System.out.print("Ingrese la producción del día Lunes: ");
        ProducciónDelDiaLunes = teclado.nextDouble();

       
        System.out.print("Ingrese la producción del día Martes: ");
        ProducciónDelDiaMartes = teclado.nextDouble();

       
        System.out.print("Ingrese la producción del día Miércoles: ");
        ProducciónDelDiaMiercoles = teclado.nextDouble();

        
        System.out.print("Ingrese la producción del día Jueves: ");
        ProducciónDelDiaJueves = teclado.nextDouble();

        
        System.out.print("Ingrese la producción del día Viernes: ");
        ProducciónDelDiaViernes = teclado.nextDouble();

        
        System.out.print("Ingrese la producción del día Sábado: ");
        ProducciónDelDiaSabado = teclado.nextDouble();

      
        ProducciónTotal = ProducciónDelDiaLunes + ProducciónDelDiaMartes + ProducciónDelDiaMiercoles
                + ProducciónDelDiaJueves + ProducciónDelDiaViernes + ProducciónDelDiaSabado;
        ProducciónPromedio = ProducciónTotal / 6;

        
        if (ProducciónPromedio >= 100) {
            Mensaje = "Recibirá Incentivos";
        } else {
            Mensaje = "No Recibirá Incentivos";
        }

       
        System.out.println("Producción Total: " + ProducciónTotal);
        System.out.println("Producción Promedio: " + ProducciónPromedio);
        System.out.println("Mensaje: " + Mensaje);

       
        teclado.close();
    }
}