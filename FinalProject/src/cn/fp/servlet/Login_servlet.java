package cn.fp.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cn.fp.Fclass.Admin;
import cn.fp.dao.impl.AdminDAOImpl;

/**
 * Servlet implementation class Login_servlet
 */
public class Login_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login_servlet() {
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
		PrintWriter out = response.getWriter();
		
		PrintWriter pw = response.getWriter();
		
		//获取前端输入的用户名和密码
		String username = request.getParameter("username");
		String password = request.getParameter("userpass");
		
		HttpSession session = request.getSession();
		
		//System.out.println("username = "+username);
		//System.out.println("password = "+password);
	
		
		
		AdminDAOImpl impl = new AdminDAOImpl();
		Admin ub=null;
		ub=impl.getOneUser(username);
		
		if(ub!=null&&ub.getUserpass().equals(password)) {
			session.setAttribute("user", ub);
			System.out.println(ub.getUsername()+"登陆成功");
			pw.write("<script language='javascript'>window.location = '/FinalProject/index.jsp';</script>");
				
			}
		else {
			out.print("<script language='javaScript'>alert('登陆失败，请检查账号密码是否正确');</script>");
			String url = request.getContextPath()+"/login.html";
			response.setHeader("Refresh", "0;"+url);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
