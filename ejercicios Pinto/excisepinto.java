import java.util.Scanner;
import java.lang.Math;

public class excisepinto {

    public static void main(String[] args) {
        Scanner teclado = new Scanner(System.in);
        
      
        int a, b, c , opcion; double da, db; String texto; boolean flag;
         
        
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
            System.out.println("13. Tipo de triángulo");
            System.out.println("14. Número a romano (1-10)");
            System.out.println("15. Bonificación por ventas");
            System.out.println("16. Número a vocal");
            System.out.println("17. Descomposición de 2 dígitos");
            System.out.println("18. Par o impar");
            System.out.println("19. Secuencia numérica");
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
                    c = a * b;
                    System.out.println("Distancia: " + c + " metros");
                    break;
                    
                case 2:
                    System.out.println("CÁLCULO DE PROMEDIO");
                    System.out.print("Nota 1: ");
                    a = teclado.nextInt();
                    System.out.print("Nota 2: ");
                    b = teclado.nextInt();
                    System.out.print("Nota 3: ");
                    c = teclado.nextInt();
                    a = (a + b + c) / 3;
                    System.out.println("Promedio: " + a);
                    break;
                    
                case 3:
                    System.out.println("PUNTAJE DE EXAMEN");
                    System.out.print("Respuestas correctas: ");
                    a = teclado.nextInt();
                    System.out.print("Respuestas incorrectas: ");
                    b = teclado.nextInt();
                    System.out.print("Respuestas en blanco: ");
                    c = teclado.nextInt();
                    a = (a * 4) + (b * -1) + (c * 0);
                    System.out.println("Puntaje final: " + a);
                    break;
                    
                case 4:
                    System.out.println("PUNTAJE PARTIDOS");
                    System.out.print("Partidos ganados: ");
                    a = teclado.nextInt();
                    System.out.print("Partidos empatados: ");
                    b = teclado.nextInt();
                    System.out.print("Partidos perdidos: ");
                    c = teclado.nextInt();
                    a = (a * 3) + (b * 1) + (c * 0);
                    System.out.println("Puntos totales: " + a);
                    break;
                    
                case 5:
                    System.out.println("CÁLCULO DE PAGO");
                    System.out.print("Horas trabajadas: ");
                    a = teclado.nextInt();
                    System.out.print("Tarifa por hora: ");
                    b = teclado.nextInt();
                    c = a * b;
                    System.out.println("Pago total: " + c);
                    break;
                    
                case 6:
                    System.out.println("AREA DE TRIANGULO");
                    System.out.print("Lado A: ");
                    da = teclado.nextDouble();
                    System.out.print("Lado B: ");
                    db = teclado.nextDouble();
                    System.out.print("Lado C: ");
                    a = teclado.nextInt();
                    da = (da + db + a) / 2;
                    db = Math.sqrt(da * (da - da) * (da - db) * (da - a));
                    System.out.printf("Área: %.2f\n", db);
                    break;
                    
                case 7:
                    System.out.println("\nCÁLCULO DE CDs NECESARIOS");
                    System.out.println("Número de Gigabytes del Disco Duro:");
                    da = teclado.nextDouble();
                    db = da * 1024;
                    a = (int)(Math.floor(db / 700) + 1);
                    System.out.println("El número de CDs necesarios: " + a);
                    break;
                    
                case 8:
                    System.out.println("\nDISTANCIA ENTRE DOS PUNTOS");
                    System.out.println("Ingrese la abscisa del punto A:");
                    da = teclado.nextDouble();
                    System.out.println("Ingrese la abscisa del punto B:");
                    db = teclado.nextDouble();
                    System.out.println("Ingrese la ordenada del punto A:");
                    a = teclado.nextInt();
                    System.out.println("Ingrese la ordenada del punto B:");
                    b = teclado.nextInt();
                    da = Math.sqrt(Math.pow((db - da), 2) + Math.pow((b - a), 2));
                    System.out.println("La distancia entre los puntos A y B es: " + da);
                    break;
                    
                case 9:
                    System.out.println("\nVERIFICACIÓN DE CUIL");
                    System.out.println("Ingrese el año de nacimiento:");
                    a = teclado.nextInt();
                    System.out.println("Ingrese el año actual:");
                    b = teclado.nextInt();
                    c = b - a;
                    if (c > 17) {
                        System.out.println("Debe solicitar su CUIL");
                    } else {
                        System.out.println("No debe solicitar su CUIL por el momento");
                    }
                    break;
                    
                case 10:
                    System.out.println("\nDIFERENCIA DE EDADES");
                    System.out.print("Ingrese la edad del primer hermano: ");
                    a = teclado.nextInt();
                    System.out.print("Ingrese la edad del segundo hermano: ");
                    b = teclado.nextInt();
                    
                    if (a > b) {
                        System.out.println("El Primer Hermano es el Mayor, por " + (a - b) + " años");
                        c = a - b;
                    } else {
                        System.out.println("El segundo Hermano es el Mayor, por " + (b - a) + " años");
                        c = b - a;
                    }
                    System.out.println("La diferencia de edades es: " + c + " años");
                    break;
                    
                case 11:
                    System.out.println("\nPRODUCCIÓN SEMANAL");
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
                    db = da + db + a + b + c + da;
                    da = db / 6;
                    
                    if (da >= 100) {
                        texto = "Recibirá Incentivos";
                    } else {
                        texto = "No Recibirá Incentivos";
                    }
                    
                    System.out.println("Producción Total: " + db);
                    System.out.println("Producción Promedio: " + da);
                    System.out.println("Mensaje: " + texto);
                    break;
                    
                case 12:
                    System.out.println("\nNÚMERO MAYOR DE TRES ENTEROS");
                    System.out.print("Ingrese el primer número entero: ");
                    a = teclado.nextInt();
                    System.out.print("Ingrese el segundo número entero: ");
                    b = teclado.nextInt();
                    System.out.print("Ingrese el tercer número entero: ");
                    c = teclado.nextInt();

                    if ((a > b) && (a > c)) {
                        texto = "El número mayor es: " + a;
                    } else {
                        if (b > c) {
                            texto = "El número mayor es: " + b;
                        } else {
                            texto = "El número mayor es: " + c;
                        }
                    }
                    System.out.println(texto);
                    break;
                    
                case 13:
                    System.out.println("\nTIPO DE TRIÁNGULO");
                    System.out.print("Ingrese el primer lado del triángulo: ");
                    da = teclado.nextDouble();
                    System.out.print("Ingrese el segundo lado del triángulo: ");
                    db = teclado.nextDouble();
                    System.out.print("Ingrese el tercer lado del triángulo: ");
                    a = teclado.nextInt();

                    if ((da != db) && (db != a) && (a != da)) {
                        texto = "Escaleno";
                    } else {
                        if ((da == db) && (db == a)) {
                            texto = "Equilátero";
                        } else {
                            texto = "Isósceles";
                        }
                    }
                    System.out.println("El tipo de triángulo es: " + texto);
                    break;
                    
                case 14:
                    System.out.println("\nCONVERSIÓN A NÚMERO ROMANO");
                    System.out.println("Ingrese un número entero entre 1 y 10:");
                    a = teclado.nextInt();

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
                    break;
                    
                case 15:
                    System.out.println("\nBONIFICACIÓN POR VENTAS");
                    System.out.println("Ingrese el monto de venta mensual:");
                    da = teclado.nextDouble();

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

                    if (da >= 0) {
                        System.out.println("La bonificación correspondiente es: $" + db);
                    }
                    break;
                    
                case 16:
                    System.out.println("\nNÚMERO A VOCAL");
                    System.out.print("Ingrese un número entero (1-5): ");
                    a = teclado.nextInt();

                    switch (a) {
                        case 1: texto = "A"; break;
                        case 2: texto = "E"; break;
                        case 3: texto = "I"; break;
                        case 4: texto = "O"; break;
                        case 5: texto = "U"; break;
                        default: texto = "Valor Incorrecto";
                    }
                    System.out.println("La vocal correspondiente es: " + texto);
                    break;
                    
                case 17:
                    System.out.println("\nDECENAS Y UNIDADES");
                    System.out.print("Ingrese un número entero de 2 dígitos: ");
                    a = teclado.nextInt();
                    
                    if (a < 10 || a > 99) {
                        System.out.println("Error: Debe ingresar un número de 2 dígitos (10-99)");
                        break;
                    }
                    
                    b = a / 10;
                    c = a % 10;
                    
                    System.out.println("Número de Decenas: " + b);
                    System.out.println("Número de Unidades: " + c);
                    break;
                    
                case 18:
                    System.out.println("\nPAR O IMPAR");
                    System.out.print("Ingrese un número entero: ");
                    a = teclado.nextInt();
                    
                    texto = (a % 2 == 0) ? "Es Par" : "Es Impar";
                    System.out.println(texto);
                    break;
                    
                case 19:
                    System.out.println("\nSECUENCIA NUMÉRICA");
                    a = 2;
                    System.out.println("Valor inicial: " + a);
                    
                    for(b = 1; b <= 4; b++) {
                        a += 2;
                        System.out.println("Valor " + b + ": " + a);
                    }
                    break;
                    
                case 20:
                    System.out.println("\nSUELDO PROMEDIO DE EMPLEADOS");
                    System.out.print("Ingrese el número de empleados: ");
                    a = teclado.nextInt();
                    
                    if (a <= 0) {
                        System.out.println("Error: El número de empleados debe ser positivo");
                        break;
                    }

                    da = 0;
                    for(b = 1; b <= a; b++) {
                        System.out.print("Ingrese el sueldo del empleado " + b + ": ");
                        db = teclado.nextDouble();
                        da += db;
                    }

                    da /= a;
                    System.out.println("El sueldo promedio es: " + da);
                    break;
                    
                case 21:
                    System.out.println("\nCONTADOR DE EDADES");
                    a = 0; // Mayores
                    b = 0; // Menores
                    
                    for(c = 1; c <= 5; c++) {
                        System.out.print("Edad persona " + c + ": ");
                        da = teclado.nextDouble();
                        if(da < 18) b++; else a++;
                    }
                    System.out.println("Mayores: " + a + ", Menores: " + b);
                    break;
                    
                case 22:
                    System.out.println("\nMULTIPLICACIÓN POR SUMAS");
                    System.out.print("Número 1: ");
                    a = teclado.nextInt();
                    System.out.print("Número 2: ");
                    b = teclado.nextInt();
                    c = 0;
                    
                    for(da = 1; da <= b; da++) {
                        c += a;
                    }
                    System.out.println("Resultado: " + c);
                    break;
                    
                case 23:
                    System.out.println("\nPRIMEROS 10 NÚMEROS IMPARES");
                    a = 0;
                    b = 1;
                    
                    while(a < 10) {
                        if(b % 2 != 0) {
                            System.out.println(b);
                            a++;
                        }
                        b++;
                    }
                    break;
                    
                case 24:
                    System.out.println("\nSERIE MATEMÁTICA");
                    a = 1;
                    System.out.println("Términos de la serie menores a 1000:");
                    while (a < 1000) {
                        System.out.println(a);
                        a = (a * a) + 1;
                    }
                    break;
                    
                case 25:
                    System.out.println("\nVALIDACIÓN DE VOCAL");
                    teclado.nextLine(); 
                    flag = true;
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
                    break;
                    
                case 26:
                    System.out.println("\nSECUENCIA FIBONACCI");
                    a = 0;
                    b = 1;
                    c = a + b;
                    System.out.println(a); 
                    System.out.println(b); 
                    while (c < 100000) {
                        System.out.println(c); 
                        a = b;
                        b = c;
                        c = a + b;
                    }
                    break;
                    
                case 27:
                    System.out.println("\nCALCULADORA SIMPLE");
                    System.out.print("Ingrese el primer número: ");
                    a = teclado.nextInt();
                    System.out.print("Ingrese el segundo número: ");
                    b = teclado.nextInt();
                    System.out.print("Ingrese el operador (+, -, *, ^): ");
                    texto = teclado.next();
                    c = 0;
                    flag = true;
                    if (texto.equals("+")) {
                        c = a + b;
                    } else if (texto.equals("-")) {
                        c = a - b;
                    } else if (texto.equals("*")) {
                        c = a * b;
                    } else if (texto.equals("^")) {
                        c = (int) Math.pow(a, b);
                    } else {
                        System.out.println("Operador no válido.");
                        flag = false;
                    }
                    if (flag) {
                        System.out.println("Resultado: " + c);
                    }
                    break;
                    
                case 28:
                    System.out.println("\nCONTADOR DE VOCALES Y CONSONANTES");
                    teclado.nextLine(); 
                    a = 0; // Vocales
                    b = 0; // Consonantes
                    for (c = 1; c <= 10; c++) {
                        System.out.print("Ingrese la letra número " + c + ": ");
                        texto = teclado.nextLine().toLowerCase();
                        if (texto.length() != 1 || !Character.isLetter(texto.charAt(0))) {
                            System.out.println("Entrada inválida. Debe ingresar solo una letra.");
                            c--; // repetir intento
                            continue;
                        }
                        if (texto.equals("a") || texto.equals("e") || 
                            texto.equals("i") || texto.equals("o") || 
                            texto.equals("u")) {
                            a++;
                        } else {
                            b++;
                        }
                    }
                    System.out.println("Cantidad de vocales ingresadas: " + a);
                    System.out.println("Cantidad de consonantes ingresadas: " + b);
                    break;
                    
                case 29:
                    System.out.println("\nSISTEMA DE VOTACIÓN");
                    a = 0; // cand1
                    b = 0; // cand2
                    c = 0; // cand3
                    da = 0; // blancos
                    for (db = 1; db <= 160; db++) {
                        System.out.print("Ingrese el voto #" + (int)db + " (1, 2, 3 o cualquier otro para nulo/blanco): ");
                        texto = teclado.next();
                        switch (texto) {
                            case "1": a++; break;
                            case "2": b++; break;
                            case "3": c++; break;
                            default: da++; break;
                        }
                    }
                    System.out.println("\nRESULTADOS FINALES:");
                    System.out.println("Candidato 1: " + a + " votos");
                    System.out.println("Candidato 2: " + b + " votos");
                    System.out.println("Candidato 3: " + c + " votos");
                    System.out.println("Votos nulos/blancos: " + (int)da);
                    if (a > b && a > c && a > da) {
                        System.out.println("Ganador: Candidato 1 con " + a + " votos.");
                    } else if (b > c && b > da) {
                        System.out.println("Ganador: Candidato 2 con " + b + " votos.");
                    } else if (c > da) {
                        System.out.println("Ganador: Candidato 3 con " + c + " votos.");
                    } else {
                        System.out.println("Los votos nulos/blancos ganaron con " + (int)da + " votos.");
                    }
                    break;
                    
                case 30:
                    System.out.println("\nPROMEDIO DE DOS NÚMEROS");
                    System.out.print("Ingrese el primer número: ");
                    da = teclado.nextDouble();
                    System.out.print("Ingrese el segundo número: ");
                    db = teclado.nextDouble();
                    da = (da + db) / 2;
                    System.out.println("El promedio es: " + da);
                    break;
                    
                case 0:
                    System.out.println("Saliendo del programa...");
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
        
        teclado.close();
    }
}