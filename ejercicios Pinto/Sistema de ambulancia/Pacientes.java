import java.util.Scanner;

public class Pacientes {
    
    
    public static void resgistrarpacientes() {
        Scanner Teclado = new Scanner (System.in);
        for (int x = 0; x < 100; x++){
            System.out.println("ingresa el nombre del paciente " + (x+1) + ":");
            String nombre = Main.teclado.nextLine();
            System.out.println("ingresa el apellido del paciente " + (x+1) + ":");
            String apellido = Main.teclado.nextLine();
            System.out.println("ingresa el numero de telefono del paciente " + (x+1) + ":");
            String telefono = Main.teclado.nextLine();
            System.out.println("ingresa la edad del paciente " + (x+1) + ":");
            int  edad = Main.teclado.nextInt();
            Main.teclado.nextLine(); 
            System.out.println("ingresa el tipo de sangre del paciente " + (x+1) + ":");
            String tipoSangre = Main.teclado.nextLine();

            Datos.pacientes[x] = nombre + " " + apellido + " - Tel: " + telefono + " - Edad: " + edad + " - Tipo de Sangre: " + tipoSangre;
            
        }
        System.out.println("Pacientes registrados:");
        for (int i = 0; i < 100; i++)
        System.out.println((i + 1) + ". " + Datos.pacientes[i]);
        
        }
    
}

