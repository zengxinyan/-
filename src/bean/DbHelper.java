package bean;

import java.sql.*;

public class DbHelper {
    private String driverStr = "org.postgresql.Driver";
    private String connStr = "jdbc:postgresql://localhost:5432/postgres";
    private String dbusername = "xy";
    private String dbpassword = "";
    private Connection conn = null;
    private Statement stmt = null;
    
    public DbHelper()
    {
        try
        {
            Class.forName(driverStr);
            conn = DriverManager.getConnection(connStr, dbusername, dbpassword);
            stmt = conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);
        } 
        catch (Exception ex) {
            System.out.println(ex.getMessage());
            System.out.println("��������ʧ�ܣ�");
        } 

    }

    public int executeUpdate(String s) {
        int result = 0;
        System.out.println("--�������:"+s+"\n");
        try {
            result = stmt.executeUpdate(s);
        } catch (Exception ex) {
            System.out.println("ִ�и��´���");
        }
        return result;
    }

    public ResultSet executeQuery(String s) {
        ResultSet rs = null;
        System.out.print("--��ѯ���:"+s+"\n");
        try {
            rs = stmt.executeQuery(s);
        } catch (Exception ex) {
            System.out.println("ִ�в�ѯ����");
        }
        return rs;
    }
    public void execQuery(String s){
        try {
            stmt.executeUpdate(s);
        } catch (SQLException e) {

            System.out.println("ִ�в������");
            
        }
    }
    public void close() {
        try {
            stmt.close();
            conn.close();
        } catch (Exception e) {
        }
    }
}

