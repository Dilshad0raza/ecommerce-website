<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ page isELIgnored="false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>addbook</title>
<style type="text/css">
.form-control{
  width: 100%;
  display: flex;
  justify-content: center;
  align-items: center;
  padding-bottom: 30px;
}
.form-control>.form{
  width: 300px;
  padding: 10px;
  margin-top: 50px;
  box-shadow: 0 0 20px 0 rgba(0,0,0,0.3);
  padding-bottom: 20px;
  padding-top: 20px;
}
.form-control>.form>.inp{
  height: 30px;
  border: none;
  outline: none;
  box-shadow: 0 0 20px 0 rgba(0,0,0,0.3);
  width: 100%;
  margin-bottom: 20px;
}
.form-control>.form>.btn{
  width: 100%;
  background: blue;
  margin-top: 20px;
  border: none;
  outline: none;
  box-shadow: 0 0 10px 0 rgba(0,0,0,0.3);
  border-radius: 20px;
  height: 30px;
  font-size: 20px;
  color:white;
}
</style>
</head>
<body>
<%@ include file="adminnav.jsp" %>
<div class="form-control">

<form action="../add_book" method="post" class="form" enctype="multipart/form-data">
<h2 style="text-align: center;">Add Book</h2>
<c:if test="${not empty errormsg }">
 <p style="color:red; font-size: 15px; text-align: center;">${errormsg}</p>
 <c:remove var="errormsg" scope="session"/>
 </c:if>
 <c:if test="${not empty succmsg }">
 <p style="color:green; font-size: 15px; text-align: center;">${succmsg}</p>
 <c:remove var="succmsg" scope="session"/>
 </c:if>
<label>book name</label>
<input type="text" class="inp" name="bname" required placeholder="enter">
<label>author name</label>
<input type="text" class="inp" name="aname" required placeholder="enter">
<label>price</label>
<input type="number" class="inp" name="price" required placeholder="enter">
<label>book categories</label>
<select class="inp" required name="bc">
<option>---select----</option>
<option>new book</option>
<option>old book</option>

</select>
<label>book status</label>
<select class="inp" required name="bs">
<option>---select----</option>
<option>active</option>
<option>deactive</option>
</select>
<label>upload photo</label>
<input type="file" name="file"  required>
<button class="btn">add</button>



</form>
 
</div>

</body>
</html>