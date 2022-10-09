<%@page import="com.tech.blog.dao.LikeDao"%>
<%@page import="java.util.List"%>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%

    Thread.sleep(500);
    PostDao d = new PostDao(ConnectionProvider.getConnection());
    
    // fetch catId coming from profile_page.jsp inorder to show posts category-wise
    int cid = Integer.parseInt(request.getParameter("cid"));
    
    List<Post> posts = null;
    
    // if cid == 0, then show all posts. otherwise show posts category-wise.
    if(cid == 0){
        posts = d.getAllPosts();
    }
    else{
        posts = d.getPostByCatId(cid);
    }
    
    if(posts.size() == 0){
        out.println("<h3 class = 'display-3 text-center' >No Post Available :(</h3>");
        return;
    }
    
    for (Post p : posts) {

%>


    
  <div class="mt-2">
    <div class="card">
      <img class="card-img-top" src="blog_pics/<%=p.getpPic()%>">
      <div class="card-body">
        <h5 class="card-title"><%=p.getpTitle()%></h5>
        <p class="card-text"><%=p.getpContent()%></p>        
      </div>
      
      <div>
          <div class = "card-footer text-center Custom-background">
              
              <%
              
              LikeDao ld = new LikeDao(ConnectionProvider.getConnection());
              
              %>
              
              
              <a href="" onclick="doLike(<%=p.getPid()%>, <%= p.getUserId() %>)" class ="btn btn-outline-light btn-sm"><i class ="fa fa-thumbs-o-up"></i><span class="like-counter"> <%= ld.coutLikeOnPost(p.getPid()) %> </span></a>
              
              <a href="show_blog_page.jsp?post_id=<%= p.getPid() %>" class ="btn btn-outline-light btn-sm">Read More..</a>
              <a href="" class ="btn-outline-light btn-sm"><i class ="fa fa-commenting-o"></i> <span>20</span></a>
          </div>
      </div>
      
    </div>
  </div>



<%

    }

%>

<<script src="js/myjs.js"></script>