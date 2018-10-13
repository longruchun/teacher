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
   
   /* String name=request.getParameter("name");
   String typeName=request.getParameter("typeName");
   String health=request.getParameter("health");
   String love=request.getParameter("love");
   String birthday=request.getParameter("birthday");
   String owner_Id=request.getParameter("owner_Id");
   String store_Id=request.getParameter("store_Id"); */
   
   String[] ids=request.getParameterValues("id");
   String[] names=request.getParameterValues("name");
   String[] typeNames=request.getParameterValues("typeName");
   String[] healths=request.getParameterValues("health");
   String[] loves=request.getParameterValues("love");
   String[] birthdays=request.getParameterValues("birthday");
   String[] owner_Ids=request.getParameterValues("owner_Id");
   String[] store_Ids=request.getParameterValues("store_Id");
   
   int len=names.length;
   SimpleDateFormat sdf=new SimpleDateFormat("yyyy-mm-dd");
   IpetBiz biz=new petBiz_jdbcImpl();
   int val=0;
   if(ids!=null){
	   //修改
	   for(int i=0;i<len;i++){
		   Pet pet=new Pet(Integer.parseInt(ids[i]),names[i],typeNames[i],Integer.parseInt(healths[i]),Integer.parseInt(loves[i]),sdf.parse(birthdays[i]),Integer.parseInt(owner_Ids[i]),Integer.parseInt(store_Ids[i]));
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
		   Pet pet=new Pet(names[i],typeNames[i],Integer.parseInt(healths[i]),Integer.parseInt(loves[i]),sdf.parse(birthdays[i]),Integer.parseInt(owner_Ids[i]),Integer.parseInt(store_Ids[i]));
		   val=biz.add(pet);
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
   
 
   /* if(val!=0){
	   out.print("插入成功");
   }else{
	   out.print("插入失败");
   } */
		   
   //应该返回列表页，展示添加结果
   //在服务端页面上，我们要导航去另一个页面，我们要用到另一个内置对象(response---响应对象)
   /* Thread.sleep(3000);
   response.sendRedirect("petlist.jsp"); */
   


%>
<body>
   <h1>宠物上传服务端处理页面</h1>
   
</body>
</html>