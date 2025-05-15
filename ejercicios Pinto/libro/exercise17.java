import java.util.Scanner;

public class exercise17 {
    public static void main(String[] args) {
        int NumeroEnteroDE2DIgitos;  
        int cocienteEntero;  
        int Residuo;  
        int numeroDeDecenas;   
        int NumeroDeUnidades;   
        
        
        Scanner teclado = new Scanner(System.in);
        
        
        System.out.print("Ingrese un número entero de 2 dígitos: ");
        NumeroEnteroDE2DIgitos =teclado.nextInt();
        
      
        if (NumeroEnteroDE2DIgitos < 10 || NumeroEnteroDE2DIgitos> 99) {
            System.out.println("Error: Debe ingresar un número de 2 dígitos (10-99)");
            teclado.close();
            return;
        }
        
        cocienteEntero = NumeroEnteroDE2DIgitos / 10;
        Residuo = NumeroEnteroDE2DIgitos - (cocienteEntero* 10);
        numeroDeDecenas = cocienteEntero;
        NumeroDeUnidades = Residuo;
        
       
        System.out.println("Número de Decenas: " + numeroDeDecenas);
        System.out.println("Número de Unidades: " + NumeroDeUnidades);
        
        
        teclado.close();
    }
}