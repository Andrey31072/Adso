import java.util.Scanner;

public class exercise18 {
    public static void main(String[] args) {
       
        int NumeroEntero; 
        int cocienteEntero;  
        int Residuo;     
        String Mensaje; 
        
        Scanner teclado  = new Scanner(System.in);
        
        System.out.print("Ingrese un número entero: ");
        NumeroEntero = teclado.nextInt();
        
     
        cocienteEntero = NumeroEntero / 2;
        Residuo = NumeroEntero - (cocienteEntero * 2);

        if (Residuo == 0) {
            Mensaje = "Es Par";
        } else {
            Mensaje= "Es Impar";
        }
        
     
        System.out.println(Mensaje);
        
        
        teclado.close();
    }
}