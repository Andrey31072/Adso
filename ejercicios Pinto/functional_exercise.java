import java.util.Scanner;
 public class functional_exercise {
     public static void main(String[] args) { 
        Scanner scanner = new Scanner(System.in); 
        int opcion;

         do { 
            System.out.println("Elige una opcion:");
             System.out.println("2. Sumar dos numeros"); 
             System.out.println("3. Numero par o impar"); 
             System.out.println("4. Tabla de multiplicar"); 
             System.out.println("5. Factorial de un numero"); 
             System.out.println("6. Numero primo o no"); 
             System.out.println("7. Serie Fibonacci"); 
             System.out.println("8. Invertir numero"); 
             System.out.println("9. Contar digitos"); 
             System.out.println("10. Suma digitos"); 
             System.out.println("11. Mayor de tres numeros"); 
             System.out.println("12. Suma de 1 a N"); 
             System.out.println("13. Promedio de N numeros"); 
             System.out.println("14. Aerea de un circulo"); 
             System.out.println("15. Raiz cuadrada"); 
             System.out.println("0. Salir"); 
             
             opcion = scanner.nextInt(); 
             switch (opcion) { 
                case 2: ejercicio2(scanner); 
                break; 
                case 3: ejercicio3(scanner);
                
                break; 
                case 4: ejercicio4(scanner); 
                break; 
                case 5: ejercicio5(scanner); 
                break; 
                case 6: ejercicio6(scanner); 
                break; 
                case 7: ejercicio7(scanner); 
                break; 
                case 8: ejercicio8(scanner); 
                break; 
                case 9: ejercicio9(scanner); 
                break; 
                case 10: ejercicio10(scanner); 
                break; 
                case 11: ejercicio11(scanner); 
                break; 
                case 12: ejercicio12(scanner); 
                break; 
                case 13: ejercicio13(scanner); 
                break; 
                case 14: ejercicio14(scanner); 
                break; 
                case 15: ejercicio15(scanner); 
                break; 
                case 0: System.out.println("Saliendo..."); 
                break; 
                default: System.out.println("Opcion invalida."); 
            } 
            System.out.println(); } 
            
            while (opcion != 0); 
            
            scanner.close();
        
        } 
        
        public static void ejercicio2(Scanner scanner) 
        { 
            System.out.print("Ingresa dos numeros: "); 
            
            int a = scanner.nextInt(), b = scanner.nextInt(); 
            System.out.println("Suma: " + (a + b)); 
        } 
            public static void ejercicio3(Scanner scanner) { 

                System.out.print("Ingresa un numero: "); 
                
                int n = scanner.nextInt(); 
                System.out.println(n % 2 == 0 ? "Par" : "Impar"); 
            } 
                public static void ejercicio4(Scanner scanner) 
                { 
                    System.out.print("Tabla del numero: "); 

                    int n = scanner.nextInt(); 
                    
                    for (int i = 1; i <= 10; i++) 
                    
                System.out.println(n + " x " + i + " = " + (n * i));
             } 
             public static void ejercicio5(Scanner scanner) 
             
             { 
                System.out.print("Numero para factorial: "); 
                
                int n = scanner.nextInt(), fact = 1; 

                for (int i = 1; i <= n; i++) fact *= i; 
                System.out.println("Factorial: " + fact); 
            } 
            
            public static void ejercicio6(Scanner scanner)
             { 
                
                System.out.print("Numero para verificar primo: "); 
                int n = scanner.nextInt(); 
                
                boolean esPrimo = n > 1; 
                
                for (int i = 2; i <= Math.sqrt(n); i++) 
                
                if (n % i == 0) esPrimo = false; 
                
                System.out.println(esPrimo ? "Es primo" : "No es primo"); 
            } 
            public static void ejercicio7(Scanner scanner) { 
                System.out.print("Cantidad de terminos de Fibonacci: "); 

                int n = scanner.nextInt(), a = 0, b = 1; 
                
                for (int i = 0; i < n; i++) 
                { System.out.print(a + " "); 

                int temp = a + b; a = b; b = temp; 
            } System.out.println(); 
        } 
        
        public static void ejercicio8 (Scanner scanner) {
             System.out.print("Numero para invertir: "); 

             int n = scanner.nextInt(), rev = 0; 
             while (n != 0) { rev = rev * 10 + n % 10; n /= 10; 
            } 
             System.out.println("Invertido: " + rev); 
            } 
            public static void ejercicio9(Scanner scanner) { 
                System.out.print("Numero para contar digitos: "); 
                
                int n = scanner.nextInt(), count = 0; 
                do { 
                    count++; n /= 10; } 
                    
                    while (n != 0); 
                    System.out.println("Digitos: " + count);
                 } 
                 public static void ejercicio10(Scanner scanner) { 
                    System.out.print("Numero para sumar digitos: "); 
                    int n = scanner.nextInt(), suma = 0; while (n != 0) { suma += n % 10; n /= 10; 
                    } 
                    System.out.println("Suma de digitos: " + suma); 
                } 
                public static void ejercicio11(Scanner scanner) { 
                    
                    System.out.print("Tres numeros: "); 
                    
                    int a = scanner.nextInt(), b = scanner.nextInt(), c = scanner.nextInt(); 
                    System.out.println("Mayor: " + Math.max(a, Math.max(b, c)));
                 } 
                 public static void ejercicio12(Scanner scanner) { 
                    
                    System.out.print("Numero N: "); 
                    
                    int n = scanner.nextInt(), suma = 0;
                    
                    for (int i = 1; i <= n; i++) suma += i; 
                    
                    System.out.println("Suma de 1 a " + n + ": " + suma);
                 } 
                 public static void ejercicio13(Scanner scanner) {
                     System.out.print("Cantidad de numeros: ");
                     
                     int n = scanner.nextInt(), suma = 0;
                     
                     for (int i = 0; i < n; i++) { 
                        
                        System.out.print("Numero " + (i + 1) + ": ");
                        
                        suma += scanner.nextInt(); 
                    } 
                    System.out.println("Promedio: " + (suma / (double)n)); 
                } 
                public static void ejercicio14(Scanner scanner) { 
                    System.out.print("Radio del circulo: "); 
                    double r = scanner.nextDouble();
                     System.out.println("Aerea: " + (Math.PI * r * r));
                     } 
                     public static void ejercicio15(Scanner scanner) {
                         System.out.print("Numero para raiz cuadrada: ");
                          double n = scanner.nextDouble();
                           System.out.println("Raiz cuadrada: " + Math.sqrt(n)); 
                        } 
                    }