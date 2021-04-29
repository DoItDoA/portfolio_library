package mvc.controller;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import java.util.Enumeration;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.*;
import com.oreilly.servlet.multipart.*;

import javax.servlet.RequestDispatcher;

import mvc.model.bookDAO;
import mvc.model.bookDTO;
import mvc.model.privateBookDAO;
import mvc.model.privateBookDTO;

public class BookController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
		
	public BookController() {
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
		
		// 도서 등록하기
		if (command.equals("/bookRegistAction.book")) {	
			requestBookRegist(request);
			RequestDispatcher rd = request.getRequestDispatcher("/bookSearchAction.book");
			rd.forward(request, response);
		}
		 //도서 찾기 리스트
		else if (command.equals("/bookSearchAction.book")) {
			requestBookList(request);
			RequestDispatcher rd = request.getRequestDispatcher("./book_search.jsp");
			rd.forward(request, response);
		}
		// 도서 상세 페이지 가져오기
		else if (command.equals("/BookViewAction.book")) {
			requestBookView(request);
			RequestDispatcher rd = request.getRequestDispatcher("./book_detail.jsp");
			rd.forward(request, response);						
		} 
		// 도서 예약
		else if (command.equals("/AddOneBookCart.book")) {
			int check = requestAddOneBook(request);
			if(check==0)
			{
				request.setAttribute("checkVol",check);
				RequestDispatcher rd = request.getRequestDispatcher("/book_detail.jsp");
				rd.forward(request, response);
			}
			else
			{
				RequestDispatcher rd = request.getRequestDispatcher("/GetBookList.book");
				rd.forward(request, response);
			}
		} 
		// 도서 리스트 담기
		else if (command.equals("/AddBookCart.book")) {
			requestAddBookCart(request);
			RequestDispatcher rd = request.getRequestDispatcher("/bookSearchAction.book");
			rd.forward(request, response);	
		}
		
		// 도서 담기 리스트 출력
		else if (command.equals("/GetBookList.book")) {
			requestGetBookCart(request);
			RequestDispatcher rd = request.getRequestDispatcher("./books_lean_history.jsp");
			rd.forward(request, response);
		} 
		// 도서 리스트 삭제
		else if (command.equals("/DeleteBookList.book")) {
			requestDeleteBookCart(request);
			RequestDispatcher rd = request.getRequestDispatcher("/GetBookList.book");
			rd.forward(request, response);
		} 
		// 베스트 도서
		else if (command.equals("/BestBookList.book")) {
			requestBestBookList(request);
			RequestDispatcher rd = request.getRequestDispatcher("/books_best.jsp");
			rd.forward(request, response);
		} 
		
	}
	
	// 도서 등록하기
	public void requestBookRegist(HttpServletRequest request) 
	{
		bookDAO dao = bookDAO.getInstance();
		
		bookDTO bookList = new bookDTO();
		
		String filename = "";
		String realFolder = request.getSession().getServletContext().getRealPath("/images");
		String encType = "utf-8";
		int maxSize = 10*1024*1024;
		
		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy/MM/dd(HH:mm:ss)");
		String regist_day = formatter.format(new java.util.Date());
		
		try
		{
			MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
			
			int b_vol = Integer.parseInt(multi.getParameter("b_vol"));
			
			if(b_vol < 0) //도서 수량 (-)방지
				b_vol = 0;
			
			bookList.setName(multi.getParameter("b_name"));
			bookList.setVol(b_vol); 
			bookList.setSerial(multi.getParameter("b_serial"));
			bookList.setAuthor(multi.getParameter("b_author"));
			bookList.setPublisher(multi.getParameter("b_publisher"));
			bookList.setLocation(multi.getParameter("b_location")); 
			bookList.setState(multi.getParameter("b_state"));
			bookList.setDescription(multi.getParameter("b_description"));
			bookList.setRegistday(regist_day);
			
			Enumeration files = multi.getFileNames();
			String fname = (String) files.nextElement();
			filename = multi.getFilesystemName(fname);
			bookList.setImage(filename);
		}
		
		catch(Exception ex)
		{
			System.out.println("MultipartRequest 에러: " + ex);
		}
				
		dao.insertBook(bookList);
	}
	
	// 도서 리스트 출력
	public void requestBookList(HttpServletRequest request) 
	{
		bookDAO dao = bookDAO.getInstance();
		List<bookDTO> bookList = new ArrayList<bookDTO>();
		
		int pageNum = 1;
		int limit = 5;
		
		String items=null;
		String text=null;
		String locations=null;
		String dataSort="b_registday desc";
				
		int checkVol=1;
				
		if(request.getParameter("dataSort")!=null) {
			dataSort = (String)request.getParameter("dataSort");
		}
		
		if(request.getParameter("listNum")!=null) {
			limit=Integer.parseInt((String)request.getParameter("listNum"));
			
		}
				
		if(request.getParameter("pageNum")!=null)
			pageNum=Integer.parseInt((String)request.getParameter("pageNum"));
	
		if(request.getParameter("items")!=null) {
			items = (String)request.getParameter("items");
			if(items.equals("null"))
				items = null;
		}
		if(request.getParameter("text")!=null) {
			text = (String)request.getParameter("text");
			if(text.equals("null"))
				text = null;
		}
		if(request.getParameter("locations")!=null) {
			locations = (String)request.getParameter("locations");
			if(locations.equals("null"))
				locations = null;
		}
		if(request.getAttribute("checkVol")!=null) {	
			checkVol=((Integer) request.getAttribute("checkVol")).intValue();
		}
		if(request.getAttribute("pageNum")!=null)
			pageNum=((Integer) request.getAttribute("pageNum")).intValue();
	
		if(request.getAttribute("items")!=null) {
			items = (String)request.getAttribute("items");
			if(items.equals("null"))
				items = null;
		}
		if(request.getAttribute("text")!=null) {
			text = (String)request.getAttribute("text");
			if(text.equals("null"))
				text = null;
		}
		if(request.getAttribute("locations")!=null) {
			locations = (String)request.getAttribute("locations");
			if(locations.equals("null"))
				locations = null;
		}
		
		
		
		if(locations=="")
		{
			locations=null;
		}
		if(text=="")
		{
			text=null;
		}
		
		
		int total_record = dao.getListCount(text, items, locations);
		bookList = dao.getBookList(pageNum, limit, text, items, locations, dataSort);
		
		
		
		int total_page;
		
		if (total_record % limit == 0)
		{
	     	total_page =total_record/limit; 
	     	Math.floor(total_page);  
		}
		else
		{
		   total_page =total_record/limit;
		   Math.floor(total_page); 
		   total_page =  total_page + 1; 
		}
		request.setAttribute("limit",limit);
		request.setAttribute("dataSort",dataSort);
		request.setAttribute("items",items);
		request.setAttribute("text",text);
		request.setAttribute("locations",locations);
		request.setAttribute("pageNum", pageNum);		 
   		request.setAttribute("total_page", total_page);
   		request.setAttribute("total_record",total_record);
   		request.setAttribute("bookList", bookList);
   		request.setAttribute("checkVol", checkVol);
	}
	
	// 도서 상세 페이지 가져오기
	public void requestBookView(HttpServletRequest request) 
	{
		bookDAO dao = bookDAO.getInstance();
		
		int pageNum = Integer.parseInt(request.getParameter("pageNum"));
		String serial = request.getParameter("serial");
		String items = request.getParameter("items");
		String text = request.getParameter("text");
		String locations = request.getParameter("locations");
		String listNum = request.getParameter("listNum");
		String dataSort = request.getParameter("dataSort");
		
		bookDTO BookDetail = new bookDTO();
		BookDetail = dao.getBookBySerial(serial);
		
		request.setAttribute("listNum", listNum);
		request.setAttribute("dataSort", dataSort);
		request.setAttribute("pageNum", pageNum);		 
   		request.setAttribute("serial", serial); 
   		request.setAttribute("BookDetail", BookDetail);
   		request.setAttribute("items", items);
   		request.setAttribute("text", text);
   		request.setAttribute("locations", locations);
	}
	
	//도서 리스트 담기
	public void requestAddBookCart(HttpServletRequest request) 
	{
		privateBookDAO Pdao = privateBookDAO.getInstance();
		bookDAO dao = bookDAO.getInstance();
		List<privateBookDTO> requestList = new ArrayList<privateBookDTO>();
		bookDTO book = new bookDTO();
		
		HttpSession session = request.getSession();
		
		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy/MM/dd");
		String registday = formatter.format(new java.util.Date());
		
		int limit=Integer.parseInt(request.getParameter("listNum"));
		int pageNum=Integer.parseInt(request.getParameter("pageNum"));
		int check=1;
		String items = (String)request.getParameter("items");
		String text = (String)request.getParameter("text");
		String locations = (String)request.getParameter("locations");
		
		String[] books = new String[limit];  
		
		
		for (int i=0; i<limit; i++ )
		{
			books[i] = (String)request.getParameter("CheckBook"+i);
			
			
			if(books[i] != null) {
				
				book = dao.getBookBySerial(books[i]);
				
				privateBookDTO Pbook = new privateBookDTO();
				
				Pbook.setVol(0);
				Pbook.setAuthor(book.getAuthor());
				Pbook.setLocation(book.getLocation());
				Pbook.setSerial(book.getSerial());
				Pbook.setId((String)session.getAttribute("sessionId"));
				Pbook.setName(book.getName());
				Pbook.setPublisher(book.getPublisher());
				Pbook.setState(book.getState());			
				Pbook.setRegistday(registday);
				requestList.add(Pbook);
				if(book.getVol()<=0)
					check=0;
			}
			if(check==0)
				break;
		}
		
		//개인 데이터베이스에 정보 삽입
		if(check != 0)
		{
			int[] volList = Pdao.checkVolList(requestList);
			for(int j=0; j<requestList.size(); j++ )
			{
				privateBookDTO list = (privateBookDTO)requestList.get(j);
				if(volList[j]==0)
				{
					dao.removeBookListBySerial(list.getSerial());
					Pdao.insertBookList(requestList, j);
				}
				else
				{
					dao.removeBookListBySerial(list.getSerial());
					Pdao.addBookQntList(requestList, j, volList);
				}
			}
			check=2;
		}
		request.setAttribute("items",items);
		request.setAttribute("text",text);
		request.setAttribute("locations",locations);
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("checkVol",check);
								
	}
	// 도서 예약
	public int requestAddOneBook(HttpServletRequest request) 
	{
		privateBookDAO Pdao = privateBookDAO.getInstance();
		bookDAO dao = bookDAO.getInstance();
		bookDTO book = new bookDTO();
		
		HttpSession session = request.getSession();
		
		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy/MM/dd");
		String registday = formatter.format(new java.util.Date());
		String items = (String)request.getParameter("items");
		String text = (String)request.getParameter("text");
		String locations = (String)request.getParameter("locations");
		String dataSort = (String)request.getParameter("dataSort");
		String listNum = (String)request.getParameter("listNum");
		
		int pageNum=Integer.parseInt(request.getParameter("pageNum"));
		int check=1;
		
		  
		String checkBook = (String)request.getParameter("CheckBook");
			
		book = dao.getBookBySerial(checkBook);
				
		privateBookDTO Pbook = new privateBookDTO();
		
		Pbook.setVol(0);
		Pbook.setAuthor(book.getAuthor());
		Pbook.setLocation(book.getLocation());
		Pbook.setSerial(book.getSerial());
		Pbook.setId((String)session.getAttribute("sessionId"));
		Pbook.setName(book.getName());
		Pbook.setPublisher(book.getPublisher());
		Pbook.setState(book.getState());
		Pbook.setRegistday(registday);
		
		request.setAttribute("serial", book.getSerial());
		request.setAttribute("BookDetail", book);
		request.setAttribute("listNum", listNum);
		request.setAttribute("dataSort", dataSort);
		request.setAttribute("items",items);
		request.setAttribute("text",text);
		request.setAttribute("locations",locations);
		request.setAttribute("pageNum", pageNum);
		
		if(book.getVol()<=0)
		{
			check=0;
			return check;
		}
		//개인 데이터베이스에 정보 삽입
		else if(check!=0)
		{
			int insertVol = Pdao.checkVol(Pbook);
			if(insertVol==0)
			{
				dao.removeBookBySerial(book.getSerial());
				Pdao.insertBook(Pbook);
			}
			else
			{
				dao.removeBookBySerial(book.getSerial());
				Pdao.addBookQnt(Pbook,insertVol);
			}
			
		}
		return check;
	}
	
	//도서 담기 리스트 출력
	public void requestGetBookCart(HttpServletRequest request)
	{
		privateBookDAO Pdao = privateBookDAO.getInstance();
		List<privateBookDTO> requestList = new ArrayList<privateBookDTO>();
		privateBookDTO book = new privateBookDTO();
		
		HttpSession session = request.getSession();
		Calendar cal = Calendar.getInstance();
		java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy/MM/dd");
				
		String lateRegistday;
		String Id=(String)session.getAttribute("sessionId");
		int[] currentLoan = new int[3];
		int cnt = 0;
		currentLoan[0] = Pdao.SumOfBookVol(Id);
		//currentLoan[1];
		//currentLoan[1];
		book.setId(Id);
		String date1;
		String date2;
		
		requestList = Pdao.getBookList(book);
		for(int i=0; i<requestList.size(); i++)
		{
			book = (privateBookDTO)requestList.get(i);
					
			try{
				Date date = formatter.parse(book.getRegistday());
			
				cal.setTime(date);
				cal.add(Calendar.DATE, 15);
				lateRegistday = formatter.format(cal.getTime());
				book.setLateRegistday(lateRegistday);
				date1 = lateRegistday.replace("/","");
				date2 = formatter.format(new Date()).replace("/","");
								
				if(Integer.parseInt(date2)>Integer.parseInt(date1))
				{
					cnt = cnt+book.getVol();
				}
			}
			catch(Exception e)
			{
				System.out.println("Todate 에러 : "+e);
			}
			
		}
		currentLoan[2] = cnt;
		currentLoan[1] = currentLoan[0]-currentLoan[2];
		
		request.setAttribute("list",requestList);
		request.setAttribute("currentLoan",currentLoan);
	}
	//도서 리스트 삭제
	public void requestDeleteBookCart(HttpServletRequest request) 
	{
		privateBookDAO Pdao = privateBookDAO.getInstance();
		bookDAO dao = bookDAO.getInstance();
		
		HttpSession session = request.getSession();
		String Id = (String)session.getAttribute("sessionId");
		
		int size=Integer.parseInt(request.getParameter("size"));
		
		int vol=0;
				
		String[] books = new String[size];  
				
		for (int i=0; i<size; i++ )
		{
			books[i] = (String)request.getParameter("CheckBook"+i);
			
			if(books[i] != null) {
				
				vol = Pdao.getBookAndVolBySerial(books[i],Id);
				
				dao.bookReturnVol(vol,books[i]);
			}
		}
	}
	// 베스트 도서
	public void requestBestBookList(HttpServletRequest request)
	{
		bookDAO dao = bookDAO.getInstance();
		List<bookDTO> bookList = new ArrayList<bookDTO>();
		bookList = dao.getBookHit();
		
		request.setAttribute("HitBook", bookList);		
		
	}
	
}