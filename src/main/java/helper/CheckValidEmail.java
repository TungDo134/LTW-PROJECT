package helper;

public class CheckValidEmail {
    public static boolean checkValidEmail(String email) {
        String regex = "^[\\w\\.-]+@[a-zA-Z\\d\\.-]+\\.[a-zA-Z]{2,6}$";
        return email.matches(regex);
    }
}
