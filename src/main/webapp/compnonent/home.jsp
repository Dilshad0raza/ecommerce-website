<%@ page import="java.sql.Connection" %>
<%@ page import="com.db.dbConnect" %>
<%@ page import="com.Dao.*" %>
<%@ page import="com.entity.*" %>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>home page</title>
<%@ include file="../Links/links.jsp" %>
<style type="text/css">
  .imgmain{
    width: 100%;
    height: 400px;
    background-image: url('../image/OIP.jpeg');
    background-repeat: no-repeat;
    background-size: cover;
    display: flex;
    justify-content: center;
    
  }
  
  .imgmain>h1{
       margin-top: 100px;
       font-size: 50px;
       font-family: sans-serif;
       color: white;
  }
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
  }
  .image1>.img1>img{
    width: 225px;
    height: 300px;
    
  }
  .btn{
      display:flex;
      justify-content: center;
      align-items: center;
       
  }
  .btn>a{
      background: red;
      text-decoration: none;
      color:white;
      padding: 10px;
  }
  
  
</style>
</head>
<body>
 <%@ include file="../Nav.jsp" %>
  <div class="imgmain">
   
    <h1> E-COMMERCE WEBSITE</h1>
  </div >
   
  <div class="hed"><h1>RECENT BOOK</h1></div>
  <% User u=(User)session.getAttribute("userobj"); %>
  <div class="image1">
  
    <% booksDaoImple bd=new booksDaoImple(dbConnect.getcon());
    List<addbook> d=bd.getRecentBook();
    for(addbook a:d)
    {%>
      <div class="img1"><img alt="loading...." src="../books/<%=a.getFilename()%>">
          <p style="margin-top: 10px"><%=a.getBname() %></p>
          <p style="margin-top: 10px"><%=a.getAname() %></p>
          <p style="margin-top: 10px">Catagories:<%=a.getBc() %></p>
         
         
          
          <%
          if(a.getBc().equals("new book")){%>
          <div style="margin-top: 10px" >
          <a href="ViewBooks.jsp?id=<%=a.getId() %>" style="background-color: red; padding: 3px; color: white; text-decoration: none; margin-right: 10px; margin-top: 10px;" >View details</a>
               <a href="#" style="background-color: red; padding: 3px; color: white; text-decoration: none; margin-right: 10px; margin-top: 10px;">Rs:<%=a.getPrice() %></a>
               
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
            
              <a href="ViewBooks.jsp?id=<%=a.getId() %>" style="background-color: red; padding: 2px; color: white; text-decoration: none; margin-right: 10px; margin-top: 10px;" >View details</a>
               <a href="#" style="background-color: red; padding: 2px; color: white; text-decoration: none; margin-right: 10px; margin-top: 10px;"><%=a.getPrice() %></a>
               
          </div>
        	   
           <%}
           %>
      </div>
    	
   <%} 
  %>
      
      
        
  </div>
  
      
        
  <div class="btn"><a href="allRecentbook.jsp">View All Books</a></div>
  
  <div class="hed"><h1>NEW BOOK</h1></div>
  <div class="image1">
  
    <% 
    List<addbook> b=bd.getNewBook();
    for(addbook a:b)
    {%>
      <div class="img1"><img alt="loading...." src="../books/<%=a.getFilename()%>">
          <p style="margin-top: 10px"><%=a.getBname() %></p>
          <p style="margin-top: 10px"><%=a.getAname() %></p>
          <p style="margin-top: 10px">Catagories:<%=a.getBc() %></p>
          <div style="margin-top: 10px" >
              <a href="ViewBooks.jsp?id=<%=a.getId() %>" style="background-color: red; padding: 3px; color: white; text-decoration: none; margin-right: 10px; margin-top: 10px;" >View details</a>
               <a href="#" style="background-color: red; padding: 3px; color: white; text-decoration: none; margin-right: 10px; margin-top: 10px;"><%=a.getPrice() %></a>
            
          </div>
      </div>
    	
   <%}
  %>
      
      
        
  </div>
      <div class="btn"><a href="allNewBook.jsp">View All Books</a></div>
  <div class="hed"><h1>OLD BOOK</h1></div>
   <div class="image1">
  
    <% 
    List<addbook> c=bd.getOldBook();
    for(addbook a:c)
    {%>
      <div class="img1"><img alt="loading...." src="../books/<%=a.getFilename()%>">
          <p style="margin-top: 10px"><%=a.getBname() %></p>
          <p style="margin-top: 10px"><%=a.getAname() %></p>
          <p style="margin-top: 10px">Catagories:<%=a.getBc() %></p>
          <div style="margin-top: 10px" >
          <%if(u==null){%>
        	    <a href="login.jsp" style="background-color: red; padding: 2px; color: white; text-decoration: none; margin-right: 10px; margin-top: 10px;" ><i class="fa-solid fa-cart-plus"></i>AddCard</a>
        	   
          <% }
          else{%>
          <a href="../cart?bid=<%=a.getId() %>&&uid=<%=u.getId() %>" style="background-color: red; padding: 2px; color: white; text-decoration: none; margin-right: 10px; margin-top: 10px;" ><i class="fa-solid fa-cart-plus"></i>AddCard</a>
          <%} %>
            
              <a href="ViewBooks.jsp?id=<%=a.getId() %>" style="background-color: red; padding: 2px; color: white; text-decoration: none; margin-right: 5px; margin-top: 10px;" >View details</a>
               <a href="#" style="background-color: red; padding: 2px; color: white; text-decoration: none; margin-right: 5px; margin-top: 10px;"><%=a.getPrice() %></a>
               
          </div>
        
      </div>
    	
   <%}
  %>
      
      
        
  </div>
 
  <div class="btn" style="margin-bottom: 20px;">
  <a href="allOldBook.jsp">View All Books</a></div>
 <%@ include file="../bottom.jsp" %>
</body>
</html>