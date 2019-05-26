package DB;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class Connection {
    public List<String[]> categoriesList = new ArrayList<String[]>();
    public List<String[]> productsList = new ArrayList<String[]>();
    public List<String[]> usersList = new ArrayList<String[]>();
    public java.sql.Connection connection;
    public Connection(){
        try{
            Class.forName("oracle.jdbc.driver.OracleDriver");
            connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe","Proiect","proiect");
            System.out.println("ok");
        }catch(Exception e) {
            System.out.println("Error : " + e);
        }
    }
    public void testffs(){
        ResultSet rs;
        try(Statement stmt = connection.createStatement()) {
            rs = stmt.executeQuery("select * from categories");
            while(rs.next()) {
                System.out.println((rs.getString(1) +" " +rs.getInt(2)));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
