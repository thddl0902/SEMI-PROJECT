package com.admin.action;

import java.io.IOException;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.controller.Action;
import com.shop.controller.ActionForward;
import com.shop.model.AdminDAO;
import com.shop.model.UserDTO;

public class ConsumerUpdateOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		int user_mileage=Integer.parseInt(request.getParameter("user_mileage").trim());
		int user_no=Integer.parseInt(request.getParameter("user_no").trim());
		UserDTO dto= new UserDTO();
		dto.setUser_no(user_no);
		dto.setUser_mileage(user_mileage);
		
		AdminDAO dao= AdminDAO.getInstance();
		int check= dao.updateUser(dto);
	
		ActionForward forward = new ActionForward();
		PrintWriter out = response.getWriter();
		
		if(check > 0) {
			forward.setRedirect(true);
			forward.setPath("admin_manage_consumer.do");
		}else {
			out.println("<script>");
			out.println("alert('마일리지 수정 실패~~~')");
			out.println("history.back()");
			out.println("</script>");
		}
		
		return forward;
	}

}
