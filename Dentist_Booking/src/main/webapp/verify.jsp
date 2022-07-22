<%-- 
    Document   : verify
    Created on : Jul 14, 2022, 8:00:09 PM
    Author     : admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
    <%
        String successMessage = (String) request.getAttribute("SUCCESS");
        if(successMessage==null){
            successMessage="";
        }
        String errorMessage = (String) request.getAttribute("ERROR");
        if(errorMessage==null){
            errorMessage="";
        }
    %>
    <%= successMessage %>
    <%= errorMessage %>
    </body>
</html>
