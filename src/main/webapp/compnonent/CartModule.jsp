<%@page import="com.Dao.*" %>
<%@page import="com.admin.servlet.*" %>
<%@page import="com.db.dbConnect" %>
<%@page import="com.entity.*" %>
<%@page import="java.util.List" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>allbook</title>
<style type="text/css">
table{
   height: auto;
   width: 100%;
   padding: 20px;
   border: none;
   
}
table thead tr{
   background: navy;
   color:white;
   height: 40px;
}
table thead td{
   
   text-align: center;
}
table tr{
  margin-top: 5px;
  height: 40px;
  background: blue;
  color: white;
 
}
table tr td{
 text-align: center;
}
</style>
</head>
<body>
<%User u=(User)session.getAttribute("userobj"); %>
<%@include file="../Nav.jsp" %>
<h1 style="text-align:center; margin-top: 20px;">Hello, <%=u.getName() %> </h1>
<c:if test="${not empty succmsg }">
<p style="color:green; font-size: 15px; text-align: center;">${succmsg}</p>
 <c:remove var="succmsg" scope="session"/>

</c:if>

<table>
<thead>
<tr>
<td>Book Name</td>
<td>Author</td>
<td>Price</td>
<td>Action</td>

</tr>


</thead>
<%  
CartDaoIMple cd = new CartDaoIMple(dbConnect.getcon());
        List<Cart> c=cd.getbookUser(u.getId());
   for(Cart a:c){
%>
<tr>
<td><%=a.getBname() %></td>
<td><%=a.getAname() %></td>
<td><%=a.getPrice() %></td>
<td>
   <a href="../remove?id=<%=a.getId()%>" style="padding: 5px; background: red; text-decoration: none;color:white;">Remove</a>
</td>

</tr>
<%
}
%>


</table>

</body>
</html>