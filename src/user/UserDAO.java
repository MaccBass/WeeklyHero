package user;

import java.sql.*;


public class UserDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	public UserDAO() {
		try {
			String dbURL="jdbc:mysql://localhost:3306/changjin0605?serverTimezone=UTC&useUnicode=true&characterEncoding=utf8";
			String dbID="changjin0605", dbPassword="idealidea1!";
			Class.forName("com.mysql.jdbc.Driver");
			conn=DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int login(String userID, String userPW) {
		String sql="select userPW from userdata where userID = ?";
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, userID);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				if(rs.getString(1).equals(userPW)) {
					return 1;
				} else return 0;
			}
			return -1; //아이디 없음
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2; //DB오류
	}
	public String getUserDatabyID(String userID) {
		String sql="select userName from userdata where userID = ?";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, userID);
			rs=pstmt.executeQuery();
			if(rs.next()) {
	            return rs.getString(1);
	         } else return "";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}
	
	public int join(UserData user) {
		String sql="insert into userdata values (?,?,?,?,?,?)";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, user.getUserID());
			pstmt.setString(2, user.getUserPW());
			pstmt.setString(3, user.getUserName());
			pstmt.setString(4, user.getUserE_mail());
			pstmt.setInt(5, 0);
			pstmt.setString(6, "profile_sample.png");
			return pstmt.executeUpdate();
		} catch(Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
	
	public String findID(String userE_mail) {
		String sql="select userID from userdata where userE_mail = ?";
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, userE_mail);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			} else return "";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}
	public String findPW(String userID) {
		String sql="select userPW from userdata where userID = ?";
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, userID);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			} else return "";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}
}
