import java.util.Scanner;

public class Nuevos {
 
    /**
     * @param args
     */
    public static void main(String[] args) {
        Scanner teclado = new Scanner(System.in);
        
      
        int a, b, c , r, opcion; 
        double da, db, dc; 
        String texto; 
        boolean flag;
         
        
        do {
            System.out.println("MENÚ COMPLETO DE EJERCICIOS (1-30)");
            System.out.println("1. Cálculo de distancia");
            System.out.println("2. Cálculo de promedio");
            System.out.println("3. Cálculo de puntaje de examen");
            System.out.println("4. Cálculo de puntaje deportivo");
            System.out.println("5. Cálculo de pago por horas");
            System.out.println("6. Cálculo de área de triángulo");
            System.out.println("7. Cálculo de CDs necesarios");
            System.out.println("8. Distancia entre dos puntos");
            System.out.println("9. Verificación de CUIL");
            System.out.println("10. Diferencia de edades");
            System.out.println("11. Producción semanal");
            System.out.println("12. Número mayor de tres enteros");
            System.out.println("13. Tipo de triangulo");
            System.out.println("14. Número a romano (1-10)");
            System.out.println("15. Bonificación por ventas");
            System.out.println("16. Numero a vocal");
            System.out.println("17. Descomposición de 2 dígitos");
            System.out.println("18. Par o impar");
            System.out.println("19. Secuencia numerica");
            System.out.println("20. Sueldo promedio de empleados");
            System.out.println("21. Contador de edades");
            System.out.println("22. Multiplicación por sumas");
            System.out.println("23. Números impares");
            System.out.println("24. Serie matemática");
            System.out.println("25. Validación de vocal");
            System.out.println("26. Secuencia Fibonacci");
            System.out.println("27. Calculadora simple");
            System.out.println("28. Contador de vocales y consonantes");
            System.out.println("29. Sistema de votación");
            System.out.println("30. Cálculo de promedio de dos números");
           

            System.out.print("Seleccione ejercicio (1-30): ");
            opcion = teclado.nextInt();
            
            switch(opcion) {
                case 1:
                    System.out.println("CÁLCULO DE DISTANCIA");
                    System.out.print("Velocidad (m/s): ");
                    a = teclado.nextInt();
                    System.out.print("Tiempo (s): ");
                    b = teclado.nextInt();
                    ejercicio1(a, b);
                    break;
                    
                case 2:
                    System.out.println("CÁLCULO DE PROMEDIO");
                    System.out.print("Nota 1: ");
                    a = teclado.nextInt();
                    System.out.print("Nota 2: ");
                    b = teclado.nextInt();
                    System.out.print("Nota 3: ");
                    c = teclado.nextInt();
                    ejercicio2(a, b,c);
                    break;
                    
                case 3:
                    System.out.println("PUNTAJE DE EXAMEN");
                    System.out.print("Respuestas correctas: ");
                    a = teclado.nextInt();
                    System.out.print("Respuestas incorrectas: ");
                    b = teclado.nextInt();
                    System.out.print("Respuestas en blanco: ");
                    c = teclado.nextInt();
                    ejercicio3(a, b, c );
                    break;
                    
                case 4:
                    System.out.println("PUNTAJE PARTIDOS");
                    System.out.print("Partidos ganados: ");
                    a = teclado.nextInt();
                    System.out.print("Partidos empatados: ");
                    b = teclado.nextInt();
                    System.out.print("Partidos perdidos: ");
                    c = teclado.nextInt();
                    ejercicio4(a, b, c);
                    break;
                    
                case 5:
                    System.out.println("CÁLCULO DE PAGO");
                    System.out.print("Horas trabajadas: ");
                    a = teclado.nextInt();
                    System.out.print("Tarifa por hora: ");
                    b = teclado.nextInt();
                    ejercicio5(a, b);
                    break;
                    
                case 6:
                    System.out.println("AREA DE TRIANGULO");
                    System.out.print("Lado A: ");
                    da = teclado.nextDouble();
                    System.out.print("Lado B: ");
                    db = teclado.nextDouble();
                    System.out.print("Lado C: ");
                    dc = teclado.nextDouble();
                    ejercicio6(da, db, opcion, dc);
                    break;
                    
                case 7:
                    System.out.println("CÁLCULO DE CDs NECESARIOS");
                    System.out.println("Número de Gigabytes del Disco Duro:");
                    da = teclado.nextDouble();
                    ejercicio7(da);
                    break;
                    
                case 8:
                    System.out.println("DISTANCIA ENTRE DOS PUNTOS");
                    System.out.println("Ingrese la abscisa del punto A:");
                    da = teclado.nextDouble();
                    System.out.println("Ingrese la abscisa del punto B:");
                    db = teclado.nextDouble();
                    System.out.println("Ingrese la ordenada del punto A:");
                    a = teclado.nextInt();
                    System.out.println("Ingrese la ordenada del punto B:");
                    b = teclado.nextInt();
                    ejercicio8(da, db, a, b);
                    break;
                    
                case 9:
                    System.out.println("VERIFICACIÓN DE CUIL");
                    System.out.println("Ingrese el año de nacimiento:");
                    a = teclado.nextInt();
                    System.out.println("Ingrese el año actual:");
                    b = teclado.nextInt();
                    ejercicio9(a, b);
                    break;
                    
                case 10:
                    System.out.println("DIFERENCIA DE EDADES");
                    System.out.print("Ingrese la edad del primer hermano: ");
                    a = teclado.nextInt();
                    System.out.print("Ingrese la edad del segundo hermano: ");
                    b = teclado.nextInt();
                    ejercicio10(a, b);
                    break;
                    
                case 11:
                    System.out.println("PRODUCCIÓN SEMANAL");
                    System.out.print("Ingrese la producción del día Lunes: ");
                    da = teclado.nextDouble();
                    System.out.print("Ingrese la producción del día Martes: ");
                    db = teclado.nextDouble();
                    System.out.print("Ingrese la producción del día Miércoles: ");
                    a = teclado.nextInt();
                    System.out.print("Ingrese la producción del día Jueves: ");
                    b = teclado.nextInt();
                    System.out.print("Ingrese la producción del día Viernes: ");
                    c = teclado.nextInt();
                    System.out.print("Ingrese la producción del día Sábado: ");
                    da = teclado.nextDouble();
                    ejercicio11(da, db, a, b, c, da);
                    break;
                    
                case 12:
                    System.out.println("NÚMERO MAYOR DE TRES ENTEROS");
                    System.out.print("Ingrese el primer número entero: ");
                    a = teclado.nextInt();
                    System.out.print("Ingrese el segundo número entero: ");
                    b = teclado.nextInt();
                    System.out.print("Ingrese el tercer número entero: ");
                    c = teclado.nextInt();
                    ejercicio12(a, b, c);
                    break;
                    
                case 13:
                    System.out.println("TIPO DE TRIÁNGULO");
                    System.out.print("Ingrese el primer lado del triángulo: ");
                    da = teclado.nextDouble();
                    System.out.print("Ingrese el segundo lado del triángulo: ");
                    db = teclado.nextDouble();
                    System.out.print("Ingrese el tercer lado del triángulo: ");
                    a = teclado.nextInt();
                    ejercicio13(da, db, a);
                    break;
                    
                case 14:
                    System.out.println("CONVERSIÓN A NÚMERO ROMANO");
                    System.out.println("Ingrese un número entero entre 1 y 10:");
                    a = teclado.nextInt();
                    ejercicio14(a);
                    break;
                    
                case 15:
                    System.out.println("BONIFICACIÓN POR VENTAS");
                    System.out.println("Ingrese el monto de venta mensual:");
                    da = teclado.nextDouble();
                    ejercicio15(da);
                    break;
                    
                case 16:
                    System.out.println("NÚMERO A VOCAL");
                    System.out.print("Ingrese un número entero (1-5): ");
                    a = teclado.nextInt();
                    ejercicio16(a);
                    break;
                    
                case 17:
                    System.out.println("DECENAS Y UNIDADES");
                    System.out.print("Ingrese un número entero de 2 dígitos: ");
                    a = teclado.nextInt();
                    ejercicio17(a);
                    break;
                    
                case 18:
                    System.out.println("PAR O IMPAR");
                    System.out.print("Ingrese un número entero: ");
                    a = teclado.nextInt();
                    ejercicio18(a);
                    break;
                    
                case 19:
                    System.out.println("SECUENCIA NUMÉRICA");
                    System.out.println("Agrega un valor inicial (POSITIVO):  ");
                    c= teclado.nextInt();
                    ejercicio19(c);
                    break;
                    
                case 20:
                    System.out.println("SUELDO PROMEDIO DE EMPLEADOS");
                    System.out.print("Ingrese el número de empleados: ");
                    a = teclado.nextInt();
                        System.out.print("Ingrese el sueldo del empleado: ");
                    db = teclado.nextDouble();
                    ejercicio20(db, a);
                    break;
                    
                case 21:
                    System.out.println("CONTADOR DE EDADES");
                    System.out.println("ingresa la edad de la persona 1:  ");
                    r = teclado.nextInt();
                    ejercicio21(r);
                    break;
                    
                case 22:
                    System.out.println("MULTIPLICACIÓN");
                    System.out.print("Número 1: ");
                    a = teclado.nextInt();
                    System.out.print("Número 2: ");
                    b = teclado.nextInt();
                    ejercicio22(a, b);
                    break;
                    
                case 23:
                    ejercicio23();
                    break;
                    
                case 24:
                    ejercicio24();
                    break;
                    
                case 25:
                    ejercicio25();
                    break;
                    
                case 26:
                    ejercicio26();
                    break;
                    
                case 27:
                ejercicio27();
                    
                case 28:
                    ejercicio28();
                    break;
                    
                case 29:
                    ejercicio29();
                    break;
                    
                case 30:
                    ejercicio30();
                    break;
                    
                default:
                    System.out.println("Opción no válida!");
            }
            
            if (opcion != 0) {
                System.out.println("\nPresione Enter para continuar...");
                teclado.nextLine(); // Limpiar el buffer
                teclado.nextLine(); // Esperar Enter
            }
            
        } while (opcion != 0);
    }
        public static void ejercicio1 (int a, int b) {
            int r = a * b;
            System.out.println("La distancia recorrida es: " + r + " metros");
        }
        public static void ejercicio2 (int a, int b, int c) {
            double r = a + b + c/ 3.0;
            System.out.println("El promedio es: " + r );
        }
        public static void ejercicio3 (int a, int b, int c) {
            int r = (a * 4) + (b * -1) + (c * 0);
            System.out.println("El puntaje final del examen es: " + r);
        }
        public static void ejercicio4 (int a, int b, int c) {
            int r = (a * 3) + (b * 1) + (c * 0);
            System.out.println("El puntaje total es: " + r);
        }
        public static void ejercicio5 (int a, int b) {
            int r = a * b;
            System.out.println("El pago total es: " + r);
        }
        public static void ejercicio6 (double a, double b, int c, double da) {
            double r = (a + b + c) / 2;
            double de = Math.sqrt(da * (da - a) * (da - b) * (da - c));
            System.out.printf ("El área del triángulo es:", de, "%");
        } public static void ejercicio7 (double da) {
            int r = (int)(Math.ceil(da / 700.0));
            System.out.println("El número de CDs necesarios es: " + r);
        }
        public static void ejercicio8 (double a, double b, int c, int d) {
            double r = Math.sqrt(Math.pow((b - a), 2) + Math.pow((d - c), 2));
            System.out.println("La distancia entre los puntos A y B es: " + r);
        }
        public static void ejercicio9 (int a, int b) {
            int r = b - a;
            if (r > 17) {
                System.out.println("Debe solicitar su CUIL");
            } else {
                System.out.println("No debe solicitar su CUIL por el momento");
            }
        }
        public static void ejercicio10 (int a, int b) {
            int r = Math.abs(a - b);
            if (a > b) {
                System.out.println("El Primer Hermano es el Mayor, por " + r + " años");
            } else {
                System.out.println("El Segundo Hermano es el Mayor, por " + r + " años");
            }
            System.out.println("La diferencia de edades es: " + r + " años");
    }     public static void ejercicio11 (double da, double db, int a, int b, int c, double de) {
            double r = (da + db + a + b + c + de) / 6;
            String texto = (r >= 100) ? "Recibirá Incentivos" : "No Recibirá Incentivos";
            System.out.println("Producción Total: " + (da + db + a + b + c + de));
            System.out.println("Producción Promedio: " + r);
            System.out.println("Mensaje: " + texto);
        } public static void ejercicio12 (int a, int b, int c) {
            int r = Math.max(a, Math.max(b, c));
            System.out.println("El número mayor es: " + r);
        } public static void ejercicio13 (double a, double b, int c) {
            String texto;
            if ((a != b) && (b != c) && (c != a)) {
                texto = "Escaleno";
            } else if ((a == b) && (b == c)) {
                texto = "Equilátero";
            } else {
                texto = "Isósceles";
            }
            System.out.println("El tipo de triángulo es: " + texto);
        } public static void ejercicio14 (int a) {
            String texto;
            switch (a) {
                case 1: texto = "I"; break;
                case 2: texto = "II"; break;
                case 3: texto = "III"; break;
                case 4: texto = "IV"; break;
                case 5: texto = "V"; break;
                case 6: texto = "VI"; break;
                case 7: texto = "VII"; break;
                case 8: texto = "VIII"; break;
                case 9: texto = "IX"; break;
                case 10: texto = "X"; break;
                default: texto = "Número fuera de rango (debe ser entre 1 y 10)";
            }
            System.out.println("Equivalente en romano: " + texto);
        } public static void ejercicio15 (double da) {
            double db;
            if (da >= 0 && da < 1000) {
                db = 0;
            } else if (da >= 1000 && da < 5000) {
                db = (3 * da) / 100;
            } else if (da >= 5000 && da < 20000) {
                db = (5 * da) / 100;
            } else if (da >= 20000) {
                db = (8 * da) / 100;
            } else {
                db = 0;
                System.out.println("Monto inválido. Debe ser mayor o igual a 0.");
            }
            System.out.println("La bonificación correspondiente es: $" + db);
        } public static void ejercicio16 (int a) {
            String texto;
            switch (a) {
                case 1: texto = "A"; break;
                case 2: texto = "E"; break;
                case 3: texto = "I"; break;
                case 4: texto = "O"; break;
                case 5: texto = "U"; break;
                default: texto = "Número fuera de rango (debe ser entre 1 y 5)";
            }
    } public static void ejercicio17 (int a) {
            int b = a / 10; 
            int c = a % 10; 
            System.out.println("Número de Decenas: " + b);
            System.out.println("Número de Unidades: " + c);
        } public static void ejercicio18 (int a) {
            String texto = (a % 2 == 0) ? "Es Par" : "Es Impar";
            System.out.println(texto);
        } public static void ejercicio19 (int c) {
            int a = c;
            System.out.println("Valor inicial: " + a);
            for(int b = 1; b <= 4; b++) {
                a += 2;
                System.out.println("Valor " + b + ": " + a);
            }
            
        } public static void ejercicio20 (double db, int a) {
            double r = db / a;
            System.out.println("El sueldo promedio de los empleados es: " + r);
       
        } public static void ejercicio21 (int r) {
            int a = 0, b = 0, c = 0;
            if (r < 18) {
                a++;
            } else if (r >= 18 && r <= 35) {
                b++;
            } else {
                c++;
            }
            System.out.println("Menores de 18 años: " + a);
            System.out.println("Entre 18 y 35 años: " + b);
            System.out.println("Mayores de 35 años: " + c);
        } public static void ejercicio22 (int a, int b) {
            int c = 0;
            for(int da = 1; da <= b; da++) {
                c += a;
            }
            System.out.println("Resultado de la multiplicación: " + c);
        } public static void ejercicio23 () {
            int a = 0, b = 1;
            System.out.println("Primeros 10 números impares:");
            while(a < 10) {
                if(b % 2 != 0) {
                    System.out.println(b);
                    a++;
                }
                b++;
            }
        } public static void ejercicio24 () {
            int a = 1;
            System.out.println("Términos de la serie menores a 1000:");
            while (a < 1000) {
                System.out.println(a);
                a = (a * a) + 1;
            }
        } public static void ejercicio25 () {
            Scanner teclado = new Scanner(System.in);
            boolean flag = true;
            String texto;
            while (flag) {
                System.out.print("Ingrese una letra: ");
                texto = teclado.nextLine();
                if (texto.equalsIgnoreCase("a") ||
                    texto.equalsIgnoreCase("e") ||
                    texto.equalsIgnoreCase("i") ||
                    texto.equalsIgnoreCase("o") ||
                    texto.equalsIgnoreCase("u")) {
                    flag = false;
                } else {
                    System.out.println("No es una vocal, intente nuevamente.");
                }
            }
            System.out.println("Ingresó una vocal. Fin del ejercicio.");
        } public static void ejercicio26 () {
            int a = 0, b = 1, c;
            System.out.println("Secuencia Fibonacci:");
            System.out.println(a);
            System.out.println(b);
            for (int i = 2; i < 20; i++) {
                c = a + b;
                System.out.println(c);
                a = b;
                b = c;
            }
        } public static void ejercicio27 () {
            Scanner teclado = new Scanner(System.in);
            int a, b, c;
            System.out.print("Ingrese el primer número: ");
            a = teclado.nextInt();
            System.out.print("Ingrese el segundo número: ");
            b = teclado.nextInt();
            System.out.print("Ingrese la operación (+, -, *, /): ");
            String operacion = teclado.next();
            
            switch (operacion) {
                case "+":
                    c = a + b;
                    break;
                case "-":
                    c = a - b;
                    break;
                case "*":
                    c = a * b;
                    break;
                case "/":
                    if (b != 0) {
                        c = a / b;
                    } else {
                        System.out.println("Error: División por cero.");
                        return;
                    }
                    break;
                default:
                    System.out.println("Operación no válida.");
                    return;
            }
            System.out.println("Resultado: " + c);
        
    } public static void ejercicio28 () {
            Scanner teclado = new Scanner(System.in);
            int vocales = 0, consonantes = 0;
            System.out.println("Ingrese 10 letras:");
            for (int i = 0; i < 10; i++) {
                String letra = teclado.nextLine().toLowerCase();
                if (letra.length() == 1 && Character.isLetter(letra.charAt(0))) {
                    if ("aeiou".contains(letra)) {
                        vocales++;
                    } else {
                        consonantes++;
                    }
                } else {
                    System.out.println("Entrada inválida. Debe ingresar solo una letra.");
                    i--; // Repetir intento
                }
            }
            System.out.println("Cantidad de vocales: " + vocales);
            System.out.println("Cantidad de consonantes: " + consonantes);
        }
        public static void ejercicio29 () {
            Scanner teclado = new Scanner(System.in);
            int votosCandidato1 = 0, votosCandidato2 = 0, votosCandidato3 = 0, votosBlancos = 0;
            String voto;
            System.out.println("Sistema de votación (Ingrese '1', '2', '3' o cualquier otra cosa para voto en blanco):");
            for (int i = 0; i < 160; i++) {
                System.out.print("Voto #" + (i + 1) + ": ");
                voto = teclado.nextLine();
                switch (voto) {
                    case "1": votosCandidato1++; break;
                    case "2": votosCandidato2++; break;
                    case "3": votosCandidato3++; break;
                    default: votosBlancos++; break;
                }
            }
            System.out.println("Resultados:");
            System.out.println("Candidato 1: " + votosCandidato1 + " votos");
            System.out.println("Candidato 2: " + votosCandidato2 + " votos");
            System.out.println("Candidato 3: " + votosCandidato3 + " votos");
            System.out.println("Votos en blanco: " + votosBlancos);
        }   
        public static void ejercicio30 () {
            Scanner teclado = new Scanner(System.in);
            double num1, num2, promedio;
            System.out.print("Ingrese el primer número: ");
            num1 = teclado.nextDouble();
            System.out.print("Ingrese el segundo número: ");
            num2 = teclado.nextDouble();
            promedio = (num1 + num2) / 2;
            System.out.println("El promedio de los dos números es: " + promedio);
        }
}