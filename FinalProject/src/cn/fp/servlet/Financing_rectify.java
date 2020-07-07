package cn.fp.servlet;

import java.io.IOException;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import cn.fp.dao.impl.FinancingDAOImpl;


/**
 * Servlet implementation class Financing_rectify
 */
public class Financing_rectify extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Financing_rectify() {
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
		int number =  Integer.parseInt(request.getParameter("number"));
		String name = request.getParameter("name");	
		
		FinancingDAOImpl dao = new FinancingDAOImpl();
		boolean judge = dao.rec(id,name,number);
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
