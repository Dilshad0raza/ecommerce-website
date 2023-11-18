<%@page import="com.Dao.booksDaoImple" %>
<%@page import="com.db.dbConnect" %>
<%@page import="com.entity.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>View Book Details</title>
<%@ include file="../Links/links.jsp" %>
<style type="text/css">
.main-container{
  height: auto;
  width: 100%;
  padding: 30px;
  display: flex;
  flex-wrap: wrap;
  justify-content: space-around;
  align-items: center;
}
.main-container>.con1{
  display: flex;
  justify-content: center;
  height: auto;
  padding: 20px;
  align-items: center;
  flex-direction: column;
  box-shadow: 0 0 20px 0 rgba(0,0,0,0.3);
    width: 300px;
}
.main-container>.con1>.bimg{
  height: 200px;
  width: 150px;
  
}
.main-container>.con2{
  display: flex;
  justify-content: center;
  height: auto;
  padding: 20px;
  align-items: center;
  box-shadow: 0 0 20px 0 rgba(0,0,0,0.3);
  width: auto;
  flex-direction: column;
}
.main-container>.con2>.con{
display: flex;
  justify-content: center;
  height: auto;
  align-items: center;
  width: auto;
}
.main-container>.con2>.con>.ccon2{
display: flex;
justify-content: space-around;
align-items: center;
height: auto;
width: auto;
padding:20px;
flex-direction: column;

}
.main-container>.con2>.con>.ccon2>i{
 font-size: 80px;
 color: green;
}
.main-container>.con2>.con>.ccon2>h2{
 font-size: 15px;
  background: green;
  padding: 5px;
  color: white;
}



</style>
</head>
<body>
<%booksDaoImple bd=new booksDaoImple(dbConnect.getcon());
int id=Integer.parseInt(request.getParameter("id"));
addbook a=bd.getId(id);
User u=(User)session.getAttribute("userobj");

 %>
<div class="main-container">
 <div class="con1">
 <img alt="loading" src="../books/<%=a.getFilename() %>" class="bimg">
 <h3>Book: <%=a.getBname() %></h3>
 <h3>Author:<%=a.getAname() %></h3>
 <h3>Catagory:<%=a.getBc() %></h3>
 
 </div>
 <div class="con2">
 <h1><%=a.getBname() %></h1>
 <div class="con">
 <div class="ccon2">
 <i class="fa-solid fa-money-bill-wave"></i>
 <h2>CASH ON DELIVERY</h2>
 </div>
 <div class="ccon2">
 <i class="fa-solid fa-rotate-right"></i>
    <h2>RETURN AVAILABLE</h2>
  </div>
  <div class="ccon2">
     <i class="fa-solid fa-truck"></i>
     <h2> FREE DELIVERY</h2>
  </div>
 </div>
 <div class="con">
  <% if(a.getBc().equals("old book")){ %>
           <a href="#" style="background: blue; padding: 8px; color:white; margin-right: 30px;text-decoration: none">CONTINUE</a> 
	  <%  } else if(a.getBc().equals("new book")){
	  if(u==null){%> 
        	    <a href="login.jsp" style="background-color: red; padding: 8px; color: white; text-decoration: none; margin-right: 10px; margin-top: 10px;" ><i class="fa-solid fa-cart-plus"></i>AddCard</a>
        	   
          <% }
          else{%>
          <a href="../cart?bid=<%=a.getId()%>&&uid=<%=u.getId() %>" style="background-color: red; padding: 8px; color: white; text-decoration: none; margin-right: 10px; margin-top: 10px;" ><i class="fa-solid fa-cart-plus"></i>AddCard</a>
          <%}
            
    } %>
  <a href="#" style="background: red; padding: 8px; color:white; margin-right: 30px ; text-decoration: none">Rs.<%=a.getPrice()%>/-</a>
 </div>
 
 <a href="home.jsp" style="background: navy; padding: 10px; color:white; margin-right: 30px;text-decoration: none;margin-top: 30px;">click for home page</a>
 
 
 </div>
  
 
 </div>

</body>
</html>