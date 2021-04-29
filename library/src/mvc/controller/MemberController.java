package mvc.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mvc.model.memberDAO;
import mvc.model.memberDTO;

public class MemberController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public MemberController() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);		
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		HttpSession session = request.getSession();
				
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		//회원 가입창 이동
		if (command.equals("/JoinAction.member")) {
			RequestDispatcher rd = request.getRequestDispatcher("/member_join.jsp");
			rd.forward(request, response);
		}
		//회원 가입
		else if (command.equals("/MemberAddAction.member")) {
			requestMemberAdd(request);
			RequestDispatcher rd = request.getRequestDispatcher("/member_join_complete.jsp");
			rd.forward(request, response);						
		}
		//로그인 창 이동
		else if (command.equals("/LoginAction.member")) {
			RequestDispatcher rd = request.getRequestDispatcher("/member_login.jsp");
			rd.forward(request, response);						
		}
		//로그인
		else if (command.equals("/Login.member")) {
			String login = requestLoginProcess(request);
			String sessionId = (String)session.getAttribute("sessionId");
			
			//일반 로그인
			if(sessionId == null)
			{
				if(login.equals("fail"))
				{
					request.setAttribute("error", login);
					RequestDispatcher rd = request.getRequestDispatcher("/member_login.jsp");
					rd.forward(request, response);
				}
				else
				{
					session.setAttribute("sessionId",login);
					RequestDispatcher rd = request.getRequestDispatcher("/home.jsp");
					rd.forward(request, response);
				}
			}
			//회원 정보 확인 로그인
			else
			{
				if(login.equals("fail"))
				{
					request.setAttribute("error", login);
					RequestDispatcher rd = request.getRequestDispatcher("/member_update_login.jsp");
					rd.forward(request, response);
				}
				else
				{
					requestMemberInfo(request);
					RequestDispatcher rd = request.getRequestDispatcher("/member_update.jsp");
					rd.forward(request, response);
				}
			}
		}
		//회원 수정 이동
		else if (command.equals("/UpdateAction.member")) {
			RequestDispatcher rd = request.getRequestDispatcher("/member_update_login.jsp");
			rd.forward(request, response);						
		}
		//회원 수정
		else if (command.equals("/Update.member")){
			requestMemberUpdate(request);
			RequestDispatcher rd = request.getRequestDispatcher("/member_update_complete.jsp");
			rd.forward(request, response);						
		}
		//로그 아웃
		else if (command.equals("/LogoutAction.member")) {
			session.invalidate();
			RequestDispatcher rd = request.getRequestDispatcher("/home.jsp");
			rd.forward(request, response);						
		}
		//회원 탈퇴
		else if (command.equals("/DeleteAction.member")) {
			requestMemberDelete(request);
			RequestDispatcher rd = request.getRequestDispatcher("/member_delete_complete.jsp");
			rd.forward(request, response);						
		}
	}
	//회원 가입
	public void requestMemberAdd(HttpServletRequest request)
	{
		memberDAO dao = memberDAO.getInstance();
		String mail;
		
		memberDTO member = new memberDTO();
		member.setGender(request.getParameter("gender"));
		member.setId(request.getParameter("id"));
		member.setMailAddress(request.getParameter("email2"));
		member.setMailId(request.getParameter("email1"));
		member.setName(request.getParameter("name"));
		member.setPassword(request.getParameter("password"));
		member.setPhone(request.getParameter("phone"));
		member.setTel(request.getParameter("tel"));
		
		mail = member.getMailId()+"@"+member.getMailAddress();
		member.setMail(mail);
		
		dao.addMember(member);
		
		request.setAttribute("name",member.getName());
	}
	//로그인
	public String requestLoginProcess(HttpServletRequest request)
	{
		memberDAO dao = memberDAO.getInstance();
		
		memberDTO member = new memberDTO();
		member.setId(request.getParameter("ID"));
		member.setPassword(request.getParameter("PASSWORD"));
		
		String login = dao.LoginProcess(member,request);
		
		return login;
	}
	//회원 정보 확인 로그인
	public void requestMemberInfo(HttpServletRequest request)
	{
		memberDAO dao = memberDAO.getInstance();
		
		memberDTO member = new memberDTO();
		
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("sessionId");
				
		member = dao.getMemberInfo(id);
		
		request.setAttribute("member", member);
		
	}
	//회원 수정
	public void requestMemberUpdate(HttpServletRequest request)
	{
		memberDAO dao = memberDAO.getInstance();
		
		String mail;
		
		memberDTO member = new memberDTO();
		member.setGender(request.getParameter("gender"));
		member.setId(request.getParameter("id"));
		member.setMailAddress(request.getParameter("email2"));
		member.setMailId(request.getParameter("email1"));
		member.setPassword(request.getParameter("password"));
		member.setPhone(request.getParameter("phone"));
		member.setTel(request.getParameter("tel"));
		
		mail = member.getMailId()+"@"+member.getMailAddress();
		member.setMail(mail);
		
		dao.UpdateMember(member);
	}
	//회원 탈퇴
	public void requestMemberDelete(HttpServletRequest request)
	{
		memberDAO dao = memberDAO.getInstance();
		
		HttpSession session = request.getSession();
		String ID = (String) session.getAttribute("sessionId");
		
		dao.DeleteMember(ID);
		session.invalidate();
	}
	
}
