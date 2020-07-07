package cn.fp.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.fp.Fclass.Data;
import cn.fp.dao.impl.DataDAOImpl;


/**
 * Servlet implementation class List_company_servlet
 */
public class List_company_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public List_company_servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	
			//将数据库中查询到的信息封装在user对象中，use对象保存在request中，之后将通过request对象将数据传递到页面
			//需要的话也可以只传递一个参数request.setAttribute("id", user.getId());

			response.setCharacterEncoding("utf-8");
			int pageNo = 1;
			DataDAOImpl impl = new DataDAOImpl();
			List<Data> lists=new ArrayList<Data>();
			String pageno=request.getParameter("pageNos");
			if(pageno != null){
			pageNo=Integer.parseInt(pageno);
			}
			lists=impl.getOne(pageNo);
			int recordCount=impl.getPage();
			request.setAttribute("recordCount", recordCount);
			request.setAttribute("list", lists);
			request.setAttribute("pageNos", pageNo);
			
			//这里是转发，从Servlet跳转到showinfo.jsp页面，并且带上request和response对象中原有的参数
			request.getRequestDispatcher("/list_show/company_info.jsp").forward(request, response);
				
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
