public class Divisionsegura {
    public static void main(String[] args) {
        int numerador = 20; 
        int denominador = 0; 

        if (denominador == 0) {
            System.out.println("Error: La División no se puede realizar porque hay un cero.");
        } else {
            int resultado = numerador / denominador;
            System.out.println("El resultado de la división es: " + resultado);
        }
}}