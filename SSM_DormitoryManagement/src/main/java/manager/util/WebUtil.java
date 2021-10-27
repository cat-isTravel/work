package manager.util;

public class WebUtil {
    public static Integer parseInt(String s,Integer n){
        try {
            return Integer.parseInt(s);
        } catch (NumberFormatException e) {
            e.printStackTrace();
        }
        return n;
    }
}
