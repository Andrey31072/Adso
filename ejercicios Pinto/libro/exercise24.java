public class exercise24 {
    public static void main(String[] args) {
      
        int Serie = 1;

        System.out.println("Términos de la serie menores a 1000:");

        while (Serie < 1000) {
            System.out.println(Serie);
            Serie= (Serie * Serie) + 1;
        }
    }
}

