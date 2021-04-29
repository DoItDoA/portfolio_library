package mvc.model;

import java.sql.*;
import mvc.database.DBConnection;
import java.util.ArrayList;
import java.util.List;

public class privateBookDAO {
	static private privateBookDAO instance;
	
	public static privateBookDAO getInstance()
	{
		if(instance ==null)
			instance = new privateBookDAO();
		return instance;
	}
	
	public int checkVol(privateBookDTO book)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		
		try {
			conn = DBConnection.getConnection();
			
			sql = "select p_vol from "+book.getId()+" where p_serial = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, book.getSerial());
			rs = pstmt.executeQuery();
			
			int vol=0;	
			
			if (rs.next()) {
				vol=rs.getInt("p_vol");
				return vol;						
			}
			
		}
		catch (Exception ex)
		{
			System.out.println("checkVol() 에러 : " + ex);
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
		return 0;
	}
	
		
	public void insertBook(privateBookDTO book)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		String sql;
		
		try {
			conn = DBConnection.getConnection();
			
			sql = "insert into "+book.getId()+" values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,book.getNum());
			pstmt.setString(2,book.getId());
			pstmt.setString(3,book.getName());
			pstmt.setString(4,book.getPublisher());
			pstmt.setString(5,book.getAuthor());
			pstmt.setString(6,book.getLocation());
			pstmt.setString(7,book.getSerial());
			pstmt.setInt(8,book.getVol()+1);
			pstmt.setString(9,book.getState());
			pstmt.setString(10,book.getRegistday());
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
	
	public void addBookQnt(privateBookDTO book,int vol)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql;
		
		try {
			conn = DBConnection.getConnection();
			sql = "update "+book.getId()+" set p_vol=? , p_registday=?  where p_serial=?";
			pstmt = conn.prepareStatement(sql);		
			pstmt.setInt(1, vol+=1);
			pstmt.setString(2, book.getRegistday());
			pstmt.setString(3, book.getSerial());
			pstmt.executeUpdate();
		
		}
		catch (Exception ex)
		{
			System.out.println("addBookQnt() 에러 : " + ex);
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
	
	
	public int[] checkVolList(List<privateBookDTO> list)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		String sql;
		
		try {
			conn = DBConnection.getConnection();
			int[] volList = new int[list.size()];
			
			for(int i = 0; i<list.size(); i++)
			{
				privateBookDTO bookList = (privateBookDTO) list.get(i);
			
				sql = "select p_vol from "+bookList.getId()+" where p_serial = ? ";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, bookList.getSerial());
				rs = pstmt.executeQuery();
				
				int vol=0;	
				
				if (rs.next())
				{
					vol=rs.getInt("p_vol");
					volList[i] = vol;
					
				}
				rs.close();		
				pstmt.close();
			}
			return volList;
		}
		catch (Exception ex)
		{
			System.out.println("checkVolList() 에러 : " + ex);
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
		int[] x = new int[list.size()];
		return x;
	}
	
	public void insertBookList(List<privateBookDTO> list,int i)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = DBConnection.getConnection();
			
			privateBookDTO bookList = (privateBookDTO) list.get(i);
			
			String sql = "insert into "+bookList.getId()+" values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,bookList.getNum());
			pstmt.setString(2,bookList.getId());
			pstmt.setString(3,bookList.getName());
			pstmt.setString(4,bookList.getPublisher());
			pstmt.setString(5,bookList.getAuthor());
			pstmt.setString(6,bookList.getLocation());
			pstmt.setString(7,bookList.getSerial());
			pstmt.setInt(8,bookList.getVol()+1);
			pstmt.setString(9,bookList.getState());
			pstmt.setString(10,bookList.getRegistday());
	
			pstmt.executeUpdate();
			
			
		}
		catch (Exception ex)
		{
			System.out.println("insertBookLst() 에러 : " + ex);
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
	
	public void addBookQntList(List<privateBookDTO> list,int i, int[] volList)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql;
		try {
			conn = DBConnection.getConnection();
						
			privateBookDTO bookList = (privateBookDTO) list.get(i);
				
			sql = "update "+bookList.getId()+" set p_vol=? , p_registday=?  where p_serial=?";
			pstmt = conn.prepareStatement(sql);		
			pstmt.setInt(1, volList[i]+=1);
			pstmt.setString(2, bookList.getRegistday());
			pstmt.setString(3, bookList.getSerial());
			pstmt.executeUpdate();
							
		}
		catch (Exception ex)
		{
			System.out.println("addBookQntList() 에러 : " + ex);
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
	
	public ArrayList<privateBookDTO> getBookList(privateBookDTO book)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		ArrayList<privateBookDTO> list = new ArrayList<privateBookDTO>();
		
		String sql = "select * from "+book.getId()+" order by p_num desc";
				
		try 
		{
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while (rs.next())
			{
				privateBookDTO books = new privateBookDTO();
				books.setAuthor(rs.getString("p_author"));
				books.setLocation(rs.getString("p_location"));
				books.setName(rs.getString("p_name"));
				books.setPublisher(rs.getString("p_publisher"));
				books.setVol(rs.getInt("p_vol"));
				books.setSerial(rs.getString("p_serial"));
				books.setState(rs.getString("p_state"));
				books.setRegistday(rs.getString("p_registday"));
				books.setNum(rs.getInt("p_num"));
				list.add(books);
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
	
	public int getBookAndVolBySerial(String serial,String Id)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
				
		String sql;

		try 
		{
			int vol=0;
			sql = "select * from "+Id+" where p_serial = ? ";
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, serial);
			rs = pstmt.executeQuery();

			if (rs.next()) 
			{
				vol=rs.getInt("p_vol");
			}
			
			pstmt.close();
			
			sql = "delete from "+Id+" where p_serial = ? ";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, serial);
			pstmt.executeUpdate();
			
			return vol;
		} 
		catch (Exception ex) 
		{
			System.out.println("getBookAndVolBySerial() 에러 : " + ex);
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
		return 0;
	}
	
	public int SumOfBookVol(String Id)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try 
		{
			int vol=0;
			String sql = "select sum(p_vol) from "+Id;
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) 
			{
				vol=rs.getInt(1);
			}
							
			return vol;
		} 
		catch (Exception ex) 
		{
			System.out.println("SumOfBookVol() 에러 : " + ex);
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
		return 0;
	}
	
}
