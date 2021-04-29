package mvc.model;

import java.sql.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import mvc.database.DBConnection;

public class memberDAO {
	
	private static memberDAO instance;
	
	private memberDAO() {
	}

	public static memberDAO getInstance() {
		if (instance == null)
			instance = new memberDAO();
		return instance;
	}
	
	public void addMember(memberDTO member)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBConnection.getConnection();
			
			String sql = "insert into memberlist(m_name, m_id, m_gender, m_password, m_tel, m_phone, m_mail, m_mail_id, m_mail_address) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
	   		pstmt = conn.prepareStatement(sql);
	   		pstmt.setString(1,member.getName());
	   		pstmt.setString(2,member.getId());
	   		pstmt.setString(3,member.getGender());
	   		pstmt.setString(4,member.getPassword());
	   		pstmt.setString(5,member.getTel());
	   		pstmt.setString(6,member.getPhone());
	   		pstmt.setString(7,member.getMail());
	   		pstmt.setString(8,member.getMailId());
	   		pstmt.setString(9,member.getMailAddress());
	   		pstmt.executeUpdate();
	   		
	   		pstmt.close();
	   		
	   		sql = "create table if not exists "+member.getId()+
	   				"(p_num int not null auto_increment, "+
	   				"p_id varchar(20) not null, "+
	   				"p_name varchar(100) not null, "+
	   				"p_publisher varchar(100), "+
	   				"p_author varchar(100), "+
	   				"p_location varchar(100), "+
	   				"p_serial varchar(20), "+
	   				"p_vol int , "+
	   				"p_state varchar(10), "+
	   				"p_registday varchar(30), "+
	   				"PRIMARY KEY (p_num)) DEFAULT CHARSET = UTF8;";
	   		pstmt = conn.prepareStatement(sql);
	   		pstmt.execute();
	   		
		} 
		catch (Exception ex) 
		{
			System.out.println("addMember() 에러 : " + ex);
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
	
	public String LoginProcess(memberDTO member,HttpServletRequest request)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;	
		HttpSession session = request.getSession();
		String logId = (String)session.getAttribute("sessionId");
		
		
		String ID = "";
		String PASSWORD = "";
		
		String sql = "select * from memberlist where m_id = ? and m_password = ?";

		try {
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getId());
			pstmt.setString(2, member.getPassword());
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				ID = rs.getString("m_id");
				PASSWORD = rs.getString("m_password");
			}
			if(member.getId() == "")
				return "fail";
			
			else if(logId == null)
			{
				if(member.getId().equals(ID) && member.getPassword().equals(PASSWORD))
					return ID;
				else
					return "fail";
			}
			else if(member.getId().equals(ID) && member.getPassword().equals(PASSWORD) && member.getId().equals(logId))
				return ID;
			else
				return "fail";
		}	
		catch (Exception ex) 
		{
			System.out.println("LoginProcess() 에러 : " + ex);
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
		return null;
	}
	
	public memberDTO getMemberInfo(String id)
	{
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		memberDTO member = null;
		
		String sql = "select * from memberlist where m_id = ?";
		try 
		{
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next())
			{
				member = new memberDTO();
				member.setId(rs.getString("m_id"));
				member.setGender(rs.getString("m_gender"));
				member.setMailId(rs.getString("m_mail_id"));
				member.setMailAddress(rs.getString("m_mail_address"));
				member.setName(rs.getString("m_name"));
				member.setPhone(rs.getString("m_phone"));
				member.setTel(rs.getString("m_tel"));
				member.setMail(rs.getString("m_mail"));
			}
			return member;
		}
		catch (Exception ex) 
		{
			System.out.println("getMemberInfo() 에러 : " + ex);
		} 
		finally 
		{
			try {				
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
	
	public void UpdateMember(memberDTO member)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		String sql = "update memberlist set m_gender=?, m_password=?, m_tel=?, m_phone=?, m_mail=?, m_mail_id=?, m_mail_address=? where m_id=?";
		
		try
		{
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1,member.getGender());
	   		pstmt.setString(2,member.getPassword());
	   		pstmt.setString(3,member.getTel());
	   		pstmt.setString(4,member.getPhone());
	   		pstmt.setString(5,member.getMail());
	   		pstmt.setString(6,member.getMailId());
	   		pstmt.setString(7,member.getMailAddress());
	   		pstmt.setString(8,member.getId());
	   		pstmt.executeUpdate();
		}
		catch (Exception ex) {
			System.out.println("UpdateMember() 에러 : " + ex);
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
	
	public boolean IdCheck(String id)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int count=0;
		boolean notice;
		
		String sql = "select count(*) from memberlist where m_id = ?";
		try 
		{
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if (rs.next()) 
				count = rs.getInt(1);
			
			
			if(count == 1)
			{	
				notice=false;
				return notice;
			}
			else
			{
				notice=true;
				return notice;
			}
		}	
		catch (Exception ex) 
		{
			System.out.println("IdCheck() 에러 : " + ex);
		} 
		finally 
		{
			try {				
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
		return false;		
			
	}
	
	public void DeleteMember(String ID)
	{
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try
		{	
			String sql = "delete from memberlist where m_id=?";
			
			conn = DBConnection.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, ID);
    		pstmt.executeUpdate();
    		
    		pstmt.close();
    		
    		sql = "drop table "+ID+";";
    		pstmt = conn.prepareStatement(sql);
    		pstmt.execute();
    		
		}
		catch (Exception ex) {
			System.out.println("DeleteMember() 에러 : " + ex);
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
