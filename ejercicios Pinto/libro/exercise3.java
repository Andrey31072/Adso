import java.util.Scanner;
public class exercise3{
    public static void main(String[] args) {
        Scanner teclado = new Scanner(System.in);
    int respuestasCorrectas;
    int respuestasIncorrectas;
    int respuestasEnBlanco;
    int PRC,PRI,PRB ,PF;
System.out.println("numero de respuestas correctas :");    
respuestasCorrectas= teclado.nextInt();

System.out.println("numero de respuestas incorrectas :");
respuestasIncorrectas= teclado.nextInt();
    
System.out.println( "numero de respuestas en blanco :");

respuestasEnBlanco= teclado.nextInt();

PRC = respuestasCorrectas *4 ;
PRI = respuestasIncorrectas*1;
PRB = respuestasEnBlanco *0;
PF = PRC +PRI+ PRB;
if (PF<0){
    System.out.println("puntaje final menor a 0");

}
System.out.println("puntaje final "+PF);
teclado.close();
 }
}

