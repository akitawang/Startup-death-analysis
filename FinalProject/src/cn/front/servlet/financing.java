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
import cn.fp.dao.impl.FinancingDAOImpl;
import cn.fp.dao.impl.InvestCompanyDAOImpl;

/**
 * Servlet implementation class financing
 */
public class financing extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public financing() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setCharacterEncoding("utf-8");
		FinancingDAOImpl financing = new FinancingDAOImpl();
		InvestCompanyDAOImpl invest = new InvestCompanyDAOImpl();
		List<Back_data> company = new ArrayList<Back_data>();
		List<Data> lists=new ArrayList<Data>();
		lists=financing.gettop();
		company = invest.getname();
		request.setAttribute("list", lists);
		request.setAttribute("company", company);
		//这里是转发，从Servlet跳转到showinfo.jsp页面，并且带上request和response对象中原有的参数
		request.getRequestDispatcher("/deathcompany/financing.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
