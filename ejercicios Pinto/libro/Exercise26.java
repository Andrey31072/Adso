public class Exercise26 {

    public static void main(String[] args) {
        int PrimerNumero = 0;
        int SegundoNumero = 1;
        int TercerNumero = PrimerNumero + SegundoNumero;

        System.out.println(PrimerNumero); 
        System.out.println(SegundoNumero); 

        while (TercerNumero
         < 100000) {
            System.out.println(TercerNumero); 
            PrimerNumero = SegundoNumero;
        SegundoNumero= TercerNumero;
            TercerNumero = PrimerNumero + SegundoNumero;
        }
    }
}