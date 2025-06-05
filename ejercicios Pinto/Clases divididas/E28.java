public class E28 {
    public static void consonantes() {
        int vocales = 0, consonantes = 0;
        for (int i = 0; i < 10; i++) {
            System.out.print("Ingrese la letra " + (i + 1) + ": ");
            char letra = Todos.teclado.next().charAt(0);
            letra = Character.toLowerCase(letra);
            if (letra == 'a' || letra == 'e' || letra == 'i' || letra == 'o' || letra == 'u') {
                vocales++;
            } else if (Character.isLetter(letra)) {
                consonantes++;
            }
        }
        System.out.println("Vocales: " + vocales);
        System.out.println("Consonantes: " + consonantes);
    }
}
