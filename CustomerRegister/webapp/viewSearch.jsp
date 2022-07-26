
<%@ page import="java.util.*" %>
<html>
<head>
    <style>
        table, th, td {
          border: 1px solid black;
          border-collapse: collapse;
        }
        th, td {
          padding: 15px;
        }
        td#action{
            width: 15%;
        }
    </style>
    <style>
    body {font-family: Arial, Helvetica, sans-serif;}
    * {box-sizing: border-box;}

    /* Set a style for all buttons */
    button {
      background-color: #04AA6D;
      color: white;
      padding: 14px 20px;
      margin: 8px 0;
      border: none;
      cursor: pointer;
      width: 100%;
      opacity: 0.9;
    }

    button:hover {
      opacity:1;
    }

    /* Float cancel and delete buttons and add an equal width */
    .cancelbtn, .deletebtn {
      float: left;
      width: 50%;
    }

    /* Add a color to the cancel button */
    .cancelbtn {
      background-color: #ccc;
      color: black;
    }

    /* Add a color to the delete button */
    .deletebtn {
      background-color: #f44336;
    }

    /* Add padding and center-align text to the container */
    .container {
      padding: 16px;
      text-align: center;
    }

    /* The Modal (background) */
    .modal {
      display: none; /* Hidden by default */
      position: fixed; /* Stay in place */
      z-index: 1; /* Sit on top */
      left: 0;
      top: 0;
      width: 100%; /* Full width */
      height: 100%; /* Full height */
      overflow: auto; /* Enable scroll if needed */
      background-color: #474e5d;
      padding-top: 50px;
    }

    /* Modal Content/Box */
    .modal-content {
      background-color: #fefefe;
      margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
      border: 1px solid #888;
      width: 80%; /* Could be more or less, depending on screen size */
    }

    /* Style the horizontal ruler */
    hr {
      border: 1px solid #f1f1f1;
      margin-bottom: 25px;
    }

    /* The Modal Close Button (x) */
    .close {
      position: absolute;
      right: 35px;
      top: 15px;
      font-size: 40px;
      font-weight: bold;
      color: #f1f1f1;
    }

    .close:hover,
    .close:focus {
      color: #f44336;
      cursor: pointer;
    }

    /* Clear floats */
    .clearfix::after {
      content: "";
      clear: both;
      display: table;
    }

    /* Change styles for cancel button and delete button on extra small screens */
    @media screen and (max-width: 300px) {
      .cancelbtn, .deletebtn {
         width: 100%;
      }
    }
    </style>
</head>
<body bgcolor =-webkit-linear-gradient(to right, rgba(132, 250, 176, 0.5), rgba(143, 211, 244, 0.5))>
<a href="home.jsp"><button type="submit" class="btn1">Home</button></a>
<br><br><br><br><br><br>
<table width="1000px" align="center" style="border:1px solid #000000;">
        <%
            String username = (String)session.getAttribute("username");
                        		if (username == null || username.trim().equals(""))
                        		{
                        			response.sendRedirect("login.html");
                        		}
        %>
        <tr>
            <td colspan=10 align="center"
            style="background-color:ffeeff">
            <b>User Record</b></td>
        </tr>
        <tr style="background-color:efefef;">
            <td><b>PartyID</b></td>
            <td><b>First Name</b></td>
            <td><b>Last Name</b></td>
            <td><b>Address</b></td>
            <td><b>City </b></td>
            <td><b>Zip</b></td>
            <td><b>State</b></td>
            <td><b>Country</b></td>
            <td><b>Phone Number</b></td>
            <td><b>Actions</b></td>
        </tr>
        <%
            int count=0;
            String color = "#F9EBB3";

            if(request.getAttribute("userList")!=null)
            {
                ArrayList al = (ArrayList)request.getAttribute("userList");
                Iterator itr = al.iterator();
                while(itr.hasNext())
                {
                    if((count%2)==0){
                    color = "#eeffee";
                }
            else
            {
                color = "#F9EBB3";
            }
            count++;

            ArrayList userList = (ArrayList)itr.next();
        %>

        <tr style="background-color:<%=color%>;">
            <td><%=userList.get(0)%></td>
            <td><%=userList.get(1)%></td>
            <td><%=userList.get(2)%></td>
            <td><%=userList.get(3)%></td>
            <td><%=userList.get(4)%></td>
            <td><%=userList.get(5)%></td>
            <td><%=userList.get(6)%></td>
            <td><%=userList.get(7)%></td>
            <td><%=userList.get(8)%></td>
            <td id="action">
                <a href="edit.jsp?id=<%= userList.get(0)%>">
                    <button type="submit" class="btn1">Edit</button>
                </a>

                    <button onclick="document.getElementById('id01').style.display='block'" class="btn1">Delete</button>
                    <div id="id01" class="modal">

                      <form class="modal-content" action="/action_page.php">
                        <div class="container">
                          <h1>Delete Account</h1>
                          <p>Are you sure you want to delete your account?</p>

                          <div class="clearfix">
                            <button type="button" onclick="document.getElementById('id01').style.display='none'" class="cancelbtn">Cancel</button>
                            <a href="delete?id=<%= userList.get(0)%>">
                                <button type="button" onclick="document.getElementById('id01').style.display='none'" type="submit" class="deletebtn">Delete</button>
                            </a>
                          </div>
                        </div>
                      </form>
                    </div>

                    <script>
                    // Get the modal
                    var modal = document.getElementById('id01');

                    // When the user clicks anywhere outside of the modal, close it
                    window.onclick = function(event) {
                      if (event.target == modal) {
                        modal.style.display = "none";
                      }
                    }
                    </script>


            </td>
        </tr>
        <%
            }
            }
        %>
        <%
            if(count==0){
        %>
        <tr>
            <td colspan=10 align="center"
            style="background-color:eeffee"><b>No Record</b></td>
        </tr>
        <%
            }
        %>

</table>
</body>
</html>