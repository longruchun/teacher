<%@page import="com.yangsha.entity.PetOwner"%>
<%@page import="com.yangsha.biz_impl.PetStoreBiz_impl"%>
<%@page import="com.yangsha.biz_interface.PetStoreBiz_interface"%>
<%@page import="com.yangsha.biz_impl.PetOwnerBiz_impl"%>
<%@page import="com.yangsha.biz_interface.PetOwnerBiz_interface"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List,com.yangsha.biz_impl.petBiz_jdbcImpl,com.yangsha.biz_interface.IpetBiz,com.yangsha.entity.Pet"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>宠物主人列表</title>
<link href="../../Public/css/bootstrap.css" type="text/css" rel="stylesheet" />
<style type="text/css">
   
   th{
     text-align:center;
   }
</style>
<script src="../../Public/js/jquery-2.1.4.min.js"></script>
<script>
    function besure(obj){
    	if(confirm("确定要删除该条记录?")){
    		//location="do_petdelete.jsp?id="+id;
    		//document.getElementById("frm1").submit();
    		
    		$(obj).parents("form").submit();
    		
    	}
    }
</script>
</head>
<body>
   <table style="width:70%;margin:10px auto;" class="table table-bordered table-condensed table-hover table-responsive table-striped ">
       <caption class="text-center">宠物主人列表</caption>
       <tr>
          <th>id</th>
          <th>name</th>
          <th>password</th>
          <th>money</th>
         
          <th style="width:120px;">操作</th>
       </tr>
       
      <tr>
	          <td colspan="8">&nbsp;</td>
	          <td>
	             <a class="btn btn-xs btn-success" href="petadd_edit.jsp">
	                     <i class="glyphicon glyphicon-plus-sign"></i> 增加
	             </a>
	          </td>
	       </tr>
       
       <!--  在页面上集成嵌入java代码，只要写在这个特殊标签对中  -->
       <%
           IpetBiz biz=new petBiz_jdbcImpl();
           PetOwnerBiz_interface  owner_biz=new PetOwnerBiz_impl();
           PetStoreBiz_interface  store_biz =new PetStoreBiz_impl();
       
       
           List<PetOwner> list=owner_biz.getAll();
           
           Iterator<PetOwner> it=list.iterator();
           
           while(it.hasNext()){
        	   PetOwner pet=it.next(); 
       %> 
       
           <tr>
	          <td><%=pet.getId() %></td>
	          <td><%=pet.getName() %></td>
	          <td><%=pet.getPassword() %></td>
	          <td><%=pet.getMoney() %></td>
	        
	          <td>
	             <a class="btn btn-xs btn-warning" href="petadd_edit.jsp?id=<%=pet.getId() %>">
	                     <i class="glyphicon glyphicon-pencil"></i> 修改
	             </a>
	             <form  action="do_petdelete.jsp" method="post" style="display:inline;">
		             <input name="id" type="hidden" value="<%=pet.getId() %>" />
		             <a class="btn btn-xs btn-danger" href="javascript:void(0)" onclick="besure(this)">
		                     <i class="glyphicon glyphicon-trash"></i> 删除
		             </a>
	             </form>
	          </td>
	       </tr>
	       
       <%
           }
       %>  
   </table>
</body>
</html>