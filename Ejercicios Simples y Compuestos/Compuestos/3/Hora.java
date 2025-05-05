public class Hora {
    public static void main(String[] args) {
        int hora = 24; 
        
        if (hora < 0 || hora > 23) {
            System.out.println("Hora inválida. Debe estar entre 0 y 23.");
        } else if (hora >= 6 && hora <= 11) { 
            System.out.println("Es de mañana.");
        } else if (hora == 12) { 
            System.out.println("Es mediodía.");
        } else if (hora >= 13 && hora <= 18) { 
            System.out.println("Es de tarde.");
        } else if (hora >= 19 && hora <= 23) { 
            System.out.println("Es de noche.");
        } else { 
            System.out.println("Es de madrugada.");
        }
    }
}