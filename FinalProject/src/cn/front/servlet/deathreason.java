package cn.front.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import cn.fp.Fclass.Data;
import cn.fp.dao.impl.ReasonDAOImpl;

/**
 * Servlet implementation class deathreason
 */
public class deathreason extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public deathreason() {
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
		String reason = request.getParameter("reason");
		if(reason == null) {
			reason = "市场伪需求"; 
		}
		
		List<Data> list = new ArrayList<Data>();
		ReasonDAOImpl dao = new ReasonDAOImpl();
		
		list = dao.getindex_data(reason);
		request.setAttribute("list", list);
		request.getRequestDispatcher("/deathcompany/deathreason.jsp").forward(request, response);
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
