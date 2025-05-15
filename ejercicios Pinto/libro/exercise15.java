import java.util.Scanner;

public class exercise15 {

    public static void main(String[] args) {
        Scanner teclado = new Scanner(System.in);

        double MontoDeVenta;  
        double TotalDeBonificacion;  

    
        System.out.println("Ingrese el monto de venta mensual:");
        MontoDeVenta = teclado.nextDouble();

        
        if (MontoDeVenta >= 0 && MontoDeVenta < 1000) {
            TotalDeBonificacion = (0 * MontoDeVenta) / 100;
        } else if (MontoDeVenta >= 1000 && MontoDeVenta< 5000) {
            TotalDeBonificacion = (3 * MontoDeVenta) / 100;
        } else if (MontoDeVenta >= 5000 && MontoDeVenta < 20000) {
            TotalDeBonificacion = (5 * MontoDeVenta) / 100;
        } else if (MontoDeVenta >= 20000) {
            TotalDeBonificacion = (8 * MontoDeVenta) / 100;
        } else {
            
            TotalDeBonificacion = 0;
            System.out.println("Monto inválido. Debe ser mayor o igual a 0.");
        }

        
        if (MontoDeVenta >= 0) {
            System.out.println("La bonificación correspondiente es: $" + TotalDeBonificacion);
        }

        teclado.close();
    }
}