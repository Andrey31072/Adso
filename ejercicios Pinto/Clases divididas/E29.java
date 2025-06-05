public class E29 {
    
    public static void votos() {
        System.out.println("Ingrese el número de votos para el candidato A:");
        int votosA = Todos.teclado.nextInt();
        System.out.println("Ingrese el número de votos para el candidato B:");
        int votosB = Todos.teclado.nextInt();
        if (votosA > votosB) {
            System.out.println("El candidato A ganó con " + votosA + " votos.");
        } else if (votosB > votosA) {
            System.out.println("El candidato B ganó con " + votosB + " votos.");
        } else {
            System.out.println("Empate con " + votosA + " votos cada uno.");
        }
    }
}
}
