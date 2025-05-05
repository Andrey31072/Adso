public class Descuentoporcompra {
    public static void main(String[] args) {
       

        System.out.print(" total de la compra: $");
        double total = 99;

        if (total > 100) {
            double descuento = total * 0.10;
            double totalConDescuento = total - descuento;
            System.out.println("Se aplicó un 10% de descuento.");
            System.out.println("Total con descuento: $" + totalConDescuento);
        } else {
            System.out.println("No se aplica descuento.");
            System.out.println("Total a pagar: $" + total);
        } }
}