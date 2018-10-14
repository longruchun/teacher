
<%@page import="com.yangsha.biz_impl.AccountBiz_impl"%>
<%@page import="com.yangsha.biz_interface.AccountBiz_interface"%>
<%@page import="com.yangsha.entity.Account"%>
<%@page import="com.yangsha.biz_impl.petBiz_jdbcImpl"%>
<%@page import="com.yangsha.biz_interface.IpetBiz"%>
<%@page import="com.yangsha.entity.Pet"%>
<%@page import="com.yangsha.entity.PetStore"%>
<%@page import="com.yangsha.biz_impl.PetStoreBiz_impl"%>
<%@page import="com.yangsha.biz_interface.PetStoreBiz_interface"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.yangsha.entity.PetOwner"%>
<%@page import="java.util.List"%>
<%@page import="com.yangsha.biz_impl.PetOwnerBiz_impl"%>
<%@page import="com.yangsha.biz_interface.PetOwnerBiz_interface"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>账户信息添加</title>
		<link href="../../Public/css/bootstrap.css" type="text/css" rel="stylesheet" />
		<style type="text/css">
		   
		   th{
		     text-align:center;
		   }
		</style>
		<script type="text/javascript" src="../../Public/js/jquery-2.1.4.min.js"></script> 
        <script>
           function add_line(){
        	   $("tr:last").clone().appendTo($("table"));
           }
        </script>
    </head>
    <%
        
        String s_id=request.getParameter("id");
        int id=0;
        
       Account pet=new  Account();
        
        if(s_id!=null){
        	id=Integer.parseInt(s_id);//得到宠物id,据以查询出对应宠物
        	AccountBiz_interface  biz=new AccountBiz_impl();
        	
        	pet= (Account)biz.getAll();
        	
        	
        }
     
    
    %>
    <body>
    	<form action="do_petadd.jsp" method="post">
    	<table style="width:70%;margin:10px auto;" class="table table-bordered table-condensed table-hover table-responsive table-striped ">
    		<caption class="text-center">增加宠物主人信息</caption>
		       <tr>
		       	 <td colspan="7" class="text-right" style="margin-right:15px;">
		       	 	<a class="btn btn-xs btn-danger" href="javascript:history.go(-1);">
	                     <i class="glyphicon glyphicon-plus-sign"></i> 返回列表
	                </a>
		       	 	
		       	 	<a class="btn btn-xs btn-warning" href="javascript:void(0)" onclick="add_line();">
	                     <i class="glyphicon glyphicon-plus-sign"></i> 增加一行
	                </a>
	                
	                <a class="btn btn-xs btn-success" href="javascript:void(0)" onclick="$('form')[0].submit();">
	                     <i class="glyphicon glyphicon-plus-sign"></i> 提交数据
	                </a>
	                
	                
		       	 </td>
		       </tr>
		       
		       <tr>
		          
		          <th>name</th>
		          <th>password</th>
		          <th>money</th>
		         
		       </tr>
		       
		       <tr>
		          
		          <td>
		          	<input type="hidden" name="id" value="<%=pet.getId() %>" />
		          	<input type="text" name="deal_type" value="<%=pet.getDeal_type() %>" placeholder="销售类型" />
		          </td>
		          <td>
		            <input type="text" name="pet_id" value="<%=pet.getPet_Id() %>" placeholder="动物ID" />
		          </td>
		          <td>
		            <input type="text" name="seller_id" value="<%=pet.getSell_Id() %>" placeholder="销售ID" />
		          </td>
		          <td>
		            <input type="text" name="buy_id" value="<%=pet.getBuy_Id() %>" placeholder="买的id" /> 
		          </td>
		          <td>
		            <input type="text" name="price" value="<%=pet.getPrice() %>" placeholder="价格" />
		          </td>
		          
		           <td>
		            <input type="date" name=" deal_time    " value="<%=pet.getDeal_Time()   %>" placeholder="处理时间" />
		          </td>
		          
		       </tr>
		       
		       
    	</table>
    	
    </form>
 	</body>
</html>