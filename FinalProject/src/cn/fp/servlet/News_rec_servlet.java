package cn.fp.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.fp.Fclass.News;
import cn.fp.dao.impl.NewsDAOImpl;

/**
 * Servlet implementation class News_rec_servlet
 */
public class News_rec_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public News_rec_servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
		request.setCharacterEncoding("utf-8");
		int id =  Integer.parseInt(request.getParameter("id"));
		String title = request.getParameter("title");
		String time = request.getParameter("time");
		String location = request.getParameter("locate");
		String company = request.getParameter("company");
		String field = request.getParameter("field");
		String from = request.getParameter("from");
		String urll = request.getParameter("urll");
		
		
		NewsDAOImpl impl = new NewsDAOImpl();
		News data = new News();
		data.setCompany(company);
		data.setField(field);
		data.setFrom(from);
		data.setLocation(location);
		data.setTime(time);
		data.setTitle(title);
		data.setUrll(urll);
		data.setId(id);
		
		boolean judge = impl.rec(data);
		int result=0;
		if(judge == true) {
			result=1;
		}
		response.getWriter().println(result);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
