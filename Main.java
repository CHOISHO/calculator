import java.io.*;

public class Main {
    public static void main(String[] args) {
        // TODO: 명령행 인자로 받도록 수정
        BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));

        String firstOperand = getFirstOperand(reader);
        String operation = getOperation(reader);
        String secondOperand = getSecondOperand(reader);

        System.err.println(firstOperand);
        System.err.println(operation);
        System.err.println(secondOperand);

        // TODO: dart 계산기 argument 로 전달 
        return;
    }

    private static String getFirstOperand(BufferedReader reader) {
        System.out.print("Enter first operand: ");

        try {
            String firstOperand = reader.readLine();
            if (firstOperand != null) {
                return firstOperand;
            } else {
                // TODO: 숫자 유효성 검사 처리
                return "0";
            }
        } catch (IOException e) {
            // TODO: 에러 처리 
            e.printStackTrace();
            return "0";
        }
    }
    
    private static String getSecondOperand(BufferedReader reader) {
        System.out.print("Enter second operand: ");

        try {
            String secondOperand = reader.readLine();
            if (secondOperand != null) {
                return secondOperand;
            } else {
                // TODO: 숫자 유효성 검사 처리
                return "0";
            }
        } catch (IOException e) {
            // TODO: 에러 처리 
            e.printStackTrace();
            return "0";
        }
    }

    private static String getOperation(BufferedReader reader) {
        System.out.println("Please select an option:");
        System.out.println("1. Addition");
        System.out.println("2. Subtraction");
        System.out.println("3. Multiplication");
        System.out.println("4. Division");
        /* TODO:
            5. Trigonometric functions
            6. Calculus
            7. logarithmic function
         */  

         try {
            String Operation = reader.readLine();
            if (Operation != null) {
                return Operation;
            } else {
                // TODO: 옵션아닌 문자 입력시 처리 
                // TODO: 빈 값 입력시 처리 
                return "0";
            }
        } catch (IOException e) {
            // TODO: 에러 처리 
            e.printStackTrace();
            return "0";
        }
    }
}
