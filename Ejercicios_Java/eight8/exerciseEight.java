public class SimpleSalary {
    public static void main(String[] args) {
        double hours = 45;     
        double rate = 10;     
        double pay;
        
        if (hours > 40) {
            pay = 40 * rate + (hours - 40) * rate * 1.5;
        } else {
            pay = hours * rate;
        }
        
        System.out.println("Total pay: $" + pay);
    }
} 