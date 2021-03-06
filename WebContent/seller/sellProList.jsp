<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

	td {
		text-align: center;
	}

</style>

</head>
<body>
	<jsp:include page="../include/seller_top.jsp" />
	<jsp:include page="../include/sell_pro_manage.jsp" />

	<div align="center">
	      <h3>판매상품 리스트</h3>
	   <br>
	   
	   <table border="1" cellspacing="0" width="65%">
	      <tr bgcolor="lightgray">
	         <th>제품번호</th> <th>카테고리 코드</th> <th>제품이름</th>
	         <th>이 미 지</th> <th>제품 가격</th> <th>수 량</th>
	         <th>제 조 사</th> <th>제품 입고일</th> <th>수 정&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;삭 제
	      </tr>
	      
	      <c:set var="list" value="${productList }" />
	      <c:if test="${!empty list }">
	         <c:forEach items="${list }" var="dto">
	            <tr>
	               <td> ${dto.getPno() } </td>
	               <td> ${dto.getPcode() } </td>
	               <td> ${dto.getPname() } </td>
	               <td> <img src="<%=request.getContextPath() %>/pimg/${dto.getPimage() }"
	               					width="60" height="50"> </td>
	               <td> ${dto.getPrice() } 원 </td>
	               <td> ${dto.getPqty() } </td>
	               <td> ${dto.getPcompany() } </td>
	               <td> ${dto.getPinputdate().substring(0, 10) } </td>
	               <td>
	                  <a href="<%=request.getContextPath() %>/sell_pro_update.do?pno=${dto.getPno() }">수 정</a>
	                     &nbsp;&nbsp;|&nbsp;&nbsp;
	                  <a href="<%=request.getContextPath() %>/sell_pro_delete.do?pno=${dto.getPno() }">삭 제</a>
	               </td>
	            </tr>
	         </c:forEach>
	      </c:if>
	      
	      <c:if test="${empty list }">
	         <tr>
	            <td colspan="9" align="center">
	               <h3>검색된 상품 리스트가 없습니다</h3>
	            </td>
	         </tr>
	      </c:if>
	   </table>
	
	</div>
	

</body>
</html>