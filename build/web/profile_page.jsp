

<%@page import="com.tech.blog.entities.Message"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.entities.Category"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.entities.User"%>
<%@page errorPage="error_page.jsp" %>

<%

//    USER OBJECT TO FETCH DATA FROM DB
        User user = (User) session.getAttribute("currentUser");
    if (user == null) {
        response.sendRedirect("login_page.jsp");
    }

%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>




    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome, <%= user.getName()%> </title>

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
            body{
                background: url(img/bg.jpeg);
                background-size: cover;
                background-attachment: fixed;
            }
        </style>


    </head>



    <body>



        <!--    NAV-BAR START...     -->

        <!--Nav-bar from bootstrap-->

        <nav class="navbar navbar-expand-lg navbar-dark Custom-background">
            <a class="navbar-brand" href="index.jsp">  <span class="fa fa-cubes"></span>  Tech Blog</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="#">  Learn Code with Us<span class="sr-only">(current)</span></a>
                    </li>

                    <li class="nav-item dropdown active">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Categories
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">Programming Language</a>
                            <a class="dropdown-item" href="#">Projects</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Data Structure and Algorithms</a>
                        </div>
                    </li>



                    <li class="nav-item active">
                        <a class="nav-link" href="#">  Contact us</a>
                    </li>

                    <li class="nav-item active">
                        <a class="nav-link"  href="#" data-toggle="modal" data-target="#add-post-modal">Post</a>
                    </li>

                </ul>





                <ul class="navbar-nav mr-right">

                    <li class="nav-item active">
                        <a class="nav-link" href="#" data-toggle="modal" data-target="#profile-modal"  > <span class="fa fa-user-circle-o"></span> <%= user.getName()%> </a>
                    </li>

                    <li class="nav-item active">
                        <a class="nav-link" href="LogoutServlet"> <span class="fa fa-sign-in"></span> Logout</a>
                    </li>
                </ul>
            </div>
        </nav>

        <!--   NAV-BAR ENDS   -->





        <!-- scriptlet tag for java logic inside .jsp file-->
        <%
            // this message is comming from loginServlet
            Message m = (Message) session.getAttribute("msg");

            if (m != null) {

        %>

        <!--getCssClass() defines the style of message dynamically sents from login servlet-->
        <div class="alert <%= m.getCssClass()%> " role="alert">
            <%=  m.getContent()%>
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













        <!--MAIN BODY OF THE PROFILE PAGE-->

        <main>
            <!--container left 15% margin from both left and right.-->
            <div class="container mb-2">
                <!--mt stands for margin top-->
                <div class="row mt-4">
                    <!--FIRST COLUMN FOR CATEGORY(4 grid)-->
                    <div class="col-md-4">
                        <!--CATEGORIES-->
                        <div class="list-group">
                            <a href="#" onclick ="getPosts(0, this)" class=" c-link list-group-item list-group-item-action active">
                                All Posts
                            </a>
                            <!--FETCH CATEGORY DYNAMICALLY FROM DATABASE-->
                            <%
                                PostDao pd = new PostDao(ConnectionProvider.getConnection());
                                ArrayList<Category> list1 = pd.getAllCategories();
                                for (Category c : list1) {
                            %>
                            <a href="#" onclick="getPosts(<%= c.getCid()%>, this)" class=" c-link list-group-item list-group-item-action"><%=c.getName()%></a>


                            <%
                                }
                            %>

                        </div>
                    </div>

                    <!--SECOND COLUMN FOR POST (8 grid)-->
                    <div class="col-md-8" >
                        <div class="container text-center" id="loader">
                            <i class="fa fa-refresh fa-4x fa-spin"></i>
                            <h3 class="mt-3">Loading...</h3>
                        </div>
                        <div class="container-fluid" id="post-container">

                        </div>
                    </div>
                </div>
            </div>
        </main>












        <!--MAIN BODY OF THE PROFILE PAGE END-->    

















        <!--PROFILE MODEL START...


        <!-- Modal -->
        <div class="modal fade" id="profile-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <!--HEADER OF MODEL -->
                    <div class="modal-header Custom-background text-white">
                        <h3>Tech Blog</h3>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <!-- BODY OF MODEL -->
                    <div class="modal-body">
                        <div class="container text-center">
                            <img src="pics/default.png" width="150" height="150" style="border-radius:50% " />
                            <h5 class="modal-title mt-3" id="exampleModalLabel"> <%= user.getName()%> </h5>
                            <!--DETAILS FROM DATABASE INTO TABLE...-->


                            <div id ="profile-details">
                                <table class="table">
                                    <tbody>
                                        <tr>
                                            <th scope="row">ID : </th>
                                            <td> <%= user.getId()%> </td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Email : </th>
                                            <td> <%= user.getEmail()%> </td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Gender : </th>
                                            <td> <%= user.getGender().toUpperCase()%> </td>
                                        </tr>
                                        <tr>
                                            <th scope="row">About : </th>
                                            <td> <%= user.getAbout()%> </td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Registered on : </th>
                                            <td> <%= user.getDatetime().toString()%> </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <!--TABLE END-->


                            <!--EDITABLE FORM START...-->
                            <div id ="profile-edit" style="display: none">
                                <h2>Please edit carefully!</h2>

                                <!--form action is "EditServlet" -> By clicking on submit button EditServlet will fire-->
                                <form action="EditServlet" method="post" enctype="multipart/form-data" >
                                    <table class="table">
                                        <!--// row 1-->
                                        <tr>
                                            <td>ID : </td>
                                            <td> <%= user.getId()%> </td>
                                        </tr>

                                        <!--// row 2-->
                                        <tr>
                                            <td>Name : </td>
                                            <td> <input type="text" class="form-control" name="user_name" value=" <%= user.getName()%> " </td>
                                        </tr>

                                        <!--// row 3-->
                                        <tr>
                                            <td>Email : </td>
                                            <td> <input type="email" class="form-control" name="user_email" value=" <%= user.getEmail()%> " </td>
                                        </tr>

                                        <!--// row 4-->
                                        <tr>
                                            <td>Password : </td>
                                            <td> <input type="password" class="form-control" name="user_password" value=" <%= user.getPassword()%> " </td>
                                        </tr>


                                        <!--// row 5-->
                                        <tr>
                                            <td>Gender : </td>
                                            <td> <%= user.getGender().toUpperCase()%>  </td>
                                        </tr>

                                        <!--// row 6-->
                                        <tr>
                                            <td>About : </td>
                                            <td>
                                                <!-- to enter large text.-->
                                                <textarea rows="3" class="form-control"   name="user_about"  ><%=user.getAbout()%></textarea>
                                            </td>  
                                        </tr>

                                        <!--// row 7-->
                                        <tr>
                                            <td>Change Profile Picture : </td>
                                            <td>
                                                <input type="file" name="profile-image" class="form-control" >
                                            </td> 
                                        </tr>
                                    </table>
                                    <button type="submit" class="btn btn-primary">Save</button>    
                                </form>
                            </div>
                            <!--EDITABLE FORM END-->
                        </div>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button id="edit-profile-button" type="button" class="btn btn-primary">Edit</button>
                    </div>
                </div>
            </div>
        </div>

        <!--PROFILE MODAL END-->




































        <!--POST MODAL START-->



        <!-- Modal -->

        <!-- Modal -->
        <div class="modal fade" id="add-post-modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Provide Post Details</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <!--this model will send data of form to AddPostServlet-->
                        <form id="add-post-form" action="AddPostServlet" method="POST">
                            <!--kissi v feild ko banana h to form-group class ke andat rakna h so that usko entrire width mil jae-->

                            <!--category feild in form of dropdown. Categories coming from database-->
                            <div class="form-group">         
                                <!--give name to select box so that we can fetch data-->
                                <select class="form-control" name="cid">
                                    <option selected disabled>---SELECT CATEGORY---</option>


                                    <%
                                        /*
                                            fetch all categories from database using postDao.java that we created.
                                            postDao.java interact with database and fetch all the categories inside
                                            an arraylist.
                                         */
                                        PostDao postd = new PostDao(ConnectionProvider.getConnection());
                                        ArrayList<Category> categories = postd.getAllCategories();

                                        for (Category c : categories) {

                                    %>

                                    <!--value - store id of each category-->
                                    <option value="<%=c.getCid()%>"><%= c.getName()%></option>

                                    <%

                                        }
                                    %>

                                </select>

                            </div>

                            <!--title for post-->
                            <div class="form-group">
                                <input name="pTitle" type="text" placeholder="Enter post Title" class="form-control"/>
                            </div>

                            <!--content for post-->
                            <div class="form-group">
                                <textarea name="pContent" class="form-control" placeholder="Write your content" style="height: 200px"></textarea>
                            </div>

                            <!--code for post-->
                            <div class="form-group">
                                <textarea name="pCode" class="form-control" placeholder="Write your program(if any)" style="height: 200px"></textarea>
                            </div>

                            <!--images for post-->
                            <div class="form-group">
                                <label>Select Your image</label>
                                <br>
                                <input type="file" name="pPic" />
                            </div>

                            <!--button to fire AddPostServlet-->
                            <div class="text-center">
                                <button type="submit" class="btn btn-outline-primary" >Post</button>
                            </div>

                        </form>


                    </div>

                </div>
            </div>
        </div>



        <!--POST MODAL END-->













































        <!--JAVASCRIPTS...-->

        <script
            src="https://code.jquery.com/jquery-3.6.0.min.js"
            integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4="
        crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script <script src="js/myjs.js" type="text/javascript"></script>






































        <script>
            $(document).ready(function () {

                // by defautl not editable.
                var editStatus = false;

                // FUNCTION FOR EDIT BUTTON ON MODEL
                $('#edit-profile-button').click(function () {

                    if (editStatus === false) {
                        $('#profile-details').hide();
                        $('#profile-edit').show();
                        editStatus = true;
                        $(this).text("Back");
                    } else {
                        $('#profile-details').show();
                        $('#profile-edit').hide();
                        editStatus = false;
                        $(this).text("Edit");
                    }

                });

            });



        </script>





























        <!--Now add post js -- java-script for post purpose-->
        <script>

            $(document).ready(function (e) {

                // fetch data from form // send request to servlet(asynchronous request) using ajax 
                /*
                 * apply listener on form using its id("add-post-form")
                 * as soon as we click on "submit" the function will get executed taking parameter "event"
                 * to stop normal behavoir or synchronous behavoir of from write :  "event.preventDefault()"
                 * 
                 * create a variable to store form
                 */
                $("#add-post-form").on("submit", function (event) {
                    // called when form is submitted
                    event.preventDefault();
//                    console.log("You have sumbitted");
                    let form = new FormData(this);
                    // NOW REQUESTING TO SERVERLET
                    // {} -> used to create object
                    // AJAX IS USED TO SEND FORM DATA TO SERVLET
                    $.ajax({
                        url: "AddPostServlet", // send form to this servlet
                        type: 'POST', // type of protocol is post
                        data: form, // data send as form
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);
                            if (data.trim() === 'Done') {
                                swal("Good job!", "Saved Successfully!", "success");
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            swal("Sorry!", "Something went wrong!", "error");
                        },
                        // if content type is false then we don't need to specify contentType, These two things need to be false as our form contains images also.
                        processData: false,
                        contentType: false
                    });
                });

            });

        </script>
























        <!--LOADING POST USING AJAX-->
        <script>
            
            // provide catId to getPosts method such that it will give only posts with that category id
            // if catId = 0 then we call for all category, temp is the refeernce of link of different category.
            function getPosts(catId, temp) {
                $("#loader").show();
                $("post-container").hide();
                 // request ajax to show post
                
                // remove the 
                $(".c-link").removeClass('active');
                $.ajax({
                    url: "load_posts.jsp",
                    data : {cid : catId}, // this catId went to server through cid
                    success: function (data, textStatus, jqXHR) {
//                        console.log(data);
                        $("#loader").hide();
                        $("#post-container").show();
                        $("#post-container").html(data);
                        $(temp).addClass('active');
                    }
                });
            }
            
            $(document).ready(function (e) {
                // when document is ready getPosts will call and fetch load post on profile page.
                let allPostRef = $(".c-link")[0];
               getPosts(0, allPostRef);
            });
        </script>

    </body>
</html>
