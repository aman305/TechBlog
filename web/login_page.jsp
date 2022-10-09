 
<%@page import="com.tech.blog.entities.Message"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>login page</title>
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
    <body >


        <!--include navbar-->
        <%@include file="normal_navbar.jsp" %>

        <main class="d-flex align-items-center banner-background Custom-background" style="height: 70vh">

            <div class="container">
                <div class="row">
                    <div class="col-md-4 offset-md-4">
 
                        <!--card from bootstrap-->
                        <div class="card">
                            <div class="card-header text-white text-center" style="background: #039be5 " >


                                <span class="fa fa-user-plus fa-2x"></span>
                                <p>Login here..</p>

                            </div>


                            <!-- scriptlet tag for java logic inside .jsp file-->
                            <%
                                // this message is comming from loginServlet
                                Message m = (Message) session.getAttribute("msg");

                                if (m != null) {

                            %>
                            
                            <!--getCssClass() defines the style of message dynamically sents from login servlet-->
                            <div class="alert <%= m.getCssClass() %> " role="alert">
                               <%=  m.getContent() %>
                            </div>


                            <%            
                                // remvoe msg from session otherwise it will show everytime we refresh
                                session.removeAttribute("msg");
                                }
                            %>


                            <!--
                            <div class="alert alert-danger" role="alert">
                                This is a danger alert—check it out!
                            </div>-->


                            <div class="card-body">
                                <!--form taken from bootstrap 4-->
                                <form action="LoginServlet" method="post" >


                                    <div class="form-group">
                                        <label for="exampleInputEmail1">Email address</label>
                                        <input name="email" required type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                        <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                    </div>
                                    <div class="form-group">
                                        <label for="exampleInputPassword1">Password</label>
                                        <input name="password" required type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                    </div>

                                    <div  class="mt-2"  style="text-align:center">
                                        <button type="submit" class="btn btn-primary ">login</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
        </main>


        <!--javascripts-bootstrap-->
        <script
            src="https://code.jquery.com/jquery-3.6.0.min.js"
            integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>



    </body>
</html>
