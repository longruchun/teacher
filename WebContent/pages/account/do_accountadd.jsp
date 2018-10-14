<%@page import="com.yangsha.entity.Account"%>
<%@page import="com.yangsha.biz_impl.AccountBiz_impl"%>
<%@page import="com.yangsha.biz_interface.AccountBiz_interface"%>
<%@page import="com.yangsha.biz_interface.IpetBiz"%>
<%@page import="com.yangsha.biz_impl.petBiz_jdbcImpl"%>
<%@page import="com.yangsha.entity.Pet"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
   //用小脚本处理表单提交数据，持久化到数据库
   //为了提取来自客户端的表单数据，我们要用到另一个内置对象(内置对象是由tomcat容器自动创建 的) ---Request,请求
   
   request.setCharacterEncoding("UTF-8");
   
  
   String[] ids=request.getParameterValues("id");
   String[] deal_type=request.getParameterValues("deal_type");
   String[] petid=request.getParameterValues("pet_Id");
   String[] sellid=request.getParameterValues("seller_Id");
   String[] buyid=request.getParameterValues("buy_Id");
   String[] prices=request.getParameterValues("price");
   String[] dealTimes=request.getParameterValues("deal_time");
  
   
   int len=deal_type.length;
   SimpleDateFormat sdf=new SimpleDateFormat("yyyy-mm-dd");
   AccountBiz_interface biz=new AccountBiz_impl();
   int val=0;
   if(ids!=null){
	   //修改
	   for(int i=0;i<len;i++){
		  
		 Account account=new   Account(Integer.parseInt(ids[i]),Integer.parseInt(deal_type[i]),Integer.parseInt(petid[i]),Integer.parseInt(sellid[i]),Integer.parseInt(buyid[i]),Integer.parseInt(prices[i]),sdf.parse(dealTimes[i])  );
		   val=biz.update(account);
		   if(val!=1){
			   break;
		   }
	   }
   
	   if(val!=0){
	        out.print("<script>alert('修改成功');location='accountlist.jsp';</script>");
	   }else{
		   out.print("<script>alert('修改失败');location='accountlist.jsp';</script>");
	   } 
   }else{//增加
	   for(int i=0;i<len;i++){
		   Account  account=new Account(Integer.parseInt(ids[i]),Integer.parseInt(deal_type[i]),Integer.parseInt(petid[i]),Integer.parseInt(sellid[i]),Integer.parseInt(buyid[i]),Integer.parseInt(prices[i]),sdf.parse(dealTimes[i])  );
		   val=biz.add(account);
		   if(val!=1){
			   break;
		   }
	   }
   
	   if(val!=0){
	        out.print("<script>alert('插入成功');location='accountlist.jsp';</script>");
	   }else{
		   out.print("<script>alert('插入失败');location='accountlist.jsp';</script>");
	   } 
   }
   
 
   


%>
<body>
	<h1>账户信息上传服务端处理页面</h1>

</body>
</html>