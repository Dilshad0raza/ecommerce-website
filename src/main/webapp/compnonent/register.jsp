<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>register</title>
<style type="text/css">
  .form{
      width:100%;
      height: auto;
      padding-bottom: 50px;
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
     margin-top: 30px;
     
     
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
      
  }
  
</style>
</head>
<body>

<%@ include file="../Nav.jsp" %>
<div class="form">
<form action="../register" method="post" class="fe">   
 <h1 style="align-self: center; margin-bottom: 10px;">Register</h1> 
 <c:if test="${not empty succmsg }">
 <p style="color:green; font-size: 15px; align-self: center;">${succmsg}</p>
 <c:remove var="succmsg" scope="session"/>
 </c:if>
 <c:if test="${not empty errormsg }">
 <p style="color:red; font-size: 15px; align-self: center;">${errormsg}</p>
 <c:remove var="errormsg" scope="session"/>
 </c:if>
 <label>Full Name <sup>*</sup></label>
 <input type="text" name="name" placeholder="enter your full name" class="inp" required>
 <label>Email <sup>*</sup></label>
 <input type="email" name="email" placeholder="enter your email" class="inp" required>
 <label>Mobile<sup>*</sup></label>
 <input type="number" name="number" placeholder="enter your phone" class="inp" required>
 <label>Password <sup>*</sup></label>
 <input type="text" name="password" placeholder="create password" class="inp" required>
 <label>Confirm Password <sup>*</sup></label>
 <input type="text" name="pass" placeholder="confirm password" class="inp" required>
 
  <div><input type="checkbox" name="check" class="inp" > are you satisfy term and condition<sup>*</sup></div>
 <button type="submit" class="btn">Register</button>
 

</form>

 
</div>

<%@ include file="../bottom.jsp" %>
</body>
</html>