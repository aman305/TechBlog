
<%--<%@page import="com.tech.blog.helper.ConnectionProvider"%>--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tech Blog</title>

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


        <!--1. include navbar from normal_navbar.jsp using directive tag of JSP-->
        <%@include file="normal_navbar.jsp" %>


        <!--Create banner where we can write something-->

        <!--container-fluid takes complete width of the page-->
        <div class="container-fluid m-0 p-0">

            <!--jumbotron--> 
            <div class="jumbotron Custom-background text-white banner-background">
                <div class="container">
                    <h3 class="display-3">Welcome to Tech Blog</h3>
                    <!--paragraph-->
                    <p>Where you can find coders like you. A programming language is any set of rules that converts strings, or graphical program elements in the case of visual programming language, to various kinds of machine code output. Programming languages are one kind of computer language, and are used in computer programming to implement algorithms.

                    </p>
                    
                    <!--button-->
                    <a href="register_page.jsp" class="btn btn-outline-light btn-lg"> <span class="fa fa-rocket fa-spin"></span> Start, its free!</a>
                    <!--button-->
                    <a href="login_page.jsp" class="btn btn-outline-light btn-lg"> <span class="fa fa-sign-in"></span> Log in</a>
                </div>
            </div>


            <br>

        </div>

        <!--cards-->

        <!--take only 70% width-->
        <div class="container">
            
            <!--there are 12 grid in a row-->
            <!--1st row-->
            <div class="row mb-2">
                <!--column 1 of 4 grid-->
                <div class="col-md-4">
                    <div class="card">

                        <div class="card-body">
                            <h5 class="card-title">Java Programming</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-primary">Read more</a>
                        </div>
                    </div>
                </div>
                <!--column 2 of 4 grid-->
                <div class="col-md-4">
                    <div class="card">

                        <div class="card-body">
                            <h5 class="card-title">C++ Programming</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-primary">Read more</a>
                        </div>
                    </div>
                </div>
                <!--column 3 of 4 grid-->
                <div class="col-md-4">
                    <div class="card">

                        <div class="card-body">
                            <h5 class="card-title">Python Programming</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-primary">Read more</a>
                        </div>
                    </div>
                </div>
            </div>
            
            <!--2nd row-->
            <div class="row">
                <div class="col-md-4">
                    <div class="card">

                        <div class="card-body">
                            <h5 class="card-title">React.js</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-primary">Read more</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">

                        <div class="card-body">
                            <h5 class="card-title">Competitive Programming</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-primary">Read more</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card">

                        <div class="card-body">
                            <h5 class="card-title">MySQL/SQL</h5>
                            <p class="card-text">Some quick example text to build on the card title and make up the bulk of the card's content.</p>
                            <a href="#" class="btn btn-primary">Read more</a>
                        </div>
                    </div>
                </div>

            </div>

        </div>





        <!--javascripts-bootstrap-->
        <script
            src="https://code.jquery.com/jquery-3.6.0.min.js"
            integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

        <!--check jquery is working or not-->
        <!--        <script>
                    $(document).ready(function () {
                        alert("document loaded...!!")
                    })
                </script>-->

        <script src="js/myjs.js" type="text/javascript"></script>


    </body>
</html>
