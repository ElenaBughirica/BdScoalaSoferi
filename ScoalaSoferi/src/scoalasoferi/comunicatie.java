/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package scoalasoferi;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author katy
 */
public class comunicatie {
    private final String server = "localhost\\KATY-PC";
    private final int port = 1433;
    private final String user = "sa"; // Sql server username
    private final String password = "cati";
    String database = "ScoalaSoferi";
    private Connection con;
    private Statement stmt;
    String jdbcUrl = "jdbc:sqlserver://"+server+":"+port+";user="+user+";password="+password+";databaseName="+database+"";
    
    comunicatie(){
    }
    
    Statement openChannel(){
        try {
            con = DriverManager.getConnection(jdbcUrl);
            //System.out.println("# - Connection Obtained");
            
            stmt = con.createStatement();
            //System.out.println("# - Statement Created");
        } catch (SQLException ex) {
            Logger.getLogger(comunicatie.class.getName()).log(Level.SEVERE, null, ex);
           // System.err.println("Conexiune nereusita");
        }
        return stmt;
    }
    
    ResultSet exQuery(String query) throws SQLException{
            // TODO code application logic here
            stmt=openChannel();
            ResultSet rs = stmt.executeQuery(query);
            
            return rs;
    }
    void execute(String query) throws SQLException{
            if(stmt==null)
              stmt=openChannel();
            stmt.execute(query); 
    }
    
    void closeChannel(ResultSet rs){
        try {
            rs.close();
            stmt.close();
            con.close();
            //System.out.println("# - Resources released");
        } catch (SQLException ex) {
            Logger.getLogger(comunicatie.class.getName()).log(Level.SEVERE, null, ex);
            //System.err.println("Comunicatia nu s-a incheiat");
        }
    }
}
