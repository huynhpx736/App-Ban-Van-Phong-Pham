package Business;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import javax.swing.JOptionPane;

public class connectSQL {
	private String user;
	private String pass;
	private String serverName;
	private String url;
	private String dataName;
	private Connection con = null;


	public connectSQL() {
		String string = 
		this.serverName = "DESKTOP-R0D53ER";//serverName
		this.user = "xuanhuynh";
		this.pass = "1234";
		this.dataName = "quanlybanhang";
		url = "jdbc:sqlserver://" + this.serverName + ";databaseName=" + this.dataName + "";
		
		
	}


	public Connection connect(){
 
		try {
		 Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");

			con = DriverManager.getConnection(url, user, pass);
			System.out.println("ket noi database thanh cong");
			return con;
		} catch (SQLException e) {
			JOptionPane.showMessageDialog(null, e.getMessage(), "SQLException", JOptionPane.ERROR_MESSAGE);
			
		}catch (ClassNotFoundException e) {
			JOptionPane.showMessageDialog(null, e.getMessage(), "ClassNotFoundException", JOptionPane.ERROR_MESSAGE);
		}
		return null;
	}
}

