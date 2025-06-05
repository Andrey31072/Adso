public class E25 {
    public static void vocal() {
        char letra = Character.toLowerCase(Todos.letra);
        while (letra != 'a' && letra != 'e' && letra != 'i' && letra != 'o' && letra != 'u') {
            System.out.println("No es una vocal. Ingrese otra letra:");
            Todos.letra = Todos.teclado.next().charAt(0);
            letra = Character.toLowerCase(Todos.letra);
        }
        System.out.println("¡Es una vocal!");
    }
}
