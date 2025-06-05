package Todos;

public class E1_30 {
    import java.util.Scanner;

public class Todos {
    public static Scanner teclado = new Scanner(System.in);
    public static int opcion, numero1, numero2, numero3, numero4, numero5, numero6, estado = 0, calcularInt, calcularInt2, calcularInt3;
    public static double calcularDouble, calcularDouble2, numero1D, numero2D, numero3D, numero4D;
    public static char letra, SEMAF;

    public static void main(String[] args) {
        do {
            displayMenu();
            opcion = teclado.nextInt();

            switch (opcion) {
                case 1:
                    LeerLosDatos.ScannerDos();
                    Exercise1.distancia();
                    break;
                case 2:
                    System.out.println("Calcular el promedio de tres notas");
                    LeerLosDatos.ScannerTres();
                    Exercise2.promedio();
                    break;
                case 3:
                    System.out.println("Calcular respuestas correctas, incorrectas y en blanco:");
                    LeerLosDatos.ScannerTres();
                    Exercise3.respuestas();
                    break;
                case 4:
                    System.out.println("Hacer el cálculo de puntos en torneo");
                    System.out.println("Ingresar primero los partidos ganados, luego los empatados y por último los perdidos");
                    LeerLosDatos.ScannerTres();
                    Exercise4.partidos();
                    break;
                case 5:
                    LeerLosDatos.ScannerDos();
                    Exercise5.planilla();
                    break;
                case 6:
                    System.out.println("Hacer el cálculo de los 3 lados de un triángulo:");
                    LeerLosDatos.ScannerTresD();
                    Exercise6.areaTriangulo();
                    break;
                case 7:
                    System.out.println("Calcular el número de CDs necesarios para hacer una copia de seguridad:");
                    LeerLosDatos.ScannerUnoD();
                    Exercise7.cds();
                    break;
                case 8:
                    System.out.println("Obtener la distancia entre el punto A y B");
                    LeerLosDatos.ScannerCuatroD();
                    Exercise8.puntos();
                    break;
                case 9:
                    System.out.println("Saber si una persona debe sacar su CUIL");
                    System.out.println("Primero ingrese la fecha actual y luego la fecha de nacimiento");
                    LeerLosDatos.ScannerDos();
                    Exercise9.cuil();
                    break;
                case 10:
                    System.out.println("Calcular la edad de dos hermanos y decir la diferencia de edad y quién es mayor");
                    LeerLosDatos.ScannerDos();
                    Exercise10.edadMayor();
                    break;
                case 11:
                    System.out.println("Cálculo de la producción promedio de una empresa");
                    LeerLosDatos.ScannerSeis();
                    Exercise11.promedio();
                    break;
                case 12:
                    System.out.println("Leer tres números enteros diferentes y determinar el número mayor");
                    LeerLosDatos.ScannerTres();
                    Exercise12.numeroMayor();
                    break;
                case 13:
                    System.out.println("Reconocer el tipo de triángulo por sus lados");
                    LeerLosDatos.ScannerTres();
                    Exercise13.triangulo();
                    break;
                case 14:
                    System.out.println("Ingresar los números del 1 al 10 y mostrar su equivalente en números romanos");
                    LeerLosDatos.ScannerUno();
                    Exercise14.romanos();
                    break;
                case 15:
                    System.out.println("Calcular si las ventas realizadas durante un mes por un vendedor merecen bonificación");
                    LeerLosDatos.ScannerUno();
                    Exercise15.ventas();
                    break;
                case 16:
                    System.out.println("Ingresar los números del 1 al 5 y mostrar su vocal equivalente");
                    LeerLosDatos.ScannerUno();
                    Exercise10.mensaje();
                    break;
                case 17:
                    System.out.println("Leer un número entero de dos cifras y mostrar el número de decenas y centenas que lo componen");
                    LeerLosDatos.ScannerUno();
                    Exercise17.decenas();
                    break;
                case 18:
                    System.out.println("Leer un número entero, si es diferente de cero, determinar si es par");
                    LeerLosDatos.ScannerUno();
                    Exercise18.calcular();
                    break;
                case 19:
                    System.out.println("Contener los primeros diez números pares");
                    Exercise19.diezPares();
                    break;
                case 20:
                    System.out.println("Calcular el sueldo promedio de un grupo de personas");
                    LeerLosDatos.ScannerDos();
                    Exercise20.sueldo();
                    break;
                case 21:
                    System.out.println("Solicitar la edad de 200 personas y mostrar cuántos mayores y menores de edad hay");
                    Exercise21.docientos();
                    break;
                case 22:
                    System.out.println("Realizar sumas sucesivas con dos números enteros y mostrar su producto");
                    LeerLosDatos.ScannerDos();
                    Exercise22.suma();
                    break;
                case 23:
                    System.out.println("Mostrar los 10 primeros números enteros excepto los pares");
                    LeerLosDatos.ScannerUno();
                    Exercise23.menores();
                    break;
                case 24:
                    System.out.println("Mostrar los términos de la serie que sean menores a 1000");
                    Exercise24.serie();
                    break;
                case 25:
                    System.out.println("Solicitar ingresar letras hasta que entre una vocal");
                    LeerLosDatos.ScannerChar();
                    Exercise25.vocal();
                    break;
                case 26:
                    System.out.println("Términos de la serie Fibonacci menores a 100000");
                    Exercise26.fibonacci();
                    numero1 = 0;
                    break;
                case 27:
                    System.out.println("Solicitar dos números enteros y un operador aritmético y mostrar el resultado");
                    LeerLosDatos.ScannerDos();
                    LeerLosDatos.ScannerChar();
                    Exercise27.operador();
                    break;
                case 28:
                    System.out.println("Solicitar 10 letras cualesquiera e indicar cuántas vocales y consonantes se ingresaron");
                    LeerLosDatos.ScannerChar();
                    Exercise28.consonantes();
                    break;
                case 29:
                    System.out.println("Resultado de unas elecciones");
                    Exercise29.votos();
                    break;
                case 30:
                    System.out.println("Solicitar dos números e imprimir su promedio");
                    LeerLosDatos.ScannerDos();
                    Exercise30.promedioTwo();
                    break;
                case 0:
                    System.out.println("Salir:");
                    estado = 1;
                    break;
                default:
                    System.out.println("Opción no válida. Intente de nuevo.");
            }
        } while (estado == 0);

        teclado.close();
    }

