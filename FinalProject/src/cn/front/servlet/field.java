package cn.front.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.fp.Fclass.Data;
 
import cn.fp.dao.impl.TypeCompanyDAOImpl;

/**
 * Servlet implementation class field
 */
public class field extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public field() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("utf-8");
		String name = request.getParameter("name");
		String field = request.getParameter("field");
		String Field = "电子商务";
		if(field == null) {
			Field = "电子商务";
		}
		 if(field != "") {
			 Field = field;
		 }
		 if(field == ""  && name != "") {
			 Field="";
		 }
		 System.out.print(Field);
		int pageNo = 1;
		TypeCompanyDAOImpl impl = new TypeCompanyDAOImpl();
		
		List<Data> lists=new ArrayList<Data>();
		String pageno=request.getParameter("pageNos");
		if(pageno != null){
		pageNo=Integer.parseInt(pageno);
		}
		
		lists=impl.getOne(pageNo,Field,name);
		int recordCount=impl.getPage(Field,name);
		 
		request.setAttribute("recordCount", recordCount);
		request.setAttribute("list", lists);
		request.setAttribute("pageNos", pageNo);
		
		//这里是转发，从Servlet跳转到showinfo.jsp页面，并且带上request和response对象中原有的参数
		request.getRequestDispatcher("/deathcompany/field.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
