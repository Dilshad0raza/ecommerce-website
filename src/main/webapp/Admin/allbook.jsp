<%@page import="com.Dao.booksDaoImple" %>
<%@page import="com.admin.servlet.addbookServlet" %>
<%@page import="com.db.dbConnect" %>
<%@page import="com.entity.addbook" %>
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
<%@include file="adminnav.jsp" %>
<h1 style="text-align:center; margin-top: 20px;">Hello,Admin</h1>
<c:if test="${not empty succmsg }">
<p style="color:green; font-size: 15px; text-align: center;">${succmsg}</p>
 <c:remove var="succmsg" scope="session"/>

</c:if>

<table>
<thead>
<tr>
<td>id</td>
<td>Image</td>
<td>Book Name</td>
<td>Author</td>
<td>Price</td>
<td>Categories</td>
<td>Status</td>
<td>Action</td>

</tr>


</thead>
<%  booksDaoImple db=new booksDaoImple(dbConnect.getcon());
   List<addbook>ad=db.getallbooks();
   for(addbook a:ad){
%>
<tr>
<td><%=a.getId() %></td>
<td><img src="../books/<%=a.getFilename()%>" style="height: 50px;width: 50px;"></td>
<td><%=a.getBname() %></td>
<td><%=a.getAname() %></td>
<td><%=a.getPrice() %></td>
<td><%=a.getBc() %></td>
<td><%=a.getBs() %></td>
<td>
   <a href="edit.jsp?id=<%=a.getId() %> " style="padding: 5px; background: navy; text-decoration: none;color:white; margin-right: 10px;">Edit</a>
   <a href="../delete?id=<%=a.getId() %>" style="padding: 5px; background: red; text-decoration: none;color:white;">delete</a>
</td>

</tr>
<%
}
%>


</table>

</body>
</html>