import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.io.FileDescriptor;
import java.io.FileOutputStream;
import java.io.PrintStream;
import java.sql.Connection;
import static java.nio.charset.StandardCharsets.UTF_8;



public class FastWear {
private String url = "jdbc:sqlserver://DESKTOP-P666EK6\\sqlexpress;databaseName=FastWear;integratedSecurity=true";
private Connection conn;



FastWear() {
System.out.println("Connecting...");
try {
conn = DriverManager.getConnection(url);
} catch (SQLException e) {
// TODO Auto-generated catch block
e.printStackTrace();
}
System.out.println("Connected!");
}



}