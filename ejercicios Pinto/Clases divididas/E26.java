public class E26 {
    public static void fibonacci() {
        System.out.println("Términos de la serie Fibonacci menores a 100000:");
        long a = 0, b = 1;
        System.out.print(a + " ");
        while (b < 100000) {
            System.out.print(b + " ");
            long temp = a + b;
            a = b;
            b = temp;
        }
        System.out.println();
    }
}
