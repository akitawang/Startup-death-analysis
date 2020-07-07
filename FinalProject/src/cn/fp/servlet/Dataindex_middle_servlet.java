package cn.fp.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

import cn.fp.Fclass.Dataindex_middle;
import cn.fp.dao.impl.Dataindex_middle_showDAOImpl;

/**
 * Servlet implementation class Dataindex_middle_servlet
 */
public class Dataindex_middle_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Dataindex_middle_servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List< Dataindex_middle> listt = new ArrayList< Dataindex_middle>();
		 Dataindex_middle_showDAOImpl dao = new  Dataindex_middle_showDAOImpl();
		listt = dao.getOne();
		
		ObjectMapper mapper = new ObjectMapper(); //提供java-json相互转换功能的类
		String json = mapper.writeValueAsString(listt); //将list中的对象转换为Json格式的数组
		//System.out.println(json);
		//将json数据返回给客户端
		response.setContentType("text/html; charset=utf-8");
		response.getWriter().write(json);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
