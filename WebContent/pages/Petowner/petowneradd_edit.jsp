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
        <title>宠物主人信息添加</title>
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
        //为了判断本次进入该 页面，是为了做增加，还是做修改，我们要检查url中是否包含id参数
        //如果不包含id参数，说明是添加
        //如果是修改，就要把相应id 的宠物，从数据库取出，填列到相应表单元素中，以供用户修改
        String s_id=request.getParameter("id");
        int id=0;
        
        PetOwner     pet=new  PetOwner();
        
        if(s_id!=null){
        	id=Integer.parseInt(s_id);//得到宠物主人id,据以查询出对应宠物主人信息
        	PetOwnerBiz_interface biz=new PetOwnerBiz_impl();
        	
        	pet=biz.getEntityById(id);
        	
        	
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
		          	<input type="text" name="name" value="<%=pet.getName() %>" placeholder="输入名称" />
		          </td>
		          <td>
		            <input type="password" name="password" value="<%=pet.getPassword() %>" placeholder="输入密码" />
		          </td>
		          <td>
		            <input type="text" name="money" value="<%=pet.getMoney() %>" placeholder="输入元宝值" />
		          </td>
		         
		          <td>
		            <select name="owner_Id" >
		            <%
		            	PetOwnerBiz_interface biz=new PetOwnerBiz_impl();
		                List<PetOwner> list=biz.getAll();
		                Iterator<PetOwner> it=list.iterator();
		                
		                while(it.hasNext()){
		                	PetOwner owner=it.next();
		            %>
		                <option value="<%=owner.getId()%>" 
		                  <% 
		                     if(owner.getId()==pet.getId()){
		                  %>
		                     selected
		                  <% 
		                     }
		                  %>
		                ><%=owner.getName()%></option>
		            <%
		                }
		            %> 
		            </select>
		          </td>
		          <td>
		             <select name="store_Id">
		             <%
		                 PetStoreBiz_interface store_biz=new PetStoreBiz_impl();
		                 List<PetStore> store_list=store_biz.getAll();
		                 
		                 Iterator<PetStore> s_it=store_list.iterator();
		                 
		                 while(s_it.hasNext()){
		                	 PetStore ps=s_it.next();
		                 
		             %>
		                 <option value="<%=ps.getId()%>"
		                    <%
		                        if(ps.getId()==pet.getStore_Id()){
		                    %>
		                        selected 
		                    <%
		                        }
		                    %>
		                 ><%=ps.getName()%></option>
		             <%
		                 }
		             %>
		             </select>  
		          </td>
		       </tr>
		       
		       
    	</table>
    	
    </form>
 	</body>
</html>