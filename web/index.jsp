<%-- 
    Document   : index
    Created on : 4/03/2016, 09:24:57 AM
    Author     : JHON JAIRO
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page import="java.io.*,java.util.*,java.sql.*" %> 
<%@page import="javax.servlet.http.*,javax.servlet.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Accounting!!!</h1>
        <sql:setDataSource 
            var="connection"
            driver="com.mysql.jdbc.Driver"
            url="jdbc:mysql://localhost/accounting"
            user="root"
            password=""
            />
        <sql:query  var="result" dataSource="${connection}">
        Select number, name from accounts where number <=9
        </sql:query>   
        <form name="clientes" method="post" action="ControllerServlet">
            <select name="account">
            <c:forEach var="values"
                       items="${result.rows}">
                <option value="${values.number}">${values.number}${values.name}</option>                    
                
            </c:forEach>
            
        </select>
            
            <input type="submit" value="Ok"/>
            
        </form>
        
    </body>
</html>
