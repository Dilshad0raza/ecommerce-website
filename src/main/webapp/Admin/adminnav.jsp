<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<%@ include file="../Links/links.jsp" %>
<style type="text/css">
*{
margin:0px;
padding:0px;
}
.mainnav{
 height: 80px;
 width: 100%;
 display: flex;
 justify-content: space-around;
 align-items: center;
 
}
.mainnav>.logo{
 height: 100%;
 width: auto;
}
.mainnav>.logo>img{
 height: 100%;
 width: 100px;
}
.mainnav>.sea{
height: auto;
width: auto;
 display: flex;
 justify-content: space-between;
 align-items: center;

}
.mainnav>.sea>.sea1{
  height: auto;
  width: auto;
  padding: 6px;
  box-shadow: 0 0 10px 0 rgba(0,0,0,0.3);
  border-radius: 20px;
}

.mainnav>.sea>.sea1>.inp{
  width: 400px;
  height: 30px;
  margin-right: 10px;
  outline: none;
  border: none;
  
}
.mainnav>.sea>.btn{
  height: 30px;
  width: 100px;
  background: blue;
  border: none;
  outline: none;
  box-shadow: 0 0 10px 0 rgba(0,0,0,0.3);
  margin-left: 10px;
  border-radius: 10px;
  color: white;
}
.mainnav>.Btn{
  height: auto;
  width: auto;
  
}
.mainnav>.Btn>.btn1{
 height: 40px;
  width: 100px;
  background: blue;
  border: none;
  outline: none;
  box-shadow: 0 0 10px 0 rgba(0,0,0,0.3);
  margin-left: 30px;
  color: white;
  text-decoration: none;
  padding:10px;

}
.mainnav>.Btn>.btn2{
  height: 50px;
  width: 100px;
  background: green;
  border: none;
  outline: none;
  box-shadow: 0 0 10px 0 rgba(0,0,0,0.3);
  margin-left: 30px;
  color: white;
  text-decoration: none;
  padding:10px;

}
.downnav{
 height: 60px;
 width: 100%;
 background: blue;
 display: flex;
 justify-content: space-between;
 align-items: center;
 position: sticky;
 top:0;
 box-shadow: 0 0 20px 0 rgba(0,0,0,0.3);
}
.downnav>.first{
 height: auto;
 width: auto;
}
.downnav>.first>ul{
 height: auto;
 width: auto;
 display: flex;
 justify-content: space-around;
 align-items: center;
 padding: 3px;
 list-style: none;
}
.downnav>.first>ul>li>a{
padding:10px;
  color: white;
  margin-left: 20px;
}
.downnav>.first>ul>li>a:hover{
background: white;
color: black;
}


.downnav>.first>ul>li>a>i{
margin-right: 10px;}

.downnav>.first>ul>li>a{
 color:white;
 text-decoration: none;
}
.downnav>.sec>ul>li>a{
color:black;
 text-decoration: none;
}
.downnav>.sec>ul{
display: flex;
justify-content: space-around;
align-items: center;
height:100%;
width: auto;
list-style: none;
 
  
}
.downnav>.sec>ul>li{
margin-right: 30px;
height: 30px;
width: auto;
padding-left: 10px;
padding-right: 10px;
background: white;
display: flex;
justify-content: center;
align-items: center;

}
.downnav>.sec>ul>li>a>i{
margin-right: 10px;
}


</style>
</head>
<body>
    
   <nav class="mainnav">
   
      <div class="logo">
      <img alt="loading" src="../image/logo1.jpg">
      </div>
      <div class="sea">
     <div class="sea1"><input type="text" class="inp" name="sear" placeholder="enter"></div>
      <button class="btn" type="submit">Search</button>
         
      </div>
      <c:if test="${not empty userobj }">
          <div class="Btn">
          <a class="btn1" href="#"><i class="fa-solid fa-house"></i>${userobj.name}</a>
           <a class="btn2" href="../logoutServletadmin"><i class="fa-solid fa-right-to-bracket"></i> Logout</a>
          
      </div>
      </c:if>
      <c:if test="${empty userobj }">
      <div class="Btn">
          <a class="btn1" href="../compnonent/login.jsp"><i class="fa-solid fa-house"></i> Login</a>
          <a class="btn2" href="../compnonent/register.jsp"><i class="fa-solid fa-right-to-bracket"></i> Register</a>
      </div>
      </c:if>
   </nav>
   <nav class="downnav">
   <div class="first">
     <ul>
       <li><a href="adminhome.jsp"><i class="fa-solid fa-house-chimney"></i> HOME</a></li>
      
     </ul>
   </div>
   
      
   </nav>
   
   
</body>


</html>