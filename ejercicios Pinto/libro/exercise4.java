
import java.util.Scanner;
public class exercise4 {
    public static void main(String[] args) {
       Scanner teclado = new Scanner(System.in); 
     int partidosGanados;
     int partidosPerdidos;
     int partidosEmpatados;
     
     int puntajeDePartidosGanados;
     int puntajeDePartidosEmpatados;
int puntajeDePartidosPerdidos;

int puntajeFinal; 
     System.out.println(" ingrese numero de partidos ganados:");
partidosGanados= teclado.nextInt();


System.out.println("ingrese numero de partidos empatados");
partidosEmpatados= teclado.nextInt();


System.out.println("ingrese numero de partidos perdidos");
partidosPerdidos= teclado.nextInt();

puntajeDePartidosGanados =  partidosGanados *3;
puntajeDePartidosEmpatados = partidosEmpatados *1;
puntajeDePartidosPerdidos = partidosPerdidos *0;
 
puntajeFinal = puntajeDePartidosGanados + puntajeDePartidosEmpatados + puntajeDePartidosPerdidos;
System.out.println( "puntos totales son : "+puntajeFinal);
 
teclado.close();
   }

}

