<%@page import="db.JdbcConnector"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Edit Form</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<a href="home.jsp"><button type="submit" class="btn1">Home</button></a>
    <%
        String id = request.getParameter("id");
    %>
    <div class="container">
        <h2>Edit Information</h2>
        <form class="form-horizontal" action="EditChecker?id=<%=id%>" method="post" >
        <%
            Statement st = JdbcConnector.getStatement();
            String query = "SELECT firstName,lastName,address,city,zip,state,country,phoneNo FROM party WHERE partyId = "+id+"";
            ResultSet rs = st.executeQuery(query);
            rs.next();
        %>
            <div class="form-group">
                <label class="control-label col-sm-2">First Name :</label>
                <div class="col-sm-10">
                    <input type="text" name = "firstName" class="form-control" placeholder="<%=rs.getString(1)%>">
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2">Last Name :</label>
                <div class="col-sm-10">
                      <input type="text" name = "lastName" class="form-control" placeholder="<%=rs.getString(2)%>">
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2">Address :</label>
                <div class="col-sm-10">
                      <input type="text" name = "address" class="form-control" placeholder="<%=rs.getString(3)%>">
                </div>
            </div>
            <div class="form-group">
                <label class="control-label col-sm-2">City :</label>
                <div class="col-sm-10">
                    <input type="text" name = "city" class="form-control" placeholder="<%=rs.getString(4)%>">
                </div>
            </div>
            <div class="form-group">
                            <label class="control-label col-sm-2">Zipcode :</label>
                            <div class="col-sm-10">
                                <input type="text" name = "zipcode" class="form-control" placeholder="<%=rs.getString(5)%>">
                            </div>
                        </div>
            <div class="form-group">
                            <label class="control-label col-sm-2">State :</label>
                            <div class="col-sm-10">
                                <input type="text" name = "state" class="form-control" placeholder="<%=rs.getString(6)%>">
                            </div>
                        </div>
            <div class="form-group">
                            <label class="control-label col-sm-2">Country :</label>
                            <div class="col-sm-10">
                                <input type="text" name = "country" class="form-control" placeholder="<%=rs.getString(7)%>">
                            </div>
                        </div>
            <div class="form-group">
                            <label class="control-label col-sm-2">Phone no :</label>
                            <div class="col-sm-10">
                                <input type="text" name = "phone" class="form-control" id="email" placeholder="<%=rs.getString(8)%>">
                            </div>
                        </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-10">
                    <button type="submit" class="btn btn-default">Submit</button>
                </div>
            </div>
        </form>
    </div>
</body>
</html>