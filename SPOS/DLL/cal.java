import java.io.*;
import java.util.*;

public class cal{
    static {
        System.loadLibrary("cal");
    }
    // prototype
    public native int add(int a, int b);
    public static void main(String args[]){
        Scanner scan = new Scanner(System.in);
        System.out.println("Calculator Program");
        System.out.println("Enter first number: ");
        int a = scan.nextInt();
        System.out.println("Enter second number: ");
        int b = scan.nextInt();

        cal c = new cal();
        int result = c.add(a,b);
        System.out.println("Result: " + result);
        scan.close();
    }
}