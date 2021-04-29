package mvc.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import mvc.model.boardDAO;
import mvc.model.boardDTO;
import mvc.model.wishDAO;
import mvc.model.wishDTO;

public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static final int LISTCOUNT = 5;
	
    public BoardController() {
        super();
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());
		
				
		response.setContentType("text/html; charset=utf-8");
		request.setCharacterEncoding("utf-8");
		
		//등록된 글 목록 페이지 출력하기
		if (command.equals("/boardListAction.board")) {
			requestBoardList(request);
			RequestDispatcher rd = request.getRequestDispatcher("./board_list.jsp");
			rd.forward(request, response);
		}
		// 글 등록 하기
		else if (command.equals("/boardWriteForm.board")) { 
				requestLoginName(request);
				RequestDispatcher rd = request.getRequestDispatcher("./board_writeForm.jsp");
				rd.forward(request, response);				
		}
		// 새로운 글 등록하기
		else if (command.equals("/boardWriteAction.board")) {
				requestBoardWrite(request);
				RequestDispatcher rd = request.getRequestDispatcher("/boardListAction.board");
				rd.forward(request, response);						
		} 
		//선택된 글 상세 페이지 가져오기
		else if (command.equals("/boardViewAction.board")) {
				requestBoardView(request);
				RequestDispatcher rd = request.getRequestDispatcher("./board_view.jsp");
				rd.forward(request, response);						
		} 
		//선택된 글 수정하기
		else if (command.equals("/boardUpdateAction.board")) { 
				requestBoardUpdate(request);
				RequestDispatcher rd = request.getRequestDispatcher("/boardListAction.board");
				rd.forward(request, response);
		}
		 //선택된 글 삭제하기
		else if (command.equals("/boardDeleteAction.board")) {
				requestBoardDelete(request);
				RequestDispatcher rd = request.getRequestDispatcher("/boardListAction.board");
				rd.forward(request, response);				
		} 
		//희망도서신청 페이지 가져오기
		else if (command.equals("/requestBookAction.board")) {
			RequestDispatcher rd = request.getRequestDispatcher("/book_wish.jsp");
			rd.forward(request, response);				
		} 
		//희망도서신청 등록
		else if (command.equals("/requestBookRegist.board")) {
			requestBookWishWrite(request);
			RequestDispatcher rd = request.getRequestDispatcher("/book_wish.jsp");
			rd.forward(request, response);				
		} 
		//희망도서 상세페이지
		else if (command.equals("/wishBoardViewAction.board")) {
			requestBookWishView(request);
			RequestDispatcher rd = request.getRequestDispatcher("/board_wish_view.jsp");
			rd.forward(request, response);				
		}
		//희망도서 페이지 삭제하기
		else if (command.equals("/boardWishDeleteAction.board")) {
			requestBoardWishDelete(request);
			RequestDispatcher rd = request.getRequestDispatcher("/boardListAction.board");
			rd.forward(request, response);				
		}
		//선택된 글 수정하기
		else if (command.equals("/boardWishUpdateAction.board")) { 
			requestBoardWishUpdate(request);
			RequestDispatcher rd = request.getRequestDispatcher("/boardListAction.board");
			rd.forward(request, response);
		}
	}
	//등록된 글 목록 가져오기	
	public void requestBoardList(HttpServletRequest request){
			
		boardDAO dao = boardDAO.getInstance();
		List<boardDTO> boardlist = new ArrayList<boardDTO>();
		wishDAO Wdao = wishDAO.getInstance();
		List<wishDTO> wishlist = new ArrayList<wishDTO>();
		
	  	int pageNum=1;
	  	int pageNum2=1;
	  	int on=0;
	  	String items=null;
		String text=null;
		
		int limit=LISTCOUNT;
		
				
		if(request.getParameter("pageNum")!=null) {
			pageNum=Integer.parseInt(request.getParameter("pageNum"));
			on=1;
		}
		
		
		if(request.getParameter("pageNum2")!=null) {
			pageNum2=Integer.parseInt(request.getParameter("pageNum2"));
			on=2;
		}		
		
		if(request.getParameter("items") != null) {
			items = request.getParameter("items");
			if(items.equals("null"))
				items=null;
		}
		
		if(request.getParameter("text") != null) {
			text = request.getParameter("text");
			if(text.equals("null"))
				text=null;
		}
		
		if(items=="" || text=="")
		{
			items=null;
			text=null;
		}
		
				
		int total_record = dao.getListCount(items, text);
		boardlist = dao.getBoardList(pageNum,limit, items, text);
		
		int total_record2 = Wdao.getListCount();
		wishlist = Wdao.getWishBoardList(pageNum2,limit);
		
		
		int total_page;
		int total_page2;
		
		if (total_record % limit == 0){     
	     	total_page =total_record/limit;  
	     	Math.floor(total_page);  
		}
		else{
		   total_page =total_record/limit;
		   Math.floor(total_page); 
		   total_page =  total_page + 1; 
		}
		
		if (total_record2 % limit == 0){     
	     	total_page2 =total_record2/limit;  
	     	Math.floor(total_page2);  
		}
		else{
		   total_page2 =total_record2/limit;
		   Math.floor(total_page2); 
		   total_page2 =  total_page2 + 1; 
		}
		
		
		request.setAttribute("items",items);
		request.setAttribute("text",text);
   		request.setAttribute("pageNum", pageNum);		  
   		request.setAttribute("total_page", total_page);   
		request.setAttribute("total_record",total_record); 
		request.setAttribute("boardlist", boardlist);
		request.setAttribute("wishlist",wishlist);
		request.setAttribute("pageNum2", pageNum2);
		request.setAttribute("total_page2", total_page2);   
		request.setAttribute("total_record2",total_record2);
		request.setAttribute("on",on);
	}
	//인증된 사용자명 가져오기
	public void requestLoginName(HttpServletRequest request){
					
		String id = request.getParameter("id");
		
		boardDAO  dao = boardDAO.getInstance();
		
		String name = dao.getLoginNameById(id);		
		
		request.setAttribute("name", name);									
	}
	// 새로운 글 등록하기
	public void requestBoardWrite(HttpServletRequest request){  
					
		boardDAO dao = boardDAO.getInstance();		
		
		boardDTO board = new boardDTO();
		board.setId(request.getParameter("id"));
		board.setName(request.getParameter("name"));
		board.setSubject(request.getParameter("subject"));
		board.setContent(request.getParameter("content"));	
		
		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy/MM/dd (HH:mm:ss)");
		String regist_day = formatter.format(new java.util.Date()); 
	
		board.setHit(0);
		board.setRegist_day(regist_day);
		board.setIp(request.getRemoteAddr());			
		
		dao.insertBoard(board);								
	}
	//선택된 글 상세 페이지 가져오기
	public void requestBoardView(HttpServletRequest request){
					
		boardDAO dao = boardDAO.getInstance();
		int num = Integer.parseInt(request.getParameter("num"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));	
		String items = request.getParameter("items");
		String text = request.getParameter("text");
		
		boardDTO board = new boardDTO();
		board = dao.getBoardByNum(num, pageNum);		
		
		request.setAttribute("num", num);		 
   		request.setAttribute("page", pageNum); 
   		request.setAttribute("board", board);
   		request.setAttribute("items", items); 
   		request.setAttribute("text", text);
	}
	//선택된 글 내용 수정하기
	public void requestBoardUpdate(HttpServletRequest request){
					
		int num = Integer.parseInt(request.getParameter("num"));
				
		boardDAO dao = boardDAO.getInstance();		
		
		boardDTO board = new boardDTO();		
		board.setNum(num);
		board.setName(request.getParameter("name"));
		board.setSubject(request.getParameter("subject"));
		board.setContent(request.getParameter("content"));		
		
		 java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy/MM/dd(HH:mm:ss)");
		 String regist_day = formatter.format(new java.util.Date()); 
		 
		 board.setHit(0);
		 board.setRegist_day(regist_day);
		 board.setIp(request.getRemoteAddr());			
		
		 dao.updateBoard(board);								
	}
	//선택된 글 삭제하기
	public void requestBoardDelete(HttpServletRequest request){
					
		int num = Integer.parseInt(request.getParameter("num"));

		
		boardDAO dao = boardDAO.getInstance();
		dao.deleteBoard(num);							
	}	
	//희망도서신청 등록
	public void requestBookWishWrite(HttpServletRequest request){
		HttpSession session = request.getSession();
		wishDAO dao = wishDAO.getInstance();		
		
		wishDTO wish = new wishDTO();
		wish.setPublisher(request.getParameter("publisher"));
		wish.setAuthor(request.getParameter("author"));
		wish.setDescription(request.getParameter("description"));
		wish.setLocation(request.getParameter("location"));
		wish.setName(request.getParameter("name"));
		wish.setPhone(request.getParameter("phone"));
		wish.setPrice(request.getParameter("price"));
		wish.setSms(request.getParameter("sms"));
		wish.setYear(request.getParameter("year"));
		wish.setIp(request.getRemoteAddr());
		wish.setId((String)session.getAttribute("sessionId"));
		
		dao.insertWishBoard(wish);
	}
	//희망도서 상세페이지
	public void requestBookWishView(HttpServletRequest request){
		wishDAO dao = wishDAO.getInstance();
		int num = Integer.parseInt(request.getParameter("num"));
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		String[] select = new String[] {"의창도서관", "고향의봄", "명곡도서관", "성산도서관", "상남도서관", "마산합포도서관", "마산회원도서관", "내서도서관", "중리초등도서관"};
		
		
		wishDTO wish = new wishDTO();
		wish = dao.getWishBoardByNum(num, pageNum);
		
		for(int i = 0; i< select.length ;i++)
		{
			if(select[i].equals(wish.getLocation()))
			{
				select[i]="selected";
				break;
			}
		}
		
		request.setAttribute("num", num);		 
   		request.setAttribute("page", pageNum); 
   		request.setAttribute("wish", wish);
   		request.setAttribute("select",select);
	}
	//희망도서 페이지 삭제
	public void requestBoardWishDelete(HttpServletRequest request){
		
		int num = Integer.parseInt(request.getParameter("num"));
	
		wishDAO dao = wishDAO.getInstance();
		dao.deleteBoard(num);
		
		
	}
	
	//선택된 희망도서 내용 수정하기
	public void requestBoardWishUpdate(HttpServletRequest request){
					
		int num = Integer.parseInt(request.getParameter("num"));
		
		wishDAO dao = wishDAO.getInstance();		
		
		wishDTO wish = new wishDTO();		
		wish.setNum(num);
		wish.setName(request.getParameter("name"));
		wish.setDescription(request.getParameter("description"));
		wish.setAuthor(request.getParameter("author"));
		wish.setId(request.getParameter("id"));
		wish.setLocation(request.getParameter("location"));
		wish.setName(request.getParameter("name"));
		wish.setPhone(request.getParameter("phone"));
		wish.setPrice(request.getParameter("price"));
		wish.setPublisher(request.getParameter("publisher"));
		wish.setSms(request.getParameter("sms"));
		wish.setYear(request.getParameter("year"));
		 
		wish.setIp(request.getRemoteAddr());			
		
		dao.updateWishBoard(wish);								
	}
}
