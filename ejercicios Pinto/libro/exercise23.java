public class exercise23 {
    public static void main(String[] args) {
   
   
           int cociente, Residuo, K; 
           int Numero = 1;    
   
           
           K = 0;
           while (K < 10) {
               cociente = Numero / 2;
               Residuo = Numero - (cociente * 2); 
   
               if (Residuo != 0) {
                   System.out.println(Numero);
                   K++;
               }
   
               Numero++;
           }
   
       }
   }