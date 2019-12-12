package utility;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBOpen {

	public static Connection open() {
		Connection con=null;
		
		try {
			Class.forName(Constant.DRIVER);  //드라이버를 올리고
			
			con=DriverManager.getConnection(Constant.URL, Constant.USER, Constant.PASSWD); //con 통해서 전달			
			
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return con;  //후 리턴
	}
}
