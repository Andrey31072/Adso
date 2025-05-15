import java.util.Scanner;

public class exercise13 {
    public static void main(String[] args) {
        
        double PrimeroLado; 
        double SegundoLado; 
        double TercerLado; 
        String TipoDeTriangulo;
        
        
        Scanner teclado = new Scanner(System.in);
     
        System.out.print("Ingrese el primer lado del triángulo: ");
        PrimeroLado = teclado.nextDouble();
        

        System.out.print("Ingrese el segundo lado del triángulo: ");
     SegundoLado = teclado.nextDouble();
        
    
        System.out.print("Ingrese el tercer lado del triángulo: ");
        TercerLado= teclado.nextDouble();

        if ((PrimeroLado !=SegundoLado) && (SegundoLado != TercerLado) && (TercerLado != PrimeroLado)) {
            TipoDeTriangulo = "Escaleno";
        } else {
            if ((PrimeroLado == SegundoLado) && (SegundoLado == TercerLado)) {
                TipoDeTriangulo = "Equilátero";
            } else {
                TipoDeTriangulo = "Isósceles";
            }
        }
       
        System.out.println("El tipo de triángulo es: " + TipoDeTriangulo);
        
        teclado.close();
    }
}