<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>login page</title>
<style type="text/css">
.form{
      width:100%;
      height: auto;
      padding-bottom: 130px;
      display:flex;
      justify-content: center;
      align-items: center;
      
  
  }
  .form>.fe{
    width: 300px;
    height: auto;
     padding: 20px;
     box-shadow: 0 0 10px 0 rgba(0,0,0,0.3);
     display: flex;
     flex-direction: column;
     margin-top: 150px;
     
     
  }
  .form>.fe>.inp{
   margin-bottom: 10px;
   height: 30px;
    outline: none;
    border:none;
    box-shadow: 0 0 10px 0 rgba(0,0,0,0.3);
    
    
  }
  .form>.fe>.btn{
      background: blue;
      outline: none;
      border: none;
      border-radius: 20px;
      height: 30px;
      margin-top: 10px;
       box-shadow: 0 0 10px 0 rgba(0,0,0,0.3);
       color: white;
       margin-bottom:10px;
      
  }
  
</style>
</head>
<body>
<%@ include file="../Nav.jsp" %>
<div class="form">

<form action="../login" method="post" class="fe">
<h1 style="align-self: center;">Login</h1>
<c:if test="${not empty errormsg }">
 <p style="color:red; font-size: 15px; align-self: center;">${errormsg}</p>
 <c:remove var="errormsg" scope="session"/>
 </c:if>
 <c:if test="${not empty succmsg }">
 <p style="color:green; font-size: 15px; align-self: center;">${succmsg}</p>
 <c:remove var="succmsg" scope="session"/>
 </c:if>
<label>Email</label>
<input type="email" name="email" placeholder="enter your email" class="inp" required>
<label>Password</label>
 <input type="password" name="password" placeholder="enter password" class="inp" required>
 <button type="submit" class="btn">login</button>
 <div>if you have no account ? <a href="register.jsp" style="text-decoration: none; color:blue;" >register now</a></div>
</form>
</div>
<%@ include file="../bottom.jsp" %>
</body>
</html>