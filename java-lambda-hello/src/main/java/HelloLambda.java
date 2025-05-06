public class HelloLambda {
    public static void main(String[] args) {
        Runnable hello = () -> System.out.println("Hello, World!");
        hello.run();
    }
}