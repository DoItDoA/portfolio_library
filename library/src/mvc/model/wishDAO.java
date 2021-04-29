package mvc.model;

import java.sql.*;
import mvc.database.DBConnection;
import java.util.ArrayList;

public class wishDAO {

	static private wishDAO instance;
	
	public static wishDAO getInstance()
	{
		if(instance ==null)
			instance = new wishDAO();
		return instance;
	}
	
	public void insertWishBoard(wishDTO wish)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBConnection.getConnection();		

			String sql = "insert into wishbook values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, wish.getNum());
			pstmt.setString(2, wish.getId());
			pstmt.setString(3, wish.getName());
			pstmt.setString(4, wish.getAuthor());
			pstmt.setString(5, wish.getPublisher());
			pstmt.setString(6, wish.getLocation());
			pstmt.setString(7, wish.getDescription());
			pstmt.setString(8, wish.getYear());
			pstmt.setString(9, wish.getPhone());
			pstmt.setString(10, wish.getSms());
			pstmt.setString(11, wish.getIp());
			pstmt.setString(12, wish.getPrice());
			pstmt.executeUpdate();
		} 
		catch (Exception ex) {
			System.out.println("insertWishBoard() 에러 : " + ex);
		} 
		finally 
		{
			try {									
				if (pstmt != null) 
					pstmt.close();				
				if (conn != null) 
					conn.close();
			} 
			catch (Exception ex) 
			{
				throw new RuntimeException(ex.getMessage());
			}		
		}	
	}
	
	public int getListCount() 
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		int x = 0;
		
		String sql = "select count(*) from wishbook";
		
		
		try 
		{
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) 
				x = rs.getInt(1);
				
			
		} 
		catch (Exception ex) 
		{
			System.out.println("getListCount() 에러: " + ex);
		} 
		finally 
		{			
			try
			{				
				if (rs != null) 
					rs.close();							
				if (pstmt != null) 
					pstmt.close();				
				if (conn != null) 
					conn.close();												
			}
			catch (Exception ex) 
			{
				throw new RuntimeException(ex.getMessage());
			}		
		}		
		
		return x;
	}
	
	public ArrayList<wishDTO> getWishBoardList(int page, int limit)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int total_record = getListCount();
		int start = (page - 1) * limit;
		int index = start + 1;
		
		String sql = "select * from wishbook ORDER BY num DESC";
		
		ArrayList<wishDTO> list = new ArrayList<wishDTO>();

		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			while (rs.absolute(index)) {
				wishDTO wish = new wishDTO();
				wish.setAuthor(rs.getString("author"));
				wish.setDescription(rs.getString("description"));
				wish.setId(rs.getString("id"));
				wish.setIp(rs.getString("ip"));
				wish.setLocation(rs.getString("location"));
				wish.setName(rs.getString("name"));
				wish.setPhone(rs.getString("phone"));
				wish.setPrice(rs.getString("price"));
				wish.setPublisher(rs.getString("publisher"));
				wish.setSms(rs.getString("sms"));
				wish.setYear(rs.getString("year"));
				wish.setNum(rs.getInt("num"));
				list.add(wish);

				if (index < (start + limit) && index <= total_record)
					index++;
				else
					break;
			}
			return list;
		} 
		catch (Exception ex) 
		{
			System.out.println("getwishBoardList() 에러 : " + ex);
		} 
		finally 
		{
			try 
			{
				if (rs != null) 
					rs.close();							
				if (pstmt != null) 
					pstmt.close();				
				if (conn != null) 
					conn.close();
			} 
			catch (Exception ex) 
			{
				throw new RuntimeException(ex.getMessage());
			}			
		}
		return null;
	}
	
	public wishDTO getWishBoardByNum(int num, int page) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		wishDTO wish = null;

		String sql = "select * from wishbook where num = ? ";

		try 
		{
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();

			if (rs.next()) 
			{
				wish = new wishDTO();
				wish.setNum(rs.getInt("num"));
				wish.setAuthor(rs.getString("author"));
				wish.setDescription(rs.getString("description"));
				wish.setId(rs.getString("id"));
				wish.setLocation(rs.getString("location"));
				wish.setName(rs.getString("name"));
				wish.setPhone(rs.getString("phone"));
				wish.setSms(rs.getString("sms"));
				wish.setPublisher(rs.getString("publisher"));
				wish.setYear(rs.getString("year"));
				wish.setPrice(rs.getString("price"));
			}
			
			return wish;
		} 
		catch (Exception ex) {
			System.out.println("getWishBoardByNum() 에러 : " + ex);
		} finally {
			try {
				if (rs != null) 
					rs.close();							
				if (pstmt != null) 
					pstmt.close();				
				if (conn != null) 
					conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}		
		}
		return null;
	}
	
	public void deleteBoard(int num) {
		Connection conn = null;
		PreparedStatement pstmt = null;		

		String sql = "delete from wishbook where num=?";	

		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();

		} catch (Exception ex) {
			System.out.println("deleteBoard() 에러 : " + ex);
		} finally {
			try {										
				if (pstmt != null) 
					pstmt.close();				
				if (conn != null) 
					conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}		
		}
	}	
	
	public void updateWishBoard(wishDTO wish) {

		Connection conn = null;
		PreparedStatement pstmt = null;
	
		try {
			String sql = "update wishbook set name=?, author=?, publisher=?, location=?, description=?, year=?, phone=?, sms=?, price=? where num=?";

			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			conn.setAutoCommit(false);

			pstmt.setString(1, wish.getName());
			pstmt.setString(2, wish.getAuthor());
			pstmt.setString(3, wish.getPublisher());
			pstmt.setString(4, wish.getLocation());
			pstmt.setString(5, wish.getDescription());
			pstmt.setString(6, wish.getYear());
			pstmt.setString(7, wish.getPhone());
			pstmt.setString(8, wish.getSms());
			pstmt.setString(9, wish.getPrice());
			pstmt.setInt(10, wish.getNum());

			pstmt.executeUpdate();			
			conn.commit();

		} catch (Exception ex) {
			System.out.println("updateWishBoard() 에러 : " + ex);
		} finally {
			try {										
				if (pstmt != null) 
					pstmt.close();				
				if (conn != null) 
					conn.close();
			} catch (Exception ex) {
				throw new RuntimeException(ex.getMessage());
			}		
		}
	} 
}
