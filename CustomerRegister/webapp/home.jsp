<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
    <%@page import="dao.*,dto.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <title>Jsp Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
    <style>
            page {
                padding:0;
                margin:0;
                box-sizing: border-box;
            }
            body
            {
                background : linear-gradient(to right, rgba(132, 250, 176, 0.5), rgba(143, 211, 244, 0.5));
            }
            .btn1
            {
                border: none;
                outline: none;
                height: 50px;
                width: 100%;
                background-color: #84fab0;
                color: white;
                border-radius: 4px;
                font-weight: bold;
            }
            .btn1:hover
            {
                background: white;
                border: 1px solid;
                color: black;
            }
    </style>
</head>
<body>
	<%
		String username = (String)session.getAttribute("username");
		if (username == null || username.trim().equals(""))
		{
			response.sendRedirect("login.html");
		}

	%>
	<section class="vh-100 bg-image" >
      <div class="mask d-flex align-items-center h-100 gradient-custom-3">
        <div class="container h-100">
          <div class="row d-flex justify-content-center align-items-center h-100">
            <div class="col-12 col-md-9 col-lg-7 col-xl-6">
              <div class="card" style="border-radius: 15px;">
                <div class="card-body p-5">
                  <h2 class="text-center mb-2"><strong>Hello <%= username %>  !</strong></h2>
                  <h1 class="text-center mb-5"><strong>Logged in </strong></h1><br/>
                  <form action = "viewUser.jsp">
                    <div class="d-flex justify-content-center mb-4">
                      <button type="submit" class="btn1">View All User</button>
                    </div>
                  </form>
                  <form action = "search.html">
                    <div class="d-flex justify-content-center mb-4">
                      <button type="submit" class="btn1">Search</button>
                    </div>
                  </form>
                  <form action = "logout.jsp">
                    <div class="d-flex justify-content-center mb-4">
                      <button type="submit" class="btn1">Sign Out</button>
                    </div>
                  </form>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>
