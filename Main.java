import java.io.*;
import java.util.List;

public class Main {
    public static void main(String[] arguments) {
        if (arguments.length < 3) {
            System.out.println("Usage: java Main <firstOperand> <operation> <secondOperand>");
            return;
        }

        startCalculator(arguments);
        return;
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
