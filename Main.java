import java.io.*;
import java.util.List;

public class Main {
    public static void main(String[] args) {
        // TODO: 명령행 인자로 받도록 수정
        BufferedReader reader = new BufferedReader(new InputStreamReader(System.in));

        String firstOperand = getFirstOperand(reader);
        String operation = getOperation(reader);
        String secondOperand = getSecondOperand(reader);

        String[] arguments = new String[] { firstOperand, operation, secondOperand };

        startCalculator(arguments);
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
        System.out.println("Please select an operation:");
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

    private static void startCalculator(String[] arguments) {
        try {
            // Dart 프로세스를 실행
            ProcessBuilder processBuilder = new ProcessBuilder("dart", "bin/main.dart");
            
            processBuilder.command().addAll(List.of(arguments));

            processBuilder.redirectErrorStream(true);

            // 프로세스 시작
            Process process = processBuilder.start();

            // 프로세스의 출력 스트림을 읽음
            BufferedReader processReader = new BufferedReader(new InputStreamReader(process.getInputStream()));

            String line;
            
            while ((line = processReader.readLine()) != null) {
                System.out.println(line);
            }

            // 프로세스 종료를 기다림
            int exitCode = process.waitFor();
            System.out.println("Exited with code: " + exitCode);
          
        } catch (IOException | InterruptedException e) {
            e.printStackTrace();
        }
    }
}
