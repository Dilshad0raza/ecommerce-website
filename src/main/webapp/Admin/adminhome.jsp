<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
  .head{
     height: auto;
     width: 100%;
     display: flex;
     justify-content: center;
     flex-direction: column;
     align-items: center;
  }
  .head>h1{
     margin-top: 20px;
  }
  .head>.container{
    width: 100%;
    padding: 20px;
    display: flex;
    justify-content: space-around;
    margin-bottom: 140px;
  }
  .head>.container>a{
     height: auto;
     width: 250px;
     box-shadow: 0 0 20px 0 rgba(0,0,0,0.3);
     display: flex;
     align-items: center;
      
     justify-content: center;
     text-decoration: none;
     color:black;
     padding: 20px;
     flex-direction: column;
     font-size: 25px;
  }
  .head>.container>a>i{
  font-size: 50px;
  color:navy;
  margin: 20px;
  }
  
</style>

</head>
<body>
<%@ include file="adminnav.jsp" %>
<header class="head">
<h1> Hello,Admin</h1>

 <div class="container">
   <a href="addbook.jsp"> <i class="fa-solid fa-plus"></i><div class="con">addBook</div>--------</a>
   <a href="allbook.jsp"> <i class="fa-solid fa-book"></i><div class="con">All Book</div>--------</a>
   <a href="OrderDetails.jsp"> <i class="fa-solid fa-store"></i><div class="con">Order</div>--------</a>
   <a href="../logoutServletadmin"> <i class="fa-solid fa-right-from-bracket"></i><div class="con">Logout</div>--------</a>

</div>
<%@include file="../bottom.jsp" %>
</header>



</body>
</html>