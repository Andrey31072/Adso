
import java.util.Random;
import java.util.Scanner;

public class Array_final {
    public static void main(String[] args) {
        int[][] matriz = new int[3][3];
        Scanner teclado = new Scanner(System.in);
        Random random = new Random();

        System.out.print("Ingrese un número entre 0 y 45: ");
        int numero = teclado.nextInt();
        while (numero < 0 || numero > 45) {
            System.out.print("Número inválido. Ingrese un número entre 0 y 45: ");
            numero = teclado.nextInt();
        }


        for (int i = 0; i < 3; i++) {
            for (int j = 0; j < 3; j++) {
                matriz[i][j] = random.nextInt(16); 
            }
        }


        int[] sumaFilas = new int[3];
        int[] sumaColumnas = new int[3];
        for (int i = 0; i < 3; i++) {
            for (int j = 0; j < 3; j++) {
                sumaFilas[i] += matriz[i][j];
                sumaColumnas[j] += matriz[i][j];
            }
        }

        System.out.println("Matriz generada:");
        for (int i = 0; i < 3; i++) {
            for (int j = 0; j < 3; j++) {
                System.out.print(matriz[i][j] + " ");
            }
            System.out.println();
        }

        System.out.println("Sumas de filas: " + sumaFilas[0] + ", " + sumaFilas[1] + ", " + sumaFilas[2]);
        System.out.println("Sumas de columnas: " + sumaColumnas[0] + ", " + sumaColumnas[1] + ", " + sumaColumnas[2]);


        System.out.println("Números en filas o columnas que suman " + numero + ":");
        boolean encontrado = false;
        for (int i = 0; i < 3; i++) {
            if (sumaFilas[i] == numero) {
                System.out.print("Fila " + (i + 1) + ": ");
                for (int j = 0; j < 3; j++) {
                    System.out.print(matriz[i][j] + " ");
                }
                System.out.println();
                encontrado = true;
            }
        }
        for (int j = 0; j < 3; j++) {
            if (sumaColumnas[j] == numero) {
                System.out.print("Columna " + (j + 1) + ": ");
                for (int i = 0; i < 3; i++) {
                    System.out.print(matriz[i][j] + " ");
                }
                System.out.println();
                encontrado = true;
            }
        }

        if (!encontrado) {
            System.out.println("No se encontraron filas o columnas que sumen " + numero);
        }

        teclado.close();
    }
}