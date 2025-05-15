import java.util.Scanner;
public class exercise14 {

    public static void main(String[] args) {
        Scanner teclado = new Scanner(System.in);

        int NumeroEntero;   
        String EquivalenteEnRomano;      

        
        System.out.println("Ingrese un número entero entre 1 y 10:");
        NumeroEntero = teclado.nextInt();

    
        switch (NumeroEntero) {
            case 1:
                EquivalenteEnRomano = "I";
                break;
            case 2:
                EquivalenteEnRomano= "II";
                break;
            case 3:
                EquivalenteEnRomano = "III";
                break;
            case 4:
                EquivalenteEnRomano = "IV";
                break;
            case 5:
                EquivalenteEnRomano = "V";
                break;
            case 6:
                EquivalenteEnRomano= "VI";
                break;
            case 7:
                EquivalenteEnRomano = "VII";
                break;
            case 8:
                EquivalenteEnRomano = "VIII";
                break;
            case 9:
                EquivalenteEnRomano= "IX";
                break;
            case 10:
                EquivalenteEnRomano= "X";
                break;
            default:
                EquivalenteEnRomano = "Número fuera de rango (debe ser entre 1 y 10)";
        }

       
        System.out.println("Equivalente en romano: " + EquivalenteEnRomano);

        teclado.close();
    }
}