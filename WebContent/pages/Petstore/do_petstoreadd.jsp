<%@page import="com.yangsha.entity.PetStore"%>
<%@page import="com.yangsha.biz_interface.PetStoreBiz_interface"%>
<%@page import="com.yangsha.biz_impl.PetStoreBiz_impl"%>
<%@page import="com.yangsha.biz_interface.IpetBiz"%>

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
   String[] names=request.getParameterValues("name");
   String[] pas=request.getParameterValues("password");
   String[] balances=request.getParameterValues("balance");
  
   
   int len=names.length;
  
   PetStoreBiz_interface biz=new PetStoreBiz_impl();
   int val=0;
   if(ids!=null){
	   //修改
	   for(int i=0;i<len;i++){
		   PetStore pet=new  PetStore(Integer.parseInt(ids[i]),names[i],pas[i],Integer.parseInt(balances[i]));
		   val=biz.update(pet);
		   if(val!=1){
			   break;
		   }
	   }
   
	   if(val!=0){
	        out.print("<script>alert('修改成功');location='petstorelist.jsp';</script>");
	   }else{
		   out.print("<script>alert('修改失败');location='petstorelist.jsp';</script>");
	   } 
   }else{//增加
	   for(int i=0;i<len;i++){
		   PetStore pets=new PetStore(Integer.parseInt(ids[i]),names[i],pas[i],Integer.parseInt(balances[i]));
		   val=biz.add(pets);
		   if(val!=1){
			   break;
		   }
	   }
   
	   if(val!=0){
	        out.print("<script>alert('插入成功');location='petstorelist.jsp';</script>");
	   }else{
		   out.print("<script>alert('插入失败');location='petstorelist.jsp';</script>");
	   } 
   }
   
 
   

%>
<body>
   <h1>宠物商店上传服务端处理页面</h1>
   
</body>
</html>