    private static void displayMenu() {
        System.out.println("Ingrese un ejercicio del 1 al 30:");
        System.out.println("1. Calcular la distancia recorrida");
        System.out.println("2. Calcular el promedio de 3 notas");
        System.out.println("3. Calcular el puntaje final");
        System.out.println("4. Calcular el puntaje final de partidos ganados, perdidos y empatados en un torneo");
        System.out.println("5. Calcular la planilla de un trabajador");
        System.out.println("6. Hacer el cálculo de los 3 lados de un triángulo");
        System.out.println("7. Calcular el número de CDs necesarios para hacer una copia de seguridad");
        System.out.println("8. Obtener la distancia entre el punto A y B");
        System.out.println("9. Saber si una persona debe sacar su CUIL");
        System.out.println("10. Calcular la edad de dos hermanos y decir la diferencia de edad y quién es mayor");
        System.out.println("11. Cálculo de la producción promedio de una empresa");
        System.out.println("12. Leer tres números enteros diferentes y determinar el número mayor");
        System.out.println("13. Reconocer el tipo de triángulo por sus lados");
        System.out.println("14. Ingresar los números del 1 al 10 y mostrar su equivalente en números romanos");
        System.out.println("15. Calcular si las ventas realizadas durante un mes por un vendedor merecen bonificación");
        System.out.println("16. Ingresar los números del 1 al 5 y mostrar su vocal equivalente");
        System.out.println("17. Leer un número entero de dos cifras y mostrar el número de decenas y centenas");
        System.out.println("18. Leer un número entero, si es diferente de cero, determinar si es par");
        System.out.println("19. Contener los primeros diez números pares");
        System.out.println("20. Calcular el sueldo promedio de un grupo de personas");
        System.out.println("21. Solicitar la edad de 200 personas y mostrar cuántos mayores y menores de edad hay");
        System.out.println("22. Realizar sumas sucesivas con dos números enteros y mostrar su producto");
        System.out.println("23. Mostrar los 10 primeros números enteros excepto los pares");
        System.out.println("24. Mostrar los términos de la serie que sean menores a 1000");
        System.out.println("25. Solicitar ingresar letras hasta que entre una vocal");
        System.out.println("26. Términos de la serie Fibonacci menores a 100000");
        System.out.println("27. Solicitar dos números enteros y un operador aritmético y mostrar el resultado");
        System.out.println("28. Solicitar 10 letras cualesquiera e indicar cuántas vocales y consonantes se ingresaron");
        System.out.println("29. Resultado de unas elecciones");
        System.out.println("30. Promedio de dos números");
        System.out.println("Seleccione 0 para salir");
    }
}
}
