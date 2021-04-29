package mvc.model;

import java.sql.*;
import mvc.database.DBConnection;
import java.util.ArrayList;


public class bookDAO {
	static private bookDAO instance;
	
	public static bookDAO getInstance()
	{
		if(instance ==null)
			instance = new bookDAO();
		return instance;
	}
	
	public void insertBook(bookDTO bookList)  // 도서 등록
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		
		
		try {
			conn = DBConnection.getConnection();
			
			String sql = "insert into booklist(b_name,b_vol,b_serial,b_author,b_publisher,b_location,b_state,b_image,b_description,b_registday,b_hit) values(?,?,?,?,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,bookList.getName());
			pstmt.setInt(2,bookList.getVol());
			pstmt.setString(3,bookList.getSerial());
			pstmt.setString(4,bookList.getAuthor());
			pstmt.setString(5,bookList.getPublisher());
			pstmt.setString(6,bookList.getLocation());
			pstmt.setString(7,bookList.getState());
			pstmt.setString(8,bookList.getImage());
			pstmt.setString(9,bookList.getDescription());
			pstmt.setString(10,bookList.getRegistday());
			pstmt.setInt(11, bookList.getHit());
			pstmt.executeUpdate();
		}
		catch (Exception ex)
		{
			System.out.println("insertBook() 에러 : " + ex);
		} 
		finally 
		{
			try 
			{									
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
	
	public int getListCount(String text, String items, String locations) //도서 전체 수량 카운트
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
				
		int count = 0;
		
		String sql;
		
		if(text==null && locations==null)
			sql = "select count(*) from booklist";
		else if(locations==null)
			sql = "select count(*) from booklist where " + items + " like '%" + text + "%'";
		else if(text == null)
			sql = "select count(*) from booklist where b_location like '" + locations + "'";
		else
			sql = "select count(*) from booklist where b_location like '" + locations + "' and " + items + " like '%" + text + "%'";
		
		try 
		{
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) 
				count = rs.getInt(1);
				
			
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
		
		return count;
	}
	
	public ArrayList<bookDTO> getBookList(int page, int limit, String text, String items, String locations, String dataSort)//도서 리스트 
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int total_record = getListCount(text, items, locations);
		int start = (page - 1) * limit;
		int index = start + 1;
		
		String sql;
		
		if(text==null && locations==null)
			sql = "select * from booklist order by "+dataSort;
		else if(locations==null)
			sql = "select * from booklist where " + items + " like '%" + text + "%' order by "+dataSort;
		else if(text == null)
			sql = "select * from booklist where b_location like '" + locations + "' order by "+dataSort;
		else
			sql = "select * from booklist where b_location like '" + locations + "' and " + items + " like '%" + text + "%' order by "+dataSort;
		
		ArrayList<bookDTO> list = new ArrayList<bookDTO>();
		
		try 
		{
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.absolute(index))
			{
				bookDTO book = new bookDTO();
				book.setAuthor(rs.getString("b_author"));
				book.setDescription(rs.getString("b_description"));
				book.setImage(rs.getString("b_image"));
				book.setLocation(rs.getString("b_location"));
				book.setName(rs.getString("b_name"));
				book.setPublisher(rs.getString("b_publisher"));
				book.setVol(rs.getInt("b_vol"));
				book.setSerial(rs.getString("b_serial"));
				book.setState(rs.getString("b_state"));
				book.setHit(rs.getInt("b_hit"));
				list.add(book);
				
				if (index < (start + limit) && index <= total_record)
					index++;
				else
					break;
			}
			return list;
		} 
		catch (Exception ex) 
		{
			System.out.println("getBookList() 에러 : " + ex);
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
	
	public bookDTO getBookBySerial(String serial)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		bookDTO book = null;

		updateHit(serial);
		String sql = "select * from booklist where b_serial = ? ";

		try 
		{
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, serial);
			rs = pstmt.executeQuery();

			if (rs.next()) 
			{
				book = new bookDTO();
				book.setAuthor(rs.getString("b_author"));
				book.setDescription(rs.getString("b_description"));
				book.setHit(rs.getInt("b_hit"));
				book.setImage(rs.getString("b_image"));
				book.setLocation(rs.getString("b_location"));
				book.setName(rs.getString("b_name"));
				book.setPublisher(rs.getString("b_publisher"));
				book.setRegistday(rs.getString("b_registday"));
				book.setSerial(rs.getString("b_serial"));
				book.setState(rs.getString("b_state"));
				book.setVol(rs.getInt("b_vol"));
			}
			
			return book;
		} 
		catch (Exception ex) 
		{
			System.out.println("getBookBySerial() 에러 : " + ex);
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
	
	public void updateHit(String serial) 
	{

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try 
		{
			conn = DBConnection.getConnection();

			String sql = "select b_hit from booklist where b_serial = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, serial);
			rs = pstmt.executeQuery();
			
			int hit = 0;

			if (rs.next())
				hit = rs.getInt("b_hit") + 1;
			pstmt.close();

			sql = "update booklist set b_hit=? where b_serial=?";
			pstmt = conn.prepareStatement(sql);		
			pstmt.setInt(1, hit);
			pstmt.setString(2, serial);
			pstmt.executeUpdate();
		} 
		catch (Exception ex) 
		{
			System.out.println("updateHit() 에러 : " + ex);
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
	}
	
	public void removeBookBySerial(String serial)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try 
		{
			conn = DBConnection.getConnection();

			String sql = "select b_vol from booklist where b_serial = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, serial);
			rs = pstmt.executeQuery();
			
			int vol = 0;

			if (rs.next())
				vol = rs.getInt("b_vol") - 1;
			pstmt.close();

			sql = "update booklist set b_vol=? where b_serial=?";
			pstmt = conn.prepareStatement(sql);		
			pstmt.setInt(1, vol);
			pstmt.setString(2, serial);
			pstmt.executeUpdate();
		} 
		catch (Exception ex) 
		{
			System.out.println("removeBookBySerial() 에러 : " + ex);
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
	}
	
	public void removeBookListBySerial(String serial)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try 
		{
			conn = DBConnection.getConnection();

			String sql = "select b_vol from booklist where b_serial = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, serial);
			rs = pstmt.executeQuery();
			
			int vol = 0;

			if (rs.next()) {
				if(rs.getInt("b_vol") >= 1)
					vol = rs.getInt("b_vol") - 1;
				else
					vol=0;
			}
			pstmt.close();

			sql = "update booklist set b_vol=? where b_serial=?";
			pstmt = conn.prepareStatement(sql);		
			pstmt.setInt(1, vol);
			pstmt.setString(2, serial);
			pstmt.executeUpdate();
		} 
		catch (Exception ex) 
		{
			System.out.println("removeBookBySerial() 에러 : " + ex);
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
	}
	
	public void bookReturnVol(int add,String serial)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try 
		{
			conn = DBConnection.getConnection();
			int vol=0;
			
			String sql = "select b_vol from booklist where b_serial = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, serial);
			rs = pstmt.executeQuery();
			
			if(rs.next())
			{
				vol=rs.getInt("b_vol")+add;
 			}
			pstmt.close();

			sql = "update booklist set b_vol=? where b_serial=?";
			pstmt = conn.prepareStatement(sql);		
			pstmt.setInt(1, vol);
			pstmt.setString(2, serial);
			pstmt.executeUpdate();
		} 
		catch (Exception ex) 
		{
			System.out.println("bookReturnVol() 에러 : " + ex);
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
	}
	
	public ArrayList<bookDTO> getBookHit()
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try 
		{
			
			ArrayList<bookDTO> list = new ArrayList<bookDTO>();
			conn = DBConnection.getConnection();
			
			String sql = "select * from booklist order by b_hit desc, b_registday desc";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next())
			{
				bookDTO book = new bookDTO();
				book.setImage(rs.getString("b_image"));
				book.setName(rs.getString("b_name"));
				book.setSerial(rs.getString("b_serial"));
				book.setHit(rs.getInt("b_hit"));
				book.setLocation(rs.getString("b_location"));
				list.add(book);
				
			}
			return list;
		} 
		catch (Exception ex) 
		{
			System.out.println("getBookHit() 에러 : " + ex);
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
}
