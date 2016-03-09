<%-- 
    Document   : out
    Created on : 8/03/2016, 12:03:45 PM
    Author     : PC 5
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@page import="java.io.*,java.util.*,java.sql.*" %> 
<%@page import="javax.servlet.http.*,javax.servlet.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:useBean id="servletData" scope="request" class="com.iucesmag.model.ServletData" />
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
           
            Select number, name from accounts where handler = ${param.account}
        </sql:query> 
        
          <select name="account">
            <c:forEach var="values"
                       items="${result.rows}">
                <option value="${values.number}">${values.number}${values.name}</option>                    
                
            </c:forEach>
            
        </select>
            <a href="index.jsp">Return</a>
      
    </body>
</html>
