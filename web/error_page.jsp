<%-- 
    Document   : error_page
    Created on : 27 Jan 2022, 17:37:06
    Author     : amanraj
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page isErrorPage="true" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>sorry! something went wrong...</title>
          <!--css-bootstrap-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

        <!--css-link of mystyle.css--> 
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>

        <!--fontawesome 4 w3-School - for icons-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        
        <!--background from clip-path-->
        <style>
            .banner-background{
               clip-path: polygon(0 0, 100% 0, 100% 100%, 100% 100%, 84% 93%, 68% 100%, 51% 93%, 37% 100%, 19% 94%, 0 100%);
            }
        </style>

        
    </head>
    <body>
        
        <div class="container text-center mt-5 ">
        <img src="img/error.png" class="img-fluid" />
        
        <h3 class="display-3" >Sorry! something went wrong</h3><!-- comment -->
        
        <%--<%= exception %>--%>
        
        <a href="index.jsp" class="btn btn-primary btn-lg mt ">Home</a>
        
        </div>        
    </body>
</html>
