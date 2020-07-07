package cn.fp.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.fp.Fclass.Data;
import cn.fp.dao.impl.DataDAOImpl;

/**
 * Servlet implementation class List_company_insert_servlet
 */
public class List_company_insert_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public List_company_insert_servlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String number=request.getParameter("number");       //���
		String com_name=request.getParameter("com_name");  //��˾����
		String com_addr=request.getParameter("com_addr");  //��˾����
		String cat=request.getParameter("cat");       //��˾����
		String se_cat=request.getParameter("se_cat");    //������
		String com_des=request.getParameter("com_des");   // ��˾����
		String born_data=request.getParameter("born_data"); //��������
		String death_data=request.getParameter("death_data");//��������
		String live_days=request.getParameter("live_days"); //���ʱ��
		String financing=request.getParameter("financing");  //�������
		int total_money=Integer.parseInt(request.getParameter("total_money"));  //�����ܶ�
		String death_reason=request.getParameter("death_reason");  //����ԭ��
		String invest_name=request.getParameter("invest_name");   //Ͷ�ʻ���
		String ceo_name=request.getParameter("ceo_name");   //CEO����
		String ceo_des=request.getParameter("ceo_des");    // CEOְλ
		String ceo_per_des=request.getParameter("ceo_per_des");  // CEO����
		 
		if(number=="") {
			number="null";
		}
		if(com_name=="") {
			com_name="null";
		}
		if(com_addr=="") {
			com_addr="null";
		}
		if(cat=="") {
			cat="null";
		}
		if(se_cat=="") {
			se_cat="null";
		}
		if(com_des=="") {
			com_des="null";
		}
		if(born_data=="") {
			born_data="null";
		}
		if(death_data=="") {
			death_data="null";
		}
		if(live_days=="") {
			live_days="null";
		}
		if(financing=="") {
			financing="null";
		}
		
		if(death_reason=="") {
			death_reason="null";
		}
		if(invest_name=="") {
			invest_name="null";
		}
		if(ceo_name=="") {
			ceo_name="null";
		}
		if(ceo_des=="") {
			ceo_des="null";
		}
		if(ceo_per_des=="") {
			ceo_per_des="null";
		}
		
		DataDAOImpl impl = new DataDAOImpl();
		Data data = new Data();
		data.setBorn_data(born_data);
		data.setCat(cat);
		data.setCeo_des(ceo_des);
		data.setCeo_name(ceo_name);
		data.setCeo_per_des(ceo_per_des);
		data.setCom_addr(com_addr);
		data.setCom_des(com_des);
		data.setCom_name(com_name);
		data.setDeath_data(death_data);
		data.setDeath_reason(death_reason);
		data.setFinancing(financing);
		data.setInvest_name(invest_name);
		data.setLive_days(live_days);
		data.setNumber(number);
		data.setSe_cat(se_cat);
		data.setTotal_money(total_money);
		
		boolean judge = impl.add(data);
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
