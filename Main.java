import java.io.*;
import java.util.Arrays;

public class Main {
    public static void main(String[] args) {
        System.out.println(Arrays.toString(args));

        if (args.length == 0) {
            System.out.println("Please provide a name as a command-line argument.");
            return;
        }

        String name = args[0];

        try {
            // Dart 프로세스를 실행
            ProcessBuilder processBuilder = new ProcessBuilder("dart", "bin/cli.dart");
            processBuilder.redirectErrorStream(true);

            // 프로세스 시작
            Process process = processBuilder.start();

            // 프로세스의 입력 스트림을 얻음
            BufferedWriter writer = new BufferedWriter(new OutputStreamWriter(process.getOutputStream()));
            writer.write(name + "\n");
            writer.flush();

            // 프로세스의 출력 스트림을 읽음
            BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));
            String line;
            while ((line = reader.readLine()) != null) {
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