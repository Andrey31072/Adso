public class E27 {
    public static void operador() {
        int a = Todos.numero1;
        int b = Todos.numero2;
        char op = Todos.letra;
        switch (op) {
            case '+':
                Todos.calcularInt = a + b;
                System.out.println("Resultado: " + Todos.calcularInt);
                break;
            case '-':
                Todos.calcularInt = a - b;
                System.out.println("Resultado: " + Todos.calcularInt);
                break;
            case '*':
                Todos.calcularInt = a * b;
                System.out.println("Resultado: " + Todos.calcularInt);
                break;
            case '/':
                if (b != 0) {
                    Todos.calcularDouble = (double) a / b;
                    System.out.println("Resultado: " + Todos.calcularDouble);
                } else {
                    System.out.println("División por cero no permitida.");
                }
                break;
            default:
                System.out.println("Operador no válido.");
        }
    }
}
