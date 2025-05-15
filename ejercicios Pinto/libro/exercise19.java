public class exercise19 {
    
    public static void main(String[] args) {
     
        int K;  // Contador
        int Numero; 
        
     
        Numero = 2;
        System.out.println("Valor inicial: " + Numero);
        
    
        for (K = 1; K <= 4; K++) {
            Numero = Numero+ 2;
            System.out.println("Valor " + K + ": " + Numero);
        }
    }
}