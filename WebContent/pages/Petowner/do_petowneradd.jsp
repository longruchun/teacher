
<%@page import="com.yangsha.entity.PetOwner"%>
<%@page import="com.yangsha.biz_impl.PetOwnerBiz_impl"%>
<%@page import="com.yangsha.biz_interface.PetOwnerBiz_interface"%>
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
  
   request.setCharacterEncoding("UTF-8");
   
  
   String[] ids=request.getParameterValues("id");
   String[] names=request.getParameterValues("name");
   String[] pas=request.getParameterValues("password");
   String[] moneys=request.getParameterValues("money");
 
   
   int len=names.length;
 
   PetOwnerBiz_interface biz=new PetOwnerBiz_impl();
   int val=0;
   if(ids!=null){
	   //修改
	   for(int i=0;i<len;i++){
		   
		  
		 
		   PetOwner pet=new  PetOwner(Integer.parseInt(ids[i]),names[i],pas[i],Integer.parseInt(moneys[i]));
		   val=biz.update(pet);
		   if(val!=1){
			   break;
		   }
	   }
   
	   if(val!=0){
	        out.print("<script>alert('修改成功');location='petlist.jsp';</script>");
	   }else{
		   out.print("<script>alert('修改失败');location='petlist.jsp';</script>");
	   } 
   }else{//增加
	   for(int i=0;i<len;i++){
		   PetOwner pets=new  PetOwner(Integer.parseInt(ids[i]),names[i],pas[i],Integer.parseInt(moneys[i]));
		   val=biz.add(pets);
		   if(val!=1){
			   break;
		   }
	   }
   
	   if(val!=0){
	        out.print("<script>alert('插入成功');location='petlist.jsp';</script>");
	   }else{
		   out.print("<script>alert('插入失败');location='petlist.jsp';</script>");
	   } 
   }
   
 
  

%>
<body>
   <h1>宠物主人信息上传服务端处理页面</h1>
   
</body>
</html>