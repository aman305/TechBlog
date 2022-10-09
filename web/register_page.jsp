<%-- 
    Document   : register_page
    Created on : 25 Jan 2022, 18:01:53
    Author     : amanraj
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Register here</title>

        <!--css-bootstrap-->
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

        <!--css-link of mystyle.css--> 
        <link href="css/mystyle.css" rel="stylesheet" type="text/css"/>

        <!--fontawesome 4 w3-School - for icons-->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

        <style>
            .banner-background{
                clip-path: polygon(0 0, 100% 0, 100% 100%, 100% 100%, 84% 93%, 68% 100%, 51% 93%, 37% 100%, 19% 94%, 0 100%);
            }
        </style>  
    </head>
    <body>


        <!--include navbar-->

        <%@include file="normal_navbar.jsp" %>

        <main class="Custom-background banner-background" style="padding-bottom: 80px; padding-top: 30px">

            <div class="container">
                <div class="col-md-6 offset-md-3">

                    <!--card-->
                    <!--3 sections of a card : header, body, and footer-->
                    <div class="card">
                        <div class="card-header text-center Custom-background text-white">
                            <span class="fa fa-2x fa-user-plus"></span>
                            <br><!-- comment -->

                            Register here
                        </div>
                        <div class="card-body">
                            <form id="reg_form" action="RegisterServlet" method="POST">

                                <!--user-name-->
                                <div class="form-group">
                                    <label for="user_name">User Name</label>
                                    <input name="user_name" type="text" class="form-control" id="user_name"  placeholder="Enter user name">

                                </div>

                                <!--email-address-->
                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>

                                <!--password-->
                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input name="user_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>


                                <!--select gender-->
                                <div class="form-group">
                                    <label for="gender">Select Gender</label>
                                    <br>
                                    <input type="radio" id="gender" name="gender" value="male"> Male
                                    <input type="radio" id="gender" name="gender" value="female" > Female
                                </div>


                                <!--about-->
                                <div class="form-group">

                                    <textarea  class="form-control" name="about" id=""  rows="5" placeholder="Tell us something about yourself"></textarea>

                                </div>


                                <!--Agree terms & conditions-->
                                <div class="form-check">
                                    <input name="check" type="checkbox" class="form-check-input" id="exampleCheck1">
                                    <label class="form-check-label" for="exampleCheck1">Agree terms & conditions</label>
                                </div>

                                <br>

                                <!--loader-->
                                <div class="container text-center" id="loader" style="display: none; ">
                                    <br>
                                    <span class=" fa-spin fa-3x fa fa-refresh"></span>
                                    <h4>Please wait...</h4>

                                </div>

                                <!--submit button-->
                                <div class="text-center">

                                    <button id="submit-btn" type="submit" class="btn btn-primary">Submit</button>
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

        <!--sweet alert-->
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script>

            $(document).ready(function () {
                console.log("loaded...");
                // jQuery
                // catch the registration form using its id which is "reg_from" and use jQuerry.
                // As soon as registration form get submmited below function will call.
                $("#reg_form").on("submit", function (event) {
                    event.preventDefault(); // this will prevent the register-page to go onto other page on submitting.


                    // working of submit button
                    // As soon as submit button is clicked, button will disapear and loader will show
                    $("#submit-btn").hide();
                    $("#loader").show();
                    
                    // load all the register form data inside form variable.
                    var form = new FormData(reg_form); // this -> reg_form
                    
                    //now we will send form data to the register-servlet from register_page using AJAX
                    
                    $.ajax({
                        url: "RegisterServlet", // this URL specify where do we want to submit this form data
                        type: 'POST',
                        data: form,
                        // if its success
                        success: function (data, textStatus, jqXHR) {
                            // If submission is peformed successfully then hide loader and show submit button
                            $("#loader").hide();
                            $("#submit-btn").show();
                            console.log(data);
                            if (data.trim() === 'Successfully registered!!') {

                                // successful - sweet alert
                                swal({
                                    title: "Registered Successfully!",
                                    text: "Redirecting to login page",
                                    icon: "success",
                                    button: "Done!",
                                }).then((value) => {
                                    window.location = "login_page.jsp";
                                });
                            
                            }
                             
                            else {
                                swal(data);
                            }
                        },
                        
                        // if its error
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log(jqXHR);
                            $("#submit-btn").show();
                            $("#loader").loader();
                            // error - sweet alert
                            swal({
                                title: "Sorry, something went wrong!",
                                icon: "error",
                                button: "OK",
                            });
                        },
                        processData: false, // very important to do this.
                        contentType: false
                    });
                });
            });

        </script>

    </body>
</html>
