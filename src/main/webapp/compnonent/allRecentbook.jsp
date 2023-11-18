<%@ page import="java.sql.Connection" %>
<%@ page import="com.db.dbConnect" %>
<%@ page import="com.Dao.booksDaoImple" %>
<%@ page import="com.entity.*" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@ include file="../Links/links.jsp" %>
<style type="text/css">
  .hed{
     width: 100%;
     height: 100px;
     display: flex;
     justify-content: center;
     align-items: center;
     margin-top: 20px;
     
  }
  .image1{
    width: 100%;
    height: auto;
    display: flex;
    justify-content: space-around;
    margin-bottom: 50px;
    flex-wrap: wrap;
  } 
  .image1>.img1{
    width: 250px;
    height: auto;
    display: flex;
    justify-content: center;
    align-items: center;
    padding: 20px;
    box-shadow: 0 0 20px 0 rgba(0,0,0,0.3);
    flex-direction: column;
    margin-top: 20px;
    margin-bottom: 30px;
  }
  .image1>.img1>img{
    width: 225px;
    height: 300px;
    
  }
  
</style>
</head>
<body>
 <%@ include file="../Nav.jsp" %>
<div class="hed"><h1>RECENT BOOK</h1></div>
  <div class="image1">
  
    <% booksDaoImple bd=new booksDaoImple(dbConnect.getcon());
    List<addbook> d=bd.getallRecentBook();
    User u=(User)session.getAttribute("userobj");
    for(addbook a:d)
    {%>
      <div class="img1"><img alt="loading...." src="../books/<%=a.getFilename()%>">
          <p style="margin-top: 10px"><%=a.getBname() %></p>
          <p style="margin-top: 10px"><%=a.getAname() %></p>
          <p style="margin-top: 10px">Catagories:<%=a.getBc() %></p>
         
         
          <%
          if(a.getBc().equals("new book")){%>
          <div style="margin-top: 10px" >
          <a href="ViewBooks.jsp?id=<%=a.getId() %>" style="background-color: red; padding: 1px; color: white; text-decoration: none; margin-right: 10px; margin-top: 10px;" >View details</a>
               <a href="#" style="background-color: red; padding: 1px; color: white; text-decoration: none; margin-right: 10px; margin-top: 10px;">Rs:<%=a.getPrice() %></a>
               
        	    </div>
          <%}

          else if(a.getBc().equals("old book")){%>
           <div style="margin-top: 10px" >
           <%if(u==null){%>
        	    <a href="login.jsp" style="background-color: red; padding: 2px; color: white; text-decoration: none; margin-right: 10px; margin-top: 10px;" ><i class="fa-solid fa-cart-plus"></i>AddCard</a>
        	   
          <% }
          else{%>
          <a href="../cart?bid=<%=a.getId() %>&&uid=<%=u.getId() %>" style="background-color: red; padding: 2px; color: white; text-decoration: none; margin-right: 10px; margin-top: 10px;" ><i class="fa-solid fa-cart-plus"></i>AddCard</a>
          <%} %>
              <a href="ViewBooks.jsp?id=<%=a.getId() %>" style="background-color: red; padding: 1px; color: white; text-decoration: none; margin-right: 5px; margin-top: 10px;" >View details</a>
               <a href="#" style="background-color: red; padding: 1px; color: white; text-decoration: none; margin-right: 5px; margin-top: 10px;">Rs:<%=a.getPrice() %></a>
               
          </div>
        	   
           <%}
           %>
      </div>
    	
   <%}
  %>
      
      
        
  </div>
   <%@ include file="../bottom.jsp" %>

</body>
</html>