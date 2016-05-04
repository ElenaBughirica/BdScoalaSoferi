/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package scoalasoferi;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.swing.JFrame;
/**
 *
 * @author katy
 */
public class ScoalaSoferi {

    
    /**
     * @param args the command line arguments
     */
     
    public static void main(String[] args) {
       JFrame mainWindow=new BDJFrame(); 
       mainWindow.setVisible(true);
       mainWindow.setTitle("Scoala de soferi Venus");
    }
    
}
