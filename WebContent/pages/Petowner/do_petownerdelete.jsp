<%@page import="com.yangsha.biz_impl.petBiz_jdbcImpl"%>
<%@page import="com.yangsha.biz_interface.IpetBiz"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
if (request.getMethod().toLowerCase()=="post"){
   String s_id=request.getParameter("id");
   int id=0;
   int val=0;
   if(s_id!=null){
	   id=Integer.parseInt(s_id);
	   PetOwnerBiz_interface biz=new PetOwnerBiz_impl();
	   val=biz.delete(id);
	   
	   if(val!=0){
	        out.print("<script>alert('删除成功');location='petownerlist.jsp';</script>");
	   }else{
		   out.print("<script>alert('删除失败');location='petownerlist.jsp';</script>");
	   } 
	   
   }
}else{
	 out.print("<script>alert('非法删除');location='petownerlist.jsp';</script>");
}
%>
<body>

</body>
</html>