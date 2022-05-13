package com.seller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.shop.controller.Action;
import com.shop.controller.ActionForward;
import com.seller.model.CategoryDAO;
import com.seller.model.CategoryDTO;

public class SellProInputAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		// 카테고리 코드 전체 리스트를 DB에서 조회하여
		// 상품 등록 폼 페이지(view page)로 이동시키는 비지니스 로직.
		
		CategoryDAO dao = CategoryDAO.getInstance();
		
		List<CategoryDTO> list = dao.getCategoryList();
		
		request.setAttribute("categoryList", list);
		
		
		ActionForward forward = new ActionForward();
		
		forward.setRedirect(false);
		
		forward.setPath("seller/sellProInput.jsp");
		
		
		return forward;
		
	}

}
