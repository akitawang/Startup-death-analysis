package cn.front.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import cn.fp.Fclass.Back_data;
import cn.fp.Fclass.Data;
import cn.fp.dao.impl.DataDAOImpl;

/**
 * Servlet implementation class index
 */
public class index extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public index() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
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
		int year2019=0;
		int year2018=0;
		int year2017=0;
		int year2016=0;
		List<Back_data> list_year=new ArrayList<Back_data>();
		list_year=impl.sum_year();
		for(int i=0;i<list_year.size();i++){
			//System.out.println("list集合的值如下："+list_year.get(i).rank +"------"+ list_year.get(i).number);
			if(list_year.get(i).rank==2019) {
				year2019=list_year.get(i).number;
			}
			if(list_year.get(i).rank==2018) {
				year2018=list_year.get(i).number;
			}
			if(list_year.get(i).rank==2017) {
				year2017=list_year.get(i).number;
			}
			if(list_year.get(i).rank==2016) {
				year2016=list_year.get(i).number;
			}
		}
		
		//request.setAttribute("list_year", list_year);
		request.setAttribute("year2019", year2019);
		request.setAttribute("year2018", year2018);
		request.setAttribute("year2017", year2017);
		request.setAttribute("year2016", year2016);
	
		
		//request.setAttribute("list_year", list_year);
		request.setAttribute("recordCount", recordCount);
		request.setAttribute("list", lists);
		request.setAttribute("pageNos", pageNo);
		
		//这里是转发，从Servlet跳转到showinfo.jsp页面，并且带上request和response对象中原有的参数
		request.getRequestDispatcher("/deathcompany/index.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
